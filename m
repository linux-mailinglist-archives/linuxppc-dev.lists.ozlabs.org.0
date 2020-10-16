Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B41B3290BAC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Oct 2020 20:49:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CCZv51GxfzDqNb
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Oct 2020 05:49:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.195;
 helo=mail-oi1-f195.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CCZrb0DKkzDqj1
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Oct 2020 05:47:09 +1100 (AEDT)
Received: by mail-oi1-f195.google.com with SMTP id u17so3546216oie.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Oct 2020 11:47:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8zDeag4KGqmKT8c+d4RekR3O6YxnQntnp7Q/reDb+L8=;
 b=deBVvrZPKw2Z1PSY9TZTi4a1Llwd2r15EZTOBqngOiJ1kT0cTSRk7E3RrG9b4DS8pM
 5uI7A1BbxQmt7iO3TSfDM8Id2JZ3Ed2F9X+AUhhsVekAJWyatm36MLtEFsAkH4/AC/ll
 kv7xJdZOoUc1pUeKIwFrzDDEtnunHrBH0NlMp09jMSQNPSItA59R+7q3z4JUk15+z1m5
 411/L2ONPTeZ60MZKfV12JKwbcOsNurnZDeV7MG0waE0quLsW+84kXQbYj9+UKgSscgH
 nWk7XgSXFg4dA4I+htDYOy6UlMNWfHcmi04RKnu2GnuyLEsQU57Xl6G3bzEpls8tNTPY
 Rgzw==
X-Gm-Message-State: AOAM532gexyLVD2NLzNL3IR9BqEnes+4KVOnBystz+qSGrGypNQwquLY
 0+wDAyRCy9ApNI/f+brdXw==
X-Google-Smtp-Source: ABdhPJyENso3SKw3F4zLfI0AJYdmFcov/RsupjIYFRIArytE0XwOHw7L8ThI9GD3vqlzQ1CWLvOUKQ==
X-Received: by 2002:a54:438f:: with SMTP id u15mr3503365oiv.162.1602874027264; 
 Fri, 16 Oct 2020 11:47:07 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id k23sm1379873ool.5.2020.10.16.11.47.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 11:47:06 -0700 (PDT)
Received: (nullmailer pid 1729036 invoked by uid 1000);
 Fri, 16 Oct 2020 18:47:05 -0000
Date: Fri, 16 Oct 2020 13:47:05 -0500
From: Rob Herring <robh@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH 04/20] dt-bindings: usb: usb-hcd: Add "tpl-support"
 property
Message-ID: <20201016184705.GA1728990@bogus>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-5-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014101402.18271-5-Sergey.Semin@baikalelectronics.ru>
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

On Wed, 14 Oct 2020 13:13:46 +0300, Serge Semin wrote:
> The host controller device might be designed to work for the particular
> products or applications. In that case its DT node is supposed to be
> equipped with the tpl-support property.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> ---
> 
> Changelog v2:
> - Grammar fix: "s/it'/its"
> - Discard '|' from the property description, since we don't need to preserve
>   the text formatting.
> ---
>  Documentation/devicetree/bindings/usb/usb-hcd.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
