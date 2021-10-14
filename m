Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C7642D355
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Oct 2021 09:15:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HVLJT4BVrz3bj5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Oct 2021 18:15:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=HCVS7hkp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::830;
 helo=mail-qt1-x830.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=HCVS7hkp; dkim-atps=neutral
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HVLHm3g6Dz2xsr
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Oct 2021 18:14:27 +1100 (AEDT)
Received: by mail-qt1-x830.google.com with SMTP id r17so4931008qtx.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Oct 2021 00:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7IosRj4N8IWq7SJUgSwHlNjeQhG16TW+4l/PW/XKnLs=;
 b=HCVS7hkpNYFilNaESKJtxZ96jYoOv5ZzyrAnEnxJQ7Ym1i//kA4F9Swu6BC3oO0Nnf
 usSGq7x6+v1gQnZjl9Vhz/Dr0I+FvEZMX+lYgGzxm//pOrl8MY0XbJHw0fTYPzvJ0WKK
 NLljxIbGiTfrZmb8mniN+8tITmKM8LolFYoTY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7IosRj4N8IWq7SJUgSwHlNjeQhG16TW+4l/PW/XKnLs=;
 b=Fft2drl1nW2sp2ZwAiIk1WZ6yhNaulNSV07Bb+QjFyyrlUDhB0hPGVbleDaKWBaa8d
 AcwgyXp1hNmQLAFQjc4habENkzKmk1kwv0lLGbOB0Ve6zZU4vFb0fdH5w/pAgxzqFsxd
 DoSL/wOFebmY0bUstR6DqhPIU/d52grjTIvDzQex4mt1mavNiytmCnSim+sy3cgYOUXK
 RjBQ++23ndH8HSZEPGLHQ5ZoZWei6TwePElpOnBA/o672kcOyipHJElN5Ygc91O+LY1m
 Y+zPpqrHSg7vuUMD2Ul3+sLRwwSQEuMUKAjDFBgtY2wGsaZ7NcZ15J24GgfAG/GFaWML
 PXAg==
X-Gm-Message-State: AOAM530Q1hcR1SElRybxvA2hHoOtvgdBo/QqqmPL08LgmoWLAOvjSubo
 BKuEb6HoY2ZUm24KP1JEEVoC6q7YXPpBlLyFjymnZsXu
X-Google-Smtp-Source: ABdhPJwG65k3eyxwbwMc0AdFmRNe134zwmdbJm4t8YIsyROR2WP5Zzf6O7lTAvPfKuxfNaT9M2TQLbmUBGwM8jUP1sc=
X-Received: by 2002:a05:622a:1451:: with SMTP id
 v17mr4567432qtx.25.1634195663344; 
 Thu, 14 Oct 2021 00:14:23 -0700 (PDT)
MIME-Version: 1.0
References: <20211013233133.728484-1-joel@jms.id.au>
 <e738798a-7b78-d598-0e6b-507e12712727@csgroup.eu>
In-Reply-To: <e738798a-7b78-d598-0e6b-507e12712727@csgroup.eu>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 14 Oct 2021 07:14:11 +0000
Message-ID: <CACPK8XcEq+a5p4gY_Zi7dL1S1QqCd2x1fy9d-e-Szu+OyoFAVQ@mail.gmail.com>
Subject: Re: [PATCH] powerpc/64s: Default to 64K pages for 64 bit book3s
To: LEROY Christophe <christophe.leroy@csgroup.eu>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 14 Oct 2021 at 07:03, LEROY Christophe
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 14/10/2021 =C3=A0 01:31, Joel Stanley a =C3=A9crit :
> > For 64-bit book3s the default should be 64K as that's what modern CPUs
> > are designed for.
> >
> > The following defconfigs already set CONFIG_PPC_64K_PAGES:
> >
> >   cell_defconfig
> >   pasemi_defconfig
> >   powernv_defconfig
> >   ppc64_defconfig
> >   pseries_defconfig
> >   skiroot_defconfig
> >
> > The have the option removed from the defconfig, as it is now the
> > default.
> >
> > The defconfigs that now need to set CONFIG_PPC_4K_PAGES to maintain
> > their existing behaviour are:
> >
> >   g5_defconfig
> >   maple_defconfig
> >   microwatt_defconfig
> >   ps3_defconfig
> >
> > Link: https://github.com/linuxppc/issues/issues/109
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > ---
> >   arch/powerpc/Kconfig                     | 1 +
> >   arch/powerpc/configs/cell_defconfig      | 1 -
> >   arch/powerpc/configs/g5_defconfig        | 1 +
> >   arch/powerpc/configs/maple_defconfig     | 1 +
> >   arch/powerpc/configs/microwatt_defconfig | 2 +-
> >   arch/powerpc/configs/pasemi_defconfig    | 1 -
> >   arch/powerpc/configs/powernv_defconfig   | 1 -
> >   arch/powerpc/configs/ppc64_defconfig     | 1 -
> >   arch/powerpc/configs/ps3_defconfig       | 1 +
> >   arch/powerpc/configs/pseries_defconfig   | 1 -
> >   arch/powerpc/configs/skiroot_defconfig   | 1 -
> >   11 files changed, 5 insertions(+), 7 deletions(-)
> >
>
> > diff --git a/arch/powerpc/configs/microwatt_defconfig b/arch/powerpc/co=
nfigs/microwatt_defconfig
> > index 9465209b8c5b..556ec5eec684 100644
> > --- a/arch/powerpc/configs/microwatt_defconfig
> > +++ b/arch/powerpc/configs/microwatt_defconfig
> > @@ -1,7 +1,6 @@
> >   # CONFIG_SWAP is not set
> >   # CONFIG_CROSS_MEMORY_ATTACH is not set
> >   CONFIG_HIGH_RES_TIMERS=3Dy
> > -CONFIG_PREEMPT_VOLUNTARY=3Dy
>
> This seems unrelated.

It is, thanks for catching that.
