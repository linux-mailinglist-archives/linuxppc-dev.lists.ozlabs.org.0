Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7900B67B9EF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jan 2023 19:54:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2CgF1G0wz3cf1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 05:54:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fU4tHnGm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fU4tHnGm;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2CfD3nbWz3bSw
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 05:53:24 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id DA159B81B95;
	Wed, 25 Jan 2023 18:53:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AD45C433D2;
	Wed, 25 Jan 2023 18:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674672798;
	bh=ySiX2eF1vZukYsf5N23nsuVwoa68LgZrCTTePp/8IWc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fU4tHnGmgQLup3dXzJbl2xbW2Tfvm4D5d+ldUDZZ5+7sUDuSYuGQEkYy/1wavT8jd
	 K1z+uCe27CYGJRjeEO/wKhvJJwQ74mItTJcuv4vx+abTGly8wkEwSuuGcmFtCmoDk/
	 8aP8xBDMWDDKTPjDeKmY7ddc+Z+izeyNXVhTAYaYRhTc03dRr+snE9U3O4JdMwDJlr
	 npfDoJ4c0Zym8+1lJWVdxU0ypFyAbssyFddut39m4WOtBpW4/UlsXh2UNao111P2cA
	 aQ4pkDbaZg4kQhtoxZxMAkHSzyOoMibPkqxzY2Yjj/BQqP8TaxjgiGkFS6K8FX8TOv
	 ONKAGoynszqrA==
Date: Wed, 25 Jan 2023 10:53:16 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Song Liu <song@kernel.org>
Subject: Re: [PATCH 2/2] powerpc/module_64: Fix "expected nop" error on
 module re-patching
Message-ID: <20230125185316.ebvxecd7gsvgtudr@treble>
References: <cover.1674617130.git.jpoimboe@kernel.org>
 <2f6329ffd9674df6ff57e03edeb2ca54414770ab.1674617130.git.jpoimboe@kernel.org>
 <CAPhsuW40jEiyp0ogsO6oH_frpFCmiioSHrMOKkwGcZ8_6w5dZA@mail.gmail.com>
 <20230125164609.wvuarciciyoqa3tb@treble>
 <CAPhsuW45k8Avx=Zfid1pxaeHAbLGgOcxbN_=DQOb8WdPx7fB+Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPhsuW45k8Avx=Zfid1pxaeHAbLGgOcxbN_=DQOb8WdPx7fB+Q@mail.gmail.com>
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

On Wed, Jan 25, 2023 at 09:36:02AM -0800, Song Liu wrote:
> On Wed, Jan 25, 2023 at 8:46 AM Josh Poimboeuf <jpoimboe@kernel.org> wrote:
> >
> > On Tue, Jan 24, 2023 at 10:09:56PM -0800, Song Liu wrote:
> > > > @@ -514,9 +515,18 @@ static int restore_r2(const char *name, u32 *instruction, struct module *me)
> > > >         if (!instr_is_relative_link_branch(ppc_inst(*prev_insn)))
> > > >                 return 0;
> > > >
> > > > -       if (*instruction != PPC_RAW_NOP()) {
> > > > +       /*
> > > > +        * For livepatch, the restore r2 instruction might have already been
> > > > +        * written previously, if the referenced symbol is in a previously
> > > > +        * unloaded module which is now being loaded again.  In that case, skip
> > > > +        * the warning and the instruction write.
> > > > +        */
> > > > +       if (insn_val == PPC_INST_LD_TOC)
> > > > +               return 0;
> > >
> > > Do we need "sym->st_shndx == SHN_LIVEPATCH" here?
> >
> > My original patch had that check, but I dropped it for simplicity.
> >
> > In the non-livepatch case, the condition should never be true, but it
> > doesn't hurt to check it anyway.
> 
> While this is the only place we use PPC_INST_LD_TOC, there is another
> place we use "PPC_RAW_STD(_R2, _R1, R2_STACK_OFFSET)", which
> is identical to PPC_INST_LD_TOC. So I am not quite sure whether this
> happens for non-livepatch.

It's not actually identical.  That's the "store r2 to the stack"
counterpart to the load in PPC_INST_LD_TOC, which loads r2 from the
stack.

For R_PPC_REL24 relocations, when calling a function which lives outside
the module, 24 bits isn't enough to encode the relative branch target
address.  So it has to save r2 (TOC pointer) to the stack, and branch to
a stub, which then branches to the external function.

When the external function returns execution to the instruction after
the original branch, that instruction needs to restore the TOC pointer
from the stack to r2.

The compiler knows this, and emits the instruction after the branch as a
NOP.  The module code replaces that NOP with a "restore r2 from the
stack".  That's what restore_r2() does.

Long story short, restore_r2() needs to ensure the instruction after the
branch restores r2 from the stack.  If that instruction is already
there, it doesn't need to do anything.

-- 
Josh
