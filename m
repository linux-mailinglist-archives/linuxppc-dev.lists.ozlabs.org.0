Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD08290E7E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Oct 2020 03:33:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CClsZ2N8mzDqsm
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Oct 2020 12:33:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Xwl7fTXa; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CClqk6qfTzDqyv
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Oct 2020 12:31:58 +1100 (AEDT)
Received: by mail-pf1-x442.google.com with SMTP id e10so2495673pfj.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Oct 2020 18:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=6ZC06D0iTTUO33G/T+lGdFmHtlewUgM9PFYLzb4iwrw=;
 b=Xwl7fTXakw+Id+GamJRignbC3wIuvgG4DCZ5BdtMm3nt5spLmoBywf2pjwTIYCZwB9
 Q6wf6g5wn9q//ujl3fgP8S0Y/j77hmpsX4GHZCbSCVX1d7OhJIgCHmqjV96PzfA4FgGE
 RMaNFr/6rdNbBIomEVktNvrwhioUCH5x5IAs6/56kx5FdqYpIOnxG09rYttZVJYXsEsQ
 0IgfprM38tLVQj526n5jQCshEC4qbYe0sPbqjUfwAom+5J5aRThUgOE5WmCCvuXs115m
 Ob2l1rJNAIAQht+Nml/KSb/0QuBX5n27I52MgWgIlbZvoX3v5EATNoXn/UzMsP8KP4nk
 QEqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=6ZC06D0iTTUO33G/T+lGdFmHtlewUgM9PFYLzb4iwrw=;
 b=kfOSDpxXk31vuseL0rH3KTbU6F+Xuo4rBcF12rNz0McvB0AIxiluafzgp1rNypS0ma
 KbYvD5DWcTFPkjxLJa7D5UjbaKiAynVQZTjhgLBUb9BMREzRZRhTYHXaFmt1jVcLkecd
 6Qi26cU9WJ45pDF9HFXlD84S3McPL44G147TX5q5LJDxTiJYXVmdys/hHPxMyh1O/6I0
 GoK69aibM3oSTwOefxDsJoARcs+EqeFvD6901Zy7h21+OpavuPutPiQYBB27pXediA55
 ENnSYs1cvR4q052/kd30himitptvWxIjtxiBEe+6e+1TgYfgbNIGPnyDzgk/8en5VeDP
 f79A==
X-Gm-Message-State: AOAM533xNUiqUFUjxcm54IFEYzIwKiAkXYZuCwIfLsfUTMQpOgGEXuCy
 54dccEVOwB0tT7hWqRgUuAM=
X-Google-Smtp-Source: ABdhPJy9Sq3Gb2gNQVBxCZsnLTyNuwhLGfjeZ3YDfcSBoV/3Kocl9r/EvT9sZigEX7aCkakAlBPdNw==
X-Received: by 2002:a63:3e41:: with SMTP id l62mr5514054pga.419.1602898315175; 
 Fri, 16 Oct 2020 18:31:55 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id 194sm3958054pfz.182.2020.10.16.18.31.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 16 Oct 2020 18:31:54 -0700 (PDT)
Date: Fri, 16 Oct 2020 18:23:26 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH 2/2] ASoC: fsl_spdif: Add support for i.MX8QM platform
Message-ID: <20201017012325.GB7203@Asurada-Nvidia>
References: <1602739728-4433-1-git-send-email-shengjiu.wang@nxp.com>
 <1602739728-4433-2-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1602739728-4433-2-git-send-email-shengjiu.wang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, timur@kernel.org,
 Xiubo.Lee@gmail.com, lgirdwood@gmail.com, linuxppc-dev@lists.ozlabs.org,
 tiwai@suse.com, robh+dt@kernel.org, perex@perex.cz, broonie@kernel.org,
 festevam@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 15, 2020 at 01:28:48PM +0800, Shengjiu Wang wrote:
> On i.MX8QM, there are separate interrupts for TX and RX.
> 
> As the EDMA can't be configured to swing back to first FIFO
> after writing the second FIFO, so we need to force the burst
> size to be 2 on i.MX8QM. And EDMA don't support to shift
> the data from S24_LE to S16_LE, so the supported TX format
> is also different on i.MX8QM.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

One small nit, yet I am okay if you don't resend. So:

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

>  /* Check if clk is a root clock that does not share clock source with others */
> @@ -1283,6 +1313,8 @@ static int fsl_spdif_probe(struct platform_device *pdev)
>  	/* Initialize this copy of the CPU DAI driver structure */
>  	memcpy(&spdif_priv->cpu_dai_drv, &fsl_spdif_dai, sizeof(fsl_spdif_dai));
>  	spdif_priv->cpu_dai_drv.name = dev_name(&pdev->dev);
> +	spdif_priv->cpu_dai_drv.playback.formats =
> +				spdif_priv->soc->tx_formats;

Kernel no longer has strict 80-character limit now, and it seems
to fits 80 characters?
