Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 097D51FA3B5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 00:49:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49m62Y51LfzDqcJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 08:49:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::543;
 helo=mail-ed1-x543.google.com; envelope-from=samitolvanen@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=M8vn4Uj3; dkim-atps=neutral
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49m4gp0RsNzDqG8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jun 2020 07:47:42 +1000 (AEST)
Received: by mail-ed1-x543.google.com with SMTP id y6so7385086edi.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jun 2020 14:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BB1YkDgb1TtnU58w4brmUgWlmXp8JC/Gj9BUjRlor2w=;
 b=M8vn4Uj3o+fAbFqq2rgvyL1/nkgmiNZTlDfMvhhD8Epkb+VDBJmLRHxsOlU+xgtiH6
 aITNkOMMWeUYAxhcoq+ax6wmOFOY3ZFDg8m/88bRYPJ72onvyoFvDtdTN0A3A0tClOAI
 QaRmjFCpdPfnyL80ZCTzIGyNeEz51cUVECO4TYW+7I3iE8hR/FvQrAzLXsiyMywz6Yv8
 FvlRDxEwceesr5mkofA46gic/5P4uZWqA//ddUZpi6h6ie7le3TTka5YcuDzzUuxbfm4
 TbCQPeyd2Br54RUWbM0RmtQeCk4rXZ61ZlSSC9hcvH7Tg2a+U8VtGFbU419QXqX+Bwqf
 B2ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BB1YkDgb1TtnU58w4brmUgWlmXp8JC/Gj9BUjRlor2w=;
 b=eXRLuHLATNMe3G5dahDKUpeIVDy6M4NvsOnfHeeY8lf5FViyh/YA2vaV5F5PmZ1R+G
 yJ4R8KHb2qUYRxpJv6a3ndvNQsMRtHwdSxwz7n3Gjn1145E9xN7K5oUsfB31Sd1lL3o0
 EHtf1iKi8Na/MgVdLsnlxQa3bzOscp6edF91W8+2vBEJrBpyp6paFDwm+RhzTkMqjADw
 kSMXHVzkAOv5ayR3lPlMdDKulbPLXhXqUKisXbX8BcvsV4MGu5v7Q2cZNo3hM3jcL8kU
 GIHpZquklUVq3VNZmR4utuiN0Y6TZnbE/UrqprtfLR6Mi+VeymMD8WSJ5I/5mX1+PwYA
 aMXA==
X-Gm-Message-State: AOAM533pg7btDVUyOTjqVRZwSMQ4uL0w+HwCoKTCrnTiuDwaYb1W0YDJ
 aCQ/bceSkET8feWi0dz4q8dtgFmE/9v7VFrU2FNdgg==
X-Google-Smtp-Source: ABdhPJy+XsXVdspc9qVg5TDksYXAdSPQwBa788hmG6HcvWOIRktSF0I6TVfG+RbE2aiJL+Q4+mlwR4cePRzLuYV24UY=
X-Received: by 2002:a05:6402:1592:: with SMTP id
 c18mr27041367edv.40.1592257658022; 
 Mon, 15 Jun 2020 14:47:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200521202716.193316-1-samitolvanen@google.com>
 <CAK7LNARq3g5vA6vy9449SHsKQmbwJrQDSBz4ZbH1pBEvPmusuA@mail.gmail.com>
 <CAK7LNASm2t-Dkr+p_EWvqf_eoKn5R2iXWuBHnTB9n6MUxr3-pQ@mail.gmail.com>
 <1590226253.lnkg0jun9x.astroid@bobo.none>
 <CAK7LNAR_-q3jhaUzDpkC3ej_DpAerzMsORT-tFw_3AwX7xM0Yw@mail.gmail.com>
In-Reply-To: <CAK7LNAR_-q3jhaUzDpkC3ej_DpAerzMsORT-tFw_3AwX7xM0Yw@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 15 Jun 2020 14:47:27 -0700
Message-ID: <CABCJKufaMU1z-s4S+dHhg0iCyVynLGwsFJgYnYyiBaR=mZt-8w@mail.gmail.com>
Subject: Re: [PATCH] kbuild: reuse vmlinux.o in vmlinux_link
To: Masahiro Yamada <masahiroy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 16 Jun 2020 08:37:35 +1000
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
Cc: Michal Marek <michal.lkml@markovi.net>, Kees Cook <keescook@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, May 23, 2020 at 8:13 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Hi Nicholas,
> (+CC: Sam Ravnborg)
>
>
> On Sat, May 23, 2020 at 7:06 PM Nicholas Piggin <npiggin@gmail.com> wrote:
> >
> > Excerpts from Masahiro Yamada's message of May 23, 2020 3:44 am:
> > > + Michael, and PPC ML.
> > >
> > > They may know something about the reason of failure.
> >
> > Because the linker can't put branch stubs within object code sections,
> > so when you incrementally link them too large, the linker can't resolve
> > branches into other object files.
>
>
> Ah, you are right.
>
> So, this is a problem not only for PPC
> but also for ARM (both 32 and 64 bit), etc.
>
> ARM needs to insert a veneer to jump far.
>
> Prior to thin archive, we could not compile
> ARCH=arm allyesconfig because
> drivers/built-in.o was too large.
>
> This patch gets us back to the too large
> incremental object situation.
>
> With my quick compile-testing,
> ARCH=arm allyesconfig
> and ARCH=arm64 allyesconfig are broken.

Thanks for looking into this! Clang doesn't appear to have this issue
with LTO because it always enables both -ffunction-sections and
-fdata-sections. I confirmed that -ffunction-sections also fixes arm64
allyesconfig with this patch. While I'm fine with reusing vmlinux.o
only with LTO, how would you feel about enabling -ffunction-sections
in the kernel by default?

Sami
