Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A93E5290B6D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Oct 2020 20:37:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CCZd30qmKzDqsQ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Oct 2020 05:37:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.196;
 helo=mail-oi1-f196.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CCZYK6vfTzDqsK
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Oct 2020 05:33:57 +1100 (AEDT)
Received: by mail-oi1-f196.google.com with SMTP id s21so3519252oij.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Oct 2020 11:33:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UDTtNlOGm1HvWwHnEyl2J0aIGj7blB2zVqE4G+OLkzg=;
 b=cmNACfx7+Tk6ScESBvCdovppiNn6ct6b6TdBRAcaRoFGCPxYHDLIeMi7+YYtqM5339
 K2wjJZWJqECBTepQ/0Okfl6Bl24EqwfU0AYczHmOA8ykn+SOfTc4pX7g0YYHpFlrJYuT
 cDfLfGYodbQAA/EQ0HNwnViyuX1YDFzb2cx/TLW+AUxQxlwABMYOe8PYsM49n33Fj2M6
 RJ7x8+g+RERif4uS/A4MPuLeIuI2woIEiwn63FS21PfIRDj9GBXNGMIu2jmJT6rbl6Pt
 GC1jOPZfbeovhTbDfoS7ImFdAxrdsEHDzb/GMOVDcA4EjERAw85f8ac/AFtSLfB2L483
 m6gw==
X-Gm-Message-State: AOAM533hJoxN4b49YdkDu5Ty0DpUL6T63D5dL5tT+g6ISy7FbPIy3lyI
 y0cb6DQRdzvvxO9cZHzESQ==
X-Google-Smtp-Source: ABdhPJwJMxgjSojEb765Vf9jtXqW2AE6c488Kfu3npxryBaa3nw0GZZPQdSCsowUayDeivmee8U+9w==
X-Received: by 2002:aca:4485:: with SMTP id r127mr3224405oia.160.1602873233618; 
 Fri, 16 Oct 2020 11:33:53 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id z25sm1314185oot.23.2020.10.16.11.33.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 11:33:53 -0700 (PDT)
Received: (nullmailer pid 1698948 invoked by uid 1000);
 Fri, 16 Oct 2020 18:33:51 -0000
Date: Fri, 16 Oct 2020 13:33:51 -0500
From: Rob Herring <robh@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH 02/20] dt-bindings: usb: usb-hcd: Add "otg-rev" property
 restriction
Message-ID: <20201016183351.GA1698901@bogus>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-3-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014101402.18271-3-Sergey.Semin@baikalelectronics.ru>
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

On Wed, 14 Oct 2020 13:13:44 +0300, Serge Semin wrote:
> There are only four OTG revisions are currently supported by the kernel:
> 0x0100, 0x0120, 0x0130, 0x0200. Any another value is considered as
> invalid.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> ---
>  Documentation/devicetree/bindings/usb/usb-hcd.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
