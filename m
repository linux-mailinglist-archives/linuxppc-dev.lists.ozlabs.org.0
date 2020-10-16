Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B0837290C0C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Oct 2020 21:03:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CCbCr6qnFzDqv9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Oct 2020 06:03:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.161.65; helo=mail-oo1-f65.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-oo1-f65.google.com (mail-oo1-f65.google.com
 [209.85.161.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CCZwZ4XDtzDql8
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Oct 2020 05:50:37 +1100 (AEDT)
Received: by mail-oo1-f65.google.com with SMTP id f26so851493oou.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Oct 2020 11:50:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tQIAtcfZOgzbTee3ynuA+97EgTw4Y5zn1K5sehyraYU=;
 b=f2b5WG7BbSChrTr0S0jFMIJZC7flV2/57NJLOg6d6z+J39zDtd1sPgppkv0fglmaU2
 cN2nMcEtc+4XeqM30iQ0rnUf5szQy9jKSYDQdqfYUcgvIBl24DdkSGOwHSd+YrfV55Fk
 3OD0gCzU/pJpFu2qccz18i6f55nZB+nPQ24IdImVpZEtF3Mo8eJBc+IlQTxgjA7tie2t
 /BpR7t0LI0SQIe8liQllIimjwZIi68wbkfTF5cfsC3V/HE9FDHEadMFroBsTtXU/LOVb
 Px7uev370JA66E+2nYKvV0zAQ+sGUG2T4nQb1rc5HBPyVp1Xauo3ZZNBBf4cvQErHkxi
 /YVA==
X-Gm-Message-State: AOAM530sVcz+s0JiaBfW1YzwCak/4BOX3Ir2Hhtx553FL2JKfc5NT02o
 cWfmmkUPYDqw20LY+fdCWw==
X-Google-Smtp-Source: ABdhPJxlpklNvXwoGw9+00fyPv9Ov10bBunf9ANT94mdSsa1luXvKLcFtohW6R2sBFI6b/zUGoM++g==
X-Received: by 2002:a4a:d815:: with SMTP id f21mr3846003oov.44.1602874234188; 
 Fri, 16 Oct 2020 11:50:34 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id x13sm1372705oot.24.2020.10.16.11.50.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 11:50:33 -0700 (PDT)
Received: (nullmailer pid 1734139 invoked by uid 1000);
 Fri, 16 Oct 2020 18:50:32 -0000
Date: Fri, 16 Oct 2020 13:50:32 -0500
From: Rob Herring <robh@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH 10/20] dt-bindings: usb: dwc3: Add interrupt-names
 property support
Message-ID: <20201016185032.GA1734092@bogus>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-11-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014101402.18271-11-Sergey.Semin@baikalelectronics.ru>
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
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, Manu Gautam <mgautam@codeaurora.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 14 Oct 2020 13:13:52 +0300, Serge Semin wrote:
> The controller driver supports two types of DWC USB3 devices: with a
> common interrupt lane and with individual interrupts for each mode. Add
> support for both these cases to the DWC USB3 DT schema.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> ---
> 
> Changelog v2:
> - Grammar fix: "s/both of these cases support/support for both these cases"
> - Drop quotes from around the string constants.
> ---
>  Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
