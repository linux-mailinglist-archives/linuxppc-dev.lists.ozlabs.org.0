Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A8320DD0D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jun 2020 23:06:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wg6455CBzDqZF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 07:06:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=YJBNPwOj; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wdqB55VGzDqMk
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 06:08:54 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id g67so7908392pgc.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jun 2020 13:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Dk9Y/T99sdQ3PfvJ9tzS88PlXk+29r6HaUnDmfo2AIs=;
 b=YJBNPwOj22wBFdvzais+fblphrAroRFtJc3OzQ8RRLvsojoV0C3WM/buNqASfskOyT
 zIA4r/pM0/v3TRqNNZxBpcOJGSD29gOelOc2e9T2RgAxFq53QEMhIdN7zA/nBhWS+qmm
 Y8jRoreByc494Td0CMc5wZbjcCS87hohVxhtz7jj6Ix58a1hsPo6sl3iYvyX9dbReAa9
 GDz4K05C9Dmut4rRqMPkKNiBr6X2XbdHSOnGE6PyNHPDAZA/Ck3K6jAQVo/GgatdQdQ4
 L5D2QyfKR42ohh4zzhShlTZSmIgwd7VHZLY0uwIU2hNP0T3rbqObAKV+bA5s46B8iGbO
 OuzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Dk9Y/T99sdQ3PfvJ9tzS88PlXk+29r6HaUnDmfo2AIs=;
 b=rCbegwE/lJ7iSpFI0LMN7g0uxOv0TVKymbMQOb97HewkU+84jzqEVQ3jHChstkZiVM
 9O1SxVmnlRck4JLYhYljfh1A4oE9aZ9qX/Xg0bU5cJhUjjC/pqAczCKe/6QcbkRK5/Jb
 fPXK31ZKraoTdMUk2DyvcTNhVkgvVWZilkghsz+SqlbSZQNz4MwZiszCBF/3Dm0zk1Di
 jLdR4vgMDWdnU0Vkko/yC8ZsYXAl/1rSs6eLwgTI+eSerxHaVFhvuktVzGzUYMigM+R4
 2ionKO+RhKOnYOU56IDgpckmcVlmTuM5Cj5MmQ4fyVCD9ksAsD4+PIWf/FUV27Bk+9Kn
 cvXg==
X-Gm-Message-State: AOAM530qs0Qs2BuUwdYF55ftQGYjRLRdppBJ7lFB/bpdVvoIz1lu5XRL
 ACwkvvRk7FujMBJdp/i6QAM=
X-Google-Smtp-Source: ABdhPJw9k+cyjMxkvZCZ4AoSCBXsw6VLdn1xIUlzJKIwRHnIfMovFVz5gBkCQyh6fguu6A9iRlF4Gg==
X-Received: by 2002:aa7:9906:: with SMTP id z6mr16229603pff.60.1593461326205; 
 Mon, 29 Jun 2020 13:08:46 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id 137sm534234pgg.72.2020.06.29.13.08.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 29 Jun 2020 13:08:46 -0700 (PDT)
Date: Mon, 29 Jun 2020 13:08:13 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_asrc: Add an option to select internal ratio
 mode
Message-ID: <20200629200813.GB27967@Asurada-Nvidia>
References: <1593439115-19282-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1593439115-19282-1-git-send-email-shengjiu.wang@nxp.com>
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
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
 perex@perex.cz, broonie@kernel.org, festevam@gmail.com,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 29, 2020 at 09:58:35PM +0800, Shengjiu Wang wrote:
> The ASRC not only supports ideal ratio mode, but also supports
> internal ratio mode.
> 
> For internal rato mode, the rate of clock source should be divided
> with no remainder by sample rate, otherwise there is sound
> distortion.
> 
> Add function fsl_asrc_select_clk() to find proper clock source for
> internal ratio mode, if the clock source is available then internal
> ratio mode will be selected.
> 
> With change, the ideal ratio mode is not the only option for user.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---

> +static int fsl_asrc_select_clk(struct fsl_asrc_priv *asrc_priv,
> +			       struct fsl_asrc_pair *pair,
> +			       int in_rate,
> +			       int out_rate)
> +{
> +	struct fsl_asrc_pair_priv *pair_priv = pair->private;
> +	struct asrc_config *config = pair_priv->config;
> +	int rate[2], select_clk[2]; /* Array size 2 means IN and OUT */
> +	int clk_rate, clk_index;
> +	int i = 0, j = 0;
> +	bool clk_sel[2];
> +
> +	rate[0] = in_rate;
> +	rate[1] = out_rate;
> +
> +	/* Select proper clock source for internal ratio mode */
> +	for (j = 0; j < 2; j++) {
> +		for (i = 0; i < ASRC_CLK_MAP_LEN; i++) {
> +			clk_index = asrc_priv->clk_map[j][i];
> +			clk_rate = clk_get_rate(asrc_priv->asrck_clk[clk_index]);

+			/* Only match a perfect clock source with no remainder */

> +			if (clk_rate != 0 && (clk_rate / rate[j]) <= 1024 &&
> +			    (clk_rate % rate[j]) == 0)
> +				break;
> +		}
> +
> +		if (i == ASRC_CLK_MAP_LEN) {
> +			select_clk[j] = OUTCLK_ASRCK1_CLK;
> +			clk_sel[j] = false;
> +		} else {
> +			select_clk[j] = i;
> +			clk_sel[j] = true;
> +		}
> +	}
> +
> +	/* Switch to ideal ratio mode if there is no proper clock source */
> +	if (!clk_sel[IN] || !clk_sel[OUT])
> +		select_clk[IN] = INCLK_NONE;

Could get rid of clk_set:

	for (j) {
		for (i) {
			if (match)
				break;
		}

		clk[j] = i;
	}

	if (clk[IN] == ASRC_CLK_MAP_LEN || clk[OUT] == ASRC_CLK_MAP_LEN)

And it only overrides clk[IN] setting but leaving clk[OUT] to
to the searching result. This means that clk[OUT] may be using
a clock source other than OUTCLK_ASRCK1_CLK if sel[IN] happens
to be false while sel[OUT] happens to be true. Not sure if it
is intended...but I feel it would probably be safer to use the
previous settings: INCLK_NONE + OUTCLK_ASRCK1_CLK?
