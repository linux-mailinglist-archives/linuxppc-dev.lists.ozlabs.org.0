Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E74995B0419
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 14:39:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MN1zH71krz3c4h
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 22:39:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ha6lPE8a;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::22b; helo=mail-lj1-x22b.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ha6lPE8a;
	dkim-atps=neutral
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MN1yc4Fb2z2yZ8
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Sep 2022 22:38:48 +1000 (AEST)
Received: by mail-lj1-x22b.google.com with SMTP id by6so15773256ljb.11
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Sep 2022 05:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=fTdshIA9MMec3X7VmTjTGU3N0nJnI/vT2jNDEM51ia4=;
        b=ha6lPE8aJRyBobeNew4fXWFWJn2CY/KIYJStuGf1/A6h0imBRBkv0jCKRj/oWruLDg
         SF3VcAjOhpLH331xm6Ph7t8BHIeA7WBAhawMWs0FC1a82pAjs3s6nvRCuW8ye5RFfVid
         PeY7+iNNYXzySvSNWkVNJmb9rEGOvjO8dyuOVEhSC53rs2agbzdXeSne2904GvwgoAJF
         NRMwM9maF2zN4+LuH6dovVpaPxpM62vpjdchW0hdG+klTJrlekBOz+8DBO0IX35kb5Il
         UKemvTtxecDcxLdq2sgCkgfU9g13gE7LbrS0oybQumWW4ri9neovZPRbWyCm1QzcCSYK
         BVDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=fTdshIA9MMec3X7VmTjTGU3N0nJnI/vT2jNDEM51ia4=;
        b=ZtY4ma8Y2Y7PWzr2Z7outrfOSP2EgEk00W0msDER7kWMnthyFYJeebbWbn7HsmwLXy
         awxw9w3GALevjISfvXfgG1dzKbbJ361dK4buJyFRPBfmHLIO2FlnG05kxUWECIeNbyZJ
         pmEyRkanyJ8VGWWswpgCbIYjZJ9p1VYuGBU+F0d4l1PxSmf4zXQW+8EDnVNyo9it6Jk9
         ipRI0B45rIrFMWiFAeWbeztUNcsP2tAMNPcyL80USl9GZyXhQ5b+0rusS1Z5zS3RVmr1
         yWt6CQdxJYOPiyqE/++UjVEIIX8raZ60M0CbMaGMJkJRTlD3AwR+HEGOi4PzXzyIisVS
         DW8Q==
X-Gm-Message-State: ACgBeo18rP0OX1vToWbZZH9VT93kHVYctunz1VGYtFSNBxWFemEybeNs
	f69+ZQJ0CigBN7b7nTZC8DCkoA==
X-Google-Smtp-Source: AA6agR5TFphhTKCAVf1SKVI7yMO7YM7140eM6H+ulhYTKCVmuZLA8uBrv8H5ERRV1tJSbWo8sax0DQ==
X-Received: by 2002:a05:651c:1a11:b0:264:1e72:9d30 with SMTP id by17-20020a05651c1a1100b002641e729d30mr1051641ljb.160.1662554323787;
        Wed, 07 Sep 2022 05:38:43 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id o2-20020a2e90c2000000b0026ac8c94022sm659772ljg.119.2022.09.07.05.38.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Sep 2022 05:38:43 -0700 (PDT)
Message-ID: <9a71a2f3-97f6-f3ac-8852-1d3da1a50370@linaro.org>
Date: Wed, 7 Sep 2022 14:38:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 1/3] dt-bindings: reset: syscon-reboot: Add priority
 property
Content-Language: en-US
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <20220820102925.29476-1-pali@kernel.org>
 <20220831081715.14673-1-pali@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220831081715.14673-1-pali@kernel.org>
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 31/08/2022 10:17, Pali Rohár wrote:
> This new optional priority property allows to specify custom priority level
> of reset device. Prior this change priority level was hardcoded to 192 and
> not possible to specify or change. Specifying other value is needed for
> some boards. Default level when not specified stays at 192 as before.
> 
> Signed-off-by: Pali Rohár <pali@kernel.org>

Thanks for the changes. Explanation looks good.

I sent a patch adding the common schema with priority. If it gets
ack/review from Rob and Sebastian, please kindly rebase on top of it and
use same way as I did for gpio-restart.yaml

Best regards,
Krzysztof
