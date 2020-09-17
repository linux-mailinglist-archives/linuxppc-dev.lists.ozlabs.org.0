Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7B626E090
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 18:23:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bsj1r46kMzDqLZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 02:23:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=lorenzo.pieralisi@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Bshyn5HLlzDqLZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Sep 2020 02:20:28 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4C88412FC;
 Thu, 17 Sep 2020 09:20:25 -0700 (PDT)
Received: from e121166-lin.cambridge.arm.com (e121166-lin.cambridge.arm.com
 [10.1.196.255])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D90443F68F;
 Thu, 17 Sep 2020 09:20:22 -0700 (PDT)
Date: Thu, 17 Sep 2020 17:20:17 +0100
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: Zhiqiang Hou <Zhiqiang.Hou@nxp.com>
Subject: Re: [PATCHv7 00/12]PCI: dwc: Add the multiple PF support for DWC and
 Layerscape
Message-ID: <20200917162017.GA6830@e121166-lin.cambridge.arm.com>
References: <20200811095441.7636-1-Zhiqiang.Hou@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200811095441.7636-1-Zhiqiang.Hou@nxp.com>
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
Cc: devicetree@vger.kernel.org, andrew.murray@arm.com, roy.zang@nxp.com,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, leoyang.li@nxp.com,
 minghuan.Lian@nxp.com, jingoohan1@gmail.com, robh+dt@kernel.org,
 mingkai.hu@nxp.com, gustavo.pimentel@synopsys.com, bhelgaas@google.com,
 shawnguo@kernel.org, kishon@ti.com, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 11, 2020 at 05:54:29PM +0800, Zhiqiang Hou wrote:
> From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> 
> Add the PCIe EP multiple PF support for DWC and Layerscape, and use
> a list to manage the PFs of each PCIe controller; add the doorbell
> MSIX function for DWC; and refactor the Layerscape EP driver due to
> some difference in Layercape platforms PCIe integration.
> 
> Hou Zhiqiang (1):
>   misc: pci_endpoint_test: Add driver data for Layerscape PCIe
>     controllers
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
>  .../bindings/pci/layerscape-pci.txt           |   2 +
>  .../arm64/boot/dts/freescale/fsl-ls1088a.dtsi |  31 +++
>  drivers/misc/pci_endpoint_test.c              |   8 +-
>  .../pci/controller/dwc/pci-layerscape-ep.c    | 100 +++++--
>  .../pci/controller/dwc/pcie-designware-ep.c   | 258 ++++++++++++++----
>  drivers/pci/controller/dwc/pcie-designware.c  |  59 ++--
>  drivers/pci/controller/dwc/pcie-designware.h  |  48 +++-
>  7 files changed, 410 insertions(+), 96 deletions(-)

Side note: I will change it for you but please keep Signed-off-by:
tags together in the log instead of mixing them with other tags
randomly.

Can you rebase this series against my pci/dwc branch please and
send a v8 ?

I will apply it then.

Thanks,
Lorenzo
