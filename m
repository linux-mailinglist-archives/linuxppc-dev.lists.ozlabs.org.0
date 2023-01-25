Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5E567BA0E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jan 2023 20:00:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2Cnv23Lnz3fBm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 06:00:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PTde9w7i;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=song@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PTde9w7i;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2Cn00yjdz3bSw
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 05:59:16 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D84CB615CB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jan 2023 18:59:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3DFFC43443
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jan 2023 18:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674673151;
	bh=1+fHPNsuc4MyRUEsG4OdIGfRnRLw/JQerFclCCmF56o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PTde9w7imqgs0pgPP6AqVjnLW+GuwUYHndQE3/GBWOz2x+UXEndbbAH95Lc94uKE0
	 H4nVaq/lOQfRx7jAKyK9F6uczAF+QnnrJUfCjD1Ica5mbRUJxx8uxD8X+b4sHJxZEF
	 AnT9PgkUHJkVUi1g11p4w1nYcj+/D2ea5MKdhlOadsJUhnCIpmQZGpaSV3CAUNnLC0
	 lnbtLu4xaFBmRSKybFU37U1NxmTKzWhQaTZwHS0nVrPLk4kmX9Uiv7yOyagZ06SGWx
	 Z3VrcsPehxqFOyrY+qEMLhikPeWirZzXdF/DAPWxX0D92cxbzsIQ44cfs6z8hsxUvS
	 k5dxobTPjTV1A==
Received: by mail-lj1-f174.google.com with SMTP id p25so21448647ljn.12
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jan 2023 10:59:11 -0800 (PST)
X-Gm-Message-State: AFqh2kro0U9mvRNZMb49fwT8ge5g2AsZ/jVl/QTXmVqviduxBQ/v0C81
	80brVqOZ5TQ851oK18Ng0SEedaFR3gPxXWqMu7E=
X-Google-Smtp-Source: AMrXdXv5/kxhPToUvpAcQu8ja3HWxsLjrG6uN+5VHpPT8t0KrrGIMo8aNaNviaMEEDEZKicHQfY3v4UDdpkfnNn7PSA=
X-Received: by 2002:a2e:b166:0:b0:284:b05a:9e82 with SMTP id
 a6-20020a2eb166000000b00284b05a9e82mr2072294ljm.479.1674673149881; Wed, 25
 Jan 2023 10:59:09 -0800 (PST)
MIME-Version: 1.0
References: <cover.1674617130.git.jpoimboe@kernel.org> <2f6329ffd9674df6ff57e03edeb2ca54414770ab.1674617130.git.jpoimboe@kernel.org>
 <CAPhsuW40jEiyp0ogsO6oH_frpFCmiioSHrMOKkwGcZ8_6w5dZA@mail.gmail.com>
 <20230125164609.wvuarciciyoqa3tb@treble> <CAPhsuW45k8Avx=Zfid1pxaeHAbLGgOcxbN_=DQOb8WdPx7fB+Q@mail.gmail.com>
 <20230125185316.ebvxecd7gsvgtudr@treble>
In-Reply-To: <20230125185316.ebvxecd7gsvgtudr@treble>
From: Song Liu <song@kernel.org>
Date: Wed, 25 Jan 2023 10:58:57 -0800
X-Gmail-Original-Message-ID: <CAPhsuW56Ztn7JGci7=tPO__EFTNP0Ccp-WSNRUnQ2e81kBZMNw@mail.gmail.com>
Message-ID: <CAPhsuW56Ztn7JGci7=tPO__EFTNP0Ccp-WSNRUnQ2e81kBZMNw@mail.gmail.com>
Subject: Re: [PATCH 2/2] powerpc/module_64: Fix "expected nop" error on module re-patching
To: Josh Poimboeuf <jpoimboe@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: live-patching@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 25, 2023 at 10:53 AM Josh Poimboeuf <jpoimboe@kernel.org> wrote:
>
> On Wed, Jan 25, 2023 at 09:36:02AM -0800, Song Liu wrote:
> > On Wed, Jan 25, 2023 at 8:46 AM Josh Poimboeuf <jpoimboe@kernel.org> wrote:
> > >
> > > On Tue, Jan 24, 2023 at 10:09:56PM -0800, Song Liu wrote:
> > > > > @@ -514,9 +515,18 @@ static int restore_r2(const char *name, u32 *instruction, struct module *me)
> > > > >         if (!instr_is_relative_link_branch(ppc_inst(*prev_insn)))
> > > > >                 return 0;
> > > > >
> > > > > -       if (*instruction != PPC_RAW_NOP()) {
> > > > > +       /*
> > > > > +        * For livepatch, the restore r2 instruction might have already been
> > > > > +        * written previously, if the referenced symbol is in a previously
> > > > > +        * unloaded module which is now being loaded again.  In that case, skip
> > > > > +        * the warning and the instruction write.
> > > > > +        */
> > > > > +       if (insn_val == PPC_INST_LD_TOC)
> > > > > +               return 0;
> > > >
> > > > Do we need "sym->st_shndx == SHN_LIVEPATCH" here?
> > >
> > > My original patch had that check, but I dropped it for simplicity.
> > >
> > > In the non-livepatch case, the condition should never be true, but it
> > > doesn't hurt to check it anyway.
> >
> > While this is the only place we use PPC_INST_LD_TOC, there is another
> > place we use "PPC_RAW_STD(_R2, _R1, R2_STACK_OFFSET)", which
> > is identical to PPC_INST_LD_TOC. So I am not quite sure whether this
> > happens for non-livepatch.
>
> It's not actually identical.  That's the "store r2 to the stack"
> counterpart to the load in PPC_INST_LD_TOC, which loads r2 from the
> stack.

Ooops.. I misread the code.

>
> For R_PPC_REL24 relocations, when calling a function which lives outside
> the module, 24 bits isn't enough to encode the relative branch target
> address.  So it has to save r2 (TOC pointer) to the stack, and branch to
> a stub, which then branches to the external function.
>
> When the external function returns execution to the instruction after
> the original branch, that instruction needs to restore the TOC pointer
> from the stack to r2.
>
> The compiler knows this, and emits the instruction after the branch as a
> NOP.  The module code replaces that NOP with a "restore r2 from the
> stack".  That's what restore_r2() does.
>
> Long story short, restore_r2() needs to ensure the instruction after the
> branch restores r2 from the stack.  If that instruction is already
> there, it doesn't need to do anything.

Thanks for the explanation!

Acked-by: Song Liu <song@kernel.org>
