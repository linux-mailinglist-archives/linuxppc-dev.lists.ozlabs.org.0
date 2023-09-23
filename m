Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E487AC3B0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Sep 2023 18:29:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kdX7uAUn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RtF2s3l8Rz3cMH
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Sep 2023 02:29:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kdX7uAUn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RtF225V9nz2yGW
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Sep 2023 02:28:42 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 99BF6B80092;
	Sat, 23 Sep 2023 16:28:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98403C433C7;
	Sat, 23 Sep 2023 16:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695486519;
	bh=RqAizeoAgpyrjTuWTc3EPt+00fz0GKOYt3wgiu3ilxI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kdX7uAUn5A/nOh6b98KyxWdk9fFgHiJgriB/fwuK77YQxwt85ckYKTY9t3fBf62wY
	 OdfH5+weEeIpqZEmVKOTk/M6qPAq6DbFmu80HRazp/dQJOGu5Fdotg7Z2IUrfIcHFK
	 CzwEzww+QWurkfb1eX0LPowGymg+QANEOY5nujQK9DRlmOgfq/CMbzYwknq+dY7tnp
	 PeA7IOMb8Twk1q2cqZZhCdVsAByDQXH6HWv6/P0+r3F48yu28WNKT0AH75egCCxIj0
	 rSO4bYh3+oBADB8dkFnn9uQPpZxQXif883hCwsCk2af3dw5oO2O8+odTCE6fZmVuyX
	 JCGFYC8Rtz+ZQ==
Date: Sat, 23 Sep 2023 19:27:42 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v3 09/13] powerpc: extend execmem_params for kprobes
 allocations
Message-ID: <20230923162742.GO3303@kernel.org>
References: <20230918072955.2507221-1-rppt@kernel.org>
 <20230918072955.2507221-10-rppt@kernel.org>
 <1cb41761-29d0-5d33-b7c1-0ca3acaa810d@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1cb41761-29d0-5d33-b7c1-0ca3acaa810d@csgroup.eu>
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
Cc: Mark Rutland <mark.rutland@arm.com>, "x86@kernel.org" <x86@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, Song Liu <song@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Nadav Amit <nadav.amit@gmail.com>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, Thomas Gleixner <tglx@linutronix.de>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@list
 s.infradead.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, Puranjay Mohan <puranjay12@gmail.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Kent Overstreet <kent.overstreet@linux.dev>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "David S. Miller" <davem@davemloft.net>, "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

On Fri, Sep 22, 2023 at 10:32:46AM +0000, Christophe Leroy wrote:
> Hi Mike,
> 
> Le 18/09/2023 à 09:29, Mike Rapoport a écrit :
> > From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> > 
> > powerpc overrides kprobes::alloc_insn_page() to remove writable
> > permissions when STRICT_MODULE_RWX is on.
> > 
> > Add definition of EXECMEM_KRPOBES to execmem_params to allow using the
> > generic kprobes::alloc_insn_page() with the desired permissions.
> > 
> > As powerpc uses breakpoint instructions to inject kprobes, it does not
> > need to constrain kprobe allocations to the modules area and can use the
> > entire vmalloc address space.
> 
> I don't understand what you mean here. Does it mean kprobe allocation 
> doesn't need to be executable ? I don't think so based on the pgprot you 
> set.
> 
> On powerpc book3s/32, vmalloc space is not executable. Only modules 
> space is executable. X/NX cannot be set on a per page basis, it can only 
> be set on a 256 Mbytes segment basis.
> 
> See commit c49643319715 ("powerpc/32s: Only leave NX unset on segments 
> used for modules") and 6ca055322da8 ("powerpc/32s: Use dedicated segment 
> for modules with STRICT_KERNEL_RWX") and 7bee31ad8e2f ("powerpc/32s: Fix 
> is_module_segment() when MODULES_VADDR is defined").
> 
> So if your intention is still to have an executable kprobes, then you 
> can't use vmalloc address space.

Right, and I've fixed the KPROBES range to uses the same range as MODULES.
The commit message is stale and I need to update it.
 
> Christophe
> 
> > 
> > Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
> > ---
> >   arch/powerpc/kernel/kprobes.c | 14 --------------
> >   arch/powerpc/kernel/module.c  | 11 +++++++++++
> >   2 files changed, 11 insertions(+), 14 deletions(-)
> > 
> > diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
> > index 62228c7072a2..14c5ddec3056 100644
> > --- a/arch/powerpc/kernel/kprobes.c
> > +++ b/arch/powerpc/kernel/kprobes.c
> > @@ -126,20 +126,6 @@ kprobe_opcode_t *arch_adjust_kprobe_addr(unsigned long addr, unsigned long offse
> >   	return (kprobe_opcode_t *)(addr + offset);
> >   }
> >   
> > -void *alloc_insn_page(void)
> > -{
> > -	void *page;
> > -
> > -	page = execmem_text_alloc(EXECMEM_KPROBES, PAGE_SIZE);
> > -	if (!page)
> > -		return NULL;
> > -
> > -	if (strict_module_rwx_enabled())
> > -		set_memory_rox((unsigned long)page, 1);
> > -
> > -	return page;
> > -}
> > -
> >   int arch_prepare_kprobe(struct kprobe *p)
> >   {
> >   	int ret = 0;
> > diff --git a/arch/powerpc/kernel/module.c b/arch/powerpc/kernel/module.c
> > index 824d9541a310..bf2c62aef628 100644
> > --- a/arch/powerpc/kernel/module.c
> > +++ b/arch/powerpc/kernel/module.c
> > @@ -95,6 +95,9 @@ static struct execmem_params execmem_params __ro_after_init = {
> >   		[EXECMEM_DEFAULT] = {
> >   			.alignment = 1,
> >   		},
> > +		[EXECMEM_KPROBES] = {
> > +			.alignment = 1,
> > +		},
> >   		[EXECMEM_MODULE_DATA] = {
> >   			.alignment = 1,
> >   		},
> > @@ -135,5 +138,13 @@ struct execmem_params __init *execmem_arch_params(void)
> >   
> >   	range->pgprot = prot;
> >   
> > +	execmem_params.ranges[EXECMEM_KPROBES].start = VMALLOC_START;
> > +	execmem_params.ranges[EXECMEM_KPROBES].start = VMALLOC_END;
> > +
> > +	if (strict_module_rwx_enabled())
> > +		execmem_params.ranges[EXECMEM_KPROBES].pgprot = PAGE_KERNEL_ROX;
> > +	else
> > +		execmem_params.ranges[EXECMEM_KPROBES].pgprot = PAGE_KERNEL_EXEC;
> > +
> >   	return &execmem_params;
> >   }

-- 
Sincerely yours,
Mike.
