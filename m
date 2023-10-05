Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A197B9AEE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Oct 2023 07:30:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=htbvcSdK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S1Krw5sk4z3vZL
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Oct 2023 16:30:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=htbvcSdK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S1Kr521vFz2yQ8
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Oct 2023 16:29:41 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 58A05CE1FD1;
	Thu,  5 Oct 2023 05:29:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CBD6C433CC;
	Thu,  5 Oct 2023 05:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696483777;
	bh=0Btg3YXrlgdZvN9c5GBtYXuhH18hqWIB+5O6R7ueqJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=htbvcSdKFwWteJskCo57Zoc+HETH4Yk4itDoLxeJ1ZG4lHI/6dRpo8c5g9SXm397o
	 Eun4d3xnthNfZVwdWsofKvM4QWBVN4HTm3hLqzLiQBrntUL8UgEGY5xtChyLJeLSvA
	 +kiu09tPGlxznwtPobf/uLurpuN8CBF2/SLMhDWs179ymyb2Urny866sSuGF/ojv6+
	 iWewEluv5jVsvROGeyy57su15Hs4TbNbwzhji63ZqwBfc3BmxOSDIm1/YBjJDN2t9v
	 ZHq7tnS5BF0NS66xJ3m6K4ABlSRKqepeLUIUEhNo390B9QIPXevXF5ZN3BxZUTA4Ed
	 Ef2zRBvRZ4gnQ==
Date: Thu, 5 Oct 2023 08:28:24 +0300
From: Mike Rapoport <rppt@kernel.org>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Subject: Re: [PATCH v3 04/13] mm/execmem, arch: convert remaining overrides
 of module_alloc to execmem
Message-ID: <20231005052824.GE3303@kernel.org>
References: <20230918072955.2507221-1-rppt@kernel.org>
 <20230918072955.2507221-5-rppt@kernel.org>
 <3483c4712306060ac56f07f5db9b146d69fc7e9e.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3483c4712306060ac56f07f5db9b146d69fc7e9e.camel@intel.com>
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "x86@kernel.org" <x86@kernel.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "song@kernel.org" <song@kernel.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "nadav.amit@gmail.com" <nadav.amit@gmail.com>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "deller@gmx.de" <deller@gmx.de>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "mcgrof@kernel.org" <mcgrof@kernel.org>, "naveen.n.rao@linux.ibm.com" <naveen.n.rao@linux.ibm.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>, "will@kernel.org" <will@kernel.org>, "hca@linux.ibm.com" <hca@linux.ibm.com>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, "tglx@linutronix.de" <tglx@linutronix.de>, 
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>, "puranjay12@gmail.com" <puranjay12@gmail.com>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kent.overstreet@linux.dev" <kent.overstreet@linux.dev>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dinguyen@kernel.org" <dinguyen@kernel.org>, "bjorn@kernel.org" <bjorn@kernel.org>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "davem@davemloft.net" <davem@davemloft.net>, "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 04, 2023 at 12:29:36AM +0000, Edgecombe, Rick P wrote:
> On Mon, 2023-09-18 at 10:29 +0300, Mike Rapoport wrote:
> > diff --git a/arch/x86/kernel/module.c b/arch/x86/kernel/module.c
> > index 5f71a0cf4399..9d37375e2f05 100644
> > --- a/arch/x86/kernel/module.c
> > +++ b/arch/x86/kernel/module.c
> >
> > -void *module_alloc(unsigned long size)
> > +struct execmem_params __init *execmem_arch_params(void)
> >  {
> > -       gfp_t gfp_mask = GFP_KERNEL;
> > -       void *p;
> > -
> > -       if (PAGE_ALIGN(size) > MODULES_LEN)
> > -               return NULL;
> > +       unsigned long module_load_offset = 0;
> > +       unsigned long start;
> >  
> > -       p = __vmalloc_node_range(size, MODULE_ALIGN,
> > -                                MODULES_VADDR +
> > get_module_load_offset(),
> > -                                MODULES_END, gfp_mask, PAGE_KERNEL,
> > -                                VM_FLUSH_RESET_PERMS |
> > VM_DEFER_KMEMLEAK,
> > -                                NUMA_NO_NODE,
> > __builtin_return_address(0));
> > +       if (IS_ENABLED(CONFIG_RANDOMIZE_BASE) && kaslr_enabled())
> > +               module_load_offset =
> > +                       get_random_u32_inclusive(1, 1024) *
> > PAGE_SIZE;
> 
> Minor:
> I think you can skip the IS_ENABLED(CONFIG_RANDOMIZE_BASE) part because
> CONFIG_RANDOMIZE_MEMORY depends on CONFIG_RANDOMIZE_BASE (which is
> checked in kaslr_enabled()).

Thanks, I'll look into it.

-- 
Sincerely yours,
Mike.
