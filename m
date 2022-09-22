Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 552465E67EE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Sep 2022 18:00:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYKkf1hc2z3cK6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 02:00:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EYPGtsJB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EYPGtsJB;
	dkim-atps=neutral
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYKk33ldhz2yxG
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 02:00:09 +1000 (AEST)
Received: by mail-lj1-x236.google.com with SMTP id b6so11514212ljr.10
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Sep 2022 09:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=V6c4rAkBN7foufFnqvB7xWcwVdlx3krdKAsSA3LKM2E=;
        b=EYPGtsJB9cW2i8ii2puNH0fl/Zo+U86V5lGXj2D6qdBeobw33K4NOA3XttPpBcTQxj
         BmifAf8To/Ekt7txQ0CRAsoStMlTM9qzDNX21zyAM+0RsHiy+Du3fI/AJ0fvAiAkfCmw
         2+la+sBJePp/H9saQOBkOdDYQQagqXLVHlNt1DmTlcwiMzBUooRHMOftwDb4KTQPn1EP
         dL1bH1zU6/qLtMD9bx81tSrcuoxmigJIZD0GtFir1mriQVY5T+PGXaJIhR6T8KCnV6W1
         WpxA7eL5BOC1RYZQmGS0iMY+9MlypPsXM70o7KWWjekX3ilZqy9TJShlzaUrx56Rb5V/
         QIZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=V6c4rAkBN7foufFnqvB7xWcwVdlx3krdKAsSA3LKM2E=;
        b=TqShzszT1EAEPLamvJp/LlQfqWxC+D0/TktGo7bnpli92qUJ5QoHGqoInFN9ushvNT
         vTOwZKNV+YgcEqOQ34ezrfU6Sx0qP3H3B7Ves8VeQhjHZ1wfTlWKT5U8VyNpXIxX/LPS
         UwxWiZPPd2LcCRyWA3gdBhpP5gW+3r9MqdQ6V9Pew9mqbVGg/vEKbGO0ohG6GdGvepgJ
         KGHK5bNeBLr2PQ3N0xkwv2eX8XNglPGGTn2KC6jCa510+Uyna2jnZyFcGGgI4Z007xZP
         p8ls2vhdsZ3hhjgKH98sDyVTvM+b2o6C94fvK5OiMvU0uX/jDTeIdhq7Mv4lD4cg/A6i
         nDlw==
X-Gm-Message-State: ACrzQf14c2SjJAkZ9o8dTB0Hx4gL4FUwDOG2wBn0GN2XL/E0q03rqjQf
	nR6IrfPBStpd55BLrHqGfxZLdA==
X-Google-Smtp-Source: AMsMyM73gkh5v4gbhi++Eqv5Q8s+pslKnw3lQRjbKqjuIm9witwFzTyTHNJ1ckYpHAt0TqUTGvqYhg==
X-Received: by 2002:a2e:780b:0:b0:26c:1458:ddc3 with SMTP id t11-20020a2e780b000000b0026c1458ddc3mr1443600ljc.375.1663862404991;
        Thu, 22 Sep 2022 09:00:04 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id d9-20020a196b09000000b004999c243331sm994865lfa.141.2022.09.22.09.00.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 09:00:04 -0700 (PDT)
Message-ID: <297f22b9-931f-669b-6539-c59fb411aa38@linaro.org>
Date: Thu, 22 Sep 2022 18:00:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v6 2/8] dt-bindings: phy: Add Lynx 10G phy binding
Content-Language: en-US
To: Sean Anderson <sean.anderson@seco.com>
References: <20220920202356.1451033-1-sean.anderson@seco.com>
 <20220920202356.1451033-3-sean.anderson@seco.com>
 <20220921065718.lafutkkgiium5ycu@krzk-bin>
 <4e125df2-b815-c0cd-336c-97b20c2702c8@seco.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <4e125df2-b815-c0cd-336c-97b20c2702c8@seco.com>
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
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, Madalin Bucur <madalin.bucur@nxp.com>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, linux-phy@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 22/09/2022 17:23, Sean Anderson wrote:
>>
>> This check can fail if there are any dependencies. The base for a patch
>> series is generally the most recent rc1.
>>
>> If you already ran 'make dt_binding_check' and didn't see the above
>> error(s), then make sure 'yamllint' is installed and dt-schema is up to
>> date:
>>
>> pip3 install dtschema --upgrade
>>
>> Please check and re-submit.
>>
> 
> I believe this is due to the previous patch not being applied, same as last time.

Yes, please ignore bot's report.

Best regards,
Krzysztof

