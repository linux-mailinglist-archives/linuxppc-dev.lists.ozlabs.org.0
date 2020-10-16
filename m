Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E89DF290C29
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Oct 2020 21:19:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CCbYQ00C7zDqJg
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Oct 2020 06:19:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.65; helo=mail-ot1-f65.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CCb244xNhzDqNV
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Oct 2020 05:55:24 +1100 (AEDT)
Received: by mail-ot1-f65.google.com with SMTP id d28so3400834ote.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Oct 2020 11:55:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WAD2Bkge9segqyiCp7/h5MSVkGWW1ZGdU9PxYNU4seQ=;
 b=TpMyep/sXCmG0+lsUoLnwkvM5e8ZHaNChBZy/wpKiBQuJBLwyR1iMHDlaU5WNarzob
 fbIgXq8G29PT77ZUTYQindIqgyhWbIAz+IERabt9Gj8J0ZNlFaJsbeMiO4VRUnt6/Fp1
 /vYulpdv//UVv8p9jEjDLKlamYkBQYtrNn579GmaqAapJFAT1z48tqBPo9TogTg2LtYP
 lcxAYaL1Ugh8FtSOO6IR6VajeKxdz5NeQsSnNvmTtCq2KPCgqgF3khc6Pqg+3zsUTzQu
 GdNXbBpnVn2FwztyHNrUUP2F5io40aFtL6PlpJ4smjfNX2Oeh6Zabrts59lSs/sgzff9
 2ZwQ==
X-Gm-Message-State: AOAM530TcCM6lqRknuDHiJnRociynkvv+vOQrHsO2PTI6w9ZoJghfz+K
 339Z1G2fDKI3UyAhz8MJkA==
X-Google-Smtp-Source: ABdhPJwbkYhh4uRLlvY2t2XIJwPP8W1OCk6oKHzS/TndVZiwTR4Y/5zgP20uNN5E07f6Hmc/pgEAuQ==
X-Received: by 2002:a05:6830:19e1:: with SMTP id
 t1mr3751137ott.120.1602874520469; 
 Fri, 16 Oct 2020 11:55:20 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id x13sm1187735otg.66.2020.10.16.11.55.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 11:55:19 -0700 (PDT)
Received: (nullmailer pid 1741086 invoked by uid 1000);
 Fri, 16 Oct 2020 18:55:18 -0000
Date: Fri, 16 Oct 2020 13:55:18 -0500
From: Rob Herring <robh@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH 16/20] dt-bindings: usb: keystone-dwc3: Validate DWC3
 sub-node
Message-ID: <20201016185518.GA1741040@bogus>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-17-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014101402.18271-17-Sergey.Semin@baikalelectronics.ru>
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

On Wed, 14 Oct 2020 13:13:58 +0300, Serge Semin wrote:
> TI Keystone DWC3 compatible DT node is supposed to have a DWC USB3
> compatible sub-node to describe a fully functioning USB interface.
> Since DWC USB3 has now got a DT schema describing its DT node, let's make
> sure the TI Keystone DWC3 sub-node passes validation against it.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> ---
> 
> Changelog v2:
> - Grammar fix: "s/it'/its"
> ---
>  Documentation/devicetree/bindings/usb/ti,keystone-dwc3.yaml | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
