Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D07280B22B
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Dec 2023 06:18:27 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d3n/bHxb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SnGW45qVLz3dJ5
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Dec 2023 16:18:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d3n/bHxb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SnGVD6bVsz3cBV
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Dec 2023 16:17:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702099061; x=1733635061;
  h=date:from:to:cc:subject:message-id;
  bh=tqHQze1rHqZv5/4KyDqgvmchSTF0t65MboOC/77DuUM=;
  b=d3n/bHxb1Mo0PtidLq4Vi8XKX+FvhkvoeJraFwtkE+UItGhzfhAEiakx
   MEAs4QGafsH3y9eQ5NjKvL3DiCn4SYT6Z6B0b0UcKor3Vwoh+Lc9y+npw
   GEgEjq64uR5tAWlLCcPTCS8EM59V/llTmc3APmGtgm/J+SxgneNQzCP7p
   Ybn2Bbhhjsw9XY3kDw/n3ha0va40Vn0RdyveaCPfatUsaV4YWocNO8mUB
   Qe21aCZL0Orv5PB9k+9WSJ6TiZdsDvjcUqxDQLQZMkF5D/fNmFUMZwxmt
   r88leyMgSGl97qBRYN74ahT9Jk4yxMaexlqcnpvk1ucRa7NpSqB5wAmG8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="393362279"
X-IronPort-AV: E=Sophos;i="6.04,262,1695711600"; 
   d="scan'208";a="393362279"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2023 21:17:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="863116292"
X-IronPort-AV: E=Sophos;i="6.04,262,1695711600"; 
   d="scan'208";a="863116292"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 08 Dec 2023 21:17:29 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBpiQ-000ErP-1v;
	Sat, 09 Dec 2023 05:17:26 +0000
Date: Sat, 09 Dec 2023 13:13:47 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 bc63de6e6ba0b16652c5fb4b9c9916b9e7ca1f23
Message-ID: <202312091341.5qerfweV-lkp@intel.com>
User-Agent: s-nail v14.9.24
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
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, linux-mips@vger.kernel.org, amd-gfx@lists.freedesktop.org, Linux Memory Management List <linux-mm@kvack.org>, sparclinux@vger.kernel.org, ntfs3@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-leds@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: bc63de6e6ba0b16652c5fb4b9c9916b9e7ca1f23  Add linux-next specific files for 20231208

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202312081716.LUUhSNS4-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202312081904.NkusJJO0-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202312081955.G3STkpFJ-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202312090117.DLMJTqST-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

WARNING: modpost: vmlinux: section mismatch in reference: at91_poweroff_probe+0x8c (section: .text) -> at91_wakeup_status (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: at91_shdwc_probe+0xd8 (section: .text) -> at91_wakeup_status (section: .init.text)
arch/mips/mm/cache.c:209:(.text+0x690): undefined reference to `r3k_cache_init'
arch/powerpc/platforms/44x/warp.c:109:15: error: variable 'warp_gpio_leds' has initializer but incomplete type
arch/powerpc/platforms/44x/warp.c:109:31: error: storage size of 'warp_gpio_leds' isn't known
arch/powerpc/platforms/44x/warp.c:110:10: error: 'struct platform_device' has no member named 'name'
arch/powerpc/platforms/44x/warp.c:110:19: warning: excess elements in struct initializer
arch/powerpc/platforms/44x/warp.c:111:10: error: 'struct platform_device' has no member named 'id'
arch/powerpc/platforms/44x/warp.c:112:10: error: 'struct platform_device' has no member named 'dev'
arch/powerpc/platforms/44x/warp.c:112:19: error: extra brace group at end of initializer
arch/powerpc/platforms/44x/warp.c:197:25: error: implicit declaration of function 'platform_device_register'; did you mean 'of_device_register'? [-Werror=implicit-function-declaration]
drivers/usb/host/uhci-grlib.c:152:31: error: implicit declaration of function 'platform_get_drvdata'; did you mean 'pci_get_drvdata'? [-Werror=implicit-function-declaration]
drivers/usb/host/uhci-grlib.c:152:31: warning: initialization of 'struct usb_hcd *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
drivers/usb/host/uhci-grlib.c:184:15: error: variable 'uhci_grlib_driver' has initializer but incomplete type
drivers/usb/host/uhci-grlib.c:184:31: error: storage size of 'uhci_grlib_driver' isn't known
drivers/usb/host/uhci-grlib.c:185:10: error: 'struct platform_driver' has no member named 'probe'
drivers/usb/host/uhci-grlib.c:185:27: warning: excess elements in struct initializer
drivers/usb/host/uhci-grlib.c:186:10: error: 'struct platform_driver' has no member named 'remove_new'
drivers/usb/host/uhci-grlib.c:187:10: error: 'struct platform_driver' has no member named 'shutdown'
drivers/usb/host/uhci-grlib.c:188:10: error: 'struct platform_driver' has no member named 'driver'
drivers/usb/host/uhci-grlib.c:188:19: error: extra brace group at end of initializer
drivers/usb/host/uhci-grlib.c:92:36: error: invalid use of undefined type 'struct platform_device'
drivers/usb/host/uhci-hcd.c:885:18: error: implicit declaration of function 'platform_driver_register' [-Werror=implicit-function-declaration]
drivers/usb/host/uhci-hcd.c:902:9: error: implicit declaration of function 'platform_driver_unregister'; did you mean 'driver_unregister'? [-Werror=implicit-function-declaration]
uffd-common.c:636:28: warning: unused variable 'uffdio_move' [-Wunused-variable]

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-randconfig-r083-20230821
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-char-agp-alpha-agp.o
|-- arc-randconfig-r132-20231208
|   `-- lib-zstd-compress-zstd_fast.c:sparse:sparse:Using-plain-integer-as-NULL-pointer
|-- arm-allyesconfig
|   `-- qcom_stats.c:(.text):undefined-reference-to-__aeabi_uldivmod
|-- arm-randconfig-r004-20221210
|   `-- WARNING:modpost:drivers-pcmcia-omap_cf:section-mismatch-in-reference:omap_cf_driver-(section:.data)-omap_cf_remove-(section:.exit.text)
|-- arm-randconfig-r112-20231208
|   `-- lib-zstd-compress-zstd_fast.c:sparse:sparse:Using-plain-integer-as-NULL-pointer
|-- i386-buildonly-randconfig-002-20230825
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:BUILD_BUG_ON-failed:sizeof(-vcpup)-SMP_CACHE_BYTES
|-- i386-randconfig-r133-20231208
|   `-- lib-zstd-compress-zstd_fast.c:sparse:sparse:Using-plain-integer-as-NULL-pointer
|-- loongarch-randconfig-r123-20231208
|   `-- lib-zstd-compress-zstd_fast.c:sparse:sparse:Using-plain-integer-as-NULL-pointer
|-- mips-allyesconfig
|   `-- qcom_stats.c:(.text.qcom_ddr_stats_show):undefined-reference-to-__udivdi3
|-- mips-fuloong2e_defconfig
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-base-regmap-regmap-mmio.o
|-- mips-randconfig-r021-20230212
|   `-- arch-mips-mm-cache.c:(.text):undefined-reference-to-r3k_cache_init
|-- parisc-allmodconfig
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-tty-serial-8250_parisc.o
|-- parisc-randconfig-r113-20231208
|   |-- fs-ntfs3-ntfs.h:sparse:sparse:static-assertion-failed:sizeof(struct-ATTR_LIST_ENTRY)
|   `-- lib-zstd-compress-zstd_fast.c:sparse:sparse:Using-plain-integer-as-NULL-pointer
|-- powerpc-warp_defconfig
|   |-- arch-powerpc-platforms-44x-warp.c:error:extra-brace-group-at-end-of-initializer
|   |-- arch-powerpc-platforms-44x-warp.c:error:implicit-declaration-of-function-platform_device_register
|   |-- arch-powerpc-platforms-44x-warp.c:error:storage-size-of-warp_gpio_leds-isn-t-known
|   |-- arch-powerpc-platforms-44x-warp.c:error:struct-platform_device-has-no-member-named-dev
|   |-- arch-powerpc-platforms-44x-warp.c:error:struct-platform_device-has-no-member-named-id
|   |-- arch-powerpc-platforms-44x-warp.c:error:struct-platform_device-has-no-member-named-name
|   |-- arch-powerpc-platforms-44x-warp.c:error:variable-warp_gpio_leds-has-initializer-but-incomplete-type
|   `-- arch-powerpc-platforms-44x-warp.c:warning:excess-elements-in-struct-initializer
|-- sparc-allmodconfig
|   |-- arch-sparc-kernel-module.c:warning:variable-strtab-set-but-not-used
|   `-- arch-sparc-mm-init_64.c:warning:variable-hv_pgsz_idx-set-but-not-used
|-- sparc-allnoconfig
|   |-- arch-sparc-mm-leon_mm.c:warning:variable-paddrbase-set-but-not-used
|   `-- arch-sparc-mm-srmmu.c:warning:variable-clear-set-but-not-used
|-- sparc-defconfig
|   |-- arch-sparc-kernel-module.c:warning:variable-strtab-set-but-not-used
|   |-- arch-sparc-mm-leon_mm.c:warning:variable-paddrbase-set-but-not-used
|   `-- arch-sparc-mm-srmmu.c:warning:variable-clear-set-but-not-used
|-- sparc-randconfig-001-20231208
|   |-- arch-sparc-kernel-module.c:warning:variable-strtab-set-but-not-used
|   |-- arch-sparc-mm-leon_mm.c:warning:variable-paddrbase-set-but-not-used
|   `-- arch-sparc-mm-srmmu.c:warning:variable-clear-set-but-not-used
|-- sparc-randconfig-002-20231208
|   `-- arch-sparc-mm-init_64.c:warning:variable-hv_pgsz_idx-set-but-not-used
|-- sparc-randconfig-r015-20230509
|   |-- drivers-usb-host-uhci-grlib.c:error:extra-brace-group-at-end-of-initializer
|   |-- drivers-usb-host-uhci-grlib.c:error:implicit-declaration-of-function-platform_get_drvdata
|   |-- drivers-usb-host-uhci-grlib.c:error:invalid-use-of-undefined-type-struct-platform_device
|   |-- drivers-usb-host-uhci-grlib.c:error:storage-size-of-uhci_grlib_driver-isn-t-known
|   |-- drivers-usb-host-uhci-grlib.c:error:struct-platform_driver-has-no-member-named-driver
|   |-- drivers-usb-host-uhci-grlib.c:error:struct-platform_driver-has-no-member-named-probe
|   |-- drivers-usb-host-uhci-grlib.c:error:struct-platform_driver-has-no-member-named-remove_new
|   |-- drivers-usb-host-uhci-grlib.c:error:struct-platform_driver-has-no-member-named-shutdown
|   |-- drivers-usb-host-uhci-grlib.c:error:variable-uhci_grlib_driver-has-initializer-but-incomplete-type
|   |-- drivers-usb-host-uhci-grlib.c:warning:excess-elements-in-struct-initializer
|   |-- drivers-usb-host-uhci-grlib.c:warning:initialization-of-struct-usb_hcd-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-usb-host-uhci-hcd.c:error:implicit-declaration-of-function-platform_driver_register
|   `-- drivers-usb-host-uhci-hcd.c:error:implicit-declaration-of-function-platform_driver_unregister
|-- sparc-randconfig-r025-20221019
|   `-- arch-sparc-kernel-head_32.S:(.head.text):relocation-truncated-to-fit:R_SPARC_WDISP22-against-init.text
|-- sparc-randconfig-r031-20230609
|   `-- arch-sparc-kernel-head_32.S:(.init.text):relocation-truncated-to-fit:R_SPARC_WDISP22-against-symbol-leon_smp_cpu_startup-defined-in-.text-section-in-arch-sparc-kernel-trampoline_32.o
|-- sparc-randconfig-r054-20231208
|   |-- arch-sparc-mm-init_64.c:warning:variable-hv_pgsz_idx-set-but-not-used
|   `-- arch-sparc-mm-init_64.c:warning:variable-pagecv_flag-set-but-not-used
|-- sparc-sparc32_defconfig
|   |-- arch-sparc-kernel-module.c:warning:variable-strtab-set-but-not-used
|   |-- arch-sparc-mm-leon_mm.c:warning:variable-paddrbase-set-but-not-used
|   `-- arch-sparc-mm-srmmu.c:warning:variable-clear-set-but-not-used
|-- sparc64-allmodconfig
|   |-- arch-sparc-kernel-module.c:warning:variable-strtab-set-but-not-used
|   `-- arch-sparc-mm-init_64.c:warning:variable-hv_pgsz_idx-set-but-not-used
|-- sparc64-allyesconfig
|   |-- arch-sparc-kernel-module.c:warning:variable-strtab-set-but-not-used
|   `-- arch-sparc-mm-init_64.c:warning:variable-hv_pgsz_idx-set-but-not-used
|-- sparc64-defconfig
|   |-- arch-sparc-kernel-module.c:warning:variable-strtab-set-but-not-used
|   `-- arch-sparc-mm-init_64.c:warning:variable-hv_pgsz_idx-set-but-not-used
|-- sparc64-randconfig-001-20231208
|   `-- arch-sparc-kernel-module.c:warning:variable-strtab-set-but-not-used
|-- sparc64-randconfig-002-20231208
|   `-- arch-sparc-mm-init_64.c:warning:variable-hv_pgsz_idx-set-but-not-used
|-- sparc64-randconfig-r131-20231208
|   |-- arch-sparc-mm-init_64.c:warning:variable-hv_pgsz_idx-set-but-not-used
|   `-- lib-zstd-compress-zstd_fast.c:sparse:sparse:Using-plain-integer-as-NULL-pointer
|-- um-randconfig-r111-20231208
|   `-- lib-zstd-compress-zstd_fast.c:sparse:sparse:Using-plain-integer-as-NULL-pointer
|-- x86_64-buildonly-randconfig-003-20230911
|   `-- drivers-net-dsa-sja1105-sja1105.o:warning:objtool:sja1105_fast_age-falls-through-to-next-function-sja1105_setupcold()
|-- x86_64-randconfig-121-20231208
|   |-- drivers-gpu-drm-amd-amdgpu-..-amdkfd-kfd_process.c:sparse:sparse:incompatible-types-in-comparison-expression-(different-address-spaces):
|   |-- drivers-gpu-drm-amd-amdgpu-..-amdkfd-kfd_process.c:sparse:struct-dma_fence
|   |-- drivers-gpu-drm-amd-amdgpu-..-amdkfd-kfd_process.c:sparse:struct-dma_fence-noderef-__rcu
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_amdkfd_gpuvm.c:sparse:sparse:incompatible-types-in-comparison-expression-(different-address-spaces):
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_amdkfd_gpuvm.c:sparse:struct-dma_fence
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_amdkfd_gpuvm.c:sparse:struct-dma_fence-noderef-__rcu
|   `-- lib-zstd-compress-zstd_fast.c:sparse:sparse:Using-plain-integer-as-NULL-pointer
|-- x86_64-randconfig-122-20231208
|   `-- lib-zstd-compress-zstd_fast.c:sparse:sparse:Using-plain-integer-as-NULL-pointer
|-- x86_64-randconfig-123-20231208
|   |-- drivers-soc-qcom-pmic_pdcharger_ulog.c:sparse:sparse:incorrect-type-in-initializer-(different-base-types)-expected-restricted-__le32-usertype-opcode-got-int
|   |-- drivers-soc-qcom-pmic_pdcharger_ulog.c:sparse:sparse:incorrect-type-in-initializer-(different-base-types)-expected-restricted-__le32-usertype-owner-got-int
|   |-- drivers-soc-qcom-pmic_pdcharger_ulog.c:sparse:sparse:incorrect-type-in-initializer-(different-base-types)-expected-restricted-__le32-usertype-type-got-int
|   `-- lib-zstd-compress-zstd_fast.c:sparse:sparse:Using-plain-integer-as-NULL-pointer
`-- x86_64-rhel-8.3-bpf
    `-- uffd-common.c:warning:unused-variable-uffdio_move
clang_recent_errors
|-- arm-defconfig
|   |-- WARNING:modpost:vmlinux:section-mismatch-in-reference:at91_poweroff_probe-(section:.text)-at91_wakeup_status-(section:.init.text)
|   `-- WARNING:modpost:vmlinux:section-mismatch-in-reference:at91_shdwc_probe-(section:.text)-at91_wakeup_status-(section:.init.text)
|-- arm-randconfig-001-20231208
|   |-- drivers-leds-leds-max5970.c:warning:variable-num_leds-set-but-not-used
|   `-- ld.lld:error:undefined-symbol:arch_phys_to_idmap_offset
|-- arm-randconfig-002-20231208
|   `-- drivers-leds-leds-max5970.c:warning:variable-num_leds-set-but-not-used
|-- arm64-allmodconfig
|   `-- drivers-leds-leds-max5970.c:warning:variable-num_leds-set-but-not-used
|-- arm64-allyesconfig
|   `-- drivers-leds-leds-max5970.c:warning:variable-num_leds-set-but-not-used
|-- hexagon-allmodconfig
|   `-- drivers-leds-leds-max5970.c:warning:variable-num_leds-set-but-not-used
|-- hexagon-allyesconfig
|   `-- drivers-leds-leds-max5970.c:warning:variable-num_leds-set-but-not-used
|-- i386-allmodconfig
|   |-- drivers-leds-leds-max5970.c:warning:variable-num_leds-set-but-not-used
|   `-- fs-ntfs3-ntfs.h:error:static-assertion-failed-due-to-requirement-sizeof(struct-ATTR_LIST_ENTRY):sizeof(struct-ATTR_LIST_ENTRY)
|-- i386-allyesconfig
|   |-- drivers-leds-leds-max5970.c:warning:variable-num_leds-set-but-not-used
|   `-- fs-ntfs3-ntfs.h:error:static-assertion-failed-due-to-requirement-sizeof(struct-ATTR_LIST_ENTRY):sizeof(struct-ATTR_LIST_ENTRY)
|-- i386-buildonly-randconfig-001-20231208
|   `-- fs-ntfs3-ntfs.h:error:static-assertion-failed-due-to-requirement-sizeof(struct-ATTR_LIST_ENTRY):sizeof(struct-ATTR_LIST_ENTRY)
|-- i386-buildonly-randconfig-003-20231208
|   `-- fs-ntfs3-ntfs.h:error:static-assertion-failed-due-to-requirement-sizeof(struct-ATTR_LIST_ENTRY):sizeof(struct-ATTR_LIST_ENTRY)
|-- i386-buildonly-randconfig-005-20231208
|   `-- fs-ntfs3-ntfs.h:error:static-assertion-failed-due-to-requirement-sizeof(struct-ATTR_LIST_ENTRY):sizeof(struct-ATTR_LIST_ENTRY)
|-- i386-buildonly-randconfig-006-20231208
|   `-- fs-ntfs3-ntfs.h:error:static-assertion-failed-due-to-requirement-sizeof(struct-ATTR_LIST_ENTRY):sizeof(struct-ATTR_LIST_ENTRY)
|-- i386-randconfig-002-20231208
|   `-- fs-ntfs3-ntfs.h:error:static-assertion-failed-due-to-requirement-sizeof(struct-ATTR_LIST_ENTRY):sizeof(struct-ATTR_LIST_ENTRY)
|-- i386-randconfig-053-20231208
|   `-- fs-ntfs3-ntfs.h:error:static-assertion-failed-due-to-requirement-sizeof(struct-ATTR_LIST_ENTRY):sizeof(struct-ATTR_LIST_ENTRY)
|-- i386-randconfig-054-20231208
|   `-- fs-ntfs3-ntfs.h:error:static-assertion-failed-due-to-requirement-sizeof(struct-ATTR_LIST_ENTRY):sizeof(struct-ATTR_LIST_ENTRY)
|-- i386-randconfig-061-20231208
|   |-- drivers-leds-leds-max5970.c:warning:variable-num_leds-set-but-not-used
|   |-- drivers-soc-qcom-pmic_pdcharger_ulog.c:sparse:sparse:incorrect-type-in-initializer-(different-base-types)-expected-restricted-__le32-usertype-opcode-got-int
|   |-- drivers-soc-qcom-pmic_pdcharger_ulog.c:sparse:sparse:incorrect-type-in-initializer-(different-base-types)-expected-restricted-__le32-usertype-owner-got-int
|   |-- drivers-soc-qcom-pmic_pdcharger_ulog.c:sparse:sparse:incorrect-type-in-initializer-(different-base-types)-expected-restricted-__le32-usertype-type-got-int
|   `-- lib-zstd-compress-zstd_fast.c:sparse:sparse:Using-plain-integer-as-NULL-pointer
|-- i386-randconfig-062-20231208
|   |-- fs-ntfs3-ntfs.h:error:static-assertion-failed-due-to-requirement-sizeof(struct-ATTR_LIST_ENTRY):sizeof(struct-ATTR_LIST_ENTRY)
|   `-- lib-zstd-compress-zstd_fast.c:sparse:sparse:Using-plain-integer-as-NULL-pointer
|-- i386-randconfig-063-20231208
|   |-- drivers-soc-qcom-pmic_pdcharger_ulog.c:sparse:sparse:incorrect-type-in-initializer-(different-base-types)-expected-restricted-__le32-usertype-opcode-got-int
|   |-- drivers-soc-qcom-pmic_pdcharger_ulog.c:sparse:sparse:incorrect-type-in-initializer-(different-base-types)-expected-restricted-__le32-usertype-owner-got-int
|   |-- drivers-soc-qcom-pmic_pdcharger_ulog.c:sparse:sparse:incorrect-type-in-initializer-(different-base-types)-expected-restricted-__le32-usertype-type-got-int
|   |-- fs-ntfs3-ntfs.h:error:static-assertion-failed-due-to-requirement-sizeof(struct-ATTR_LIST_ENTRY):sizeof(struct-ATTR_LIST_ENTRY)
|   `-- lib-zstd-compress-zstd_fast.c:sparse:sparse:Using-plain-integer-as-NULL-pointer
|-- i386-randconfig-141-20231208
|   `-- fs-ntfs3-ntfs.h:error:static-assertion-failed-due-to-requirement-sizeof(struct-ATTR_LIST_ENTRY):sizeof(struct-ATTR_LIST_ENTRY)
|-- powerpc-allmodconfig
|   `-- drivers-leds-leds-max5970.c:warning:variable-num_leds-set-but-not-used
|-- powerpc-allyesconfig
|   `-- drivers-leds-leds-max5970.c:warning:variable-num_leds-set-but-not-used
|-- s390-randconfig-r121-20231208
|   `-- lib-zstd-compress-zstd_fast.c:sparse:sparse:Using-plain-integer-as-NULL-pointer
|-- x86_64-allmodconfig
|   `-- drivers-leds-leds-max5970.c:warning:variable-num_leds-set-but-not-used
|-- x86_64-allyesconfig
|   `-- drivers-leds-leds-max5970.c:warning:variable-num_leds-set-but-not-used
|-- x86_64-buildonly-randconfig-006-20231208
|   `-- drivers-leds-leds-max5970.c:warning:variable-num_leds-set-but-not-used
|-- x86_64-randconfig-101-20231208
|   `-- drivers-leds-leds-max5970.c:warning:variable-num_leds-set-but-not-used
`-- x86_64-randconfig-161-20231208
    |-- lib-zstd-common-bits.h-ZSTD_countLeadingZeros32()-warn:inconsistent-indenting
    |-- lib-zstd-common-bits.h-ZSTD_countTrailingZeros32()-warn:inconsistent-indenting
    |-- lib-zstd-compress-..-common-bits.h-ZSTD_countLeadingZeros32()-warn:inconsistent-indenting
    |-- lib-zstd-compress-..-common-bits.h-ZSTD_countLeadingZeros64()-warn:inconsistent-indenting
    |-- lib-zstd-compress-..-common-bits.h-ZSTD_countTrailingZeros32()-warn:inconsistent-indenting
    |-- lib-zstd-compress-..-common-bits.h-ZSTD_countTrailingZeros64()-warn:inconsistent-indenting
    |-- lib-zstd-decompress-..-common-bits.h-ZSTD_countLeadingZeros32()-warn:inconsistent-indenting
    `-- lib-zstd-decompress-..-common-bits.h-ZSTD_countTrailingZeros64()-warn:inconsistent-indenting

elapsed time: 1469m

configs tested: 178
configs skipped: 2

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20231208   gcc  
arc                   randconfig-002-20231208   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                     am200epdkit_defconfig   clang
arm                                 defconfig   clang
arm                            dove_defconfig   clang
arm                   randconfig-001-20231208   clang
arm                   randconfig-002-20231208   clang
arm                   randconfig-003-20231208   clang
arm                   randconfig-004-20231208   clang
arm64                            alldefconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231208   clang
arm64                 randconfig-002-20231208   clang
arm64                 randconfig-003-20231208   clang
arm64                 randconfig-004-20231208   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231208   gcc  
csky                  randconfig-002-20231208   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20231208   clang
hexagon               randconfig-002-20231208   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231208   clang
i386         buildonly-randconfig-002-20231208   clang
i386         buildonly-randconfig-003-20231208   clang
i386         buildonly-randconfig-004-20231208   clang
i386         buildonly-randconfig-005-20231208   clang
i386         buildonly-randconfig-006-20231208   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20231208   clang
i386                  randconfig-002-20231208   clang
i386                  randconfig-003-20231208   clang
i386                  randconfig-004-20231208   clang
i386                  randconfig-005-20231208   clang
i386                  randconfig-006-20231208   clang
i386                  randconfig-011-20231208   gcc  
i386                  randconfig-012-20231208   gcc  
i386                  randconfig-013-20231208   gcc  
i386                  randconfig-014-20231208   gcc  
i386                  randconfig-015-20231208   gcc  
i386                  randconfig-016-20231208   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231208   gcc  
loongarch             randconfig-002-20231208   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                        bcm63xx_defconfig   clang
mips                          malta_defconfig   clang
mips                        maltaup_defconfig   clang
mips                          rb532_defconfig   gcc  
nios2                         3c120_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231208   gcc  
nios2                 randconfig-002-20231208   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20231208   gcc  
parisc                randconfig-002-20231208   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                    amigaone_defconfig   gcc  
powerpc                    ge_imp3a_defconfig   clang
powerpc               randconfig-001-20231208   clang
powerpc               randconfig-002-20231208   clang
powerpc               randconfig-003-20231208   clang
powerpc                    socrates_defconfig   gcc  
powerpc                     tqm5200_defconfig   clang
powerpc                     tqm8541_defconfig   gcc  
powerpc64             randconfig-001-20231208   clang
powerpc64             randconfig-002-20231208   clang
powerpc64             randconfig-003-20231208   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231208   clang
riscv                 randconfig-002-20231208   clang
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231208   gcc  
s390                  randconfig-002-20231208   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20231208   gcc  
sh                    randconfig-002-20231208   gcc  
sh                           se7206_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                       sparc32_defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231208   gcc  
sparc64               randconfig-002-20231208   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231208   clang
um                    randconfig-002-20231208   clang
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20231208   clang
x86_64       buildonly-randconfig-002-20231208   clang
x86_64       buildonly-randconfig-003-20231208   clang
x86_64       buildonly-randconfig-004-20231208   clang
x86_64       buildonly-randconfig-005-20231208   clang
x86_64       buildonly-randconfig-006-20231208   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231208   gcc  
x86_64                randconfig-002-20231208   gcc  
x86_64                randconfig-003-20231208   gcc  
x86_64                randconfig-004-20231208   gcc  
x86_64                randconfig-005-20231208   gcc  
x86_64                randconfig-006-20231208   gcc  
x86_64                randconfig-011-20231208   clang
x86_64                randconfig-012-20231208   clang
x86_64                randconfig-013-20231208   clang
x86_64                randconfig-014-20231208   clang
x86_64                randconfig-015-20231208   clang
x86_64                randconfig-016-20231208   clang
x86_64                randconfig-071-20231208   clang
x86_64                randconfig-072-20231208   clang
x86_64                randconfig-073-20231208   clang
x86_64                randconfig-074-20231208   clang
x86_64                randconfig-075-20231208   clang
x86_64                randconfig-076-20231208   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                  nommu_kc705_defconfig   gcc  
xtensa                randconfig-001-20231208   gcc  
xtensa                randconfig-002-20231208   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
