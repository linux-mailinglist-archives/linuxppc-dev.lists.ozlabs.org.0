Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 935E247A8D0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Dec 2021 12:34:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JHcv409mvz3c6R
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Dec 2021 22:34:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fL/aSdMN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f35;
 helo=mail-qv1-xf35.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=fL/aSdMN; dkim-atps=neutral
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JHctK73cnz2xBb
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Dec 2021 22:33:59 +1100 (AEDT)
Received: by mail-qv1-xf35.google.com with SMTP id js9so8994899qvb.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Dec 2021 03:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ib8Kih7Amxg/C5PLNgANyvS2G85OvDYw3t1xVRH3hC0=;
 b=fL/aSdMNkssqWy7s78XDEPpbq5/3gelPx7ScrqzppvAuEuv6t3M1100HL3mSlULtlc
 F0sqn8hZBz+MeV5zbPLtQsnn2/zCaRWlNiWr4jYM+VtQZosYPLkns1sOIjBoxq9U+OIM
 6TLjvsncy7mC8VlDJrHii60N/Y+8wSt2w9QMqHPTXu8WARntQLRB9tJkpRL9rnUg1Ha/
 M/yWagu/XXLk4qPSRcJq6xvBwLDJ/p5YlJ7W5TjFuhp10d6yN1kgglPkajbLtOdSMGSC
 Td3oLutGk8eFoyfSp19rSW89JF2b+UNJnJ7FXq2vRIRGXXp1cX6vNs+Ew0JfFERfgFnz
 h+IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ib8Kih7Amxg/C5PLNgANyvS2G85OvDYw3t1xVRH3hC0=;
 b=sKvJE41y5aUS3iw15q6c444bQptNgI4OM9M/P2PB/AHDmKy2OHm7VfvOM65gMvBZ9J
 wXvoPKxiPZ3LLPy/9WPVdUyiXwJzhKe4HxM+v3g57RFHVdhkTzQ0FhRxz1IsnXGNYXnM
 OF6PIV3klWdOYV7tFdNR4vqZgdNE49LIaYjAX6EJBFaCRFbSqX+PD5AT5DPbPBvL8RWO
 yopn9vYXtL3A7/ba4ocjyAaHIpTBiJmWGo0xCTemHPeXx7cF018GpuzTnlpi6NeAS139
 qXkbylW7EvH8ZxwoyS0w4Ql4/Lyjvjp8zYgYDjH1NbyHrZEyWJGrY9bGk31UnTt+Y3zX
 lcQg==
X-Gm-Message-State: AOAM531RGG06UC4xPa0FqLRUmpg99i1W8IwJl4DdpUbwMptJMaXfhKSV
 DZ4HBqzJjCfyC7O6lFbfBxq3lhuFjQZHdoRQTkI=
X-Google-Smtp-Source: ABdhPJxSwutSaVWp5ud4GYuWiIEhgPAAhF+uWzhLUzOnca4ez90/D72CI2qIraVw90NXzlcabzgkeg1U4D0UIxUBJA8=
X-Received: by 2002:a05:6214:2622:: with SMTP id
 gv2mr12310705qvb.128.1640000036192; 
 Mon, 20 Dec 2021 03:33:56 -0800 (PST)
MIME-Version: 1.0
References: <SL2PR06MB3082D6C1C65786A1E8DD0397BD709@SL2PR06MB3082.apcprd06.prod.outlook.com>
In-Reply-To: <SL2PR06MB3082D6C1C65786A1E8DD0397BD709@SL2PR06MB3082.apcprd06.prod.outlook.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 20 Dec 2021 19:33:45 +0800
Message-ID: <CAA+D8APDEhri4RKfjwSe-pM_xGKV+Oc6JVJUPFBqU8T+VH5K8A@mail.gmail.com>
Subject: Re: [PATCH] sound: fsl: add missing put_device() call in
 imx_hdmi_probe()
To: =?UTF-8?B?546L5pOO?= <wangqing@vivo.com>
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Dec 9, 2021 at 5:58 PM =E7=8E=8B=E6=93=8E <wangqing@vivo.com> wrote=
:
>
>
> >> From: Wang Qing <wangqing@vivo.com>
> >>
> >> of_find_device_by_node() takes a reference to the embedded struct devi=
ce
> >> which needs to be dropped when error return.
> >
> >...
> >
> >>        data =3D devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> >>        if (!data) {
> >> +             put_device(&cpu_pdev->dev);
> >
> >If it's of_find_device_by_node() you need an of_node_put() since you're
> >dropping a reference on the OF node.
> >
>
> Label fail will drop a reference on the OF node.
> Also, put_device() is called later except this branch,
> we just need to add put_device() here.
>
I agree with you. But could you please add the info in this
commit that
the commit:
f670b274f7f6 ASoC: imx-hdmi: add put_device() after of_find_device_by_node(=
)
is partially fixing the original issue, so we still need this fix.

Best regards
Wang Shengjiu
