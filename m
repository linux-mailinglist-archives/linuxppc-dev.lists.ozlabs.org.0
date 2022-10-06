Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D16ED5F708F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 23:57:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mk4zR5VzCz3bj4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Oct 2022 08:57:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JiMSB/Aa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JiMSB/Aa;
	dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mk4yT54mjz2xZ7
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Oct 2022 08:56:16 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id l4so2895613plb.8
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Oct 2022 14:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=xLUB0E3LfbszQ4qFdgdItsy+sBeI19HoAo47UM2h3l8=;
        b=JiMSB/AaGi1Dt/0zATolvZ1MmhfJAuWSjFSVI8AlOkb8LoebaB3hZVTn21zom8DgpM
         gDnkAR2oeHzdji9F9Sy11Gkuw//FMLmLSoEaNCYQiYiAVED1jws7Ejnz+vnK+SbUmuq9
         FsxQvCkteG6HZ9ZwWzu30ooP7z+Jwbi9wPi8d9Ng/TGiPdRi3sf1otj0yakGqxYAfL3R
         3YulMz7vY2bi3h99Oqc1VPV/FvLgTQJg1ucdviCXNBJleoeU2GEud4R/cjoY4svlmWfJ
         wS0Qm+7+b4JWDFf2ySoA+IugHSraouxRIIM5zaWe1hlqu+6NPBD4j9R0t0E7xC7RkkwL
         KXYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=xLUB0E3LfbszQ4qFdgdItsy+sBeI19HoAo47UM2h3l8=;
        b=rLK13TpE9FzLa7cyP1z7jCL+a6Ie3zUYndHHq2whNAHqHv3+5cVfYhD38wpSAd+ypY
         uz/CgiNyeEjRHwtH4dkuoq8wNmGhaF3cFztswaU0Yksgty7MSWC7xB3OK/QZB7mfSGqt
         +AmZ9lb+yzXA+pToseNnDbTExj6kXrpl2TzN7fOZ2o0A3+ZhRMadRf5vruVChgAbjwol
         SuEDvsTjRP5qii+8ab08zregD3Py2T5jMODJaTrSyL+4JxB3bdZLNq8PDxlIPLsTGjyd
         cvTAvOqj2ZAs+fv4a80yBIS4G1Ae7CTwkFWzZMlUA8jZf3j2Da36Mmue7nrY/e7iWUL6
         5g2w==
X-Gm-Message-State: ACrzQf0MH6/Y1T4nm/RmN0Vauyuhdhvc2OO78gzGVZYxgBYYXWRo/GB6
	cxYP62vYKcM5hkTR2sEK2fMuoiZGcwE=
X-Google-Smtp-Source: AMsMyM7vBb8O9rXHs7a1gyj4sFwjyzTgCrI/WWuUSPkeD/vL5w++NDcxENhVgN5lAlaGyw6n2Ixi4g==
X-Received: by 2002:a17:90a:4888:b0:203:6d42:ccae with SMTP id b8-20020a17090a488800b002036d42ccaemr1819174pjh.166.1665093374936;
        Thu, 06 Oct 2022 14:56:14 -0700 (PDT)
Received: from localhost ([118.208.156.99])
        by smtp.gmail.com with ESMTPSA id l14-20020a170903120e00b0017f74cab9eesm96586plh.128.2022.10.06.14.56.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Oct 2022 14:56:13 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 07 Oct 2022 07:56:09 +1000
Message-Id: <CNF6C5XSIE75.3R12NULNLHEN2@bobo>
Subject: Re: [PATCH] powerpc/64s: POWER10 CPU Kconfig build option
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Segher Boessenkool" <segher@kernel.crashing.org>
X-Mailer: aerc 0.11.0
References: <20220923033004.536127-1-npiggin@gmail.com>
 <20221006195411.GS25951@gate.crashing.org>
In-Reply-To: <20221006195411.GS25951@gate.crashing.org>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri Oct 7, 2022 at 5:54 AM AEST, Segher Boessenkool wrote:
> Hi!
>
> On Fri, Sep 23, 2022 at 01:30:04PM +1000, Nicholas Piggin wrote:
> > This adds basic POWER10_CPU option, which builds with -mcpu=3Dpower10.
>
> > +# No prefix or pcrel
> > +KBUILD_CFLAGS +=3D $(call cc-option,-mno-prefixed)
> > +KBUILD_CFLAGS +=3D $(call cc-option,-mno-pcrel)
>
> Why do you disable all prefixed insns?  What goes wrong if you don't?

Potentially things like kprobes.

> Same question for pcrel.  I'm sure you want to optimise it better, but
> it's not clear to me how it fails now?

For pcrel addressing? Bootstrapping the C environment is one, the
module dynamic linker is another.

Some details in this series.

https://lists.ozlabs.org/pipermail/linuxppc-dev/2022-September/248521.html

>
> Please say in the comment what is wrong, don't spread fear :-)
>
> > +# No AltiVec or VSX or MMA instructions when building kernel
> >  KBUILD_CFLAGS +=3D $(call cc-option,-mno-altivec)
> >  KBUILD_CFLAGS +=3D $(call cc-option,-mno-vsx)
> > +KBUILD_CFLAGS +=3D $(call cc-option,-mno-mma)
>
> MMA code is never generated unless the code asks for it explicitly.
> This is fundamental, not just an implementations side effect.

Well, now it double won't be generated :)

Thanks,
Nick
