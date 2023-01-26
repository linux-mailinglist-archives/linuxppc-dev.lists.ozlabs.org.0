Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA5267C3D2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 05:23:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2SJW66XJz3fDp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 15:23:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bcwaD85R;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bcwaD85R;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2SHX5ZPVz3cgp
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 15:23:04 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2AEB4B81B9F
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 04:23:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C29EEC433EF
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 04:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674706978;
	bh=wZ7PBz2jqDU4NDuGlZAPATfEy7lDMc9qS1F/oyAFONs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bcwaD85RmG0IF/8n9eiuYAxS1/mDWuiE7h92nOHq50+2X3uBTrYl2g1flqpKQ3bst
	 AaVXetWxjY7Ih6cD7DWMGyg3PJ5dI6/7CRmtd2RF5mGCFS0SOVe2OWaQJfJrwjBqK/
	 /wtAi/zz5L2swU4Tn/VwCik2aMS/Q5yMBdCGbHBj9/MTKtFTKNjkf9Iuh1LpI704gi
	 XTOyG/5FPcXwzkWkOd54rV6DOwJOcs5ze6GoJGlOaeL+tn9pfbiKvdYMCrnj08Qf4v
	 6DKALZRd68tzlM8/gJo2SRnlMoaLmCtONLcDbzqz/zhuUxL9xO45ZO7q/58/hFYBnJ
	 gUiv73BJnCqTg==
Received: by mail-ot1-f42.google.com with SMTP id f88-20020a9d03e1000000b00684c4041ff1so385819otf.8
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jan 2023 20:22:58 -0800 (PST)
X-Gm-Message-State: AFqh2ko4GZnAyqptMvli+dgRwIyGo9JcvYK0AD+bSa0uRxmAjWFl1pt9
	C4DA5FBIdMerHxg23bbvbww/78bl5n96JwNXM9o=
X-Google-Smtp-Source: AMrXdXufR6pDOeFuIyPbmDS6WVQNM1DgbYqV35b5aVOlVeaHNoWPRyY/PmXldGSKTEdajVesmoVacTD3KgGFr1aoMXE=
X-Received: by 2002:a05:6830:2330:b0:670:5fd5:1ea3 with SMTP id
 q16-20020a056830233000b006705fd51ea3mr1950794otg.85.1674706978079; Wed, 25
 Jan 2023 20:22:58 -0800 (PST)
MIME-Version: 1.0
References: <20221228-drop-qunused-arguments-v2-0-9adbddd20d86@kernel.org>
 <20221228-drop-qunused-arguments-v2-5-9adbddd20d86@kernel.org>
 <871qnjqmmq.fsf@mpe.ellerman.id.au> <CAK7LNAR2ASj6bGS6sR5x=cDCDDFW3ZkHRTdsHAY_+JEqojTUNQ@mail.gmail.com>
 <Y9HgXE9kmcfmva1C@dev-arch.thelio-3990X>
In-Reply-To: <Y9HgXE9kmcfmva1C@dev-arch.thelio-3990X>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 26 Jan 2023 13:22:21 +0900
X-Gmail-Original-Message-ID: <CAK7LNAROfEi7021v+SkDd=uU1hM_vzuGYvDD6OQ0bJ2Tu0yjvA@mail.gmail.com>
Message-ID: <CAK7LNAROfEi7021v+SkDd=uU1hM_vzuGYvDD6OQ0bJ2Tu0yjvA@mail.gmail.com>
Subject: Re: [PATCH v2 05/14] powerpc: Remove linker flag from KBUILD_AFLAGS
To: Nathan Chancellor <nathan@kernel.org>
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
Cc: nicolas@fjasle.eu, linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, ndesaulniers@google.com, npiggin@gmail.com, trix@redhat.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 26, 2023 at 11:07 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Thu, Jan 26, 2023 at 10:29:54AM +0900, Masahiro Yamada wrote:
> > On Wed, Jan 25, 2023 at 1:11 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
> > >
> > > Nathan Chancellor <nathan@kernel.org> writes:
> > > > When clang's -Qunused-arguments is dropped from KBUILD_CPPFLAGS, it
> > > > points out that KBUILD_AFLAGS contains a linker flag, which will be
> > > > used:
> > >
> > > Should that say "unused" ?
> >
> >
> >
> > Nathan, shall I fix it up locally?
> > (it will change the commit hash, though.)
>
> Yes please, if you would not mind. Sorry about that and thank you for
> spotting it Michael!
>
> Since you have to rebase to fix it, you can include Michael's acks?
>
> Cheers,
> Nathan



Done.








-- 
Best Regards
Masahiro Yamada
