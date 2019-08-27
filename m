Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 576479F625
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 00:28:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46J3RZ0BPDzDqSj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 08:28:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.167.196; helo=mail-oi1-f196.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46J3PW1s4KzDqqK
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2019 08:26:22 +1000 (AEST)
Received: by mail-oi1-f196.google.com with SMTP id k22so518781oiw.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 15:26:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RsXxLyUlV4lqdtFyyPSn3Dwod1DhrS1XN9CvxX7CGqs=;
 b=Ta6xKypHA+Iinlnp0ZY3wh+J+g03b1pL2gzuP2/tjHYeem4pE5KEw4FAdAwNBFHwpw
 /I4AwngtluGMl9Z5iuegnilVUCo2ry1MkRYns/3KWk5OBZ/5Hz15xXxPCu1uqlpvs5dT
 dSkfJIefBP0cjb/Rn0zYkpT8gIUckNWnEpVdrH2ikHaT3zl8c81zy+LeEBk5P16Zu2L4
 LzMjKq4KbFZyYkamEhydQbJD8iNCxzHn9csYzgBC528D8f4t+F+2dIM4+GWd1baeHba+
 duEyauK3B0R+dA2fqzjKqTGdhgu8T1SmQfC9MMIrygXWxS+y6jvF6QfxNjRg6RCJfFDl
 VSNA==
X-Gm-Message-State: APjAAAWmpSdW617q9ixOmX7X/ARZ0IhD2p8ZfB32bscrG42k+uD2GX+P
 wctYx+nzO6sO/9wvCoM1gw==
X-Google-Smtp-Source: APXvYqy3XTy77RRAsfzmCAwhDWWJujML7UeMVZxJl+o+X2Va2w3R8MESfCjhk2TLGcKIC236QGmbgA==
X-Received: by 2002:aca:4b83:: with SMTP id y125mr712264oia.25.1566944779068; 
 Tue, 27 Aug 2019 15:26:19 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id k12sm170734oij.21.2019.08.27.15.26.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2019 15:26:18 -0700 (PDT)
Date: Tue, 27 Aug 2019 17:26:18 -0500
From: Rob Herring <robh@kernel.org>
To: Xiaowei Bao <xiaowei.bao@nxp.com>
Subject: Re: [PATCH v2 04/10] dt-bindings: pci: layerscape-pci: add
 compatible strings for ls1088a and ls2088a
Message-ID: <20190827222617.GA16361@bogus>
References: <20190822112242.16309-1-xiaowei.bao@nxp.com>
 <20190822112242.16309-4-xiaowei.bao@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190822112242.16309-4-xiaowei.bao@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: mark.rutland@arm.com, roy.zang@nxp.com, lorenzo.pieralisi@arm.co,
 arnd@arndb.de, devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
 linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, kishon@ti.com, minghuan.Lian@nxp.com,
 gustavo.pimentel@synopsys.com, jingoohan1@gmail.com, bhelgaas@google.com,
 andrew.murray@arm.com, leoyang.li@nxp.com, shawnguo@kernel.org,
 mingkai.hu@nxp.com, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 22, 2019 at 07:22:36PM +0800, Xiaowei Bao wrote:
> Add compatible strings for ls1088a and ls2088a.
> 
> Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
> ---
> v2:
>  - No change.
> 
>  Documentation/devicetree/bindings/pci/layerscape-pci.txt | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/layerscape-pci.txt b/Documentation/devicetree/bindings/pci/layerscape-pci.txt
> index e20ceaa..16f592e 100644
> --- a/Documentation/devicetree/bindings/pci/layerscape-pci.txt
> +++ b/Documentation/devicetree/bindings/pci/layerscape-pci.txt
> @@ -22,7 +22,10 @@ Required properties:
>          "fsl,ls1043a-pcie"
>          "fsl,ls1012a-pcie"
>    EP mode:
> -	"fsl,ls1046a-pcie-ep", "fsl,ls-pcie-ep"
> +	"fsl,ls-pcie-ep"

Wasn't this a fallback? Each line should be one valid combination of 
compatible strings.

> +	"fsl,ls1046a-pcie-ep"
> +	"fsl,ls1088a-pcie-ep"
> +	"fsl,ls2088a-pcie-ep"
>  - reg: base addresses and lengths of the PCIe controller register blocks.
>  - interrupts: A list of interrupt outputs of the controller. Must contain an
>    entry for each entry in the interrupt-names property.
> -- 
> 2.9.5
> 
