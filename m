Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D085B03E9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 14:27:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MN1jv2GMYz3c4W
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 22:27:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=yPYIySVy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=yPYIySVy;
	dkim-atps=neutral
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MN1jH4b7rz2yyT
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Sep 2022 22:27:14 +1000 (AEST)
Received: by mail-lf1-x135.google.com with SMTP id z25so22196627lfr.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Sep 2022 05:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=hkt5H36L3OARQPXUWShQgmKb8uHcR0j2cY0iuaSsFjs=;
        b=yPYIySVyJlG1GoCJFTwPifoRfXI5LWpYm6hMpU5UYf7BsA9LJAV+AxQVwh6nDNAcKJ
         bidDdQ5G2HlmY0LIWXg8DJ/WuWcLG7KgnMcPFtODGVEm9MkqA+Ah0asKYkGerMqtXoE3
         zsasQiw7Ymkfi5diqwV7aUgO36YU8wP5V0m0RrBMS3ieMUwU6tdo5NrEGZ86gVdgkrMh
         YOi9qBUzcY1QkVlFlS3fIZEAvoo3eOF+2lUjseWhJD+hIVl0n+EUC55lWAUX3tSBsJia
         EHevE59bxBbeZhm5w3i4eeuLHRCGMhdaJdl/EcTifT10Vs6IvgaX1g47CGli4hKi1GJN
         qXVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=hkt5H36L3OARQPXUWShQgmKb8uHcR0j2cY0iuaSsFjs=;
        b=mtqW9aXOb0jUMRITcS/zYg7roZ+KQM3J+1s0AVY0GK9wkSVLjwDvxSBSzUR7keV6jZ
         peXWOzQn/pWK9+pj+Vo0Wmd1lGg5rv+bQmq2SdqE2wt4eKPcftb0vXfYzMgrcwQgjxai
         UPzGtBQKKoOvchcn1rLLuErAx/Q/ZLNKYHnoxTq1hM6AKUOLM5TldFDgOpSHStGF3CeQ
         JqE0oqgnPhIch146J3p1m56M9TpzvXSZ07jRrsw6mYoA9/rwuWZeS+iJciZbxGDEQrfC
         htw5Frov+EFOXsFboz0N4BUj+66RD9v1lbsHjQr69284iTBuCHw/303Delm3Fa2NIKMg
         nYgw==
X-Gm-Message-State: ACgBeo3vWEg22VMdjtWKCDLkNdAoiGZE6PGEkwcg62gYnF8z8lHvGXda
	aBIEl/+Lg/l2FrGf9zDmv5UdDg==
X-Google-Smtp-Source: AA6agR5gM5S1o4Rffv0N/rKle5mJ0G+VWZe+TicMZ4aaD1YM7lDKNIOMPR+gGy7M4hewgiNGl46L1w==
X-Received: by 2002:a05:6512:169c:b0:492:ca5c:eb23 with SMTP id bu28-20020a056512169c00b00492ca5ceb23mr1098925lfb.646.1662553628486;
        Wed, 07 Sep 2022 05:27:08 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id q14-20020a2eb4ae000000b0026ab199e137sm1040840ljm.48.2022.09.07.05.27.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Sep 2022 05:27:07 -0700 (PDT)
Message-ID: <8fe93da3-f768-16ae-7025-1cfa97a42b27@linaro.org>
Date: Wed, 7 Sep 2022 14:27:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/3] dt-bindings: reset: syscon-reboot: Add priority
 property
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, =?UTF-8?Q?Pali_Roh=c3=a1r?=
 <pali@kernel.org>
References: <20220820102925.29476-1-pali@kernel.org>
 <20220822124728.GA3641041-robh@kernel.org>
 <20220822135050.o4a4bw3dqkmhtjgb@pali>
 <20220902203721.GA356619-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220902203721.GA356619-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>, devicetree@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 02/09/2022 22:37, Rob Herring wrote:
>>
>> Sorry, I do not understand.
> 
> So just keep sending new versions instead?
> 
> syscon-reboot is not the only binding for a system reset device, right? 
> So those others reset devices will need 'priority' too. For a given 
> property, there should only be one schema definition defining the type 
> for the property. Otherwise, there might be conflicts. So you need a 
> common schema doing that. And here you would just have 'priority: true' 
> or possibly some binding specific constraints.

I'll propose a patch for this.


Best regards,
Krzysztof
