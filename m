Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E93172D16E6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Dec 2020 17:55:56 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CqTw956GSzDqXd
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 03:55:53 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CqTs855h8zDqYK
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Dec 2020 03:53:16 +1100 (AEDT)
Received: by mail-ot1-f67.google.com with SMTP id d8so5147646otq.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Dec 2020 08:53:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7U3Yhw/pl02ZoaOBu+HcEPYWSZaSb6JEpp9JpxVMzwM=;
 b=Vgli/G4/RToqrLIolHTjLKyFOtfzhK6TkAX/2YdN5Gi57EOuwZDzvD1lrjFUnAyQbO
 D0G7w0h5zEKw5v0jkLuIGEBax3cBSEjydP75b8J1wRcfSw1V7tKbgILOatSkakAP3PzK
 +YUyDacExzqdH/brRtUSplrhUVXES+n6uqtiURDTKZMV5sCmIcyPbvEGQLjl9qN0uQzi
 3/1iGBQd+fyPoLPyk2I6SxuZ+XOEqFNG8RIRIx1kU/mz5bw++0AhUc8rpT9XmiCp1rPW
 bJ0+z/WFdLOMLNTdknyFFOsZsjIC9V7wTCznktxXj20MY/34Se867WH3aRjl1SXgLPF1
 NFEA==
X-Gm-Message-State: AOAM5312x2yTF3TyPlVXFdPKWhlxIq0iF07jI9CnZBH1WVG4YF2xnN1E
 v9Amqozj7jXZdqeASA9dNw==
X-Google-Smtp-Source: ABdhPJy7Q0USqnNLm3yD6fipjmEKQhCRZjQyZNGy1bziDJf63sFl8UXBj77WW4CCsAJh3BBAvF6/3A==
X-Received: by 2002:a9d:6b88:: with SMTP id b8mr13781346otq.60.1607359994430; 
 Mon, 07 Dec 2020 08:53:14 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id t5sm2754514oth.16.2020.12.07.08.53.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 08:53:13 -0800 (PST)
Received: (nullmailer pid 425824 invoked by uid 1000);
 Mon, 07 Dec 2020 16:53:12 -0000
Date: Mon, 7 Dec 2020 10:53:12 -0600
From: Rob Herring <robh@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH v5 19/19] dt-bindings: usb: intel, keembay-dwc3: Validate
 DWC3 sub-node
Message-ID: <20201207165312.GA425775@robh.at.kernel.org>
References: <20201205152427.29537-1-Sergey.Semin@baikalelectronics.ru>
 <20201205152427.29537-20-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201205152427.29537-20-Sergey.Semin@baikalelectronics.ru>
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
 Kevin Hilman <khilman@baylibre.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
 Andy Gross <agross@kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 linux-snps-arc@lists.infradead.org, devicetree@vger.kernel.org,
 Mathias Nyman <mathias.nyman@intel.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
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

On Sat, 05 Dec 2020 18:24:26 +0300, Serge Semin wrote:
> Intel Keem Bay DWC3 compatible DT nodes are supposed to have a DWC USB3
> compatible sub-node to describe a fully functioning USB interface. Let's
> use the available DWC USB3 DT schema to validate the Qualcomm DWC3
> sub-nodes.
> 
> Note since the generic DWC USB3 DT node is supposed to be named as generic
> USB HCD ("^usb(@.*)?") one we have to accordingly fix the sub-nodes name
> regexp and fix the DT node example.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> ---
> 
> Changelog v5:
> - This is a new patch created for the new Intel Keem Bay bindings file,
>   which has been added just recently.
> ---
>  .../devicetree/bindings/usb/intel,keembay-dwc3.yaml      | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
