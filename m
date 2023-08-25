Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B310787C8D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Aug 2023 02:29:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=i3hogvNy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RX1745HNwz3cD0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Aug 2023 10:29:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=i3hogvNy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RX1696xtdz3byH
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Aug 2023 10:29:04 +1000 (AEST)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-9936b3d0286so44408566b.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Aug 2023 17:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1692923337; x=1693528137;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KQ+lJz/TPLyrlrV/oSYnL62Mlz55rOtV8U7RoZ1GqqU=;
        b=i3hogvNywDsH/4dRHa8jmUIFUEZEmma8DKJxtMLTE7M6WYXq+W7h28hgEFzBIygw0L
         Exsk0LeyviRcWbTmumtMwc4bEtXdDhlqsE5EhWOVpOH8ASvkL3ItGFH9iQ5GoFdjDso2
         j0+Eeaypk6NwmtkqExDv7MGJnKIHmJStkp8Qs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692923337; x=1693528137;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KQ+lJz/TPLyrlrV/oSYnL62Mlz55rOtV8U7RoZ1GqqU=;
        b=NWsfERtL24GQMxMnKnR1Q44qy4vHfnCclmvf6+jwE4Mk6zVBfxdOzkwfuutp+1TrE3
         2WLE8mK1bpYsLZVpYFQYTbwJXEHGVOJ0y1V8rtF6Py+rCj32aufU9TncuzDX/JNFgsx6
         MX5H2yXp/pWmewrxE3ulPqnOMfRi9y1kjZNOsstjFhvZes9QZpzWkwvX0kwSa++3sfqL
         5nAciFF3/Hq2ZG64rC2cKoEd27hyX9kdZ4enU2eqmUW8KasNkphhznMU1TntK5uFHuIK
         na28OYrT3KDPrus+wK23tz6VusaWvGQ/dKmoZ21X9QvalKIubq6TIbb7schalkIm5j2J
         M7Ig==
X-Gm-Message-State: AOJu0YxWfRJQ17vzRgxumcmzisYQyYuLgkuhwaft5FE14LKQuXnQI7Tf
	hac3nw2CzEyfnZ4nJlXAKEkOsV+vSFk4sWTtDTY=
X-Google-Smtp-Source: AGHT+IEBQm2ybDWfs242GQvMOdGndECAS3oJpsFSEKTjstztVum1jbBjV+xuugIR1eyJq282i++6skYK1LtzCM2S/6o=
X-Received: by 2002:a17:906:10cd:b0:9a2:26d8:f180 with SMTP id
 v13-20020a17090610cd00b009a226d8f180mr1860923ejv.70.1692923337283; Thu, 24
 Aug 2023 17:28:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230609100026.8946-1-npiggin@gmail.com> <20230609100026.8946-4-npiggin@gmail.com>
 <87wn07foos.fsf@mail.lhotse> <87ttvafuxi.fsf@mail.lhotse> <CTCUKC30VVC4.KMUHD1RN0W79@wheely>
 <87leglfmlc.fsf@mail.lhotse> <87fs48vdw6.fsf@mail.lhotse> <87cyzcvdux.fsf@mail.lhotse>
In-Reply-To: <87cyzcvdux.fsf@mail.lhotse>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 25 Aug 2023 00:28:35 +0000
Message-ID: <CACPK8Xeq3G2g2nY1_Wm32tB0JyfS5k+=YAjQNom3x=cc2Qs7mA@mail.gmail.com>
Subject: Re: [PATCH 4/4] powerpc/64s: Use POWER10 stsync barrier for wmb()
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 24 Aug 2023 at 12:12, Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Michael Ellerman <mpe@ellerman.id.au> writes:
> > Michael Ellerman <mpe@ellerman.id.au> writes:
> >> "Nicholas Piggin" <npiggin@gmail.com> writes:
> >>> On Wed Jun 14, 2023 at 3:56 PM AEST, Michael Ellerman wrote:
> >>>> Michael Ellerman <mpe@ellerman.id.au> writes:
> >>>> > Nicholas Piggin <npiggin@gmail.com> writes:
> >>>> >> The most expensive ordering for hwsync to provide is the store-load
> >>>> >> barrier, because all prior stores have to be drained to the caches
> >>>> >> before subsequent instructions can complete.
> >>>> >>
> >>>> >> stsync just orders stores which means it can just be a barrer that
> >>>> >> goes down the store queue and orders draining, and does not prevent
> >>>> >> completion of subsequent instructions. So it should be faster than
> >>>> >> hwsync.
> >>>> >>
> >>>> >> Use stsync for wmb(). Older processors that don't recognise the SC
> >>>> >> field should treat this as hwsync.
> >>>> >
> >>>> > qemu (7.1) emulating ppc64e does not :/
> >>>> >
> >>>> >   mpic: Setting up MPIC " OpenPIC  " version 1.2 at fe0040000, max 1 CPUs
> >>>> >   mpic: ISU size: 256, shift: 8, mask: ff
> >>>> >   mpic: Initializing for 256 sources
> >>>> >   Oops: Exception in kernel mode, sig: 4 [#1]
> >>>> ..
> >>>> >
> >>>> > I guess just put it behind an #ifdef 64S.
> >>>>
> >>>> That doesn't work because qemu emulating a G5 also doesn't accept it.
> >>>>
> >>>> So either we need to get qemu updated and wait a while for that to
> >>>> percolate, or do some runtime patching of wmbs in the kernel >_<
> >>>
> >>> Gah, sorry. QEMU really should be ignoring reserved fields in
> >>> instructions :(
> >>
> >> Yeah, it's an annoying discrepancy vs real hardware and the ISA.
> >>
> >>> I guess leave it out for now. Should fix QEMU but we probably also need
> >>> to do patching so as not to break older QEMUs.
> >>
> >> I'll plan to take the first 3 patches, they seem OK as-is.
> >
> > I didn't do that in the end, because patch 2 suffers from the same
>                                              ^
>                                              3
> > problem of not working on QEMU.

Did we get a patch to fix this in to Qemu?

Qemu has recently developed a stable tree process, so if we had a
backportable fix we could get it in there too.

Cheers,

Joel
