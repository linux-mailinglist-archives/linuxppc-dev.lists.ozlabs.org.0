Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C7615F0745
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2019 21:51:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4772035kdtzF55k
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 07:51:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=lorenzo.pieralisi@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4771y63Y8LzF4mc
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2019 07:49:58 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF31412FC;
 Tue,  5 Nov 2019 12:49:56 -0800 (PST)
Received: from e121166-lin.cambridge.arm.com (e121166-lin.cambridge.arm.com
 [10.1.196.255])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 96B3340139;
 Tue,  5 Nov 2019 04:32:50 -0800 (PST)
Date: Tue, 5 Nov 2019 12:32:40 +0000
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: Xiaowei Bao <xiaowei.bao@nxp.com>
Subject: Re: [PATCH v6 3/3] PCI: layerscape: Add LS1028a support
Message-ID: <20191105123233.GA26960@e121166-lin.cambridge.arm.com>
References: <20190902034319.14026-1-xiaowei.bao@nxp.com>
 <20190902034319.14026-3-xiaowei.bao@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190902034319.14026-3-xiaowei.bao@nxp.com>
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
Cc: mark.rutland@arm.com, roy.zang@nxp.com, devicetree@vger.kernel.org,
 linux-pci@vger.kernel.org, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 leoyang.li@nxp.com, minghuan.Lian@nxp.com, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, bhelgaas@google.com, shawnguo@kernel.org,
 mingkai.hu@nxp.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 02, 2019 at 11:43:19AM +0800, Xiaowei Bao wrote:
> Add support for the LS1028a PCIe controller.
> 
> Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
> Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> ---
> v2:
>  - No change.
> v3:
>  - Reuse the ls2088 driver data structurt.
> v4:
>  - No change.
> v5:
>  - No change.
> v6:
>  - No change.
> 
>  drivers/pci/controller/dwc/pci-layerscape.c | 1 +
>  1 file changed, 1 insertion(+)

I have not seen any comment on any layerscape driver patches
coming from the maintainers as listed in the MAINTAINERS
file (and CCed in this series).

I request maintainers ACK on these patches and I expect them
to start reviewing your code if they want to be still considered
maintainers for this driver.

The changes look OK minus Shawn's remark on compatible string
that was ignored.

Thanks,
Lorenzo

> diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
> index 3a5fa26..f24f79a 100644
> --- a/drivers/pci/controller/dwc/pci-layerscape.c
> +++ b/drivers/pci/controller/dwc/pci-layerscape.c
> @@ -263,6 +263,7 @@ static const struct ls_pcie_drvdata ls2088_drvdata = {
>  static const struct of_device_id ls_pcie_of_match[] = {
>  	{ .compatible = "fsl,ls1012a-pcie", .data = &ls1046_drvdata },
>  	{ .compatible = "fsl,ls1021a-pcie", .data = &ls1021_drvdata },
> +	{ .compatible = "fsl,ls1028a-pcie", .data = &ls2088_drvdata },
>  	{ .compatible = "fsl,ls1043a-pcie", .data = &ls1043_drvdata },
>  	{ .compatible = "fsl,ls1046a-pcie", .data = &ls1046_drvdata },
>  	{ .compatible = "fsl,ls2080a-pcie", .data = &ls2080_drvdata },
> -- 
> 2.9.5
> 
