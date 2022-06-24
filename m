Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E09F55A2E4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 22:42:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LV8FF2y8Mz3cj7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jun 2022 06:42:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=J+tGRTrS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com; envelope-from=fancer.lancer@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=J+tGRTrS;
	dkim-atps=neutral
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LV8Df2CTcz3btY
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jun 2022 06:41:53 +1000 (AEST)
Received: by mail-lf1-x12d.google.com with SMTP id f39so6451781lfv.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jun 2022 13:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/jG5W+ePlStAo427FPsgRmaP+U/0rD3zZzMdqRYYbmg=;
        b=J+tGRTrSFTb1R8Vpr8cSIVIm/o2Vqxs+I2fXmSTA2UCTtbWmE8Fg0sRokRImAhBYJw
         xq7CLvEwVzlTrLtsqp1g006ujV5OnJj6pfhLyOXJVcvgkrAaVPto4YFjTBaYYLnZklOc
         RvhVBLvpez2CY1JRQ9ku0JYimoPj+tDA9JkYdy9BkhyGCoZWIqk092HsH7cBc3aIziGu
         TkTChrOWEoXvt6JpnGete/IfDHoeui49vS+4xpjhT6JRSieX1d7duusa0LwdX9qk+Bnw
         AX5WP9DSydJ1DC6VDm1jnKdb1rbFKACQ2BUrbWYCFK32Rs0jp3v3FvMwz9aYq+5feFhg
         HGQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/jG5W+ePlStAo427FPsgRmaP+U/0rD3zZzMdqRYYbmg=;
        b=o+a042BjLHtlPk+RluhdU5lBLMmithWCdxqykwMtyomMYusS6+bDCE33ZaS1v4772Q
         nqztRddAPr/1D35IXhaHruA+8r/xIOXuChmajsfwrCbopv89MhwPatndl9hTDnCpQXXn
         c43PUH3kzsWFVBAa6ILhFqLasZopWk90tm0flq2N0pqRpCwev4skYpBDDHCNdsU0EfjU
         N3+dKg88fTocSojj03PklLktinjwJgnI5LYafsHB7GBu0lWz1SfuNVgcpckYsryoY3jr
         pB4AKLhWqeX8JnhW/nCVAX4qKgqKbKCGN8lLLpqnybo9iYYE/qfnP9LCxsrfCwLjA6ri
         XwPA==
X-Gm-Message-State: AJIora8I6bDEdzKZ0PwhReQmxWCC7rtwdTjXVtpFWTxiHuzAtn9k5zsT
	3vA0QR0USbw0/2lpez48TxQ=
X-Google-Smtp-Source: AGRyM1uctHDCNUKjjxfR1aVDBN/pntJ2Pv6ctSxnvIPYmNdb7JIuhWvHsn1bfb+oEyhecmXfDr12sw==
X-Received: by 2002:ac2:5616:0:b0:47f:8d53:f602 with SMTP id v22-20020ac25616000000b0047f8d53f602mr419029lfd.169.1656103302868;
        Fri, 24 Jun 2022 13:41:42 -0700 (PDT)
Received: from mobilestation ([95.79.189.214])
        by smtp.gmail.com with ESMTPSA id s9-20020a056512314900b0047f88d15ec0sm506070lfi.251.2022.06.24.13.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 13:41:42 -0700 (PDT)
Date: Fri, 24 Jun 2022 23:41:39 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH RESEND v9 2/5] arm: dts: lpc18xx: Harmonize EHCI/OHCI DT
 nodes name
Message-ID: <20220624204139.ndyi437ye7c2gl45@mobilestation>
References: <20220624141622.7149-1-Sergey.Semin@baikalelectronics.ru>
 <20220624141622.7149-3-Sergey.Semin@baikalelectronics.ru>
 <1f426a67-2cf2-b67e-3cd0-a4c452591baa@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1f426a67-2cf2-b67e-3cd0-a4c452591baa@linaro.org>
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

On Fri, Jun 24, 2022 at 07:14:44PM +0200, Krzysztof Kozlowski wrote:
> On 24/06/2022 16:16, Serge Semin wrote:
> > In accordance with the Generic EHCI/OHCI bindings the corresponding node
> > name is suppose to comply with the Generic USB HCD DT schema, which
> > requires the USB nodes to have the name acceptable by the regexp:
> > "^usb(@.*)?" . Make sure the "generic-ehci" and "generic-ohci"-compatible
> > nodes are correctly named.
> > 
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > Acked-by: Vladimir Zapolskiy <vz@mleia.com>
> > Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
> > ---
> >  arch/arm/boot/dts/lpc18xx.dtsi | 4 ++--
> 

> You should split the patchset per architecture, because maybe that's why
> no one picks it up?

Each patch is sent out to the corresponding mailing list and the
maintainers. I don't think splitting the patchset into the subsets will
be more efficient especially seeing the initial patchset consisted of
30 patches of which only five left.

I was very busy last year with another activities so what was left of this
patchset was stalling on my local repo all that time. I have been very
surprised to realise that the submitted part still hasn't been merged in for
all that time. So I've got back to resubmitting the series.

* Though the Qualcom dts have been fixed by you lately.

> 
> Let me pick up ARM bits through my cleanup series. If anyone objects,
> please let me know.

Ok. Thanks.

-Sergey

> 
> Best regards,
> Krzysztof
