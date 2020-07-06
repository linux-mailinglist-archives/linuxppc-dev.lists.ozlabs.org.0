Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FF52155CF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jul 2020 12:48:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B0j3n2wHrzDqZC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jul 2020 20:48:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=lorenzo.pieralisi@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4B0j1T45PlzDqSq
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jul 2020 20:46:48 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CB54530E;
 Mon,  6 Jul 2020 03:46:44 -0700 (PDT)
Received: from e121166-lin.cambridge.arm.com (e121166-lin.cambridge.arm.com
 [10.1.196.255])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 511D43F68F;
 Mon,  6 Jul 2020 03:46:42 -0700 (PDT)
Date: Mon, 6 Jul 2020 11:46:39 +0100
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: Xiaowei Bao <xiaowei.bao@nxp.com>
Subject: Re: [PATCH v6 00/11] Add the multiple PF support for DWC and
 Layerscape
Message-ID: <20200706104639.GC26377@e121166-lin.cambridge.arm.com>
References: <20200314033038.24844-1-xiaowei.bao@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200314033038.24844-1-xiaowei.bao@nxp.com>
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
Cc: roy.zang@nxp.com, devicetree@vger.kernel.org, jingoohan1@gmail.com,
 Zhiqiang.Hou@nxp.com, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, leoyang.li@nxp.com, Minghuan.Lian@nxp.com,
 robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 gustavo.pimentel@synopsys.com, bhelgaas@google.com, andrew.murray@arm.com,
 kishon@ti.com, shawnguo@kernel.org, mingkai.hu@nxp.com,
 amurray@thegoodpenguin.co.uk
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Mar 14, 2020 at 11:30:27AM +0800, Xiaowei Bao wrote:
> Add the PCIe EP multiple PF support for DWC and Layerscape, add
> the doorbell MSIX function for DWC, use list to manage the PF of
> one PCIe controller, and refactor the Layerscape EP driver due to
> some platforms difference.
> 
> Xiaowei Bao (11):
>   PCI: designware-ep: Add multiple PFs support for DWC
>   PCI: designware-ep: Add the doorbell mode of MSI-X in EP mode
>   PCI: designware-ep: Move the function of getting MSI capability
>     forward
>   PCI: designware-ep: Modify MSI and MSIX CAP way of finding
>   dt-bindings: pci: layerscape-pci: Add compatible strings for ls1088a
>     and ls2088a
>   PCI: layerscape: Fix some format issue of the code
>   PCI: layerscape: Modify the way of getting capability with different
>     PEX
>   PCI: layerscape: Modify the MSIX to the doorbell mode
>   PCI: layerscape: Add EP mode support for ls1088a and ls2088a
>   arm64: dts: layerscape: Add PCIe EP node for ls1088a
>   misc: pci_endpoint_test: Add LS1088a in pci_device_id table
> 
>  .../devicetree/bindings/pci/layerscape-pci.txt     |   2 +
>  arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi     |  31 +++
>  drivers/misc/pci_endpoint_test.c                   |   2 +
>  drivers/pci/controller/dwc/pci-layerscape-ep.c     | 100 ++++++--
>  drivers/pci/controller/dwc/pcie-designware-ep.c    | 255 +++++++++++++++++----
>  drivers/pci/controller/dwc/pcie-designware.c       |  59 +++--
>  drivers/pci/controller/dwc/pcie-designware.h       |  48 +++-
>  7 files changed, 404 insertions(+), 93 deletions(-)

Can you rebase it against v5.8-rc1 please ?

Thanks,
Lorenzo
