Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BAAA2D2F26
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 17:10:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cr4rx2r9szDqZ3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 03:10:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=qcai@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=cj7wndBd; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=cj7wndBd; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cr4ph39s2zDqHR
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Dec 2020 03:08:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607443688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FclBlKkXiRl3V6zmB0yhGpRFKCqCuqXjexHZHhIAkVI=;
 b=cj7wndBdXkaiYprVVt6pfB++2EhjpA72uB2OhAHEiFrA1fbcXvcRkNWtIYigJexqOMPrHd
 faDTxFuqu7zL4plz809uz9o1q2YCvdPT8zlbAcjmrh+OwDCK0YWTl3wOnIeSahSe3K/PAo
 4VCkcGnOoUNV4aF9XuYajQnxKNiSGUQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607443688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FclBlKkXiRl3V6zmB0yhGpRFKCqCuqXjexHZHhIAkVI=;
 b=cj7wndBdXkaiYprVVt6pfB++2EhjpA72uB2OhAHEiFrA1fbcXvcRkNWtIYigJexqOMPrHd
 faDTxFuqu7zL4plz809uz9o1q2YCvdPT8zlbAcjmrh+OwDCK0YWTl3wOnIeSahSe3K/PAo
 4VCkcGnOoUNV4aF9XuYajQnxKNiSGUQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-FGZMBCjdP-yRVI2h8lRl6Q-1; Tue, 08 Dec 2020 11:08:01 -0500
X-MC-Unique: FGZMBCjdP-yRVI2h8lRl6Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B544CBBEE3;
 Tue,  8 Dec 2020 16:07:56 +0000 (UTC)
Received: from ovpn-114-102.rdu2.redhat.com (ovpn-114-102.rdu2.redhat.com
 [10.10.114.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4DF7760BE2;
 Tue,  8 Dec 2020 16:07:50 +0000 (UTC)
Message-ID: <d192a8534c07f98c98b834165ef91a9322c3bf59.camel@redhat.com>
Subject: Re: [PATCH v6 0/5] PCI: Unify ECAM constants in native PCI Express
 drivers
From: Qian Cai <qcai@redhat.com>
To: Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Bjorn Helgaas
 <bhelgaas@google.com>
Date: Tue, 08 Dec 2020 11:07:49 -0500
In-Reply-To: <20201129230743.3006978-1-kw@linux.com>
References: <20201129230743.3006978-1-kw@linux.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: Heiko Stuebner <heiko@sntech.de>, Shawn Lin <shawn.lin@rock-chips.com>,
 Paul Mackerras <paulus@samba.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jonathan Chocron <jonnyc@amazon.com>, Toan Le <toan@os.amperecomputing.com>,
 Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Michal Simek <michal.simek@xilinx.com>, linux-rockchip@lists.infradead.org,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 bcm-kernel-feedback-list@broadcom.com,
 Jonathan Derrick <jonathan.derrick@intel.com>, linux-pci@vger.kernel.org,
 Stephen Rothwell <sfr@canb.auug.org.au>, Ray Jui <rjui@broadcom.com>,
 Florian Fainelli <f.fainelli@gmail.com>, linux-rpi-kernel@lists.infradead.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>,
 Zhou Wang <wangzhou1@hisilicon.com>, Robert Richter <rrichter@marvell.com>,
 linuxppc-dev@lists.ozlabs.org, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 2020-11-29 at 23:07 +0000, Krzysztof Wilczyński wrote:
> Unify ECAM-related constants into a single set of standard constants
> defining memory address shift values for the byte-level address that can
> be used when accessing the PCI Express Configuration Space, and then
> move native PCI Express controller drivers to use newly introduced
> definitions retiring any driver-specific ones.
> 
> The ECAM ("Enhanced Configuration Access Mechanism") is defined by the
> PCI Express specification (see PCI Express Base Specification, Revision
> 5.0, Version 1.0, Section 7.2.2, p. 676), thus most hardware should
> implement it the same way.
> 
> Most of the native PCI Express controller drivers define their ECAM-related
> constants, many of these could be shared, or use open-coded values when
> setting the ".bus_shift" field of the "struct pci_ecam_ops".
> 
> All of the newly added constants should remove ambiguity and reduce the
> number of open-coded values, and also correlate more strongly with the
> descriptions in the aforementioned specification (see Table 7-1
> "Enhanced Configuration Address Mapping", p. 677).
> 
> Suggested-by: Bjorn Helgaas <bhelgaas@google.com>
> Signed-off-by: Krzysztof Wilczyński <kw@linux.com>

Reverting this series on the top of today's linux-next fixed a boot crash on
arm64 Thunder X2 server.

.config: https://cailca.coding.net/public/linux/mm/git/files/master/arm64.config

[  186.285957][    T1] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-7f])
[  186.293127][    T1] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig Segments MSI HPX-Type3]
[  186.317072][    T1] acpi PNP0A08:00: _OSC: not requesting OS control; OS requires [ExtendedConfig ASPM ClockPM MSI]
[  186.330336][    T1] acpi PNP0A08:00: ECAM area [mem 0x30000000-0x37ffffff] reserved by PNP0C02:00
[  186.339538][    T1] acpi PNP0A08:00: ECAM at [mem 0x30000000-0x37ffffff] for [bus 00-7f]
[  186.353258][    T1] PCI host bridge to bus 0000:00
[  186.358162][    T1] pci_bus 0000:00: root bus resource [mem 0x40000000-0x5fffffff window]
[  186.366509][    T1] pci_bus 0000:00: root bus resource [mem 0x10000000000-0x13fffffffff window]
[  186.375366][    T1] pci_bus 0000:00: root bus resource [bus 00-7f]
[  186.382652][    T1] pci 0000:00:00.0: [177d:af00] type 00 class 0x060000
[  186.395174][    T1] pci 0000:00:01.0: [177d:af84] type 01 class 0x060400
[  186.402433][    T1] pci 0000:00:01.0: PME# supported from D0 D3hot D3cold
[  186.415652][    T1] Unable to handle kernel paging request at virtual address ffff800029370000
[  186.424398][    T1] Mem abort info:
[  186.427930][    T1]   ESR = 0x96000007
[  186.431725][    T1]   EC = 0x25: DABT (current EL), IL = 32 bits
[  186.437805][    T1]   SET = 0, FnV = 0
[  186.441599][    T1]   EA = 0, S1PTW = 0
[  186.445485][    T1] Data abort info:
[  186.449104][    T1]   ISV = 0, ISS = 0x00000007
[  186.453687][    T1]   CM = 0, WnR = 0
[  186.457396][    T1] swapper pgtable: 64k pages, 48-bit VAs, pgdp=00000000da920000
[  186.464979][    T1] [ffff800029370000] pgd=0000008ffcff0003, p4d=0000008ffcff0003, pud=0000008ffcff0003, pmd=00000000811d0003, pte=0000000000000000
[  186.478424][    T1] Internal error: Oops: 96000007 [#1] SMP
[  186.484059][    T1] Modules linked in:
[  186.487854][    T1] CPU: 38 PID: 1 Comm: swapper/0 Tainted: G        W    L    5.10.0-rc7-next-20201208 #3
[  186.497617][    T1] Hardware name: HPE Apollo 70             /C01_APACHE_MB         , BIOS L50_5.13_1.16 07/29/2020
[  186.508174][    T1] pstate: 20400089 (nzCv daIf +PAN -UAO -TCO BTYPE=--)
[  186.514954][    T1] pc : pci_generic_config_read+0x78/0x1d0
[  186.520587][    T1] lr : pci_generic_config_read+0x64/0x1d0
pci_generic_config_read at drivers/pci/access.c:83
[  186.526223][    T1] sp : ffff000005f0ef30
[  186.530278][    T1] x29: ffff000005f0ef30 x28: 0000000000000010 
[  186.536359][    T1] x27: 0000000000000000 x26: 0000000000000087 
[  186.542441][    T1] x25: 0000000000000000 x24: ffff00084a3a5000 
[  186.548517][    T1] x23: ffff000005f0f150 x22: 0000000000000004 
[  186.554593][    T1] x21: ffff800011404588 x20: ffff000005f0eff0 
[  186.560669][    T1] x19: ffff00084a3a5000 x18: 1fffe001cf0d53ed 
[  186.566750][    T1] x17: 0000000000000000 x16: 0000000000000003 
[  186.572831][    T1] x15: 0000000000000000 x14: 0000000000000003 
[  186.578908][    T1] x13: ffff600000be1ddf x12: 1fffe00000be1dde 
[  186.584983][    T1] x11: 1fffe00000be1dde x10: ffff600000be1dde 
[  186.591059][    T1] x9 : ffff800010c4f59c x8 : ffff000005f0eef3 
[  186.597139][    T1] x7 : 0000000000000001 x6 : 0000000000000001 
[  186.603222][    T1] x5 : 1fffe00109474a1c x4 : 1fffe010fd074cb2 
[  186.609298][    T1] x3 : 0000000000000000 x2 : 0000000000000000 
[  186.615374][    T1] x1 : 0000000000010000 x0 : ffff800029370000 
[  186.621451][    T1] Call trace:
[  186.624623][    T1]  pci_generic_config_read+0x78/0x1d0
__raw_readl at arch/arm64/include/asm/io.h:75
(inlined by) pci_generic_config_read at drivers/pci/access.c:93
[  186.629905][    T1]  pci_bus_read_config_dword+0xfc/0x198
pci_bus_read_config_dword at drivers/pci/access.c:65 (discriminator 2)
[  186.635362][    T1]  pci_bus_generic_read_dev_vendor_id+0x3c/0x310
pci_bus_generic_read_dev_vendor_id at drivers/pci/probe.c:2300
[  186.641611][    T1]  pci_bus_read_dev_vendor_id+0x7c/0xd0
pci_bus_read_dev_vendor_id at drivers/pci/probe.c:2329
[  186.647067][    T1]  pci_scan_single_device+0xe0/0x1f8
pci_scan_device at drivers/pci/probe.c:2342
(inlined by) pci_scan_single_device at drivers/pci/probe.c:2511
(inlined by) pci_scan_single_device at drivers/pci/probe.c:2501
[  186.652261][    T1]  pci_scan_slot+0x88/0x258
pci_scan_slot at drivers/pci/probe.c:2590
[  186.656663][    T1]  pci_scan_child_bus_extend+0x88/0x608
pci_scan_child_bus_extend at drivers/pci/probe.c:2807
[  186.662120][    T1]  pci_scan_child_bus+0x18/0x20
pci_scan_child_bus at drivers/pci/probe.c:2938
[  186.666875][    T1]  acpi_pci_root_create+0x518/0x7a8
acpi_pci_root_create at drivers/acpi/pci_root.c:938
[  186.671982][    T1]  pci_acpi_scan_root+0x2bc/0x4c0
pci_acpi_scan_root at arch/arm64/kernel/pci.c:189
[  186.676911][    T1]  acpi_pci_root_add+0x45c/0x920
acpi_pci_root_add at drivers/acpi/pci_root.c:609
[  186.681754][    T1]  acpi_bus_attach+0x270/0x6d8
acpi_scan_attach_handler at drivers/acpi/scan.c:1969
(inlined by) acpi_bus_attach at drivers/acpi/scan.c:2013
[  186.686419][    T1]  acpi_bus_attach+0x140/0x6d8
[  186.691085][    T1]  acpi_bus_attach+0x140/0x6d8
acpi_bus_attach at drivers/acpi/scan.c:2033 (discriminator 9)
[  186.695751][    T1]  acpi_bus_scan+0x98/0xf8
acpi_bus_scan at drivers/acpi/scan.c:2087
[  186.700067][    T1]  acpi_scan_init+0x220/0x524
[  186.704644][    T1]  acpi_init+0x460/0x4e8
[  186.708790][    T1]  do_one_initcall+0x170/0xb70
[  186.713461][    T1]  kernel_init_freeable+0x6a8/0x734
[  186.718574][    T1]  kernel_init+0x18/0x12c
[  186.722806][    T1]  ret_from_fork+0x10/0x1c
[  186.727123][    T1] Code: 710006df 540002e0 71000adf 540004e0 (b9400013) 
[  186.733988][    T1] ---[ end trace bad65ebbc8c09fe0 ]---
[  186.739359][    T1] Kernel panic - not syncing: Oops: Fatal exception
[  186.746115][    T1] SMP: stopping secondary CPUs
[  186.750968][    T1] ---[ end Kernel panic - not syncing: Oops: Fatal exception ]---

> 
> --- 
> Changed in v6:
>   Converted single patch into a series.
>   Dropped changes related to PPC 4xx platform.
>   Refactored pci_ecam_map_bus() so that bus, device function and offset
>   are correctly masked, limiting offset to 4K as per the PCI Express
>   Specification.  After the refactor this function will now use sensible
>   defaults allowing for removal of the ".bus_shit" initialiser from all
>   the users of the "ecam_ops" structure who do not use a non-standard
>   ECAM bus shit values.
> 
> Changed in v5:
>   Removed unused constant "PCIE_ECAM_DEV_SHIFT".
>   Refactored ppc4xx_pciex_get_config_base() so that the "offset"
>   parameter can be passed to so that the PCIE_ECAM_OFFSET() macro
>   can be used.
>   Used the ALIGN_DOWN() macro where 32 bit alignment is required
>   instead using the 0xffc mask.
>   Added CFG_ADDR_CFG_TYPE_1 macro to pci/controller/pcie-iproc.c to
>   denote that this is a configuration type 1 address and access type.
>   Refactored boundary check in pci/controller/vmd.c as used by the
>   vmd_cfg_addr() function following addition of the PCIE_ECAM_OFFSET()
>   macro.
>   Changed the "bus->number" to simply pass the "bus" argument in the
>   PCIE_ECAM_OFFSET() macro.
> 
> Changed in v4:
>   Removed constants related to "CAM".
>   Added more platforms and devices that can use new ECAM macros and
>   constants.
>   Removed unused ".bus_shift" initialisers from pci-xgene.c as
>   xgene_pcie_map_bus() did not use these.
> 
> Changes in v3:
>   Updated commit message wording.
>   Updated regarding custom ECAM bus shift values and concerning PCI base
>   configuration space access for Type 1 access.
>   Refactored rockchip_pcie_rd_other_conf() and rockchip_pcie_wr_other_conf()
>   and removed the "busdev" variable.
>   Removed surplus "relbus" variable from nwl_pcie_map_bus() and
>   xilinx_pcie_map_bus().
>   Renamed the PCIE_ECAM_ADDR() macro to PCIE_ECAM_OFFSET().
> 
> Changes in v2:
>   Use PCIE_ECAM_ADDR macro when computing ECAM address offset, but drop
>   PCI_SLOT and PCI_FUNC macros from the PCIE_ECAM_ADDR macro in favour
>   of using a single value for the device/function.
> 
> Krzysztof Wilczyński (5):
>   PCI: Unify ECAM constants in native PCI Express drivers
>   PCI: thunder-pem: Add constant for custom ".bus_shit" initialiser
>   PCI: iproc: Convert to use the new ECAM constants
>   PCI: vmd: Update type of the __iomem pointers
>   PCI: xgene: Removed unused ".bus_shift" initialisers from pci-xgene.c
> 
>  drivers/pci/controller/dwc/pcie-al.c        | 12 ++------
>  drivers/pci/controller/dwc/pcie-hisi.c      |  2 --
>  drivers/pci/controller/pci-aardvark.c       | 13 ++-------
>  drivers/pci/controller/pci-host-generic.c   |  1 -
>  drivers/pci/controller/pci-thunder-ecam.c   |  1 -
>  drivers/pci/controller/pci-thunder-pem.c    | 13 +++++++--
>  drivers/pci/controller/pci-xgene.c          |  2 --
>  drivers/pci/controller/pcie-brcmstb.c       | 16 ++---------
>  drivers/pci/controller/pcie-iproc.c         | 31 ++++++---------------
>  drivers/pci/controller/pcie-rockchip-host.c | 27 +++++++++---------
>  drivers/pci/controller/pcie-rockchip.h      |  8 +-----
>  drivers/pci/controller/pcie-tango.c         |  1 -
>  drivers/pci/controller/pcie-xilinx-nwl.c    |  9 ++----
>  drivers/pci/controller/pcie-xilinx.c        | 11 ++------
>  drivers/pci/controller/vmd.c                | 19 ++++++-------
>  drivers/pci/ecam.c                          | 23 ++++++++++-----
>  include/linux/pci-ecam.h                    | 27 ++++++++++++++++++
>  17 files changed, 96 insertions(+), 120 deletions(-)
> 

