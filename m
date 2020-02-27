Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F2904170F2E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 04:43:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Sdmv0LHZzDqqY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 14:43:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=gmPw2xDs; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Sdkb2SB7zDqnk
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 14:41:27 +1100 (AEDT)
Received: by mail-pl1-x642.google.com with SMTP id j7so567602plt.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 19:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=VUxAWoyzRwTi4XcElESOl4e7XyRqkwqcDDvJbUZpLIg=;
 b=gmPw2xDsx9eKdgHlZEL2xC7Li/8YBXlNbCA+spXw9KKfoPRWYY0KhEEeVo4KC2o1UN
 YrNfxZD2lybH9mVLDj+vW/MJcIbegJHj1PeRAO04tnf28Bv/GJDG5lEc0zPKDTubtW6+
 N7IuMJPmP3mVcy8XVAlTdaqT1E2JxhEK5v/xdHjeyy807augrdOuYwNg+xDbcKfjDq9v
 jHAcRGuwNzIN3Yw/yuXMpKSZYqA5MZXi+2ZxZzj23cJPP3h3/A246g+LJnfnF+zURjDt
 uuHLQb7zdWVZ7jWWWGre5ezDmXMZasplcYWQ8/KYy346t8KZDjAG1MAvSBaQZYpcfvF7
 BXIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=VUxAWoyzRwTi4XcElESOl4e7XyRqkwqcDDvJbUZpLIg=;
 b=PvudZyvIqKOK5ILtRJNmUvugwBB57Q+v4U/TTbGgc1PJIaFjcPhMDqE99PyufzO7K6
 z7btHwnPpFr5YW22UHtIbuMP7Q2LtR2V12fGjxSVUmqjsULk66VSHqcm997zXGj6XKSt
 5Pm7h3V45jGJjGpBRayJI05fzG+N/ahCVl6i5WggrIGxNOZBySYf1tnCb7yqreyYL3X3
 a81+n+14NJlvJicPGT1A2P+Ja/JMV+3WxFa1/1u8olNHhrQYTYQi4FXpxtR8iB70LDTM
 eHnA2gdfTJRfay+WWppkgoHkutY2tyiTWNhVu/rjrgQ1RFTGWTDocw26GJNxqYYqLvak
 qkuA==
X-Gm-Message-State: APjAAAUM1Pcdnph8CEQbqlojiE0UTL9IdBd2mNxuFsSwcJkNM/TXH2Iw
 +2pRqn1mbM6vcl/UwvkpE2Q=
X-Google-Smtp-Source: APXvYqwu67NFja14RMtsEQ5nHb9nwgFD7snOj2gBrL1Jp1A8X2Zh72CwRRaPQ6P9a1KCWadgsyQGaQ==
X-Received: by 2002:a17:902:7b94:: with SMTP id
 w20mr2521900pll.257.1582774883581; 
 Wed, 26 Feb 2020 19:41:23 -0800 (PST)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id e1sm4658282pff.188.2020.02.26.19.41.22
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 26 Feb 2020 19:41:23 -0800 (PST)
Date: Wed, 26 Feb 2020 19:41:21 -0800
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v3 1/4] ASoC: fsl_asrc: Change asrc_width to asrc_format
Message-ID: <20200227034121.GA20540@Asurada-Nvidia.nvidia.com>
References: <cover.1582770784.git.shengjiu.wang@nxp.com>
 <ffd5ff2fd0e8ad03a97f6a640630cff767d73fa7.1582770784.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ffd5ff2fd0e8ad03a97f6a640630cff767d73fa7.1582770784.git.shengjiu.wang@nxp.com>
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

On Thu, Feb 27, 2020 at 10:41:55AM +0800, Shengjiu Wang wrote:
> asrc_format is more inteligent variable, which is align
> with the alsa definition snd_pcm_format_t.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  sound/soc/fsl/fsl_asrc.c     | 23 +++++++++++------------
>  sound/soc/fsl/fsl_asrc.h     |  4 ++--
>  sound/soc/fsl/fsl_asrc_dma.c |  2 +-
>  3 files changed, 14 insertions(+), 15 deletions(-)
> 
> diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
> index 0dcebc24c312..2b6a1643573c 100644
> --- a/sound/soc/fsl/fsl_asrc.c
> +++ b/sound/soc/fsl/fsl_asrc.c

> @@ -600,11 +599,6 @@ static int fsl_asrc_dai_hw_params(struct snd_pcm_substream *substream,
>  
>  	pair->config = &config;
>  
> -	if (asrc_priv->asrc_width == 16)
> -		format = SNDRV_PCM_FORMAT_S16_LE;
> -	else
> -		format = SNDRV_PCM_FORMAT_S24_LE;

It feels better to me that we have format settings in hw_params().

Why not let fsl_easrc align with this? Any reason that I'm missing?
