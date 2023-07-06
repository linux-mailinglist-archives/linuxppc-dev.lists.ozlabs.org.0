Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2FB749A3C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 13:09:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=lpWMMMk4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxYgb3zQRz3brm
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 21:08:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=lpWMMMk4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com; envelope-from=festevam@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QxYfk310Vz3bc7
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 21:08:14 +1000 (AEST)
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-5344d45bfb0so24507a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Jul 2023 04:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688641691; x=1691233691;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G84Dw5Ig2Kfn04ePqxCMIByfKhRpoEBfGjJKCC/CPmY=;
        b=lpWMMMk4+M0UTvc4sZgFla6gp1hZlkV4OKhMXVYtfsGRR5RgjYLg8+nN57lnngqdDr
         roBBzjzs1kupP1nDWffXYGrAJSCQTf0NzR+moyuBLb05NGn+eACyWiSj7VHaR+70lUUj
         FBp+UVssD1OqIRFeOoQEnEaJaYnSqWz+ABco3/EWzVtaZtkc9Y3TuoHzObw1MtKte6qw
         LPt0Pd0oMmqXx8yXG0tsAUaYYL5E1WMWnf4grrV7EshAJjOb3mjlcau7K9mR1lGGB/Oy
         ISDa/m3wtaENvJrpUL6WXLSPEDRhI51vdn050i5eU/m6Xz0p88291mqwWp3J1DuV0SJe
         rh5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688641691; x=1691233691;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G84Dw5Ig2Kfn04ePqxCMIByfKhRpoEBfGjJKCC/CPmY=;
        b=ZoausJkMdGpZ+1bIi8hg3VnpMxYTFhmU8Lps3R7XXtiCZsq8gT07UbTXvto1nifI9y
         rFl3U127zze1bOciOzMMlXyP+1/P8byRxLZB3/u5CjSGJJGm9A3SP5vTLJn980aPZ4o7
         BEMqsesgCNPi9Sb2R5t3MGnPvf8uosoJRptRGHOO9CARiyd9bhFUojbOTfba25U8+8sP
         qIddP2XqjgZnHnqmdbfGLsttjCRMu9XsVk61ChjKQzcZ6xinPxJcddeVj5izx+0yIuq8
         426wSptJy4ckKRv1PnmMEqUOrR/vyKWpwadomLOziXAu691GBEL3hUEPuPjy7k3tHieo
         YPvQ==
X-Gm-Message-State: ABy/qLYW2LYhv56tR3h5HLwBEmYffmWA5YOb/OE+q6SFCkGrIKmqFtqL
	f9QhSrUdkxfWgwE7cmsOBSM0j/Gf87ziYWf51z0=
X-Google-Smtp-Source: APBJJlEfvnVo+6BfRY2TBz2YQulzAtcJkrBgmENQyf9COZhtw1dVjiGfHsnITjVVTZiHpd0YcG9M9aXITp/zezUvGpQ=
X-Received: by 2002:a05:6a00:2d06:b0:66d:d03e:3493 with SMTP id
 fa6-20020a056a002d0600b0066dd03e3493mr1751099pfb.2.1688641691084; Thu, 06 Jul
 2023 04:08:11 -0700 (PDT)
MIME-Version: 1.0
References: <1652963808-14515-1-git-send-email-shengjiu.wang@nxp.com>
 <CAOMZO5DtpoH0dLDX3=Sv4UUpX_=66VEZPsJUWQNnYviApfMLKQ@mail.gmail.com> <20230706084706.bzwsbi3zisx5m5rl@fatal.se>
In-Reply-To: <20230706084706.bzwsbi3zisx5m5rl@fatal.se>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 6 Jul 2023 08:08:00 -0300
Message-ID: <CAOMZO5CCdaodWQrHUQgMizoES=jfEtw-sNJZG-DJMpRD8tZW9g@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Enable MCTL_MCLK_EN bit for master mode
To: Andreas Henriksson <andreas@fatal.se>
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Xiubo Li <Xiubo.Lee@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>, =?UTF-8?Q?Hans_S=C3=B6derlund?= <hans.soderlund@realbit.se>, Shengjiu Wang <shengjiu.wang@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Andreas,

On Thu, Jul 6, 2023 at 5:47=E2=80=AFAM Andreas Henriksson <andreas@fatal.se=
> wrote:

> We've been working on an i.MX8MP where MCLK needs to be input and found
> that this enables the MCLK as output despite not having set the
> `fsl,sai-mclk-direction-output;` devicetree property in our DT.
> Reverting the patch fixes the issues for us.
>
> I have to say that the code comment made me a bit confused, but once
> I found the commit message I understood why this code existed.
> If this is really i.MX8MM specific maybe mention that in the code
> comment and please make the code actually only trigger on i.MX8MM.
> It seems to me like these all fulfill the current criteria:
> imx7ulp, imx8mq, imx8mm, imx8mp, imx8ulp, imx93
>
> Should I report this in bugzilla.kernel.org ?

Should we do a fix like this?

--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1453,7 +1453,7 @@ static int fsl_sai_probe(struct platform_device *pdev=
)

        /* Select MCLK direction */
        if (sai->mclk_direction_output &&
-           sai->soc_data->max_register >=3D FSL_SAI_MCTL) {
+           sai->soc_data->max_register >=3D FSL_SAI_MCTL &&
sai->mclk_direction_output) {
                regmap_update_bits(sai->regmap, FSL_SAI_MCTL,
                                   FSL_SAI_MCTL_MCLK_EN, FSL_SAI_MCTL_MCLK_=
EN);
        }
