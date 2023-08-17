Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A5977F145
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 09:34:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=F4UrenxJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RRGwN0hxGz3cKh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 17:34:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=F4UrenxJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com; envelope-from=philmd@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RRGvT1gLLz2yWD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Aug 2023 17:33:23 +1000 (AEST)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-51a52a7d859so1358083a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Aug 2023 00:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692257596; x=1692862396;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XqVwwc2dDlYlCMTarZ/PjmKE+CsteLytpeFTL+9lo0M=;
        b=F4UrenxJRzj7RIgGu2RAZ2FUbmJEF38qgllIOTjkWb91A+EGbBRBvbhHqKxIO/AeNe
         ff4+SIOxVHNabjcg7l5TwiX0NWBzieVdmlblIxPBlK0tY01TSyLib+9qnr2FnWt66sXZ
         Ir7tJSfIR4U2c6qGCHcDZt7br1mzXyUdZM2BKRwvU3dv2PNOesfmlqTM6uJCvbzmf7DQ
         /BQmQ2DmlmTrOy3n3WQLJj3lRTTEEqdsco+uzM60FV6tRtGpOrx4fUryqA+4w6F4oUt5
         /mhOH7g/8a4pwXNbvv1PpfHTnJH1zcitg5hU892GdkgYp8jALVFToAUGlI5ExSdF6Tzl
         Djkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692257596; x=1692862396;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XqVwwc2dDlYlCMTarZ/PjmKE+CsteLytpeFTL+9lo0M=;
        b=A9oeiXzVOr+MP/FoCgjCjayI3V0Seoafgu/Z1b1jI9LMOzFBfYo5o0MT71yuY5L40L
         xZzPNsToXjjRFiII+bjrkej7QV8BYEVxvRCfMDz9byDeziDO8JHp9oDb27gTwqMgvoIx
         R1rXYUmCjtqMtLX3hnJFw4S1F8H1CZSGWjq98dZeCx7CpcDH7avQYldoB0/zCFffu6J2
         p2ehS+eZQOOsViZ3bJR0eAykI7uWbp2VMpTsX3K+wrr40dF6OXy9F3AAEEqNP5IjsZdO
         ysGIQKJY6f5WJCemvh6+dcnF6V/m5T/cvQ7lMbvaxZ7ducx73aIJ+D9gN4xiqs8wbLkt
         7xSA==
X-Gm-Message-State: AOJu0Yw/qFeltvlUU2YmorU+RCNl40PxKqy663Ru3yNpZQkefUmxCBw5
	BiDgR2QFpKWTGA/gsFEZH3IbSw==
X-Google-Smtp-Source: AGHT+IFghrFx0zxJbJiB3SRR94OfeZeGqRzD/iYhIlcu/DnH8WCxmeY5R8S/g/7SDRhGfDDg6uwxBg==
X-Received: by 2002:a05:6402:40c8:b0:522:b9ae:db3c with SMTP id z8-20020a05640240c800b00522b9aedb3cmr2223766edb.6.1692257595980;
        Thu, 17 Aug 2023 00:33:15 -0700 (PDT)
Received: from [192.168.69.115] (mek33-h02-176-184-23-56.dsl.sta.abo.bbox.fr. [176.184.23.56])
        by smtp.gmail.com with ESMTPSA id k15-20020a05640212cf00b00521f4ee396fsm9365410edx.12.2023.08.17.00.33.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Aug 2023 00:33:15 -0700 (PDT)
Message-ID: <f7230276-decf-2248-52b2-c2de4a13647c@linaro.org>
Date: Thu, 17 Aug 2023 09:33:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH v2 3/4] arch/mips/configs/*_defconfig cleanup
Content-Language: en-US
To: Trevor Woerner <twoerner@gmail.com>, linux-kernel@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <20230817025942.3209-1-twoerner@gmail.com>
 <20230817025942.3209-4-twoerner@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230817025942.3209-4-twoerner@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Trevor,

On 17/8/23 04:59, Trevor Woerner wrote:
> Drop CONFIG_IP_NF_TARGET_CLUSTERIP from any remaining mips defconfigs as it
> was removed in commit 57f8e00d8a82 ("usb: 71 musb: Drop old unused am35x
> glue layer").

How 57f8e00d8a82 is related? Do you mean commit 9db5d918e2c0
("netfilter: ip_tables: remove clusterip target")?

> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
>   arch/mips/configs/ip22_defconfig        | 1 -
>   arch/mips/configs/malta_defconfig       | 1 -
>   arch/mips/configs/malta_kvm_defconfig   | 1 -
>   arch/mips/configs/maltaup_xpa_defconfig | 1 -
>   arch/mips/configs/rm200_defconfig       | 1 -
>   5 files changed, 5 deletions(-)
> 
> diff --git a/arch/mips/configs/ip22_defconfig b/arch/mips/configs/ip22_defconfig
> index 44821f497261..dc49b09d492b 100644
> --- a/arch/mips/configs/ip22_defconfig
> +++ b/arch/mips/configs/ip22_defconfig
> @@ -127,7 +127,6 @@ CONFIG_IP_NF_MATCH_TTL=m
>   CONFIG_IP_NF_FILTER=m
>   CONFIG_IP_NF_TARGET_REJECT=m
>   CONFIG_IP_NF_MANGLE=m
> -CONFIG_IP_NF_TARGET_CLUSTERIP=m
>   CONFIG_IP_NF_TARGET_ECN=m
>   CONFIG_IP_NF_TARGET_TTL=m
>   CONFIG_IP_NF_RAW=m

