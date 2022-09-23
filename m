Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E10D5E74C8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 09:22:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYkBg13J5z3cdp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 17:22:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=doKjYKq/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=doKjYKq/;
	dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYkB34g1kz3bxY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 17:22:18 +1000 (AEST)
Received: by mail-pj1-x1033.google.com with SMTP id q15-20020a17090a304f00b002002ac83485so4609612pjl.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 00:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=NM12uAdAkEDyTw7Uwzdyc87KnMbXUa8Ge07u4/ELyFg=;
        b=doKjYKq/GJALx91AIePQf8V4fAlKDXkbLG+OpaD7UwfRV8zR6WFYuB7WNxme2mnF2q
         3rnx/YkcIW5y1ViAiClFsVkf0b/xkf1y6Cn16GfexhNjrh1Nb/+7WkgYTrmUDCBYrb8u
         xXrqPIRDAQCxgdq6G8HxcQa4Hp8L/m6IBp+yOqlRtBDVfBFZkeI7PUiJBFbdxFCTH+Zw
         JYw8j+p+aA5X4wZAOdZdXk/M3pcdcTMDVGmDTH6x8qqoqVGhafVCQCZxVvyiGBcA4VRk
         ttgG0IfizrTvdrbubL30ceRet7bMQCRPu8PA7Mzbx3DMcN+ENaKQTSsMBG8YrkTD8Izx
         76sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=NM12uAdAkEDyTw7Uwzdyc87KnMbXUa8Ge07u4/ELyFg=;
        b=Xeb5H32D621oh+ZqNm22899larHkW6xwwW1MttazniO9/U2I+Icl7N1Y03/2p5Q034
         TpyC9rhYeymBlYRdIoj0j8IIHGi8pjd8b/0oiYuCK13xL4WqKxSRI2+jLCeFrScwyttH
         eio7fw2zWMTInDKvOxhFZS2GZGNf8ZYcKtkANQRVzowKplizUMXBHr7d0f/cqJX574e8
         H90RaS2Dsg6x4ws6K2gZOrVRpjAnzmFifctdgJBJweeynHv0B5VQz0qjHW337KksFcJY
         VpdhX0bVmzfs8sbOp+mJpVQDrAfsRFF/cV9HRyMm5XV8L3qHn9ppr/DnzCWQt1Cb9yvT
         0rUA==
X-Gm-Message-State: ACrzQf1/rVacXFstaOQpPFakjWuRWBy+AYUQLX0Sf0YMCk+RtRXAaeRZ
	431bDYww4TPbkMDL/xINnCs=
X-Google-Smtp-Source: AMsMyM4fK2OwmZ0zAxN1rGPfEqUGs+KHHRe6y1Z2erNvgaFA6+/5MATkwExyD61d3Gd5tCrrC41SRg==
X-Received: by 2002:a17:903:234c:b0:178:1a7c:28a5 with SMTP id c12-20020a170903234c00b001781a7c28a5mr6917538plh.32.1663917736660;
        Fri, 23 Sep 2022 00:22:16 -0700 (PDT)
Received: from localhost (27-32-155-116.static.tpgi.com.au. [27.32.155.116])
        by smtp.gmail.com with ESMTPSA id j4-20020a63e744000000b0040caab35e5bsm4894066pgk.89.2022.09.23.00.22.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Sep 2022 00:22:15 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Sep 2022 17:22:11 +1000
Message-Id: <CN3LLXC2YX9W.2QKWH8GWTOQW2@bobo>
Subject: Re: [RFC PATCH 5/7] powerpc/64s: update generic cpu option name and
 compiler flags
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Segher Boessenkool" <segher@kernel.crashing.org>
X-Mailer: aerc 0.11.0
References: <20220919140149.4018927-1-npiggin@gmail.com>
 <20220919140149.4018927-6-npiggin@gmail.com>
 <20220920221608.GB25951@gate.crashing.org> <CN1O97PLNVSM.VDXMAFRIPU9S@bobo>
 <20220921152245.GD25951@gate.crashing.org>
In-Reply-To: <20220921152245.GD25951@gate.crashing.org>
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
Cc: linuxppc-dev@lists.ozlabs.org, Alan Modra <amodra@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu Sep 22, 2022 at 1:22 AM AEST, Segher Boessenkool wrote:
> Hi!
>
> On Wed, Sep 21, 2022 at 11:01:18AM +1000, Nicholas Piggin wrote:
> > On Wed Sep 21, 2022 at 8:16 AM AEST, Segher Boessenkool wrote:
> > > On Tue, Sep 20, 2022 at 12:01:47AM +1000, Nicholas Piggin wrote:
> > > > Update the 64s GENERIC_CPU option. POWER4 support has been dropped,=
 so
> > > > make that clear in the option name.
> > >
> > > AFAIR the minimum now is POWER4+ (ISA 2.01), not POWER5 (ISA 2.02).
> >=20
> > It's POWER5 now, because of commit 471d7ff8b5 ("powerpc/64s: Remove
> > POWER4 support"), which is misguided about POWER4+ and also introduced
> > the -mcpu=3Dpower5 bug on 970 builds :\
>
> ISA 2.01 added just a few things (LPES[0], HDEC, some PM things, but
> crucially also anything that sets MSR[PR] also sets MSR[EE] since then).

Ah, right. Some Book3 cleanups mainly.

> > Not sure it's worth adding POWER4+ support back but if someone has a
> > POWER4+ or adds it to QEMU TCG, I will do the patch.
>
> 970 is 2.01 -- pretending it is 2.02 is a ticking time bomb: the popcntb
> insn will be generated for popcount and parity intrinsics, which can be
> generated by generic code!

Yeah agreed, it was an error on my part with that original patch.

> > > > -mtune=3D before power8 is dropped because the minimum gcc version
> > > > supports power8, and tuning is made consistent between big and litt=
le
> > > > endian.
> > >
> > > Tuning for p8 on e.g. 970 gives quite bad results.  No idea if anyone
> > > cares, but this is a serious regression if so.
> >=20
> > It's for "generic" kernel so we set low minimum but higher tune,
> > assuming that people would usually have newer, so it was already
> > doing -mtune=3Dpower7.
> >=20
> > We could make a specific 970/G5 entry though, since those still
> > have users.
>
> If that uses -mcpu=3Dpower4 (which means ISA 2.01 btw!) all is fine
> already?  (Or -mcpu=3D970, same thing really, it just allows VMX as well)=
.

Well it does -mcpu=3Dpower4 but the "generic" CPU option also does
the -mtune=3Dpower7 or 8. I added a -mcpu=3D970 version, even though
we don't let the compiler generate VMX in the kernel so I guess
it's not functionally different.

> Thanks for taking care of this Nick, much appreciated!

No problem, thanks for reviewing and finding my errors :P

Thanks,
Nick
