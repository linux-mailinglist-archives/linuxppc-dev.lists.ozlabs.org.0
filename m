Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDF4927646
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2024 14:48:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WFGf04p7sz3fVT
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2024 22:48:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WFGdc5WYZz3dX0
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2024 22:47:45 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3AE77367;
	Thu,  4 Jul 2024 05:47:38 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A177D3F762;
	Thu,  4 Jul 2024 05:47:09 -0700 (PDT)
Date: Thu, 4 Jul 2024 13:47:04 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v4 13/29] arm64: convert protection key into vm_flags and
 pgprot values
Message-ID: <20240704124704.GA3548388@e124191.cambridge.arm.com>
References: <20240503130147.1154804-1-joey.gouly@arm.com>
 <20240503130147.1154804-14-joey.gouly@arm.com>
 <4f7d8691-fe19-4e8a-95e5-9f7680c82021@arm.com>
 <ZnMLKb_gWsbLgMf3@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZnMLKb_gWsbLgMf3@arm.com>
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
Cc: szabolcs.nagy@arm.com, dave.hansen@linux.intel.com, linux-mm@kvack.org, hpa@zytor.com, shuah@kernel.org, Amit Daniel Kachhap <amitdaniel.kachhap@arm.com>, maz@kernel.org, x86@kernel.org, christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org, mingo@redhat.com, naveen.n.rao@linux.ibm.com, will@kernel.org, npiggin@gmail.com, broonie@kernel.org, bp@alien8.de, kvmarm@lists.linux.dev, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, oliver.upton@linux.dev, aneesh.kumar@linux.ibm.com, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On Wed, Jun 19, 2024 at 05:45:29PM +0100, Catalin Marinas wrote:
> On Tue, May 28, 2024 at 12:24:57PM +0530, Amit Daniel Kachhap wrote:
> > On 5/3/24 18:31, Joey Gouly wrote:
> > > diff --git a/arch/arm64/include/asm/mman.h b/arch/arm64/include/asm/mman.h
> > > index 5966ee4a6154..ecb2d18dc4d7 100644
> > > --- a/arch/arm64/include/asm/mman.h
> > > +++ b/arch/arm64/include/asm/mman.h
> > > @@ -7,7 +7,7 @@
> > >   #include <uapi/asm/mman.h>
> > >   static inline unsigned long arch_calc_vm_prot_bits(unsigned long prot,
> > > -	unsigned long pkey __always_unused)
> > > +	unsigned long pkey)
> > >   {
> > >   	unsigned long ret = 0;
> > > @@ -17,6 +17,12 @@ static inline unsigned long arch_calc_vm_prot_bits(unsigned long prot,
> > >   	if (system_supports_mte() && (prot & PROT_MTE))
> > >   		ret |= VM_MTE;
> > > +#if defined(CONFIG_ARCH_HAS_PKEYS)
> > 
> > Should there be system_supports_poe() check like above?
> 
> I think it should, otherwise we end up with these bits in the pte even
> when POE is not supported.

I think it can't get here due to the flow of the code, but I will add it to be
defensive (since it's just an alternative that gets patched).
I still need the defined(CONFIG_ARCH_HAS_PKEYS) check, since the VM_PKEY_BIT*
are only defined then.

> 
> > > +	ret |= pkey & 0x1 ? VM_PKEY_BIT0 : 0;
> > > +	ret |= pkey & 0x2 ? VM_PKEY_BIT1 : 0;
> > > +	ret |= pkey & 0x4 ? VM_PKEY_BIT2 : 0;
> > > +#endif
> > > +
> > >   	return ret;
> > >   }
> > >   #define arch_calc_vm_prot_bits(prot, pkey) arch_calc_vm_prot_bits(prot, pkey)

Thanks,
Joey
