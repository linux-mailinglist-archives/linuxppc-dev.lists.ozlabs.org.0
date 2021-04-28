Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BCEDB36D050
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Apr 2021 03:34:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FVLl15vWtz30CZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Apr 2021 11:34:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=s0XyQudJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2b;
 helo=mail-yb1-xb2b.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=s0XyQudJ; dkim-atps=neutral
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FVLkb2p3cz2xMd
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Apr 2021 11:33:42 +1000 (AEST)
Received: by mail-yb1-xb2b.google.com with SMTP id 130so27984635ybd.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Apr 2021 18:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LcoLsON92ufC6avzQd5ISwSwN9YcqNjio4BD0RFj14k=;
 b=s0XyQudJ9znl6kdcYU0f93STwwBPfXhiYeAyh9BmtNVRfL4OMvOYM3tmfgzXw4fYOG
 DjmEOj2U8nxdttlnqrS+l7h9xU7c+tSyI9+PeV6b9zGWxcnpLPJSR0IeW9HbxixHre/J
 lxCaCOXTZDNsbMBvZAYS+Jv7l0FbhJ5LothmvLE0AjLmidEp0DKbntTc5LYozN6zOw3u
 pse900ubGch3clgrz9jZtI2uVoCV4Fo6kc957iTaCaK3A1IvREt7EfuL0FM9oZb5jkmp
 OW41sjPqhAumfyLCSoBoCVe2Mnb4hDH4dC8/KxDXDYzACtLh4ldMLvLEU2g4OpwGAja8
 bQpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LcoLsON92ufC6avzQd5ISwSwN9YcqNjio4BD0RFj14k=;
 b=Ms/elVLbqCucxV/UvRgF1HUKeV04/b3v/QXu73+1eTuW5g/IVNsiaACgsnFnY3wrUf
 2uGSrDMnvx0q31mCXtgXin1Eismek8IuaI1adGht42edQcv1bChYKQFsb9YnCd2Hu8l0
 wb26fiFAdGjI6hEW6LdVJWO6Ey+7orKIXcXoBqNaceIiI2Rs+rNFIYGWWHU/wkeSRrbh
 ZxvU8cHlJ1vuqXF/kIp+nvjssaiT88Xl5VoUdtrhTkE2mEVgDfhjYH8385lH5U+f3mdb
 XMDlsRNBC1XzkODUq3TiyO6IKZarHhqaIBCsQZxY1/T5LJOZ3K5TSyustNOKOOrkTWTG
 nLFA==
X-Gm-Message-State: AOAM530dzqklJ6v06aqqOdIiVqRWC7dxsUQLOG3bupFJGNkHciCdOCcn
 jRJIimsodYC160zugObbN+6biZK3hZa3bGNT9zI=
X-Google-Smtp-Source: ABdhPJxpOvqltvWayel5pFsQoFOnmD02+RM4igoxgj4fvQVJbDbJCtXHBUZvr8OoLKnIDf5gG5aRxYumpJZrZ0mBEOM=
X-Received: by 2002:a25:e64b:: with SMTP id d72mr20598946ybh.343.1619573617495; 
 Tue, 27 Apr 2021 18:33:37 -0700 (PDT)
MIME-Version: 1.0
References: <YIWNZI4YhFuRZwHg@latitude>
In-Reply-To: <YIWNZI4YhFuRZwHg@latitude>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Wed, 28 Apr 2021 11:33:24 +1000
Message-ID: <CACzsE9qOj2Fp4A9dYopQddw1oc7w--BCe_2_3xJfEo=d9WoC1Q@mail.gmail.com>
Subject: Re: PPC32: Boot regression on Nintendo Wii, after create_branch
 rework in 5.8
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Alistair Popple <alistair@popple.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 26, 2021 at 1:40 AM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:
>
> Hi,
>
> I recently booted my Wii again, and I noticed a regression at boot time.
> Output stops after the "Finalizing device tree... flat tree at 0xXXXXXX"
> message. I bisected it to this commit in the 5.8 development cycle:
>
> commit 7c95d8893fb55869882c9f68f4c94840dc43f18f
> Author: Jordan Niethe <jniethe5@gmail.com>
> Date:   Wed May 6 13:40:25 2020 +1000
>
>     powerpc: Change calling convention for create_branch() et. al.
>
>     create_branch(), create_cond_branch() and translate_branch() return t=
he
>     instruction that they create, or return 0 to signal an error. Separat=
e
>     these concerns in preparation for an instruction type that is not jus=
t
>     an unsigned int.  Fill the created instruction to a pointer passed as
>     the first parameter to the function and use a non-zero return value t=
o
>     signify an error.
>
>     Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
>     Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>     Reviewed-by: Alistair Popple <alistair@popple.id.au>
>     Link: https://lore.kernel.org/r/20200506034050.24806-6-jniethe5@gmail=
.com
>
>  arch/powerpc/include/asm/code-patching.h |  12 +--
>  arch/powerpc/kernel/optprobes.c          |  24 +++---
>  arch/powerpc/kernel/setup_32.c           |   4 +-
>  arch/powerpc/kernel/trace/ftrace.c       |  24 +++---
>  arch/powerpc/lib/code-patching.c         | 134 ++++++++++++++++++-------=
------
>  arch/powerpc/lib/feature-fixups.c        |   5 +-
>  6 files changed, 119 insertions(+), 84 deletions(-)
>
>
> Do you have any hints on how to debug and/or fix this issue?
Thanks for bisecting and reporting.
The "Finalizing device tree... flat tree at 0xXXXXXX" message comes
from the bootwrapper so if that is the last output it must be crashing
pretty early.
Commit 7c95d8893fb5 ("powerpc: Change calling convention for
create_branch() et. al.") made a change to machine_init() in
setup_32.c which seems like it might be a likely culprit for causing
early crashing.
The branch that is created and patched is just for optimization, so to
see if that is in fact the problem it might be worth trying to boot
with a patch like below

diff --git a/arch/powerpc/kernel/setup_32.c b/arch/powerpc/kernel/setup_32.=
c
--- a/arch/powerpc/kernel/setup_32.c
+++ b/arch/powerpc/kernel/setup_32.c
@@ -87,9 +87,6 @@ notrace void __init machine_init(u64 dt_ptr)

        patch_instruction_site(&patch__memcpy_nocache, ppc_inst(PPC_INST_NO=
P));

-       create_cond_branch(&insn, addr, branch_target(addr), 0x820000);
-       patch_instruction(addr, insn);  /* replace b by bne cr0 */
-
        /* Do some early initialization based on the flat device tree */
        early_init_devtree(__va(dt_ptr));

>
>
> Best regards,
> Jonathan Neusch=C3=A4fer
