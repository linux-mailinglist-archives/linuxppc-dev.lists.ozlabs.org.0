Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EAA553E55
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jun 2022 00:12:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LSLN72Svhz3cg4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jun 2022 08:12:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cVDjiEOX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cVDjiEOX;
	dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LSLMR6Sbwz30F8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jun 2022 08:11:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655849492; x=1687385492;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=9NbVKjA2l2L/qGvXTLnS4RyFyYSq0q4alQPvEo9eP1A=;
  b=cVDjiEOXh5c5iX1RQK1N1bfdJUbRx1XEpsqLgbNIFAp/PZ8OlLI6gwLX
   ScTsRpnzhO6nolVynRjt2M+prCn0czlm0omoZuqIyzsEnstOrxCxlBjEF
   nt2fuc5YTmG59PKv0kD/bAhrK/+UcaO2Olq6ArKLe++8gQ+qgorz8W1wG
   yIKLz3lu/8r0kLbfEQO1yRRhz4YgMb/JkdI1T7PhyAiY1IyZ6aGIs3L5q
   rrLLWHcpXRIMvRCLknvrZcD+EgZmeOReOsHOqdTVqM2NQXsQhYhzy7XFF
   f9bpjaEKhCxCJMTqtcoSugd75LX2MqKQ1oxAtsdcm8Oc5GFdpKPAFUnHV
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="280296939"
X-IronPort-AV: E=Sophos;i="5.92,210,1650956400"; 
   d="scan'208";a="280296939"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2022 15:11:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,210,1650956400"; 
   d="scan'208";a="730031253"
Received: from lkp-server02.sh.intel.com (HELO a67cc04a5eeb) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 21 Jun 2022 15:11:17 -0700
Received: from kbuild by a67cc04a5eeb with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o3m5c-0000UT-By;
	Tue, 21 Jun 2022 22:11:16 +0000
Date: Wed, 22 Jun 2022 06:10:27 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 34d1d36073ea4d4c532e8c8345627a9702be799e
Message-ID: <62b241d3.CmOrZi26Vac8nqGm%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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
Cc: linux-perf-users@vger.kernel.org, kvm@vger.kernel.org, netdev@vger.kernel.org, linux-staging@lists.linux.dev, dri-devel@lists.freedesktop.org, linux-xfs@vger.kernel.org, Linux Memory Management List <linux-mm@kvack.org>, ntb@lists.linux.dev, amd-gfx@lists.freedesktop.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 34d1d36073ea4d4c532e8c8345627a9702be799e  Add linux-next specific files for 20220621

Error/Warning reports:

https://lore.kernel.org/linux-mm/202206212029.Yr5m7Cd3-lkp@intel.com
https://lore.kernel.org/linux-mm/202206212033.3lgl72Fw-lkp@intel.com
https://lore.kernel.org/lkml/202206071511.FI7WLdZo-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

ERROR: modpost: "acpi_dev_for_each_child" [drivers/mfd/mfd-core.ko] undefined!
arch/powerpc/kernel/interrupt.c:542:55: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
drivers/ntb/test/ntb_perf.c:1067: undefined reference to `__umoddi3'
irq-xilinx-intc.c:(.init.text+0x8c): undefined reference to `of_iomap'
microblaze-linux-ld: drivers/ntb/test/ntb_perf.c:1095: undefined reference to `__umoddi3'
net/ipv6/raw.c:335:25: warning: variable 'saddr' set but not used [-Wunused-but-set-variable]
net/ipv6/raw.c:335:32: warning: variable 'saddr' set but not used [-Wunused-but-set-variable]
net/ipv6/raw.c:335:33: warning: variable 'daddr' set but not used [-Wunused-but-set-variable]
net/ipv6/raw.c:335:40: warning: variable 'daddr' set but not used [-Wunused-but-set-variable]
net/ipv6/raw.c:338:25: warning: variable 'saddr' set but not used [-Wunused-but-set-variable]
net/ipv6/raw.c:338:32: warning: variable 'saddr' set but not used [-Wunused-but-set-variable]
net/ipv6/raw.c:338:33: warning: variable 'daddr' set but not used [-Wunused-but-set-variable]
net/ipv6/raw.c:338:40: warning: variable 'daddr' set but not used [-Wunused-but-set-variable]
s390-linux-ld: irq-xilinx-intc.c:(.init.text+0x3ba): undefined reference to `iounmap'

Unverified Error/Warning (likely false positive, please contact us if interested):

drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:9143:27: warning: variable 'abo' set but not used [-Wunused-but-set-variable]

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-abo-set-but-not-used
|   |-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- alpha-buildonly-randconfig-r001-20220620
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-abo-set-but-not-used
|-- alpha-buildonly-randconfig-r006-20220621
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- arc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-abo-set-but-not-used
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- arm-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-abo-set-but-not-used
|   |-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- arm-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-abo-set-but-not-used
|   |-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- arm-defconfig
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- arm-randconfig-r022-20220620
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- arm-randconfig-r031-20220619
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- arm64-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-abo-set-but-not-used
|   |-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- arm64-defconfig
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- i386-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-abo-set-but-not-used
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- i386-debian-10.3-kselftests
|   `-- ERROR:acpi_dev_for_each_child-drivers-mfd-mfd-core.ko-undefined
|-- i386-randconfig-a001
|   `-- ntb_perf.c:(.text):undefined-reference-to-__umoddi3
|-- i386-randconfig-a004-20220620
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- i386-randconfig-c021
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- i386-randconfig-m021
|   |-- arch-x86-events-core.c-init_hw_perf_events()-warn:missing-error-code-err
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- i386-randconfig-s001
|   |-- drivers-vfio-pci-vfio_pci_config.c:sparse:sparse:restricted-pci_power_t-degrades-to-integer
|   |-- kernel-signal.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-lockdep_map-const-lock-got-struct-lockdep_map-noderef-__rcu
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- i386-randconfig-s002
|   |-- fs-xfs-xfs_file.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-restricted-vm_fault_t-usertype-ret-got-int
|   |-- kernel-signal.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-lockdep_map-const-lock-got-struct-lockdep_map-noderef-__rcu
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- ia64-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-abo-set-but-not-used
|   |-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- ia64-randconfig-r021-20220620
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-abo-set-but-not-used
|-- ia64-randconfig-r023-20220619
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- m68k-allmodconfig
|   |-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- m68k-allyesconfig
|   |-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- m68k-defconfig
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- m68k-randconfig-r026-20220620
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- m68k-virt_defconfig
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- microblaze-buildonly-randconfig-r001-20220622
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- microblaze-randconfig-r005-20220620
|   |-- microblaze-linux-ld:drivers-ntb-test-ntb_perf.c:undefined-reference-to-__umoddi3
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- microblaze-randconfig-r024-20220619
|   `-- drivers-ntb-test-ntb_perf.c:undefined-reference-to-__umoddi3
|-- mips-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-abo-set-but-not-used
|   |-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- mips-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-abo-set-but-not-used
|   |-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- mips-buildonly-randconfig-r005-20220621
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- nios2-allyesconfig
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- nios2-randconfig-s032-20220622
|   |-- fs-xfs-xfs_file.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-restricted-vm_fault_t-usertype-ret-got-int
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- parisc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-abo-set-but-not-used
|   |-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- parisc-defconfig
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- parisc-randconfig-m031-20220622
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_discovery.c-amdgpu_discovery_reg_base_init()-error:testing-array-offset-adev-vcn.num_vcn_inst-after-use.
|   |-- drivers-gpu-drm-vc4-vc4_perfmon.c-vc4_perfmon_get()-warn:variable-dereferenced-before-check-perfmon-(see-line-)
|   |-- drivers-gpu-drm-vc4-vc4_perfmon.c-vc4_perfmon_get_values_ioctl()-warn:variable-dereferenced-before-check-perfmon-(see-line-)
|   `-- drivers-gpu-drm-vc4-vc4_validate.c-vc4_check_tex_size()-warn:signedness-bug-returning
|-- parisc-randconfig-r036-20220619
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-abo-set-but-not-used
|-- parisc64-defconfig
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- powerpc-allmodconfig
|   |-- arch-powerpc-kernel-interrupt.c:warning:suggest-braces-around-empty-body-in-an-if-statement
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-abo-set-but-not-used
|   |-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- powerpc-allyesconfig
|   |-- arch-powerpc-kernel-interrupt.c:warning:suggest-braces-around-empty-body-in-an-if-statement
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-abo-set-but-not-used
|   |-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- riscv-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-abo-set-but-not-used
|   |-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- riscv-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-abo-set-but-not-used
|   |-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- riscv-defconfig
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- riscv-rv32_defconfig
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- s390-allmodconfig
|   |-- irq-xilinx-intc.c:(.init.text):undefined-reference-to-of_iomap
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   |-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|   `-- s390-linux-ld:irq-xilinx-intc.c:(.init.text):undefined-reference-to-iounmap
|-- s390-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-abo-set-but-not-used
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- s390-buildonly-randconfig-r004-20220621
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- s390-defconfig
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- sh-allmodconfig
|   |-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- sparc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-abo-set-but-not-used
|   |-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- sparc-buildonly-randconfig-r006-20220622
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- sparc-defconfig
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- sparc-randconfig-r021-20220619
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-abo-set-but-not-used
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- sparc-sparc64_defconfig
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- sparc64-randconfig-r024-20220619
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- x86_64-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-abo-set-but-not-used
|   |-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- x86_64-randconfig-a001-20220620
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- x86_64-randconfig-a005-20220620
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- x86_64-randconfig-a006-20220620
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- x86_64-randconfig-c022
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- x86_64-randconfig-m001
|   |-- arch-x86-events-core.c-init_hw_perf_events()-warn:missing-error-code-err
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- x86_64-rhel-8.3
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- x86_64-rhel-8.3-func
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- x86_64-rhel-8.3-kselftests
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- x86_64-rhel-8.3-kunit
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- x86_64-rhel-8.3-syz
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
`-- xtensa-allyesconfig
    |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-abo-set-but-not-used
    `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used

clang_recent_errors
|-- arm-multi_v5_defconfig
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- hexagon-randconfig-r041-20220619
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- i386-randconfig-a012-20220620
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- x86_64-randconfig-a011-20220620
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- x86_64-randconfig-a012-20220620
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- x86_64-randconfig-a014-20220620
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- x86_64-randconfig-a015-20220620
|   |-- drivers-ufs-host-tc-dwc-g210-pltfrm.c:warning:unused-variable-tc_dwc_g210_pltfm_match
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
`-- x86_64-randconfig-a016-20220620
    |-- drivers-ufs-host-tc-dwc-g210-pltfrm.c:warning:unused-variable-tc_dwc_g210_pltfm_match
    |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
    `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used

elapsed time: 725m

configs tested: 108
configs skipped: 3

gcc tested configs:
arm                              allmodconfig
arm                              allyesconfig
arm64                            allyesconfig
arm                                 defconfig
arm64                               defconfig
arc                              alldefconfig
mips                         rt305x_defconfig
arc                     haps_hs_smp_defconfig
sparc                       sparc64_defconfig
sh                          rsk7203_defconfig
arm                        realview_defconfig
powerpc                 mpc837x_rdb_defconfig
powerpc                     redwood_defconfig
sh                           se7724_defconfig
m68k                           virt_defconfig
sh                         apsh4a3a_defconfig
powerpc                 mpc837x_mds_defconfig
arm                           h3600_defconfig
arm                         cm_x300_defconfig
sh                 kfr2r09-romimage_defconfig
powerpc                       holly_defconfig
xtensa                generic_kc705_defconfig
ia64                                defconfig
ia64                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
nios2                               defconfig
arc                              allyesconfig
alpha                               defconfig
csky                                defconfig
alpha                            allyesconfig
nios2                            allyesconfig
sh                               allmodconfig
arc                                 defconfig
xtensa                           allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
mips                             allyesconfig
parisc                              defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
s390                             allyesconfig
parisc64                            defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allmodconfig
powerpc                          allyesconfig
x86_64               randconfig-a003-20220620
x86_64               randconfig-a004-20220620
x86_64               randconfig-a002-20220620
x86_64               randconfig-a001-20220620
x86_64               randconfig-a005-20220620
x86_64               randconfig-a006-20220620
i386                 randconfig-a003-20220620
i386                 randconfig-a001-20220620
i386                 randconfig-a002-20220620
i386                 randconfig-a004-20220620
i386                 randconfig-a005-20220620
i386                 randconfig-a006-20220620
arc                  randconfig-r043-20220619
riscv                randconfig-r042-20220619
arc                  randconfig-r043-20220620
s390                 randconfig-r044-20220619
riscv                             allnoconfig
riscv                            allyesconfig
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
riscv                          rv32_defconfig
riscv                    nommu_virt_defconfig
riscv                               defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                           rhel-8.3-syz
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                                  kexec
x86_64                               rhel-8.3
x86_64                           allyesconfig

clang tested configs:
arm                        multi_v5_defconfig
mips                           ip27_defconfig
mips                      bmips_stb_defconfig
arm                              alldefconfig
x86_64               randconfig-a013-20220620
x86_64               randconfig-a012-20220620
x86_64               randconfig-a015-20220620
x86_64               randconfig-a016-20220620
x86_64               randconfig-a011-20220620
x86_64               randconfig-a014-20220620
i386                 randconfig-a012-20220620
i386                 randconfig-a013-20220620
i386                 randconfig-a011-20220620
i386                 randconfig-a016-20220620
i386                 randconfig-a014-20220620
i386                 randconfig-a015-20220620
hexagon              randconfig-r045-20220619
hexagon              randconfig-r045-20220620
riscv                randconfig-r042-20220620
hexagon              randconfig-r041-20220619
hexagon              randconfig-r041-20220620
s390                 randconfig-r044-20220620

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
