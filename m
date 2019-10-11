Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B51DD482A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2019 21:03:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46qcn50pWdzDqL4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Oct 2019 06:03:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=nicoleotsuka@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="GznRhmLr"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46qckl0NgLzDqMw
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Oct 2019 06:01:50 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id q5so6588379pfg.13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2019 12:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=snyWrZAMzq5lG4lRitPx2HIrUxhSjSwDEgHLW43m85M=;
 b=GznRhmLrbiSnSNMpKRKnZtnlVJUIMgZ5Igqj7k9gAh6/KvPPfvWFNm4bhCg1Mjmon4
 QWfPt7fCzGhhjewfN7/xsx1noFZf/yGyTuHATAyzBFFdqKhf3aUtwrWOl4/GAHGDz7wN
 m95NHX/mg+2ktdRy+xO5ADuqFShgN1Fh+GuTUMvkFeJ5230WGT1RQ6hHyY5er+XwKBVZ
 oHeE102rEFQdllfnccTjWkHAtgT3oTF5lt+iFboSsSp8ux7FNO64p0/Qbk/zDYcS8szC
 6edlryYvHz1TGfH/ZKKmM956bYuizF4DOVQLn9Vo9qfQo2AVRfqN/PYmw8aKHsj3gfOm
 SVAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=snyWrZAMzq5lG4lRitPx2HIrUxhSjSwDEgHLW43m85M=;
 b=rKKSP/p2eNNVwsvSLLHoxi/IrSN6zYEgYz451MNB6Nbnocupi+nCCgPwhkALwWnCeY
 HZDi73JOiDF3qyPjIz+AcU3zl3dplpAkCBvttGqiWgf2vfERHyFW+NRaMtKBFxDRAOc3
 QiYlqYOH5jq3QTA9B/DNU9ifQNTGsdJ4J43X9FTiDtxjed0nmKOD+TNsifSX+vkuGqap
 uNwZkhtTYDMK9zpZyH7HJFSkl7HD4oPSV6H7e65J8iTZmHMeEL0HXqL6OdjIGkaDbDtp
 b/ESLbn1Z/5tWitmWs1k/Eiy3u8Y2qXcwynx4EOhSclnw/IFIc0gNwUToLwI4InsuQ/9
 I44g==
X-Gm-Message-State: APjAAAXpu417jIwxVmeyTXjir5Hgv32w2iAWwNHQW6l3vGZldESR+Nnp
 JbX1VPDm2/0GmOPNbJhFsLU=
X-Google-Smtp-Source: APXvYqyNO2jGjTM35Zx7/wYo2IA/ONK6kVXQIM80NOoaCi6xPGZ50ucYajK+oHsuTMe+0WILniPrqg==
X-Received: by 2002:a17:90a:2ec1:: with SMTP id
 h1mr19140199pjs.96.1570820506438; 
 Fri, 11 Oct 2019 12:01:46 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id q13sm11663683pfn.150.2019.10.11.12.01.45
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 11 Oct 2019 12:01:45 -0700 (PDT)
Date: Fri, 11 Oct 2019 12:01:06 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: YueHaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH v2 -next] ASoC: fsl_mqs: Move static keyword to the front
 of declarations
Message-ID: <20191011190105.GA18114@Asurada-Nvidia.nvidia.com>
References: <20191011105606.19428-1-yuehaibing@huawei.com>
 <20191011143538.15300-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191011143538.15300-1-yuehaibing@huawei.com>
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

On Fri, Oct 11, 2019 at 10:35:38PM +0800, YueHaibing wrote:
> gcc warn about this:
> 
> sound/soc/fsl/fsl_mqs.c:146:1: warning:
>  static is not at beginning of declaration [-Wold-style-declaration]
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

> ---
> v2: Fix patch title
> ---
>  sound/soc/fsl/fsl_mqs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/fsl/fsl_mqs.c b/sound/soc/fsl/fsl_mqs.c
> index f7fc44e..0c813a4 100644
> --- a/sound/soc/fsl/fsl_mqs.c
> +++ b/sound/soc/fsl/fsl_mqs.c
> @@ -143,7 +143,7 @@ static void fsl_mqs_shutdown(struct snd_pcm_substream *substream,
>  				   MQS_EN_MASK, 0);
>  }
>  
> -const static struct snd_soc_component_driver soc_codec_fsl_mqs = {
> +static const struct snd_soc_component_driver soc_codec_fsl_mqs = {
>  	.idle_bias_on = 1,
>  	.non_legacy_dai_naming	= 1,
>  };
> -- 
> 2.7.4
> 
> 
