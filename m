Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C96832B811
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Mar 2021 14:38:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DrFSt1bhMz3cnP
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 00:38:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=jfBdSINz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::133;
 helo=mail-lf1-x133.google.com; envelope-from=festevam@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=jfBdSINz; dkim-atps=neutral
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DrFSR4Tk9z30NC
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Mar 2021 00:38:13 +1100 (AEDT)
Received: by mail-lf1-x133.google.com with SMTP id 18so28567817lff.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Mar 2021 05:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7X3zWC8sv43JidvGXEJ+sxG+iFcCaZnwd3GWkVHn2QA=;
 b=jfBdSINz37HSrdFGnR+6H3pATTxbQpYj2UOeoXb+AdSBeZ9+RTage79zGmlP1tJ27V
 yKuiSaKmTISJjOzC6svcUltAcpl2pCPtZIzF0opf8QtBGTK1tqwrOGqsWaDy8uR/Iz7u
 ffNWNNrSvY7lS5rbtzNDtHVteYBcLJMVcdfM0JHYMP+LZYdzi6pk5utjKw+1ZMtL0Q8a
 5K3GErMzYf60UFNnXMMZdlmvwhG0c2lRU/mjPMCJsGjIRVXvlgFROVEEFla80cBu+m9k
 X5Rvnw+53pgGzxkoMpR8gOLa92SH45HJp3FsbtY8XQCl8YXJXCshw8JLngX+MOtNP84d
 1kjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7X3zWC8sv43JidvGXEJ+sxG+iFcCaZnwd3GWkVHn2QA=;
 b=gjQae+j9NLEMSCaYqFh+X2KHlpkdpFh4oqUE3kv1fZw3rK1F1xn9QF/2PJF5GA/KXs
 KwUogvVQFfkvzBW6iX26NzO6a8ppwkRYpq17FtDXV3e9oaGrs8WS1qD/Q7wXosszrMBn
 fG01CQiUgezk18M60aPb1+1a3nqcmrLKESflJylaXEWd8HmhMVHhR+q4SwNl/akZbpEF
 cz5PWchNQRB1PB4BV2UWbmFHb/+PVlgfRaIs4bXF7Iu1k8zcl7rIwQm4KR2PJj1ce1Nf
 UoPxsvfdORtCAsN1D6dBCLgQv2syF9znbj9qthFFgrK0zIbJm6D6htEfl/vg5ER31UYZ
 Z93A==
X-Gm-Message-State: AOAM533sk4mXUoXDHRcHi5wPM9uAiYDkBTnmxhQHY5sS8YBt6Ix2EcJJ
 dyqxkPU3ra7jf1gzin6nv87qXGZP5i5tEEwA0BU=
X-Google-Smtp-Source: ABdhPJxAbpN/v8nH1IMKL/0Yhn98LsdY93KrfCpYhZOjPth1T7NFb3VeIt9Sd5cBNd1j5i9L446+OO+8m4icOEYwBvg=
X-Received: by 2002:a05:6512:6c3:: with SMTP id
 u3mr14579626lff.443.1614778688677; 
 Wed, 03 Mar 2021 05:38:08 -0800 (PST)
MIME-Version: 1.0
References: <1614761651-86898-1-git-send-email-yang.lee@linux.alibaba.com>
In-Reply-To: <1614761651-86898-1-git-send-email-yang.lee@linux.alibaba.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 3 Mar 2021 10:37:57 -0300
Message-ID: <CAOMZO5DhvAX3=Xv=v+yCRyzXhP0g9=016GcsRKOjBzjTvZ9X_w@mail.gmail.com>
Subject: Re: [PATCH] ASoC: hdmi-codec: fix platform_no_drv_owner.cocci warnings
To: Yang Li <yang.lee@linux.alibaba.com>
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel <linux-kernel@vger.kernel.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Yang,

On Wed, Mar 3, 2021 at 5:54 AM Yang Li <yang.lee@linux.alibaba.com> wrote:
>
> ./sound/soc/fsl/imx-hdmi.c:226:3-8: No need to set .owner here. The core
> will do it.
>
> Remove .owner field if calls are used which set it automatically
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

The patch looks good, but please send a v2 with the correct Subject.

It should mention imx-hdmi instead of hdmi-codec.

Thanks
