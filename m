Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC4B733E96
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jun 2023 08:11:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kpVRRR3/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjlzW42qbz3c1Y
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jun 2023 16:11:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kpVRRR3/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qjlyd5m97z30MN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jun 2023 16:11:05 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0A44860F56;
	Sat, 17 Jun 2023 06:11:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 232F1C433C8;
	Sat, 17 Jun 2023 06:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686982263;
	bh=1X6Vc8+Xzykk7Z2p+5RPkPnfKk/mxTwRqvgQiLyFLcs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kpVRRR3/peLouH5K6845IoDymP4RzHQ5X18L/qapqW+HSOSVD4Jxe+dS8ZHi81pu/
	 6UGSL3ryafkglY404kB9NewuLJthdXrDKmiG1bUa/SbIGImcdFFTImcXA24Lrq1XBP
	 b8jHFLQ6gc3Wlj/T62OORePu3DpO0oegza9UGNNTomGmTdYPVnUkXHwlXXNP8xNb6O
	 mSUdao6gRKvwJRP5+ktwASUtigGyhHJfmUrvUL8UkoscW+emJo4VTKfMECcoxbnJ1O
	 71I0q0m7dm69SI0vCCHrQzATzQcgIJXdFUCmromH14CzN/7cF+UERF73BpE9q6ULNL
	 UyjIthY/V8Lsw==
Date: Sat, 17 Jun 2023 09:10:15 +0300
From: Mike Rapoport <rppt@kernel.org>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Subject: Re: [PATCH v2 04/12] mm/execmem, arch: convert remaining overrides
 of module_alloc to execmem
Message-ID: <20230617061015.GO52412@kernel.org>
References: <20230616085038.4121892-1-rppt@kernel.org>
 <20230616085038.4121892-5-rppt@kernel.org>
 <15f5dff8217b1a2e16697d40e48dee6dd1f9b2f3.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <15f5dff8217b1a2e16697d40e48dee6dd1f9b2f3.camel@intel.com>
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "x86@kernel.org" <x86@kernel.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "song@kernel.org" <song@kernel.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "nadav.amit@gmail.com" <nadav.amit@gmail.com>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "deller@gmx.de" <deller@gmx.de>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "naveen.n.rao@linux.ibm.com" <naveen.n.rao@linux.ibm.com>, "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>, "will@kernel.org" <will@kernel.org>, "hca@linux.ibm.com" <hca@linux.ibm.com>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, "tglx@linutronix.de" <tglx@linutronix.de>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>, "puranjay12@gmail.com" <puranjay12@gmail.com>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kent.overstreet@linux.dev" <kent.overstreet@linux.dev>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dinguyen@kernel.org" <dinguyen@kernel.org>, "mcgrof@kernel.org" <mcgrof@kernel.org>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "davem@davemloft.net" <davem@davemloft.net>, "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 16, 2023 at 04:16:28PM +0000, Edgecombe, Rick P wrote:
> On Fri, 2023-06-16 at 11:50 +0300, Mike Rapoport wrote:
> > -void *module_alloc(unsigned long size)
> > -{
> > -       gfp_t gfp_mask = GFP_KERNEL;
> > -       void *p;
> > -
> > -       if (PAGE_ALIGN(size) > MODULES_LEN)
> > -               return NULL;
> > +static struct execmem_params execmem_params = {
> > +       .modules = {
> > +               .flags = EXECMEM_KASAN_SHADOW,
> > +               .text = {
> > +                       .alignment = MODULE_ALIGN,
> > +               },
> > +       },
> > +};
> 
> Did you consider making these execmem_params's ro_after_init? Not that
> it is security sensitive, but it's a nice hint to the reader that it is
> only modified at init. And I guess basically free sanitizing of buggy
> writes to it.

Makes sense.
 
> >  
> > -       p = __vmalloc_node_range(size, MODULE_ALIGN,
> > -                                MODULES_VADDR +
> > get_module_load_offset(),
> > -                                MODULES_END, gfp_mask, PAGE_KERNEL,
> > -                                VM_FLUSH_RESET_PERMS |
> > VM_DEFER_KMEMLEAK,
> > -                                NUMA_NO_NODE,
> > __builtin_return_address(0));
> > +struct execmem_params __init *execmem_arch_params(void)
> > +{
> > +       unsigned long start = MODULES_VADDR +
> > get_module_load_offset();
> 
> I think we can drop the mutex's in get_module_load_offset() now, since
> execmem_arch_params() should only be called once at init.

Right. Even more, the entire get_module_load_offset() can be folded into
execmem_arch_params() as 

	if (IS_ENABLED(CONFIG_RANDOMIZE_BASE) && kaslr_enabled())
		module_load_offset =
			get_random_u32_inclusive(1, 1024) * PAGE_SIZE;

> >  
> > -       if (p && (kasan_alloc_module_shadow(p, size, gfp_mask) < 0))
> > {
> > -               vfree(p);
> > -               return NULL;
> > -       }
> > +       execmem_params.modules.text.start = start;
> > +       execmem_params.modules.text.end = MODULES_END;
> > +       execmem_params.modules.text.pgprot = PAGE_KERNEL;
> >  
> > -       return p;
> > +       return &execmem_params;
> >  }
> >  
> 

-- 
Sincerely yours,
Mike.
