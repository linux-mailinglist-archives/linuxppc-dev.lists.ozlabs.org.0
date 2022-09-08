Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DE25B159F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Sep 2022 09:27:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MNW0z2dWxz3c25
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Sep 2022 17:27:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NL7EBP7s;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NL7EBP7s;
	dkim-atps=neutral
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MNW0L6bLDz2yHR
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Sep 2022 17:26:57 +1000 (AEST)
Received: by mail-lj1-x236.google.com with SMTP id l12so10394226ljg.9
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Sep 2022 00:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=LF14xoV7ofKttTcBdi+LKav8yvezlrH+J2rWTVvf/OQ=;
        b=NL7EBP7scniC5110h6lbEQucc1DlCz/xzdp65hnzWd0E1PsiQGhbG1lY7cAWfpbt9B
         qkK8BkSq03YvbYWxA47Tol7OhUcAwjwhDLcmA4jWJ8hHxYbk1lwkjzQwIQtHHiiB5DXI
         Fm9VctCVAnXJKfCUu7zPUDJ5guq+fh9lw6UsJuxB3DhOPDcti6gqoyyonUY5uTr9nN3i
         wfL+ZXMcByJJtVYzf8fzM5exZrseMJjQ+g5Fo93s9smufA+u16LTK/Hng4wbUBzBSxNw
         BrhG+c0e3B4T2ZYhxgHFXT7/Fss1AGB61jTCOKOJjTKhBmxjDnytgjARymuuL4cHEdl1
         fiwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=LF14xoV7ofKttTcBdi+LKav8yvezlrH+J2rWTVvf/OQ=;
        b=JLLGEQ3fLWzABpL0GH44NPpF1Mw+GC5t70X28lM1HiBjVjiam0ftwvde4RwNg/p9/O
         c69I2I1mJIezZ7vzZ6hmwfyzblQiGxlZN97wMznrGaJ7oUhbIjTjaJKQ3QNIORg5fp+G
         Pi1Jjbl+x2ieQw8tgFSHXQXLY+/zY0tOejjJex391bvYg0Np/qWyydcorwFS+siTAYTs
         EztFLBc8ytM8H7lquiWHEOoBzWoLoivV1qfZkZ6mrdXT44v1ihblkwZ1PqhEkbx0hEL3
         FSPPBKnmB+nm6Y40nxGD3fjqD+iHgmCm8l8xSny+WFcJ3ujvCdCKjUWKtDHfI0a6TNrx
         vo8A==
X-Gm-Message-State: ACgBeo1mY++bocaA6cLkOC2ivm6WnvY+ogmnUouA3pNp0Zbz6qehUb03
	zddUNhwBPVSHDuyX5BTKKapBjA==
X-Google-Smtp-Source: AA6agR4GpbjANjRRB/mggPAAMnjTCBrBoQ3zs7xDo36rYSrtHcx43GjsfBpcNuT6ZlDcZ53RODXr4g==
X-Received: by 2002:a2e:9a97:0:b0:26b:3f4f:cb90 with SMTP id p23-20020a2e9a97000000b0026b3f4fcb90mr807088lji.137.1662622009507;
        Thu, 08 Sep 2022 00:26:49 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id u10-20020ac258ca000000b0048b0975ac7asm262844lfo.151.2022.09.08.00.26.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 00:26:49 -0700 (PDT)
Message-ID: <37b21772-c128-36bb-dbc1-5047b2a82773@linaro.org>
Date: Thu, 8 Sep 2022 09:26:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 1/3] dt-bindings: reset: syscon-reboot: Add priority
 property
Content-Language: en-US
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>
References: <20220820102925.29476-1-pali@kernel.org>
 <20220831081715.14673-1-pali@kernel.org>
 <9a71a2f3-97f6-f3ac-8852-1d3da1a50370@linaro.org>
 <20220907163331.zoumcdmmarnbkmm5@pali>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220907163331.zoumcdmmarnbkmm5@pali>
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

On 07/09/2022 18:33, Pali Rohár wrote:
> On Wednesday 07 September 2022 14:38:42 Krzysztof Kozlowski wrote:
>> On 31/08/2022 10:17, Pali Rohár wrote:
>>> This new optional priority property allows to specify custom priority level
>>> of reset device. Prior this change priority level was hardcoded to 192 and
>>> not possible to specify or change. Specifying other value is needed for
>>> some boards. Default level when not specified stays at 192 as before.
>>>
>>> Signed-off-by: Pali Rohár <pali@kernel.org>
>>
>> Thanks for the changes. Explanation looks good.
>>
>> I sent a patch adding the common schema with priority. If it gets
>> ack/review from Rob and Sebastian, please kindly rebase on top of it and
>> use same way as I did for gpio-restart.yaml
>>
>> Best regards,
>> Krzysztof
> 
> Ok, so just by adding "allOf: - $ref: restart-handler.yaml#" right?

Yes.

Best regards,
Krzysztof
