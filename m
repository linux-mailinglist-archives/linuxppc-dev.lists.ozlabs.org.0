Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 54ACF2C7C8C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 02:52:13 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CkpBd5QB6zDqfX
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 12:52:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c41;
 helo=mail-oo1-xc41.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=MtN9L9WG; dkim-atps=neutral
Received: from mail-oo1-xc41.google.com (mail-oo1-xc41.google.com
 [IPv6:2607:f8b0:4864:20::c41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ckp8m6820zDqfH
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Nov 2020 12:50:32 +1100 (AEDT)
Received: by mail-oo1-xc41.google.com with SMTP id t23so2341390oov.4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Nov 2020 17:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3FFe8L+rgL2zboptbUV7EtC6C5VHrQtD+oggxlWx8gE=;
 b=MtN9L9WG3bpSFYFanIQnk8Dlfl4fjaVPCh/ImPfGJAvnRm7qcg5e4CPsRQ6YO2PXtt
 BjwAPr2cmVdQjpNH4luD/R10pm/zhIqRC+CEyt3+7t+Iu7Ylux47xglgYbz0BKEwWCIV
 neeGblhnXJTYu69Xm6oetQ+M8OMaBddtlICkq19lPQSsSjRvtNpF3oHvl/4AlHArlwGT
 qgFIDkkKvFc/OYmXcSilClw8aLrwnlISsXJJQYDnx8GR+Pm5Qpl9rPDb1luhynzdOm5V
 rSMrT4u4VxzvPZcLoi4Fl/C9CmDoVzlHnKtYjRz1zHVcRi/LVfeI/tC/Y8e/XBZFiems
 JAYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3FFe8L+rgL2zboptbUV7EtC6C5VHrQtD+oggxlWx8gE=;
 b=uJiMm15FTezBXgz3NfHDwNA/hUDEvvEPqu+Xkc2411TwATVdJzXcagYC0yA2C7NczR
 u5P/5zu2xEwWrr0xKRSweIM6+VkO95Ny1EqmeB670t8OZaLbxUg8GfucRS5Lb7q/irFX
 zSoXNZiWybY9C3rIr3ySBLPadTdxgcxrFqhDVfUuQVx+mTd+Ypt/8eu02j7jVg/1OZML
 1jbCl8A+J8y7EtSPKqNa/zMq1zaxyn/sopgsnThWk3CuvJebh7HfyvdPcC4INEXdD9ZS
 gmwOLujYtyK+C7f9c7xnwW195NYtNzd0buuN12aLZ+FotCssLk0JQdVFNuMDAhVn2D0T
 CGDw==
X-Gm-Message-State: AOAM533n0qzqxVYjkQsY3OfXm+jSDR5rOuT2N2qvr4u/iCtGxXNFkvH8
 23ifC2CPZNvgkDMV7kuOD3wgGllVuynq5oTbkdhAKQet+EimWw==
X-Google-Smtp-Source: ABdhPJwe3rRHrRHDXOjZkt86LSSKxJa6MIKwf+OKBSOr4aeEkSGT4Yc/69kMogB+Ot73EcYx2CvOWJCUHQ6p/Y8Qzv0=
X-Received: by 2002:a4a:3948:: with SMTP id x8mr3110860oog.80.1606701028832;
 Sun, 29 Nov 2020 17:50:28 -0800 (PST)
MIME-Version: 1.0
References: <20201127030238.763-1-jniethe5@gmail.com>
 <5c997bc4-c859-0db6-f167-37ca37819059@csgroup.eu>
 <874kl7y609.fsf@mpe.ellerman.id.au>
In-Reply-To: <874kl7y609.fsf@mpe.ellerman.id.au>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Mon, 30 Nov 2020 12:50:17 +1100
Message-ID: <CACzsE9r6GoFANSGw_6SK0R7SZGbU+U0_UvDLH9Pzj_LRBsHJQw@mail.gmail.com>
Subject: Re: [PATCH] powerpc: Allow relative pointers in bug table entries
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 30, 2020 at 12:42 PM Michael Ellerman <mpe@ellerman.id.au> wrot=
e:
>
> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> > Le 27/11/2020 =C3=A0 04:02, Jordan Niethe a =C3=A9crit :
> >> This enables GENERIC_BUG_RELATIVE_POINTERS on Power so that 32-bit
> >> offsets are stored in the bug entries rather than 64-bit pointers.
> >>
> >> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> >> ---
> >>   arch/powerpc/Kconfig           |  4 ++++
> >>   arch/powerpc/include/asm/bug.h | 37 ++++++++++++++++++++++++++++++++=
--
> >>   arch/powerpc/xmon/xmon.c       | 17 ++++++++++++++--
> >>   3 files changed, 54 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> >> index e9f13fe08492..294108e0e5c6 100644
> >> --- a/arch/powerpc/Kconfig
> >> +++ b/arch/powerpc/Kconfig
> >> @@ -311,6 +311,10 @@ config GENERIC_BUG
> >>      default y
> >>      depends on BUG
> >>
> >> +config GENERIC_BUG_RELATIVE_POINTERS
> >> +    def_bool y
> >> +    depends on GENERIC_BUG
> >> +
> >>   config SYS_SUPPORTS_APM_EMULATION
> >>      default y if PMAC_APM_EMU
> >>      bool
> >> diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm=
/bug.h
> >> index 338f36cd9934..d03d834042a1 100644
> >> --- a/arch/powerpc/include/asm/bug.h
> >> +++ b/arch/powerpc/include/asm/bug.h
> >> @@ -12,7 +12,11 @@
> >>   #ifdef CONFIG_DEBUG_BUGVERBOSE
> >>   .macro EMIT_BUG_ENTRY addr,file,line,flags
> >>       .section __bug_table,"aw"
> >> +#ifndef CONFIG_GENERIC_BUG_RELATIVE_POINTERS
> >
> > As far as I understand, as soon as CONFIG_BUG is selected, GENERIC_BUG =
is automatically selected so
> > GENERIC_BUG_RELATIVE_POINTERS is selected as well. Therefore this #ifnd=
ef is never possible.
>
> Yeah.
>
> There is one place in the generic code that has an ifndef CONFIG_GENERIC_=
BUG_RELATIVE_POINTERS
> but that's because it has to support arches that don't select it.
>
> In the arch code we know that it's enabled, so there should be no need
> for any ifdefs.
For 32bit, pointers are 4 bytes anyway so it would be pointless to
store a displacement, so won't we need some ifdefs for that?
>
> cheers
