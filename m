Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2677C293FC7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Oct 2020 17:42:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CFyZ16lBGzDqk5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Oct 2020 02:42:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.68; helo=mail-ot1-f68.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CFyWw4bLdzDqPb
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Oct 2020 02:40:57 +1100 (AEDT)
Received: by mail-ot1-f68.google.com with SMTP id m22so2125716ots.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Oct 2020 08:40:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bPJ41BbXrVBpKagW0AFLuDG820FKrJowO4JL4r2A7Mg=;
 b=k2KbPpGJiaXNJw+p7Ke1NJ24TveHkFQSQhTmBcIQamSnGFDHoyCFzTTlslu4D1w7N3
 kO8SicCPx7zxuxFTZlOe3FYLpIkoOw1fvG3cpMYCIy4jACT5Sg6IuhWq/HhOMVMQ7K12
 RTbw+MNPyCytPglFZLy41r7cb4vlO0hzbQol0U8BB0u+Yr8fjwf0RV9LipEB46GfKBKs
 OSSKsusGR0s++skniXGGpzt8s+WClTFsupZcSZhchaWbaDf4hb1hlW3Sv+dGcZZhvxoS
 Xkr22eIAnKUtfq0aKig0A4qk5ep3f74wpE7YgQhBVgFfRPy2lMo20acGqNVq1NLKwmpb
 WG/g==
X-Gm-Message-State: AOAM530FU1/XYp7hHDM1ppS2PjG6RBm1enrBQT4iK+DGNmlqNVHkFvL6
 8L9e/4WrF4jicXqFqHGHbQ==
X-Google-Smtp-Source: ABdhPJxaxCIP6Kd2pnNLtDOo2/dAgOtLCptI3qgvO+i9WOyGybYr0U/8yYzB9sCXkm1PHVRrZpc3zw==
X-Received: by 2002:a9d:6:: with SMTP id 6mr1983535ota.235.1603208454213;
 Tue, 20 Oct 2020 08:40:54 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id i14sm515801ota.59.2020.10.20.08.40.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 08:40:53 -0700 (PDT)
Received: (nullmailer pid 889399 invoked by uid 1000);
 Tue, 20 Oct 2020 15:40:52 -0000
Date: Tue, 20 Oct 2020 10:40:52 -0500
From: Rob Herring <robh@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH v3 09/16] dt-bindings: usb: Convert DWC USB3 bindings to
 DT schema
Message-ID: <20201020154052.GA889228@bogus>
References: <20201020112101.19077-1-Sergey.Semin@baikalelectronics.ru>
 <20201020112101.19077-10-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201020112101.19077-10-Sergey.Semin@baikalelectronics.ru>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-mips@vger.kernel.org,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Kevin Hilman <khilman@baylibre.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Andy Gross <agross@kernel.org>, linux-snps-arc@lists.infradead.org,
 devicetree@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Roger Quadros <rogerq@ti.com>,
 Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, Manu Gautam <mgautam@codeaurora.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 20 Oct 2020 14:20:54 +0300, Serge Semin wrote:
> DWC USB3 DT node is supposed to be compliant with the Generic xHCI
> Controller schema, but with additional vendor-specific properties, the
> controller-specific reference clocks and PHYs. So let's convert the
> currently available legacy text-based DWC USB3 bindings to the DT schema
> and make sure the DWC USB3 nodes are also validated against the
> usb-xhci.yaml schema.
> 
> Note we have to discard the nodename restriction of being prefixed with
> "dwc3@" string, since in accordance with the usb-hcd.yaml schema USB nodes
> are supposed to be named as "^usb(@.*)".
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> ---
> 
> Changelog v2:
> - Discard '|' from the descriptions, since we don't need to preserve
>   the text formatting in any of them.
> - Drop quotes from around the string constants.
> - Fix the "clock-names" prop description to be referring the enumerated
>   clock-names instead of the ones from the Databook.
> 
> Changelog v3:
> - Apply usb-xhci.yaml# schema only if the controller is supposed to work
>   as either host or otg.
> ---
>  .../devicetree/bindings/usb/dwc3.txt          | 125 --------
>  .../devicetree/bindings/usb/snps,dwc3.yaml    | 302 ++++++++++++++++++
>  2 files changed, 302 insertions(+), 125 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/dwc3.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
