Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1624D0683
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Mar 2022 19:28:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KC6QM5hRHz3bd9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 05:27:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eVNxLbMP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=eVNxLbMP; dkim-atps=neutral
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KC6Pk0Vj9z2yws
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Mar 2022 05:27:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646677643; x=1678213643;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5qzlM+F2KLwaOV5DOusddqPgYoFFoImJzYDRDku6N50=;
 b=eVNxLbMP+nDWFXntNFFIC9FZaVPmxol3JY1zhz3G6x7hTduidyG4fj7/
 A+Py1kj9vfsBbdh1jBflc6L0vaxd73ftMaKh+NSpuoUgolDN6Ti79wpmc
 bT1zqJ57hSKECowEeixXI7gfAc4KJo0M3eKSwNSooGeKXWBdxsPA1Cl/o
 sOlmkNtyQifg/W+IjXQDoGwnAIjtehyhFNUfr4UHRyez/M3zXfst8WPek
 nSEC1aIqSz/WgNztq3K9lGfy5v3vjhJ2a81C6FCnxyJVJdGmi0mQt8ghR
 rbe8Cf/kJJ52SKZLhJ4mNey2NIrRyt6VdIIAGbigp+UrAuJwCrb8Sd5gs w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="317695818"
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="317695818"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 10:26:13 -0800
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="641428749"
Received: from sonalsha-mobl.amr.corp.intel.com (HELO localhost)
 ([10.212.67.25])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 10:26:13 -0800
Date: Mon, 7 Mar 2022 10:26:12 -0800
From: Ira Weiny <ira.weiny@intel.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH] pkeys: Make pkey unsigned in arch_set_user_pkey_access()
Message-ID: <YiZORNusRg4UTv45@iweiny-desk3>
References: <20220304210543.3490880-1-ira.weiny@intel.com>
 <878rtmtfgs.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878rtmtfgs.fsf@linux.ibm.com>
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 07, 2022 at 12:30:03PM +0530, Aneesh Kumar K.V wrote:
> ira.weiny@intel.com writes:
> 
> > From: Ira Weiny <ira.weiny@intel.com>
> >
> > The WARN_ON check in arch_set_user_pkey_access() in the x86 architecture
> > fails to check for an invalid negative value.
> >
> > A simple check for less than 0 would fix this issue however, in the call
> > stack below arch_set_user_pkey_access() the pkey should never be
> > negative on any architecture.  It is always best to use correct types
> > when possible.  x86 only supports 16 keys while ppc supports 32, u8 is
> > therefore large enough for all current architectures and likely those in
> > the future.
> 
> Should we do that as a separate patch? ie, now convert the variable to
> unsigned int and later switch all the variables to u8?

Maybe.

> because what we
> now have is confusing.
> 
> static inline unsigned long arch_calc_vm_prot_bits(unsigned long prot,
> 		unsigned long pkey)
> static inline u64 pkey_to_vmflag_bits(u16 pkey)
> 

This looks like a good cleanup as well.  Why not convert
arch_calc_vm_prot_bits() and pkey_to_vmflag_bits() to u8?  (In another patch.)

This is all a result of this PKS conversation:

https://lore.kernel.org/lkml/Yg8C6UkgfBmQlPSq@iweiny-desk3/

That started me down the path of trying to figure out why 'int' was used for
PKRU and I realized that negative values had meaning there which did not apply
to me with PKS.  So at some point a conversion needs to be made between a
'conceptual pkey' (int) and a real pkey (unsigned) IHMO.

It's no bit deal to split this patch into one which converts to unsigned and
then another to u8 (or u16 if there is some arch which may need it that big).

However, digging more:

Is there a reason u16 was used in pkey_to_vmflag_bits()?  How about in
__pkru_allows_read() in the x86 code?  If possible I think u8 should be
standardized but I'm ok with u16 if that is preferred.

Also, am I missing something in init_amr() and init_iamr()?  I think I could
have gone farther and changed init_amr() and init_iamr() right?

From what I can see the argument to use unsigned long vs u8 (or u16) is some
expectation that pkeys will grow beyond 256 in number.  From what I can see I
don't think that is going to happen.

So do we need to do this in two steps?

Ira

> 
> >
> > Change the type of the pkey passed to arch_set_user_pkey_access() to u8.
> >
> > To: Dave Hansen <dave.hansen@linux.intel.com>
> > To: Michael Ellerman <mpe@ellerman.id.au>
> > Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> > Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> > ---
> >  arch/powerpc/include/asm/pkeys.h | 4 ++--
> >  arch/powerpc/mm/book3s64/pkeys.c | 2 +-
> >  arch/x86/include/asm/pkeys.h     | 4 ++--
> >  arch/x86/kernel/fpu/xstate.c     | 2 +-
> >  include/linux/pkeys.h            | 2 +-
> >  5 files changed, 7 insertions(+), 7 deletions(-)
> >
> > diff --git a/arch/powerpc/include/asm/pkeys.h b/arch/powerpc/include/asm/pkeys.h
> > index 59a2c7dbc78f..e70615a1da9b 100644
> > --- a/arch/powerpc/include/asm/pkeys.h
> > +++ b/arch/powerpc/include/asm/pkeys.h
> > @@ -143,9 +143,9 @@ static inline int arch_override_mprotect_pkey(struct vm_area_struct *vma,
> >  	return __arch_override_mprotect_pkey(vma, prot, pkey);
> >  }
> >  
> > -extern int __arch_set_user_pkey_access(struct task_struct *tsk, int pkey,
> > +extern int __arch_set_user_pkey_access(struct task_struct *tsk, u8 pkey,
> >  				       unsigned long init_val);
> 
> 
> > -static inline int arch_set_user_pkey_access(struct task_struct *tsk, int pkey,
> > +static inline int arch_set_user_pkey_access(struct task_struct *tsk, u8 pkey,
> >  					    unsigned long init_val)
> >  {
> >  	if (!mmu_has_feature(MMU_FTR_PKEY))
> > diff --git a/arch/powerpc/mm/book3s64/pkeys.c b/arch/powerpc/mm/book3s64/pkeys.c
> > index 753e62ba67af..c048467669df 100644
> > --- a/arch/powerpc/mm/book3s64/pkeys.c
> > +++ b/arch/powerpc/mm/book3s64/pkeys.c
> > @@ -333,7 +333,7 @@ static inline void init_iamr(int pkey, u8 init_bits)
> >   * Set the access rights in AMR IAMR and UAMOR registers for @pkey to that
> >   * specified in @init_val.
> >   */
> > -int __arch_set_user_pkey_access(struct task_struct *tsk, int pkey,
> > +int __arch_set_user_pkey_access(struct task_struct *tsk, u8 pkey,
> >  				unsigned long init_val)
> >  {
> >  	u64 new_amr_bits = 0x0ul;
> > diff --git a/arch/x86/include/asm/pkeys.h b/arch/x86/include/asm/pkeys.h
> > index 5292e6dfe2a7..48efb81f6cc6 100644
> > --- a/arch/x86/include/asm/pkeys.h
> > +++ b/arch/x86/include/asm/pkeys.h
> > @@ -9,7 +9,7 @@
> >   */
> >  #define arch_max_pkey() (cpu_feature_enabled(X86_FEATURE_OSPKE) ? 16 : 1)
> >  
> > -extern int arch_set_user_pkey_access(struct task_struct *tsk, int pkey,
> > +extern int arch_set_user_pkey_access(struct task_struct *tsk, u8 pkey,
> >  		unsigned long init_val);
> >  
> >  static inline bool arch_pkeys_enabled(void)
> > @@ -115,7 +115,7 @@ int mm_pkey_free(struct mm_struct *mm, int pkey)
> >  	return 0;
> >  }
> >  
> > -extern int arch_set_user_pkey_access(struct task_struct *tsk, int pkey,
> > +extern int arch_set_user_pkey_access(struct task_struct *tsk, u8 pkey,
> >  		unsigned long init_val);
> >  
> >  static inline int vma_pkey(struct vm_area_struct *vma)
> > diff --git a/arch/x86/kernel/fpu/xstate.c b/arch/x86/kernel/fpu/xstate.c
> > index 7c7824ae7862..db511bec57e5 100644
> > --- a/arch/x86/kernel/fpu/xstate.c
> > +++ b/arch/x86/kernel/fpu/xstate.c
> > @@ -1068,7 +1068,7 @@ void *get_xsave_addr(struct xregs_state *xsave, int xfeature_nr)
> >   * This will go out and modify PKRU register to set the access
> >   * rights for @pkey to @init_val.
> >   */
> > -int arch_set_user_pkey_access(struct task_struct *tsk, int pkey,
> > +int arch_set_user_pkey_access(struct task_struct *tsk, u8 pkey,
> >  			      unsigned long init_val)
> >  {
> >  	u32 old_pkru, new_pkru_bits = 0;
> > diff --git a/include/linux/pkeys.h b/include/linux/pkeys.h
> > index 86be8bf27b41..aa40ed2fb0fc 100644
> > --- a/include/linux/pkeys.h
> > +++ b/include/linux/pkeys.h
> > @@ -35,7 +35,7 @@ static inline int mm_pkey_free(struct mm_struct *mm, int pkey)
> >  	return -EINVAL;
> >  }
> >  
> > -static inline int arch_set_user_pkey_access(struct task_struct *tsk, int pkey,
> > +static inline int arch_set_user_pkey_access(struct task_struct *tsk, u8 pkey,
> >  			unsigned long init_val)
> >  {
> >  	return 0;
> > -- 
> > 2.35.1
