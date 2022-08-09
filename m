Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 942F258D31C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Aug 2022 07:22:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M21fp3VZZz3c17
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Aug 2022 15:22:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Q45jxuuC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::22b; helo=mail-lj1-x22b.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Q45jxuuC;
	dkim-atps=neutral
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M21f75vgpz2xjr
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Aug 2022 15:22:05 +1000 (AEST)
Received: by mail-lj1-x22b.google.com with SMTP id s9so11914103ljs.6
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Aug 2022 22:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=w/IFf/K/9OkURHHOs9WHITZ5E+GducqFMehZENmcMms=;
        b=Q45jxuuCA3JYTRwNdbj8vKCeun3j9XXgjpX+PbR9MLO9z73W9A+o+9UIympLc/+Yrw
         awg9LkC1NBelWb+6zWghPSRUAM1OGNMqVnaHivQie203kYO6tgIw6ermK1m+ZNMp+dbK
         CKvXXs0uDwNsMsufqOZo59ZZG5l7uXkk1QIjSRJmu3EkdB9kaA16qyy2HjtIVW7GRAE1
         0g3XAjMaPKBOakKHQSfOGuD15dVATMVncTwRIj2Iuh831tepvdNcVjlpXkShKsy4D8kI
         igb6EVvXurEZcPdc2kdPuo7M1yjdAYMZsvbnzNAgMHgFyXQU97gmFVpIMvmT/YDPM6ml
         gLjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=w/IFf/K/9OkURHHOs9WHITZ5E+GducqFMehZENmcMms=;
        b=1wb51CHhB5W/zWYc6yAJuJfoGaOamo6Sk9kXGyN2vhUdTya7RCETgXrtzSgRwa9zn+
         yrqKXfc8q++694iukVuZOfsC/DLzMoPsEJI2GFkPWI5nYoF4pPj6tN6zBW3Y5MsuNNt8
         cayT55YIQZNP8dELGn6ngBnTk6jpAKriR/AQ9NhjiiWj7tFYWfVZO/lC23Eie/w0KJ1F
         8oRC+ltKo1mE6OsuRmjidA70K3R99eUcBJ2ySZ06+0vigdV5SFHbL9UarKCNWb2XkwVL
         4n4Cdgq7tQ8v+w2pAR0zt0hGkjSOcAQjFibwOcv05hv8o6MFJT3jcJKRpqpIxJzMeMHi
         O4ZQ==
X-Gm-Message-State: ACgBeo1pqIclnMG6hSUQYpkjYYzJ2lSrwEUCK3DIcXzBrR09xqjkL64Z
	pHyndJPLZzCaNn3bDN7r1helrw==
X-Google-Smtp-Source: AA6agR4nyxXV6UENxnka0n+jYHLHQ8Snp/LpQLG2xkyn/vQhrsmbZO2MAsK8dD6JtMDOLbg2HkoREg==
X-Received: by 2002:a2e:918d:0:b0:25e:c884:6a96 with SMTP id f13-20020a2e918d000000b0025ec8846a96mr4178935ljg.157.1660022516960;
        Mon, 08 Aug 2022 22:21:56 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id cf40-20020a056512282800b0048a8f119e7esm1624381lfb.233.2022.08.08.22.21.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Aug 2022 22:21:56 -0700 (PDT)
Message-ID: <a387164a-d42c-fc1e-529c-6000aa2db33e@linaro.org>
Date: Tue, 9 Aug 2022 08:21:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4 3/8] dt-bindings: clock: Add ids for Lynx 10g PLLs
Content-Language: en-US
To: Sean Anderson <sean.anderson@seco.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, linux-phy@lists.infradead.org
References: <20220804220602.477589-1-sean.anderson@seco.com>
 <20220804220602.477589-4-sean.anderson@seco.com>
 <bee3d724-1efb-d5c7-6698-c98a198e69fd@linaro.org>
 <b97f113b-f429-c8c5-96ee-7f1a68e16117@seco.com>
 <6aac8854-599e-c43f-0a49-0650fce91179@linaro.org>
 <04b08e1c-4af2-581e-7be5-96c5b7b00ae5@seco.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <04b08e1c-4af2-581e-7be5-96c5b7b00ae5@seco.com>
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
Cc: devicetree@vger.kernel.org, Madalin Bucur <madalin.bucur@nxp.com>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 08/08/2022 18:16, Sean Anderson wrote:
> 
>> This entry here is not
>> parsed for any tools and only sometimes people look at it. The questions
>> are directed via entry in maintainers file or via git history, so you
>> can put company email just there.
> 
> As I understand it, the email is simply informative. There are literally
> hundreds of examples of mixing a "personal" copyright with a company email.
> It is easy to find if you grep. If you are so opposed to it, then I will
> remove the email and simply use my name.

No, no problem for me.

> 
>>>
>>>>> + */
>>>>> +
>>>>> +#ifndef __DT_BINDINGS_CLK_LYNX_10G_H
>>>>> +#define __DT_BINDINGS_CLK_LYNX_10G_H
>>>>> +
>>>>> +#define LYNX10G_CLKS_PER_PLL 2
>>>>> +
>>>>> +#define LYNX10G_PLLa(a)		((a) * LYNX10G_CLKS_PER_PLL)
>>>>> +#define LYNX10G_PLLa_EX_DLY(a)	((a) * LYNX10G_CLKS_PER_PLL + 1)
>>>>
>>>> These do not look like proper IDs for clocks for bindings. Numbering
>>>> starts from 0 or 1 and any "a" needs to be clearly explained. What do
>>>> you bind here?
>>>
>>> This matches "a" is the index of the PLL. E.g. registers PLL1RSTCTL etc.
>>> This matches the notation used in the reference manual.
>>
>> This is a file for bindings, not for storing register values. There is
>> no single need to store register values (offsets, indexes) as bindings
>> as it is not appropriate. Therefore if you do not use it as an ID, just
>> remove the bindings header.
> 
> This *is* just for IDs, as stated in the commit message. The above example
> was only to illustrate that the clock controlled via the PLL1RSTCTL register
> (among others) would have an ID of LYNX10G_PLLa(0).
> 
> If you doubt it, review the driver.

Indeed, thanks. Except the driver, where is the DTS user of these
bindings? It's neither in bindings example, nor in the DTS patches.

Best regards,
Krzysztof
