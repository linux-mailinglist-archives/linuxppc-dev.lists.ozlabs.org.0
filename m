Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1FA84DD3D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Feb 2024 10:48:14 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BBNkyPwy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TVscD07nLz3cVq
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Feb 2024 20:48:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BBNkyPwy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com; envelope-from=lukas.bulwahn@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TVsbR1T9nz3c12
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Feb 2024 20:47:29 +1100 (AEDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a30e445602cso139057266b.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Feb 2024 01:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707385645; x=1707990445; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DH3hgklJ1R75I/VpBMJ+510hVZo1X3MvgC5DTxJlxAI=;
        b=BBNkyPwyP0Mc7FMA1qXRghcPOG5CPojK7eT6pCqzVf3kt5W4F4HDU634eGpR/PbQTu
         PzBlQ8bPryBYFe9j5uoOLpZXZwqTeRfR2RE913StIBJAq6Hi6nFg0nQJ2T2ARat8gMoF
         HbYWMJ374r6qXUYVR9ZBCEY1uwiRVE0g3wF6WmWQ0W8Tu2D2TzsniFBFYnf2XZELw7bJ
         2JKjCeUvHXUWCGsfAYBWe6o5M8ffkDT09Sigr2KOUWArtQ80nZ0vt4LZo0tpJB7t45Hc
         87curMuVAxRedLeSPKf2yluLP80ikik2MH2XaKQ/Jiqa4zV9dY4ex6xI/tM3cfSIUUQD
         wZuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707385645; x=1707990445;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DH3hgklJ1R75I/VpBMJ+510hVZo1X3MvgC5DTxJlxAI=;
        b=rPi9tp1ZdADQSMkXdmT0FILh5snELDBNnkpJaqeeV4SqzoOA1RZ8lWrOx+z3VEoXQq
         WG7NzeFAjBAbEFBoT3DT3iuw5ggVlYaVliDrgbYjSu70TP1Nl3OwLPmrVquPLB1mZXBX
         542OhqPUPgn//GIhA0R3gd/nhj7YuBUOpzKE6HlZdxbIXrVhW+Nr5pXxxZvdTXHFGhE1
         DsJ6ENRsM/wgwkEFRAjEFZkPT0xMVDnncKhUMaXuGr7FC6JRXbF4SD8jsQ+YnsZXrEzS
         V04CelxYFUPLVoCe4liAVSBhSW5rB8tyIb9AI9EsBZguEqtfVHMW4c5ISN3yVQ+vYutz
         wIJA==
X-Gm-Message-State: AOJu0Ywi1wEBMV9VvR4heEwmAz0+qvsGFlgn3LuHtc4do5ZrniLCcwon
	sqnxjemr0B82UnCxPy6viuiQJtSredN/j5R9YilzuFcPvNkUIdEKnU4XFlfiqw1j01SwcAX0dBX
	mDTZkBDQNZmPG5cfbMKbDp493few=
X-Google-Smtp-Source: AGHT+IGezKKWZ25bbGDuM3CK5CVJTtXoxBQHcRsyoeEV3EpwXsWsIoYWuis+AHvCuxSKvkEOsZmGBuCOh9k6CbxtP2I=
X-Received: by 2002:a17:906:cc92:b0:a38:65e6:b996 with SMTP id
 oq18-20020a170906cc9200b00a3865e6b996mr1979455ejb.11.1707385644965; Thu, 08
 Feb 2024 01:47:24 -0800 (PST)
MIME-Version: 1.0
References: <20240129131729.4311-1-lukas.bulwahn@gmail.com> <ZbsxfYVKqxwn5gl5@gondor.apana.org.au>
In-Reply-To: <ZbsxfYVKqxwn5gl5@gondor.apana.org.au>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Thu, 8 Feb 2024 10:47:14 +0100
Message-ID: <CAKXUXMynhktyTY8+JtDAuVHysV2g0eXy7dr09wvSqYxZ=paWUg@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: adjust file entries after crypto vmx file movement
To: Herbert Xu <herbert@gondor.apana.org.au>
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
Cc: kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org, Danny Tsen <dtsen@linux.ibm.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 1, 2024 at 6:51=E2=80=AFAM Herbert Xu <herbert@gondor.apana.org=
.au> wrote:
>
> On Mon, Jan 29, 2024 at 02:17:29PM +0100, Lukas Bulwahn wrote:
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 2fb944964be5..15bc79e80e28 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -10307,12 +10307,12 @@ M:  Nayna Jain <nayna@linux.ibm.com>
> >  M:   Paulo Flabiano Smorigo <pfsmorigo@gmail.com>
> >  L:   linux-crypto@vger.kernel.org
> >  S:   Supported
> > -F:   drivers/crypto/vmx/Kconfig
> > -F:   drivers/crypto/vmx/Makefile
> > -F:   drivers/crypto/vmx/aes*
> > -F:   drivers/crypto/vmx/ghash*
> > -F:   drivers/crypto/vmx/ppc-xlate.pl
> > -F:   drivers/crypto/vmx/vmx.c
> > +F:   arch/powerpc/crypto/Kconfig
> > +F:   arch/powerpc/crypto/Makefile
> > +F:   arch/powerpc/crypto/aes*
>
> Are you sure about this? There are non-vmx aes* files in that
> directory.  Perhaps something more specific is needed here?
>

sorry for the late reply. I revisited this patch and now keep the
match exact in my patch v2:

https://lore.kernel.org/lkml/20240208093327.23926-1-lukas.bulwahn@gmail.com=
/

Herbert, I hope you are fine to pick this patch v2.

Lukas
