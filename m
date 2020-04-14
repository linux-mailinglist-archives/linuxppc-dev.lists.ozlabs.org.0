Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 292E51A7192
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 05:17:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491Vz01PfTzDqN5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 13:17:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=QqZbwjSj; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491TR03GZwzDqJQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 12:07:43 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id l1so5379281pff.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Apr 2020 19:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=5D/iZIZkZcDpS6kx/415RbCsRqRRwuRfxlRc0sHly4Y=;
 b=QqZbwjSjtSQpz3SlpqPldzbuhg+pariHVz063YbZ4QNr9Xz+hN6U5IXK6wCVyWLIv1
 oPKQ3EOsiwcSEXmEFvumckWdvyrHCNQ1pGubuZyHL6nP8oEhqyz6es8MI3/8nNZU5kk6
 vk+dFx8JFF93z87qrdOLMMGMSWOjEgD3ZPnOI/IUC+qVep5mOB9514q6OHOBmfT/B/vf
 okKTY4rNaBuRlKmOTYoF2/dRnATUq8OfPh5ML382ZwzwMhAuaJkut+dapH9nOuhGVCUc
 Qh/ZQsfd4d2EGHx1rgk2GmFcKtnBbSzVgSL+TQiWtxoxwnKTLZIo5/yj4qJKGHsftFzY
 YAmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5D/iZIZkZcDpS6kx/415RbCsRqRRwuRfxlRc0sHly4Y=;
 b=C/kFMAnnnJf5IeFmvG2BtEaAWc/xHtYMA/YVgNTKajCk8sniAm68K15E0BXwKv1XEV
 u/En23MUM7aG/wHSThYuMP6qQ2FWGGSXwJ3H18DqqtQlh0mr6zmrRvNI33+RodDGb+Wb
 +mrxvGIqzLj9AmTCKLb0CIXqP+HHT9DMyBCoMzUdTHLdDuf51hvQ24zzBn2+VWVmxXm3
 M+tPwK/BSqng0AOJzjtMZYwx+n1GfVnyen9d8Fjeym6OJ1cpmzZWLn7yg9e2tZsqWUyS
 zP9k5SZ4zft+wglXEoEPynYjt6A1RBea2odaSE/xMwJT+7MC0ETpTi6HJ7tT+OYGc2v/
 9qvQ==
X-Gm-Message-State: AGi0PuZ57NQqzW0NRMOluP8+7xdr2hLSpkMuaZzJEqA0YLcpHUQI5WxP
 JKIX8WhAXxTwC5Xe+ciMZQY=
X-Google-Smtp-Source: APiQypLK639UxIA+FT+5Ot/3qPNoOsaHuQJ8finTEvj7k/GdLBDOknElzhbA4HM7L3jjPzj13KJKYA==
X-Received: by 2002:a63:5d7:: with SMTP id 206mr8048114pgf.136.1586830058811; 
 Mon, 13 Apr 2020 19:07:38 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id y71sm9900161pfb.179.2020.04.13.19.07.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 13 Apr 2020 19:07:38 -0700 (PDT)
Date: Mon, 13 Apr 2020 19:07:49 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v7 5/7] ASoC: fsl_asrc: Move common definition to
 fsl_asrc_common
Message-ID: <20200414020748.GB10195@Asurada-Nvidia.nvidia.com>
References: <cover.1586747728.git.shengjiu.wang@nxp.com>
 <6d2bed91bcdbc3f75a9d12ac4ebf6c34c9bb9c3f.1586747728.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6d2bed91bcdbc3f75a9d12ac4ebf6c34c9bb9c3f.1586747728.git.shengjiu.wang@nxp.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
 robh+dt@kernel.org, perex@perex.cz, broonie@kernel.org, festevam@gmail.com,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 14, 2020 at 08:43:07AM +0800, Shengjiu Wang wrote:
> There is a new ASRC included in i.MX serial platform, there
> are some common definition can be shared with each other.
> So move the common definition to a separate header file.
> 
> And add fsl_asrc_pair_priv and fsl_asrc_priv for
> the variable specific for the module, which can be used
> internally.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

> diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
> +static size_t fsl_asrc_get_pair_priv_size(void)
> +{
> +	return sizeof(struct fsl_asrc_pair_priv);
> +}

Perhaps we haven't understood completely each other's point.

Yet, would the following change work?

> diff --git a/sound/soc/fsl/fsl_asrc_common.h b/sound/soc/fsl/fsl_asrc_common.h
> new file mode 100644
> index 000000000000..b15244e027d0
> --- /dev/null
> +++ b/sound/soc/fsl/fsl_asrc_common.h
> +struct fsl_asrc {
> +	size_t (*get_pair_priv_size)(void);

+	size_t pair_priv_size;

> diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
> @@ -992,25 +1012,32 @@ static int fsl_asrc_probe(struct platform_device *pdev)
> +	asrc->get_pair_priv_size = fsl_asrc_get_pair_priv_size;

+	asrc->pair_priv_size = sizeof(struct fsl_asrc_pair_priv);

> diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
> @@ -311,11 +311,12 @@ static int fsl_asrc_dma_startup(struct snd_soc_component *component,
>  		return ret;
>  	}
>  
> -	pair = kzalloc(sizeof(struct fsl_asrc_pair), GFP_KERNEL);
> +	pair = kzalloc(sizeof(*pair) + asrc->get_pair_priv_size(), GFP_KERNEL);

+	pair = kzalloc(sizeof(*pair) + asrc->pair_priv_size, GFP_KERNEL);
