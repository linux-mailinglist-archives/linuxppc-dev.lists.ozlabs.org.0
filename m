Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8B0221694
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 22:50:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6Tzr5ZTpzDqnG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 06:50:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=WfhBj627; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6Txh2LH6zDqf5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 06:48:39 +1000 (AEST)
Received: by mail-pj1-x1044.google.com with SMTP id b92so3565056pjc.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 13:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=YwtQ+qIZRMu1aHjFHPtF40fPrwJ9tfeRwj/jvnsJYBE=;
 b=WfhBj627Y0WOtyr1wRjCUf4CYVWiv9xzOas2x0/JPpSflqWZmNEp95WvwJiPslkU2d
 Kios/eGN2XcbMmUIQ9klS1VhHOTkfjtPmpIyJJFaAHb8FJTBq5kGR2CZ5/HY+l2RjpVi
 i2grx16HFurjU299NUhstWKgdpL5bNT08QT9ZevBaeFxDI/+RZ00qhq2VPxTxwsiKmce
 UdGnoQzlQXNtlhig++nO4/kAuwBPXjZL9/gLz8HWgggqzUUDW+WHz1bxHPcvq1ta8lSr
 6+f9FCbLIynLkNZbyxGHPGbSHsrIRaKOoIb8D841N/GpaWFnWcg4hUlqmD0RJpDt+jrL
 bWAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=YwtQ+qIZRMu1aHjFHPtF40fPrwJ9tfeRwj/jvnsJYBE=;
 b=K+szNRroKtYESDKsrw5RnAJ9dEk+KpfhZIL/5hBMx05cTdqtqKOkjbpgoF23cWF2je
 yGcietbBtOZLMKXByxISlG1DaLQnowt+ho0rwoyBttExORzzzsM3rcDiVVBaEQ+Qjf+/
 NafwJlsscueVAysESgc8vndwmnf9v2VSkBXU2Y3ZKrpG+oXee+xQAY8/BoB+KWPCwGq7
 uWKBBNhpg3bziXx6nSGNMqOwFHIyV22iIN3+0uK63CRfB+9rX9iH+1GRpsQBMn3+kZdU
 ipGfe2zAOrAzQD3ASw2fEwbugXVTA0KyLo16JWgnjAFejgKj+FAlODELEz2rTfZ1oVvF
 DcKA==
X-Gm-Message-State: AOAM531Vahm+v5IgU0skO5UWC6Oqvf1HGJP+HKIGA27TvZW+p0rpL0Du
 Yy0MrjZyTmulhkySWWCoA9g=
X-Google-Smtp-Source: ABdhPJz1GJ2Ik7lZDPIUXV5ePwyu/YwogLbPU4apDaOlkhisq+aJKtFRAA1r//dZtZBvcY/zN4hOBQ==
X-Received: by 2002:a17:90a:a413:: with SMTP id
 y19mr1460097pjp.59.1594846114095; 
 Wed, 15 Jul 2020 13:48:34 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id w9sm2983563pja.39.2020.07.15.13.48.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 15 Jul 2020 13:48:33 -0700 (PDT)
Date: Wed, 15 Jul 2020 13:48:09 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 1/1] ASoC: fsl: fsl-asoc-card: Trivial: Fix
 misspelling of 'exists'
Message-ID: <20200715204809.GA14565@Asurada-Nvidia>
References: <20200715150009.407442-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200715150009.407442-1-lee.jones@linaro.org>
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
Cc: alsa-devel@alsa-project.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, broonie@kernel.org,
 Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 15, 2020 at 04:00:09PM +0100, Lee Jones wrote:
> Cc: Timur Tabi <timur@kernel.org>
> Cc: Nicolin Chen <nicoleotsuka@gmail.com>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

> Cc: Xiubo Li <Xiubo.Lee@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  sound/soc/fsl/fsl-asoc-card.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
> index faac6ce9a82cb..dbacdd25dfe76 100644
> --- a/sound/soc/fsl/fsl-asoc-card.c
> +++ b/sound/soc/fsl/fsl-asoc-card.c
> @@ -92,7 +92,7 @@ struct fsl_asoc_card_priv {
>  };
>  
>  /*
> - * This dapm route map exits for DPCM link only.
> + * This dapm route map exists for DPCM link only.
>   * The other routes shall go through Device Tree.
>   *
>   * Note: keep all ASRC routes in the second half
> -- 
> 2.25.1
> 
