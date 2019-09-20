Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CA5B99D9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Sep 2019 00:53:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Zpsj3TF2zF4Ly
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Sep 2019 08:53:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=nicoleotsuka@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="XxpsH7YC"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Zpqq5rVszF47P
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Sep 2019 08:51:51 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id q15so3843401pll.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Sep 2019 15:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=0P3XLXQhDOk6yT8L9UZqipY6hQ6gvzDoPp4owKec9vk=;
 b=XxpsH7YCa/PUyweMsFxZ83TPOyD0WUZjPit3c8pITmQgtwko6irwDaxc9pADFQztvC
 4U90FTq1tsr90gbU3BH0dXMjgwrxN9irMCPTc5p97PU3oec9/cqWzdg6C2yhY/HsfNln
 aScdV6JxcUYSWR5y5Hv9upvbjhCmXfYVsD9tu4NY5ITzk7+s1hqedARflggKmV1Dur7v
 fiOu8/6RUGHJEhmjdorBPStTRSD4Ln8RO9iV39xPXYgVi3HpcU5c3nwZPcYP/tfnsq7x
 oh49U2WdVkdA819mAvnTSbQQg3Gu+tax53st1QAbHmpdvq4sxTse2UtHV/IylCvTkm9n
 Q3vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0P3XLXQhDOk6yT8L9UZqipY6hQ6gvzDoPp4owKec9vk=;
 b=FX41qMeLiQiFmUOxH37g8dzhomiRtZsOcDsCoHuQpSOlpxXdd62XbHnFNhu0wZrfsu
 aMnr06zSkJeAyNbGQy5677nZ9aT7Hm2UT5c4mjteRlpdJcHRqlL5kJ88l6otSPkhnIZm
 MW9C+kR9wgLkm0GiSPd6kNflfWMvkR/9FH1EaVfopu2XboOu9RdRG6Smzn6k3UVKW4R0
 CwieRhFJ7hz38D4r40MPo4CITeqvmhiYqYSZqI6QHfFXuFOcMrc+ST2TAKevrDQxMqWW
 j2+MoU9pAyoYaZEIxGKGiopX86gUUmxGu/K2RR5D3tq/EoHnJXVpvIjc99g3mNO3KsjJ
 G75w==
X-Gm-Message-State: APjAAAU4W6RFKKZn6FRWbJnZSsOtLiPUPq5AEq0MMav1BHlaUfk0qWpE
 AZ876XZWj1JoPjHIxZhsRB8=
X-Google-Smtp-Source: APXvYqxuXYaN7Iqu31wZ7eEfynHGlkievoHDsqLPDXtQ855SljuXpLCmyBe3bDgUiLJ0h23ehjlQAQ==
X-Received: by 2002:a17:902:fe91:: with SMTP id
 x17mr19665279plm.106.1569019907795; 
 Fri, 20 Sep 2019 15:51:47 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id g24sm2039646pfi.81.2019.09.20.15.51.46
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 20 Sep 2019 15:51:47 -0700 (PDT)
Date: Fri, 20 Sep 2019 15:50:58 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH V3 3/4] ASoC: pcm_dmaengine: Extract
 snd_dmaengine_pcm_refine_runtime_hwparams
Message-ID: <20190920225055.GB21389@Asurada-Nvidia.nvidia.com>
References: <cover.1568861098.git.shengjiu.wang@nxp.com>
 <57e3bda7b94fecf94d17f2eacf1c6beebcac74ff.1568861098.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57e3bda7b94fecf94d17f2eacf1c6beebcac74ff.1568861098.git.shengjiu.wang@nxp.com>
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
 alsa-devel@alsa-project.org, lars@metafoo.de, timur@kernel.org,
 Xiubo.Lee@gmail.com, linuxppc-dev@lists.ozlabs.org, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, perex@perex.cz, broonie@kernel.org,
 festevam@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 19, 2019 at 08:11:41PM +0800, Shengjiu Wang wrote:
> When set the runtime hardware parameters, we may need to query
> the capability of DMA to complete the parameters.
> 
> This patch is to Extract this operation from
> dmaengine_pcm_set_runtime_hwparams function to a separate function
> snd_dmaengine_pcm_refine_runtime_hwparams, that other components
> which need this feature can call this function.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

> @@ -145,58 +140,15 @@ static int dmaengine_pcm_set_runtime_hwparams(struct snd_pcm_substream *substrea

> +	ret = snd_dmaengine_pcm_refine_runtime_hwparams(substream,
> +							dma_data,
> +							&hw,
> +							chan);
> +	if (ret)
> +		return ret;
>  
>  	return snd_soc_set_runtime_hwparams(substream, &hw);
> +
> }

Just a nit, why add a line here? :)

The rest looks good to me, not sure whether the name "refine"
would be the best one though, would like to wait for opinions
from others.

Thanks
