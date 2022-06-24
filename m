Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B418559F32
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 19:19:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LV3lD1LHBz3cj6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jun 2022 03:19:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wK1ybY4C;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wK1ybY4C;
	dkim-atps=neutral
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LV3kb10g3z2yLX
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jun 2022 03:19:03 +1000 (AEST)
Received: by mail-ed1-x530.google.com with SMTP id fd6so4395991edb.5
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jun 2022 10:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=1mS7MeLhqDF7A//E5jhahypB/uovVI38NPPCc6RFQiA=;
        b=wK1ybY4CMPD/YhNJv23Qg1YqoIQNUGv2qDLbhKLlEQ5sqGRcXIZl4ppBi5VxBgUEZP
         Q5E31vOb3OBa5sHriAEnzm8iG/QPcJZ6C4WNwsRfovG9jffNupHbCS320644Ira5RO5+
         e0nkL2q9J7UDXrq+Z9XEtGorNlDdpAtEgcKrvPRgG+Dfc1/ss0mkrDvgndsYowaOvZi7
         H0f71PiR3zR6BVxvifMWTAjd/ucp6t8aaZsi2Zn2jth4JGkKV/weLgkEIDmqdP3FIXQ0
         SH2e30+e009E3e8qOZq8XwLFbRhQBIr9UqCXxjjGaBJleMnleMlL51oDiM1gUUdlilcI
         rQcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=1mS7MeLhqDF7A//E5jhahypB/uovVI38NPPCc6RFQiA=;
        b=Cac9ByCsxLL2jsYCptnjLtIONMk6q1SQCalb/aN3JRV2Y2dtCcUMVh4BlMfTOtAdz4
         qA71eNoyzOkbGWneKzJK89c+m0Zcs3h4Hcz4NbNO3DEFEsiffnkwlXc5HTcVBDcnVj1i
         J8CrwsSSldxWAzl4rmZ4wzStPwGmt98CT3XLhkkqRq9Dp0MxrKnStd958bd95QhONPqB
         BVjC5QyD6gfnGbDOn63Va8S38i1u4irFibr5zGUKY6PMy6MSAIymAJO8CwVATSG/Y+KQ
         jUU0KkWp0LNaj3fZaDSNCSngbHt+RXTkvXKCIOv8aRI4zXwsjBRi+16wHu6s230H0fTG
         EJTQ==
X-Gm-Message-State: AJIora8ZbUEvmB8QSnuYaonQ0bEuWfs225OjT1TEwoGxxbgK7hpPXhCY
	I9JbILs8Eu8f5JbV4u4oAA3euw==
X-Google-Smtp-Source: AGRyM1tGTpZKHip8vrhphzvWpCMKPL/90cL8453ozIuX6HfyfUoBcF1h+aKQ1UNEk0xmQKnKS7KfJQ==
X-Received: by 2002:a05:6402:104a:b0:435:c7cd:11dc with SMTP id e10-20020a056402104a00b00435c7cd11dcmr105928edu.335.1656091140072;
        Fri, 24 Jun 2022 10:19:00 -0700 (PDT)
Received: from [192.168.0.237] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id r13-20020a170906a20d00b006fec9cf9237sm1419402ejy.130.2022.06.24.10.18.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jun 2022 10:18:59 -0700 (PDT)
Message-ID: <59d8a34a-a211-d00a-2243-6ad51cfa4204@linaro.org>
Date: Fri, 24 Jun 2022 19:18:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH RESEND v9 4/5] arm: dts: stih407-family: Harmonize DWC
 USB3 DT nodes name
Content-Language: en-US
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Felipe Balbi <balbi@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Vladimir Zapolskiy <vz@mleia.com>,
 Alexey Brodkin <abrodkin@synopsys.com>, Vineet Gupta <vgupta@synopsys.com>,
 Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-usb@vger.kernel.org,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220624141622.7149-1-Sergey.Semin@baikalelectronics.ru>
 <20220624141622.7149-5-Sergey.Semin@baikalelectronics.ru>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220624141622.7149-5-Sergey.Semin@baikalelectronics.ru>
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
Cc: devicetree@vger.kernel.org, Khuong Dinh <khuong@os.amperecomputing.com>, Patrice Chotard <patrice.chotard@st.com>, Serge Semin <fancer.lancer@gmail.com>, linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>, linux-arm-msm@vger.kernel.org, linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 24/06/2022 16:16, Serge Semin wrote:
> In accordance with the DWC USB3 bindings the corresponding node
> name is suppose to comply with the Generic USB HCD DT schema, which
> requires the USB nodes to have the name acceptable by the regexp:
> "^usb(@.*)?" . Make sure the "snps,dwc3"-compatible nodes are correctly
> named.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
> Reviewed-by: Patrice Chotard <patrice.chotard@st.com>
> ---
>  arch/arm/boot/dts/stih407-family.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/stih407-family.dtsi b/arch/arm/boot/dts/stih407-family.dtsi
> index 1713f7878117..7ba528315dbe 100644
> --- a/arch/arm/boot/dts/stih407-family.dtsi
> +++ b/arch/arm/boot/dts/stih407-family.dtsi
> @@ -725,7 +725,7 @@ st_dwc3: dwc3@8f94000 {
>  
>  			status = "disabled";
>  
> -			dwc3: dwc3@9900000 {
> +			dwc3: usb@9900000 {

This does not apply. What tree is it based on?


Best regards,
Krzysztof
