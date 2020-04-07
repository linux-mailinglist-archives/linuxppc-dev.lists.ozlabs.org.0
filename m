Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7010E1A03D3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 02:31:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48x7dL3rrszDqs8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 10:31:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=BtZs2j/d; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48x7ZN3XgKzDqpB
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 10:29:16 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id b72so8435549pfb.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Apr 2020 17:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Hqwa+hUekQq3MYYw51APHLwXOUrFBa1sM5+b28OQ11o=;
 b=BtZs2j/dnw2PngLknCmZUjx56rNiQyDoDmVAOgZQjjRFRVxLZmw40H/jFGMoJZu00W
 LLkqlHs1rwByTmWTrV9dylFtIoPG+wYrFTNW58bNW7CX3M4zii4/8arExgdhP2ic/PTf
 WlMBZCjZHDb/BccMKoa4uwTN/Apkz9UcGUQFfRGmkWHUDDSkqkC2cEUyLY1KFcdwEZ94
 aoNc4cygUuxfFDA1FlbDFkkIC4yCB4kJuh2R4uoxmaVAYdTyERGIL9vfLA3tFkUHINdA
 y0q7KIHg48OMMq82+/ct57yUkpHZ+qahZDz6d7pgpWUvQ03wpYntCF+gpzk4jkfeoHU3
 wBfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Hqwa+hUekQq3MYYw51APHLwXOUrFBa1sM5+b28OQ11o=;
 b=QIdinks4nsx4STsyQtuh/pCMXSm1oeV4ziAxZqG9+TTNwlJKTntywsIiGdSEpbaiJ5
 CGMa/06ymk5XW7tBpumGBXyT/GozmkCAA+EVAc7JHlMV78rbPKXrMncR82XVgJzFLsxf
 CY68bRsXKJqMUSrEl4/daecEADvd3B0FtbewuFJyN8B1UFVu1ADjDkU8j0rx8tw6MW4s
 3uG39AbJ/s/bPuMU0p0W/SBgXgkjuAI5gU7I7u00xVjpzjoCjKS4NDlWrKKnp4KfQonZ
 qjA00tLqK7yhtsczMfvGx3MkMcayaHmf/bQs7dlx+p5hmIqULE5ubIU1oJ1TGJX9SWGx
 MQqQ==
X-Gm-Message-State: AGi0PuZPlWP/FU/aN3pxhfE4FaXKwRbX22omBKiwHtixn+QHpARm0n92
 fJVN5eMip8iXoMRH5a5rzYQ=
X-Google-Smtp-Source: APiQypL4QBLHOntUiX150El6Uq7vgM86HJSiaP4ts+25+U4uWp6LAmAo44aRKGMV6U/ne7TLrZMjQw==
X-Received: by 2002:aa7:97a7:: with SMTP id d7mr13246pfq.194.1586219354103;
 Mon, 06 Apr 2020 17:29:14 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id s76sm11686055pgc.64.2020.04.06.17.29.13
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 06 Apr 2020 17:29:13 -0700 (PDT)
Date: Mon, 6 Apr 2020 17:29:18 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v6 7/7] ASoC: fsl_easrc: Add EASRC ASoC CPU DAI drivers
Message-ID: <20200407002918.GC20945@Asurada-Nvidia.nvidia.com>
References: <cover.1585726761.git.shengjiu.wang@nxp.com>
 <3b5abe538eb293be9e82c077379d63487f71b7c6.1585726761.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3b5abe538eb293be9e82c077379d63487f71b7c6.1585726761.git.shengjiu.wang@nxp.com>
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

On Wed, Apr 01, 2020 at 04:45:40PM +0800, Shengjiu Wang wrote:
> EASRC (Enhanced Asynchronous Sample Rate Converter) is a new IP module
> found on i.MX8MN. It is different with old ASRC module.
> 
> The primary features for the EASRC are as follows:
> - 4 Contexts - groups of channels with an independent time base
> - Fully independent and concurrent context control
> - Simultaneous processing of up to 32 audio channels
> - Programmable filter charachteristics for each context
> - 32, 24, 20, and 16-bit fixed point audio sample support
> - 32-bit floating point audio sample support
> - 8kHz to 384kHz sample rate
> - 1/16 to 8x sample rate conversion ratio
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Signed-off-by: Cosmin-Gabriel Samoila <cosmin.samoila@nxp.com>

Overall, looks good to me.

Please add:
Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

> diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
> +static int fsl_easrc_normalize_filter(struct fsl_asrc *easrc,

> +	 * If exponent is zero (value == 0), or 7ff (value == NaNs)
[...]
> +	if (exp == 0 || exp == 0x7ff) {
[...]
> +	if ((shift > 0 && exp >= 2047) ||
> +	    (shift < 0 && exp <= 0)) {

Could fit into one line, and would be probably nicer to re-use
"0x7ff" matching previous places, instead of "2047".
