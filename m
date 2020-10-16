Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB5F290B66
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Oct 2020 20:35:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CCZZy4fMPzDqt0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Oct 2020 05:35:22 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CCZY56hSgzDqYj
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Oct 2020 05:33:43 +1100 (AEDT)
Received: by mail-ot1-f65.google.com with SMTP id 32so3337556otm.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Oct 2020 11:33:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mxGxwsSCY3mfHHfinHvUgIr9QAqE/m7IS136yJ0NQIw=;
 b=eI+B+KhMHHF+s/TOpN8Ww3QUUSLsy50CCuKfNZHnWf7yYTkWDdDJdnC5pmY9SLlBMN
 j4CMGslsT+kUH0NuXbUKD+y7krU0yt0yRwp4VHQHsiwa5rmyblycb6NqI2ifKCtUYk3Q
 OOn9jOawX19puDVeagPLijX6B1lMUVLoZyV0skntPvhpICJ+ZZJoACZqVe65GOrtYFFk
 3SQ0deL5n4KA28Jizlv65yj21blYlg5ONQcpJBJuAeTZ2VGeP4xUTnqvyay4TNEJdPXo
 WnerLmOrztGJJ2QjDKxxfRjukieiTh+StbynYbdjrZG/RUCJBKc3g4X5ORJEXOJ6pbYV
 UD+g==
X-Gm-Message-State: AOAM531puVBhxO7gKI5OFZvKrOp5hdBNVA7iPkZp2HcVGkODGL37MPsW
 J9AMSvCPCoy/05/smPAhIg==
X-Google-Smtp-Source: ABdhPJxK0nBPqpEDEQqhCocwWw4MLZJrj7QLVUvcaVIp7lyur2QYnCKC/D0WCkbo+F7ROcbQWU1Nyg==
X-Received: by 2002:a9d:6d99:: with SMTP id x25mr3399434otp.57.1602873220920; 
 Fri, 16 Oct 2020 11:33:40 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id y4sm1357005oou.38.2020.10.16.11.33.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 11:33:40 -0700 (PDT)
Received: (nullmailer pid 1698574 invoked by uid 1000);
 Fri, 16 Oct 2020 18:33:39 -0000
Date: Fri, 16 Oct 2020 13:33:39 -0500
From: Rob Herring <robh@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH 01/20] dt-bindings: usb: usb-hcd: Convert generic USB
 properties to DT schema
Message-ID: <20201016183339.GA1698518@bogus>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-2-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014101402.18271-2-Sergey.Semin@baikalelectronics.ru>
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

On Wed, 14 Oct 2020 13:13:43 +0300, Serge Semin wrote:
> The generic USB HCD properties have been described in the legacy bindings
> text file: Documentation/devicetree/bindings/usb/generic.txt . Let's
> convert it' content into the USB HCD DT schema properties so all USB DT
> nodes would be validated to have them properly utilized.
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
> ---
>  .../devicetree/bindings/usb/generic.txt       | 57 ------------
>  .../devicetree/bindings/usb/usb-hcd.yaml      | 88 +++++++++++++++++++
>  2 files changed, 88 insertions(+), 57 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/generic.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
