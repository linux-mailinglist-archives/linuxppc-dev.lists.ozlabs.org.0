Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EE2559F29
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 19:15:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LV3fT4spNz3cgK
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jun 2022 03:15:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xi9MZOPX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xi9MZOPX;
	dkim-atps=neutral
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LV3dr2yLjz3btn
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jun 2022 03:14:53 +1000 (AEST)
Received: by mail-wr1-x431.google.com with SMTP id o16so3988509wra.4
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jun 2022 10:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ktu3ikYNE7irPLarQIpMZpPOBYDmyDcsFDEun1kygEY=;
        b=xi9MZOPXRCdoh9sO8tIFIGDgvS9dqWXO3XDyam9oNMuirIIWFHfz20y14sMxxpqGIT
         SOcuoeLbfj3s7aZMasQ/REd2xJGE4+YLgO8TbMaT+gCZtd9H+0LRXQUWB16W0htXNpuf
         nyYqF+5xS1ZaUFBVys39bJUQo+t/uRywgLUcgb1hs/5GkNWejnhrGHhGW9VKrld0n2EW
         AbETSPvLqdL8vVWVydLgUG3xWQY15O1Gd04XuAI9KzhYlOfcHS/WllVm89ucIjkc/2gH
         Rq78KNq0DxCHzgnb5pD+cOJdCidEfOF4jfIbwUrMxQj2EGvD2Z5WAwARhkifoDNmf05e
         qeZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ktu3ikYNE7irPLarQIpMZpPOBYDmyDcsFDEun1kygEY=;
        b=esViJQvw/iHduLPmecHQPdQjXhLE8sQGVzHk0ajLZHwBFitA5eC5AuvDq4Hyp50J9D
         vcKas3w5f8DzDzuLQ/1i7XINiXMtCzDSMSJsS1tUxPAGGlOgcxmqcU0z4WENWUzWxfH9
         Kb7DPODxJ4ZQa0TLZxuvVdSDpZkw0ahzIFjZojb28Xy9WaDv3QTsXWqHl/0ch+abGOgZ
         VAkmETg0Sm/C3J6f/gJvkITyy9kn389jh9SFhwG2LyybS5/PEeG8naoyhfymGxIMigYW
         nvq5nCzSu+ubUQ+fDlQ2Hrt9DdiznsodcZJbbEVt5KWrv0eq4Yf3LAnOcTiC28fpeppr
         0ytQ==
X-Gm-Message-State: AJIora+dEHcwKFzIYQUVhTrK2oGH8FIsMFRo+5Cluc+O4ucHPudDye+A
	9EkTJrn/Em2sShnFcTrEzJwFJw==
X-Google-Smtp-Source: AGRyM1sLQYGZAaX+lFxtBA94oQIWAvZYbgECA77xFxvwaOZQm0PFlwQ5AY512c5CrAbgrYnDliPWmg==
X-Received: by 2002:a05:6000:184c:b0:21b:b6ac:8cb6 with SMTP id c12-20020a056000184c00b0021bb6ac8cb6mr197570wri.154.1656090886924;
        Fri, 24 Jun 2022 10:14:46 -0700 (PDT)
Received: from [192.168.0.237] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id az33-20020a05600c602100b003a03b4cb7cfsm2781255wmb.38.2022.06.24.10.14.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jun 2022 10:14:46 -0700 (PDT)
Message-ID: <1f426a67-2cf2-b67e-3cd0-a4c452591baa@linaro.org>
Date: Fri, 24 Jun 2022 19:14:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH RESEND v9 2/5] arm: dts: lpc18xx: Harmonize EHCI/OHCI DT
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
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220624141622.7149-1-Sergey.Semin@baikalelectronics.ru>
 <20220624141622.7149-3-Sergey.Semin@baikalelectronics.ru>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220624141622.7149-3-Sergey.Semin@baikalelectronics.ru>
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
> In accordance with the Generic EHCI/OHCI bindings the corresponding node
> name is suppose to comply with the Generic USB HCD DT schema, which
> requires the USB nodes to have the name acceptable by the regexp:
> "^usb(@.*)?" . Make sure the "generic-ehci" and "generic-ohci"-compatible
> nodes are correctly named.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Acked-by: Vladimir Zapolskiy <vz@mleia.com>
> Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  arch/arm/boot/dts/lpc18xx.dtsi | 4 ++--

You should split the patchset per architecture, because maybe that's why
no one picks it up?

Let me pick up ARM bits through my cleanup series. If anyone objects,
please let me know.

Best regards,
Krzysztof
