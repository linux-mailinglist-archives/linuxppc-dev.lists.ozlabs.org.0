Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F393F2152
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Aug 2021 22:06:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GrG3p4skJz3bZK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Aug 2021 06:05:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=FJybV/Ni;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=210.131.2.83;
 helo=conssluserg-04.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=FJybV/Ni; 
 dkim-atps=neutral
Received: from conssluserg-04.nifty.com (conssluserg-04.nifty.com
 [210.131.2.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GrG340gPqz2yR8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Aug 2021 06:05:19 +1000 (AEST)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177]) (authenticated)
 by conssluserg-04.nifty.com with ESMTP id 17JK4ou7026786
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Aug 2021 05:04:51 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 17JK4ou7026786
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1629403491;
 bh=8hjQkClvKSbKvju+DhtDTCJuXhxcdg5TLaUR+EqdtQg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=FJybV/NiBh+b5QWSjP8cl5qYq1ZNVBbZSco64rce4sOVnI0rd0qx+ihfdT1tVW5ha
 HfPejgLYLDPnPAvq2tOZ+KT9E4ylSJj43AL+1x7KBh44TircNetDJPmUioNuv+M9UW
 KzYVjRcizURSowJjLFzxo8cO810U0GhUofXfv78CMxYC9T44ZPqeRFNh3ZBsTPJD1S
 adAonPfbQB8ZMhu77FZSqtAH+XdyfrmtlyVDrJZPc0O53OPZf8ra+J4DRcpUt57p3s
 +vie6S2p2NqSD3gjLncpktxkXC21eTJHtWlir4ttEB71cY48i6MK+w+w/fL3lraG9C
 8/k0kWpAwTaQQ==
X-Nifty-SrcIP: [209.85.214.177]
Received: by mail-pl1-f177.google.com with SMTP id j2so158153pll.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Aug 2021 13:04:51 -0700 (PDT)
X-Gm-Message-State: AOAM532+aOo5aLWfq4jICDqQho4B9z+jKkcuEEL9SJ5M2mTH1v/nk6SV
 QzhNZb1zMNmp7MfyeU/skaFv2xFqCEohRULkNF4=
X-Google-Smtp-Source: ABdhPJxnUC0AY//iMezqYAYLMqXCNtAJECV2jieKTY8HPz6eY4jOaI/yOn+2XM2h12nuQv/f8ZxczmP0Vxl7iVG4+tw=
X-Received: by 2002:a17:90a:a581:: with SMTP id
 b1mr454883pjq.153.1629403490185; 
 Thu, 19 Aug 2021 13:04:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210817002109.2736222-1-ndesaulniers@google.com>
 <20210817002109.2736222-4-ndesaulniers@google.com>
 <87a6lghkdj.fsf@mpe.ellerman.id.au>
In-Reply-To: <87a6lghkdj.fsf@mpe.ellerman.id.au>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 20 Aug 2021 05:04:13 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR2E8XDRrfVCis_qxDs3-dnf-HfqxkcYOMemqns7pgcmQ@mail.gmail.com>
Message-ID: <CAK7LNAR2E8XDRrfVCis_qxDs3-dnf-HfqxkcYOMemqns7pgcmQ@mail.gmail.com>
Subject: Re: [PATCH 3/7] powerpc: replace cc-option-yn uses with cc-option
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
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 17, 2021 at 11:31 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Nick Desaulniers <ndesaulniers@google.com> writes:
> > cc-option-yn can be replaced with cc-option. ie.
> > Checking for support:
> > ifeq ($(call cc-option-yn,$(FLAG)),y)
> > becomes:
> > ifneq ($(call cc-option,$(FLAG)),)
> >
> > Checking for lack of support:
> > ifeq ($(call cc-option-yn,$(FLAG)),n)
> > becomes:
> > ifeq ($(call cc-option,$(FLAG)),)
> >
> > This allows us to pursue removing cc-option-yn.
> >
> > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> > Cc: Paul Mackerras <paulus@samba.org>
> > Cc: linuxppc-dev@lists.ozlabs.org
> > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> > ---
> >  arch/powerpc/Makefile      | 12 ++++++------
> >  arch/powerpc/boot/Makefile |  5 +----
> >  2 files changed, 7 insertions(+), 10 deletions(-)
> >
> > diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> > index 9aaf1abbc641..85e224536cf7 100644
> > --- a/arch/powerpc/Makefile
> > +++ b/arch/powerpc/Makefile
> > @@ -12,12 +12,12 @@
> >  # Rewritten by Cort Dougan and Paul Mackerras
> >  #
> >
> > -HAS_BIARCH   := $(call cc-option-yn, -m32)
> > +HAS_BIARCH   := $(call cc-option,-m32)
> >
> >  # Set default 32 bits cross compilers for vdso and boot wrapper
> >  CROSS32_COMPILE ?=
> >
> > -ifeq ($(HAS_BIARCH),y)
> > +ifeq ($(HAS_BIARCH),-m32)
>
> I don't love that we have to repeat "-m32" in each check.
>
> I'm pretty sure you can use ifdef here, because HAS_BIARCH is a simple
> variable (assigned with ":=").
>
> ie, this can be:
>
>   ifdef HAS_BIARCH
>
>
> And that avoids having to spell out "-m32" everywhere.
>
> cheers


Yes.

Comments from Nathan and Michael
both sound good.

-- 
Best Regards
Masahiro Yamada
