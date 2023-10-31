Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C597DD162
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Oct 2023 17:19:02 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=K8ukv2xC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SKb1J1BXyz3cVw
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Nov 2023 03:19:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=K8ukv2xC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SKb0Q4D2Cz3bZN
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Nov 2023 03:18:14 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 4813FB80E97;
	Tue, 31 Oct 2023 16:18:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC49EC433C7;
	Tue, 31 Oct 2023 16:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698769080;
	bh=HCX1df8KCBHXTAnQTau8yrSKPJ1ZZEmzSDDHwuNCfSQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=K8ukv2xCzOKe8u1Ay0pk568Vgiy0KmGaE6zOcWpgpdwjdD16//wndhmVNzfHDgrPp
	 ZHPCDTqWVCqD8Ky2Ivs0b514MqOHv1+AF/hYY7TtHNXLvTaSPSpSy25/ctPvw5j+2t
	 43QCikypsHfu09DPmbe/m9CJ/2WW+NCoB6etcNBcmS9dp9/RjYIg0rnvBgflPJs/qr
	 RhaCxfM5dzQ5jkiThISeioN1AaoJJqIKRpA4hqMGGWnmnUicgkMVaTrEGAd0igG4Uh
	 E3wLtLk+tRLoSYwNYHdC30Uwx1xIsu3/4NbxqqJywZAb6q9swVP6S7rVjiIEeaTFrI
	 Rwna0lW1ysMOA==
Date: Tue, 31 Oct 2023 11:17:57 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Robert Richter <rrichter@amd.com>, Terry Bowman <terry.bowman@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>
Subject: Re: [linux-next:master] BUILD REGRESSION
 c503e3eec382ac708ee7adf874add37b77c5d312
Message-ID: <20231031161757.GA11354@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202310310457.5LusQqF6-lkp@intel.com>
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
Cc: kernel test robot <lkp@intel.com>, linux-pci@vger.kernel.org, linux-cxl@vger.kernel.org, loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Oct 31, 2023 at 04:35:23AM +0800, kernel test robot wrote:
> tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> branch HEAD: c503e3eec382ac708ee7adf874add37b77c5d312  Add linux-next specific files for 20231030
> 
> Error/Warning reports:
> ... 
> https://lore.kernel.org/oe-kbuild-all/202310302206.Pkr5eBDi-lkp@intel.com

> Error/Warning: (recently discovered and may have been fixed)
> 
> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/iio/imu/bosch,bma400.yaml
> aarch64-linux-ld: drivers/cxl/core/pci.c:921:(.text+0xbbc): undefined reference to `pci_print_aer'
> ...
> arch/riscv/include/asm/mmio.h:67:(.text+0xd66): undefined reference to `pci_print_aer'
> csky-linux-ld: pci.c:(.text+0x6e8): undefined reference to `pci_print_aer'
> drivers/cxl/core/pci.c:921: undefined reference to `pci_print_aer'
> drivers/cxl/core/pci.c:921:(.text+0xbc0): undefined reference to `pci_print_aer'
> ...
> ld: drivers/cxl/core/pci.c:921: undefined reference to `pci_print_aer'
> loongarch64-linux-ld: drivers/cxl/core/pci.c:921:(.text+0xa38): undefined reference to `pci_print_aer'
> pci.c:(.text+0x662): undefined reference to `pci_print_aer'
> powerpc-linux-ld: pci.c:(.text+0xf10): undefined reference to `pci_print_aer'
> riscv64-linux-ld: pci.c:(.text+0x11ec): undefined reference to `pci_print_aer'

I have no idea about the above (and all the similar ones below); I
assume they all have to do with
https://lore.kernel.org/r/20231018171713.1883517-13-rrichter@amd.com

> Unverified Error/Warning (likely false positive, please contact us if interested):
> 
> drivers/pci/controller/dwc/pcie-rcar-gen4.c:439:15: warning: cast to smaller integer type 'enum dw_pcie_device_mode' from 'const void *' [-Wvoid-pointer-to-enum-cast]

Safe but annoying.  Yoshihiro, can you fix this by adding structs for
the of_device_id.data member instead of casting DW_PCIE_RC_TYPE and
DW_PCIE_EP_TYPE?  Examples here:

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pci/controller/dwc/pci-dra7xx.c?id=v6.6#n557
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pci/controller/dwc/pci-keystone.c?id=v6.6#n1069
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pci/controller/dwc/pcie-artpec6.c?id=v6.6#n452
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pci/controller/dwc/pcie-designware-plat.c?id=v6.6#n159
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pci/controller/dwc/pcie-keembay.c?id=v6.6#n437
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pci/controller/dwc/pcie-tegra194.c?id=v6.6#n2431

Siddharth, since you're looking at keystone v3.65, it looks to me like
DW_PCIE_VER_365A is currently broken because ks_pcie_rc_of_data
doesn't set .mode, so it defaults to zero, and it looks like we should
end up at the INVALID device type case here:

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pci/controller/dwc/pci-keystone.c?id=v6.6#n1285

> |-- arm64-buildonly-randconfig-r003-20220511
> |   `-- aarch64-linux-ld:drivers-cxl-core-pci.c:(.text):undefined-reference-to-pci_print_aer

> |-- csky-randconfig-001-20231030
> |   |-- csky-linux-ld:pci.c:(.text):undefined-reference-to-pci_print_aer
> |   `-- pci.c:(.text):undefined-reference-to-pci_print_aer

> |-- i386-randconfig-141-20231030
> |   |-- ld:drivers-cxl-core-pci.c:undefined-reference-to-pci_print_aer

> |-- loongarch-randconfig-r014-20230225
> |   `-- drivers-cxl-core-pci.c:(.text):undefined-reference-to-pci_print_aer
> |-- loongarch-randconfig-r032-20220926
> |   `-- loongarch64-linux-ld:drivers-cxl-core-pci.c:(.text):undefined-reference-to-pci_print_aer

> |-- powerpc-randconfig-003-20231016
> |   `-- powerpc-linux-ld:pci.c:(.text):undefined-reference-to-pci_print_aer

> |-- riscv-randconfig-r002-20220124
> |   `-- arch-riscv-include-asm-mmio.h:(.text):undefined-reference-to-pci_print_aer
> |-- riscv-randconfig-r011-20220606
> |   `-- riscv64-linux-ld:pci.c:(.text):undefined-reference-to-pci_print_aer

> |-- x86_64-randconfig-x052-20230810
> |   `-- drivers-cxl-core-pci.c:undefined-reference-to-pci_print_aer
