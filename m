Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4603A6B9FF0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Mar 2023 20:46:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PbkYr0Pc2z3cgy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Mar 2023 06:46:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ONDiRQag;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ONDiRQag;
	dkim-atps=neutral
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PbkXt1RBqz3cKn
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Mar 2023 06:46:03 +1100 (AEDT)
Received: by mail-ed1-x533.google.com with SMTP id h8so22872019ede.8
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 12:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678823160;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XhnhusYpso9h8+/nIXY/oJLXEHrnKb2XiVlsQ9b08H4=;
        b=ONDiRQagLTVyvzhrwFbGYhO7MweGA6aPWx0XzV66MsRpmOqC6Koe729Wn1HCEVWNFQ
         D3o27iD9GCWZfCNB4KhCIsODlMZxTigsYuoteSZOS9Y7p11mUUaRrQkvKBvltukPpzuR
         YwCcPUUdHntD26Vgi/eXntOrEzlV/zygRL/d/wkxClarxgzUrqu3sWTkkYcHVspsILbB
         SN36+f4tzy7P6L/PCVmwVJ3s6mm8+I4nLQ4z+4q9fzE6weT6jOG+/nwCjMV7AAEJdvVD
         rBzagmtkh6wwMMixWUcbRj32wjyYdywdmT0HdUzyUQWa7C4uGFnVNmvmVH9wGDf434Tw
         iD6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678823160;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XhnhusYpso9h8+/nIXY/oJLXEHrnKb2XiVlsQ9b08H4=;
        b=Ea3AEnK25a7Z5s1sVz0v18fKxXGPBCJ9vpCazuVQjA5nCst75+hDiUa5KstTxmsauA
         RE63J77Me2xdRsNM1o1rqyl2+CI7RXWV4gCitqdXyg6PM2qMwz8GjHhtvfBn+UlIzNYF
         op17EAf/wvHyln7AeibOmHLa7lg6aQt+Tglp59QamRs3SHgkbfAiRdPUdDlZAlwSXpsm
         +jXa1P0DNB/5nou8BanlRiestiv0kOAJUCn3ZhRoRSqD7vCSth+PfVlkrZV41PiatzUZ
         MfQ97U/8arO58gKztsjec/fu2z4Ahhas3fWMat1BRtT0PG8cQlfzLB7MfpkM89oxF+X6
         XB3w==
X-Gm-Message-State: AO0yUKXAnCzTOhhWgzKbZ7Pt75Z5g74qy8Bin3pKUZ9gr5fSYrBsj98e
	s0XOEkuXgmCUad3Tt1KxDxSMkA==
X-Google-Smtp-Source: AK7set8dJIX6MG0tfCB9Nt2ztaf3oOfZDw/JWQK995BqtVEHbWKwofAbRL4CvEuHlmwte2N8XPGQCA==
X-Received: by 2002:a17:906:32d4:b0:878:7f6e:38a7 with SMTP id k20-20020a17090632d400b008787f6e38a7mr3667050ejk.44.1678823160567;
        Tue, 14 Mar 2023 12:46:00 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:642b:87c2:1efc:c8af? ([2a02:810d:15c0:828:642b:87c2:1efc:c8af])
        by smtp.gmail.com with ESMTPSA id hb12-20020a170907160c00b008d9ddd2da88sm1533268ejc.6.2023.03.14.12.45.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 12:46:00 -0700 (PDT)
Message-ID: <a7fbaea5-927a-e4e8-d990-66b53d586d47@linaro.org>
Date: Tue, 14 Mar 2023 20:45:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v11 03/13] dt-bindings: Convert gpio-mmio to yaml
To: Sean Anderson <sean.anderson@seco.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, linux-phy@lists.infradead.org
References: <20230313161138.3598068-1-sean.anderson@seco.com>
 <20230313161138.3598068-4-sean.anderson@seco.com>
 <684eb04d-aeaa-07e1-34d6-783e85e379f0@linaro.org>
 <3c19e6d2-4df2-6187-36d5-98ceef07235a@seco.com>
 <ad56ca5e-03f7-5e3d-6547-91c64fdb08d3@linaro.org>
 <7c7311ad-fbdf-3c7e-dab5-28a562fb7e8d@seco.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <7c7311ad-fbdf-3c7e-dab5-28a562fb7e8d@seco.com>
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
Cc: devicetree@vger.kernel.org, =?UTF-8?Q?Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Madalin Bucur <madalin.bucur@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, Jonas Gorski <jonas.gorski@gmail.com>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, Bartosz Golaszewski <brgl@bgdev.pl>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 14/03/2023 19:50, Sean Anderson wrote:
> On 3/14/23 14:32, Krzysztof Kozlowski wrote:
>> On 14/03/2023 19:09, Sean Anderson wrote:
>>> On 3/14/23 13:56, Krzysztof Kozlowski wrote:
>>>> On 13/03/2023 17:11, Sean Anderson wrote:
>>>> +  reg-names:
>>>>> +    minItems: 1
>>>>> +    maxItems: 5
>>>>> +    items:
>>>>> +      enum:
>>>>
>>>> Why this is in any order? Other bindings were here specific, your 'reg'
>>>> is also specific/fixed.
>>>
>>> Some devicetrees have dirout first, and other have dat first. There is no
>>> mandatory order, and some registers can be included or left out as is
>>> convenient to the devicetree author.
>>>
>>> reg is not specific/fixed either. It is just done that way for
>>> convenience (and to match the names here).
>>
>> The items have order and usually we require strict order from DTS,
>> unless there is a reason. If there is no reason, use fixed order and
>> then fix the DTS.
> 
> The items do not have order. That is the whole point of having a
> separate names property. The DTs are not "broken" for taking advantage
> of a longstanding feature. There is no advantage to rewriting them to
> use a fixed order, especially when there is no precedent. This is just
> an area where json schema cannot completely validate devicetrees.

I don't understand "there is no precedent". There is - we rewrite
hundreds of DTS. Just look at mine and other people commits. The
reg-names are helper and entries were always expected to be ordered. On
the other hand if different devices use different order, then it cannot
be changed obviously (as the order is fixed).

Best regards,
Krzysztof

