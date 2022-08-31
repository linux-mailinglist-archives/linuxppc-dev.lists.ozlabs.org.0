Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E975A782C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 09:53:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MHbyS58Vbz3c7B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 17:53:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PIg8+3d6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PIg8+3d6;
	dkim-atps=neutral
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MHbxq0Z5zz2xn5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Aug 2022 17:52:44 +1000 (AEST)
Received: by mail-lj1-x235.google.com with SMTP id x10so13743407ljq.4
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Aug 2022 00:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=Lckl7K+XuyktEVYPye4vGCDmH7688b5CS8zBA9Y9oIE=;
        b=PIg8+3d6PEsrGdo3r1QYFHSWChCwHGdEWlOiDvnIf+PiQBBAwBUXtWJkNksAnTUOdx
         siSmwzup/w6GIG11wuc4CA7s8hiwImPIJykM8qSfVmDS9ItqvvqqLv0cJ/0gI2lKJjYb
         fyvxf0Qg0bju9AN0WlDrOi3qP/EcVIDl2DBn0NVFLLfdSYA2bYmSWlqQcKy8ere2Vun0
         8igzsOczmuT6N7Gy6Jj7C71jU46qL8y+NWRgTfDUUPNPROIPD/g9BXvHaul7iU1v7czs
         c18I48wi3FALMEmLjq+PdfCUAJK/vSBnms332fshTtUvaJyQvqGjV4ydxrRtiFRBXfpF
         wrEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=Lckl7K+XuyktEVYPye4vGCDmH7688b5CS8zBA9Y9oIE=;
        b=BkeULYvkaFG4btC8pV6yyFJjt9/1/GXPs/9G1GBEdyjNkXqpAGcPK/bn1V0nDzBdrf
         o4ejifjxSdRyy7DPjkyeXpe7rZz5fjcHVIFx9eiU10luMB5rO/3XKsafnt5Ld4YTxlF4
         n5HHlmbDcBaHQboR3LAt/kYKSC2HuNlY9X692V8ylnBXWYFb76XN2006NqhVp4z1MFKp
         SuIYZ/vLy1qSEXPTqePh3qIPejX5Zc4GNmdohOKRyOxqau8UaidW2Xks9IBO/EkclUbK
         1chhV0dlDlkJM0lfwkUkSeaKBaYZ/DmcFpd+1ztUxh9YI2VmpymSPZmRJV2bi0tkBrEp
         sC2w==
X-Gm-Message-State: ACgBeo1/rbvmnfbwSIgo7vfu3ahgaYOsb2wng29G/rXnZHLb6lAHonY7
	1FL02F8RhRPIiBwE9RgVrkCArw==
X-Google-Smtp-Source: AA6agR7kerViFsEYIJs3B2EKamdow9afs0StxBSpkQBm+SKgwDA2fKkd5vv/1r6NG1EAam5/yvWDDQ==
X-Received: by 2002:a2e:5002:0:b0:264:2b08:9a3d with SMTP id e2-20020a2e5002000000b002642b089a3dmr4494279ljb.286.1661932360265;
        Wed, 31 Aug 2022 00:52:40 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id p17-20020a2ea4d1000000b002688844741bsm125809ljm.126.2022.08.31.00.52.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Aug 2022 00:52:39 -0700 (PDT)
Message-ID: <dcd25b00-f2e6-311c-fc1d-6175158f32b3@linaro.org>
Date: Wed, 31 Aug 2022 10:52:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 1/3] dt-bindings: reset: syscon-reboot: Add priority
 property
Content-Language: en-US
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>
References: <20220820102925.29476-1-pali@kernel.org>
 <20220830230012.9429-1-pali@kernel.org>
 <373fdedb-447e-b552-df83-737267068296@linaro.org>
 <20220831073622.5bp3ftf3fkea5rdk@pali>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220831073622.5bp3ftf3fkea5rdk@pali>
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
Cc: =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>, devicetree@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 31/08/2022 10:36, Pali Rohár wrote:
> On Wednesday 31 August 2022 10:31:22 Krzysztof Kozlowski wrote:
>> On 31/08/2022 02:00, Pali Rohár wrote:
>>> This new optional priority property allows to specify custom priority level
>>> of reset device. Default level was always 192.
>>
>> You still did not explain why do we need this. You only explained what
>> you did here, which is obvious and visible from the diff. What you
>> should explain is why you are doing it, what problem you are solving.
>>
>> Best regards,
>> Krzysztof
> 
> Look at patch 3/3, thanks.

This commit should explain it why you add new property. Some other
commits going via different trees/branches and ending up in entirely
different time/place in history do not really count.

Best regards,
Krzysztof
