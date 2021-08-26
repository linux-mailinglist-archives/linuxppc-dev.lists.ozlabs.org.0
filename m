Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7193F86BE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Aug 2021 13:53:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GwLpk73DTz2yXb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Aug 2021 21:53:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=FB0fHEaV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22d;
 helo=mail-lj1-x22d.google.com; envelope-from=festevam@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=FB0fHEaV; dkim-atps=neutral
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GwLp14Tszz2xrk
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Aug 2021 21:53:12 +1000 (AEST)
Received: by mail-lj1-x22d.google.com with SMTP id i28so4587300ljm.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Aug 2021 04:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hBxBPr3Kmhx+gtlKVfwmBEiG03qJgZIhVmQgwh7w3cs=;
 b=FB0fHEaVXvKluHgvDlnT+jczLkZlGErjJJcgRmo6eZQTf8xdHEvDAuWFcB/QkxF4am
 7sLfKCqAoC/rjaaZHeVT2p9sjEtnFNvrhixpDYcebthv5V3m1B5T6dFAzyInBteoOSNd
 y9P1RkLqYOd5FxhAiqyQxxXLQBsMJMWpioS0KfxUkaik13asCvQy42uEp/vg36WtcETW
 oHKYlfRq4qtHu5Lycp66zFgKzPZ7iorXB4UMbRosPksChFZByPmFLl8EsXkWmWG6hv6h
 LImOeUz3lp8A2xT7OPoa+JpAxsfvM8+5SVf5hb3uUjEoDbQoU/rBuk342Bvys2IgoDKu
 uZeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hBxBPr3Kmhx+gtlKVfwmBEiG03qJgZIhVmQgwh7w3cs=;
 b=GrNT0+sdkn6W02ef+Zei8RPno9pjcH6X+PTHlBjKF0CO0sEfcBldV0B2S+QOB5CYj0
 Lajr0wanb75I2Bl3KNJYEn1jib06wjsmCL/+pBijlfnnoI5vfJPBRVlW0LcjtLVlGVie
 YMokcEW9EU2jEx/WGZ9BaLJO/YAY4F/iT1kre1lBsUV9YOOgTGB8e+Gv67frXRsVkJJH
 mPFl2b1607HimZOQ1e1igQTBei4AI2B+kXMA1xcNEVu5CIzGDZjTlo9TSqA7TkHEcx55
 qdzN6EsYioOQNeFrzl1wFiw2SG2PnIWoLYNTUjgTYVIepqgqtlxn0os53w+jlzPpjCw9
 9u7Q==
X-Gm-Message-State: AOAM531e5L7bjCcD3Du7+s3UABgRt6kmiheCQn4vXlvVw9XliOGXnIYa
 nQCepTraQMlrIl0GmPK51vyW0c1lCRUvTtLkJMM=
X-Google-Smtp-Source: ABdhPJz7/MeHPulwySfsZ/IqdizUu7xk9XmvlQXItyDL8PXG0Cim011tjNevkpfh3ADXQSZ3F7nxSBrSo9s72Oey3Go=
X-Received: by 2002:a2e:a903:: with SMTP id j3mr2694040ljq.347.1629978784221; 
 Thu, 26 Aug 2021 04:53:04 -0700 (PDT)
MIME-Version: 1.0
References: <1629975460-17990-1-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1629975460-17990-1-git-send-email-shengjiu.wang@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 26 Aug 2021 08:52:53 -0300
Message-ID: <CAOMZO5BCsTMjJJPtLN6_seVcWb24A2ms11FP3HzR0i7t3GLSuA@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: fsl_rpmsg: add soc specific data structure
To: Shengjiu Wang <shengjiu.wang@nxp.com>
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Shengjiu,

On Thu, Aug 26, 2021 at 8:19 AM Shengjiu Wang <shengjiu.wang@nxp.com> wrote:

> +       rpmsg->soc_data = of_device_get_match_data(&pdev->dev);
> +       if (rpmsg->soc_data) {

This check is not necessary, because rpmsg->soc_data is always non-NULL.

Other than that:

Reviewed-by: Fabio Estevam <festevam@gmail.com>
