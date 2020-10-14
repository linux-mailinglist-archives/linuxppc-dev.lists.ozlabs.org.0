Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E6C28E164
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Oct 2020 15:35:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CBD1k4qTXzDqtK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Oct 2020 00:35:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.193;
 helo=mail-oi1-f193.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CBCyJ4HkPzDqXJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Oct 2020 00:32:24 +1100 (AEDT)
Received: by mail-oi1-f193.google.com with SMTP id x62so3191149oix.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Oct 2020 06:32:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RfUVv3fCiTl2E9POO6Buswiqzr2whvPDBuKBRK/9qXo=;
 b=lXj7gwDc6nUa11Z4qLbBduPlTgdeqgzfxb+KeQAaze7H2/SWx6ISQEaXOYgBgz11fJ
 DX4VOOUoCfQXqCCc9TMJ2G6QEYRHBa/f3t0CcUnOKkekvJQJ/AT0Df0G1WMoWuETC+kt
 vljpM0N3JqSrE6ejzhabV2NX482k6zo2EqZdwku8kNcVJBDUzpWZQt99pTq7RvS6xkFh
 j8g5sPbC9yp/OQo3pd9WzOMV/mvIPbnc6EOU0bKegVcuy1Yhk+WMuwKfbQwukPjtOKxg
 cj3Wp4A5O3pvUfvIWOaTHszEtM0PO1yYs3Bnsx4yx0q/rYqOsoehYdzw/SS+CLQoSJff
 5Xyw==
X-Gm-Message-State: AOAM5331jnqg7fB4fkQBIwzYyZV4phTxw1mPdMcuJYble3q/w9P7l8+I
 MvYJm4IrGY1Avo+2gMw/1g==
X-Google-Smtp-Source: ABdhPJxd/P4qzAtPsd2916G42APosJoO+yYmHIG+zpWj3QmjNHSypnWafNQcsvqbK5VxDOltQFbAXQ==
X-Received: by 2002:aca:ea84:: with SMTP id i126mr1059134oih.98.1602682341597; 
 Wed, 14 Oct 2020 06:32:21 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 92sm1204900otl.1.2020.10.14.06.32.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2020 06:32:20 -0700 (PDT)
Received: (nullmailer pid 1546268 invoked by uid 1000);
 Wed, 14 Oct 2020 13:32:19 -0000
Date: Wed, 14 Oct 2020 08:32:19 -0500
From: Rob Herring <robh@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH 09/20] dt-bindings: usb: Convert DWC USB3 bindings to DT
 schema
Message-ID: <20201014133219.GA1545403@bogus>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-10-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014101402.18271-10-Sergey.Semin@baikalelectronics.ru>
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

On Wed, 14 Oct 2020 13:13:51 +0300, Serge Semin wrote:
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
> ---
>  .../devicetree/bindings/usb/dwc3.txt          | 125 --------
>  .../devicetree/bindings/usb/snps,dwc3.yaml    | 295 ++++++++++++++++++
>  2 files changed, 295 insertions(+), 125 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/dwc3.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

./Documentation/devicetree/bindings/usb/snps,dwc3.yaml:44:4: [warning] wrong indentation: expected 4 but found 3 (indentation)
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/qcom,dwc3.example.dt.yaml: dwc3@a600000: $nodename:0: 'dwc3@a600000' does not match '^usb(@.*)?'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.example.dt.yaml: usb@ff500000: snps,quirk-frame-length-adjustment: True is not of type 'array'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/snps,dwc3.yaml


See https://patchwork.ozlabs.org/patch/1382003

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

