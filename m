Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8045A290B70
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Oct 2020 20:38:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CCZfh5TKbzDqfL
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Oct 2020 05:38:36 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CCZYk1VKgzDqb5
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Oct 2020 05:34:18 +1100 (AEDT)
Received: by mail-ot1-f68.google.com with SMTP id f37so3279576otf.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Oct 2020 11:34:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Qwu3JG9+LDlewH987hNzyQoOEX0CL8g7zvaZjjCcw4U=;
 b=OaoF6Lu4u4lwJCupeq74cyqxqKEKM4bNxqK45lkjQqySPq94CSGqhCu6ST1mf/C9SS
 nCycr0hiGEg9AIDlNCWU1Oi8Lr/wuetNrMvPCR/kKs8oYYQJ0wwmcHuLQulNtRw9T9m0
 W+h4WpL/SRRctSnskb4mDh+OLd3W+cUqoORbcdL0jsKBWLYldR2PsI4KPvEhYKSQEZCl
 b1k1YL826PGov1aX5RMEutfUdzeI5tisjU0XqbuN8xJvKgd728paTTakxmHS5zQXFqiy
 pwqYv2/Le6PpxuQ72OJDYyQeqSveEYJ5rCldEox4zg4/uLuOvHC2E9nqZWmdLy5rTppf
 FBmA==
X-Gm-Message-State: AOAM532koozfKBrNptt2nEyk0ssSa5+DYo3FyJST2kcqrkvcu4MaDFzJ
 Gg12GO4q61NFigImol/sqg==
X-Google-Smtp-Source: ABdhPJyi6z0hP/x6L+MrsJNmQGndEN2hAnyiGpicmxYQV/nKNfR9ytGgBHm+fPvoXX+6vbcG4GvIAA==
X-Received: by 2002:a9d:53cc:: with SMTP id i12mr3447418oth.215.1602873254082; 
 Fri, 16 Oct 2020 11:34:14 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m23sm1354610ooq.30.2020.10.16.11.34.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 11:34:13 -0700 (PDT)
Received: (nullmailer pid 1699483 invoked by uid 1000);
 Fri, 16 Oct 2020 18:34:12 -0000
Date: Fri, 16 Oct 2020 13:34:12 -0500
From: Rob Herring <robh@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH 03/20] dt-bindings: usb: usb-hcd: Add "ulpi/serial/hsic"
 PHY types
Message-ID: <20201016183412.GA1699346@bogus>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-4-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014101402.18271-4-Sergey.Semin@baikalelectronics.ru>
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

On Wed, 14 Oct 2020 13:13:45 +0300, Serge Semin wrote:
> Aside from the UTMI+ there are also ULPI, Serial and HSIC PHY types
> that can be specified in the phy_type HCD property. Add them to the
> enumeration of the acceptable values.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> ---
> 
> Changelog v2:
> - Grammar fix: "s/PHY types can be/PHY types that can be"
> - Drop quotes from around the string constants.
> ---
>  Documentation/devicetree/bindings/usb/usb-hcd.yaml | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
