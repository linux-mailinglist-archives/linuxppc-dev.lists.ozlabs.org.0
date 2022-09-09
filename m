Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E07CC5B3467
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 11:48:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MPB4Z4JSzz3c1v
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 19:47:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=c704vzTI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MPB3w6339z2yHT
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Sep 2022 19:47:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=c704vzTI;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4MPB3s6wpgz4xXS
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Sep 2022 19:47:21 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4MPB3s6tJBz4xY8; Fri,  9 Sep 2022 19:47:21 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2d; helo=mail-yb1-xb2d.google.com; envelope-from=lukas.bulwahn@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=c704vzTI;
	dkim-atps=neutral
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4MPB3s6nrYz4xXS
	for <linuxppc-dev@ozlabs.org>; Fri,  9 Sep 2022 19:47:21 +1000 (AEST)
Received: by mail-yb1-xb2d.google.com with SMTP id 202so1830145ybe.13
        for <linuxppc-dev@ozlabs.org>; Fri, 09 Sep 2022 02:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=jfc5PI7vUD4Aq68rXzOdTc1GotoBc8f6RchZ+GS6IIs=;
        b=c704vzTIEE8fD/+/yEejZ7dnnrVdpFgSizdgMZGxd8hZWJzMFgmZ5EdxpBlbOUvAiV
         UQNGbMKvyIxj4+AF6dbyQIpPlzKw+9WRX+pf6AxZusOzuIp904FHwapLxuZWjRvIjeJf
         ptoKp+v53gvE4UhNe8CdSyRhZfVnBoFPuZk88c09lR0b7uM3YomAA+haLBE671ddHqt9
         5O23+VDPTnCnyUQOmnbvzeqZid4M8FkuKKCt1CKRl2K3GVKhLKLAYSATr40xRAU41ihb
         JRU2ZscubQRTTjS6NFsUdEJv8luO2yB46THkdYNHN3FqL6Tgt4ObN2jxmU0iSe6vZW//
         4mKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=jfc5PI7vUD4Aq68rXzOdTc1GotoBc8f6RchZ+GS6IIs=;
        b=huw4NnJHU3PgfvCEafWcE2zr8gsYRRLVFFm+vpAy4Zlb2cnVqMMUYYC9RIJYV51a98
         CODW38nTATqpvPTegjLPGl8eVMHJ1k63vFZpDAzLEVIHL0GxcoN/RIDMEH5XS7rNPmKt
         s6i/5/AkT3JWgLHL0dzquPR07LdK/B9DOOzzbmcMtZ4A5xa3isAlsBGx8XvTZMytTGD8
         xiENJgueiFK//En5oM9A6yGvzZxLXxF6QuWJ2H8lsS7p600X56IVejqaKgd9JgGhxoEm
         zEtusA5tRdtBdZsx5n+eK/0ftdvVvJpgl6xbGUjtvqRyIhCZ0tGTB03G65pZil02wVOA
         LGxg==
X-Gm-Message-State: ACgBeo3p134rbv2E+yM8FwopE1Kas8JYV5um5kXerAmqaJRnHxo8o3uK
	C9PEklllLUwtLekckkWlE56OF8sNyjUMGMMp+i8=
X-Google-Smtp-Source: AA6agR5iecDvFUTm3i7dnv6+ipXhF18SNJAuAN5Vk4ZI4UmY6mu5QedSKsbgiHyH5fdvRxxAyuv6TJXapYjUleCR1Vk=
X-Received: by 2002:a25:d791:0:b0:6ae:2ee3:710e with SMTP id
 o139-20020a25d791000000b006ae2ee3710emr6161116ybg.389.1662716838695; Fri, 09
 Sep 2022 02:47:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220908104337.11940-1-lukas.bulwahn@gmail.com>
 <20220908104337.11940-7-lukas.bulwahn@gmail.com> <ca25a32d-aadb-f0d0-9e24-70fbabc4d377@csgroup.eu>
In-Reply-To: <ca25a32d-aadb-f0d0-9e24-70fbabc4d377@csgroup.eu>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Fri, 9 Sep 2022 11:47:07 +0200
Message-ID: <CAKXUXMwo-X+cM9f_K=JpnjAcPr89OKCZ4JRAFMYCaTwt85UJ5Q@mail.gmail.com>
Subject: Re: [PATCH 6/6] init/Kconfig: remove confusing config EMBEDDED
To: Christophe Leroy <christophe.leroy@csgroup.eu>
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
Cc: "x86@kernel.org" <x86@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen <peter.chen@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>, linuxppc-dev <linuxppc-dev@ozlabs.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Masahiro Yamada <masahiroy@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> >   init/Kconfig | 8 --------
> >   1 file changed, 8 deletions(-)
> >
> > diff --git a/init/Kconfig b/init/Kconfig
> > index 9e3fd79b089c..d7429e0b8cae 100644
> > --- a/init/Kconfig
> > +++ b/init/Kconfig
> > @@ -1818,14 +1818,6 @@ config DEBUG_RSEQ
> >
> >         If unsure, say N.
> >
> > -config EMBEDDED
> > -     bool "Embedded system"
> > -     select EXPERT
> > -     help
> > -       This option should be enabled if compiling the kernel for
> > -       an embedded system so certain expert options are available
> > -       for configuration.
> > -
> >   config HAVE_PERF_EVENTS
> >       bool
> >       help
>
> That's fine, but what happens to existing defconfigs then ?
>
> $ git grep -w CONFIG_EMBEDDED arch/powerpc/
> arch/powerpc/configs/40x/klondike_defconfig:CONFIG_EMBEDDED=y
> arch/powerpc/configs/44x/fsp2_defconfig:CONFIG_EMBEDDED=y
> arch/powerpc/configs/52xx/tqm5200_defconfig:CONFIG_EMBEDDED=y
> arch/powerpc/configs/mgcoge_defconfig:CONFIG_EMBEDDED=y
> arch/powerpc/configs/microwatt_defconfig:CONFIG_EMBEDDED=y
> arch/powerpc/configs/ps3_defconfig:CONFIG_EMBEDDED=y
>
> They need to get converted to selecting CONFIG_EXPERT instead.
>
> And that needs to be done before you remove CONFIG_EMBEDDED.
>

Agree. Let us get the first five patches included. Then adjust the
configs for all architectures and then delete the CONFIG_EMBEDDED.

Lukas
