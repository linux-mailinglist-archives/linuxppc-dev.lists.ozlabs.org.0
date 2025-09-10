Return-Path: <linuxppc-dev+bounces-12009-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A694CB52082
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Sep 2025 20:57:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cMVLT5ZGDz3dTC;
	Thu, 11 Sep 2025 04:57:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757530657;
	cv=none; b=lEGy9fgnfXWbEO0XLePUgvGYcgmzubf+tQ6zU7XmNalwrbPcQtx/cwNZy1Kp9zwJmv5vf94tnvzcoSmDwpKnHfigMneYJXGAQ8ADZU2tov+AdLwdidMopnPS2tmNSMFkm6i/IokJ/0EAB9UwN4nxxTSjb9eH3t0l7fWHrXO0TnEWc2W0eKvfQZCmBsZ7YPiTKlKpWu4Ua485k2RA0A7ryqvo43bVSs2Mpezz//UzjthXyrXT24ykmvMwQnzZs9ZrCQFEPHdYuCYjahijslkzGSsxOeY6yP6iO7PjXNWHqZacOFDZo90NKTo8UG6adxiSGJV3L9k4cygJu+blrQHdvA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757530657; c=relaxed/relaxed;
	bh=Ea+AX2skhS9xX4u063jV+d75ZTzeuk2sNFz+Vu41G1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lx25tubgmNoZWIAc1Pt6uZlrN5fqoZCYsb12bcxqajvBpDk6n+3VbQxS+kI2Y1BK5A80smNExGeZtNGiu9rvRzFcr/GEgvjf7q1ELsrm0JWQfJXYql8HFfD7eJ5L1Oqgf6lUhQ3cqmhfriRGCa7Nx6CNk0KJt59UlL+KB3lgoBfoJVmdWa+mGD57RTiMhKQ8QuqnhPitfad506//ryeF0uuKtaff/EN9it3ztM2My0iIXdLhKGbR6BVHJ0qPn0BmEvIRH6KoNSUlcL8vJqQl3xY5EUYql4j4lsNmKJQbEzLIXpDLd8PftdYdMoJoLkZWeItd0wCTPwSIZlC3qzSZ1A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NJYI9tLW; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NJYI9tLW; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=joe.lawrence@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NJYI9tLW;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NJYI9tLW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=joe.lawrence@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cMVLS2wBVz3dSj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Sep 2025 04:57:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757530650;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ea+AX2skhS9xX4u063jV+d75ZTzeuk2sNFz+Vu41G1s=;
	b=NJYI9tLW95wHOmS4indDHpQnCex/q3M2THuMsFo2qRwFh1ckQZZ2nGXtyimUyVs97tT+gB
	AGiH9r35yoDu75Pl721RxCmcxxmDNcD0eFpO1J1PG5iVTJzTrIxZ8xLVKwa5abUyipSg86
	u9MuY5beWHhU60Jrdua7C+zHScIq/WY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757530650;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ea+AX2skhS9xX4u063jV+d75ZTzeuk2sNFz+Vu41G1s=;
	b=NJYI9tLW95wHOmS4indDHpQnCex/q3M2THuMsFo2qRwFh1ckQZZ2nGXtyimUyVs97tT+gB
	AGiH9r35yoDu75Pl721RxCmcxxmDNcD0eFpO1J1PG5iVTJzTrIxZ8xLVKwa5abUyipSg86
	u9MuY5beWHhU60Jrdua7C+zHScIq/WY=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-612-17mCFRQSOkSouaB78RkdDA-1; Wed,
 10 Sep 2025 14:57:26 -0400
X-MC-Unique: 17mCFRQSOkSouaB78RkdDA-1
X-Mimecast-MFC-AGG-ID: 17mCFRQSOkSouaB78RkdDA_1757530645
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1FE6619560BA;
	Wed, 10 Sep 2025 18:57:24 +0000 (UTC)
Received: from redhat.com (unknown [10.2.20.50])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 115451956095;
	Wed, 10 Sep 2025 18:57:21 +0000 (UTC)
Date: Wed, 10 Sep 2025 14:57:19 -0400
From: Joe Lawrence <joe.lawrence@redhat.com>
To: Naveen N Rao <naveen@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, live-patching@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc64/modules: fix ool-ftrace-stub vs. livepatch
 relocation corruption
Message-ID: <aMHKD_X97uu0tUyK@redhat.com>
References: <20250904022950.3004112-1-joe.lawrence@redhat.com>
 <aLj7c13wVPvkdNxc@redhat.com>
 <2tscft2yyndfbkl2a7ltndqfwx7phajkfma3m6o5phpm3xkme2@dcy6ohdbfhsk>
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
In-Reply-To: <2tscft2yyndfbkl2a7ltndqfwx7phajkfma3m6o5phpm3xkme2@dcy6ohdbfhsk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Sep 08, 2025 at 04:33:24PM +0530, Naveen N Rao wrote:
> On Wed, Sep 03, 2025 at 10:37:39PM -0400, Joe Lawrence wrote:
> > On Wed, Sep 03, 2025 at 10:29:50PM -0400, Joe Lawrence wrote:
> > > The powerpc64 module .stubs section holds ppc64_stub_entry[] code
> > > trampolines that are generated at module load time. These stubs are
> > > necessary for function calls to external symbols that are too far away
> > > for a simple relative branch.
> > >
> > > Logic for finding an available ppc64_stub_entry has relied on a sentinel
> > > value in the funcdata member to indicate a used slot. Code iterates
> > > through the array, inspecting .funcdata to find the first unused (zeroed)
> > > entry:
> > >
> > >   for (i = 0; stub_func_addr(stubs[i].funcdata); i++)
> > >
> > > To support CONFIG_PPC_FTRACE_OUT_OF_LINE, a new setup_ftrace_ool_stubs()
> > > function extended the .stubs section by adding an array of
> > > ftrace_ool_stub structures for each patchable function. A side effect
> > > of writing these smaller structures is that the funcdata sentinel
> > > convention is not maintained.
>
> There is clearly a bug in how we are reserving the stubs as you point
> out further below, but once that is properly initialized, I don't think
> the smaller structure size for ftrace_ool_stub matters (in so far as
> stub->funcdata being non-NULL). We end up writing four valid powerpc
> instructions, along with a ftrace_ops pointer before those instructions
> which should also be non-zero (there is a bug here too, more on that
> below).  The whole function descriptor dance does complicate matters a
> bit though.
>

Hi Naveen,

Ah hah, I see now, given the other bug that you mention, we should have
had seen non-NULL entries in either ftrace_ool_stub.insn[] or .ftrace_op
fields such that when read as ppc64_stub_entry, .funcdata would indicate
that it's in use:

        ppc64_stub_entry[]  ftrace_ool_stub[]
  0x00  [0].jump[0]         [0].ftrace_op
  0x04  [0].jump[1]         [0].ftrace_op
  0x08  [0].jump[2]         [0].insn[0]
  0x0C  [0].jump[3]         [0].insn[1]
  0x10  [0].jump[4]         [0].insn[2]
  0x14  [0].jump[5]         [0].insn[3]
  0x18  [0].jump[6]         [1].ftrace_op
  0x1C  [0].magic           [1].ftrace_op
  0x20  [0].funcdata        [1].insn[0]    <<
  0x24  [0].funcdata        [1].insn[1]    <<
  0x28  [1].jump[0]         [1].insn[2]
  0x2C  [1].jump[1]         [1].insn[3]
  0x30  [1].jump[2]         [2].ftrace_op
  0x34  [1].jump[3]         [2].ftrace_op
  0x38  [1].jump[4]         [2].insn[0]
  0x3C  [1].jump[5]         [2].insn[1]
  0x40  [1].jump[6]         [2].insn[2]
  0x44  [1].magic           [2].insn[3]
  0x48  [1].funcdata        [3].ftrace_op  <<
  0x4C  [1].funcdata        [3].ftrace_op  <<

If the commit msg for this patch would be clearer by rewording anything,
I'm happy to update.  (My understanding at the time of writing was that
the NULL funcdata vs. insn[]/ftrace_op was a valid sequence.)

> > > This is not a problem for an ordinary
> > > kernel module, as this occurs in module_finalize(), after which no
> > > further .stubs updates are needed.
> > >
> > > However, when loading a livepatch module that contains klp-relocations,
> > > apply_relocate_add() is executed a second time, after the out-of-line
> > > ftrace stubs have been set up.
> > >
> > > When apply_relocate_add() then calls stub_for_addr() to handle a
> > > klp-relocation, its search for the next available ppc64_stub_entry[]
> > > slot may stop prematurely in the middle of the ftrace_ool_stub array. A
> > > full ppc64_stub_entry is then written, corrupting the ftrace stubs.
> > >
> > > Fix this by explicitly tracking the count of used ppc64_stub_entrys.
> > > Rather than relying on an inline funcdata sentinel value, a new
> > > stub_count is used as the explicit boundary for searching and allocating
> > > stubs. This simplifies the code, eliminates the "one extra reloc" that
> > > was required for the sentinel check, and resolves the memory corruption.
> > >
> >
> > Apologies if this is too wordy, I wrote it as a bit of a braindump to
> > summarize the longer analysis at the bottom of the reply ...
>
> This was a good read, thanks for all the details. It did help spot
> another issue.
>
> >
> > > Fixes: eec37961a56a ("powerpc64/ftrace: Move ftrace sequence out of line")
> > > Signed-off-by: Joe Lawrence <joe.lawrence@redhat.com>
> > > ---
> > >  arch/powerpc/include/asm/module.h |  1 +
> > >  arch/powerpc/kernel/module_64.c   | 26 ++++++++------------------
> > >  2 files changed, 9 insertions(+), 18 deletions(-)
> > >
> > > diff --git a/arch/powerpc/include/asm/module.h b/arch/powerpc/include/asm/module.h
> > > index e1ee5026ac4a..864e22deaa2c 100644
> > > --- a/arch/powerpc/include/asm/module.h
> > > +++ b/arch/powerpc/include/asm/module.h
> > > @@ -27,6 +27,7 @@ struct ppc_plt_entry {
> > >  struct mod_arch_specific {
> > >  #ifdef __powerpc64__
> > >  	unsigned int stubs_section;	/* Index of stubs section in module */
> > > +	unsigned int stub_count;	/* Number of stubs used */
> > >  #ifdef CONFIG_PPC_KERNEL_PCREL
> > >  	unsigned int got_section;	/* What section is the GOT? */
> > >  	unsigned int pcpu_section;	/* .data..percpu section */
> > > diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_64.c
> > > index 126bf3b06ab7..2a44bc8e2439 100644
> > > --- a/arch/powerpc/kernel/module_64.c
> > > +++ b/arch/powerpc/kernel/module_64.c
> > > @@ -209,8 +209,7 @@ static unsigned long get_stubs_size(const Elf64_Ehdr *hdr,
> > >  				    char *secstrings,
> > >  				    struct module *me)
> > >  {
> > > -	/* One extra reloc so it's always 0-addr terminated */
> > > -	unsigned long relocs = 1;
> > > +	unsigned long relocs = 0;
> > >  	unsigned i;
> > >
> > >  	/* Every relocated section... */
> > > @@ -705,7 +704,7 @@ static unsigned long stub_for_addr(const Elf64_Shdr *sechdrs,
> > >
> > >  	/* Find this stub, or if that fails, the next avail. entry */
> > >  	stubs = (void *)sechdrs[me->arch.stubs_section].sh_addr;
> > > -	for (i = 0; stub_func_addr(stubs[i].funcdata); i++) {
> > > +	for (i = 0; i < me->arch.stub_count; i++) {
> > >  		if (WARN_ON(i >= num_stubs))
> > >  			return 0;
> > >
> > > @@ -716,6 +715,7 @@ static unsigned long stub_for_addr(const Elf64_Shdr *sechdrs,
> > >  	if (!create_stub(sechdrs, &stubs[i], addr, me, name))
> > >  		return 0;
> > >
> > > +	me->arch.stub_count++;
> > >  	return (unsigned long)&stubs[i];
> > >  }
> > >
> > > @@ -1118,29 +1118,19 @@ int module_trampoline_target(struct module *mod, unsigned long addr,
> > >  static int setup_ftrace_ool_stubs(const Elf64_Shdr *sechdrs, unsigned long addr, struct module *me)
> > >  {
> > >  #ifdef CONFIG_PPC_FTRACE_OUT_OF_LINE
> > > -	unsigned int i, total_stubs, num_stubs;
> > > +	unsigned int total_stubs, num_stubs;
> > >  	struct ppc64_stub_entry *stub;
> > >
> > >  	total_stubs = sechdrs[me->arch.stubs_section].sh_size / sizeof(*stub);
> > >  	num_stubs = roundup(me->arch.ool_stub_count * sizeof(struct ftrace_ool_stub),
> > >  			    sizeof(struct ppc64_stub_entry)) / sizeof(struct ppc64_stub_entry);
> > >
> > > -	/* Find the next available entry */
> > > -	stub = (void *)sechdrs[me->arch.stubs_section].sh_addr;
> > > -	for (i = 0; stub_func_addr(stub[i].funcdata); i++)
> > > -		if (WARN_ON(i >= total_stubs))
> > > -			return -1;
> > > -
> > > -	if (WARN_ON(i + num_stubs > total_stubs))
> > > +	if (WARN_ON(me->arch.stub_count + num_stubs > total_stubs))
> > >  		return -1;
> > >
> > > -	stub += i;
> > > -	me->arch.ool_stubs = (struct ftrace_ool_stub *)stub;
> > > -
> > > -	/* reserve stubs */
> > > -	for (i = 0; i < num_stubs; i++)
> > > -		if (patch_u32((void *)&stub->funcdata, PPC_RAW_NOP()))
> > > -			return -1;
> >
> > At first I thought the bug was that this loop was re-writting the same
> > PPC_RAW_NOP() to the same funcdata (i.e, should have been something
> > like: patch_u32((void *)stub[i]->funcdata, PPC_RAW_NOP())), but that
> > didn't work and seemed fragile anyway.
>
> D'uh - this path was clearly never tested. I suppose this should have
> been something like this:
> 	patch_ulong((void *)&stub[i]->funcdata, func_desc(local_paca))
>
> Still convoluted, but I think that should hopefully fix the problem you
> are seeing.
>

I can still try something like this if you prefer that solution (though
I think there may be some type massaging required in the second argument
to patch_ulong().)  LMK ...

> >
> > > +	stub = (void *)sechdrs[me->arch.stubs_section].sh_addr;
> > > +	me->arch.ool_stubs = (struct ftrace_ool_stub *)(stub + me->arch.stub_count);
> > > +	me->arch.stub_count += num_stubs;
> > >  #endif
>
> Regardless of the above, your proposed change looks good to me and
> simplifies the logic. So:
> Acked-by: Naveen N Rao (AMD) <naveen@kernel.org>
>



> >   crash> dis 0xc008000007d70dd0 42
> >   ppc64[ ]   ftrace[0]    <xfs_stats_format+0x558>:    .long 0x0
> >                           <xfs_stats_format+0x55c>:    .long 0x0
> >                           <xfs_stats_format+0x560>:    mflr    r0
> >                           <xfs_stats_format+0x564>:    bl      0xc008000007d70d80 <xfs_stats_format+0x508>
> >                           <xfs_stats_format+0x568>:    mtlr    r0
> >                           <xfs_stats_format+0x56c>:    b       0xc008000007d70014 <patch_free_livepatch+0xc>
> >              ftrace[1]    <xfs_stats_format+0x570>:    .long 0x0
> >                           <xfs_stats_format+0x574>:    .long 0x0
> >                           <xfs_stats_format+0x578>:    mflr    r0
> >                           <xfs_stats_format+0x57c>:    bl      0xc008000007d70d80 <xfs_stats_format+0x508>
> >   ppc64[ ]                <xfs_stats_format+0x580>:    addis   r11,r2,4                                         << This looks like a full
> >                           <xfs_stats_format+0x584>:    addi    r11,r11,-29448                                   << ppc64_stub_entry
> >              ftrace[2]    <xfs_stats_format+0x588>:    std     r2,24(r1)                                        << dropped in the middle
> >                           <xfs_stats_format+0x58c>:    ld      r12,32(r11)                                      << of the ool_stubs array
> >                           <xfs_stats_format+0x590>:    mtctr   r12                                              << of ftrace_ool_stub[]
> >                           <xfs_stats_format+0x594>:    bctr                                                     <<
> >                           <xfs_stats_format+0x598>:    mtlr    r0                                               <<
> >                           <xfs_stats_format+0x59c>:    andi.   r20,r27,30050                                    <<
> >              ftrace[3]    <xfs_stats_format+0x5a0>:    .long 0x54e92b8                                          <<
> >                           <xfs_stats_format+0x5a4>:    lfs     f0,0(r8)                                         <<
> >   ppc64[ ]                <xfs_stats_format+0x5a8>:    mflr    r0
> >                           <xfs_stats_format+0x5ac>:    bl      0xc008000007d70d80 <xfs_stats_format+0x508>
> >                           <xfs_stats_format+0x5b0>:    mtlr    r0
> >                           <xfs_stats_format+0x5b4>:    b       0xc008000007d7037c <add_callbacks_to_patch_objects+0xc>
> >              ftrace[4]    <xfs_stats_format+0x5b8>:    .long 0x0
> >                           <xfs_stats_format+0x5bc>:    .long 0x0
>
> These NULL values are also problematic. I think those are NULL since we
> are not "reserving" the stubs properly, but those should point to some
> ftrace_op. I think we are missing a call to ftrace_rec_set_nop_ops() in
> ftrace_init_nop(), which would be good to do separately.
>

Very lightly tested, but were you thinking of something like:

diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index 6dca92d5a..687371c64 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -488,8 +488,12 @@ int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec)
 		return ret;

 	/* Set up out-of-line stub */
-	if (IS_ENABLED(CONFIG_PPC_FTRACE_OUT_OF_LINE))
-		return ftrace_init_ool_stub(mod, rec);
+	if (IS_ENABLED(CONFIG_PPC_FTRACE_OUT_OF_LINE)) {
+		ret = ftrace_init_ool_stub(mod, rec);
+		if (ret)
+			return ret;
+		return ftrace_rec_set_nop_ops(rec);
+	}

 	/* Nop-out the ftrace location */
 	new = ppc_inst(PPC_RAW_NOP());
@@ -520,7 +524,7 @@ int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec)
 		return -EINVAL;
 	}

-	return ret;
+	return ftrace_rec_set_nop_ops(rec);
 }

 int ftrace_update_ftrace_func(ftrace_func_t func)


In which case the ftrace-ool area looks like:

  crash> mod | grep livepatch_module
  c008000006350500  livepatch_module                   c008000009b90000   262144  (not loaded)  [CONFIG_KALLSYMS]
  crash> struct module.arch.ool_stubs c008000006350500
    arch.ool_stubs = 0xc008000009b90dd0 <xfs_stats_format+1368>,
  crash> struct module.arch.ool_stub_count c008000006350500
    arch.ool_stub_count = 7,

  crash> struct ftrace_ool_stub 0xc008000009b90dd0 7
  struct ftrace_ool_stub {
    ftrace_op = 0xc00000000131d140 <ftrace_nop_ops>,
    insn = {0x7c0802a6, 0x4bffffa5, 0x7c0803a6, 0x4bfff230}
  }

  struct ftrace_ool_stub {
    ftrace_op = 0xc00000000131d140 <ftrace_nop_ops>,
    insn = {0x7c0802a6, 0x4bffff8d, 0x7c0803a6, 0x4bfff304}
  }

  struct ftrace_ool_stub {
    ftrace_op = 0xc00000000131d140 <ftrace_nop_ops>,
    insn = {0x7c0802a6, 0x4bffff75, 0x7c0803a6, 0x4bfff430}
  }

  struct ftrace_ool_stub {
    ftrace_op = 0xc00000000131d140 <ftrace_nop_ops>,
    insn = {0x7c0802a6, 0x4bffff5d, 0x7c0803a6, 0x4bfff550}
  }

  struct ftrace_ool_stub {
    ftrace_op = 0xc00000000131d140 <ftrace_nop_ops>,
    insn = {0x7c0802a6, 0x4bffff45, 0x7c0803a6, 0x4bfff768}
  }

  struct ftrace_ool_stub {
    ftrace_op = 0xc00000000131d140 <ftrace_nop_ops>,
    insn = {0x7c0802a6, 0x4bffff2d, 0x7c0803a6, 0x4bfffa08}
  }

  struct ftrace_ool_stub {
    ftrace_op = 0xc00000000131d140 <ftrace_nop_ops>,
    insn = {0x7c0802a6, 0x4bffff15, 0x7c0803a6, 0x4bfffa10}
  }


--
Joe


