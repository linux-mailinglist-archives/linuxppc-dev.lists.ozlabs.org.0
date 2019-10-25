Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 388DDE565A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Oct 2019 00:01:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 470J3r3v7XzDqss
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Oct 2019 09:01:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="qwmWtewK"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 470J1X3v1LzDqsl
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Oct 2019 08:59:42 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id q7so2478672pfh.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2019 14:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=eW3QcADxWiA9bB+f1V3Z1+dcU/1XE8CGZphcypGekbY=;
 b=qwmWtewKTdVLT5daUxPBZ5FzRpQl/egXLrBQ+UeZlpbEcHCiFqCaJklDEfi4dFeioG
 /XiO73dbDOzSSEE0e8De1pxiRwZ82JdWzsFQbae0oD79Pxhqy6EVKuu4BKTBEkvC1nMa
 m3nTmAaZ5lJOwxsHqbeokO4CRoYMoCgFlTZrR2iNULK3dzXeUmsnDqhk1sIspgID48YJ
 jKHqlgxD3nXUuqVQk2uwhEI9NgoalG4q+9bExzO5fTaykJS13q4yv6FQ6bKvkosayM2c
 ySkyd6GIpHirJ0zV2dZlTAiKIXtdOi7lS9lY13KClqTq1nv1w3qqvyeAPyYB1sKvas75
 WFMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=eW3QcADxWiA9bB+f1V3Z1+dcU/1XE8CGZphcypGekbY=;
 b=pwxkQ6Nik28MUH8jHQOa7PSPule5NS/Qa7T8Q9cVvlk9L+M4rx+fLVslr+k2w4Fe1/
 KmA1JWc2GchxS5RPbqpjSqZxcF2LIIk81XpRBtZUh0UZ0wcfClwg5USoOox5MAQso48c
 NCCfXMOi4FaDrv3kMO89iSguYodPsWixKynOjWvcTr6OGbeZ0+vhUlDU/518k4gyWx0S
 6jhoTWHmWK4IHg9PHQIwfEeisVBVR+S6hP2fqlyk9FiGOJUv8b/4113X85x0qazPsXCS
 lbokHNJYZUc1SzdXdwE20f3FTRFH5gt/GtLlYxvY0YrZUh2EWu7qR20QEGSDhwWGUQ1O
 Braw==
X-Gm-Message-State: APjAAAUo2V4MGcacSeRGoeySQcBsIDxkd8nOTbU99CcSeNQAezbrAgNK
 mKmhz+zIUhJPIlinV+sWS0M=
X-Google-Smtp-Source: APXvYqzAlyQ6QgA1OIplwWAdTMmiF8dDyvSSD0lN3oGKWYGdoPCg4gqnizy04m7h1H3tGg509ldamQ==
X-Received: by 2002:a17:90a:d351:: with SMTP id
 i17mr6807596pjx.36.1572040779795; 
 Fri, 25 Oct 2019 14:59:39 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id d5sm2815101pjw.31.2019.10.25.14.59.38
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 25 Oct 2019 14:59:39 -0700 (PDT)
Date: Fri, 25 Oct 2019 14:59:20 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH V2] ASoC: fsl_asrc: refine the setting of internal clock
 divider
Message-ID: <20191025215919.GB15101@Asurada-Nvidia.nvidia.com>
References: <a0cd2ecf5e833fbdc064ba73391481d6073e7254.1571986398.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a0cd2ecf5e833fbdc064ba73391481d6073e7254.1571986398.git.shengjiu.wang@nxp.com>
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

On Fri, Oct 25, 2019 at 03:13:22PM +0800, Shengjiu Wang wrote:
> The output divider should align with the output sample
> rate, if use ideal sample rate, there will be a lot of overload,
> which would cause underrun.
> 
> The maximum divider of asrc clock is 1024, but there is no
> judgement for this limitaion in driver, which may cause the divider

typo: "limitaion" => "limitation"

> setting not correct.
> 
> For non-ideal ratio mode, the clock rate should divide the sample
> rate with no remainder, and the quotient should be less than 1024.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

And some comments inline. Please add my ack once they are fixed:

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

Thanks

> diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
> index 0bf91a6f54b9..89cf333154c7 100644
> --- a/sound/soc/fsl/fsl_asrc.c
> +++ b/sound/soc/fsl/fsl_asrc.c
> @@ -259,8 +259,11 @@ static int fsl_asrc_set_ideal_ratio(struct fsl_asrc_pair *pair,
>   * It configures those ASRC registers according to a configuration instance
>   * of struct asrc_config which includes in/output sample rate, width, channel
>   * and clock settings.
> + *
> + * Note:
> + * use_ideal_rate = true is need by some case which need higher performance.

I feel we can have a detailed one here and drop those inline comments, e.g.:

+ * Note:
+ * The ideal ratio configuration can work with a flexible clock rate setting.
+ * Using IDEAL_RATIO_RATE gives a faster converting speed but overloads ASRC.
+ * For a regular audio playback, the clock rate should not be slower than an
+ * clock rate aligning with the output sample rate; For a use case requiring
+ * faster conversion, set use_ideal_rate to have the faster speed.

> @@ -351,8 +355,10 @@ static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair)
>  	/* We only have output clock for ideal ratio mode */
>  	clk = asrc_priv->asrck_clk[clk_index[ideal ? OUT : IN]];
>  
> -	div[IN] = clk_get_rate(clk) / inrate;
> -	if (div[IN] == 0) {
> +	clk_rate = clk_get_rate(clk);
> +	rem[IN] = do_div(clk_rate, inrate);
> +	div[IN] = (u32)clk_rate;

> +	if (div[IN] == 0 || (!ideal && (div[IN] > 1024 || rem[IN] != 0))) {

Should have some comments to explain this like:
	/*
	 * The divider range is [1, 1024], defined by the hardware. For non-
	 * ideal ratio configuration, clock rate has to be strictly aligned
	 * with the sample rate. For ideal ratio configuration, clock rates
	 * only result in different converting speeds. So remainder does not
	 * matter, as long as we keep the divider within its valid range.
	 */
>  		pair_err("failed to support input sample rate %dHz by asrck_%x\n",
>  				inrate, clk_index[ideal ? OUT : IN]);
>  		return -EINVAL;

And move the min() behind this if-condition with no more comments:
+	div[IN] = min_t(u32, 1024, div[IN]);

> @@ -360,18 +366,29 @@ static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair)
>  
>  	clk = asrc_priv->asrck_clk[clk_index[OUT]];
>  
> -	/* Use fixed output rate for Ideal Ratio mode (INCLK_NONE) */
> -	if (ideal)
> -		div[OUT] = clk_get_rate(clk) / IDEAL_RATIO_RATE;
> +	/*
> +	 * Output rate should be align with the out samplerate. If set too
> +	 * high output rate, there will be lots of Overload.
> +	 * But some case need higher performance, then we can use
> +	 * IDEAL_RATIO_RATE specifically for such case.
> +	 */

Can drop this since we have the detailed comments at the top.

> +	clk_rate = clk_get_rate(clk);
> +	if (ideal && use_ideal_rate)
> +		rem[OUT] = do_div(clk_rate, IDEAL_RATIO_RATE);
>  	else
> -		div[OUT] = clk_get_rate(clk) / outrate;
> +		rem[OUT] = do_div(clk_rate, outrate);
> +	div[OUT] = clk_rate;
>  
> -	if (div[OUT] == 0) {

And add before this if-condition:

	/* Output divider has the same limitation as the input one */

> +	if (div[OUT] == 0 || (!ideal && (div[OUT] > 1024 || rem[OUT] != 0))) {
>  		pair_err("failed to support output sample rate %dHz by asrck_%x\n",
>  				outrate, clk_index[OUT]);
>  		return -EINVAL;
>  	}
>  
> +	/* Divider range is [1, 1024] */

Can drop this too.

> +	div[IN] = min_t(u32, 1024, div[IN]);
> +	div[OUT] = min_t(u32, 1024, div[OUT]);

