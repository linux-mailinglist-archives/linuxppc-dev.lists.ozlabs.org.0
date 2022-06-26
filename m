Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9043D55B145
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jun 2022 12:46:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LW6xB2Wnjz3cg6
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jun 2022 20:46:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=or3a9faE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=or3a9faE;
	dkim-atps=neutral
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LW6wY2vZqz3bf9
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Jun 2022 20:46:21 +1000 (AEST)
Received: by mail-ed1-x52c.google.com with SMTP id e40so9315683eda.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Jun 2022 03:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=IR5ASCo6Y/Rs1/PH2JcO8TDLcE91NrIowM+FbUwhGRc=;
        b=or3a9faEfHAGd6P1JG+ETIMPC9qnTPWQ1U3JQvxvvcbaP0M4zp0oVG+fSiQQqsXq2g
         +iCKH752/3VDi2b8QYCFJdXRg9c34dOAtlmH7c58wrHVVudODXsWxLb+QOx/gHT08qD6
         msEBnvQHHd20+Yh8uUgZiBfnjp88MK+nn/6kf0MvrU41FX3tu+3TePh3bhjkYbxcZCij
         Yf1dNp63XzTly3S4JAHnNoSdUXr8/VLy1LXd0bLC/F7Tft3AMMoDUuGpmBCi4ST3itVZ
         QFCWI1XipWQhkBhhDKBVtOxMQ4acvaTQvVoAajg98C7CtvMe2OezfG/26oFvlYXzBv0B
         MidQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=IR5ASCo6Y/Rs1/PH2JcO8TDLcE91NrIowM+FbUwhGRc=;
        b=17FM3YXjg1r/PW8fZXHNkRQbSwITKsD2Sq1D4muvSjVk2Rs1hgwMG+u46ES05xAyqI
         mdfOJdbEVqokUaPTQXlPcCijhS+HtvrY1SRtDF8Y5+kbwiisE//k3+PahWy8VBCXw1HN
         vpZ+muTrFKVDGSaLODPCInZoIk4BS3ekF6SVW4x6+iOav0VIh/uo/7uZ2uNmrDSZwhBF
         WD/bk4vvNHTOseZG+YS5lCRQKR0PIzsFsqz65nI4I1Rpd01O29GoQ8N9HKUiG1XA5nse
         GzUqNX8sbJrb7xfAM8BsiPoFmSbWQxIip2H0w5+Ybjhtp/iGkjdWExDNyVHZDBUmOJD8
         UqtA==
X-Gm-Message-State: AJIora+Kit4P4JgvLoQqyxQSFh3AOTsIBvKwQLJ80LZzOXTu79mlzByd
	ELXqRWlKDkaW9dxTBFNvO6kCwA==
X-Google-Smtp-Source: AGRyM1v9t9D/Wd5uU9xYXVJRI1WbAqZUpUFiKyMzRg8VSkIRrTAJcHRXDC6RuuCxKlZQHNNFkzUySw==
X-Received: by 2002:a05:6402:4306:b0:435:a1c9:4272 with SMTP id m6-20020a056402430600b00435a1c94272mr10184877edc.205.1656240377073;
        Sun, 26 Jun 2022 03:46:17 -0700 (PDT)
Received: from [192.168.0.239] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id g18-20020a170906595200b006f3ef214e20sm3576655ejr.134.2022.06.26.03.46.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jun 2022 03:46:16 -0700 (PDT)
Message-ID: <ed35498e-7509-f701-84f5-3b3550021ac8@linaro.org>
Date: Sun, 26 Jun 2022 12:46:15 +0200
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

Thanks, applied.

Best regards,
Krzysztof
