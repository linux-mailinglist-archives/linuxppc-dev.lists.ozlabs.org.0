Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9AB559F31
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 19:18:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LV3jy5sYRz3cdl
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jun 2022 03:18:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=riSm0FlJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=riSm0FlJ;
	dkim-atps=neutral
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LV3jM6xHVz2yLX
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jun 2022 03:17:59 +1000 (AEST)
Received: by mail-ed1-x52a.google.com with SMTP id e2so4412668edv.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jun 2022 10:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=QO2xbsZ3DwvoKI/D5PILJK1SdhtLthoBmyVWXf1LehI=;
        b=riSm0FlJgfp0dBXID4v2NQTo8SOXgPflsvQMGoR86iK28ba4yxmwUwoptM5dWWwqiK
         l92EzP4jSf90Vr6x5ir0jYK5+FZ4heKpnbMunI96UycBMM/+hJ215k0q1ix6PoOI2thy
         lF0Wa4WLjnysW1sJOztWQ+P7JfqPzrCtfa7vIQVND31KXECN2mFIKtRLXEmjAht+RmTi
         YCgR9I+Q1NnYWY0f23VoAhWfs5dezqTksdH8IFWUG4gdSQjTNv8d9dn1JHcvhEhfCxI3
         aXbV6F/rzDH7S+weQyW9AQPMaB8I7rhhDZ6oT43UElcY5k5ZXd95jkJ9AVsarenT5E4O
         bzKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=QO2xbsZ3DwvoKI/D5PILJK1SdhtLthoBmyVWXf1LehI=;
        b=jFWTCdIguiGePI7ggDMkfodT1itKBD1KBfzrnNK+0Zvu91KveulumJoCOIzlC+kUgU
         QkMGnIkwsToD1tvOTotKcjAcDsuPUxtzRuRtIeVUIVdpnFi8xhggoLDo1WNNfFpqyqJr
         CeQomGPIazfjrmNh7LSGXNR2oje8+P8rzaz/qG9AcA/UZ4nDU21lRo/HZuH68LoeBUF2
         yrCCBXOWWR/tqGsrrUiV51Pns45309I+fr6ndMnQM50KTb0BPo89385afUR/6VxgCQBw
         sl29xctZcg424IqA+4PxxOWgtpWy6RO5KT5dR/YrHgMahH3FU6nqpyNHbZSK4Yj8SCDE
         0T+Q==
X-Gm-Message-State: AJIora87oCAnvCLi5GEXzrTBTZVu7nkaJa77AGfEsoUWnmsJ4oJYsCmF
	62xg53S/ejR3/Nk0utHWVYlVzQ==
X-Google-Smtp-Source: AGRyM1vVErSqX7pCRC/e1QSjDBJkieHwm2TXbOHt/piwTVUPc3SDtWWTG3XRwFKOkHtmw9wUqQ2Gfw==
X-Received: by 2002:aa7:c45a:0:b0:435:d7a4:99bc with SMTP id n26-20020aa7c45a000000b00435d7a499bcmr168035edr.158.1656091075738;
        Fri, 24 Jun 2022 10:17:55 -0700 (PDT)
Received: from [192.168.0.237] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id z4-20020a1709060f0400b00722f069fd40sm1411264eji.159.2022.06.24.10.17.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jun 2022 10:17:55 -0700 (PDT)
Message-ID: <eb00b6c3-ae5e-9858-ab5f-fd78229ff436@linaro.org>
Date: Fri, 24 Jun 2022 19:17:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH RESEND v9 5/5] arm64: dts: apm: Harmonize DWC USB3 DT
 nodes name
Content-Language: en-US
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Felipe Balbi <balbi@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Vladimir Zapolskiy <vz@mleia.com>,
 Alexey Brodkin <abrodkin@synopsys.com>, Vineet Gupta <vgupta@synopsys.com>,
 Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-usb@vger.kernel.org,
 Khuong Dinh <khuong@os.amperecomputing.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220624141622.7149-1-Sergey.Semin@baikalelectronics.ru>
 <20220624141622.7149-6-Sergey.Semin@baikalelectronics.ru>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220624141622.7149-6-Sergey.Semin@baikalelectronics.ru>
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
Cc: devicetree@vger.kernel.org, Patrice Chotard <patrice.chotard@st.com>, Serge Semin <fancer.lancer@gmail.com>, linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>, linux-arm-msm@vger.kernel.org, linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 24/06/2022 16:16, Serge Semin wrote:
> In accordance with the DWC USB3 bindings the corresponding node
> name is suppose to comply with the Generic USB HCD DT schema, which
> requires the USB nodes to have the name acceptable by the regexp:
> "^usb(@.*)?" . Make sure the "snps,dwc3"-compatible nodes are correctly
> named despite of the warning comment about possible backward
> compatibility issues.

Sometimes node name is exposed to user-space which depends on it. How
did you check there is no issue here?

> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  arch/arm64/boot/dts/apm/apm-shadowcat.dtsi | 4 ++--
>  arch/arm64/boot/dts/apm/apm-storm.dtsi     | 6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi b/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
> index a83c82c50e29..832dd85b00bd 100644
> --- a/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
> +++ b/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
> @@ -597,8 +597,8 @@ serial0: serial@10600000 {
>  			interrupts = <0x0 0x4c 0x4>;
>  		};
>  
> -		/* Do not change dwusb name, coded for backward compatibility */
> -		usb0: dwusb@19000000 {
> +		/* Node-name might need to be coded as dwusb for backward compatibility */
> +		usb0: usb@19000000 {
>  			status = "disabled";
>  			compatible = "snps,dwc3";
>  			reg =  <0x0 0x19000000 0x0 0x100000>;
> diff --git a/arch/arm64/boot/dts/apm/apm-storm.dtsi b/arch/arm64/boot/dts/apm/apm-storm.dtsi
> index 0f37e77f5459..1520a945b7f9 100644
> --- a/arch/arm64/boot/dts/apm/apm-storm.dtsi
> +++ b/arch/arm64/boot/dts/apm/apm-storm.dtsi
> @@ -923,8 +923,8 @@ sata3: sata@1a800000 {
>  			phy-names = "sata-phy";
>  		};
>  
> -		/* Do not change dwusb name, coded for backward compatibility */
> -		usb0: dwusb@19000000 {
> +		/* Node-name might need to be coded as dwusb for backward compatibility */
> +		usb0: usb@19000000 {
>  			status = "disabled";
>  			compatible = "snps,dwc3";
>  			reg =  <0x0 0x19000000 0x0 0x100000>;
> @@ -933,7 +933,7 @@ usb0: dwusb@19000000 {
>  			dr_mode = "host";
>  		};
>  
> -		usb1: dwusb@19800000 {
> +		usb1: usb@19800000 {
>  			status = "disabled";
>  			compatible = "snps,dwc3";
>  			reg =  <0x0 0x19800000 0x0 0x100000>;


Best regards,
Krzysztof
