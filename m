Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA8A290C1B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Oct 2020 21:09:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CCbL137Z4zDqP2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Oct 2020 06:09:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.161.68; helo=mail-oo1-f68.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-oo1-f68.google.com (mail-oo1-f68.google.com
 [209.85.161.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CCb0Z2Z0HzDqRb
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Oct 2020 05:54:06 +1100 (AEDT)
Received: by mail-oo1-f68.google.com with SMTP id o20so866231ook.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Oct 2020 11:54:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2SJo91FUryiudrvp7hFXXd3itA6M64t3t+PTG337Wos=;
 b=IZ5+3XPL3cNyZ513sfbPzVZOpywDp+dkYL//ShoNlkDzzjXZhHN5kurars08M/CDSv
 aXcVHEjiRkct/3emMSOOyNv+MGkioMZRL1AKlLjWJQQneE0zgc0/7lScS9d2Orl7kTkX
 tWe2E0x7za4Tb0ipOwPBkFmBQYFI4Cm1DKUG/tTu/GUTRv3VWDNe4I1alHXPvGxx47fD
 yMo32JpTSWv1XDVaTa1DniVrGQyp2YSU/PtI+rHsUoCWiAL8+34V2djHiWZg+H5iRxPF
 LDj7GfTQJItT6Kp3AW9QFSYLfAYwtEuuj7ybdtUuoRWh2ss79AG/WNN2SGyxa7cIEJ3Z
 WM6g==
X-Gm-Message-State: AOAM5309Gu2mhLQOjU365yAICh+dCo8Q5Q1kKlL0qtzWt5E3ZQCOM1ZX
 YA9Qd9t+xcLNnri/g5LsmA==
X-Google-Smtp-Source: ABdhPJxqrZ90dBQRwNY763mNG9iHYX8vq1NLO807gpJ9dzO8ZYI7ue+E+B9W403xLk4jO317PbFvMA==
X-Received: by 2002:a4a:be14:: with SMTP id l20mr3781334oop.27.1602874443081; 
 Fri, 16 Oct 2020 11:54:03 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id k6sm1204239otp.33.2020.10.16.11.54.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 11:54:02 -0700 (PDT)
Received: (nullmailer pid 1739020 invoked by uid 1000);
 Fri, 16 Oct 2020 18:54:01 -0000
Date: Fri, 16 Oct 2020 13:54:01 -0500
From: Rob Herring <robh@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH 12/20] dt-bindings: usb: dwc3: Add Tx De-emphasis
 restrictions
Message-ID: <20201016185401.GA1738966@bogus>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-13-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014101402.18271-13-Sergey.Semin@baikalelectronics.ru>
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

On Wed, 14 Oct 2020 13:13:54 +0300, Serge Semin wrote:
> In accordance with the driver comments the PIPE3 de-emphasis can be tuned
> to be either -6dB, -2.5dB or disabled. Let's add the de-emphasis
> property restriction so the DT schema would make sure the controller DT
> node is equipped with correct value.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> ---
> 
> Changelog v2:
> - Grammar fix: "s/tunned/tuned"
> - Grammar fix: remove redundant "or" conjunction.
> ---
>  Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
