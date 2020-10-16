Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C071290BF5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Oct 2020 20:58:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CCb5f5X8vzDqll
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Oct 2020 05:58:30 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CCZvm3mDFzDqN3
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Oct 2020 05:49:55 +1100 (AEDT)
Received: by mail-ot1-f68.google.com with SMTP id m11so3313802otk.13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Oct 2020 11:49:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+7rk6mULs7E7giUj43cA1IP/FNs4mrAUMdNjX3XPy9Q=;
 b=iXmCYVpQFzlgcWO90wycmnonqgs70gE4wz9qWwfp4My4QT1pezrcT7QZH0gVMVbVfe
 6QiwsQk5pbbyOptcwkRSFMlOTaZczku3/d0IoF3oll9qt1lYk2w5mfGW9Pfh6FsUtbQS
 vY/KN72KPVwOxACM2qPcdWCoS+/y24k5xxb7bDvKdqCO02tSBn3jUjvkU6v5K53j5c9d
 XBrC5IdccuuOteBaxuMSauoCb5VeUu+MHzHiWDtVUhsvW1QoxmKk8cO8wiYUY0Bzs5pt
 D+ldDshjFbrXpVqwqB8D1gDdBOJxMqJIiCZxWp0LNUo36CScWAJWaejin5hthkFd6EZM
 /i4g==
X-Gm-Message-State: AOAM531qtcqy7D/nunAVF4ETX74hO9sv3ucLjU4MznBaE80TmBurchpE
 WL1C6BAAG9jdavTUAEnGlg==
X-Google-Smtp-Source: ABdhPJwhDAteawNmw6uR+cUrj6Q9kHmeXiVaLKCaqkOS9AtmXWCjKDSR7JcUL4/bZsjQu3uW2S135A==
X-Received: by 2002:a05:6830:10d3:: with SMTP id
 z19mr3806259oto.295.1602874193111; 
 Fri, 16 Oct 2020 11:49:53 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id h14sm1214366otl.0.2020.10.16.11.49.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 11:49:52 -0700 (PDT)
Received: (nullmailer pid 1733036 invoked by uid 1000);
 Fri, 16 Oct 2020 18:49:51 -0000
Date: Fri, 16 Oct 2020 13:49:51 -0500
From: Rob Herring <robh@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH 07/20] dt-bindings: usb: xhci: Add Broadcom STB v2
 compatible device
Message-ID: <20201016184951.GA1732957@bogus>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-8-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014101402.18271-8-Sergey.Semin@baikalelectronics.ru>
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
 Kevin Hilman <khilman@baylibre.com>, Andy Gross <agross@kernel.org>,
 linux-snps-arc@lists.infradead.org, devicetree@vger.kernel.org,
 Mathias Nyman <mathias.nyman@intel.com>,
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

On Wed, 14 Oct 2020 13:13:49 +0300, Serge Semin wrote:
> For some reason the "brcm,xhci-brcm-v2" compatible string has been missing
> in the original bindings file. Add it to the Generic xHCI Controllers DT
> schema since the controller driver expects it to be supported.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> ---
>  Documentation/devicetree/bindings/usb/generic-xhci.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
