Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A502315C1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jul 2020 00:52:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BGX4c48Y4zDr1Z
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jul 2020 08:52:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::141;
 helo=mail-il1-x141.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=XJsNR/mW; dkim-atps=neutral
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BGX2y36G0zDqx0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jul 2020 08:51:05 +1000 (AEST)
Received: by mail-il1-x141.google.com with SMTP id i138so11786174ild.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jul 2020 15:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AGoMLO2/qDEXToLwWvBpYV6ymb9+7NbVdQ1A04tBoCw=;
 b=XJsNR/mWGBB68q6/r3+m/tfZTmbbKmZrl1DYcAQEZj8yRHzW/VkDEYvxJTZ9aaIqcG
 CkwKq+0OAiaDXExO1I5YQLDWKBdn2LE2QiT5tEaDkasiJ3x/CoAgZngagNJNV3FnBLPC
 TCa+M6PaOin8EyngrQwnA73slEEvClI6F7sLipnH/HqvfZxCHoTMco8I+0xSOR7rP/0U
 jWxJOd1sTUC6QpTdi5BBN4iMxt+9wiICdORKi5J8O24xNnBi1+NYqvFElIAwdTN5cOgZ
 wHMvU06bEcOAG8wNjTmOflp6VvcokzolBr0nB3Is4Tt/tuKUyxnd5+qD3sixpYxTu26L
 kR0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AGoMLO2/qDEXToLwWvBpYV6ymb9+7NbVdQ1A04tBoCw=;
 b=Low3kYivD/B7xjOWFWHR5bawbrklvOjU90tKLr7HI7gGfbw+rEGV39nRsH+4vKHwCE
 QYT4k3AsRPhtd2LiRYUNMAy2a/f3teiGVzqoMb7Y5/luokA0OhWNWWRr/C8NF5WKdUGv
 rJMGwfTxYV0JbYCWyVeN9kdEThfxNiYqKUci69CLl4EHzL0QJAbPZxxBQV56bB34D1Hp
 HuSilBmQdrD3Y6naJImSRkMv/HT1TSwIkamroS2WqmsW8ofocUtIRAK6V1lftgAnxSsT
 OZMtxBsPOiZsJDPjNjeh7Bn/WHgwlwpgx1gLRUZszWIPcKSu4FhqmK5O69b19MdWmll1
 YsFg==
X-Gm-Message-State: AOAM531Tk70xpjKqTgBPBDfGZWPM4vYji2PoxvvaJOKM528j84nm4UhP
 4P71+8WOTiPrcDEhUxqzUQ6XIjgkwnV7GACL8MuDI2RS
X-Google-Smtp-Source: ABdhPJwy1mPZvD5fuVSLy+hJ+BS64ZEpZK7M7q1vQ4UjXF/0fVDXi2PDSy2NKWHQIDxNOKujYA8DioQIb+153oLkofQ=
X-Received: by 2002:a92:d607:: with SMTP id w7mr358057ilm.149.1595976662488;
 Tue, 28 Jul 2020 15:51:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200728223337.40447-1-gromero@linux.ibm.com>
In-Reply-To: <20200728223337.40447-1-gromero@linux.ibm.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Wed, 29 Jul 2020 08:50:51 +1000
Message-ID: <CAOSf1CG4b_G_dzb2f2pRo-P=Ku4f7QB8VJpRmGjejHi+R2qQGg@mail.gmail.com>
Subject: Re: [PATCH] powerpc/powernv/pci: Fix build of pci-ioda.o
To: Gustavo Romero <gromero@linux.ibm.com>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 29, 2020 at 8:35 AM Gustavo Romero <gromero@linux.ibm.com> wrote:
>
> Currently pnv_ioda_setup_bus_dma() is outside of a CONFIG_IOMMU_API guard
> and if CONFIG_IOMMU_API=n the build can fail if the compiler sets
> -Werror=unused-function, because pnv_ioda_setup_bus_dma() is only used in
> functions guarded by a CONFIG_IOMMU_API guard.
>
> That issue can be easily reproduced using the skiroot_defconfig. For other
> configs, like powernv_defconfig, that issue is hidden by the fact that
> if CONFIG_IOMMU_SUPPORT is enabled plus other common IOMMU options, like
> CONFIG_OF_IOMMU, by default CONFIG_IOMMU_API is enabled as well. Hence, for
> powernv_defconfig, it's necessary to set CONFIG_IOMMU_SUPPORT=n to make the
> build fail, because CONFIG_PCI=y and pci-ioda.c is included in the build,
> but since CONFIG_IOMMU_SUPPORT=n the CONFIG_IOMMU_API is disabled, breaking
> the build.
>
> This commit fixes that build issue by moving the pnv_ioda_setup_bus_dma()
> inside a CONFIG_IOMMU_API guard, so when CONFIG_IOMMU_API is disabled that
> function is not defined.

I think a fix for this is already in -next.
