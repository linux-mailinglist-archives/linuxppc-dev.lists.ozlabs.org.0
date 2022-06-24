Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D89555A302
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 22:46:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LV8KW17GKz3cgV
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jun 2022 06:46:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=oL3YFnb6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com; envelope-from=fancer.lancer@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=oL3YFnb6;
	dkim-atps=neutral
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LV8Js1B9Tz3btY
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jun 2022 06:45:32 +1000 (AEST)
Received: by mail-lj1-x229.google.com with SMTP id a39so2898954ljq.11
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jun 2022 13:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XsPmCVrvWo3jrtNwMSfS5IhEsF2y+irWuQjpTwNLwbU=;
        b=oL3YFnb6yhUXmkgjjd1lvH+Mnakr/Trrw8Jg/ll0PUnEhMbFLPfG9QsW5HS2vtk3ep
         s5MCgqPrNa6JWLDOWJHS9foJZq9VLOcRvCxl8Qjrhf4tTLhCB/NJ8HW/lVZHDs9/0Yev
         +lnsLbW481s52JVKA+OvkBMb20EARlVz9isBn4lOaVq9+5Rv/h2YGA62mJR1JmcSwUpW
         tbaD/YUz6crNdntJ7OPx4Ixl2Aba0wDUAiErgNloMpKUJqo4sKw8FhZLVTcP6R/zjyaZ
         R2KA51+tf9x+QNpU94JhsHUzJwX+LA1Tygwxy9BXJ8W17QjAbR2Icwrm1BG1Ths3Qb3b
         3xTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XsPmCVrvWo3jrtNwMSfS5IhEsF2y+irWuQjpTwNLwbU=;
        b=I9cH9sskDsKoniF7Y0XQNAoNWpIehRZqCf5iFrEczpk5vz5hHLxx/Og0eCtnqbtcJU
         mWSJAQaqQsHFr82EO6nFpG9UsoRxMRGs1Xtu+YpducHX3pQSbSRM1VuGCbjgfMHkUQl0
         sHYp0X6vu+9tDlvLpx3/b4jaGSqdo//hw7LBxhSxbgn0UY7+L/osLyVKsMTdAnLgLekg
         ha30BQvg+mQHDZ4Wga2KySoYF9/2fK2348xMSlH0c5iDFdWDGbeIWV49rBYmq6zMMcBc
         OlgvBHiDZabaObe1v/9j+xWfEfywG2166ADgpX4jjFko7eEaHdw38qj4g5orc2CYwPbH
         +oOg==
X-Gm-Message-State: AJIora+1fAt86RHa78Lq07wZyUaWJwr8LMUjuH+FV8VnerkMVUVviuNf
	KOikecCWAn1NDPGo7fhNf9w=
X-Google-Smtp-Source: AGRyM1tHN9ziSmwLX3zRGPZmMV7l77sL9fX++ZZooIG5PTJnyB1ooTxjOOXRrC7+xhc190A83B6bxA==
X-Received: by 2002:a05:651c:1994:b0:255:aaa3:d02 with SMTP id bx20-20020a05651c199400b00255aaa30d02mr383340ljb.410.1656103528580;
        Fri, 24 Jun 2022 13:45:28 -0700 (PDT)
Received: from mobilestation ([95.79.189.214])
        by smtp.gmail.com with ESMTPSA id s8-20020a056512202800b0047f750ecd8csm519950lfs.67.2022.06.24.13.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 13:45:27 -0700 (PDT)
Date: Fri, 24 Jun 2022 23:45:24 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH RESEND v9 4/5] arm: dts: stih407-family: Harmonize DWC
 USB3 DT nodes name
Message-ID: <20220624204524.nveittak6ruksuvq@mobilestation>
References: <20220624141622.7149-1-Sergey.Semin@baikalelectronics.ru>
 <20220624141622.7149-5-Sergey.Semin@baikalelectronics.ru>
 <59d8a34a-a211-d00a-2243-6ad51cfa4204@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <59d8a34a-a211-d00a-2243-6ad51cfa4204@linaro.org>
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

On Fri, Jun 24, 2022 at 07:18:57PM +0200, Krzysztof Kozlowski wrote:
> On 24/06/2022 16:16, Serge Semin wrote:
> > In accordance with the DWC USB3 bindings the corresponding node
> > name is suppose to comply with the Generic USB HCD DT schema, which
> > requires the USB nodes to have the name acceptable by the regexp:
> > "^usb(@.*)?" . Make sure the "snps,dwc3"-compatible nodes are correctly
> > named.
> > 
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
> > Reviewed-by: Patrice Chotard <patrice.chotard@st.com>
> > ---
> >  arch/arm/boot/dts/stih407-family.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm/boot/dts/stih407-family.dtsi b/arch/arm/boot/dts/stih407-family.dtsi
> > index 1713f7878117..7ba528315dbe 100644
> > --- a/arch/arm/boot/dts/stih407-family.dtsi
> > +++ b/arch/arm/boot/dts/stih407-family.dtsi
> > @@ -725,7 +725,7 @@ st_dwc3: dwc3@8f94000 {
> >  
> >  			status = "disabled";
> >  
> > -			dwc3: dwc3@9900000 {
> > +			dwc3: usb@9900000 {
> 

> This does not apply. What tree is it based on?

That's weird. The series has been rebased onto the mainline kernel v5.19-rc3.
Do you have the stih407 dtsi fixed on your local repo?

-Sergey

> 
> 
> Best regards,
> Krzysztof
