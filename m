Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8FC1DC043
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 22:34:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49S4HQ0nhWzDqXT
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 May 2020 06:34:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.166.193;
 helo=mail-il1-f193.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49S4F91T6zzDqSG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 May 2020 06:32:44 +1000 (AEST)
Received: by mail-il1-f193.google.com with SMTP id 18so4700325iln.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 May 2020 13:32:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eYhFWnym18cK56HOIXrwGvpqXxigL2vp9VHbqJW4HIM=;
 b=GmX9vRvkfo0HY91bEgAETOJCZ3laRMa1HGragrp7WOpeTERMNAeG8RK9QJUxCdiM+t
 jDjbSiirp2UiUbJuo93A6homwWqbusibhmGa6qR7FriLtTDnspmJBl+6Owd4+9D/6BFt
 jclbIxpqESlqH+xAjV/GNaUfIMy8eMJiNAZz88eColwV0fFFE0P8GKAxtkeoCbHZ5qld
 WDwq5Lp2EDd02OSdqEYc2IcRiMXKcCgnGO3Xb8sbk+5OOfy3B3sJmLcVGbAe75SDbKOa
 Href6Q8jYQBSZoDR+rW10gB7nzMjnyGlPrEwIV2yozNHwAAE3jzmJ2eiYsuXpQVr2X4l
 BFuw==
X-Gm-Message-State: AOAM533tKaZ8PQqh1qk+tlo76GZu/I8/akclCL9OVDlh8xvAl8lRkTYP
 KwDYcX205yXpXEdFSE/yrA==
X-Google-Smtp-Source: ABdhPJy5QvUn+VTDpkuNaZg6Rlk1g9vHBNfouawM73Pe8LYk585UL8czp90286VGTKxtQBwZeP8+kg==
X-Received: by 2002:a92:c7a2:: with SMTP id f2mr5670636ilk.71.1590006761646;
 Wed, 20 May 2020 13:32:41 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id d12sm1884632ill.80.2020.05.20.13.32.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2020 13:32:40 -0700 (PDT)
Received: (nullmailer pid 503923 invoked by uid 1000);
 Wed, 20 May 2020 20:32:39 -0000
Date: Wed, 20 May 2020 14:32:39 -0600
From: Rob Herring <robh@kernel.org>
To: Xiaowei Bao <xiaowei.bao@nxp.com>
Subject: Re: [PATCH v6 01/11] PCI: designware-ep: Add multiple PFs support
 for DWC
Message-ID: <20200520203239.GA503864@bogus>
References: <20200314033038.24844-1-xiaowei.bao@nxp.com>
 <20200314033038.24844-2-xiaowei.bao@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200314033038.24844-2-xiaowei.bao@nxp.com>
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
Cc: roy.zang@nxp.com, lorenzo.pieralisi@arm.com, devicetree@vger.kernel.org,
 jingoohan1@gmail.com, Zhiqiang.Hou@nxp.com, linuxppc-dev@lists.ozlabs.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, leoyang.li@nxp.com,
 Minghuan.Lian@nxp.com, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, gustavo.pimentel@synopsys.com,
 bhelgaas@google.com, andrew.murray@arm.com, kishon@ti.com, shawnguo@kernel.org,
 mingkai.hu@nxp.com, amurray@thegoodpenguin.co.uk
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 14 Mar 2020 11:30:28 +0800, Xiaowei Bao wrote:
> Add multiple PFs support for DWC, due to different PF have different
> config space, we use func_conf_select callback function to access
> the different PF's config space, the different chip company need to
> implement this callback function when use the DWC IP core and intend
> to support multiple PFs feature.
> 
> Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
> Acked-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
> ---
> v2:
>  - Remove duplicate redundant code.
>  - Reimplement the PF config space access way.
> v3:
>  - Integrate duplicate code for func_select.
>  - Move PCIE_ATU_FUNC_NUM(pf) (pf << 20) to ((pf) << 20).
>  - Add the comments for func_conf_select function.
> v4:
>  - Correct the commit message.
> v5:
>  - No change.
> v6:
>  - No change.
> 
>  drivers/pci/controller/dwc/pcie-designware-ep.c | 123 ++++++++++++++++--------
>  drivers/pci/controller/dwc/pcie-designware.c    |  59 ++++++++----
>  drivers/pci/controller/dwc/pcie-designware.h    |  18 +++-
>  3 files changed, 142 insertions(+), 58 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
