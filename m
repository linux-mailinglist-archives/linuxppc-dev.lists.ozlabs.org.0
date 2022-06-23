Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B5F558A2B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jun 2022 22:34:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTX6Y735xz3cJC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 06:34:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=f+bK+PwG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=f+bK+PwG;
	dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LTX5t6grFz3bq3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jun 2022 06:33:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656016435; x=1687552435;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=xVP6IBvS10VcE/UoVWHMP5OyXkvp5D6taRQrJ8Y7uqU=;
  b=f+bK+PwGQ4L40PkVvNJKmulUVEsLibamfWQLuv8oxWw2d8zIES3RpbOu
   QUCfSIMPjMl65vV0kWDpDUr4zkAAFSxhK8cOxJZjjaGxKDuwScfrQ5njA
   nNCQqN2GZUWI2uLWg6wFMUF45wgCDvyJ1jG/yiaYSEBT7O5L97k7QA9Bx
   s/MGbfIUPYxLojExmcFvCKDWwCmjwIC4972sUsJPOsXkIu8vOXG0XKnPe
   F3VoPYRQ6CzxPTuAAiXc2X4X9DDcilrXi7sPzYON2Pct+yPL0E18/HwsU
   mWIKgtNGHHUyhmanIE8lpZ468VEtWai0m8Pslsa+kdEA52BynhEkN9SdD
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10387"; a="280877906"
X-IronPort-AV: E=Sophos;i="5.92,217,1650956400"; 
   d="scan'208";a="280877906"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2022 13:33:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,217,1650956400"; 
   d="scan'208";a="621456992"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 23 Jun 2022 13:33:38 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o4TWE-00035o-0j;
	Thu, 23 Jun 2022 20:33:38 +0000
Date: Fri, 24 Jun 2022 04:33:36 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 08897940f458ee55416cf80ab13d2d8b9f20038e
Message-ID: <62b4ce20.4xihIb4cSyCXNJ12%lkp@intel.com>
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
Cc: linux-perf-users@vger.kernel.org, kvm@vger.kernel.org, linux-scsi@vger.kernel.org, netdev@vger.kernel.org, linux-staging@lists.linux.dev, amd-gfx@lists.freedesktop.org, linux-xfs@vger.kernel.org, Linux Memory Management List <linux-mm@kvack.org>, linux-mediatek@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 08897940f458ee55416cf80ab13d2d8b9f20038e  Add linux-next specific files for 20220623

Error/Warning reports:

https://lore.kernel.org/linux-mm/202206212029.Yr5m7Cd3-lkp@intel.com
https://lore.kernel.org/linux-mm/202206212033.3lgl72Fw-lkp@intel.com
https://lore.kernel.org/lkml/202206071511.FI7WLdZo-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

arch/powerpc/kernel/interrupt.c:542:55: error: suggest braces around empty body in an 'if' statement [-Werror=empty-body]
arch/powerpc/kernel/interrupt.c:542:55: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link.c:1025:33: warning: variable 'pre_connection_type' set but not used [-Wunused-but-set-variable]
net/ipv6/raw.c:335:25: warning: variable 'saddr' set but not used [-Wunused-but-set-variable]
net/ipv6/raw.c:335:32: warning: variable 'saddr' set but not used [-Wunused-but-set-variable]
net/ipv6/raw.c:335:33: warning: variable 'daddr' set but not used [-Wunused-but-set-variable]
net/ipv6/raw.c:335:40: warning: variable 'daddr' set but not used [-Wunused-but-set-variable]

Unverified Error/Warning (likely false positive, please contact us if interested):

drivers/ufs/host/ufs-mediatek.c:1391:5: sparse: sparse: symbol 'ufs_mtk_runtime_suspend' was not declared. Should it be static?
drivers/ufs/host/ufs-mediatek.c:1405:5: sparse: sparse: symbol 'ufs_mtk_runtime_resume' was not declared. Should it be static?

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allmodconfig
|   |-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- alpha-allyesconfig
|   |-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- arc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link.c:warning:variable-pre_connection_type-set-but-not-used
|   |-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- arm-allyesconfig
|   |-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- arm-aspeed_g5_defconfig
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- arm-defconfig
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- arm-u8500_defconfig
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- arm64-allyesconfig
|   |-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- arm64-randconfig-s031-20220622
|   |-- drivers-misc-lkdtm-cfi.c:sparse:sparse:Using-plain-integer-as-NULL-pointer
|   |-- drivers-ufs-host-ufs-mediatek.c:sparse:sparse:symbol-ufs_mtk_runtime_resume-was-not-declared.-Should-it-be-static
|   |-- drivers-ufs-host-ufs-mediatek.c:sparse:sparse:symbol-ufs_mtk_runtime_suspend-was-not-declared.-Should-it-be-static
|   |-- drivers-vfio-pci-vfio_pci_config.c:sparse:sparse:restricted-pci_power_t-degrades-to-integer
|   |-- fs-xfs-xfs_file.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-restricted-vm_fault_t-usertype-ret-got-int
|   |-- fs-xfs-xfs_file.c:sparse:sparse:incorrect-type-in-return-expression-(different-base-types)-expected-int-got-restricted-vm_fault_t
|   `-- kernel-signal.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-lockdep_map-const-lock-got-struct-lockdep_map-noderef-__rcu
|-- i386-allyesconfig
|   |-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   |-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|   `-- ntb_perf.c:(.text):undefined-reference-to-__umoddi3
|-- i386-debian-10.3
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- i386-debian-10.3-kselftests
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- i386-defconfig
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- i386-randconfig-a001
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   |-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|   `-- ntb_perf.c:(.text):undefined-reference-to-__umoddi3
|-- i386-randconfig-a003
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- i386-randconfig-a005
|   |-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- i386-randconfig-a012
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- i386-randconfig-a014
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- i386-randconfig-a016
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- i386-randconfig-m021
|   |-- arch-x86-events-core.c-init_hw_perf_events()-warn:missing-error-code-err
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- ia64-allmodconfig
|   |-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
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
|-- m68k-atari_defconfig
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- m68k-sun3x_defconfig
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- microblaze-allyesconfig
|   |-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- microblaze-randconfig-r013-20220622
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- mips-allyesconfig
|   |-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- mips-decstation_r4k_defconfig
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- openrisc-randconfig-r021-20220622
|   |-- pcs-xpcs.c:(.text):undefined-reference-to-phylink_mii_c22_pcs_decode_state
|   `-- pcs-xpcs.c:(.text):undefined-reference-to-phylink_mii_c22_pcs_encode_advertisement
|-- openrisc-randconfig-s032-20220622
|   |-- fs-xfs-xfs_file.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-restricted-vm_fault_t-usertype-ret-got-int
|   `-- kernel-signal.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-lockdep_map-const-lock-got-struct-lockdep_map-noderef-__rcu
|-- parisc64-allyesconfig
|   |-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- powerpc-allmodconfig
|   |-- arch-powerpc-kernel-interrupt.c:warning:suggest-braces-around-empty-body-in-an-if-statement
|   |-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- powerpc-allnoconfig
|   `-- arch-powerpc-kernel-interrupt.c:error:suggest-braces-around-empty-body-in-an-if-statement
|-- powerpc-arches_defconfig
|   `-- arch-powerpc-kernel-interrupt.c:error:suggest-braces-around-empty-body-in-an-if-statement
|-- powerpc-mgcoge_defconfig
|   `-- arch-powerpc-kernel-interrupt.c:error:suggest-braces-around-empty-body-in-an-if-statement
|-- powerpc-ppc6xx_defconfig
|   |-- arch-powerpc-kernel-interrupt.c:error:suggest-braces-around-empty-body-in-an-if-statement
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- powerpc-randconfig-r001-20220622
|   `-- arch-powerpc-kernel-interrupt.c:warning:suggest-braces-around-empty-body-in-an-if-statement
|-- powerpc-taishan_defconfig
|   `-- arch-powerpc-kernel-interrupt.c:error:suggest-braces-around-empty-body-in-an-if-statement
|-- riscv-rv32_defconfig
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- sh-allmodconfig
|   |-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- sh-allyesconfig
|   |-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- sparc-allyesconfig
|   |-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- sparc-randconfig-r003-20220622
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- x86_64-allyesconfig
|   |-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- x86_64-defconfig
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- x86_64-randconfig-a002
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   |-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|   |-- pcs-xpcs.c:(.text):undefined-reference-to-phylink_mii_c22_pcs_decode_state
|   `-- pcs-xpcs.c:(.text):undefined-reference-to-phylink_mii_c22_pcs_encode_advertisement
|-- x86_64-randconfig-a004
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- x86_64-randconfig-a006
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- x86_64-randconfig-a011
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- x86_64-randconfig-a013
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
`-- x86_64-rhel-8.3-syz
    |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
    `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used

clang_recent_errors
|-- arm-colibri_pxa300_defconfig
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- hexagon-randconfig-r045-20220622
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- i386-randconfig-a002
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- i386-randconfig-a004
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- i386-randconfig-a011
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- i386-randconfig-a013
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- mips-malta_kvm_defconfig
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- x86_64-randconfig-a001
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- x86_64-randconfig-a003
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- x86_64-randconfig-a012
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
|-- x86_64-randconfig-a014
|   |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
|   `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used
`-- x86_64-randconfig-a016
    |-- net-ipv6-raw.c:warning:variable-daddr-set-but-not-used
    `-- net-ipv6-raw.c:warning:variable-saddr-set-but-not-used

elapsed time: 726m

configs tested: 89
configs skipped: 3

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig
m68k                          atari_defconfig
arc                    vdk_hs38_smp_defconfig
sh                             espt_defconfig
m68k                        m5407c3_defconfig
arm                         lubbock_defconfig
powerpc                     taishan_defconfig
mips                 decstation_r4k_defconfig
sh                                  defconfig
powerpc                      arches_defconfig
nios2                         10m50_defconfig
sh                        sh7785lcr_defconfig
powerpc                      ppc6xx_defconfig
arm                       aspeed_g5_defconfig
arm                           u8500_defconfig
xtensa                              defconfig
m68k                          sun3x_defconfig
arm                          pxa3xx_defconfig
sh                           se7206_defconfig
ia64                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
mips                             allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
sh                               allmodconfig
i386                              debian-10.3
i386                   debian-10.3-kselftests
i386                                defconfig
i386                             allyesconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a002
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arc                  randconfig-r043-20220622
arc                  randconfig-r043-20220623
riscv                randconfig-r042-20220623
s390                 randconfig-r044-20220623
riscv                             allnoconfig
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz

clang tested configs:
mips                           ip22_defconfig
powerpc                          g5_defconfig
arm                  colibri_pxa300_defconfig
mips                           ip28_defconfig
arm                     am200epdkit_defconfig
powerpc                      katmai_defconfig
powerpc                 xes_mpc85xx_defconfig
mips                      malta_kvm_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a016
x86_64                        randconfig-a012
x86_64                        randconfig-a014
i386                          randconfig-a013
i386                          randconfig-a015
i386                          randconfig-a011
hexagon              randconfig-r041-20220623
hexagon              randconfig-r041-20220622
s390                 randconfig-r044-20220622
hexagon              randconfig-r045-20220622
riscv                randconfig-r042-20220622
hexagon              randconfig-r045-20220623

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
