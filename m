Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFB35A11AD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Aug 2022 15:15:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MD3P64bcYz3bl4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Aug 2022 23:15:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=NhCxbVHN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=kernel.org (client-ip=210.131.2.83; helo=conssluserg-04.nifty.com; envelope-from=masahiroy@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=NhCxbVHN;
	dkim-atps=neutral
Received: from conssluserg-04.nifty.com (unknown [210.131.2.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MD3NT32yqz2xHw
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Aug 2022 23:15:04 +1000 (AEST)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50]) (authenticated)
	by conssluserg-04.nifty.com with ESMTP id 27PDEjUW017381
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Aug 2022 22:14:45 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 27PDEjUW017381
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1661433286;
	bh=SJNmtkjdIkCl5hveS91ZyBASL+ugc4Xm8jPlARtsttc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NhCxbVHNsFRsvOuajERRZsxE3kvcmiH2Cp+j1UDpNJBhWs9NBXp/qfmZyeiyMMIC+
	 aluIBHlUOcB2bX8wVrk7CvJKk2JDyiHG4akwXmfb7WE86efHkblbDF6ZcADUMsIWWT
	 jN22hGsdMyj4YhtKAXigNoTVFRIqyylRovDOr7Y+++FYtZboMvFvCbL4t1hXx2xx9A
	 KiJ/z7qYvnG4Y0ndrIHYnAYhdXUWrZJelUGUjWTqB/87ECjblU1yx/4kKKTSGfN0T1
	 bsTa4zRxj40VvvTejrL8Xk1PpxRboGKr7wdK3Pp9YZsuJmHIOljAmNDxCwopLnTcn2
	 FW/AnP6IGkGpw==
X-Nifty-SrcIP: [209.85.210.50]
Received: by mail-ot1-f50.google.com with SMTP id r1-20020a056830418100b0063938f634feso6657565otu.8
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Aug 2022 06:14:45 -0700 (PDT)
X-Gm-Message-State: ACgBeo0+PRA6460qcP6EtIk3mgUWitXV8cFtu87SeYsvtuBOB2nYgAQo
	kfHLgL2qgTY/9llhU0dDfwcpdTKMCVnCb5OJVoE=
X-Google-Smtp-Source: AA6agR7ZkJxTM3y3PB/xIrO0W28fx5DJGvSNCnLpwnNNby4Y+5I4tk9ot0W1eVhETrsf6kGoZHUq99z47zdMuaWZb3c=
X-Received: by 2002:a9d:4806:0:b0:637:cdca:f8d3 with SMTP id
 c6-20020a9d4806000000b00637cdcaf8d3mr1379359otf.225.1661433284587; Thu, 25
 Aug 2022 06:14:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220820165129.1147589-1-masahiroy@kernel.org> <874jy0lpy9.fsf@mpe.ellerman.id.au>
In-Reply-To: <874jy0lpy9.fsf@mpe.ellerman.id.au>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 25 Aug 2022 22:13:56 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ8ZQHYzoJTPxiRYBsdVXdYUt=bxyrag-d7UnwQ9r7q=w@mail.gmail.com>
Message-ID: <CAK7LNAQ8ZQHYzoJTPxiRYBsdVXdYUt=bxyrag-d7UnwQ9r7q=w@mail.gmail.com>
Subject: Re: [PATCH] powerpc: align syscall table for ppc32
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Nicholas Piggin <npiggin@gmail.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 25, 2022 at 4:53 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Masahiro Yamada <masahiroy@kernel.org> writes:
> > Christophe Leroy reported that commit 7b4537199a4a ("kbuild: link
> > symbol CRCs at final link,  removing CONFIG_MODULE_REL_CRCS") broke
> > mpc85xx_defconfig + CONFIG_RELOCATABLE=y.
> >
> >     LD      vmlinux
> >     SYSMAP  System.map
> >     SORTTAB vmlinux
> >     CHKREL  vmlinux
> >   WARNING: 451 bad relocations
> >   c0b312a9 R_PPC_UADDR32     .head.text-0x3ff9ed54
> >   c0b312ad R_PPC_UADDR32     .head.text-0x3ffac224
> >   c0b312b1 R_PPC_UADDR32     .head.text-0x3ffb09f4
> >   c0b312b5 R_PPC_UADDR32     .head.text-0x3fe184dc
> >   c0b312b9 R_PPC_UADDR32     .head.text-0x3fe183a8
> >       ...
> >
> > The compiler emits a bunch of R_PPC_UADDR32, which is not supported by
> > arch/powerpc/kernel/reloc_32.S.
> >
> > The reason is there exists an unaligned symbol.
> >
> >   $ powerpc-linux-gnu-nm -n vmlinux
> >     ...
> >   c0b31258 d spe_aligninfo
> >   c0b31298 d __func__.0
> >   c0b312a9 D sys_call_table
> >   c0b319b8 d __func__.0
> >
> > Commit 7b4537199a4a is not the root cause. Even before that, I can
> > reproduce the same issue for mpc85xx_defconfig + CONFIG_RELOCATABLE=y
> > + CONFIG_MODVERSIONS=n.
> >
> > It is just that nobody did not notice it because when CONFIG_MODVERSIONS



I wrote weird English (double negation)


nobody did not notice   --> nobody noticed



Please fix it if you have not yet.


Thank you.





> > is enabled, a __crc_* symbol inserted before sys_call_table was hiding
> > the unalignment issue.
> >
> > I checked the commit history, but I could not understand commit
> > 46b45b10f142 ("[POWERPC] Align the sys_call_table").
> >
> > It said 'Our _GLOBAL macro does a ".align 2" so the alignment is fine
> > for 32 bit'. I checked the _GLOBAL in include/asm-powerpc/ppc_asm.h
> > at that time. _GLOBAL specifies ".align 2" for ppc64, but no .align
> > for ppc32.
> >
> > Commit c857c43b34ec ("powerpc: Don't use a function descriptor for
> > system call table") removed _GLOBAL from the syscall table.
> >
> > Anyway, adding alignment to the syscall table for ppc32 fixes the issue.
> >
> > I am not giving Fixes tag because I do not know since when it has been
> > broken, but presumably it has been for a long while.
>
> Thanks.
>
> I trimmed the change log a bit just to say ~= it's been broken for ever,
> and added a Cc to stable.
>
> cheers






-- 
Best Regards
Masahiro Yamada
