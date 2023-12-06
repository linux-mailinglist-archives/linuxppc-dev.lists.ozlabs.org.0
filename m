Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC96806609
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Dec 2023 05:12:37 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cQaqVrlx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SlPBV6jl4z3dBH
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Dec 2023 15:12:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cQaqVrlx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SlP9Z5j3Bz3bbW
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Dec 2023 15:11:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701835907; x=1733371907;
  h=date:from:to:cc:subject:message-id;
  bh=CVFGsSsfUy62FhgnFw/WQA+qWzDe203shlMH+YoZmOQ=;
  b=cQaqVrlxhqURBCWP1XsnpF/+div7JMXq34G/EXcM8y3csiP/ufQ0CeIU
   dRfYNx7norvmIALCjGlNiDTBYwRLmhdRU0tH2VXGiQBHBCre9bh4JA/CG
   wjPX6DEy3oqrUAxIyqZrOaZVEj+P82V2w8qjtLQFrC/l48TKIHrwmJrkj
   F84Cv7v5syzsPqoRew/WRycRNo6129sAfOkdbDtt0NVJeDMG4TZ6+E3bG
   es1hyqdU3kyhA85v29naiqY+VuqoheCOBa2ib+O5F4eoS0dP3zC+GH6Kq
   oMBMca6KWvTXdS6g/LwPbrsEwrBnCIHPLZCPhIKAzxd1y0683KSsQPO4M
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="460492266"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="460492266"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 20:11:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="1102684530"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="1102684530"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 05 Dec 2023 20:11:34 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAjG0-000AEW-1I;
	Wed, 06 Dec 2023 04:11:32 +0000
Date: Wed, 06 Dec 2023 12:11:06 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 0f5f12ac05f36f117e793656c3f560625e927f1b
Message-ID: <202312061258.nAVYPFq2-lkp@intel.com>
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
Cc: linux-bcachefs@vger.kernel.org, linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org, linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev, linux-block@vger.kernel.org, Linux Memory Management List <linux-mm@kvack.org>, amd-gfx@lists.freedesktop.org, linux-leds@vger.kernel.org, sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 0f5f12ac05f36f117e793656c3f560625e927f1b  Add linux-next specific files for 20231205

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202312051416.YiRWCYmp-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202312051418.JkBRBDyP-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202312051419.DsbnPGym-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202312051913.e5iif8Qz-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202312051935.IXiYU8Kn-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202312052245.yFpBSgNH-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202312060025.BdeqZrWx-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202312060311.Tnsv2fl2-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202312060355.M0eJtq4X-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202312061137.QgjJ4nTc-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

aarch64-linux-ld: qcom_stats.c:(.text+0x470): undefined reference to `qmp_send'
arch/mips/kernel/crash.c:96:6: warning: no previous prototype for 'default_machine_crash_shutdown' [-Wmissing-prototypes]
arch/mips/kernel/machine_kexec.c:161:6: warning: no previous prototype for 'kexec_nonboot_cpu_jump' [-Wmissing-prototypes]
arch/mips/kernel/machine_kexec.c:170:6: warning: conflicting types for 'kexec_reboot'; have 'void(void)'
arch/mips/kernel/machine_kexec.c:170:6: warning: no previous prototype for 'kexec_reboot' [-Wmissing-prototypes]
arch/mips/kernel/machine_kexec.c:77:17: error: 'kexec_args' undeclared (first use in this function)
drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:1671:9: sparse:    struct dma_fence *
drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:1671:9: sparse:    struct dma_fence [noderef] __rcu *
drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c:2765:36: sparse:    struct dma_fence *
drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c:2765:36: sparse:    struct dma_fence [noderef] __rcu *
drivers/leds/leds-sun50i-a100.c:309:12: error: call to __compiletime_assert_280 declared with 'error' attribute: FIELD_PREP: value too large for the field
drivers/media/i2c/saa6752hs.c:598:18: error: implicit declaration of function 'v4l2_subdev_state_get_format' [-Werror=implicit-function-declaration]
qcom_stats.c:(.text+0x33c): undefined reference to `qmp_send'
qcom_stats.c:(.text+0x398): undefined reference to `__aeabi_uldivmod'
qcom_stats.c:(.text+0x6c4): undefined reference to `__udivdi3'
qcom_stats.c:(.text+0x8a0): undefined reference to `qmp_get'
qcom_stats.c:(.text.qcom_ddr_stats_show+0x14c): undefined reference to `__udivdi3'

Unverified Error/Warning (likely false positive, please contact us if interested):

drivers/gpu/drm/i915/display/intel_fbdev_fb.c:111 intel_fbdev_fb_fill_info() error: uninitialized symbol 'vaddr'.

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-randconfig-r013-20211213
|   |-- (.init.text):undefined-reference-to-__auxiliary_driver_register
|   |-- (.text):undefined-reference-to-auxiliary_device_init
|   |-- alpha-linux-ld:(.init.text):undefined-reference-to-__auxiliary_driver_register
|   |-- alpha-linux-ld:(.text):undefined-reference-to-__auxiliary_device_add
|   `-- alpha-linux-ld:(.text):undefined-reference-to-auxiliary_device_init
|-- arc-randconfig-c031-20221114
|   `-- drivers-media-i2c-saa6752hs.c:error:implicit-declaration-of-function-v4l2_subdev_state_get_format
|-- arm-allyesconfig
|   `-- qcom_stats.c:(.text):undefined-reference-to-__aeabi_uldivmod
|-- arm64-randconfig-r034-20230701
|   |-- aarch64-linux-ld:qcom_stats.c:(.text):undefined-reference-to-qmp_send
|   |-- qcom_stats.c:(.text):undefined-reference-to-qmp_get
|   `-- qcom_stats.c:(.text):undefined-reference-to-qmp_send
|-- i386-randconfig-061-20231205
|   `-- lib-zstd-compress-zstd_fast.c:sparse:sparse:Using-plain-integer-as-NULL-pointer
|-- i386-randconfig-063-20231205
|   `-- lib-zstd-compress-zstd_fast.c:sparse:sparse:Using-plain-integer-as-NULL-pointer
|-- i386-randconfig-141-20231205
|   |-- block-bdev.c-bdev_open_by_dev()-warn:possible-memory-leak-of-handle
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_connectors.c-amdgpu_connector_dvi_detect()-warn:inconsistent-indenting
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ras.c-amdgpu_ras_query_error_status_helper()-error:we-previously-assumed-info-could-be-null-(see-line-)
|   |-- drivers-gpu-drm-drm_gpuvm.c-drm_gpuvm_exec_lock_range()-error:uninitialized-symbol-ret-.
|   |-- drivers-hwtracing-stm-core.c-stm_register_device()-error:double-free-of-stm
|   |-- fs-bcachefs-btree_update_interior.c-bch2_btree_update_start()-warn:inconsistent-returns-c-gc_lock-.
|   |-- fs-bcachefs-btree_write_buffer.c-bch2_btree_write_buffer_flush_locked()-error:we-previously-assumed-iter.path-could-be-null-(see-line-)
|   |-- fs-bcachefs-recovery.c-bch2_journal_replay()-error:uninitialized-symbol-ret-.
|   |-- lib-zstd-common-bits.h-ZSTD_countLeadingZeros32()-warn:inconsistent-indenting
|   |-- lib-zstd-common-bits.h-ZSTD_countTrailingZeros32()-warn:inconsistent-indenting
|   |-- lib-zstd-compress-..-common-bits.h-ZSTD_countLeadingZeros32()-warn:inconsistent-indenting
|   |-- lib-zstd-compress-..-common-bits.h-ZSTD_countLeadingZeros64()-warn:inconsistent-indenting
|   |-- lib-zstd-compress-..-common-bits.h-ZSTD_countTrailingZeros32()-warn:inconsistent-indenting
|   |-- lib-zstd-compress-..-common-bits.h-ZSTD_countTrailingZeros64()-warn:inconsistent-indenting
|   |-- lib-zstd-decompress-..-common-bits.h-ZSTD_countLeadingZeros32()-warn:inconsistent-indenting
|   |-- lib-zstd-decompress-..-common-bits.h-ZSTD_countTrailingZeros32()-warn:inconsistent-indenting
|   `-- lib-zstd-decompress-..-common-bits.h-ZSTD_countTrailingZeros64()-warn:inconsistent-indenting
|-- mips-allyesconfig
|   `-- qcom_stats.c:(.text.qcom_ddr_stats_show):undefined-reference-to-__udivdi3
|-- mips-randconfig-r006-20221108
|   `-- cache.c:(.text):undefined-reference-to-r3k_cache_init
|-- mips-randconfig-r021-20230305
|   |-- arch-mips-kernel-crash.c:warning:no-previous-prototype-for-default_machine_crash_shutdown
|   |-- arch-mips-kernel-machine_kexec.c:warning:conflicting-types-for-kexec_reboot-have-void(void)
|   |-- arch-mips-kernel-machine_kexec.c:warning:no-previous-prototype-for-kexec_nonboot_cpu_jump
|   `-- arch-mips-kernel-machine_kexec.c:warning:no-previous-prototype-for-kexec_reboot
|-- mips-randconfig-r032-20220731
|   `-- arch-mips-kernel-machine_kexec.c:error:kexec_args-undeclared-(first-use-in-this-function)
|-- mips-randconfig-s051-20220905
|   `-- arch-mips-mm-cache.c:(.text.cpu_cache_init):undefined-reference-to-r3k_cache_init
|-- nios2-randconfig-r112-20231205
|   `-- lib-zstd-compress-zstd_fast.c:sparse:sparse:Using-plain-integer-as-NULL-pointer
|-- parisc-randconfig-r133-20231205
|   `-- lib-zstd-compress-zstd_fast.c:sparse:sparse:Using-plain-integer-as-NULL-pointer
|-- powerpc-randconfig-003-20231205
|   `-- qcom_stats.c:(.text):undefined-reference-to-__udivdi3
|-- powerpc-randconfig-r111-20231205
|   |-- lib-raid6-altivec4.c:sparse:incomplete-type-static-toplevel-unative_t
|   |-- lib-raid6-altivec4.c:sparse:int-static-signed-toplevel-__preempt_count_sub(-...-)
|   |-- lib-raid6-altivec4.c:sparse:int-static-signed-toplevel-disable_kernel_altivec(-...-)
|   |-- lib-raid6-altivec4.c:sparse:int-static-toplevel-unative_t
|   |-- lib-raid6-altivec8.c:sparse:incomplete-type-static-toplevel-unative_t
|   |-- lib-raid6-altivec8.c:sparse:int-static-signed-toplevel-__preempt_count_sub(-...-)
|   |-- lib-raid6-altivec8.c:sparse:int-static-signed-toplevel-disable_kernel_altivec(-...-)
|   |-- lib-raid6-altivec8.c:sparse:int-static-toplevel-unative_t
|   `-- lib-zstd-compress-zstd_fast.c:sparse:sparse:Using-plain-integer-as-NULL-pointer
|-- powerpc-randconfig-r123-20231205
|   `-- lib-zstd-compress-zstd_fast.c:sparse:sparse:Using-plain-integer-as-NULL-pointer
|-- powerpc64-randconfig-002-20231205
|   `-- arch-powerpc-include-asm-book3s-pgtable-64k.h:warning:no-return-statement-in-function-returning-non-void
|-- sh-randconfig-r035-20230105
|   `-- standard-input:Error:missing-expression-in-.size-directive
|-- sh-randconfig-r112-20231205
|   `-- include-drm-bridge-aux-bridge.h:sparse:sparse:Using-plain-integer-as-NULL-pointer
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
|-- sparc-randconfig-001-20231205
|   `-- arch-sparc-kernel-module.c:warning:variable-strtab-set-but-not-used
|-- sparc-randconfig-r006-20230514
|   `-- parport_pc.c:(.text):undefined-reference-to-ebus_dma_prepare
|-- sparc-randconfig-r036-20230809
|   `-- sparc-linux-ld:arch-sparc-include-asm-parport.h:(.text):undefined-reference-to-ebus_dma_enable
|-- sparc-randconfig-r062-20231205
|   |-- arch-sparc-kernel-module.c:warning:variable-strtab-set-but-not-used
|   `-- arch-sparc-mm-init_64.c:warning:variable-pagecv_flag-set-but-not-used
|-- sparc-randconfig-r121-20231205
|   |-- arch-sparc-kernel-module.c:warning:variable-strtab-set-but-not-used
|   |-- arch-sparc-mm-leon_mm.c:warning:variable-paddrbase-set-but-not-used
|   |-- arch-sparc-mm-srmmu.c:warning:variable-clear-set-but-not-used
|   `-- lib-zstd-compress-zstd_fast.c:sparse:sparse:Using-plain-integer-as-NULL-pointer
|-- sparc-sparc64_defconfig
|   |-- arch-sparc-kernel-module.c:warning:variable-strtab-set-but-not-used
|   `-- arch-sparc-mm-init_64.c:warning:variable-hv_pgsz_idx-set-but-not-used
|-- sparc64-allmodconfig
|   |-- arch-sparc-kernel-module.c:warning:variable-strtab-set-but-not-used
|   `-- arch-sparc-mm-init_64.c:warning:variable-hv_pgsz_idx-set-but-not-used
|-- sparc64-allyesconfig
|   |-- arch-sparc-kernel-module.c:warning:variable-strtab-set-but-not-used
|   `-- arch-sparc-mm-init_64.c:warning:variable-hv_pgsz_idx-set-but-not-used
|-- sparc64-defconfig
|   |-- arch-sparc-kernel-module.c:warning:variable-strtab-set-but-not-used
|   `-- arch-sparc-mm-init_64.c:warning:variable-hv_pgsz_idx-set-but-not-used
`-- x86_64-randconfig-161-20231205
    |-- drivers-hwtracing-stm-core.c-stm_register_device()-error:double-free-of-stm
    |-- lib-zstd-common-bits.h-ZSTD_countLeadingZeros32()-warn:inconsistent-indenting
    |-- lib-zstd-common-bits.h-ZSTD_countTrailingZeros32()-warn:inconsistent-indenting
    |-- lib-zstd-decompress-..-common-bits.h-ZSTD_countLeadingZeros32()-warn:inconsistent-indenting
    `-- lib-zstd-decompress-..-common-bits.h-ZSTD_countTrailingZeros64()-warn:inconsistent-indenting
clang_recent_errors
|-- arm-randconfig-r133-20231204
|   `-- arch-arm-kernel-machine_kexec.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-void-const-volatile-noderef-__user-ptr-got-restricted-__be32-usertype
|-- arm64-allmodconfig
|   `-- drivers-leds-leds-max5970.c:warning:variable-num_leds-set-but-not-used
|-- arm64-allyesconfig
|   `-- drivers-leds-leds-max5970.c:warning:variable-num_leds-set-but-not-used
|-- hexagon-allmodconfig
|   `-- drivers-leds-leds-max5970.c:warning:variable-num_leds-set-but-not-used
|-- hexagon-allyesconfig
|   |-- drivers-leds-leds-max5970.c:warning:variable-num_leds-set-but-not-used
|   |-- ld.lld:error:vmlinux.a(arch-hexagon-kernel-head.o):(.init.text):relocation-R_HEX_B22_PCREL-out-of-range:is-not-in-references-__vmnewmap
|   |-- ld.lld:error:vmlinux.a(arch-hexagon-kernel-head.o):(.init.text):relocation-R_HEX_B22_PCREL-out-of-range:is-not-in-references-__vmsetvec
|   `-- ld.lld:error:vmlinux.a(arch-hexagon-kernel-head.o):(.init.text):relocation-R_HEX_B22_PCREL-out-of-range:is-not-in-references-memset
|-- hexagon-randconfig-r113-20231205
|   `-- lib-zstd-compress-zstd_fast.c:sparse:sparse:Using-plain-integer-as-NULL-pointer
|-- i386-allmodconfig
|   |-- drivers-leds-leds-max5970.c:warning:variable-num_leds-set-but-not-used
|   `-- fs-bcachefs-replicas.c:error:builtin-functions-must-be-directly-called
|-- i386-allyesconfig
|   |-- drivers-leds-leds-max5970.c:warning:variable-num_leds-set-but-not-used
|   `-- fs-bcachefs-replicas.c:error:builtin-functions-must-be-directly-called
|-- i386-randconfig-061-20231206
|   |-- drivers-soc-qcom-pmic_pdcharger_ulog.c:sparse:sparse:incorrect-type-in-initializer-(different-base-types)-expected-restricted-__le32-usertype-opcode-got-int
|   |-- drivers-soc-qcom-pmic_pdcharger_ulog.c:sparse:sparse:incorrect-type-in-initializer-(different-base-types)-expected-restricted-__le32-usertype-owner-got-int
|   `-- drivers-soc-qcom-pmic_pdcharger_ulog.c:sparse:sparse:incorrect-type-in-initializer-(different-base-types)-expected-restricted-__le32-usertype-type-got-int
|-- powerpc-allmodconfig
|   `-- drivers-leds-leds-max5970.c:warning:variable-num_leds-set-but-not-used
|-- powerpc-allyesconfig
|   `-- drivers-leds-leds-max5970.c:warning:variable-num_leds-set-but-not-used
|-- powerpc64-randconfig-r123-20231126
|   `-- drivers-leds-leds-sun50i-a100.c:error:call-to-__compiletime_assert_NNN-declared-with-error-attribute:FIELD_PREP:value-too-large-for-the-field
|-- powerpc64-randconfig-r131-20231205
|   |-- lib-raid6-altivec4.c:sparse:incomplete-type-static-toplevel-unative_t
|   |-- lib-raid6-altivec4.c:sparse:int-static-signed-toplevel-__preempt_count_sub(-...-)
|   |-- lib-raid6-altivec4.c:sparse:int-static-signed-toplevel-disable_kernel_altivec(-...-)
|   |-- lib-raid6-altivec4.c:sparse:int-static-toplevel-unative_t
|   |-- lib-raid6-altivec8.c:sparse:incomplete-type-static-toplevel-unative_t
|   |-- lib-raid6-altivec8.c:sparse:int-static-signed-toplevel-__preempt_count_sub(-...-)
|   |-- lib-raid6-altivec8.c:sparse:int-static-signed-toplevel-disable_kernel_altivec(-...-)
|   |-- lib-raid6-altivec8.c:sparse:int-static-toplevel-unative_t
|   `-- lib-zstd-compress-zstd_fast.c:sparse:sparse:Using-plain-integer-as-NULL-pointer
|-- s390-randconfig-001-20231205
|   `-- drivers-leds-leds-max5970.c:warning:variable-num_leds-set-but-not-used
|-- s390-randconfig-002-20231205
|   `-- drivers-leds-leds-max5970.c:warning:variable-num_leds-set-but-not-used
|-- x86_64-allmodconfig
|   `-- drivers-leds-leds-max5970.c:warning:variable-num_leds-set-but-not-used
|-- x86_64-allyesconfig
|   `-- drivers-leds-leds-max5970.c:warning:variable-num_leds-set-but-not-used
|-- x86_64-randconfig-121-20231205
|   `-- lib-zstd-compress-zstd_fast.c:sparse:sparse:Using-plain-integer-as-NULL-pointer
|-- x86_64-randconfig-122-20231205
|   `-- lib-zstd-compress-zstd_fast.c:sparse:sparse:Using-plain-integer-as-NULL-pointer
|-- x86_64-randconfig-123-20231203
|   |-- drivers-gpu-drm-amd-amdgpu-..-amdkfd-kfd_process.c:sparse:sparse:incompatible-types-in-comparison-expression-(different-address-spaces):
|   |-- drivers-gpu-drm-amd-amdgpu-..-amdkfd-kfd_process.c:sparse:struct-dma_fence
|   |-- drivers-gpu-drm-amd-amdgpu-..-amdkfd-kfd_process.c:sparse:struct-dma_fence-noderef-__rcu
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_amdkfd_gpuvm.c:sparse:sparse:incompatible-types-in-comparison-expression-(different-address-spaces):
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_amdkfd_gpuvm.c:sparse:struct-dma_fence
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_amdkfd_gpuvm.c:sparse:struct-dma_fence-noderef-__rcu
|-- x86_64-randconfig-123-20231205
|   `-- lib-zstd-compress-zstd_fast.c:sparse:sparse:Using-plain-integer-as-NULL-pointer
|-- x86_64-randconfig-161-20231206
|   `-- drivers-gpu-drm-i915-display-intel_fbdev_fb.c-intel_fbdev_fb_fill_info()-error:uninitialized-symbol-vaddr-.
`-- x86_64-randconfig-r132-20231205
    `-- lib-zstd-compress-zstd_fast.c:sparse:sparse:Using-plain-integer-as-NULL-pointer

elapsed time: 1453m

configs tested: 177
configs skipped: 3

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                          axs103_defconfig   gcc  
arc                      axs103_smp_defconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20231205   gcc  
arc                   randconfig-002-20231205   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                     am200epdkit_defconfig   clang
arm                         axm55xx_defconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20231205   gcc  
arm                   randconfig-002-20231205   gcc  
arm                   randconfig-003-20231205   gcc  
arm                   randconfig-004-20231205   gcc  
arm                           sunxi_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231205   gcc  
arm64                 randconfig-002-20231205   gcc  
arm64                 randconfig-003-20231205   gcc  
arm64                 randconfig-004-20231205   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231205   gcc  
csky                  randconfig-002-20231205   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20231205   clang
hexagon               randconfig-002-20231205   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231205   gcc  
i386         buildonly-randconfig-002-20231205   gcc  
i386         buildonly-randconfig-003-20231205   gcc  
i386         buildonly-randconfig-004-20231205   gcc  
i386         buildonly-randconfig-005-20231205   gcc  
i386         buildonly-randconfig-006-20231205   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231205   gcc  
i386                  randconfig-002-20231205   gcc  
i386                  randconfig-003-20231205   gcc  
i386                  randconfig-004-20231205   gcc  
i386                  randconfig-005-20231205   gcc  
i386                  randconfig-006-20231205   gcc  
i386                  randconfig-011-20231205   clang
i386                  randconfig-012-20231205   clang
i386                  randconfig-013-20231205   clang
i386                  randconfig-014-20231205   clang
i386                  randconfig-015-20231205   clang
i386                  randconfig-016-20231205   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231205   gcc  
loongarch             randconfig-002-20231205   gcc  
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
mips                           xway_defconfig   gcc  
nios2                            alldefconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231205   gcc  
nios2                 randconfig-002-20231205   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                       virt_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-64bit_defconfig   gcc  
parisc                randconfig-001-20231205   gcc  
parisc                randconfig-002-20231205   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                 canyonlands_defconfig   gcc  
powerpc                      ep88xc_defconfig   gcc  
powerpc                 mpc8315_rdb_defconfig   clang
powerpc               randconfig-001-20231205   gcc  
powerpc               randconfig-002-20231205   gcc  
powerpc               randconfig-003-20231205   gcc  
powerpc64             randconfig-001-20231205   gcc  
powerpc64             randconfig-002-20231205   gcc  
powerpc64             randconfig-003-20231205   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231205   gcc  
riscv                 randconfig-002-20231205   gcc  
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231205   clang
s390                  randconfig-002-20231205   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                               j2_defconfig   gcc  
sh                          r7780mp_defconfig   gcc  
sh                    randconfig-001-20231205   gcc  
sh                    randconfig-002-20231205   gcc  
sh                           se7751_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                       sparc64_defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231205   gcc  
sparc64               randconfig-002-20231205   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231205   gcc  
um                    randconfig-002-20231205   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20231205   gcc  
x86_64       buildonly-randconfig-002-20231205   gcc  
x86_64       buildonly-randconfig-003-20231205   gcc  
x86_64       buildonly-randconfig-004-20231205   gcc  
x86_64       buildonly-randconfig-005-20231205   gcc  
x86_64       buildonly-randconfig-006-20231205   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231205   clang
x86_64                randconfig-002-20231205   clang
x86_64                randconfig-003-20231205   clang
x86_64                randconfig-004-20231205   clang
x86_64                randconfig-005-20231205   clang
x86_64                randconfig-006-20231205   clang
x86_64                randconfig-011-20231205   gcc  
x86_64                randconfig-012-20231205   gcc  
x86_64                randconfig-013-20231205   gcc  
x86_64                randconfig-014-20231205   gcc  
x86_64                randconfig-015-20231205   gcc  
x86_64                randconfig-016-20231205   gcc  
x86_64                randconfig-071-20231205   gcc  
x86_64                randconfig-072-20231205   gcc  
x86_64                randconfig-073-20231205   gcc  
x86_64                randconfig-074-20231205   gcc  
x86_64                randconfig-075-20231205   gcc  
x86_64                randconfig-076-20231205   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-002-20231205   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
