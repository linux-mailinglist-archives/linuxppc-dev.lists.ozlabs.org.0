Return-Path: <linuxppc-dev+bounces-11877-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A21B48B1C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Sep 2025 13:06:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cL3zw3HCCz2ym3;
	Mon,  8 Sep 2025 21:06:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757329596;
	cv=none; b=QscXzgjFqXfynDCLDZT5fyJGVYhTBVksZ3wccDOddna9Z3jkc4dwlVIYrpDlNDDTHI2KOX+5Qy5WNUxkiz3yHOjT5HnSlCyiyiKq+Wgqt4OGeFVi9KV8fkn6FtKxwAdqHiPQnv29cVH7PquHfr8wcFORs8BpmMzhOvwUrJqUlAbeNgSx+pgH5Sd64WCSx4N1ngS5UQdkg0/glQ8Uc9UL9Hmy+CviyZgabbUFdzOPlKjIRPDsMbt6Y9F0CkPMQI82sAU9Rq6/XCn25kMcdhIzcs3BoJtpQfClpv1VzF7Yht7d1lF5AJsZgf+LC5PwlMNvsaTixALYB3B9Ds3hOSIR0w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757329596; c=relaxed/relaxed;
	bh=orP0/tJhwM8uEnQ8hg/AimV8gG8pwl2IODsFAMQ48tw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L/dMJzAcGxaTByUjqgH9+oBRm/Ye8vulrRUlm79wbeDlBLUPYZ4hnWjgRXTZlKgh9VEmLr2LdrX6ZkKRWp+dGpghjGMW9r6uINwW9bYgOxwBSc7VyAUxPBYznnTzeAiueWOn5LHWonwaH5LKha3sh60er7L67FmmyeGi9uVVChiIL7QrmDAgq5EWjf6xNSey8+1a9InH+T6K3f+UGVtgGNoMs9UzqVNK8+S9CScWFT6gM0A8B0ozsTLpIqatIOTVPDOybGg+mjU/pc0KjYDSW7Mme9poBNShjvKjv1nOpae0n0qqInRNjglrNKOlFomidxV47Yt/gHDCSI9jdmYaAg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Zx9JjuLr; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Zx9JjuLr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cL3zv150Pz2xQ6
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Sep 2025 21:06:35 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2DFE6601A4;
	Mon,  8 Sep 2025 11:06:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4621EC4CEF1;
	Mon,  8 Sep 2025 11:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757329592;
	bh=tv0RyxtEXiT69AOtNdiq+yEWh80wAGCZqmtmrHh1C9U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zx9JjuLrR3oJx7FdM0t+SwZlc02CRIeJ+OsFV5BNQ//kH6Gb++Lv65Aaye9tyGO1d
	 AEMnotC47WNk4WNfJiamcfeRjzs0V6lS/YQ0L0gXYY/JziCahH/gt8CA9bmm/UJOsu
	 3s+1Bu/C9SXdHbyVn9gYI+EaPCQ1JMC59zPsWUypZcWWXUUK1U5Bkd+uaKGc9lpcO6
	 Rnxwug+jW/BjM7wXToVE0y7CdujOUuqgXjf2IYXuWcc1VnTdME8/ztSF9/dpHxw9G8
	 EsbWq0asAVzNJN0/0qCAoyz/w0JHUY5yOIP6mvPm85LdCFtg1ZXHV/i3+s0n3cQ67t
	 5//zgyrBoBwXw==
Date: Mon, 8 Sep 2025 16:33:24 +0530
From: Naveen N Rao <naveen@kernel.org>
To: Joe Lawrence <joe.lawrence@redhat.com>
Cc: linuxppc-dev@lists.ozlabs.org, live-patching@vger.kernel.org, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc64/modules: fix ool-ftrace-stub vs. livepatch
 relocation corruption
Message-ID: <2tscft2yyndfbkl2a7ltndqfwx7phajkfma3m6o5phpm3xkme2@dcy6ohdbfhsk>
References: <20250904022950.3004112-1-joe.lawrence@redhat.com>
 <aLj7c13wVPvkdNxc@redhat.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aLj7c13wVPvkdNxc@redhat.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Sep 03, 2025 at 10:37:39PM -0400, Joe Lawrence wrote:
> On Wed, Sep 03, 2025 at 10:29:50PM -0400, Joe Lawrence wrote:
> > The powerpc64 module .stubs section holds ppc64_stub_entry[] code
> > trampolines that are generated at module load time. These stubs are
> > necessary for function calls to external symbols that are too far away
> > for a simple relative branch.
> > 
> > Logic for finding an available ppc64_stub_entry has relied on a sentinel
> > value in the funcdata member to indicate a used slot. Code iterates
> > through the array, inspecting .funcdata to find the first unused (zeroed)
> > entry:
> > 
> >   for (i = 0; stub_func_addr(stubs[i].funcdata); i++)
> > 
> > To support CONFIG_PPC_FTRACE_OUT_OF_LINE, a new setup_ftrace_ool_stubs()
> > function extended the .stubs section by adding an array of
> > ftrace_ool_stub structures for each patchable function. A side effect
> > of writing these smaller structures is that the funcdata sentinel
> > convention is not maintained.

There is clearly a bug in how we are reserving the stubs as you point 
out further below, but once that is properly initialized, I don't think 
the smaller structure size for ftrace_ool_stub matters (in so far as 
stub->funcdata being non-NULL). We end up writing four valid powerpc 
instructions, along with a ftrace_ops pointer before those instructions 
which should also be non-zero (there is a bug here too, more on that 
below).  The whole function descriptor dance does complicate matters a 
bit though.

> > This is not a problem for an ordinary
> > kernel module, as this occurs in module_finalize(), after which no
> > further .stubs updates are needed.
> > 
> > However, when loading a livepatch module that contains klp-relocations,
> > apply_relocate_add() is executed a second time, after the out-of-line
> > ftrace stubs have been set up.
> > 
> > When apply_relocate_add() then calls stub_for_addr() to handle a
> > klp-relocation, its search for the next available ppc64_stub_entry[]
> > slot may stop prematurely in the middle of the ftrace_ool_stub array. A
> > full ppc64_stub_entry is then written, corrupting the ftrace stubs.
> > 
> > Fix this by explicitly tracking the count of used ppc64_stub_entrys.
> > Rather than relying on an inline funcdata sentinel value, a new
> > stub_count is used as the explicit boundary for searching and allocating
> > stubs. This simplifies the code, eliminates the "one extra reloc" that
> > was required for the sentinel check, and resolves the memory corruption.
> > 
> 
> Apologies if this is too wordy, I wrote it as a bit of a braindump to
> summarize the longer analysis at the bottom of the reply ...

This was a good read, thanks for all the details. It did help spot 
another issue.

> 
> > Fixes: eec37961a56a ("powerpc64/ftrace: Move ftrace sequence out of line")
> > Signed-off-by: Joe Lawrence <joe.lawrence@redhat.com>
> > ---
> >  arch/powerpc/include/asm/module.h |  1 +
> >  arch/powerpc/kernel/module_64.c   | 26 ++++++++------------------
> >  2 files changed, 9 insertions(+), 18 deletions(-)
> > 
> > diff --git a/arch/powerpc/include/asm/module.h b/arch/powerpc/include/asm/module.h
> > index e1ee5026ac4a..864e22deaa2c 100644
> > --- a/arch/powerpc/include/asm/module.h
> > +++ b/arch/powerpc/include/asm/module.h
> > @@ -27,6 +27,7 @@ struct ppc_plt_entry {
> >  struct mod_arch_specific {
> >  #ifdef __powerpc64__
> >  	unsigned int stubs_section;	/* Index of stubs section in module */
> > +	unsigned int stub_count;	/* Number of stubs used */
> >  #ifdef CONFIG_PPC_KERNEL_PCREL
> >  	unsigned int got_section;	/* What section is the GOT? */
> >  	unsigned int pcpu_section;	/* .data..percpu section */
> > diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_64.c
> > index 126bf3b06ab7..2a44bc8e2439 100644
> > --- a/arch/powerpc/kernel/module_64.c
> > +++ b/arch/powerpc/kernel/module_64.c
> > @@ -209,8 +209,7 @@ static unsigned long get_stubs_size(const Elf64_Ehdr *hdr,
> >  				    char *secstrings,
> >  				    struct module *me)
> >  {
> > -	/* One extra reloc so it's always 0-addr terminated */
> > -	unsigned long relocs = 1;
> > +	unsigned long relocs = 0;
> >  	unsigned i;
> >  
> >  	/* Every relocated section... */
> > @@ -705,7 +704,7 @@ static unsigned long stub_for_addr(const Elf64_Shdr *sechdrs,
> >  
> >  	/* Find this stub, or if that fails, the next avail. entry */
> >  	stubs = (void *)sechdrs[me->arch.stubs_section].sh_addr;
> > -	for (i = 0; stub_func_addr(stubs[i].funcdata); i++) {
> > +	for (i = 0; i < me->arch.stub_count; i++) {
> >  		if (WARN_ON(i >= num_stubs))
> >  			return 0;
> >  
> > @@ -716,6 +715,7 @@ static unsigned long stub_for_addr(const Elf64_Shdr *sechdrs,
> >  	if (!create_stub(sechdrs, &stubs[i], addr, me, name))
> >  		return 0;
> >  
> > +	me->arch.stub_count++;
> >  	return (unsigned long)&stubs[i];
> >  }
> >  
> > @@ -1118,29 +1118,19 @@ int module_trampoline_target(struct module *mod, unsigned long addr,
> >  static int setup_ftrace_ool_stubs(const Elf64_Shdr *sechdrs, unsigned long addr, struct module *me)
> >  {
> >  #ifdef CONFIG_PPC_FTRACE_OUT_OF_LINE
> > -	unsigned int i, total_stubs, num_stubs;
> > +	unsigned int total_stubs, num_stubs;
> >  	struct ppc64_stub_entry *stub;
> >  
> >  	total_stubs = sechdrs[me->arch.stubs_section].sh_size / sizeof(*stub);
> >  	num_stubs = roundup(me->arch.ool_stub_count * sizeof(struct ftrace_ool_stub),
> >  			    sizeof(struct ppc64_stub_entry)) / sizeof(struct ppc64_stub_entry);
> >  
> > -	/* Find the next available entry */
> > -	stub = (void *)sechdrs[me->arch.stubs_section].sh_addr;
> > -	for (i = 0; stub_func_addr(stub[i].funcdata); i++)
> > -		if (WARN_ON(i >= total_stubs))
> > -			return -1;
> > -
> > -	if (WARN_ON(i + num_stubs > total_stubs))
> > +	if (WARN_ON(me->arch.stub_count + num_stubs > total_stubs))
> >  		return -1;
> >  
> > -	stub += i;
> > -	me->arch.ool_stubs = (struct ftrace_ool_stub *)stub;
> > -
> > -	/* reserve stubs */
> > -	for (i = 0; i < num_stubs; i++)
> > -		if (patch_u32((void *)&stub->funcdata, PPC_RAW_NOP()))
> > -			return -1;
> 
> At first I thought the bug was that this loop was re-writting the same
> PPC_RAW_NOP() to the same funcdata (i.e, should have been something
> like: patch_u32((void *)stub[i]->funcdata, PPC_RAW_NOP())), but that
> didn't work and seemed fragile anyway.

D'uh - this path was clearly never tested. I suppose this should have 
been something like this:
	patch_ulong((void *)&stub[i]->funcdata, func_desc(local_paca))

Still convoluted, but I think that should hopefully fix the problem you 
are seeing.

> 
> > +	stub = (void *)sechdrs[me->arch.stubs_section].sh_addr;
> > +	me->arch.ool_stubs = (struct ftrace_ool_stub *)(stub + me->arch.stub_count);
> > +	me->arch.stub_count += num_stubs;
> >  #endif

Regardless of the above, your proposed change looks good to me and 
simplifies the logic. So:
Acked-by: Naveen N Rao (AMD) <naveen@kernel.org>

>   crash> dis 0xc008000007d70dd0 42
>   ppc64[ ]   ftrace[0]    <xfs_stats_format+0x558>:    .long 0x0
>                           <xfs_stats_format+0x55c>:    .long 0x0
>                           <xfs_stats_format+0x560>:    mflr    r0
>                           <xfs_stats_format+0x564>:    bl      0xc008000007d70d80 <xfs_stats_format+0x508>
>                           <xfs_stats_format+0x568>:    mtlr    r0
>                           <xfs_stats_format+0x56c>:    b       0xc008000007d70014 <patch_free_livepatch+0xc>
>              ftrace[1]    <xfs_stats_format+0x570>:    .long 0x0
>                           <xfs_stats_format+0x574>:    .long 0x0
>                           <xfs_stats_format+0x578>:    mflr    r0
>                           <xfs_stats_format+0x57c>:    bl      0xc008000007d70d80 <xfs_stats_format+0x508>
>   ppc64[ ]                <xfs_stats_format+0x580>:    addis   r11,r2,4                                         << This looks like a full
>                           <xfs_stats_format+0x584>:    addi    r11,r11,-29448                                   << ppc64_stub_entry
>              ftrace[2]    <xfs_stats_format+0x588>:    std     r2,24(r1)                                        << dropped in the middle
>                           <xfs_stats_format+0x58c>:    ld      r12,32(r11)                                      << of the ool_stubs array
>                           <xfs_stats_format+0x590>:    mtctr   r12                                              << of ftrace_ool_stub[]
>                           <xfs_stats_format+0x594>:    bctr                                                     <<
>                           <xfs_stats_format+0x598>:    mtlr    r0                                               <<
>                           <xfs_stats_format+0x59c>:    andi.   r20,r27,30050                                    <<
>              ftrace[3]    <xfs_stats_format+0x5a0>:    .long 0x54e92b8                                          <<
>                           <xfs_stats_format+0x5a4>:    lfs     f0,0(r8)                                         <<
>   ppc64[ ]                <xfs_stats_format+0x5a8>:    mflr    r0
>                           <xfs_stats_format+0x5ac>:    bl      0xc008000007d70d80 <xfs_stats_format+0x508>
>                           <xfs_stats_format+0x5b0>:    mtlr    r0
>                           <xfs_stats_format+0x5b4>:    b       0xc008000007d7037c <add_callbacks_to_patch_objects+0xc>
>              ftrace[4]    <xfs_stats_format+0x5b8>:    .long 0x0
>                           <xfs_stats_format+0x5bc>:    .long 0x0

These NULL values are also problematic. I think those are NULL since we 
are not "reserving" the stubs properly, but those should point to some 
ftrace_op. I think we are missing a call to ftrace_rec_set_nop_ops() in 
ftrace_init_nop(), which would be good to do separately.


- Naveen


