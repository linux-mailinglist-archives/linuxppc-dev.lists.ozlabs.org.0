Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A18B34E5918
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Mar 2022 20:27:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KNyzc3pcGz30QX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Mar 2022 06:27:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lNcwmKX6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::33;
 helo=mail-oa1-x33.google.com; envelope-from=mopsfelder@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=lNcwmKX6; dkim-atps=neutral
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KNyyw0TX1z2yLM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Mar 2022 06:26:45 +1100 (AEDT)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-ddfa38f1c1so2723949fac.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Mar 2022 12:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=JizLduuiglH2GQY50iRLf01UY1UnafwfVq5BioQLPOs=;
 b=lNcwmKX64PzI+WezX04AVpJ4oEwATCFQAf5grIrkQ32W2AeIP/K49Z/Y3N6visjRZH
 Zgl1B1zDWmOPQIgFIt5UtyoQZJRpPhf3W5KpPQhc6PZA13Hr/9e0B6gDtB0/CpYokRn1
 H+CSWLAlLwW0GWVYr0ysSQq/vzupVrlbrwI9rdKXEF5WEcTOSz844eNb6hoxVJdi7GIj
 3rqSOohpiqWKnlhGUZOg5tyXb4coSlemaa/8oeHdqN9XxFjxAcisrdxho10ROQqHFxs6
 C1iken4L5h5lrA0UxOxkpu/fePlJWD344SDNvZo1tXhDezKe0Bq31lIpDZWPYBKz+goc
 VGpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JizLduuiglH2GQY50iRLf01UY1UnafwfVq5BioQLPOs=;
 b=DEWTJ0mfPLxnCCwYj+cTW3T36QSVMNLD9pC4ZuxTWZ6mlP+enGPbuBszAaAqGSEynA
 Tx8DSagxhg2i4HqpaCV9QM7YfccOJOzhuqfJEW0QXTDKuvZSFhyyPj8+R2XAsScL7+ii
 Oi5nf9kMLkj2QaJIOR3taHTkXkf7Pk0l8EPvNc1u4uZoVKxr2mEo84yMxPNsENXHvwH9
 QPoS3fA0OIBK1noqJ6ZMIJQVg/6p0Aro8JMy1FEmZlQU5m97hgcuc3tlN3cOYjTV7esA
 lMKbmt5Fjjg7INlk64dlzzJJsl5huJ7m9tPugwxFT93nnji+WQq+5ww04/H+LzjSxqlH
 wL4g==
X-Gm-Message-State: AOAM531OBnwxrBpl86Y+hlrTUDPRS2UW/XTFSapwMeTIkdOs3KF6f5TD
 WTXsK1wcJ/rFKzHAL8fT8vs=
X-Google-Smtp-Source: ABdhPJw+/9fyAkGkPbP8MlQyPkEQMZF/55VpDajPIilDfTIYXso4mQBZNenCZI/LcARfsxgoW9mOEA==
X-Received: by 2002:a05:6870:420f:b0:de:3514:6aac with SMTP id
 u15-20020a056870420f00b000de35146aacmr781431oac.153.1648063600388; 
 Wed, 23 Mar 2022 12:26:40 -0700 (PDT)
Received: from ?IPV6:2804:2230:8010:16c0::2? ([2804:2230:8010:16c0::2])
 by smtp.gmail.com with ESMTPSA id
 g6-20020a056870a24600b000da0df8b3cesm357378oai.20.2022.03.23.12.26.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 12:26:39 -0700 (PDT)
Message-ID: <bbbd59a9-c93a-0bb4-6131-1b769f257094@gmail.com>
Date: Wed, 23 Mar 2022 16:26:36 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.7.0
Subject: Re: [PATCH] powerpc/powernv: Get more flushing requirements from
 device-tree
Content-Language: en-US
To: Russell Currey <ruscur@russell.cc>, linuxppc-dev@lists.ozlabs.org
References: <20220322074734.107721-1-ruscur@russell.cc>
From: =?UTF-8?Q?Murilo_Opsfelder_Ara=c3=bajo?= <mopsfelder@gmail.com>
In-Reply-To: <20220322074734.107721-1-ruscur@russell.cc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: joel@jms.id.au, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi, Russell.

I think this patch could have been split in half with their corresponding Fixes: tag.

This may sound nitpicking but doing this would certainly help distros doing their backports.

More comments below.

On 3/22/22 04:47, Russell Currey wrote:
> The device-tree properties no-need-l1d-flush-msr-pr-1-to-0,
> no-need-l1d-flush-kernel-on-user-access and
> no-need-store-drain-on-priv-state-switch are the equivalents of
> H_CPU_BEHAV_NO_L1D_FLUSH_ENTRY, H_CPU_BEHAV_NO_L1D_FLUSH_UACCESS
> and H_CPU_BEHAV_NO_STF_BARRIER from the H_GET_CPU_CHARACTERISTICS
> hcall on pseries, respectively.
> 
> Since commit 84ed26fd00c5 ("powerpc/security: Add a security feature for
> STF barrier") powernv systems with this device-tree property have been
> enabling the STF barrier when they have no need for it.  This patch
> fixes this by clearing the STF barrier feature on those systems.
> 
> In commit d02fa40d759f ("powerpc/powernv: Remove POWER9 PVR version
> check for entry and uaccess flushes") the condition for disabling the
> L1D flush on kernel entry and user access was changed from any non-P9
> CPU to only checking P7 and P8.  Without the appropriate device-tree
> checks for newer processors on powernv, these flushes are unnecessarily
> enabled on those systems.  This patch fixes that too.
> 
> Reported-by: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Russell Currey <ruscur@russell.cc>
> ---
>   arch/powerpc/platforms/powernv/setup.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/arch/powerpc/platforms/powernv/setup.c b/arch/powerpc/platforms/powernv/setup.c
> index 105d889abd51..824c3ad7a0fa 100644
> --- a/arch/powerpc/platforms/powernv/setup.c
> +++ b/arch/powerpc/platforms/powernv/setup.c
> @@ -96,6 +96,15 @@ static void __init init_fw_feat_flags(struct device_node *np)
>   
>   	if (fw_feature_is("disabled", "needs-spec-barrier-for-bound-checks", np))
>   		security_ftr_clear(SEC_FTR_BNDS_CHK_SPEC_BAR);
> +
> +	if (fw_feature_is("enabled", "no-need-l1d-flush-msr-pr-1-to-0", np))
> +		security_ftr_clear(SEC_FTR_L1D_FLUSH_ENTRY);
> +
> +	if (fw_feature_is("enabled", "no-need-l1d-flush-kernel-on-user-access", np))
> +		security_ftr_clear(SEC_FTR_L1D_FLUSH_UACCESS);
> +

This first diff in one patch with:

Fixes: d02fa40d759f (powerpc/powernv: Remove POWER9 PVR version check for entry and uaccess flushes)

> +	if (fw_feature_is("enabled", "no-need-store-drain-on-priv-state-switch", np))
> +		security_ftr_clear(SEC_FTR_STF_BARRIER);

And this second diff in another one with:

Fixes: 84ed26fd00c5 (powerpc/security: Add a security feature for STF barrier)

And commit messages could be updated for both commits accordingly.

>   }
>   
>   static void __init pnv_setup_security_mitigations(void)

Cheers!

-- 
Murilo
