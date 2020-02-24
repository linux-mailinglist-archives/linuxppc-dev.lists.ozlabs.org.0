Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFD116A042
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2020 09:45:08 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48QwcK4gxDzDqSd
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2020 19:45:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=shawnguo@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=U0n5WXGR; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48QwZJ68cczDqSB
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Feb 2020 19:43:20 +1100 (AEDT)
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 543AB20661;
 Mon, 24 Feb 2020 08:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582533797;
 bh=9veiwHQ321Wt5pyHqEi/01Nw1+0zBBW21SsYQPjAqOc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U0n5WXGRRH/yQhjuQyGKM/mRikRUbqKQ4zz6qfsZ+Gowv69j8/VHm2lzuTmD9hJvn
 /kSOKy0zDgzWKceEvlzewW3AnxCtUEaQKmNAjGFnbeHsgsAY+AfCxD9MOMPm+D4G/x
 4Y6PxQOrEdSh8ieKEQVtvoGvSkQCfIglQ6GLai5k=
Date: Mon, 24 Feb 2020 16:43:10 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Michael Walle <michael@walle.cc>
Subject: Re: [PATCH v6 2/3] arm64: dts: ls1028a: Add PCIe controller DT nodes
Message-ID: <20200224084307.GD27688@dragon>
References: <20190902034319.14026-2-xiaowei.bao@nxp.com>
 <20200224081105.13878-1-michael@walle.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200224081105.13878-1-michael@walle.cc>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, lorenzo.pieralisi@arm.com,
 xiaowei.bao@nxp.com, roy.zang@nxp.com, linux-pci@vger.kernel.org,
 Zhiqiang.Hou@nxp.com, linux-kernel@vger.kernel.org, leoyang.li@nxp.com,
 minghuan.Lian@nxp.com, robh+dt@kernel.org, mingkai.hu@nxp.com,
 bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 24, 2020 at 09:11:05AM +0100, Michael Walle wrote:
> Hi Xiaowei, Hi Shawn,
> 
> > LS1028a implements 2 PCIe 3.0 controllers.
> 
> Patch 1/3 and 3/3 are in Linus' tree but nobody seems to care about this patch
> anymore :(
> 
> This doesn't work well with the IOMMU, because the iommu-map property is
> missing. The bootloader needs the &smmu phandle to fixup the entry. See
> below.
> 
> Shawn, will you add this patch to your tree once its fixed, considering it
> just adds the device tree node for the LS1028A?

The patch/thread is a bit aged.  You may want to send an updated patch
for discussion.

Shawn

> 
> > 
> > Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
> > Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
