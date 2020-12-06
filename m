Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF692D04A5
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Dec 2020 12:53:45 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CplFw5GPXzDqSY
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Dec 2020 22:53:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::143;
 helo=mail-lf1-x143.google.com; envelope-from=fancer.lancer@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=QustGC5g; dkim-atps=neutral
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cphss3YRGzDqWR
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Dec 2020 21:06:01 +1100 (AEDT)
Received: by mail-lf1-x143.google.com with SMTP id u18so13744652lfd.9
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 06 Dec 2020 02:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xt68N/tojAn+X+eORxYIydzyuDkBvWrZkEpf49UU+Ws=;
 b=QustGC5gJezh0xNL/1XUtO+dCt5J+pvT7fp6FxldwuvmTZLa7CA93Y9b3RdoAJUE/T
 g0xIlxWJtXakl4UKiYwvYrJzdR4FMeXEtFrsIzZXkN9FuBTT1ruQEuznJf8QF+n8XBXL
 wpDjtR4HHi5UVz2iOJeC8+a3jBkvMPWwpc6dI8s91lpQ2HrEfJVGY17ccj59XvsFhPX3
 RKftikG2ho64wVjuTMMB3FDXGtU5B82ZSdJhdfMQa/J/Z4QBHTc8Y7Y6HQJNYbUzzzPW
 umgRjuMQFqpjcwNNAsX5ZyKvaIVlk8PJgtkdvWV6jiVv0ZNd/HB3HM+UJ3+RaPZRhrNw
 PEGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xt68N/tojAn+X+eORxYIydzyuDkBvWrZkEpf49UU+Ws=;
 b=HyWH7QwsIoyp8MFbYhorLx41xmyE3LyYgzux0JHI5paJ7if+yju2EArjdy8AoHsr3g
 2QW3YDdlMDMYBmA3masyUYOvG7zJsb6UvzVr2MHKCEpa+oU53mo4nxRzf3yJVF7n3Xaf
 sfxo+pOKkw7x0H8ldyw5lTfuHPLpO9CAjV+SSAB1h+RhYYfVCnVlR50ddCBN4Cnhd/m4
 /cPw8C8PU/LYoYG2L1fY1m/dBMuXDyeSgsh1jFMe9Wyuwxi83VDQX3/KjO32nBecSjwE
 lrnj2uQYpuSXFOliXuh4fWmPKr4k+XKfKZK/GKeVXUZd3eqysclH5XDTcLYS2kWn39dk
 LhOw==
X-Gm-Message-State: AOAM530+zpVpxH56zGlhT1VntQLh/8fBlxS4OfTErhw9X4oFYtGwXOm/
 lFYRhlPYV8GZlZMHPx1aU+g=
X-Google-Smtp-Source: ABdhPJw/nG2Sxcwi0lQk9dQrxf0vxOmbyiTRrngGMSbpQGeRGfcRhdlBhixGcs00B/NGWV2nb7r2dw==
X-Received: by 2002:ac2:5a44:: with SMTP id r4mr5837652lfn.1.1607249154606;
 Sun, 06 Dec 2020 02:05:54 -0800 (PST)
Received: from mobilestation ([95.79.141.114])
 by smtp.gmail.com with ESMTPSA id m16sm2498255lfa.57.2020.12.06.02.05.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Dec 2020 02:05:53 -0800 (PST)
Date: Sun, 6 Dec 2020 13:05:51 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "Wan Mohamad, Wan Ahmad Zainie" <wan.ahmad.zainie.wan.mohamad@intel.com>
Subject: Re: [PATCH v5 19/19] dt-bindings: usb: intel,keembay-dwc3: Validate
 DWC3 sub-node
Message-ID: <20201206100551.7ioybhtwfscul7kw@mobilestation>
References: <20201205152427.29537-1-Sergey.Semin@baikalelectronics.ru>
 <20201205152427.29537-20-Sergey.Semin@baikalelectronics.ru>
 <DM6PR11MB3721E8FEB4E755328D7A517EDDCF0@DM6PR11MB3721.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM6PR11MB3721E8FEB4E755328D7A517EDDCF0@DM6PR11MB3721.namprd11.prod.outlook.com>
X-Mailman-Approved-At: Sun, 06 Dec 2020 22:47:09 +1100
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
Cc: narmstrong <narmstrong@baylibre.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Kevin Hilman <khilman@baylibre.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Andy Gross <agross@kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Nyman,
 Mathias" <mathias.nyman@intel.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Rob Herring <robh+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Roger Quadros <rogerq@ti.com>, Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Manu Gautam <mgautam@codeaurora.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Wan,

On Sun, Dec 06, 2020 at 09:56:47AM +0000, Wan Mohamad, Wan Ahmad Zainie wrote:
> Hi Serge.
> 
> > -----Original Message-----
> > From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > Sent: Saturday, December 5, 2020 11:24 PM
> > To: Nyman, Mathias <mathias.nyman@intel.com>; Felipe Balbi
> > <balbi@kernel.org>; Krzysztof Kozlowski <krzk@kernel.org>; Greg Kroah-
> > Hartman <gregkh@linuxfoundation.org>; Rob Herring
> > <robh+dt@kernel.org>; Chunfeng Yun <chunfeng.yun@mediatek.com>;
> > Wan Mohamad, Wan Ahmad Zainie
> > <wan.ahmad.zainie.wan.mohamad@intel.com>
> > Cc: Serge Semin <Sergey.Semin@baikalelectronics.ru>; Serge Semin
> > <fancer.lancer@gmail.com>; Alexey Malahov
> > <Alexey.Malahov@baikalelectronics.ru>; Pavel Parkhomenko
> > <Pavel.Parkhomenko@baikalelectronics.ru>; Andy Gross
> > <agross@kernel.org>; Bjorn Andersson <bjorn.andersson@linaro.org>;
> > Manu Gautam <mgautam@codeaurora.org>; Roger Quadros
> > <rogerq@ti.com>; Lad Prabhakar <prabhakar.mahadev-
> > lad.rj@bp.renesas.com>; Yoshihiro Shimoda
> > <yoshihiro.shimoda.uh@renesas.com>; narmstrong
> > <narmstrong@baylibre.com>; Kevin Hilman <khilman@baylibre.com>;
> > Martin Blumenstingl <martin.blumenstingl@googlemail.com>; linux-arm-
> > kernel@lists.infradead.org; linux-snps-arc@lists.infradead.org; linux-
> > mips@vger.kernel.org; linuxppc-dev@lists.ozlabs.org; linux-
> > usb@vger.kernel.org; devicetree@vger.kernel.org; linux-
> > kernel@vger.kernel.org
> > Subject: [PATCH v5 19/19] dt-bindings: usb: intel,keembay-dwc3: Validate
> > DWC3 sub-node
> > 
> > Intel Keem Bay DWC3 compatible DT nodes are supposed to have a DWC
> > USB3 compatible sub-node to describe a fully functioning USB interface. Let's
> > use the available DWC USB3 DT schema to validate the Qualcomm DWC3 sub-
> > nodes.
> > 
> > Note since the generic DWC USB3 DT node is supposed to be named as
> > generic USB HCD ("^usb(@.*)?") one we have to accordingly fix the sub-
> > nodes name regexp and fix the DT node example.
> > 
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 

> LGTM. With minor change to fix the typo above, Qualcomm to Intel
> Keem Bay,
> Acked-by: Wan Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>

Ah, right. Thanks for noticing that. A probability of copy-paste mistakes
increases proportionally to the number sleepless hours.)

-Sergey

> 
> > 
> > ---
> > 
> > Changelog v5:
> > - This is a new patch created for the new Intel Keem Bay bindings file,
> >   which has been added just recently.
> > ---
> >  .../devicetree/bindings/usb/intel,keembay-dwc3.yaml      | 9 +++------
> >  1 file changed, 3 insertions(+), 6 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/intel,keembay-
> > dwc3.yaml b/Documentation/devicetree/bindings/usb/intel,keembay-
> > dwc3.yaml
> > index dd32c10ce6c7..43b91ab62004 100644
> > --- a/Documentation/devicetree/bindings/usb/intel,keembay-dwc3.yaml
> > +++ b/Documentation/devicetree/bindings/usb/intel,keembay-dwc3.yaml
> > @@ -34,11 +34,8 @@ properties:
> >  # Required child node:
> > 
> >  patternProperties:
> > -  "^dwc3@[0-9a-f]+$":
> > -    type: object
> > -    description:
> > -      A child node must exist to represent the core DWC3 IP block.
> > -      The content of the node is defined in dwc3.txt.
> > +  "^usb@[0-9a-f]+$":
> > +    $ref: snps,dwc3.yaml#
> > 
> >  required:
> >    - compatible
> > @@ -68,7 +65,7 @@ examples:
> >            #address-cells = <1>;
> >            #size-cells = <1>;
> > 
> > -          dwc3@34000000 {
> > +          usb@34000000 {
> >                  compatible = "snps,dwc3";
> >                  reg = <0x34000000 0x10000>;
> >                  interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
> > --
> > 2.29.2
> 
> Best regards,
> Zainie
