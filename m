Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7990B55B143
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jun 2022 12:43:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LW6sF4c4Bz3cfc
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jun 2022 20:43:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=s6B+CpTs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=s6B+CpTs;
	dkim-atps=neutral
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LW6rd1Gv5z3bf9
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Jun 2022 20:42:54 +1000 (AEST)
Received: by mail-ed1-x534.google.com with SMTP id eo8so9351824edb.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Jun 2022 03:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=+7oDvDolVgyiWCBP1kGvDhx2VojLawcjdaZLLC+Q36w=;
        b=s6B+CpTs4RD/gcT1faaJi6ASL1l5+sjwqAltmmk46YurGaSsYbCZr16lzlZNTYBFtb
         CiBnpSMUKdq0DlYTvdb5vsrU1gMOwRt5vsSFFr3TKOMJFbaYyA6TBoktOa+Bn4A5BGiI
         KahyH4DScCPH6S/oe8Tz6vPR7r9Ewip0HtLcEUKs/mv2CkwDDgL6r5Fa0gpbJ9jJdAQ6
         YY9DOOdDGKWldDluxU0eVDBwbqLZ1hQ209Pl8DX7SnKoqJy34VLuSqnBYS43673oKJ5Q
         2ni2cU2cYyt/aoo32PmMZy1ewJOURm6AfBUtUScTZrdsZtx9+kAceYdpH5VwQR+im1ih
         bATA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+7oDvDolVgyiWCBP1kGvDhx2VojLawcjdaZLLC+Q36w=;
        b=XktpRhzHDhkamrhjkUvcYKKDkAheLTsJx3RE14ACI8DNe+qaMUjFqlEUVXnLh23IFt
         JjY54ve/6PtyYdpEJT+ezAzcJ0zbUAkI3y42zwW4B102NmGDuGlVMsvywvt4aVSWOnOk
         cxPJ8DiKHfC38KueoxlzbG42GLrtlw4hCxtU8QbSpR4O+OqCgD4KBrmuW/B+VDke9cWW
         SHmqu80Kt4i/oB4H22G/qqcOoUOufEZqqRxxQC1uWNGhzehTXsM1j4edyAeS5udXz9XV
         HOC1xiZ4Bcvwu2z3fE1lWfxcqGIlhfO9uPLIlbRlgEpKzvA8AS+DjPAQ8sTlCPEDAXGt
         Gcng==
X-Gm-Message-State: AJIora9THg1ImSo4Q4CqjiDd3TtxsNkZnQaC40ZzBZ+JrnDZ0Vh/8Mks
	zGXmfWcS5DBqz4rCWO2wb/Njfg==
X-Google-Smtp-Source: AGRyM1u1d/DmBwJzEStyDHpQojeLaBFX8PgoTatK6v58i5U80IJg6lCXoo9PZ/Lil9R60f4Yaccg6A==
X-Received: by 2002:a05:6402:2929:b0:435:6dfc:c4f2 with SMTP id ee41-20020a056402292900b004356dfcc4f2mr10120571edb.284.1656240170903;
        Sun, 26 Jun 2022 03:42:50 -0700 (PDT)
Received: from [192.168.0.239] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id p22-20020a170906839600b00711d5bc20d5sm3561921ejx.221.2022.06.26.03.42.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jun 2022 03:42:50 -0700 (PDT)
Message-ID: <8b384f4e-7114-7afb-98d6-af71709525d6@linaro.org>
Date: Sun, 26 Jun 2022 12:42:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH RESEND v9 4/5] arm: dts: stih407-family: Harmonize DWC
 USB3 DT nodes name
Content-Language: en-US
To: Serge Semin <fancer.lancer@gmail.com>
References: <20220624141622.7149-1-Sergey.Semin@baikalelectronics.ru>
 <20220624141622.7149-5-Sergey.Semin@baikalelectronics.ru>
 <59d8a34a-a211-d00a-2243-6ad51cfa4204@linaro.org>
 <20220624204524.nveittak6ruksuvq@mobilestation>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220624204524.nveittak6ruksuvq@mobilestation>
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
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Paul Mackerras <paulus@samba.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh@kernel.org>, Khuong Dinh <khuong@os.amperecomputing.com>, Alexey Brodkin <abrodkin@synopsys.com>, Krzysztof Kozlowski <krzk@kernel.org>, Andy Gross <agross@kernel.org>, linux-snps-arc@lists.infradead.org, Patrice Chotard <patrice.chotard@foss.st.com>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, Vladimir Zapolskiy <vz@mleia.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, Patrice Chotard <patrice.chotard@st.com>, linux-kernel@vger.kernel.org, Serge Semin <Sergey.Semin@baikalelectronics.ru>, Vineet Gupta <vgupta@synopsys.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 24/06/2022 22:45, Serge Semin wrote:
> On Fri, Jun 24, 2022 at 07:18:57PM +0200, Krzysztof Kozlowski wrote:
>> On 24/06/2022 16:16, Serge Semin wrote:
>>> In accordance with the DWC USB3 bindings the corresponding node
>>> name is suppose to comply with the Generic USB HCD DT schema, which
>>> requires the USB nodes to have the name acceptable by the regexp:
>>> "^usb(@.*)?" . Make sure the "snps,dwc3"-compatible nodes are correctly
>>> named.
>>>
>>> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
>>> Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
>>> Reviewed-by: Patrice Chotard <patrice.chotard@st.com>
>>> ---
>>>  arch/arm/boot/dts/stih407-family.dtsi | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm/boot/dts/stih407-family.dtsi b/arch/arm/boot/dts/stih407-family.dtsi
>>> index 1713f7878117..7ba528315dbe 100644
>>> --- a/arch/arm/boot/dts/stih407-family.dtsi
>>> +++ b/arch/arm/boot/dts/stih407-family.dtsi
>>> @@ -725,7 +725,7 @@ st_dwc3: dwc3@8f94000 {
>>>  
>>>  			status = "disabled";
>>>  
>>> -			dwc3: dwc3@9900000 {
>>> +			dwc3: usb@9900000 {
>>
> 
>> This does not apply. What tree is it based on?
> 
> That's weird. The series has been rebased onto the mainline kernel v5.19-rc3.
> Do you have the stih407 dtsi fixed on your local repo?

It conflicts with my change:
https://lore.kernel.org/all/20220526203632.831039-1-krzysztof.kozlowski@linaro.org/

I'll apply with local fixups.


Best regards,
Krzysztof
