Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADEE290C23
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Oct 2020 21:16:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CCbVl2lDLzDqfk
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Oct 2020 06:16:47 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CCb1g563vzDqRr
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Oct 2020 05:55:03 +1100 (AEDT)
Received: by mail-oi1-f193.google.com with SMTP id m128so3550238oig.7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Oct 2020 11:55:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TGrH8tVmrp2DQwkSPaPH+x2TeW+bXYbWOYv8P0MTPiA=;
 b=h/MEK8Obs9sCh5vpTPYFqGU8XLzeLI2w4cJpRtOHPJomjVXTJ9rYRf4bsjwhO7mpcZ
 vzluopdS658y7w7hkU+L3KwCGNglYiVJMcvZpDxZKdvbK/1tYSP0yPZA/coHNAlaBD5Q
 7eBbbolg8jFa4PPFumQRUayYBoP+eDgA6kl4toMrtsLTS1o3eWsooHBYXRq5PtC8gLzp
 pPKBfkc5p9Y7/3y5c4Qnh/nprcDUPUOwyWhoWAp05P9YSu5IBhHL4bg+yPqp88aM/ImL
 +1UAoIb0/CJGiZsi0HpxDDmoFaD/jm+uc8/z+N+07xl92YGCoQDjkAA/fbPD4BJHwJ44
 iq2Q==
X-Gm-Message-State: AOAM53195Xz/3I4NBNGWp4hpTpd+O9KdlXQD+z22jKS2ANFNOCUnGz44
 IKRQfJ4oMghv3acDtL+BFg==
X-Google-Smtp-Source: ABdhPJwnZgFRvBDy/tFBiG5qnk1HDuFUgcTqyGaZJkTAhrpV/gkKkosLe8nlbRQyokQSpe8q3F4/vA==
X-Received: by 2002:aca:442:: with SMTP id 63mr3220005oie.111.1602874501767;
 Fri, 16 Oct 2020 11:55:01 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id y194sm1266324oie.22.2020.10.16.11.55.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 11:55:01 -0700 (PDT)
Received: (nullmailer pid 1740583 invoked by uid 1000);
 Fri, 16 Oct 2020 18:54:59 -0000
Date: Fri, 16 Oct 2020 13:54:59 -0500
From: Rob Herring <robh@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH 15/20] dt-bindings: usb: meson-g12a-usb: Validate
 DWC2/DWC3 sub-nodes
Message-ID: <20201016185459.GA1740536@bogus>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-16-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014101402.18271-16-Sergey.Semin@baikalelectronics.ru>
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
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Andy Gross <agross@kernel.org>, linux-snps-arc@lists.infradead.org,
 devicetree@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
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

On Wed, 14 Oct 2020 13:13:57 +0300, Serge Semin wrote:
> Amlogic G12A USB DT sub-nodes are supposed to be compatible with the
> generic DWC USB2 and USB3 devices. Since now we've got DT schemas for
> both of the later IP cores let's make sure that the Amlogic G12A USB
> DT nodes are fully evaluated including the DWC sub-nodes.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
> 
> ---
> 
> Changelog v2:
> - Use "oneOf: [dwc2.yaml#, snps,dwc3.yaml#]" instead of the bulky "if:
>   properties: compatibe: ..." statement.
> ---
>  .../devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml  | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
