Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A67C1730CEF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 03:54:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=cyDaFziT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QhQLz6960z30GP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 11:54:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=cyDaFziT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QhQL40STgz302R
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jun 2023 11:53:15 +1000 (AEST)
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-517ab9a4a13so5187917a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 18:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686793991; x=1689385991;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BcWrWABhHCmCJwm0t3QuGOiFm2GthCuOaRbgbzLVTgg=;
        b=cyDaFziTcGixVe63oWbf6IMeuzGoyjtcmh3siBF8I33gTZZwJgeOIvSTFb/fA/QYL6
         zHlhmpJdaQN4xcz221GjNhQkB/tR2UVzmvlvvgvAEpZYIa8ucXsjWstKiofVylb99Uow
         hPIt6CAi2dXoBBjlVHE3VLLFBNMuulhRqHggvrPliLv2yEKnAu7BjYoAtHSIkBqEbcPX
         +gv2Zm8/x6GYJkxK1k9O0/lnPOzuf7Sdjj2zuxHQopitaUPLFC1I9WtCkgXS58wexIQd
         croCpqml2epxVLB87nBmxBSwZQuTcczAJUIzcWiyyeRGCZySOOitqsxCEPhc4WgfuMY8
         3Qtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686793991; x=1689385991;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BcWrWABhHCmCJwm0t3QuGOiFm2GthCuOaRbgbzLVTgg=;
        b=Tz+mMoS1kgIpdZ+OC0B/SDDr/MlTFv7o1BEsjBWZs38pP5JeAE808tRz1sRiGytghW
         T7sav79+menPrkaB47S+mPEeMGs7ZAMukK26BFDwuRsL/PsyRtbsnpwS7Af3udfMpPsX
         FqobfYX9oZnM3Q8bxqFbYvGlcXkJloCs1050SLpuA5tbMAPSDEMQEB9vN0cv1lfnT2Y+
         suN6nDjqix5kTLOCva69NgCD1/QmCGR9E7XfAYTQaXiRaTd1GVJofjEPGMBvvY1kecEX
         KOnlkb9hi0M0DntcVylKjuWpYQ+mRJ/N4y4GqxNpulb6n73IfqTgicaWuW9vToXdwDub
         8zbA==
X-Gm-Message-State: AC+VfDwjqtjiMnmVh2bjgBBZ3suWQYM/vRBVT/lBHkmjNudVtBOgvz1L
	tM0NsGp0hrBEY6vNPOtJmQTb6P6SNGs=
X-Google-Smtp-Source: ACHHUZ7WyoY7eJlvJ4me8veJMJ4yoiWYMQ5KC2rKXlHU9veDDxjqbi2d+8Yp7ty1kWbMxn9QcvoSRA==
X-Received: by 2002:a05:6a20:4402:b0:11d:ae2e:6954 with SMTP id ce2-20020a056a20440200b0011dae2e6954mr4196738pzb.15.1686793991402;
        Wed, 14 Jun 2023 18:53:11 -0700 (PDT)
Received: from localhost (14-203-144-223.static.tpgi.com.au. [14.203.144.223])
        by smtp.gmail.com with ESMTPSA id g5-20020a63e605000000b00528db73ed70sm11811277pgh.3.2023.06.14.18.53.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jun 2023 18:53:11 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 Jun 2023 11:53:07 +1000
Message-Id: <CTCUKC30VVC4.KMUHD1RN0W79@wheely>
Subject: Re: [PATCH 4/4] powerpc/64s: Use POWER10 stsync barrier for wmb()
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Michael Ellerman" <mpe@ellerman.id.au>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.14.0
References: <20230609100026.8946-1-npiggin@gmail.com>
 <20230609100026.8946-4-npiggin@gmail.com> <87wn07foos.fsf@mail.lhotse>
 <87ttvafuxi.fsf@mail.lhotse>
In-Reply-To: <87ttvafuxi.fsf@mail.lhotse>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed Jun 14, 2023 at 3:56 PM AEST, Michael Ellerman wrote:
> Michael Ellerman <mpe@ellerman.id.au> writes:
> > Nicholas Piggin <npiggin@gmail.com> writes:
> >> The most expensive ordering for hwsync to provide is the store-load
> >> barrier, because all prior stores have to be drained to the caches
> >> before subsequent instructions can complete.
> >>
> >> stsync just orders stores which means it can just be a barrer that
> >> goes down the store queue and orders draining, and does not prevent
> >> completion of subsequent instructions. So it should be faster than
> >> hwsync.
> >>
> >> Use stsync for wmb(). Older processors that don't recognise the SC
> >> field should treat this as hwsync.
> >
> > qemu (7.1) emulating ppc64e does not :/
> >
> >   mpic: Setting up MPIC " OpenPIC  " version 1.2 at fe0040000, max 1 CP=
Us
> >   mpic: ISU size: 256, shift: 8, mask: ff
> >   mpic: Initializing for 256 sources
> >   Oops: Exception in kernel mode, sig: 4 [#1]
> ..
> >
> > I guess just put it behind an #ifdef 64S.
>
> That doesn't work because qemu emulating a G5 also doesn't accept it.
>
> So either we need to get qemu updated and wait a while for that to
> percolate, or do some runtime patching of wmbs in the kernel >_<

Gah, sorry. QEMU really should be ignoring reserved fields in
instructions :(

I guess leave it out for now. Should fix QEMU but we probably also need
to do patching so as not to break older QEMUs.

Thanks,
Nick
