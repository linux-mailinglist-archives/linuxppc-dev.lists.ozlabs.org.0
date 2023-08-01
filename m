Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1303676B704
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 16:16:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=q9RCquid;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RFcbk6ykTz30PJ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Aug 2023 00:16:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=q9RCquid;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com; envelope-from=daniel.baluta@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RFcZp4Hxvz2ygX
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Aug 2023 00:15:28 +1000 (AEST)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-51e28cac164so14365863a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Aug 2023 07:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690899324; x=1691504124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o5wcObMxzRxgJ/VGkUZYGz4Wsi7oqPu6vEBYDrbZUZY=;
        b=q9RCquidQw67B2U7NV0lUR3RLSgvUdXx4mxan8WfH2/O9eZwsXL0bb1PGVAvYsxwnp
         06M0pK1KK8u8zta9fnO88ZYgHMAO7KGAxVIrcdaHAEVSyWv0qiywWjMKoBH6w3jOCIEr
         WK2NVGFvFF5rQGSPakaNAHtu60j0MPF4TbUvVPOwTPZ4cQMeYni54zHK6GKbWETrEuAm
         i+FGO/azI+j2M6O6eyNx2KH8lZblsHQWg7zAyqy8Q/Df7OR9+9+IDohM3w2ml6RMZsyD
         liKDKUJgQQoTkbo/+tDmoAhDISUOswqX96AemW3CV8vny1Le1XQT2CdNRhzzYtaawU06
         AmNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690899324; x=1691504124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o5wcObMxzRxgJ/VGkUZYGz4Wsi7oqPu6vEBYDrbZUZY=;
        b=XNYB0iTUvoiJyoFJ4+qh90L+6FGhLZyj4qNyQnPY/5EPHajsHNIm1VT7kxAwXNDdkt
         wJoV7ddpbuyl14NJr2OURWyvUCKk6XsEpUpICgu4X46ZNFY+ekUZKFhbCSMg/rOf9RjO
         mTbP1wD5c6JGqEoILZ3Vbyv55xNjPhqh0PdG9BT1RGrXSuXv3/bdW/K2+zVZU0zxFMrA
         t5Jy7t7jVFbIZKrCtxb4eIC9S2cuU6oVb0PQrqJGBjU6MohOUn+YPNEp/inE3S/A4Ggp
         GG1MuqlGe2YiCRxAF/wTs4kFAbLwhQgxU427QdGnpusU682Dh5G8d8VFB6wRC3v4wYGu
         HL1A==
X-Gm-Message-State: ABy/qLboBxiRDqdmLknNuvLBF31Q5ik3GOnIV00bC8YyAxPmA5RreJnP
	Hl4wRIT6lERCWtSV2/NdFLGhrk6RpubQ1e8i8CA=
X-Google-Smtp-Source: APBJJlEiW7hEWKS0AOx5RN387hGF4qaTWWByX/+/lv6OzQgkUgUaVOdvPTiZdaS48r4jh/JdMc5HjLdpR7IqvxcQCu8=
X-Received: by 2002:a05:6402:517a:b0:522:582c:f427 with SMTP id
 d26-20020a056402517a00b00522582cf427mr3659632ede.14.1690899324010; Tue, 01
 Aug 2023 07:15:24 -0700 (PDT)
MIME-Version: 1.0
References: <1690265540-25999-1-git-send-email-shengjiu.wang@nxp.com> <1690265540-25999-6-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1690265540-25999-6-git-send-email-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 1 Aug 2023 17:15:12 +0300
Message-ID: <CAEnQRZBAde4t5V2HCvCQfVwVYaQPhzJ-t3hzePjueyTONEim=w@mail.gmail.com>
Subject: Re: [RFC PATCH v2 5/7] media: imx: fsl_asrc: Add memory to memory driver
To: Shengjiu Wang <shengjiu.wang@nxp.com>
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
Cc: nicoleotsuka@gmail.com, alsa-devel@alsa-project.org, lgirdwood@gmail.com, Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org, tiwai@suse.com, linux-media@vger.kernel.org, tfiga@chromium.org, hverkuil@xs4all.nl, linuxppc-dev@lists.ozlabs.org, broonie@kernel.org, sakari.ailus@iki.fi, festevam@gmail.com, perex@perex.cz, mchehab@kernel.org, shengjiu.wang@gmail.com, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 25, 2023 at 10:31=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.c=
om> wrote:
>
> Implement the ASRC memory to memory function using
> the v4l2 framework, user can use this function with
> v4l2 ioctl interface.
>
> User send the output and capture buffer to driver and
> driver store the converted data to the capture buffer.
>
> This feature can be shared by ASRC and EASRC drivers
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  drivers/media/platform/nxp/Kconfig        |  12 +
>  drivers/media/platform/nxp/Makefile       |   1 +
>  drivers/media/platform/nxp/fsl_asrc_m2m.c | 962 ++++++++++++++++++++++
>  include/sound/fsl_asrc_common.h           |   9 +
>  4 files changed, 984 insertions(+)
>  create mode 100644 drivers/media/platform/nxp/fsl_asrc_m2m.c
>
> diff --git a/drivers/media/platform/nxp/Kconfig b/drivers/media/platform/=
nxp/Kconfig
> index a0ca6b297fb8..359f11fe2a80 100644
> --- a/drivers/media/platform/nxp/Kconfig
> +++ b/drivers/media/platform/nxp/Kconfig
> @@ -56,3 +56,15 @@ config VIDEO_MX2_EMMAPRP
>
>  source "drivers/media/platform/nxp/dw100/Kconfig"
>  source "drivers/media/platform/nxp/imx-jpeg/Kconfig"
> +
> +config VIDEO_FSL_ASRC_M2M
> +       tristate "MXP i.MX ASRC M2M support"

s/MXP/NXP


> +       depends on V4L_MEM2MEM_DRIVERS
> +       depends on MEDIA_SUPPORT
> +       select VIDEOBUF2_DMA_CONTIG
> +       select V4L2_MEM2MEM_DEV
> +       help
> +           Say Y if you want to add ASRC M2M support for NXP CPUs.
> +           It is a completement for ASRC M2P and ASRC P2M features.

Complement for?
