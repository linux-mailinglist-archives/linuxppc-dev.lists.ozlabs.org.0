Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0006864F47
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2019 01:37:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kbFS1YPFzDqfY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2019 09:37:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com;
 envelope-from=nicoleotsuka@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="brITT/5d"; 
 dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kbCb3t0SzDqdX
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2019 09:35:39 +1000 (AEST)
Received: by mail-pf1-x42a.google.com with SMTP id p184so1815548pfp.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jul 2019 16:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Fo3zNx7q8KOphF4/0k8ry1Exilbv+0XYzkMqa1pkdPw=;
 b=brITT/5d5a9WyodVg5ZUQsakATJo0F+/1F0NZxiiEO4WZQws6EdiwGGKUFKY2pt/Zo
 CYrZAOfPL/cCfxp3dHvE1aabIU8b7cgowtd3fXrrYR35j+w9wSFI4/MnhtzBbTlu/r6f
 JEKXEkQJ8j3TQqvb0K33a80yiZ+zyjPj5Z0pWmtYCvMAWLp/UJAgsVYiQ8MZ2pqd06Fp
 zjAAh5jbOtcdf3eu7kihy5eqVXw3cEWFA1QhWDw/g3HaPszaNu2XlkvfcZEoFxHBZ2vN
 4/RaulelQD0Ma3GGYGzUZGqEEk/VKTIwXHs0hbdk8/rAh81ECwzdFDbV1PeVNjYcWwM+
 vBQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Fo3zNx7q8KOphF4/0k8ry1Exilbv+0XYzkMqa1pkdPw=;
 b=uFNLofKfByZqrdd1Bw1mKlFcmaI5rBYN+iiptdXGZo1GpX5PRsQ1ukDAjpMz/bHAFX
 rZWcXe19cV5nCeXSvi4ZHXoxYDWvT1V7DdGQ1Npxq769H4v2ufnn6s+NBurZifWoUvgg
 CoGzGOX0MdNQJK7OyE+os3FdU7Wwxog1BqZQUXq89p4l4AS3x37bhcaA3G78mHcF1yRx
 oOxh8Xt0zhG3XmRHiuYNL71G6OG7pAee8idJanor3KD75lpxL1UG254kzhgs8n5Hx6fu
 Nr/4PURKcGNCMkrcfvJhMm6coWK29anc6CXYevddyG7+ZL4Z5GjzSMFgPoZeImqbWEg2
 OE2w==
X-Gm-Message-State: APjAAAV73NNgDRhH0iVcbnVag4/VFmTTBzDhk0tGIDOVn2D16NxckS+5
 E7rFHFap7KRJKBmcUxsCs1c=
X-Google-Smtp-Source: APXvYqxyqTCbrq1xdCzkoYVL+c48dQADntW+6Bi3tN/r4jmGUpVWI/udlq43jQcwlgvVT5ebKnuk1w==
X-Received: by 2002:a17:90a:36e4:: with SMTP id
 t91mr1101282pjb.22.1562801735794; 
 Wed, 10 Jul 2019 16:35:35 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id q1sm6318517pfn.178.2019.07.10.16.35.35
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 10 Jul 2019 16:35:35 -0700 (PDT)
Date: Wed, 10 Jul 2019 16:36:06 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: shengjiu.wang@nxp.com
Subject: Re: [PATCH V3 2/2] ASoC: fsl_esai: recover the channel swap after xrun
Message-ID: <20190710233605.GA9886@Asurada-Nvidia.nvidia.com>
References: <cover.1562566531.git.shengjiu.wang@nxp.com>
 <a055d9d590124aad2de70e97266e50d2bae752c8.1562566531.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a055d9d590124aad2de70e97266e50d2bae752c8.1562566531.git.shengjiu.wang@nxp.com>
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
 festevam@gmail.com, linux-kernel@vger.kernel.org, broonie@kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Shengjiu,

Mostly looks good to me, just some small comments.

On Mon, Jul 08, 2019 at 02:38:52PM +0800, shengjiu.wang@nxp.com wrote:
  
> +static void fsl_esai_hw_reset(unsigned long arg)
> +{
> +	struct fsl_esai *esai_priv = (struct fsl_esai *)arg;
> +	u32 saisr, tfcr, rfcr;
> +	bool tx = true, rx = false, enabled[2];

Could we swap the lines of u32 and bool? It'd look better.

> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_TCR,
> +			   ESAI_xCR_xPR_MASK, ESAI_xCR_xPR);
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_RCR,
> +			   ESAI_xCR_xPR_MASK, ESAI_xCR_xPR);

Let's add a line of comments for these two:
	/* Enforce ESAI personal resets for both TX and RX */

> +	/*
> +	 * Restore registers by regcache_sync, and ignore
> +	 * return value
> +	 */

Could fit into single-line?

> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_TCR,
> +			   ESAI_xCR_xPR_MASK, 0);
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_RCR,
> +			   ESAI_xCR_xPR_MASK, 0);
> +
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_PRRC,
> +			   ESAI_PRRC_PDC_MASK, ESAI_PRRC_PDC(ESAI_GPIO));
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_PCRC,
> +			   ESAI_PCRC_PC_MASK, ESAI_PCRC_PC(ESAI_GPIO));

Could remove the blank line and add a line of comments:
	/* Remove ESAI personal resets by configuring PCRC and PRRC also */

Btw, I still feel this personal reset can be stuffed into one
of the wrapper functions. But let's keep this simple for now.

> +	regmap_read(esai_priv->regmap, REG_ESAI_SAISR, &saisr);

Why do we read saisr here? All its bits would get cleared by
the hardware reset. If it's a must to clear again, we should
add a line of comments to emphasize it.

Thank you
