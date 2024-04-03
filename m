Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 46924897A56
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 23:02:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZGxG3Jdv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V8xz50VxBz3bvX
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 08:02:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZGxG3Jdv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c2d; helo=mail-oo1-xc2d.google.com; envelope-from=allen.lkml@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V8m0y3vC0z3dh2
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Apr 2024 00:33:37 +1100 (AEDT)
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-5a9d06da012so119357eaf.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Apr 2024 06:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712151215; x=1712756015; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UfJ432sdibD0Lka67Qj4+39whrzSunQCkb9XAcwEVWQ=;
        b=ZGxG3JdvXgTjwXUjEtsmX3/Zwx89nM88QxayhVkJozOH/XEHZ+jSQjCm2LtXrG/eJt
         wW6F86lvEdeOc7Wwk7tzIRRr6OJ9nyKt6UqmOsS+lKswaBI0g/wbKxiwj//zEP6fYAn5
         3TGHZaZaPMV/BcoF8qTXn86ZRWz2qJEMzOEeIEmbBq0ykKOhjPoEkByZis+A/iNlHHbr
         nIe8SucSWEoxw9RKMGwI3uiWbxaP4zikk0gVWM7broHLoOkNoIWfPDdFOwKojhkUlaXq
         OTpcW/ajoEzeG52uqrBkfBXWbABFHX6WOq3HYdJAiyiE01yH5xttZt3W3ld2esOBKHpV
         Q97A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712151215; x=1712756015;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UfJ432sdibD0Lka67Qj4+39whrzSunQCkb9XAcwEVWQ=;
        b=k39RXzZdsp8mpk2GO5+uXuZgBzCiytB1K41N0xB7BkCECbOx26+M6IO2ko1XTaY4xi
         7uyzT5U60o0TGNGmHQSygqhzXSGo6ccN03P9fr3bcIJKBHtrtp2nr9qtoMGvz5FP8JMj
         /7M0O6NksomXJGrAkgcH7SqTKRQN03+Vyl0T5uBOE+pIgWRy9CJf69wTtZk7GPH9i8h6
         2Yual1URzRhL8m+SanWeL5HMpPaM6n0CFs7/+XswxeOfrreg20PgGYRT7Mf13VkHJwpo
         i+3E4Az6sBfd/JO7fmtVbXSbWB91rWfa1BG6nsz+b7ty0xZH5vrI/7NYHgAEFOnB9gln
         mqkw==
X-Forwarded-Encrypted: i=1; AJvYcCUdg0BWpXHhJBNEls/8ly73ESC77o6dYGYDxCg6QDek/KHlpSdQAK9cCiA5lJEPg/iTuxHJzZranlRQR4/Y3+QZZTS4SFGZ5Cwvp342/w==
X-Gm-Message-State: AOJu0YzHthKj4TlsiogayKACDMB+YwkvkkUCkZNVbVifs587ldCY887X
	7sjdp8c9nAkFLAjRGyDE73jyyb48cSJpDaBho72ke8oa0WNUoog4WsBGzJwSzccMbxRQZarwGa6
	X6AqIvy4w+fEOn73dqZyo1eetE10=
X-Google-Smtp-Source: AGHT+IFsoYFg4TPJZ/xBylk5B9Nfa55HU119ldFLC4g550cJsZKKSI+Id/ONzGwerMZ8W2tZHWzr/Kf097BxBvAdyL0=
X-Received: by 2002:a05:6808:181d:b0:3c5:d426:9b87 with SMTP id
 bh29-20020a056808181d00b003c5d4269b87mr1074785oib.23.1712151214780; Wed, 03
 Apr 2024 06:33:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-8-apais@linux.microsoft.com> <ea4ac7a3-13ae-4d22-a3d9-fcb7d9e8d751@linux.ibm.com>
In-Reply-To: <ea4ac7a3-13ae-4d22-a3d9-fcb7d9e8d751@linux.ibm.com>
From: Allen <allen.lkml@gmail.com>
Date: Wed, 3 Apr 2024 06:33:23 -0700
Message-ID: <CAOMdWS+wH9qZ_08nVSQV1sY0C=uHMC+3NmPuFjwKzBFCgMa7MQ@mail.gmail.com>
Subject: Re: [PATCH 7/9] s390: Convert from tasklet to BH workqueue
To: Alexandra Winter <wintera@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 04 Apr 2024 08:02:05 +1100
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
Cc: imx@lists.linux.dev, ulf.hansson@linaro.org, oneukum@suse.com, duncan.sands@free.fr, hayashi.kunihiko@socionext.com, linux-mmc@vger.kernel.org, aubin.constans@microchip.com, linus.walleij@linaro.org, Frank.Li@nxp.com, linux-hyperv@vger.kernel.org, linux-usb@vger.kernel.org, HaraldWelte@viatech.com, paul@crapouillou.net, linux-tegra@vger.kernel.org, netdev@vger.kernel.org, maintainers@bluecherrydvr.com, peter.ujfalusi@gmail.com, manivannan.sadhasivam@linaro.org, linux-riscv@lists.infradead.org, kys@microsoft.com, robert.jarzmik@free.fr, haijie1@huawei.com, linux-renesas-soc@vger.kernel.org, wei.liu@kernel.org, linux-omap@vger.kernel.org, florian.fainelli@broadcom.com, linux-rdma@vger.kernel.org, vireshk@kernel.org, jassisinghbrar@gmail.com, decui@microsoft.com, wangzhou1@hisilicon.com, jernej.skrabec@gmail.com, jh80.chung@samsung.com, zw@zh-kernel.org, wens@csie.org, stern@rowland.harvard.edu, linux-arm-msm@vger.kernel.org, orsonzhai@gmail.com, pierre@ossman.eu, linux-mips@vger.ke
 rnel.org, Eugeniy.Paltsev@synopsys.com, patrice.chotard@foss.st.com, asahi@lists.linux.dev, brucechang@via.com.tw, keescook@chromium.org, oakad@yahoo.com, sven@svenpeter.dev, rjui@broadcom.com, s.hauer@pengutronix.de, sean.wang@mediatek.com, linux-actions@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, haojian.zhuang@gmail.com, mirq-linux@rere.qmqm.pl, dmaengine@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, baolin.wang@linux.alibaba.com, matthias.bgg@gmail.com, openipmi-developer@lists.sourceforge.net, mchehab@kernel.org, Allen Pais <apais@linux.microsoft.com>, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, sbranden@broadcom.com, logang@deltatee.com, andersson@kernel.org, marcan@marcan.st, haiyangz@microsoft.com, linux-kernel@vger.kernel.org, leoyang.li@nxp.com, konrad.dybcio@linaro.org, linux-sunxi@lists.linux.dev, vkoul@kernel.org, linux-s390@vger.kernel.org, mhiramat@kernel.org, zhang.lyra@gmail.com,
  tj@kernel.org, manuel.lauss@gmail.com, linux-media@vger.kernel.org, shawnguo@kernel.org, afaerber@suse.de, daniel@zonque.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> >
> > Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> > ---
> >  drivers/s390/block/dasd.c              | 42 ++++++++++++------------
> >  drivers/s390/block/dasd_int.h          | 10 +++---
> >  drivers/s390/char/con3270.c            | 27 ++++++++--------
> >  drivers/s390/crypto/ap_bus.c           | 24 +++++++-------
> >  drivers/s390/crypto/ap_bus.h           |  2 +-
> >  drivers/s390/crypto/zcrypt_msgtype50.c |  2 +-
> >  drivers/s390/crypto/zcrypt_msgtype6.c  |  4 +--
> >  drivers/s390/net/ctcm_fsms.c           |  4 +--
> >  drivers/s390/net/ctcm_main.c           | 15 ++++-----
> >  drivers/s390/net/ctcm_main.h           |  5 +--
> >  drivers/s390/net/ctcm_mpc.c            | 12 +++----
> >  drivers/s390/net/ctcm_mpc.h            |  7 ++--
> >  drivers/s390/net/lcs.c                 | 26 +++++++--------
> >  drivers/s390/net/lcs.h                 |  2 +-
> >  drivers/s390/net/qeth_core_main.c      |  2 +-
> >  drivers/s390/scsi/zfcp_qdio.c          | 45 +++++++++++++-------------
> >  drivers/s390/scsi/zfcp_qdio.h          |  9 +++---
> >  17 files changed, 117 insertions(+), 121 deletions(-)
> >
>
>
> We're looking into the best way to test this.
>
> For drivers/s390/net/ctcm* and drivers/s390/net/lcs*:
> Acked-by: Alexandra Winter <wintera@linux.ibm.com>

 Thank you very much.

>
>
> [...]
> > diff --git a/drivers/s390/net/qeth_core_main.c b/drivers/s390/net/qeth_core_main.c
> > index a0cce6872075..10ea95abc753 100644
> > --- a/drivers/s390/net/qeth_core_main.c
> > +++ b/drivers/s390/net/qeth_core_main.c
> > @@ -2911,7 +2911,7 @@ static int qeth_init_input_buffer(struct qeth_card *card,
> >       }
> >
> >       /*
> > -      * since the buffer is accessed only from the input_tasklet
> > +      * since the buffer is accessed only from the input_work
> >        * there shouldn't be a need to synchronize; also, since we use
> >        * the QETH_IN_BUF_REQUEUE_THRESHOLD we should never run  out off
> >        * buffers
>
> I propose to delete the whole comment block. There have been many changes and
> I don't think it is helpful for the current qeth driver.


 Sure, I will have it fixed in v2.

- Allen
