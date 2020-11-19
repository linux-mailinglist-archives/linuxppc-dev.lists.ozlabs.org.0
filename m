Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 942332B908C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Nov 2020 12:03:52 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CcGyF1y2qzDqQ1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Nov 2020 22:03:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=lorenzo.pieralisi@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4CcGwY1011zDqld
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Nov 2020 22:02:15 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 627981396;
 Thu, 19 Nov 2020 03:02:11 -0800 (PST)
Received: from red-moon.arm.com (unknown [10.57.61.203])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 02D183F718;
 Thu, 19 Nov 2020 03:02:03 -0800 (PST)
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 00/16] PCI: dwc: Another round of clean-ups
Date: Thu, 19 Nov 2020 11:01:58 +0000
Message-Id: <160578351748.1677.14217204071434748520.b4-ty@arm.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20201105211159.1814485-1-robh@kernel.org>
References: <20201105211159.1814485-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-pci@vger.kernel.org,
 Binghui Wang <wangbinghui@hisilicon.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-arm-kernel@axis.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jonathan Chocron <jonnyc@amazon.com>, Shawn Guo <shawnguo@kernel.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, Fabio Estevam <festevam@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Jesper Nilsson <jesper.nilsson@axis.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, Pratyush Anand <pratyush.anand@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Murali Karicheri <m-karicheri2@ti.com>, NXP Linux Team <linux-imx@nxp.com>,
 Xiaowei Song <songxiaowei@hisilicon.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Richard Zhu <hongxing.zhu@nxp.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Yue Wang <yue.wang@Amlogic.com>, linux-samsung-soc@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, Mingkai Hu <mingkai.hu@nxp.com>,
 linux-arm-kernel@lists.infradead.org, Roy Zang <roy.zang@nxp.com>,
 Minghuan Lian <minghuan.Lian@nxp.com>, Jingoo Han <jingoohan1@gmail.com>,
 Andy Gross <agross@kernel.org>, Vidya Sagar <vidyas@nvidia.com>,
 Stanimir Varbanov <svarbanov@mm-sol.com>, Kukjin Kim <kgene@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 linuxppc-dev@lists.ozlabs.org, Lucas Stach <l.stach@pengutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 5 Nov 2020 15:11:43 -0600, Rob Herring wrote:
> Here's another batch of DWC PCI host refactoring. This series primarily
> moves more of the MSI, link up, and resource handling to the core
> code. Beyond a couple of minor fixes, new in this version is runtime
> detection of iATU regions instead of using DT properties.
> 
> No doubt I've probably broken something. Please test. I've run this thru
> kernelci and checked boards with DWC PCI which currently is just
> Layerscape boards (hint: add boards and/or enable PCI). A git branch is
> here[1].
> 
> [...]

Applied to pci/dwc, thanks!

[01/16] PCI: dwc: Support multiple ATU memory regions
        https://git.kernel.org/lpieralisi/pci/c/9f9e59a480
[02/16] PCI: dwc/intel-gw: Move ATU offset out of driver match data
        https://git.kernel.org/lpieralisi/pci/c/1d567aac46
[03/16] PCI: dwc: Move "dbi", "dbi2", and "addr_space" resource setup into common code
        https://git.kernel.org/lpieralisi/pci/c/a0fd361db8
[04/16] PCI: dwc/intel-gw: Remove some unneeded function wrappers
        https://git.kernel.org/lpieralisi/pci/c/1cc9a55999
[05/16] PCI: dwc: Ensure all outbound ATU windows are reset
        https://git.kernel.org/lpieralisi/pci/c/458ad06c4c
[06/16] PCI: dwc/dra7xx: Use the common MSI irq_chip
        https://git.kernel.org/lpieralisi/pci/c/7f170d35f5
[07/16] PCI: dwc: Drop the .set_num_vectors() host op
        https://git.kernel.org/lpieralisi/pci/c/331e9bcead
[08/16] PCI: dwc: Move MSI interrupt setup into DWC common code
        https://git.kernel.org/lpieralisi/pci/c/5bcb1757e6
[09/16] PCI: dwc: Rework MSI initialization
        https://git.kernel.org/lpieralisi/pci/c/f78f02638a
[10/16] PCI: dwc: Move link handling into common code
        https://git.kernel.org/lpieralisi/pci/c/886a9c1347
[11/16] PCI: dwc: Move dw_pcie_msi_init() into core
        https://git.kernel.org/lpieralisi/pci/c/59fbab1ae4
[12/16] PCI: dwc: Move dw_pcie_setup_rc() to DWC common code
        https://git.kernel.org/lpieralisi/pci/c/b9ac0f9dc8
[13/16] PCI: dwc: Remove unnecessary wrappers around dw_pcie_host_init()
        https://git.kernel.org/lpieralisi/pci/c/60f5b73fa0
[14/16] Revert "PCI: dwc/keystone: Drop duplicated 'num-viewport'"
        https://git.kernel.org/lpieralisi/pci/c/fcde397422
[15/16] PCI: dwc: Move inbound and outbound windows to common struct
        https://git.kernel.org/lpieralisi/pci/c/9ca17af552
[16/16] PCI: dwc: Detect number of iATU windows
        https://git.kernel.org/lpieralisi/pci/c/281f1f99cf

Thanks,
Lorenzo
