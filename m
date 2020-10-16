Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A02B8290C30
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Oct 2020 21:21:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CCbcG5VLPzDqx2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Oct 2020 06:21:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.66; helo=mail-ot1-f66.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CCb2Q5t6FzDqSZ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Oct 2020 05:55:42 +1100 (AEDT)
Received: by mail-ot1-f66.google.com with SMTP id i12so3372988ota.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Oct 2020 11:55:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1qsbroh8jyH1La6q3n8nR798td9FmfS1E+IS46iSd8Y=;
 b=NkDVDbtyOBtiRSn78cS/txpMHes+/GdfVun7RrlqZTMEwsmA/dpgXw6yehEKGTzMv4
 sKHNBo8M0amgvaJf/io5pGBkEuUYlVZvALuwX+6SFVasWtek4sOKz662kGgVpssoD84B
 RUcpgBKSsZiN+OGBczS892FXQ3Bt1i8JESYVdEFlmYCOsqW9Ngs1StdLpvVf7vB0n0PQ
 +LzOJWopaMneCU5qHBwNTZeM42OsT77cq+AWxQLB9NIydISc4NNk2vG4V6MNmC8f/Dwf
 uPRuXu73crO1W+YPs5nJTt+7N5uAAO1Q3SeGv2J4AvdSjNl0qKt3DmK4HWH0CnRwoKgc
 R2zw==
X-Gm-Message-State: AOAM531o2eJvCkKt0F8Hd6wojM2bqF+SBxPOoUxlJFPX4t8ubn2apO05
 oO8Cc+5WJUKSP2qbywAwSQ==
X-Google-Smtp-Source: ABdhPJyNJLnYhDVNfMr5gJcHIknRErh64x3+ylvRK0oSof5GJesuJTLIUcPjJE1UUw/Qlq2TlHLyzA==
X-Received: by 2002:a9d:7752:: with SMTP id t18mr3718386otl.341.1602874538699; 
 Fri, 16 Oct 2020 11:55:38 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id w3sm1380171oop.4.2020.10.16.11.55.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 11:55:38 -0700 (PDT)
Received: (nullmailer pid 1741601 invoked by uid 1000);
 Fri, 16 Oct 2020 18:55:37 -0000
Date: Fri, 16 Oct 2020 13:55:37 -0500
From: Rob Herring <robh@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH 17/20] dt-bindings: usb: qcom, dwc3: Validate DWC3 sub-node
Message-ID: <20201016185537.GA1741555@bogus>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-18-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014101402.18271-18-Sergey.Semin@baikalelectronics.ru>
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
 Mathias Nyman <mathias.nyman@intel.com>, linux-arm-msm@vger.kernel.org,
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

On Wed, 14 Oct 2020 13:13:59 +0300, Serge Semin wrote:
> Qualcomm msm8996/sc7180/sdm845 DWC3 compatible DT nodes are supposed to
> have a DWC USB3 compatible sub-node to describe a fully functioning USB
> interface. Let's use the available DWC USB3 DT schema to validate the
> Qualcomm DWC3 sub-nodes.
> 
> Note since the generic DWC USB3 DT node is supposed to be named as generic
> USB HCD ("^usb(@.*)?") one we have to accordingly fix the sub-nodes name
> regexp and fix the DT node example.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> ---
> 
> Changelog v2:
> - Discard the "^dwc3@[0-9a-f]+$" nodes from being acceptable as sub-nodes.
> ---
>  Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
