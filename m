Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F4B2BBF08
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Nov 2020 13:48:56 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CdYBY0GwszDqjd
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Nov 2020 23:48:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.67; helo=mail-ot1-f67.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CdY5B56FfzDqdZ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Nov 2020 23:44:14 +1100 (AEDT)
Received: by mail-ot1-f67.google.com with SMTP id n11so11464094ota.2
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Nov 2020 04:44:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=O6Nr/Rieym0i/OHuod4YgdUg5NHz7ccPxXo1aK1Oha0=;
 b=CB6WbBTZNo7AgHuV05/3LU8McOj9o0+mt9+JndYCm4goVUCBXO9fR1y9XbmZgBVOJ0
 Gc7vw3nDRgKEtLDOhR8BBdFy69aUVyrZ+BHBqKaLae+d8LdX/D08KH+f6p8DkXYVBfRq
 u2sRAA6jreZJcnWFu61qum7L+tODCfQ9jDnI8jaNGVrr5+7NmmAXZSHPQuY1I57T3M1/
 r/qhl1TIuGlQ4wUkkZyzWv9rKJSavFbf2VUpnYy1ECY1QMULEZNr9tLIII+s5hHz0sRs
 kq7f9QtfyLnA47m3YdbJylLF6wvfpVlB3G91vT3uU0vBi5PBqp0HLmksaAvWjL/9G4+G
 lEyw==
X-Gm-Message-State: AOAM533gjSEgMpSJ6gaB3QiBZaG9UlOqQHkDn+ZvMQXxD+zZYKkkzvcm
 xOZa42kaFEXAkO9M1mvd7A==
X-Google-Smtp-Source: ABdhPJw3HoleXj4Ds9tiz5eVa//gqnZHEYkUUG/e1jSOlz7u3ljD+0RipYCaATEwmrx6h4HXBMJXYg==
X-Received: by 2002:a05:6830:1283:: with SMTP id
 z3mr18198570otp.323.1605962650796; 
 Sat, 21 Nov 2020 04:44:10 -0800 (PST)
Received: from xps15 ([2607:fb90:5feb:6270:cdf7:680e:59f2:6ccd])
 by smtp.gmail.com with ESMTPSA id t5sm3116800oth.16.2020.11.21.04.44.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Nov 2020 04:44:10 -0800 (PST)
Received: (nullmailer pid 2067061 invoked by uid 1000);
 Sat, 21 Nov 2020 12:44:03 -0000
Date: Sat, 21 Nov 2020 06:44:03 -0600
From: Rob Herring <robh@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH v4 02/18] dt-bindings: usb: Convert generic USB
 properties to DT schemas
Message-ID: <20201121124403.GA2066237@robh.at.kernel.org>
References: <20201111090853.14112-1-Sergey.Semin@baikalelectronics.ru>
 <20201111090853.14112-3-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201111090853.14112-3-Sergey.Semin@baikalelectronics.ru>
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
 Andy Gross <agross@kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 linux-snps-arc@lists.infradead.org, devicetree@vger.kernel.org,
 Mathias Nyman <mathias.nyman@intel.com>,
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

On Wed, 11 Nov 2020 12:08:37 +0300, Serge Semin wrote:
> The generic USB properties have been described in the legacy bindings
> text file: Documentation/devicetree/bindings/usb/generic.txt . Let's
> convert its content into the generic USB, USB HCD and USB DRD DT
> schemas. So the Generic USB schema will be applicable to all USB
> controllers, USB HCD - for the generic USB Host controllers and the USB
> DRD - for the USB Dual-role controllers.
> 
> Note the USB DRD schema is supposed to work in conjunction with
> the USB peripheral/gadget and USB host controllers DT schemas.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> ---
> 
> Changelog v2:
> - Discard '|' in all the new properties, since we don't need to preserve
>   the text formatting.
> - Convert abbreviated form of the "maximum-speed" enum restriction into
>   the multi-lined version of the list.
> - Drop quotes from around the string constants.
> 
> Changelog v4:
> - Redistribute the properties between generic ones, USB HCD-specific and
>   USB DRD-specific.
> - Discard the Rob'es Reviewed-by tag. Please review the patch one more time.
> ---
>  .../devicetree/bindings/usb/generic.txt       | 57 --------------
>  .../devicetree/bindings/usb/usb-drd.yaml      | 77 +++++++++++++++++++
>  .../devicetree/bindings/usb/usb-hcd.yaml      |  5 ++
>  .../devicetree/bindings/usb/usb.yaml          | 22 ++++++
>  4 files changed, 104 insertions(+), 57 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/generic.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/usb-drd.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
