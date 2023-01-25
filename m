Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4325567B8B2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jan 2023 18:37:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P29yD0RZ1z3fBT
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 04:37:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aJ55On6T;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=song@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aJ55On6T;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P29xK2pYqz2xHb
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 04:36:21 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3BF4D615A0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jan 2023 17:36:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EDCFC433EF
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jan 2023 17:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674668176;
	bh=HIRhQFRsenIpGbfr60wVwlvaqGvdjpK2FqZYpaiCKwo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=aJ55On6TL/U9WNEaQakd6jSX0Dc5vKvgiohGPnAkWpdRKG9os8X9C7JhUyAbRwYCT
	 bzYDMjmCKbx8Qt7aqHtSFKGPDZDysodYMWsoOlZWBtoHgfmKuOIyVZpWEX0glWuuQk
	 egxUp1/OwtGlhTPSmAk+YYc2pfJf37HFCBwQjbHPAdI3dWwzasXhEtKnzTN63kq1Ne
	 Ou6srYLqxXeJOQOvMaiqBLdifsuOVMmgJF+S5ZjMEjKP/dqATwDNDtxyxXFf771sOZ
	 0RpBFtzT2IwIvQnjME667DoMJV7kCI2hVIALOz0f09aM9K5OCPnkptFYGUc/qNQCsg
	 Gmbdx/zQX7V5w==
Received: by mail-lf1-f54.google.com with SMTP id cf42so30205684lfb.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jan 2023 09:36:16 -0800 (PST)
X-Gm-Message-State: AFqh2kov5BgfhvC5jL0yxtdRIIwRDtQXkAosLsu4XU95W6Yt8hDnWbDP
	anXuyiuBURBj4ORFEnOgGnZ2wm0+Y+vaiwbRBtc=
X-Google-Smtp-Source: AMrXdXvhPt/s3DaLoFekOs0k/EkuWPTCApiwCxC5zZ9oekC5jwXgYcZfDtkaPZzojcQseFAKz4Wb7VdPPjbKlkUBJX0=
X-Received: by 2002:a05:6512:2115:b0:4cb:1d3e:685b with SMTP id
 q21-20020a056512211500b004cb1d3e685bmr1788108lfr.126.1674668174651; Wed, 25
 Jan 2023 09:36:14 -0800 (PST)
MIME-Version: 1.0
References: <cover.1674617130.git.jpoimboe@kernel.org> <2f6329ffd9674df6ff57e03edeb2ca54414770ab.1674617130.git.jpoimboe@kernel.org>
 <CAPhsuW40jEiyp0ogsO6oH_frpFCmiioSHrMOKkwGcZ8_6w5dZA@mail.gmail.com> <20230125164609.wvuarciciyoqa3tb@treble>
In-Reply-To: <20230125164609.wvuarciciyoqa3tb@treble>
From: Song Liu <song@kernel.org>
Date: Wed, 25 Jan 2023 09:36:02 -0800
X-Gmail-Original-Message-ID: <CAPhsuW45k8Avx=Zfid1pxaeHAbLGgOcxbN_=DQOb8WdPx7fB+Q@mail.gmail.com>
Message-ID: <CAPhsuW45k8Avx=Zfid1pxaeHAbLGgOcxbN_=DQOb8WdPx7fB+Q@mail.gmail.com>
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

On Wed, Jan 25, 2023 at 8:46 AM Josh Poimboeuf <jpoimboe@kernel.org> wrote:
>
> On Tue, Jan 24, 2023 at 10:09:56PM -0800, Song Liu wrote:
> > > @@ -514,9 +515,18 @@ static int restore_r2(const char *name, u32 *instruction, struct module *me)
> > >         if (!instr_is_relative_link_branch(ppc_inst(*prev_insn)))
> > >                 return 0;
> > >
> > > -       if (*instruction != PPC_RAW_NOP()) {
> > > +       /*
> > > +        * For livepatch, the restore r2 instruction might have already been
> > > +        * written previously, if the referenced symbol is in a previously
> > > +        * unloaded module which is now being loaded again.  In that case, skip
> > > +        * the warning and the instruction write.
> > > +        */
> > > +       if (insn_val == PPC_INST_LD_TOC)
> > > +               return 0;
> >
> > Do we need "sym->st_shndx == SHN_LIVEPATCH" here?
>
> My original patch had that check, but I dropped it for simplicity.
>
> In the non-livepatch case, the condition should never be true, but it
> doesn't hurt to check it anyway.

While this is the only place we use PPC_INST_LD_TOC, there is another
place we use "PPC_RAW_STD(_R2, _R1, R2_STACK_OFFSET)", which
is identical to PPC_INST_LD_TOC. So I am not quite sure whether this
happens for non-livepatch.

Thanks,
Song
