Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 020CD93C6CC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jul 2024 17:49:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WVFgj6txlz3dRm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jul 2024 01:49:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=dave.martin@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WVFgM0bCRz3cXj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 01:49:18 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 78FD21476;
	Thu, 25 Jul 2024 08:49:13 -0700 (PDT)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2FA393F766;
	Thu, 25 Jul 2024 08:48:44 -0700 (PDT)
Date: Thu, 25 Jul 2024 16:48:41 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH v4 19/29] arm64: enable PKEY support for CPUs with S1POE
Message-ID: <ZqJz2S4MDjDmKzJE@e133380.arm.com>
References: <20240503130147.1154804-1-joey.gouly@arm.com>
 <20240503130147.1154804-20-joey.gouly@arm.com>
 <fe3ccf1e-4c57-4795-add3-1eb47f3bdcaa@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fe3ccf1e-4c57-4795-add3-1eb47f3bdcaa@arm.com>
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
Cc: szabolcs.nagy@arm.com, catalin.marinas@arm.com, dave.hansen@linux.intel.com, Joey Gouly <joey.gouly@arm.com>, linux-mm@kvack.org, hpa@zytor.com, shuah@kernel.org, maz@kernel.org, x86@kernel.org, christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org, mingo@redhat.com, aneesh.kumar@linux.ibm.com, naveen.n.rao@linux.ibm.com, will@kernel.org, npiggin@gmail.com, broonie@kernel.org, bp@alien8.de, kvmarm@lists.linux.dev, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, oliver.upton@linux.dev, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 16, 2024 at 04:17:12PM +0530, Anshuman Khandual wrote:
> 
> 
> On 5/3/24 18:31, Joey Gouly wrote:
> > Now that PKEYs support has been implemented, enable it for CPUs that
> > support S1POE.
> > 
> > Signed-off-by: Joey Gouly <joey.gouly@arm.com>
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Will Deacon <will@kernel.org>
> > Acked-by: Catalin Marinas <catalin.marinas@arm.com>
> 
> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
> 
> > ---
> >  arch/arm64/include/asm/pkeys.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/include/asm/pkeys.h b/arch/arm64/include/asm/pkeys.h
> > index a284508a4d02..3ea928ec94c0 100644
> > --- a/arch/arm64/include/asm/pkeys.h
> > +++ b/arch/arm64/include/asm/pkeys.h
> > @@ -17,7 +17,7 @@ int arch_set_user_pkey_access(struct task_struct *tsk, int pkey,
> >  
> >  static inline bool arch_pkeys_enabled(void)
> >  {
> > -	return false;
> > +	return system_supports_poe();
> >  }
> >  
> >  static inline int vma_pkey(struct vm_area_struct *vma)
> 
> Small nit. Would it better to be consistently using system_supports_poe()
> helper rather than arch_pkeys_enabled() inside arch/arm64/ platform code
> like - during POE fault handling i.e inside fault_from_pkey().
> 

(FWIW, arch_pkeys_enabled() looks like the hook for the arch to tell
the pkeys generic code whether the arch support is there, so I guess
the proposed change looks sensible to me.

For the arch backend code that is agnostic to whether pkeys is actually
in use, system_supports_poe() seems to be the more appropriate check.)

Cheers
---Dave
