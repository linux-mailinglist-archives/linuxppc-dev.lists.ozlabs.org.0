Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE12F55A323
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 22:59:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LV8dG5dBkz3dQP
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jun 2022 06:59:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=QtMwHvmY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com; envelope-from=fancer.lancer@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=QtMwHvmY;
	dkim-atps=neutral
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LV8cb4mphz3c7h
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jun 2022 06:59:09 +1000 (AEST)
Received: by mail-lj1-x233.google.com with SMTP id n15so4072879ljg.8
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jun 2022 13:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eZSZCpbsimxpe8y0nI2vhGyb3S9o4fusHBXGkJK5Cfc=;
        b=QtMwHvmYMWJKh0ZLqnKgANF/OLV82B74Mco6zvnuZeUejNoYhy3/XMUTG/IZxeWN1g
         kJdFX7Hjjll5/gBbGDFfE6NZ8Z29REr8unbv/+Rw3EywhBgZrzUKHOFbsy+9hm74n6W9
         FgxFz9+BxFFugBZ7wGl/0JzWCFktsdwHV3yRMFgHnNXL54N/hJPqiRFrtpAHgfAV26va
         xmrjOfYjXA5cjt979wG15bgUAfQ9zTnFdadgyXYvvGP+unwebPCQDrxzW6mC4gLjZm8L
         VBd3ejedJJ834pxFVJIh0zkDdBaoMunu6IPVDte8eqiNoRGsva/W17BJryh5PbVTYkVi
         zfXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eZSZCpbsimxpe8y0nI2vhGyb3S9o4fusHBXGkJK5Cfc=;
        b=SIf3gI/zYVIINnr5swTqkQxc5yX1sBXPsGG4Z0Edrr2cCrw7xegppkXa1dxE3dVsPg
         GUpKqGlXlJtsYdOKxzZJr0ZobzufcKy/ge2Uy2sBSsQEZirXO/nzIyFlNGvMn67vJElP
         x6M5Dxb8X75kYnB+Cfm1i/9H/Y3XxexamDBsJeh9TcLEp3fXZ1wqse4EgRUcXS10YGtG
         tTRQEXpLFtBaoAaeEtn3nMHrK/Ijtx1W/w5G/WVZGC2LbkabvxjaeDhGIeX/1bLkwBJr
         xh9+4v3fZY+0iGy5qRJlHYfNQRvpVxpsHXaaagb/kPllORkv7IvOQ2tPyiHLi7FtZfMz
         jTfw==
X-Gm-Message-State: AJIora/gNKCb+Yd11g9zAXseNmIH45eaY6RKoooQc74qrJpyjBkN6HXt
	bfaID9RqSE/YZ5jYHAqU/eo=
X-Google-Smtp-Source: AGRyM1v6fuennno+VmySkb2y5X/FFQLPUJh7sXw3iLNDmiKty2pRq4AJTIzsRg4onyEuYZ8fkJyBPA==
X-Received: by 2002:a05:651c:1617:b0:25a:9e88:af82 with SMTP id f23-20020a05651c161700b0025a9e88af82mr401410ljq.106.1656104345088;
        Fri, 24 Jun 2022 13:59:05 -0700 (PDT)
Received: from mobilestation ([95.79.189.214])
        by smtp.gmail.com with ESMTPSA id 13-20020ac2568d000000b0047fa40b5052sm523338lfr.62.2022.06.24.13.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 13:59:04 -0700 (PDT)
Date: Fri, 24 Jun 2022 23:59:02 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH RESEND v9 5/5] arm64: dts: apm: Harmonize DWC USB3 DT
 nodes name
Message-ID: <20220624205902.y2un4lr7d3zkc6jx@mobilestation>
References: <20220624141622.7149-1-Sergey.Semin@baikalelectronics.ru>
 <20220624141622.7149-6-Sergey.Semin@baikalelectronics.ru>
 <eb00b6c3-ae5e-9858-ab5f-fd78229ff436@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb00b6c3-ae5e-9858-ab5f-fd78229ff436@linaro.org>
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

On Fri, Jun 24, 2022 at 07:17:53PM +0200, Krzysztof Kozlowski wrote:
> On 24/06/2022 16:16, Serge Semin wrote:
> > In accordance with the DWC USB3 bindings the corresponding node
> > name is suppose to comply with the Generic USB HCD DT schema, which
> > requires the USB nodes to have the name acceptable by the regexp:
> > "^usb(@.*)?" . Make sure the "snps,dwc3"-compatible nodes are correctly
> > named despite of the warning comment about possible backward
> > compatibility issues.
> 

> Sometimes node name is exposed to user-space which depends on it. How
> did you check there is no issue here?

I well remember the Qcom problem caused by one of my patch:
https://lore.kernel.org/lkml/CALAqxLX_FNvFndEDWtGbFPjSzuAbfqxQE07diBJFZtftwEJX5A@mail.gmail.com/

The next patch caused the same problem, but hasn't been reverted.
https://lore.kernel.org/lkml/CALAqxLWGujgR7p8Vb5S_RimRVYxwm5XF-c4NkKgMH-43wEBaWg@mail.gmail.com/

As before I am more inclined to thinking that the problem was mainly caused
by the improper node-name utilization. Anyway John later noted that the
problem was fixed in the user-space. That why afterwards you were able
to provide the commit b77a1c4d6b05 ("arm64: dts: qcom: correct DWC3
node names and unit addresses").

Anyway I am not able to track the way the node-name is used on the
affected platform and can't make sure that the dts would be still
working well on that devices. But seeing nobody responded/commented on
this patch for more than a year we can at least try to merge this in
and see whether it causes any problem should the denoted platform is
still in use. If it does we can revert the update back and forget
about it.

-Sergey

> 
> > 
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
> > ---
> >  arch/arm64/boot/dts/apm/apm-shadowcat.dtsi | 4 ++--
> >  arch/arm64/boot/dts/apm/apm-storm.dtsi     | 6 +++---
> >  2 files changed, 5 insertions(+), 5 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi b/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
> > index a83c82c50e29..832dd85b00bd 100644
> > --- a/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
> > +++ b/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
> > @@ -597,8 +597,8 @@ serial0: serial@10600000 {
> >  			interrupts = <0x0 0x4c 0x4>;
> >  		};
> >  
> > -		/* Do not change dwusb name, coded for backward compatibility */
> > -		usb0: dwusb@19000000 {
> > +		/* Node-name might need to be coded as dwusb for backward compatibility */
> > +		usb0: usb@19000000 {
> >  			status = "disabled";
> >  			compatible = "snps,dwc3";
> >  			reg =  <0x0 0x19000000 0x0 0x100000>;
> > diff --git a/arch/arm64/boot/dts/apm/apm-storm.dtsi b/arch/arm64/boot/dts/apm/apm-storm.dtsi
> > index 0f37e77f5459..1520a945b7f9 100644
> > --- a/arch/arm64/boot/dts/apm/apm-storm.dtsi
> > +++ b/arch/arm64/boot/dts/apm/apm-storm.dtsi
> > @@ -923,8 +923,8 @@ sata3: sata@1a800000 {
> >  			phy-names = "sata-phy";
> >  		};
> >  
> > -		/* Do not change dwusb name, coded for backward compatibility */
> > -		usb0: dwusb@19000000 {
> > +		/* Node-name might need to be coded as dwusb for backward compatibility */
> > +		usb0: usb@19000000 {
> >  			status = "disabled";
> >  			compatible = "snps,dwc3";
> >  			reg =  <0x0 0x19000000 0x0 0x100000>;
> > @@ -933,7 +933,7 @@ usb0: dwusb@19000000 {
> >  			dr_mode = "host";
> >  		};
> >  
> > -		usb1: dwusb@19800000 {
> > +		usb1: usb@19800000 {
> >  			status = "disabled";
> >  			compatible = "snps,dwc3";
> >  			reg =  <0x0 0x19800000 0x0 0x100000>;
> 
> 
> Best regards,
> Krzysztof
