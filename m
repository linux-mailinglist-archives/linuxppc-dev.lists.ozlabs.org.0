Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F78577FB13
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 17:44:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Y7OkJ5kz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RRTpd0JHKz3cRp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Aug 2023 01:44:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Y7OkJ5kz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com; envelope-from=philmd@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RRTnj5P4dz3bWQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Aug 2023 01:44:07 +1000 (AEST)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4fe0c566788so12466599e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Aug 2023 08:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692287038; x=1692891838;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lp1IuZHqWfKCAVZooutFxjvYW2JldAzLdhi3fANGf+o=;
        b=Y7OkJ5kzfBR9aS1o3hbSjWBbpDhDfQvuOJAbLWMeHIdCvYVqIqsch4xPQi6nhKj1sW
         MyG2VLyh2d/VhqbZsXyum3ahPYS8bZD/3vhehfn8OxUL5vrX+3/9cMxCnE5qiSsgyDR/
         fShe46mhdY+NApZpcWsPqTIffnvlvkPtOI+jgn4rIt384WQhvhdi97ih/Ilt5JjDZtjs
         doYEk6M74dQhbXRqKo5cHgm5Sxala+iBlG/zi0HHIrvQSCxfxkgmFC1tMXvlzNgJkmoZ
         rUDnjo4tsPM/cqSjpRMFtA5WxE0YyMxathg7q3nRUgdWs7XXqmVaU3lpDCCDHWNMmo6U
         MjbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692287038; x=1692891838;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lp1IuZHqWfKCAVZooutFxjvYW2JldAzLdhi3fANGf+o=;
        b=foaOsu9wiQ7Rf1+EPNBOHCWi1E7E2KJ4h38g8OtF5v4F/nb38LyiYtNtGASlezRkxa
         NArV1gGX1aRcPdmJNdvmnHFiM9iL/oiZcpdl6nyYFhsSLubKDzwZH5chdwSOon8oEWAt
         YXqcH1sLoL+7QwxGmJ4iWW/ibdKJ7x0bPEdAgDr8oHqEwVgddsla2u987G/Ag41VK/na
         vS6Meup/V5t0p3RNI8rIus2TneEhHvReuhTNbIu+BPxFvGZmLTaoXiIaOrwFpMJLZGAU
         401uNx1huE1OVxc5FOvUMGMYAm14g4ClQ8PdjGc8lJ/YN2giZllbgZciLoi5CAoqanro
         99XQ==
X-Gm-Message-State: AOJu0Yx/1mivKO9ubWeyoVU8D/EboIE1s5vCbCvzjs3u15x1GnrszU+w
	fWHhxGFhz4s4WYKpot1563ycnw==
X-Google-Smtp-Source: AGHT+IGo/MkOhuQ87pyBbC2n512LcvZgd8ip292GYtt+yin2/JuZNeICWXDi7cMjkYGQ4p2MIAoVng==
X-Received: by 2002:a2e:241a:0:b0:2b9:df53:4c2a with SMTP id k26-20020a2e241a000000b002b9df534c2amr4656731ljk.20.1692287038600;
        Thu, 17 Aug 2023 08:43:58 -0700 (PDT)
Received: from [192.168.69.115] (mek33-h02-176-184-23-56.dsl.sta.abo.bbox.fr. [176.184.23.56])
        by smtp.gmail.com with ESMTPSA id lj5-20020a170906f9c500b0098d2d219649sm10418014ejb.174.2023.08.17.08.43.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Aug 2023 08:43:57 -0700 (PDT)
Message-ID: <c608d62f-e3fe-1ead-b0a7-f935fea80702@linaro.org>
Date: Thu, 17 Aug 2023 17:43:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH v3 3/4] arch/mips/configs/*_defconfig cleanup
Content-Language: en-US
To: Trevor Woerner <twoerner@gmail.com>, linux-kernel@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <20230817115017.35663-1-twoerner@gmail.com>
 <20230817115017.35663-4-twoerner@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230817115017.35663-4-twoerner@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 17/8/23 13:50, Trevor Woerner wrote:
> Drop CONFIG_IP_NF_TARGET_CLUSTERIP from any remaining mips defconfigs as it
> was removed in commit 9db5d918e2c0 ("netfilter: ip_tables: remove clusterip
> target").
> 
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
>   arch/mips/configs/ip22_defconfig        | 1 -
>   arch/mips/configs/malta_defconfig       | 1 -
>   arch/mips/configs/malta_kvm_defconfig   | 1 -
>   arch/mips/configs/maltaup_xpa_defconfig | 1 -
>   arch/mips/configs/rm200_defconfig       | 1 -
>   5 files changed, 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

