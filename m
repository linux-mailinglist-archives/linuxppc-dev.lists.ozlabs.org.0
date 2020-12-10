Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 830452D5155
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 04:28:04 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Crzrc0FpvzDqvY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 14:28:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.161.67; helo=mail-oo1-f67.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-oo1-f67.google.com (mail-oo1-f67.google.com
 [209.85.161.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Crzn35KN0zDqsD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Dec 2020 14:24:54 +1100 (AEDT)
Received: by mail-oo1-f67.google.com with SMTP id x203so955864ooa.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 09 Dec 2020 19:24:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SGHystu8KEcuTA0RNExv/VnJoWPktKLvdV3bpnziI/o=;
 b=D/nvQZ1+9yqDNz7ocfxiQFvmpkr9gUKO8NliDNxBj5kmMbWU0v8HvFH3LeKDKlvEsr
 6NJ5xZKz/KIBscwCw8APg6cfQG2MBLrxrO1N9XE45KtsYxQGisQiBEUJx9tddbZKL+z8
 G0bLuIuBQy3Mivz+N3MGNFx+baMv36wqnRD/qL5Y1pqXPF0pSllMAQEx4ZSmqZHE078F
 UkqKkhoO3otm60oq1KPamlyyKg3nkw1uNILwOSHUR0NNHHx0QPRXzj1xDnco2UglUEnM
 u124vqPrUL/oPVOmCondQOlEae01hEjfwy2zIo1vGQVPryBLGKSTd/SSxiXdl7gsAswA
 wE/g==
X-Gm-Message-State: AOAM5310AsFladnie5gT55Enx7TiM5p/ypm5o7X/txqbcAGvhTTmqwGh
 9zJirEQqU8tu4+opc6mg4A==
X-Google-Smtp-Source: ABdhPJxVr0iv7i61NhYxL1VKmCWErqvhvd6h7QtNaiu4n9B+aJ0EfyOf4EsAk/DaMrnShrdMqign7w==
X-Received: by 2002:a4a:6b4d:: with SMTP id h13mr4541165oof.67.1607570690575; 
 Wed, 09 Dec 2020 19:24:50 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id q18sm749828ood.35.2020.12.09.19.24.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 19:24:49 -0800 (PST)
Received: (nullmailer pid 1591441 invoked by uid 1000);
 Thu, 10 Dec 2020 03:24:48 -0000
Date: Wed, 9 Dec 2020 21:24:48 -0600
From: Rob Herring <robh@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH v5 12/19] dt-bindings: usb: dwc3: Add synopsys, dwc3
 compatible string
Message-ID: <20201210032448.GA1591395@robh.at.kernel.org>
References: <20201205152427.29537-1-Sergey.Semin@baikalelectronics.ru>
 <20201205152427.29537-13-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201205152427.29537-13-Sergey.Semin@baikalelectronics.ru>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Kevin Hilman <khilman@baylibre.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
 Andy Gross <agross@kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 linux-snps-arc@lists.infradead.org, devicetree@vger.kernel.org,
 Mathias Nyman <mathias.nyman@intel.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Roger Quadros <rogerq@ti.com>, Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-usb@vger.kernel.org, linux-mips@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, linux-kernel@vger.kernel.org,
 Manu Gautam <mgautam@codeaurora.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 05 Dec 2020 18:24:19 +0300, Serge Semin wrote:
> The DWC USB3 driver and some DTS files like Exynos 5250, Keystone k2e, etc
> expects the DWC USB3 DT node to have the compatible string with the
> "synopsys" vendor prefix. Let's add the corresponding compatible string to
> the controller DT schema, but mark it as deprecated seeing the Synopsys,
> Inc. is presented with just "snps" vendor prefix.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> ---
> 
> Changelog v2:
> - Drop quotes from around the compat string constant.
> 
> Changelog v4:
> - Get the patch back, since we can't discard the deprecated prefix from the
>   driver.
> ---
>  Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
