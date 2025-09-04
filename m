Return-Path: <linuxppc-dev+bounces-11698-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EB0B42FD2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Sep 2025 04:38:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cHNtw1yTJz2yrZ;
	Thu,  4 Sep 2025 12:38:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756953480;
	cv=none; b=aA8erE3FJP9YZTiveDjmXH4aq1a9zHtPixqw9r5ZN+czAosSIO1oylMawlUNNTCtLyu7SEj+wrEA4i7F5bD7Waeaqg3c2YEnQMs15dvma54cf4SKehgGNJnAVBDZQVVzavHJQZQUOg+JGxTteBE1ul2ew/FK2358qY3I138z9PRAQiVnOmMcE/+NN+dd+H4XRerjPiMZ0Mc+KF+S2Xi/XH1CSTjMSgjjUOIb+jyZUmrifFCJFb7/HCQOi9tdMFDepsxIFaaILVKhmV57yh36ec28xfbxP5mZDo/Ch1QNnjLgy84ONMeYY5kSsNzeOhtV92feNGphjEUpc51V2D3wGA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756953480; c=relaxed/relaxed;
	bh=mPMNZWGQid0HM8G/F0DO+1lhzvnuALKiyMUDK21EphI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RMatUoCPniAGJ6zDjoHu1HCEM2GWcb/CbEib7cHouKVFRcYcLtQlAfda0ynVReD+kg+sXaErWQkXBZ6DyAWrj9R7yPuTKFFA6oy+glBC1dCXxpTgX+w3VAEbdFAe3lWuvkQKoiZFoECQEydvAmLCzjkFzfuCypP8dcHsWg2oZqgwrgXrxmAzachnjw/askPr0f4DWL+HqkgnLYetYlL5cWjU/LALSHkeO0DD6SC2W23SkDHBVFGJXE+lrE1zMSuB9T0BoRRN7Di5wiM0k/35jAO91cT2JsISr6eKSSbzjMFokhpQrgcvp6zVXw+ErFbjvJJI51+vJoqsPEJnJYl4Uw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CrMo3mzj; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CrMo3mzj; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=joe.lawrence@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CrMo3mzj;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CrMo3mzj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=joe.lawrence@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cHNtv0CBBz2xnM
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Sep 2025 12:37:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756953475;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mPMNZWGQid0HM8G/F0DO+1lhzvnuALKiyMUDK21EphI=;
	b=CrMo3mzj5C7jPH4IxynHy4P6JMpKrCBRB9YtSIjC8ru1NvcqkvHpp6dG8ou8+mzUI2xRhy
	FMzHAt29gZBvDpDdmyiygej4gKZuHt+XV9Mak2bpOfYuzi9OFMHGwiiOLxBWarpZmCsE9P
	fyVx0MWj0Ee5DrUFFX1YT72WKbPknh8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756953475;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mPMNZWGQid0HM8G/F0DO+1lhzvnuALKiyMUDK21EphI=;
	b=CrMo3mzj5C7jPH4IxynHy4P6JMpKrCBRB9YtSIjC8ru1NvcqkvHpp6dG8ou8+mzUI2xRhy
	FMzHAt29gZBvDpDdmyiygej4gKZuHt+XV9Mak2bpOfYuzi9OFMHGwiiOLxBWarpZmCsE9P
	fyVx0MWj0Ee5DrUFFX1YT72WKbPknh8=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-588-9M_fnsAPM2eKB-pLxEIeiA-1; Wed,
 03 Sep 2025 22:37:46 -0400
X-MC-Unique: 9M_fnsAPM2eKB-pLxEIeiA-1
X-Mimecast-MFC-AGG-ID: 9M_fnsAPM2eKB-pLxEIeiA_1756953465
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 632031800562;
	Thu,  4 Sep 2025 02:37:44 +0000 (UTC)
Received: from redhat.com (unknown [10.22.64.201])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 36217300021A;
	Thu,  4 Sep 2025 02:37:41 +0000 (UTC)
Date: Wed, 3 Sep 2025 22:37:39 -0400
From: Joe Lawrence <joe.lawrence@redhat.com>
To: linuxppc-dev@lists.ozlabs.org, live-patching@vger.kernel.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>
Subject: Re: [PATCH] powerpc64/modules: fix ool-ftrace-stub vs. livepatch
 relocation corruption
Message-ID: <aLj7c13wVPvkdNxc@redhat.com>
References: <20250904022950.3004112-1-joe.lawrence@redhat.com>
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
In-Reply-To: <20250904022950.3004112-1-joe.lawrence@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Sep 03, 2025 at 10:29:50PM -0400, Joe Lawrence wrote:
> The powerpc64 module .stubs section holds ppc64_stub_entry[] code
> trampolines that are generated at module load time. These stubs are
> necessary for function calls to external symbols that are too far away
> for a simple relative branch.
> 
> Logic for finding an available ppc64_stub_entry has relied on a sentinel
> value in the funcdata member to indicate a used slot. Code iterates
> through the array, inspecting .funcdata to find the first unused (zeroed)
> entry:
> 
>   for (i = 0; stub_func_addr(stubs[i].funcdata); i++)
> 
> To support CONFIG_PPC_FTRACE_OUT_OF_LINE, a new setup_ftrace_ool_stubs()
> function extended the .stubs section by adding an array of
> ftrace_ool_stub structures for each patchable function. A side effect
> of writing these smaller structures is that the funcdata sentinel
> convention is not maintained. This is not a problem for an ordinary
> kernel module, as this occurs in module_finalize(), after which no
> further .stubs updates are needed.
> 
> However, when loading a livepatch module that contains klp-relocations,
> apply_relocate_add() is executed a second time, after the out-of-line
> ftrace stubs have been set up.
> 
> When apply_relocate_add() then calls stub_for_addr() to handle a
> klp-relocation, its search for the next available ppc64_stub_entry[]
> slot may stop prematurely in the middle of the ftrace_ool_stub array. A
> full ppc64_stub_entry is then written, corrupting the ftrace stubs.
> 
> Fix this by explicitly tracking the count of used ppc64_stub_entrys.
> Rather than relying on an inline funcdata sentinel value, a new
> stub_count is used as the explicit boundary for searching and allocating
> stubs. This simplifies the code, eliminates the "one extra reloc" that
> was required for the sentinel check, and resolves the memory corruption.
> 

Apologies if this is too wordy, I wrote it as a bit of a braindump to
summarize the longer analysis at the bottom of the reply ...

> Fixes: eec37961a56a ("powerpc64/ftrace: Move ftrace sequence out of line")
> Signed-off-by: Joe Lawrence <joe.lawrence@redhat.com>
> ---
>  arch/powerpc/include/asm/module.h |  1 +
>  arch/powerpc/kernel/module_64.c   | 26 ++++++++------------------
>  2 files changed, 9 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/module.h b/arch/powerpc/include/asm/module.h
> index e1ee5026ac4a..864e22deaa2c 100644
> --- a/arch/powerpc/include/asm/module.h
> +++ b/arch/powerpc/include/asm/module.h
> @@ -27,6 +27,7 @@ struct ppc_plt_entry {
>  struct mod_arch_specific {
>  #ifdef __powerpc64__
>  	unsigned int stubs_section;	/* Index of stubs section in module */
> +	unsigned int stub_count;	/* Number of stubs used */
>  #ifdef CONFIG_PPC_KERNEL_PCREL
>  	unsigned int got_section;	/* What section is the GOT? */
>  	unsigned int pcpu_section;	/* .data..percpu section */
> diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_64.c
> index 126bf3b06ab7..2a44bc8e2439 100644
> --- a/arch/powerpc/kernel/module_64.c
> +++ b/arch/powerpc/kernel/module_64.c
> @@ -209,8 +209,7 @@ static unsigned long get_stubs_size(const Elf64_Ehdr *hdr,
>  				    char *secstrings,
>  				    struct module *me)
>  {
> -	/* One extra reloc so it's always 0-addr terminated */
> -	unsigned long relocs = 1;
> +	unsigned long relocs = 0;
>  	unsigned i;
>  
>  	/* Every relocated section... */
> @@ -705,7 +704,7 @@ static unsigned long stub_for_addr(const Elf64_Shdr *sechdrs,
>  
>  	/* Find this stub, or if that fails, the next avail. entry */
>  	stubs = (void *)sechdrs[me->arch.stubs_section].sh_addr;
> -	for (i = 0; stub_func_addr(stubs[i].funcdata); i++) {
> +	for (i = 0; i < me->arch.stub_count; i++) {
>  		if (WARN_ON(i >= num_stubs))
>  			return 0;
>  
> @@ -716,6 +715,7 @@ static unsigned long stub_for_addr(const Elf64_Shdr *sechdrs,
>  	if (!create_stub(sechdrs, &stubs[i], addr, me, name))
>  		return 0;
>  
> +	me->arch.stub_count++;
>  	return (unsigned long)&stubs[i];
>  }
>  
> @@ -1118,29 +1118,19 @@ int module_trampoline_target(struct module *mod, unsigned long addr,
>  static int setup_ftrace_ool_stubs(const Elf64_Shdr *sechdrs, unsigned long addr, struct module *me)
>  {
>  #ifdef CONFIG_PPC_FTRACE_OUT_OF_LINE
> -	unsigned int i, total_stubs, num_stubs;
> +	unsigned int total_stubs, num_stubs;
>  	struct ppc64_stub_entry *stub;
>  
>  	total_stubs = sechdrs[me->arch.stubs_section].sh_size / sizeof(*stub);
>  	num_stubs = roundup(me->arch.ool_stub_count * sizeof(struct ftrace_ool_stub),
>  			    sizeof(struct ppc64_stub_entry)) / sizeof(struct ppc64_stub_entry);
>  
> -	/* Find the next available entry */
> -	stub = (void *)sechdrs[me->arch.stubs_section].sh_addr;
> -	for (i = 0; stub_func_addr(stub[i].funcdata); i++)
> -		if (WARN_ON(i >= total_stubs))
> -			return -1;
> -
> -	if (WARN_ON(i + num_stubs > total_stubs))
> +	if (WARN_ON(me->arch.stub_count + num_stubs > total_stubs))
>  		return -1;
>  
> -	stub += i;
> -	me->arch.ool_stubs = (struct ftrace_ool_stub *)stub;
> -
> -	/* reserve stubs */
> -	for (i = 0; i < num_stubs; i++)
> -		if (patch_u32((void *)&stub->funcdata, PPC_RAW_NOP()))
> -			return -1;

At first I thought the bug was that this loop was re-writting the same
PPC_RAW_NOP() to the same funcdata (i.e, should have been something
like: patch_u32((void *)stub[i]->funcdata, PPC_RAW_NOP())), but that
didn't work and seemed fragile anyway.

> +	stub = (void *)sechdrs[me->arch.stubs_section].sh_addr;
> +	me->arch.ool_stubs = (struct ftrace_ool_stub *)(stub + me->arch.stub_count);
> +	me->arch.stub_count += num_stubs;
>  #endif
>  
>  	return 0;
> -- 
> 2.50.1
> 

Original problem
================

I noticed an issue when loading a livepatch module with a klp-relocation
(see Documentation/livepatch/module-elf-format.rst) and then tried
ftracing one of its functions:

  $ SYSFS=/sys/kernel/debug/tracing
  $ echo 0 > $SYSFS/tracing_on
  $ echo > $SYSFS/set_ftrace_filter
  $ echo function > $SYSFS/current_tracer
  $ echo 'xfs_stats_format:mod:livepatch_module' >> $SYSFS/set_ftrace_filter
 
  # Double check the ftrace filter  
  $ cat $SYSFS/set_ftrace_filter
  xfs_stats_format [livepatch_module]
 
  # Bombs away 
  $ echo 1 > $SYSFS/tracing_on
  $ grep kpatch /sys/fs/xfs/stats/stats

  [ ... sometimes a crash, sometimes nothing at all, but never a
        $SYSFS/trace entry ... ]

This module is different from any of the in-kernel livepatching
kselftests as it was created by kpatch-build, and included a
klp-relocation:

  $ readelf --wide --relocs livepatch-module.ko | awk '/.klp.rela.xfs..text.xfs_stats_format/' RS="\n\n"
  Relocation section '.klp.rela.xfs..text.xfs_stats_format' at offset 0x18e010 contains 1 entry:
      Offset             Info             Type               Symbol's Value  Symbol's Name + Addend
  00000000000000d0  0000008c0000000a R_PPC64_REL24          0000000000000000 .klp.sym.xfs.counter_val,1 + 0

And when looking at the module's out-of-line ftrace stubs on a live system, I
saw the corruption.

crash utility analysis
----------------------

Dump the arch-specific module section to find the OOL-ftrace-sub area:

  crash> mod | grep livepatch_module
  c008000007d30500  livepatch_module                   c008000007d70000   262144  (not loaded)  [CONFIG_KALLSYMS]
  crash> struct module.arch c008000007d30500
    arch = {
      stubs_section = 72,
      toc_section = 50,
      toc_fixed = true,
      tramp = 0xc008000007d70d80,
      tramp_regs = 0xc008000007d70da8,
      ool_stubs = 0xc008000007d70dd0 <xfs_stats_format+0x558>,
      ool_stub_count = 7,
      ool_stub_index = 7
    },

Figure out how many instructions fit inside the ftrace_ool_stub[] area:

  crash> p/d (sizeof(struct ftrace_ool_stub) * 7) / 4
  $5 = 42

The crash utility disassembly below shows the memory corruption. After a
valid ftrace_ool_stub at index 1, a full ppc64_stub_entry for a
livepatch relocation has been incorrectly written at
xfs_stats_format+0x580, overwriting the memory where ftrace_ool_stub[1..3]
were supposed to be:

  [ edited for readability: ppc64=ppc64_stub_entry and ftrace=ftrace_ool_stub ]

  crash> dis 0xc008000007d70dd0 42
  ppc64[ ]   ftrace[0]    <xfs_stats_format+0x558>:    .long 0x0
                          <xfs_stats_format+0x55c>:    .long 0x0
                          <xfs_stats_format+0x560>:    mflr    r0
                          <xfs_stats_format+0x564>:    bl      0xc008000007d70d80 <xfs_stats_format+0x508>
                          <xfs_stats_format+0x568>:    mtlr    r0
                          <xfs_stats_format+0x56c>:    b       0xc008000007d70014 <patch_free_livepatch+0xc>
             ftrace[1]    <xfs_stats_format+0x570>:    .long 0x0
                          <xfs_stats_format+0x574>:    .long 0x0
                          <xfs_stats_format+0x578>:    mflr    r0
                          <xfs_stats_format+0x57c>:    bl      0xc008000007d70d80 <xfs_stats_format+0x508>
  ppc64[ ]                <xfs_stats_format+0x580>:    addis   r11,r2,4                                         << This looks like a full
                          <xfs_stats_format+0x584>:    addi    r11,r11,-29448                                   << ppc64_stub_entry
             ftrace[2]    <xfs_stats_format+0x588>:    std     r2,24(r1)                                        << dropped in the middle
                          <xfs_stats_format+0x58c>:    ld      r12,32(r11)                                      << of the ool_stubs array
                          <xfs_stats_format+0x590>:    mtctr   r12                                              << of ftrace_ool_stub[]
                          <xfs_stats_format+0x594>:    bctr                                                     <<
                          <xfs_stats_format+0x598>:    mtlr    r0                                               <<
                          <xfs_stats_format+0x59c>:    andi.   r20,r27,30050                                    <<
             ftrace[3]    <xfs_stats_format+0x5a0>:    .long 0x54e92b8                                          <<
                          <xfs_stats_format+0x5a4>:    lfs     f0,0(r8)                                         <<
  ppc64[ ]                <xfs_stats_format+0x5a8>:    mflr    r0
                          <xfs_stats_format+0x5ac>:    bl      0xc008000007d70d80 <xfs_stats_format+0x508>
                          <xfs_stats_format+0x5b0>:    mtlr    r0
                          <xfs_stats_format+0x5b4>:    b       0xc008000007d7037c <add_callbacks_to_patch_objects+0xc>
             ftrace[4]    <xfs_stats_format+0x5b8>:    .long 0x0
                          <xfs_stats_format+0x5bc>:    .long 0x0
                          <xfs_stats_format+0x5c0>:    mflr    r0
                          <xfs_stats_format+0x5c4>:    bl      0xc008000007d70d80 <xfs_stats_format+0x508>
                          <xfs_stats_format+0x5c8>:    mtlr    r0
                          <xfs_stats_format+0x5cc>:    b       0xc008000007d705ac <init_module+0xc>
  ppc64[ ]   ftrace[5]    <xfs_stats_format+0x5d0>:    .long 0x0
                          <xfs_stats_format+0x5d4>:    .long 0x0
                          <xfs_stats_format+0x5d8>:    mflr    r0
                          <xfs_stats_format+0x5dc>:    bl      0xc008000007d70d80 <xfs_stats_format+0x508>
                          <xfs_stats_format+0x5e0>:    mtlr    r0
                          <xfs_stats_format+0x5e4>:    b       0xc008000007d70864 <kpatch_string+0xc>
             ftrace[6]    <xfs_stats_format+0x5e8>:    .long 0x0
                          <xfs_stats_format+0x5ec>:    .long 0x0
                          <xfs_stats_format+0x5f0>:    mflr    r0
                          <xfs_stats_format+0x5f4>:    bl      0xc008000007d70d80 <xfs_stats_format+0x508>
  ppc64[ ]                <xfs_stats_format+0x5f8>:    mtlr    r0
                          <xfs_stats_format+0x5fc>:    b       0xc008000007d70884 <xfs_stats_format+0xc>


crash utility analysis (post-fix)
--------------------------------

Get our bearings from the arch-specific section of the module:

  crash> mod | grep livepatch_module
  c008000009ae0500  livepatch_module                   c0080000099c0000   262144  (not loaded)  [CONFIG_KALLSYMS]
  crash> struct module.arch c008000009ae0500
    arch = {
      stubs_section = 72,
      stub_count = 20,                                          << new count of all ppc64_stub_entry[]
      toc_section = 50,
      toc_fixed = true,
      tramp = 0xc0080000099c0d80,
      tramp_regs = 0xc0080000099c0da8,
      ool_stubs = 0xc0080000099c0dd0 <xfs_stats_format+0x558>,  << where ftrace_ool_stub[] begins
      ool_stub_count = 7,                                       << count of ftrace_ool_stubs
      ool_stub_index = 7
    },

Disassmble the ftrace_ool_stub[] area for the livepatch_module.  Figure out
how many instructions will fit into the ppc64_stub_entry and ftrace_ool_stub
structures so we can mark them along the way.

  crash> p/d sizeof(struct ppc64_stub_entry) / 4
  $1 = 10
  crash> p/d sizeof(struct ftrace_ool_stub) / 4
  $2 = 6
  crash> p/d (sizeof(struct ppc64_stub_entry) * 20) / 4
  $3 = 200
  crash> dis 0xc0080000099c0ba0 200

The new disassembly shows that the regular relocation stubs
ppc64_stub_entry[0..13] are followed by the correctly formatted
ftrace_ool_stub area (ftrace_ool_stub[0..6]).  The livepatch-specific
ppc64_stub_entry is now safely placed at the end of the section (at
ppc64_stub_entry[19]), avoiding any collision:

  [ edited for readability: ppc64=ppc64_stub_entry and ftrace=ftrace_ool_stub ]

  ppc64[0]                <xfs_stats_format+0x328>:    addis   r11,r2,-18
                          <xfs_stats_format+0x32c>:    addi    r11,r11,-30048
                          <xfs_stats_format+0x330>:    std     r2,24(r1)
                          <xfs_stats_format+0x334>:    ld      r12,32(r11)
                          <xfs_stats_format+0x338>:    mtctr   r12
                          <xfs_stats_format+0x33c>:    bctr
                          <xfs_stats_format+0x340>:    .long 0x0
                          <xfs_stats_format+0x344>:    andi.   r20,r27,30050
                          <xfs_stats_format+0x348>:    .long 0x123fef0
                          <xfs_stats_format+0x34c>:    lfs     f0,0(0)
  ppc64[1]                <xfs_stats_format+0x350>:    addis   r11,r2,-18
                          <xfs_stats_format+0x354>:    addi    r11,r11,-30008
                          <xfs_stats_format+0x358>:    std     r2,24(r1)
                          <xfs_stats_format+0x35c>:    ld      r12,32(r11)
                          <xfs_stats_format+0x360>:    mtctr   r12
                          <xfs_stats_format+0x364>:    bctr
                          <xfs_stats_format+0x368>:    .long 0x0
                          <xfs_stats_format+0x36c>:    andi.   r20,r27,30050
                          <xfs_stats_format+0x370>:    .long 0xa7c9f0
                          <xfs_stats_format+0x374>:    lfs     f0,0(0)
  ppc64[2]                <xfs_stats_format+0x378>:    addis   r11,r2,-18
                          <xfs_stats_format+0x37c>:    addi    r11,r11,-29968
                          <xfs_stats_format+0x380>:    std     r2,24(r1)
                          <xfs_stats_format+0x384>:    ld      r12,32(r11)
                          <xfs_stats_format+0x388>:    mtctr   r12
                          <xfs_stats_format+0x38c>:    bctr
                          <xfs_stats_format+0x390>:    .long 0x0
                          <xfs_stats_format+0x394>:    andi.   r20,r27,30050
                          <xfs_stats_format+0x398>:    .long 0x2f0a94
                          <xfs_stats_format+0x39c>:    lfs     f0,0(0)
  ppc64[3]                <xfs_stats_format+0x3a0>:    addis   r11,r2,-18
                          <xfs_stats_format+0x3a4>:    addi    r11,r11,-29928
                          <xfs_stats_format+0x3a8>:    std     r2,24(r1)
                          <xfs_stats_format+0x3ac>:    ld      r12,32(r11)
                          <xfs_stats_format+0x3b0>:    mtctr   r12
                          <xfs_stats_format+0x3b4>:    bctr
                          <xfs_stats_format+0x3b8>:    .long 0x0
                          <xfs_stats_format+0x3bc>:    andi.   r20,r27,30050
                          <xfs_stats_format+0x3c0>:    .long 0x67e440
                          <xfs_stats_format+0x3c4>:    lfs     f0,0(0)
  ppc64[4]                <xfs_stats_format+0x3c8>:    addis   r11,r2,-18
                          <xfs_stats_format+0x3cc>:    addi    r11,r11,-29888
                          <xfs_stats_format+0x3d0>:    std     r2,24(r1)
                          <xfs_stats_format+0x3d4>:    ld      r12,32(r11)
                          <xfs_stats_format+0x3d8>:    mtctr   r12
                          <xfs_stats_format+0x3dc>:    bctr
                          <xfs_stats_format+0x3e0>:    .long 0x0
                          <xfs_stats_format+0x3e4>:    andi.   r20,r27,30050
                          <xfs_stats_format+0x3e8>:    .long 0x683da0
                          <xfs_stats_format+0x3ec>:    lfs     f0,0(0)
  ppc64[5]                <xfs_stats_format+0x3f0>:    addis   r11,r2,-18
                          <xfs_stats_format+0x3f4>:    addi    r11,r11,-29848
                          <xfs_stats_format+0x3f8>:    std     r2,24(r1)
                          <xfs_stats_format+0x3fc>:    ld      r12,32(r11)
                          <xfs_stats_format+0x400>:    mtctr   r12
                          <xfs_stats_format+0x404>:    bctr
                          <xfs_stats_format+0x408>:    .long 0x0
                          <xfs_stats_format+0x40c>:    andi.   r20,r27,30050
                          <xfs_stats_format+0x410>:    .long 0xa7c8a0
                          <xfs_stats_format+0x414>:    lfs     f0,0(0)
  ppc64[6]                <xfs_stats_format+0x418>:    addis   r11,r2,-18
                          <xfs_stats_format+0x41c>:    addi    r11,r11,-29808
                          <xfs_stats_format+0x420>:    std     r2,24(r1)
                          <xfs_stats_format+0x424>:    ld      r12,32(r11)
                          <xfs_stats_format+0x428>:    mtctr   r12
                          <xfs_stats_format+0x42c>:    bctr
                          <xfs_stats_format+0x430>:    .long 0x0
                          <xfs_stats_format+0x434>:    andi.   r20,r27,30050
                          <xfs_stats_format+0x438>:    .long 0x32fad0
                          <xfs_stats_format+0x43c>:    lfs     f0,0(0)
  ppc64[7]                <xfs_stats_format+0x440>:    addis   r11,r2,-18
                          <xfs_stats_format+0x444>:    addi    r11,r11,-29768
                          <xfs_stats_format+0x448>:    std     r2,24(r1)
                          <xfs_stats_format+0x44c>:    ld      r12,32(r11)
                          <xfs_stats_format+0x450>:    mtctr   r12
                          <xfs_stats_format+0x454>:    bctr
                          <xfs_stats_format+0x458>:    .long 0x0
                          <xfs_stats_format+0x45c>:    andi.   r20,r27,30050
                          <xfs_stats_format+0x460>:    .long 0x59a5b0
                          <xfs_stats_format+0x464>:    lfs     f0,0(0)
  ppc64[8]                <xfs_stats_format+0x468>:    addis   r11,r2,-18
                          <xfs_stats_format+0x46c>:    addi    r11,r11,-29728
                          <xfs_stats_format+0x470>:    std     r2,24(r1)
                          <xfs_stats_format+0x474>:    ld      r12,32(r11)
                          <xfs_stats_format+0x478>:    mtctr   r12
                          <xfs_stats_format+0x47c>:    bctr
                          <xfs_stats_format+0x480>:    .long 0x0
                          <xfs_stats_format+0x484>:    andi.   r20,r27,30050
                          <xfs_stats_format+0x488>:    .long 0xaabd70
                          <xfs_stats_format+0x48c>:    lfs     f0,0(0)
  ppc64[9]                <xfs_stats_format+0x490>:    addis   r11,r2,-18
                          <xfs_stats_format+0x494>:    addi    r11,r11,-29688
                          <xfs_stats_format+0x498>:    std     r2,24(r1)
                          <xfs_stats_format+0x49c>:    ld      r12,32(r11)
                          <xfs_stats_format+0x4a0>:    mtctr   r12
                          <xfs_stats_format+0x4a4>:    bctr
                          <xfs_stats_format+0x4a8>:    .long 0x0
                          <xfs_stats_format+0x4ac>:    andi.   r20,r27,30050
                          <xfs_stats_format+0x4b0>:    .long 0xa55f20
                          <xfs_stats_format+0x4b4>:    lfs     f0,0(0)
  ppc64[10]               <xfs_stats_format+0x4b8>:    addis   r11,r2,-18
                          <xfs_stats_format+0x4bc>:    addi    r11,r11,-29648
                          <xfs_stats_format+0x4c0>:    std     r2,24(r1)
                          <xfs_stats_format+0x4c4>:    ld      r12,32(r11)
                          <xfs_stats_format+0x4c8>:    mtctr   r12
                          <xfs_stats_format+0x4cc>:    bctr
                          <xfs_stats_format+0x4d0>:    .long 0x0
                          <xfs_stats_format+0x4d4>:    andi.   r20,r27,30050
                          <xfs_stats_format+0x4d8>:    .long 0x59a730
                          <xfs_stats_format+0x4dc>:    lfs     f0,0(0)
  ppc64[11]               <xfs_stats_format+0x4e0>:    addis   r11,r2,-18
                          <xfs_stats_format+0x4e4>:    addi    r11,r11,-29608
                          <xfs_stats_format+0x4e8>:    std     r2,24(r1)
                          <xfs_stats_format+0x4ec>:    ld      r12,32(r11)
                          <xfs_stats_format+0x4f0>:    mtctr   r12
                          <xfs_stats_format+0x4f4>:    bctr
                          <xfs_stats_format+0x4f8>:    .long 0x0
                          <xfs_stats_format+0x4fc>:    andi.   r20,r27,30050
                          <xfs_stats_format+0x500>:    .long 0x1249840
                          <xfs_stats_format+0x504>:    lfs     f0,0(0)
  ppc64[12]               <xfs_stats_format+0x508>:    ld      r12,16(r13)
                          <xfs_stats_format+0x50c>:    addis   r12,r12,-464
                          <xfs_stats_format+0x510>:    addi    r12,r12,3568
                          <xfs_stats_format+0x514>:    mtctr   r12
                          <xfs_stats_format+0x518>:    bctr
                          <xfs_stats_format+0x51c>:    .long 0x0
                          <xfs_stats_format+0x520>:    .long 0x0
                          <xfs_stats_format+0x524>:    andi.   r20,r27,30050
                          <xfs_stats_format+0x528>:    .long 0x78ef0
                          <xfs_stats_format+0x52c>:    lfs     f0,0(0)
  ppc64[13]               <xfs_stats_format+0x530>:    ld      r12,16(r13)
                          <xfs_stats_format+0x534>:    addis   r12,r12,-464
                          <xfs_stats_format+0x538>:    addi    r12,r12,3104
                          <xfs_stats_format+0x53c>:    mtctr   r12
                          <xfs_stats_format+0x540>:    bctr
                          <xfs_stats_format+0x544>:    .long 0x0
                          <xfs_stats_format+0x548>:    .long 0x0
                          <xfs_stats_format+0x54c>:    andi.   r20,r27,30050
                          <xfs_stats_format+0x550>:    .long 0x78d20
                          <xfs_stats_format+0x554>:    lfs     f0,0(0)
  ppc64[14]  ftrace[0]    <xfs_stats_format+0x558>:    .long 0x0
                          <xfs_stats_format+0x55c>:    .long 0x0
                          <xfs_stats_format+0x560>:    mflr    r0
                          <xfs_stats_format+0x564>:    bl      0xc0080000099c0d80 <xfs_stats_format+0x508>
                          <xfs_stats_format+0x568>:    mtlr    r0
                          <xfs_stats_format+0x56c>:    b       0xc0080000099c0014 <patch_free_livepatch+0xc>
             ftrace[1]    <xfs_stats_format+0x570>:    .long 0x0
                          <xfs_stats_format+0x574>:    .long 0x0
                          <xfs_stats_format+0x578>:    mflr    r0
                          <xfs_stats_format+0x57c>:    bl      0xc0080000099c0d80 <xfs_stats_format+0x508>
  ppc64[15]               <xfs_stats_format+0x580>:    mtlr    r0
                          <xfs_stats_format+0x584>:    b       0xc0080000099c0100 <patch_free_scaffold+0xc>
             ftrace[2]    <xfs_stats_format+0x588>:    .long 0x0
                          <xfs_stats_format+0x58c>:    .long 0x0
                          <xfs_stats_format+0x590>:    mflr    r0
                          <xfs_stats_format+0x594>:    bl      0xc0080000099c0d80 <xfs_stats_format+0x508>
                          <xfs_stats_format+0x598>:    mtlr    r0
                          <xfs_stats_format+0x59c>:    b       0xc0080000099c0244 <patch_find_object_by_name+0xc>
             ftrace[3]    <xfs_stats_format+0x5a0>:    .long 0x0
                          <xfs_stats_format+0x5a4>:    .long 0x0
  ppc64[16]               <xfs_stats_format+0x5a8>:    mflr    r0
                          <xfs_stats_format+0x5ac>:    bl      0xc0080000099c0d80 <xfs_stats_format+0x508>
                          <xfs_stats_format+0x5b0>:    mtlr    r0
                          <xfs_stats_format+0x5b4>:    b       0xc0080000099c037c <add_callbacks_to_patch_objects+0xc>
             ftrace[4]    <xfs_stats_format+0x5b8>:    .long 0x0
                          <xfs_stats_format+0x5bc>:    .long 0x0
                          <xfs_stats_format+0x5c0>:    mflr    r0
                          <xfs_stats_format+0x5c4>:    bl      0xc0080000099c0d80 <xfs_stats_format+0x508>
                          <xfs_stats_format+0x5c8>:    mtlr    r0
                          <xfs_stats_format+0x5cc>:    b       0xc0080000099c05ac <init_module+0xc>
  ppc64[17]  ftrace[5]    <xfs_stats_format+0x5d0>:    .long 0x0
                          <xfs_stats_format+0x5d4>:    .long 0x0
                          <xfs_stats_format+0x5d8>:    mflr    r0
                          <xfs_stats_format+0x5dc>:    bl      0xc0080000099c0d80 <xfs_stats_format+0x508>
                          <xfs_stats_format+0x5e0>:    mtlr    r0
                          <xfs_stats_format+0x5e4>:    b       0xc0080000099c0864 <kpatch_string+0xc>
             ftrace[6]    <xfs_stats_format+0x5e8>:    .long 0x0
                          <xfs_stats_format+0x5ec>:    .long 0x0
                          <xfs_stats_format+0x5f0>:    mflr    r0
                          <xfs_stats_format+0x5f4>:    bl      0xc0080000099c0d80 <xfs_stats_format+0x508>
  ppc64[18]               <xfs_stats_format+0x5f8>:    mtlr    r0
                          <xfs_stats_format+0x5fc>:    b       0xc0080000099c0884 <xfs_stats_format+0xc>
             (unused)     <xfs_stats_format+0x600>:    .long 0x0
                ..        <xfs_stats_format+0x604>:    .long 0x0
                ..        <xfs_stats_format+0x608>:    .long 0x0
                ..        <xfs_stats_format+0x60c>:    .long 0x0
                ..        <xfs_stats_format+0x610>:    .long 0x0
                ..        <xfs_stats_format+0x614>:    .long 0x0
                ..        <xfs_stats_format+0x618>:    .long 0x0
                ..        <xfs_stats_format+0x61c>:    .long 0x0
  ppc64[19]  full-        <xfs_stats_format+0x620>:    addis   r11,r2,-18                                       << klp-relocation
             klp-reloc    <xfs_stats_format+0x624>:    addi    r11,r11,-29288                                   << ppc64_stub_entry
             stub[0]      <xfs_stats_format+0x628>:    std     r2,24(r1)                                        << now tacked on *after*
                          <xfs_stats_format+0x62c>:    ld      r12,32(r11)                                      << the OOL-ftrace
                          <xfs_stats_format+0x630>:    mtctr   r12                                              << stubs
                          <xfs_stats_format+0x634>:    bctr                                                     <<
                          <xfs_stats_format+0x638>:    .long 0x0                                                <<
                          <xfs_stats_format+0x63c>:    andi.   r20,r27,30050                                    <<
                          <xfs_stats_format+0x640>:    .long 0x54e92b8                                          <<
                          <xfs_stats_format+0x644>:    lfs     f0,0(r8)                                         <<

And finally re-test the original problem, ftrace the livepatch-provided
function:

  $ SYSFS=/sys/kernel/debug/tracing
  $ echo 0 > $SYSFS/tracing_on
  $ echo > $SYSFS/set_ftrace_filter
  $ echo function > $SYSFS/current_tracer
  $ echo 'xfs_stats_format:mod:livepatch_module' >> $SYSFS/set_ftrace_filter
 
  # Double check the ftrace filter  
  $ cat $SYSFS/set_ftrace_filter
  xfs_stats_format [livepatch_module]
 
  # Bombs away 
  $ echo 1 > $SYSFS/tracing_on
  $ grep kpatch /sys/fs/xfs/stats/stats
  kpatch
  $ cat $SYSFS/trace
  # tracer: function
  #
  # entries-in-buffer/entries-written: 1/1   #P:8
  #
  #                                _-----=> irqs-off/BH-disabled
  #                               / _----=> need-resched
  #                              | / _---=> hardirq/softirq
  #                              || / _--=> preempt-depth
  #                              ||| / _-=> migrate-disable
  #                              |||| /     delay
  #           TASK-PID     CPU#  |||||  TIMESTAMP  FUNCTION
  #              | |         |   |||||     |         |
              grep-71247   [001] ..... 53756.730711: xfs_stats_format <-livepatch_handler

An entry in the trace buffer and no crash :)

--
Joe


