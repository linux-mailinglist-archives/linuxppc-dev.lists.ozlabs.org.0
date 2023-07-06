Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 340EE749AB3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 13:34:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=JxJO+d4u;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxZDT0n8dz3c4D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 21:34:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=JxJO+d4u;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=festevam@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QxZCY3s1yz30fL
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 21:33:11 +1000 (AEST)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-656bc570a05so129918b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Jul 2023 04:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688643188; x=1691235188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OBA///uk720bFWE3dLLyUaJz2IB5x6XkswygeQlz+4Q=;
        b=JxJO+d4uzSTxJ2fF2toUC9woxojvsRwpyUY80xQLq8t2WNJGj/HNq8LIlhTp9+7bX2
         BtIQlcsqjrjc8f1JkTTXTY1Gupt8OSQ2IZrxCzwQIIr1PGKbK0AqdgZUiHXq7iLP+Nss
         q4/SUhu1n1adAYLLficaE/KFjO19z1hQO0m7oCo5hoIz2/uQyxBF4MhSHtKV3kie0b5Q
         zJIG4yBT2SkdSceiEHpG7A4ZjmTIGZdPYQYYTU1/AT637rEh9dnURlnNZZgqRGlDw1mZ
         lRk/nv7Y4kjWhSGp1y7ssfGFYMmRvayjk9FhQg4TuNUIY5vv7wODHj2uadbXh26TLZok
         AQLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688643188; x=1691235188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OBA///uk720bFWE3dLLyUaJz2IB5x6XkswygeQlz+4Q=;
        b=A8izE8bjb8qdIkQthi3f4Xr40ngzj8P+QaZ2bnykTLaUjACY7Ss25HL6cTDfF6TS1L
         Vqp4ofVRWAYtDwquBmJf+CdNkjzZZqJ3qwLMh46SfByKXpUxbib7uUMVY5eMM4ICOGSC
         oKmHZ7BwOlQludNmB4FT/DLtyMdz88jXj2UUB+wT2dS1NSvDghfvF5dH6kwmLb/W9y+l
         L61Bq1Bp7mLVFa0xf8MyHcNwWcatHfU1qDSuVMKkgb+HHGPDH6b6IqIyJMDNmcGzwzJl
         1cDm3sjvT4qs/U/w7+YYXX4JS0Amb7PJaXDhSQ7H4U5pfUXGKWy0E1WucxxMN2cFqlwd
         kKYQ==
X-Gm-Message-State: ABy/qLbkE7jPweMl7k9UwfffySmH6RFs23LRNtBsv4W7YH8wobXstTXv
	N6t4cFQAtncXeAc3wTIoIuztkKK32BP8XyyWf6s=
X-Google-Smtp-Source: APBJJlGFh/kKWEOFbD8l2/GsLDJj5JTKw1DEIDejRqTb9QUKteSEj/kbrP0Li8/S3pvYkKSEWGyxurF18028Ok6EdhE=
X-Received: by 2002:a05:6a20:54a9:b0:12d:77e:ba3 with SMTP id
 i41-20020a056a2054a900b0012d077e0ba3mr2051265pzk.0.1688643188564; Thu, 06 Jul
 2023 04:33:08 -0700 (PDT)
MIME-Version: 1.0
References: <1652963808-14515-1-git-send-email-shengjiu.wang@nxp.com>
 <CAOMZO5DtpoH0dLDX3=Sv4UUpX_=66VEZPsJUWQNnYviApfMLKQ@mail.gmail.com>
 <20230706084706.bzwsbi3zisx5m5rl@fatal.se> <CAOMZO5CCdaodWQrHUQgMizoES=jfEtw-sNJZG-DJMpRD8tZW9g@mail.gmail.com>
 <CAA+D8ANAg7bs0A35c7Af3_-5sLaqvT1RoKfCbzYi=z=t_q9LUw@mail.gmail.com>
In-Reply-To: <CAA+D8ANAg7bs0A35c7Af3_-5sLaqvT1RoKfCbzYi=z=t_q9LUw@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 6 Jul 2023 08:32:57 -0300
Message-ID: <CAOMZO5BtrKwrMwrjVDbYn3ivt2uV9rzbSDxd8qfiYjOBMvKBgg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Enable MCTL_MCLK_EN bit for master mode
To: Shengjiu Wang <shengjiu.wang@gmail.com>
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Xiubo Li <Xiubo.Lee@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>, =?UTF-8?Q?Hans_S=C3=B6derlund?= <hans.soderlund@realbit.se>, Andreas Henriksson <andreas@fatal.se>, linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 6, 2023 at 8:19=E2=80=AFAM Shengjiu Wang <shengjiu.wang@gmail.c=
om> wrote:

> No, this is the code in probe().
> The code with the issue is in fsl_sai_set_bclk().

Yes, I put it in the wrong place.

> The clean way for fixing is to remove the code in fsl_sai_set_bclk()
> and add "fsl,sai-mclk-direction-output;" property in dts for some
> node.

Yes, what about this?

--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -507,7 +507,7 @@ static int fsl_sai_set_bclk(struct snd_soc_dai
*dai, bool tx, u32 freq)
                                   savediv / 2 - 1);
        }

-       if (sai->soc_data->max_register >=3D FSL_SAI_MCTL) {
+       if (sai->soc_data->max_register >=3D FSL_SAI_MCTL  &&
sai->mclk_direction_output) {
                /* SAI is in master mode at this point, so enable MCLK */
                regmap_update_bits(sai->regmap, FSL_SAI_MCTL,
                                   FSL_SAI_MCTL_MCLK_EN, FSL_SAI_MCTL_MCLK_=
EN);
