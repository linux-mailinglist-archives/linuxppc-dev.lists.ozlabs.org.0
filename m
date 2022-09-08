Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EA95B27BF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Sep 2022 22:33:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MNrRq0sWRz3c6X
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 06:33:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lCAHHHtG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com; envelope-from=nicoleotsuka@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lCAHHHtG;
	dkim-atps=neutral
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MNrR90RqRz2yS0
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Sep 2022 06:32:51 +1000 (AEST)
Received: by mail-wr1-x42d.google.com with SMTP id o25so3542839wrf.9
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Sep 2022 13:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=vaR+PRR/c8VGDxG3pWSaeOmzf/CHklELeimE/+fWPMY=;
        b=lCAHHHtGrq9cNEZkhFfMbtPxHscDK7s0S4yHqSiFF3nde/Kclq1HENHQQhVHeUt9Yj
         D/9+fdKfsyfKL3ZSZntsRfDnls3ySehyrEFIyUYVB5xt7JACTP/dkpVza+mmKUvv2FKq
         oPDBxtsu1GQFlk0Rt+PqICrAQ1shTZq0nXN24wPlw6Aum6LGRiGShk3pLvhytTx2Y1fz
         UXLNaDng7ZEiYEUBVwbARxTMEvShiKmkHJ0DjHqynta2OncqVGAGUomZZYvL2B4KxOS0
         5JC1hJkVwLq/cwbHpzgru3X55StUYRb9OEezfeaoevF5Ba8NAaF7CiEn9cppS4+T/Na/
         KuBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=vaR+PRR/c8VGDxG3pWSaeOmzf/CHklELeimE/+fWPMY=;
        b=jD4v4+fk6RgsCrAoAEOwtt/0PqhLBUHQ9spqIaPt2gGQjrYUGuPoKy2lS0KNyj/I2f
         l7GDtY0uaG3qZYHqoXwqfx0GP8NOky8x2vPfwAki29YlEydS6p1/BnnJCnCZGNbqCdp3
         Z/q1V43IGJ7aQcbFSNaMSx8Q//9xfZQmVpcRRhGZQLXiUZbp8F1DNGZgsn0JkYsOwXFL
         yScCFv82+HD4ryv+Q9mpI9RS3UeTkCNrR7KjguCLTnapVMPuwVj6F9J9/0mAcDdGqi6v
         PDPsUNNFaSvW/cPAx6HGsI1gJ4nxxhH+Xxad7pS4Io6o0p9shzrXnMh2lKSdJGoKv5B2
         dn1Q==
X-Gm-Message-State: ACgBeo2jxZrK8MzqN7COcS59AC8OQc11Y77qm62FM5aXnz3ymlxfuQ2V
	maH99XFbKk9yr1H4YJEC05RwI2R4epuhyRT/TzI=
X-Google-Smtp-Source: AA6agR7lafh5iFDYSngDCJLO1yWQBBaEIcCgTmgJJZt1Q4q1I7mTv9rD219dWAKV0aSj6u6/8XmjvrSPmjTKI+DJsZU=
X-Received: by 2002:a05:6000:168e:b0:220:87da:c3e4 with SMTP id
 y14-20020a056000168e00b0022087dac3e4mr6000203wrd.559.1662669163591; Thu, 08
 Sep 2022 13:32:43 -0700 (PDT)
MIME-Version: 1.0
References: <1662519715-21891-1-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1662519715-21891-1-git-send-email-shengjiu.wang@nxp.com>
From: Nicolin Chen <nicoleotsuka@gmail.com>
Date: Thu, 8 Sep 2022 13:32:32 -0700
Message-ID: <CAGoOwPSCQF9WC=jhV79wnqDQ-puL+=yuF1u1oEpomZU9FRzBbA@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: fsl_asrc: Add initialization finishing check in
 runtime resume
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
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, Xiubo.Lee@gmail.com, festevam@gmail.com, tiwai@suse.com, lgirdwood@gmail.com, perex@perex.cz, broonie@kernel.org, shengjiu.wang@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 6, 2022 at 8:20 PM Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
>
> If the initialization is not finished, then filling input data to
> the FIFO may fail. So it is better to add initialization finishing
> check in the runtime resume for suspend & resume case.
>
> And consider the case of three instances working in parallel,
> increase the retry times to 50 for more initialization time.
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Some nitpicks inline.

Otherwise,
Reviewed-by: Nicolin Chen <nicolinc@gmail.com>

> @@ -20,6 +20,7 @@
>
>  #define IDEAL_RATIO_DECIMAL_DEPTH 26
>  #define DIVIDER_NUM  64
> +#define INIT_TRY_NUM 50

s/TRY/RETRY

> @@ -592,6 +593,10 @@ static void fsl_asrc_start_pair(struct fsl_asrc_pair *pair)
>                 reg &= ASRCFG_INIRQi_MASK(index);
>         } while (!reg && --retry);
>
> +       /* NOTE: Doesn't treat initialization timeout as error */

s/as error/as an error

> +       if (!retry)
> +               dev_warn(&asrc->pdev->dev, "initialization isn't finished\n");

Could print which pair; or perhaps pair_warn?

> @@ -1295,6 +1301,20 @@ static int fsl_asrc_runtime_resume(struct device *dev)
>         regmap_update_bits(asrc->regmap, REG_ASRCTR,
>                            ASRCTR_ASRCEi_ALL_MASK, asrctr);
>
> +       /* Wait for status of initialization for every enabled pairs */

s/every/all

> +       do {
> +               udelay(5);
> +               regmap_read(asrc->regmap, REG_ASRCFG, &reg);
> +               reg = (reg >> ASRCFG_INIRQi_SHIFT(0)) & 0x7;
> +       } while ((reg != ((asrctr >> ASRCTR_ASRCEi_SHIFT(0)) & 0x7)) && --retry);
> +
> +       /*
> +        * NOTE: Doesn't treat initialization timeout as error

s/as error/as an error/

> +        * Some of pair maybe success, then still can continue.

+        * Some of the pairs may succeed, then still can continue.

> +        */
> +       if (!retry)
> +               dev_warn(dev, "initialization isn't finished\n");

Could print which pair.
