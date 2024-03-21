Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F77D886273
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Mar 2024 22:18:44 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YtsudnLU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V0yxZ2zdlz3vmb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Mar 2024 08:18:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YtsudnLU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com; envelope-from=javier.carrasco.cruz@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V0yPn1Lqdz3c9r
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Mar 2024 07:54:35 +1100 (AEDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-513dc99b709so1857430e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Mar 2024 13:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711054468; x=1711659268; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4dpqtSWJGyTeUnxqugJzMO94Z9iV/f5bgYjvchhbNxE=;
        b=YtsudnLUsJ27rXGg+lQe+t4KZ25E5J18UX0kPHBgfcPLabMLOcwHTORKF8mrCSmtK2
         k2bmkGvh+JyXaahajDXn2/lP5MD/IReHknxfaSPHwgyaGi8cr6En7Tq747wa8L0w6XyN
         kcGIJMRz7S/snzG3dzcK9IG1f0rqjMryBuNfYoc5v5mP9esxVIbx5Z1lvW2mcjya2HZq
         R+qoBRAttrhMUce8lgJaRUdrTXnhqc5l73LtwDD/0Q8/x4RSHVTxR9aoKANNz//VR6LU
         Q/yrmqDSiT4yT91sw3MvYj0iWcR91LTIB6FIrcERd7pQMRl8T5hNto0Vae7I6hQM6B+a
         SMwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711054468; x=1711659268;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4dpqtSWJGyTeUnxqugJzMO94Z9iV/f5bgYjvchhbNxE=;
        b=gGHQbICGT+rauk+C+KUnvrmqFNoal8elj9bvrbK1Gd3D3QJNSh5nXmTftKNV47OXf7
         98j00VPVxO9j4nBU88d4l6of2yOQZAILb0/puSsP7XMdwICks37oFcBnucGOV2wUXnxt
         q4vx15VmvuQdcdKb4HnehyhCpPINEqjZZRRY9Kl/rjpbDEMyjevDLT3uGl5wSeEDYYUd
         NDAj7p+zf1UaqmfkMUYQzDTtFxKfCWbtlP/hS9wsJSKlKIfdeJJ+3TS8DLobyOcerjJ/
         NiRg8LpQ1rpULCuS6Qw9xH/69sqid7Gt7s8yUfS2NDQfPE0BedKHuJ1ymALFohteb5zt
         Ntqw==
X-Forwarded-Encrypted: i=1; AJvYcCV20F6nCPIIBhK5lPVFjr7NudL2J58WQuiHBu5gPQIZPvcmUxtcLxf1el2N9eTs4Qc+nn4ilXYx19J1AAOoYHc6ApWhshTvQ0bszl8hVQ==
X-Gm-Message-State: AOJu0YwhXSIhN7+j2O9UjZOlAffznYuTFMxCC/lx3eUSEhNKVUPb1iJR
	ZHENvA1NnqyWNHHXGYjfsSBZEN88pSWrNvHq0h0oHmbQstaP+5VC
X-Google-Smtp-Source: AGHT+IF00jvltcjrS4QawwDsCnX+RLKRo6CEUXlNmaAZkEy6czLuI6rU56WPSUMOFR9qHZGoD99mGg==
X-Received: by 2002:a05:6512:3051:b0:513:9e13:6403 with SMTP id b17-20020a056512305100b005139e136403mr390726lfb.21.1711054467418;
        Thu, 21 Mar 2024 13:54:27 -0700 (PDT)
Received: from ?IPV6:2a02:8389:41cf:e200:9fd4:5a72:5943:9800? (2a02-8389-41cf-e200-9fd4-5a72-5943-9800.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:9fd4:5a72:5943:9800])
        by smtp.gmail.com with ESMTPSA id gt32-20020a1709072da000b00a46ee5b9aa1sm302555ejc.90.2024.03.21.13.54.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Mar 2024 13:54:27 -0700 (PDT)
Message-ID: <469068f9-b219-4d80-bab4-cbffaa04a67d@gmail.com>
Date: Thu, 21 Mar 2024 21:54:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] dt-bindings: hwmon: ibmpowernv: convert to dtschema
To: Rob Herring <robh@kernel.org>
References: <20240321-hwmon_dtschema-v1-0-96c3810c3930@gmail.com>
 <20240321-hwmon_dtschema-v1-2-96c3810c3930@gmail.com>
 <171105391076.2619280.17497439995032037227.robh@kernel.org>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <171105391076.2619280.17497439995032037227.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 22 Mar 2024 08:13:59 +1100
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Guenter Roeck <linux@roeck-us.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/21/24 21:45, Rob Herring wrote:
> 
> On Thu, 21 Mar 2024 19:43:43 +0100, Javier Carrasco wrote:
>> Convert existing binding to support validation.
>>
>> This is a straightforward conversion with now new properties.
>>
>> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
>> ---
>>  .../devicetree/bindings/hwmon/ibm,powernv.yaml     | 37 ++++++++++++++++++++++
>>  .../devicetree/bindings/hwmon/ibmpowernv.txt       | 23 --------------
>>  2 files changed, 37 insertions(+), 23 deletions(-)
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/hwmon/ibm,powernv.example.dtb: /example-0/sensor: failed to match any schema with compatible: ['st,stts751']
> 

Obvious mistake, this compatible belongs to another patch of the series.

Will be fixed for v2.

> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240321-hwmon_dtschema-v1-2-96c3810c3930@gmail.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 

Best regards,
Javier Carrasco
