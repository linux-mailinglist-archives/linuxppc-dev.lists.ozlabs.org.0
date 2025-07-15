Return-Path: <linuxppc-dev+bounces-10269-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF6CB0690F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jul 2025 00:08:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bhYGV1XJ6z2xRt;
	Wed, 16 Jul 2025 08:08:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752617282;
	cv=none; b=ffKDg5bwEwlxAPpr5NXYZXc+LyuSmhTbMwNjkW6zptstON6Aeq+JErxZ/7KifL5/ARgQL9CcEIZJVteyNzm08Dz2S3pyYhH8nOCYQF2f/cGcDJAI+fGHb4iKwVQNnwimjrPF0aC48p/0lanxGDC1U3FrWg3WTFhDEw30KccIqu4fKRU3ydTMvOwnyyKGSREMsWy1NIB+iLjyHnHF5xkHuiN6bFXX6QvcdFCpXVO4f1i9kYIPmgdwlyiPlG9zVxDawLR3sgbKstbTF04os8+hcqUnx629Rn2EZDsU6/tYKVTZhs/S/i9DhZpqeZBWI6v6xcP7xvFAKdp6j134NHJ/ew==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752617282; c=relaxed/relaxed;
	bh=xCjFTC+lBcLfHEqDsxskR5M7UxBXsuhZo4MBiiHpZTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UYIVwlMmi6KDp1YUVIiu7t9dfT6kde6p2PTpRvTt5yQ6NfVOeEqpt9oetWD2MQYiiRr34o47NxtsOB5NqMqioSORKFyUavjGpg9c3CgQmPyrBf6W+STQRq5azpI2dk1nch19B8jlWcyQdwNoIto2rU+W/8MxqBpxIZ7/F3TRiY0XZn9JcKDVJU/qGuM2Rg4zryAjfq6I3Zgo+VTT2NKPbetr1Z98Li1JvCtd+nxdMkXBgIKonXtrac4i8LJkPiZ88J/y4uGbgCdDRM6f2hQbs28ksQFEbbNvbSMUxROIKtH9g8laNrVvWDwokW/uqxwnruGydDXM6eZSckWL0ewknw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=btGVSIKm; dkim-atps=neutral; spf=pass (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=btGVSIKm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bhYGP3jFXz2xQ5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Jul 2025 08:07:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752617280; x=1784153280;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vnRZObHgS0QjJyF2yT7e0Wftl8BxleHhpS9kJZodEzg=;
  b=btGVSIKmumHCvRdnMCUT70vHVkYkh0QOfg8s1gfqRIN6mQKckpOsITe5
   wTkwTPsM+EeOhIVAjGJRAvRQk9w5SEWKUb86fk6prVy3sR47OwgFFF0Gu
   iTxdW9/c28ndoZJErukPB0rSYE/OUTn3D4fgFsuK4VioffYNGaqwsylpn
   xBiZMFfJlqxC97s4Krp5ZB/dZjWbrrcxJkzhqhx8RP4yQDJPFTyB0kiIy
   ArddH6GqufDIdKxngI5zMKt6AsyBozTo+oQ3oDs1Tx11aFKSG03GWnVYT
   kIbYPvmfPh+SOuXU4GFWRWndkuag29ieNOwdoHt0fU42u8q6oxA+iFebU
   A==;
X-CSE-ConnectionGUID: 05cfwcqBT/W5IQ8hrsrc3A==
X-CSE-MsgGUID: vYIuuL3SQdetHXULuXH+LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="58619888"
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; 
   d="scan'208";a="58619888"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 15:07:52 -0700
X-CSE-ConnectionGUID: 7W8UrI6GSh+JssxH0CVzMQ==
X-CSE-MsgGUID: 0LiZ2H85TZeeeyLgzoEo6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; 
   d="scan'208";a="161357586"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 15 Jul 2025 15:07:46 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubnoO-000Bab-1J;
	Tue, 15 Jul 2025 22:07:44 +0000
Date: Wed, 16 Jul 2025 06:06:55 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Bjorn Helgaas <helgaas@kernel.org>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>, Will Deacon <will@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Niklas Cassel <cassel@kernel.org>,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: Re: [PATCH v5 2/4] PCI: host-common: Add link down handling for Root
 Ports
Message-ID: <202507160557.oy6ZGYI7-lkp@intel.com>
References: <20250715-pci-port-reset-v5-2-26a5d278db40@oss.qualcomm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715-pci-port-reset-v5-2-26a5d278db40@oss.qualcomm.com>
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Manivannan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 19272b37aa4f83ca52bdf9c16d5d81bdd1354494]

url:    https://github.com/intel-lab-lkp/linux/commits/Manivannan-Sadhasivam/PCI-ERR-Add-support-for-resetting-the-Root-Ports-in-a-platform-specific-way/20250715-160430
base:   19272b37aa4f83ca52bdf9c16d5d81bdd1354494
patch link:    https://lore.kernel.org/r/20250715-pci-port-reset-v5-2-26a5d278db40%40oss.qualcomm.com
patch subject: [PATCH v5 2/4] PCI: host-common: Add link down handling for Root Ports
config: i386-buildonly-randconfig-003-20250716 (https://download.01.org/0day-ci/archive/20250716/202507160557.oy6ZGYI7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250716/202507160557.oy6ZGYI7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507160557.oy6ZGYI7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/nfc/s3fwrn5/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nfc/s3fwrn5/phy_common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nfc/st-nci/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nfc/st-nci/ndlc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nfc/st-nci/se.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nfc/st-nci/vendor_cmds.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nfc/st21nfca/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nfc/st21nfca/dep.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nfc/st21nfca/se.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nfc/st21nfca/vendor_cmds.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nfc/st95hf/spi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/ntb/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/ntb/msi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nubus/bus.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nubus/nubus.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nvdimm/btt.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nvdimm/btt_devs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nvdimm/bus.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nvdimm/claim.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nvdimm/dax_devs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nvdimm/dimm_devs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nvdimm/namespace_devs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nvdimm/nd_perf.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nvdimm/nd_virtio.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nvdimm/pfn_devs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nvdimm/region_devs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nvme/common/auth.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nvme/common/keyring.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nvme/host/auth.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nvme/host/constants.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nvme/host/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nvme/host/fabrics.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nvme/host/fault_inject.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nvme/host/fc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nvme/host/multipath.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nvme/host/sysfs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nvme/target/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nvme/target/fc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/nvmem/layouts.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/of/address.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/of/base.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/of/cpu.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/of/device.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/of/dynamic.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/of/fdt.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/of/irq.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/of/module.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/of/of_kunit_helpers.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/of/of_reserved_mem.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/of/overlay.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/of/platform.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/of/property.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/of/resolver.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/parisc/eisa.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/parisc/gsc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/parisc/iosapic.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/parisc/sba_iommu.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/parport/ieee1284.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/parport/ieee1284_ops.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/parport/parport_pc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/parport/share.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/access.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/bus.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/controller/cadence/pcie-cadence-ep.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/controller/cadence/pcie-cadence-host.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/controller/cadence/pcie-cadence.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/controller/dwc/pcie-designware-ep.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/controller/dwc/pcie-designware-host.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/controller/dwc/pcie-designware.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/controller/dwc/pcie-qcom-common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/controller/pci-host-common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/controller/pci-hyperv-intf.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/controller/pcie-iproc-msi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/controller/pcie-iproc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/controller/pcie-rockchip.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/controller/plda/pcie-plda-host.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/devres.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/doe.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/ecam.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/endpoint/pci-ep-cfs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/endpoint/pci-epc-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/endpoint/pci-epc-mem.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/endpoint/pci-epf-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/host-bridge.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/hotplug/acpi_pcihp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/hotplug/acpiphp_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/hotplug/cpci_hotplug_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/hotplug/pci_hotplug_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/hotplug/pnv_php.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/hotplug/rpaphp_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/hotplug/rpaphp_slot.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/msi/irqdomain.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/of.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/p2pdma.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/pci-acpi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/pci-bridge-emul.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/pci-driver.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/pci.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/pcie/aer.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/pcie/aspm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
>> drivers/pci/pcie/err.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/pcie/portdrv.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/pcie/ptm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/probe.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/remove.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/search.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/setup-bus.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/slot.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/switch/switchtec.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/tph.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/vgaarb.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pcmcia/cistpl.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pcmcia/cs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pcmcia/ds.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pcmcia/max1600.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pcmcia/pcmcia_cis.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pcmcia/pcmcia_resource.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pcmcia/pxa2xx_base.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pcmcia/rsrc_iodyn.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pcmcia/rsrc_mgr.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pcmcia/rsrc_nonstatic.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pcmcia/sa11xx_base.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pcmcia/soc_common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/peci/cpu.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/peci/device.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/perf/arm_cspmu/arm_cspmu.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/perf/hisilicon/hisi_uncore_pmu.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/perf/riscv_pmu_sbi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/phy/allwinner/phy-sun4i-usb.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/phy/tegra/xusb-tegra124.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/phy/tegra/xusb-tegra186.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/phy/tegra/xusb-tegra210.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/phy/tegra/xusb.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/phy/ti/phy-omap-control.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/phy/ti/phy-omap-usb2.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pinctrl/devicetree.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pinctrl/freescale/pinctrl-imx.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pinctrl/freescale/pinctrl-scu.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pinctrl/intel/pinctrl-intel.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pinctrl/mediatek/mtk-eint.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pinctrl/mediatek/pinctrl-paris.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pinctrl/meson/pinctrl-meson.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pinctrl/meson/pinctrl-meson8-pmx.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pinctrl/pinconf-generic.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pinctrl/pinmux.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pinctrl/pxa/pinctrl-pxa2xx.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pinctrl/qcom/pinctrl-lpass-lpi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pinctrl/qcom/pinctrl-msm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pinctrl/realtek/pinctrl-rtd.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pinctrl/sprd/pinctrl-sprd.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pinctrl/tegra/pinctrl-tegra-xusb.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/arm64/huawei-gaokun-ec.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/arm64/lenovo-yoga-c630.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/chrome/cros_ec.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/chrome/cros_ec_lpc_mec.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/chrome/cros_ec_proto.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/chrome/cros_ec_sensorhub_ring.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/chrome/cros_usbpd_notify.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/chrome/wilco_ec/mailbox.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/cznic/turris-omnia-mcu-base.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/cznic/turris-signing-key.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/olpc/olpc-ec.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/surface/aggregator/bus.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/surface/aggregator/controller.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/surface/aggregator/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/surface/aggregator/ssh_packet_layer.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/surface/surface_acpi_notify.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/amd/hsmp/hsmp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/amd/hsmp/hwmon.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/amd/wbrf.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/asus-wmi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/dell/dcdbas.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/dell/dell-rbtn.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/dell/dell-smbios-base.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/dell/dell-wmi-descriptor.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/dell/dell-wmi-privacy.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/firmware_attributes_class.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/ideapad-laptop.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/intel/int3472/common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/intel/int3472/discrete.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/intel/pmc/ssram_telemetry.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/intel/pmt/class.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/intel/pmt/telemetry.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/intel/punit_ipc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/intel/speed_select_if/isst_if_common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/intel/telemetry/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/intel/vsec.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/intel/vsec_tpmi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/intel_ips.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/intel_scu_ipc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/mxm-wmi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/siemens/simatic-ipc-batt.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/wmi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pmdomain/actions/owl-sps-helper.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pmdomain/rockchip/pm-domains.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pnp/card.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

