Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 000911DC082
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 22:48:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49S4bY22WYzDqXw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 May 2020 06:48:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.166.196;
 helo=mail-il1-f196.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
 [209.85.166.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49S4XN4FhrzDqXJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 May 2020 06:45:56 +1000 (AEST)
Received: by mail-il1-f196.google.com with SMTP id j3so4692735ilk.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 May 2020 13:45:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PJPc6Xkos1JJWBSfHLuEWUb/ztU6JUGFozPRth5oI/s=;
 b=hQ+onAzG6ipUvGhxz4jO50wni/swRheDiRpBS5BD+Q8T7FjxyoPBZkv5OmCVAlq6Lf
 4yKJdD2kOkbFP1X3TOkYS7/MWExZJu2j4xsBmGBrvsK7JrO06kNFkb0Ae4h6bAeYq/0T
 fReZePSCTiqMe6QGQed2Q7gqb+VW0ILq7O1AZTHZO4fprZO+nJVUz5MmRcnOc55RhPil
 mZFs+ekS+nfBj+vPJ8Rd18vqikchY4SVCDUv24rPP6K18WM+n7azNWqhosJ/JiT2jpyT
 sG55q4D7FdaS2DGBlUUqDmshCscHZGFwPXhT3jsMKXu8uSOXqfrM+kN0OnL4nglL7xz7
 bKTA==
X-Gm-Message-State: AOAM531oGXygzKosbzIsP3oelAOsp12t/rCC9/KfGBSAdklf7j91H8q/
 +kRtvFi8wAzdJjj0V7hyiw==
X-Google-Smtp-Source: ABdhPJzA/vi82RIXoD3jiTdlM1ikMFygzPsAvXo0y2Xvb7bHzqzrE2GznTbs47Fup0foDkFLalmioA==
X-Received: by 2002:a92:8946:: with SMTP id n67mr5278356ild.215.1590007554470; 
 Wed, 20 May 2020 13:45:54 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id r8sm1531353iob.15.2020.05.20.13.45.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2020 13:45:54 -0700 (PDT)
Received: (nullmailer pid 535579 invoked by uid 1000);
 Wed, 20 May 2020 20:45:52 -0000
Date: Wed, 20 May 2020 14:45:52 -0600
From: Rob Herring <robh@kernel.org>
To: Xiaowei Bao <xiaowei.bao@nxp.com>
Subject: Re: [PATCH v6 07/11] PCI: layerscape: Modify the way of getting
 capability with different PEX
Message-ID: <20200520204552.GA535450@bogus>
References: <20200314033038.24844-1-xiaowei.bao@nxp.com>
 <20200314033038.24844-8-xiaowei.bao@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200314033038.24844-8-xiaowei.bao@nxp.com>
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
Cc: devicetree@vger.kernel.org, andrew.murray@arm.com,
 lorenzo.pieralisi@arm.com, roy.zang@nxp.com, gustavo.pimentel@synopsys.com,
 Zhiqiang.Hou@nxp.com, linux-kernel@vger.kernel.org, kishon@ti.com,
 Minghuan.Lian@nxp.com, jingoohan1@gmail.com, robh+dt@kernel.org,
 mingkai.hu@nxp.com, linux-pci@vger.kernel.org, bhelgaas@google.com,
 shawnguo@kernel.org, leoyang.li@nxp.com, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, amurray@thegoodpenguin.co.uk
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 14 Mar 2020 11:30:34 +0800, Xiaowei Bao wrote:
> The different PCIe controller in one board may be have different
> capability of MSI or MSIX, so change the way of getting the MSI
> capability, make it more flexible.
> 
> Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
> ---
> v2:
>  - Remove the repeated assignment code.
> v3:
>  - Use ep_func msi_cap and msix_cap to decide the msi_capable and
>    msix_capable of pci_epc_features struct.
> v4:
>  - No change.
> v5:
>  - No change.
> v6:
>  - No change.
> 
>  drivers/pci/controller/dwc/pci-layerscape-ep.c | 31 +++++++++++++++++++-------
>  1 file changed, 23 insertions(+), 8 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
