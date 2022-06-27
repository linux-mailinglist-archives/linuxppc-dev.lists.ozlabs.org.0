Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC3855BC39
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 23:55:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LX1kV6gS2z3cg1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 07:55:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FEQZCSvy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com; envelope-from=fancer.lancer@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FEQZCSvy;
	dkim-atps=neutral
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LX1jv25m2z3bkP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 07:55:14 +1000 (AEST)
Received: by mail-lf1-x12c.google.com with SMTP id t25so18909181lfg.7
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jun 2022 14:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=F2rE4WiiB56ceX/DgU00bSkUe75l3cXsNOMmf38a5Zs=;
        b=FEQZCSvyunp3uzDnTXHU3J/w472GKsWStwPmmqVUW3M4BP99nff9fjklYCAHVRzl+l
         7PdPnItOj7cM3MRIkTh9SYZeCgI860HuNoo0QIqzoGF7nPyBNo87fn1boR9Pp1JAzIJ/
         q+JiDvehmhxeWN2Gd/gusxeyvN+rP1/yIu3lX0trXcrL4GgpR6enBsApW/oo3wMQY7q9
         Fwb0vnJ60iHDy91jMTXIicoxCKhW+TwmfcozTcVnc5LaahfYFH6N1f5Qk0Uzdc1nm25J
         uoTGc0lXxv1te35Psxvd38IaQ3ajm5XnaZKZJ43VPquSrUEPOgTbqT8XLbioBY3VSeSU
         a1VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=F2rE4WiiB56ceX/DgU00bSkUe75l3cXsNOMmf38a5Zs=;
        b=KRCnlHG+11hpjl0qgCkc8EqZ9IlqDbGczKmRo67AOM4uMj8SoPO1iFqZCVL8/BY/IH
         wK+bDj5l5XBcXD6dhWKlLsUSqq7Z0CMuXirVcMLy+koIpMEgcI1RyeNJvZc3cS/8GJjk
         y0AyajuWMRpq2Wb42eGg2b6X/WDI0yW+qseh3X0xsH+RNWzJw/zVIpO5/iDFcLgxU/kp
         b7HjwoLD3oPtDjc+Uq/XP3SpAedjixcOfRGgMveW0rCFzv6B9IGNIRPWiIUCy/26pxkp
         QWURk03DkSY2RwJs3nUZ/skN4iKV7zjAIYqhEiqJfPtsa0mD6+HhULkTSfmGpnG+wvqq
         +nIw==
X-Gm-Message-State: AJIora+Lq0AXTeQP5NbCWJ05taibIGEYPQ1HSzL9t8p1YGsB8ppnYZOo
	1eIxMQFe/D7v1a5mcRw2cV0=
X-Google-Smtp-Source: AGRyM1uL2KKsGpEUiiGMb12gLYw6jj+9Trew1WchHkWhPJ/Yvh3dZrjyPSRGRIj4HHPU4BOHiEr71Q==
X-Received: by 2002:a05:6512:2356:b0:47f:8756:737b with SMTP id p22-20020a056512235600b0047f8756737bmr9981225lfu.212.1656366905748;
        Mon, 27 Jun 2022 14:55:05 -0700 (PDT)
Received: from mobilestation ([95.79.140.178])
        by smtp.gmail.com with ESMTPSA id g1-20020a0565123b8100b0047f9d9a4186sm1944482lfv.165.2022.06.27.14.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 14:55:05 -0700 (PDT)
Date: Tue, 28 Jun 2022 00:55:02 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH RESEND v9 4/5] arm: dts: stih407-family: Harmonize DWC
 USB3 DT nodes name
Message-ID: <20220627215502.4caxt2ebsdi4ue7l@mobilestation>
References: <20220624141622.7149-1-Sergey.Semin@baikalelectronics.ru>
 <20220624141622.7149-5-Sergey.Semin@baikalelectronics.ru>
 <59d8a34a-a211-d00a-2243-6ad51cfa4204@linaro.org>
 <20220624204524.nveittak6ruksuvq@mobilestation>
 <8b384f4e-7114-7afb-98d6-af71709525d6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b384f4e-7114-7afb-98d6-af71709525d6@linaro.org>
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

On Sun, Jun 26, 2022 at 12:42:48PM +0200, Krzysztof Kozlowski wrote:
> On 24/06/2022 22:45, Serge Semin wrote:
> > On Fri, Jun 24, 2022 at 07:18:57PM +0200, Krzysztof Kozlowski wrote:
> >> On 24/06/2022 16:16, Serge Semin wrote:
> >>> In accordance with the DWC USB3 bindings the corresponding node
> >>> name is suppose to comply with the Generic USB HCD DT schema, which
> >>> requires the USB nodes to have the name acceptable by the regexp:
> >>> "^usb(@.*)?" . Make sure the "snps,dwc3"-compatible nodes are correctly
> >>> named.
> >>>
> >>> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> >>> Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
> >>> Reviewed-by: Patrice Chotard <patrice.chotard@st.com>
> >>> ---
> >>>  arch/arm/boot/dts/stih407-family.dtsi | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/arch/arm/boot/dts/stih407-family.dtsi b/arch/arm/boot/dts/stih407-family.dtsi
> >>> index 1713f7878117..7ba528315dbe 100644
> >>> --- a/arch/arm/boot/dts/stih407-family.dtsi
> >>> +++ b/arch/arm/boot/dts/stih407-family.dtsi
> >>> @@ -725,7 +725,7 @@ st_dwc3: dwc3@8f94000 {
> >>>  
> >>>  			status = "disabled";
> >>>  
> >>> -			dwc3: dwc3@9900000 {
> >>> +			dwc3: usb@9900000 {
> >>
> > 
> >> This does not apply. What tree is it based on?
> > 
> > That's weird. The series has been rebased onto the mainline kernel v5.19-rc3.
> > Do you have the stih407 dtsi fixed on your local repo?
> 

> It conflicts with my change:
> https://lore.kernel.org/all/20220526203632.831039-1-krzysztof.kozlowski@linaro.org/
> 
> I'll apply with local fixups.

Ok. Thanks.

-Sergey

> 
> 
> Best regards,
> Krzysztof
