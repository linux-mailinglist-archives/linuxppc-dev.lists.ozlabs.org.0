Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8119322F4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2024 11:36:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WNYpm0dbSz3cZF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2024 19:36:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WNYpM0j4Kz3cSy
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2024 19:35:37 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2B7EA1063;
	Tue, 16 Jul 2024 02:35:31 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DB77D3F762;
	Tue, 16 Jul 2024 02:35:02 -0700 (PDT)
Date: Tue, 16 Jul 2024 10:34:57 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH v4 13/29] arm64: convert protection key into vm_flags and
 pgprot values
Message-ID: <20240716093457.GA1542300@e124191.cambridge.arm.com>
References: <20240503130147.1154804-1-joey.gouly@arm.com>
 <20240503130147.1154804-14-joey.gouly@arm.com>
 <0f87e51e-f790-4302-896f-9b9a74ed7495@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0f87e51e-f790-4302-896f-9b9a74ed7495@arm.com>
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
Cc: szabolcs.nagy@arm.com, catalin.marinas@arm.com, dave.hansen@linux.intel.com, linux-mm@kvack.org, hpa@zytor.com, shuah@kernel.org, maz@kernel.org, x86@kernel.org, christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org, mingo@redhat.com, naveen.n.rao@linux.ibm.com, will@kernel.org, npiggin@gmail.com, broonie@kernel.org, bp@alien8.de, kvmarm@lists.linux.dev, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, oliver.upton@linux.dev, aneesh.kumar@linux.ibm.com, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 16, 2024 at 02:35:48PM +0530, Anshuman Khandual wrote:
> 
> 
> On 5/3/24 18:31, Joey Gouly wrote:
> > Modify arch_calc_vm_prot_bits() and vm_get_page_prot() such that the pkey
> > value is set in the vm_flags and then into the pgprot value.
> > 
> > Signed-off-by: Joey Gouly <joey.gouly@arm.com>
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Will Deacon <will@kernel.org>
> > ---
> >  arch/arm64/include/asm/mman.h | 8 +++++++-
> >  arch/arm64/mm/mmap.c          | 9 +++++++++
> >  2 files changed, 16 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/include/asm/mman.h b/arch/arm64/include/asm/mman.h
> > index 5966ee4a6154..ecb2d18dc4d7 100644
> > --- a/arch/arm64/include/asm/mman.h
> > +++ b/arch/arm64/include/asm/mman.h
> > @@ -7,7 +7,7 @@
> >  #include <uapi/asm/mman.h>
> >  
> >  static inline unsigned long arch_calc_vm_prot_bits(unsigned long prot,
> > -	unsigned long pkey __always_unused)
> > +	unsigned long pkey)
> >  {
> >  	unsigned long ret = 0;
> >  
> > @@ -17,6 +17,12 @@ static inline unsigned long arch_calc_vm_prot_bits(unsigned long prot,
> >  	if (system_supports_mte() && (prot & PROT_MTE))
> >  		ret |= VM_MTE;
> >  
> > +#if defined(CONFIG_ARCH_HAS_PKEYS)
> > +	ret |= pkey & 0x1 ? VM_PKEY_BIT0 : 0;
> > +	ret |= pkey & 0x2 ? VM_PKEY_BIT1 : 0;
> > +	ret |= pkey & 0x4 ? VM_PKEY_BIT2 : 0;
> 
> 0x1, 0x2, 0x4 here are standard bit positions for their corresponding
> VM_KEY_XXX based protection values ? Although this is similar to what
> x86 is doing currently, hence just trying to understand if these bit
> positions here are related to the user visible ABI, which should be
> standardized ?

The bit positions of VM_PKEY_BIT* aren't user visible. This is converting the
value of the `pkey` that was passed to the mprotect, into the internal flags.

I might replace those hex values with BIT(0), BIT(1), BIT(2), might be clearer.

> 
> Agree with previous comments about the need for system_supports_poe()
> based additional check for the above code block.
> 
> > +#endif
> > +
> >  	return ret;
> >  }
> >  #define arch_calc_vm_prot_bits(prot, pkey) arch_calc_vm_prot_bits(prot, pkey)
> > diff --git a/arch/arm64/mm/mmap.c b/arch/arm64/mm/mmap.c
> > index 642bdf908b22..86eda6bc7893 100644
> > --- a/arch/arm64/mm/mmap.c
> > +++ b/arch/arm64/mm/mmap.c
> > @@ -102,6 +102,15 @@ pgprot_t vm_get_page_prot(unsigned long vm_flags)
> >  	if (vm_flags & VM_MTE)
> >  		prot |= PTE_ATTRINDX(MT_NORMAL_TAGGED);
> >  
> > +#ifdef CONFIG_ARCH_HAS_PKEYS
> > +	if (vm_flags & VM_PKEY_BIT0)
> > +		prot |= PTE_PO_IDX_0;
> > +	if (vm_flags & VM_PKEY_BIT1)
> > +		prot |= PTE_PO_IDX_1;
> > +	if (vm_flags & VM_PKEY_BIT2)
> > +		prot |= PTE_PO_IDX_2;
> > +#endif
> > +
> >  	return __pgprot(prot);
> >  }
> >  EXPORT_SYMBOL(vm_get_page_prot);
> 

Thanks,
Joey
