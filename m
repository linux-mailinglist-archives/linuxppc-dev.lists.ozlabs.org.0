Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D615230B6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 12:33:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kyrpc1vQ8z3byG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 20:33:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=j7v8dV+o;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::633;
 helo=mail-ej1-x633.google.com; envelope-from=festevam@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=j7v8dV+o; dkim-atps=neutral
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kyrny0H2lz3bcj
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 May 2022 20:32:37 +1000 (AEST)
Received: by mail-ej1-x633.google.com with SMTP id bv19so3116106ejb.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 May 2022 03:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=diBqFc+BoWzAr/VmLH7dKrLdPRQvzkNUrCN5zzOorr4=;
 b=j7v8dV+of4JcYw6oQpjfYDg+/AhDGlh8rWDyVb4dNZFpWwCXA/ba7PSzuOc073fq5C
 CkbxcaE8TIYaP/pepZuL48hr/m1y4+28nijoEjmbwdqh6cKWZ9DJnWqZNJdkIV7JUYyK
 K+adh0jDs6KRrHOvq2jskXIux2qU/jq084T6hmNIBFHJD1Kdjv3EQgIogmZypxSboneH
 u24R/YdKD1LA+I5Zm3gwoh4EXivmzYiVlM1C6kwKzu3sEDV7G/8qbNQlrgM+GuoAmdEE
 TrmZCR0vnIxqBgF7fdIt1N9tzj894I735RdxUya0xlE6QJTIBqjtLCBvRhw/nG5KNTUv
 2ZWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=diBqFc+BoWzAr/VmLH7dKrLdPRQvzkNUrCN5zzOorr4=;
 b=4++IcyNbw8W7wH0YZLicSnC3ng7wntimUcPCUZpLGt/Tm3O3jj38hJn/tHWXpj35UA
 Z83cgjCOKtq29Ovm+ZxspV4vnN4Li7RCxBvpt6nnkStsxJhwSk6QTOvFfprfHEPWxmz/
 4EId/RfN/29LgaXRAWpCS3qO27lTu7lhXaFNx6/dKCkoyzGZ5ulM1FMvkr+6ZQojvDV2
 DrRHguqJcwr3jwPcp85Mr2V4APnTrBFyvA/Fi8a34+z5A6uJNV0iO2xZfsIbw8oLoN3B
 zEs31cPJAwLQ1vffEIDwRnSle6UARIULvu1NvaVCr7HwQ+911kbEa32PmmFgV95jGWu+
 agng==
X-Gm-Message-State: AOAM533FBz/1RKXOzdyci8xv+pu1A7wiAKGpTRxM+t1NVebVXv9FhMQX
 OUkM/YWG2uEYd3WL6rK3uFdUh4VNQlGzntIOY8Y=
X-Google-Smtp-Source: ABdhPJw6yj7TxbR0Hf9m7Lwxgm0Ky888mXXjlZZAf43y7eUMo7ah+68FM66Xr2uyLeand054/IqjszNELkdzUOz42E0=
X-Received: by 2002:a17:906:c14b:b0:6f8:e6bb:f8d5 with SMTP id
 dp11-20020a170906c14b00b006f8e6bbf8d5mr16921243ejc.4.1652265151596; Wed, 11
 May 2022 03:32:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220511065803.3957-1-linmq006@gmail.com>
In-Reply-To: <20220511065803.3957-1-linmq006@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 11 May 2022 07:32:19 -0300
Message-ID: <CAOMZO5AqKNg36_OBntqzpF6sYFitCMMJZP-KwFpYftJ76fdDsA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl: Fix refcount leak in imx_sgtl5000_probe
To: Miaoqian Lin <linmq006@gmail.com>
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Richard Zhao <richard.zhao@linaro.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 11, 2022 at 3:58 AM Miaoqian Lin <linmq006@gmail.com> wrote:
>
> of_find_i2c_device_by_node() takes a reference,
> In error paths, we should call put_device() to drop
> the reference to aviod refount leak.

s/aviod refount/avoid refcount

> Fixes: 81e8e4926167 ("ASoC: fsl: add sgtl5000 clock support for imx-sgtl5000")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
