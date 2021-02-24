Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CDE323AED
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Feb 2021 12:01:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DltK53BZNz3cjt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Feb 2021 22:01:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=PpKt4nXg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2e;
 helo=mail-yb1-xb2e.google.com; envelope-from=matorola@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=PpKt4nXg; dkim-atps=neutral
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DltJf6gQVz30Hr
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Feb 2021 22:01:21 +1100 (AEDT)
Received: by mail-yb1-xb2e.google.com with SMTP id f4so1412541ybk.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Feb 2021 03:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=q5EBUPu7DHD+FuA5SGZ+0iNoNfQivrRarTOBbjTJdyk=;
 b=PpKt4nXgl8dkkxBzxuaLrjlXX0hqqCr8wUyXp2yPXNJFwryHemyu90dCsMWVBumO+n
 1RL9h3nYbcv61lEowunFuKgz64z7Yzeh8Lgpc+qhcQk3o47Q8vXTa/1JqCs0I07wh3ha
 Uz5wfupBLDaMNbhfqzaE3k0qhkd7I5DtWuNC4bkQLJKrI5aDDHXPPyyYB1y2GQNdUs5T
 5kHhKZrfhGu76w2/xSocoV9KQw24jWXlmIw0Kwd03g0L4j4RAnepznV2u3xE8Gs6fLMU
 EAMzIh826mV8TtupQHPvIlfwN+/s/AhkuamaO0KCG5dcOHlst96H3i75lGMtPG9LM+IU
 /Deg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=q5EBUPu7DHD+FuA5SGZ+0iNoNfQivrRarTOBbjTJdyk=;
 b=dtHcJ//PZpntdoy1YRBjCF3Wfu39bvCGjI2okGLVG55YIRp5Kkneq34b12H1hSJCTc
 sy9eTHEHElbE0lxKkSs7n0Q1vvXkZGdYknSQ0eBCpQWtWkzR6QYu3UcTNbiWPbw/Caop
 wSRztiHarsSwhz2+lpDhRKh7juzqvDsPLwTym75GFeu/NEiQXpM9JvcOX1mJLJIdmUVL
 xuIneEtEgSSmGf2IVy4yCtXC8BgAbm/5oSyBDF/XtHhb9/XzzMyF7lD0tWX/xWEwkHlN
 kVNhLf6zhUDrtUKle3Y2beDyILwrepv1SyWzl3bSvFb8e1Rh39wWNNp+Zra5UyjfBxX5
 brHg==
X-Gm-Message-State: AOAM530AVbXVfgHrQpjUtc1quF/8m1VL3i6FPBAfUoimQJ2SpSXS3Z98
 tXGXytIcy+Nk4+HVf7UkrsVpbTIhiZoB8iOtuh4=
X-Google-Smtp-Source: ABdhPJxhiCfGjIzPOx2Fqgi7qb3IEYMwNvLkNSu5A5vWCLP2a0ja0byv/ganfMSniEGrB2L8iDsLWc4l18D5rmld2Ec=
X-Received: by 2002:a25:324b:: with SMTP id y72mr46115248yby.233.1614164477289; 
 Wed, 24 Feb 2021 03:01:17 -0800 (PST)
MIME-Version: 1.0
References: <20210224072516.74696-1-uwe@kleine-koenig.org>
In-Reply-To: <20210224072516.74696-1-uwe@kleine-koenig.org>
From: Anatoly Pugachev <matorola@gmail.com>
Date: Wed, 24 Feb 2021 14:01:06 +0300
Message-ID: <CADxRZqzG7jtNwYsdnO1xm8FLes_+GqTB=2naxaUTP2MNkzGG3g@mail.gmail.com>
Subject: Re: [PATCH v2] vio: make remove callback return void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <uwe@kleine-koenig.org>
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
Cc: Cristobal Forno <cforno12@linux.ibm.com>,
 Tyrel Datwyler <tyreld@linux.ibm.com>,
 Sparc kernel list <sparclinux@vger.kernel.org>, target-devel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>,
 =?UTF-8?Q?Breno_Leit=C3=A3o?= <leitao@debian.org>,
 Peter Huewe <peterhuewe@gmx.de>, Sukadev Bhattiprolu <sukadev@linux.ibm.com>,
 Jiri Slaby <jirislaby@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 linux-scsi@vger.kernel.org, Nayna Jain <nayna@linux.ibm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Michael Cyr <mikecyr@linux.ibm.com>,
 Jakub Kicinski <kuba@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, linux-block@vger.kernel.org,
 Lijun Pan <ljp@linux.ibm.com>, Matt Mackall <mpm@selenic.com>,
 Jens Axboe <axboe@kernel.dk>, Steven Royer <seroyer@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel list <linux-kernel@vger.kernel.org>,
 Jarkko Sakkinen <jarkko@kernel.org>, linux-crypto@vger.kernel.org,
 netdev@vger.kernel.org, Dany Madden <drt@linux.ibm.com>,
 Paulo Flabiano Smorigo <pfsmorigo@gmail.com>, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 24, 2021 at 11:17 AM Uwe Kleine-K=C3=B6nig <uwe@kleine-koenig.o=
rg> wrote:
>
> The driver core ignores the return value of struct bus_type::remove()
> because there is only little that can be done. To simplify the quest to
> make this function return void, let struct vio_driver::remove() return
> void, too. All users already unconditionally return 0, this commit makes
> it obvious that returning an error code is a bad idea and makes it
> obvious for future driver authors that returning an error code isn't
> intended.
>
> Note there are two nominally different implementations for a vio bus:
> one in arch/sparc/kernel/vio.c and the other in
> arch/powerpc/platforms/pseries/vio.c. I didn't care to check which
> driver is using which of these busses (or if even some of them can be
> used with both) and simply adapt all drivers and the two bus codes in
> one go.

Applied over current git kernel, boots on my sparc64 LDOM (sunvdc
block driver which uses vio).
Linux ttip 5.11.0-10201-gc03c21ba6f4e-dirty #189 SMP Wed Feb 24
13:48:37 MSK 2021 sparc64 GNU/Linux
boot logs (and kernel config) on [1] for "5.11.0-10201-gc03c21ba6f4e-dirty"=
.
Up to you to add "tested-by".
Thanks.

1. https://github.com/mator/sparc64-dmesg

PS: going to check with ppc64 later as well on LPAR (uses vio).
