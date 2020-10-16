Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CE1290BEF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Oct 2020 20:56:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CCb2s6ssZzDqN0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Oct 2020 05:56:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.195;
 helo=mail-oi1-f195.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CCZv90ggkzDqSv
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Oct 2020 05:49:24 +1100 (AEDT)
Received: by mail-oi1-f195.google.com with SMTP id w204so3570736oiw.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Oct 2020 11:49:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3MxugCiE5y0heSpZifDkccjElq8hTuw4iGDrR5HUSmI=;
 b=CX4Kk1P1m2BUbQ8S9aLUc4/77gIwJqemXqMATPOu87Rzn+Gv0hgvZfSfq9IovwV7R0
 USUOG/EJ/AzVfwBaFVTaXEtpwM7PNgdy32dJo9I1RrRGjDGG843FK+Kuoqqz9+O836QG
 hHqWw6SZFzwww2+Q8eH/Fnov99gKp3jrSvwh07YMUcdGwxUv2pBd+bNq0kxfcLl/SEmX
 qp3shJOa8OoH1HWQI+JRI2noV2cE2RoQkdaZkigOdvU9NKcogNyrPDEzsO68QcZR9NMd
 4FySkihgOhMSY9EBtB9lZFN1DOjy1o6I2pjlHvoNe4+72ZfnO/279nHUKoS0quDDa2Ou
 +WaQ==
X-Gm-Message-State: AOAM5306xGzDT9SmsCaE7F0fsnqah7/fQ9N7glnXe4s4VgX0QyWCleNd
 rjeOhsoqt1OMsfm40UUDQA==
X-Google-Smtp-Source: ABdhPJxhlHWdR759W2/ZwO3kHuI+wtcySV279kCyDwV40mkUK/8z3O06wkP5ssZVrgQY5g1y7yDEXA==
X-Received: by 2002:aca:bf82:: with SMTP id p124mr3170755oif.133.1602874162686; 
 Fri, 16 Oct 2020 11:49:22 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id d11sm1192131otf.44.2020.10.16.11.49.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 11:49:22 -0700 (PDT)
Received: (nullmailer pid 1732283 invoked by uid 1000);
 Fri, 16 Oct 2020 18:49:21 -0000
Date: Fri, 16 Oct 2020 13:49:21 -0500
From: Rob Herring <robh@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH 06/20] dt-bindings: usb: Convert xHCI bindings to DT schema
Message-ID: <20201016184921.GA1732241@bogus>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-7-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014101402.18271-7-Sergey.Semin@baikalelectronics.ru>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Kevin Hilman <khilman@baylibre.com>, Andy Gross <agross@kernel.org>,
 linux-snps-arc@lists.infradead.org, devicetree@vger.kernel.org,
 Mathias Nyman <mathias.nyman@intel.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Roger Quadros <rogerq@ti.com>,
 Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-usb@vger.kernel.org, linux-mips@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, Manu Gautam <mgautam@codeaurora.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 14 Oct 2020 13:13:48 +0300, Serge Semin wrote:
> Currently the DT bindings of Generic xHCI Controllers are described by means
> of the legacy text file. Since such format is deprecated in favor of the
> DT schema, let's convert the Generic xHCI Controllers bindings file to the
> corresponding yaml files. There will be two of them: a DT schema for the
> xHCI controllers on a generic platform and a DT schema validating a generic
> xHCI controllers properties. The later will be used to validate the xHCI
> controllers, which aside from some vendor-specific features support the
> basic xHCI functionality.
> 
> An xHCI-compatible DT node shall support the standard USB HCD properties
> and custom ones like: usb2-lpm-disable, usb3-lpm-capable,
> quirk-broken-port-ped and imod-interval-ns. In addition if a generic xHCI
> controller is being validated against the DT schema it is also supposed to
> be equipped with mandatory compatible string, single registers range,
> single interrupts source, and is supposed to optionally contain up to two
> reference clocks for the controller core and CSRs.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> ---
> 
> Changelog v2:
> - Add explicit "additionalProperties: true" to the usb-xhci.yaml schema,
>   since additionalProperties/unevaluatedProperties are going to be mandary
>   for each binding.
> ---
>  .../devicetree/bindings/usb/generic-xhci.yaml | 63 +++++++++++++++++++
>  .../devicetree/bindings/usb/usb-xhci.txt      | 41 ------------
>  .../devicetree/bindings/usb/usb-xhci.yaml     | 42 +++++++++++++
>  3 files changed, 105 insertions(+), 41 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/usb/generic-xhci.yaml
>  delete mode 100644 Documentation/devicetree/bindings/usb/usb-xhci.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/usb-xhci.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
