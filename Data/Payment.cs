//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Data
{
    using System;
    using System.Collections.Generic;
    
    public partial class Payment
    {
        public int Id { get; set; }
        public int UserSetId { get; set; }
        public int AdsId { get; set; }
        public string Pay { get; set; }
        public string Method { get; set; }
    
        public virtual UserSet UserSet { get; set; }
        public virtual Ads Ads { get; set; }
    }
}
