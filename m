Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F236E264CAF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 20:20:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BnRy90vT9zDqLB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 04:20:17 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnRvc5ptQzDqFw
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Sep 2020 04:18:04 +1000 (AEST)
Received: by mail-il1-f196.google.com with SMTP id b17so6621026ilh.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Sep 2020 11:18:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Km+ilfssoEe+/1p9cVPzW4JFS2R1ND0MVv0bL/RJ3KA=;
 b=fPLkGFiR9fdZqfETfGGE5Te6cWkJ2yfgReIyuhUIfIvGQU/Eoo3E6yXJZHcpF3J36I
 /YGtbqcbXjBTwME2Uwylnpx0i+1199OEzMOuwKCITya7AgRffcu7yxoEJZX5WwmzQ5Oi
 bbIsykTxEG+6Rm81+IKZTqN3u+Kf2+KscWsrVpA1JDrVE3IoK7v3FxHB+D02EfNqjxlV
 Cm8cfDqTXmwRynccjvbCVf5tX93yLTdwjkjaPMr5VfQUmTbeoxdHTySzHr2VEctc0z2o
 HoTcg720ZiGwJuT52zLKrvUYPiKYlvxIwOZqRfM3c7cL3TIJrrv48VW8u+x/aDytQV9B
 BYYg==
X-Gm-Message-State: AOAM533aM4h0Osna2t3aywr6x5gLGL0QhkYd7yGTHps4kDjqkeYRcZ8m
 BghD1XHjkjHrs5IPpKSANA==
X-Google-Smtp-Source: ABdhPJy+jchPNAOwGP+KNIMYqdpVqnrsL4xX8ntPRCH549LF5iQzWhwqkjz2WczcZQva+Hj27kd1qg==
X-Received: by 2002:a92:9186:: with SMTP id e6mr8300661ill.278.1599761882138; 
 Thu, 10 Sep 2020 11:18:02 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id y10sm3147009ioy.25.2020.09.10.11.17.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 11:18:01 -0700 (PDT)
Received: (nullmailer pid 622379 invoked by uid 1000);
 Thu, 10 Sep 2020 18:17:56 -0000
Date: Thu, 10 Sep 2020 12:17:56 -0600
From: Rob Herring <robh@kernel.org>
To: Zhiqiang Hou <Zhiqiang.Hou@nxp.com>
Subject: Re: [PATCHv7 12/12] misc: pci_endpoint_test: Add driver data for
 Layerscape PCIe controllers
Message-ID: <20200910181756.GA622331@bogus>
References: <20200811095441.7636-1-Zhiqiang.Hou@nxp.com>
 <20200811095441.7636-13-Zhiqiang.Hou@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200811095441.7636-13-Zhiqiang.Hou@nxp.com>
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
Cc: roy.zang@nxp.com, lorenzo.pieralisi@arm.com, jingoohan1@gmail.com,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 leoyang.li@nxp.com, kishon@ti.com, minghuan.Lian@nxp.com,
 devicetree@vger.kernel.org, robh+dt@kernel.org, mingkai.hu@nxp.com,
 linux-pci@vger.kernel.org, bhelgaas@google.com, andrew.murray@arm.com,
 gustavo.pimentel@synopsys.com, shawnguo@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 11 Aug 2020 17:54:41 +0800, Zhiqiang Hou wrote:
> From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> 
> The commit 0a121f9bc3f5 ("misc: pci_endpoint_test: Use streaming DMA
> APIs for buffer allocation") changed to use streaming DMA APIs, however,
> dma_map_single() might not return a 4KB aligned address, so add the
> default_data as driver data for Layerscape PCIe controllers to make it
> 4KB aligned.
> 
> Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> ---
> V7:
>  - New patch.
> 
>  drivers/misc/pci_endpoint_test.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
