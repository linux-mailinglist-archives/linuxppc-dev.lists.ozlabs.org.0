Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8338D55B154
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jun 2022 12:49:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LW70X3hh4z3cdk
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jun 2022 20:49:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sAMMH6H1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sAMMH6H1;
	dkim-atps=neutral
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LW6zt3zl5z3bf9
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Jun 2022 20:49:12 +1000 (AEST)
Received: by mail-ed1-x52b.google.com with SMTP id o10so9323219edi.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Jun 2022 03:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=mmEZuF3sSMd4FiYZEbnqFV/YPFODuaItHC3npgDdbmY=;
        b=sAMMH6H1Igx/l0oc1TMDg0yhWD2+7xxpQaRJDVU6VU99ReByrwf8ByJmoIccKcHJSm
         142dAFEQavZd/Lmt6SXt8gOGFKGqQgRV2VE7d0t2EIm0REzEjNN3T1s6/KoJu3XjI82Q
         WMx9uHdTA3us9tlf1cJtjA2qmFZh29yPpUTMg1rKPB2a59W+6SmYCIvI6cNupMNVhk+j
         FwrhlWmqH+MvVAEdOyw5O86MjNyqIr149R6dLVMzWMq8Eee9z1WWZtNEzFQ1x22A0J9e
         NiT8yRtxZbHC2i6+utob8AGe5tnCIFEMB3gF4Fw+VADCwTtmXWXPhvNa4omYr/YSeldv
         S11A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=mmEZuF3sSMd4FiYZEbnqFV/YPFODuaItHC3npgDdbmY=;
        b=y45fxrhuvbbO9qBfLsuH3ayV4Na0Aj8/wxeOkj6jJK/HnE142iBLEDyXCliYcj1PJk
         goXmSVApu9bkI/+Z8z3ZXGT6W6zRuTOgg14IjH+ydAXVnirRAiYyf8tAG+3W2ziv0l+t
         SNMEwX/OfA/v+Kg/rQ62jf+ycwV2C0EjEoDC6fLvwqzJROClQ42Z88/5uCcdvLHr47tZ
         Wn3I85W1Gt5LmPqeGNYu76XjHmjtfa6lVLkJumqckDnvFlihMxgUm4d14GVEPQUsKvPr
         bgocdQN7bFwytwhn0kwJi+r3XQq7dWN0FDdHG4JMFal1ZIbV5XFVNA6LKs2a2aF4W4ao
         g5cQ==
X-Gm-Message-State: AJIora/E506foMPUkGEg8jqE4lZ0TM1nGlKg88tPpPbQ99pfgTTmml1c
	SkVvNl1ax96jWfq25jCwO5n8+Q==
X-Google-Smtp-Source: AGRyM1umek5iPRNqIejfVVCxmNssO5BgP+bQ+pexW3w1fg6cBla9xeht8NvKw++YLsTe34mcv9gYLw==
X-Received: by 2002:a05:6402:3886:b0:435:643a:b7ae with SMTP id fd6-20020a056402388600b00435643ab7aemr10010189edb.4.1656240548399;
        Sun, 26 Jun 2022 03:49:08 -0700 (PDT)
Received: from [192.168.0.239] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id q22-20020a170906941600b0072660d8d83fsm1643197ejx.188.2022.06.26.03.49.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jun 2022 03:49:08 -0700 (PDT)
Message-ID: <8b9c2b8e-fb65-2b65-1294-47d3b5623f66@linaro.org>
Date: Sun, 26 Jun 2022 12:49:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH RESEND v9 5/5] arm64: dts: apm: Harmonize DWC USB3 DT
 nodes name
Content-Language: en-US
To: Serge Semin <fancer.lancer@gmail.com>
References: <20220624141622.7149-1-Sergey.Semin@baikalelectronics.ru>
 <20220624141622.7149-6-Sergey.Semin@baikalelectronics.ru>
 <eb00b6c3-ae5e-9858-ab5f-fd78229ff436@linaro.org>
 <20220624205902.y2un4lr7d3zkc6jx@mobilestation>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220624205902.y2un4lr7d3zkc6jx@mobilestation>
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
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Paul Mackerras <paulus@samba.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh@kernel.org>, Khuong Dinh <khuong@os.amperecomputing.com>, Alexey Brodkin <abrodkin@synopsys.com>, Krzysztof Kozlowski <krzk@kernel.org>, Andy Gross <agross@kernel.org>, linux-snps-arc@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, Vladimir Zapolskiy <vz@mleia.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, Patrice Chotard <patrice.chotard@st.com>, linux-kernel@vger.kernel.org, Serge Semin <Sergey.Semin@baikalelectronics.ru>, Vineet Gupta <vgupta@synopsys.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 24/06/2022 22:59, Serge Semin wrote:
> On Fri, Jun 24, 2022 at 07:17:53PM +0200, Krzysztof Kozlowski wrote:
>> On 24/06/2022 16:16, Serge Semin wrote:
>>> In accordance with the DWC USB3 bindings the corresponding node
>>> name is suppose to comply with the Generic USB HCD DT schema, which
>>> requires the USB nodes to have the name acceptable by the regexp:
>>> "^usb(@.*)?" . Make sure the "snps,dwc3"-compatible nodes are correctly
>>> named despite of the warning comment about possible backward
>>> compatibility issues.
>>
> 
>> Sometimes node name is exposed to user-space which depends on it. How
>> did you check there is no issue here?
> 
> I well remember the Qcom problem caused by one of my patch:
> https://lore.kernel.org/lkml/CALAqxLX_FNvFndEDWtGbFPjSzuAbfqxQE07diBJFZtftwEJX5A@mail.gmail.com/
> 
> The next patch caused the same problem, but hasn't been reverted.
> https://lore.kernel.org/lkml/CALAqxLWGujgR7p8Vb5S_RimRVYxwm5XF-c4NkKgMH-43wEBaWg@mail.gmail.com/
> 
> As before I am more inclined to thinking that the problem was mainly caused
> by the improper node-name utilization. Anyway John later noted that the
> problem was fixed in the user-space. 

Yes, I remember. The node names are not considered ABI, therefore any
reliance on them is not correct.

I wonder however what was the reasoning for this comment in APM DTS.

> That why afterwards you were able
> to provide the commit b77a1c4d6b05 ("arm64: dts: qcom: correct DWC3
> node names and unit addresses").
> 
> Anyway I am not able to track the way the node-name is used on the
> affected platform and can't make sure that the dts would be still
> working well on that devices. But seeing nobody responded/commented on
> this patch for more than a year we can at least try to merge this in
> and see whether it causes any problem should the denoted platform is
> still in use. If it does we can revert the update back and forget
> about it.

The APM is kind of abandoned, so indeed we might never get a reply.

I'll take it.

Best regards,
Krzysztof
