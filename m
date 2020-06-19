Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 202EB2001C4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 07:51:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49p7Gj3cgDzDrP1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 15:51:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VLVq/MTQ; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49p7Dx1mvrzDrMS
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jun 2020 15:50:08 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id n2so3480635pld.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jun 2020 22:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=uJunhxgU/GhtFdUD98Pvml4aHtu/6+uQFMKPVljojZY=;
 b=VLVq/MTQU/NNg1KDEodPCc0dIVnRN0lPQnSff9+nrJhdE1v5B72E4p0G+nx7HDdROB
 TwUXIT0/yD8D0OJ+3VxMmx+8x23YbT8Wxj//0vsxG6/Pag1QcQlwYCEIhI9n09u4bPaF
 dR7NvqkQyN/C+6IU3hD6PN/CmCZsXNgwBR9NIg8ZJ8KWDhDpnNHqyBXnwffA9CRTJ8h3
 LbaWrqCCkrPlv1EKl5zAswa/WrO+a2HBU0tpoe5lafMudJGyYhwoW7Qw74dZ2u1El1yR
 Ab7eDkHYshROtUglv+eB0hoCm1UgWZDNEr1+xgIzG5oodweXDbRJ9G5zWb2M9ZPjnjxL
 3s8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=uJunhxgU/GhtFdUD98Pvml4aHtu/6+uQFMKPVljojZY=;
 b=caxxIcMFsLsBoKTtgysUhbzEfkfntLrv6bIqdFWkF/cuk3u3K+PVTdTrdDywDyNR6U
 JNdmRSguhEJnyhrKKSMKfOuRcL/FvoTM6qvWRBbctLLVrwDv9ddJKgNlgHEVZojamyFx
 WlpohS7EWC9U4snkVfoHiRoY2k2ePZqx4sMurdCSxG2F07jnvwmpfnQYn1l/ajx9Ud3n
 D0OOOaJikily4vgrkcvG2oEdxP4UPMQJA12Y/8OxeDrzu6sS4HYAif1sxeNIZsuYw+Hc
 /oBlPautlUBtSHp3+28C+5IuwpCBQKP4OkQkKFeDBqzxC6OANPimV7gOMtyUTTTkucn1
 EpPQ==
X-Gm-Message-State: AOAM530fN84FOPdlcczy5PZlkUaGyN66cyFZlLw7gg7tudl497DHsejT
 BASC/xPEL7vB4OyKMdhIII8=
X-Google-Smtp-Source: ABdhPJx9GYYwyzfa4Sv6g1ItpE1EMJ1VSw6RWycMP3Mmz6sGniIT+wDPwVV1zAwACzJLNVQELZuDEQ==
X-Received: by 2002:a17:90a:1a17:: with SMTP id
 23mr1880621pjk.231.1592545803758; 
 Thu, 18 Jun 2020 22:50:03 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id w17sm5028544pff.27.2020.06.18.22.50.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 18 Jun 2020 22:50:03 -0700 (PDT)
Date: Thu, 18 Jun 2020 22:49:43 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_spdif: Add pm runtime function
Message-ID: <20200619054942.GA25856@Asurada-Nvidia>
References: <1592481334-3680-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1592481334-3680-1-git-send-email-shengjiu.wang@nxp.com>
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
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, perex@perex.cz,
 broonie@kernel.org, festevam@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 18, 2020 at 07:55:34PM +0800, Shengjiu Wang wrote:
> Add pm runtime support and move clock handling there.
> Close the clocks at suspend to reduce the power consumption.
> 
> fsl_spdif_suspend is replaced by pm_runtime_force_suspend.
> fsl_spdif_resume is replaced by pm_runtime_force_resume.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

LGTM, yet some nits, please add my ack after fixing:

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

> @@ -495,25 +496,10 @@ static int fsl_spdif_startup(struct snd_pcm_substream *substream,

>  
> -disable_txclk:
> -	for (i--; i >= 0; i--)
> -		clk_disable_unprepare(spdif_priv->txclk[i]);
>  err:
> -	if (!IS_ERR(spdif_priv->spbaclk))
> -		clk_disable_unprepare(spdif_priv->spbaclk);
> -err_spbaclk:
> -	clk_disable_unprepare(spdif_priv->coreclk);
> -
>  	return ret;

Only "return ret;" remains now. We could clean the goto away.

> -static int fsl_spdif_resume(struct device *dev)
> +static int fsl_spdif_runtime_resume(struct device *dev)

> +disable_rx_clk:
> +	clk_disable_unprepare(spdif_priv->rxclk);
> +disable_tx_clk:
> +disable_spba_clk:

Why have two duplicated ones? Could probably drop the 2nd one.
