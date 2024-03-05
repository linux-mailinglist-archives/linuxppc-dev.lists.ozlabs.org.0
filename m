Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0896187266D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 19:16:03 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LjzwX9Tn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tq3f858GKz3vqn
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 05:16:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LjzwX9Tn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.21; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tq3d526Njz3vhp
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Mar 2024 05:15:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709662506; x=1741198506;
  h=date:from:to:cc:subject:message-id;
  bh=eskMSVHpUaY+mSWTTpw6grDM7oC3EnCtWC3a8Kt61Eo=;
  b=LjzwX9TnA1xxxx1PD7EEjmw4mDycp776HWiT7lZWv6Zlzak6ffwCatXO
   ajYNKKp2S0MsqLkCWZZ10ciP46Pded4MIy0PpTWn1+lIZCA6TRktoBCco
   eAfTm2OEsS1dkT49jgNUOMEnL0raWPDooCMCyAp4986i4RI7bOiL4cp0x
   1oS+RLkNSJW2zrbiYKKhUrigHdmnWerGu2wAiZgOO4xQrmuLj2yuQbsyp
   OFNUprftrGOZeqnhnAnimdshq3365PQrbD2i5zR4o9HoDxf/1gutB+Zzh
   7DxXewA7vTlS3Or7XRR3HN8RCljzLwoaPFUCNG1KX7trKxRo4ePoX1Xir
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="4158861"
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; 
   d="scan'208";a="4158861"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 10:15:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; 
   d="scan'208";a="14154161"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 05 Mar 2024 10:14:54 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhZJT-0003Y9-39;
	Tue, 05 Mar 2024 18:14:51 +0000
Date: Wed, 06 Mar 2024 02:14:23 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 11afac187274a6177a7ac82997f8691c0f469e41
Message-ID: <202403060216.deurYF3s-lkp@intel.com>
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
Cc: nouveau@lists.freedesktop.org, linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, mhi@lists.linux.dev, dri-devel@lists.freedesktop.org, io-uring@vger.kernel.org, Linux Memory Management List <linux-mm@kvack.org>, intel-wired-lan@lists.osuosl.org, linux-hardening@vger.kernel.org, linux-leds@vger.kernel.org, netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org, bpf@vger.kernel.org, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, intel-xe@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 11afac187274a6177a7ac82997f8691c0f469e41  Add linux-next specific files for 20240305

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202403051732.LuCJfZAh-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202403051807.vgb2hT4I-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202403051835.iqLGz996-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202403052102.hlG8I44z-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

ERROR: modpost: "acpi_device_notify_remove" [drivers/i2c/i2c-core.ko] undefined!
arch/powerpc/include/asm/reg_fsl_emb.h:18:9: error: impossible constraint in 'asm'
arch/powerpc/include/asm/reg_fsl_emb.h:18:9: warning: 'asm' operand 1 probably does not match constraints
drivers/perf/starfive_starlink_pmu.c:169:3: error: call to undeclared function 'writeq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
drivers/perf/starfive_starlink_pmu.c:191:8: error: call to undeclared function 'readq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
pinctrl-aw9523.c:(.init.text+0x14): relocation truncated to fit: R_NIOS2_CALL26 against `i2c_register_driver'
pinctrl-aw9523.c:(.text+0x13a8): relocation truncated to fit: R_NIOS2_CALL26 against `__devm_regmap_init_i2c'

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- alpha-randconfig-r133-20240305
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- arc-allmodconfig
|   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- arc-allyesconfig
|   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- arm-allmodconfig
|   |-- arch-arm-mach-omap2-prm33xx.c:warning:expecting-prototype-for-am33xx_prm_global_warm_sw_reset().-Prototype-was-for-am33xx_prm_global_sw_reset()-instead
|   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- arm-allyesconfig
|   |-- arch-arm-mach-omap2-prm33xx.c:warning:expecting-prototype-for-am33xx_prm_global_warm_sw_reset().-Prototype-was-for-am33xx_prm_global_sw_reset()-instead
|   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- arm-keystone_defconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- arm64-defconfig
|   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- arm64-randconfig-001-20240305
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- csky-allmodconfig
|   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- csky-allyesconfig
|   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- csky-randconfig-001-20240305
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- csky-randconfig-002-20240305
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- i386-allmodconfig
|   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- i386-allyesconfig
|   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- i386-buildonly-randconfig-003-20240305
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- i386-buildonly-randconfig-006-20240305
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- i386-randconfig-002-20240305
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- i386-randconfig-013-20240305
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- i386-randconfig-141-20240305
|   |-- drivers-net-ethernet-intel-i40e-i40e_main.c-i40e_veb_release()-error:uninitialized-symbol-vsi-.
|   |-- drivers-usb-typec-tcpm-tcpm.c-tcpm_pd_svdm()-error:uninitialized-symbol-modep_prime-.
|   `-- mm-page_owner.c-stack_print()-warn:unsigned-nr_entries-is-never-less-than-zero.
|-- loongarch-allmodconfig
|   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- loongarch-defconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- m68k-allmodconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- m68k-allyesconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- microblaze-allmodconfig
|   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- microblaze-allyesconfig
|   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- mips-allyesconfig
|   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- nios2-allmodconfig
|   |-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|   |-- pinctrl-aw9523.c:(.init.text):relocation-truncated-to-fit:R_NIOS2_CALL26-against-i2c_register_driver
|   `-- pinctrl-aw9523.c:(.text):relocation-truncated-to-fit:R_NIOS2_CALL26-against-__devm_regmap_init_i2c
|-- nios2-allyesconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- nios2-randconfig-r121-20240305
|   |-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|   `-- io_uring-io_uring.c:sparse:sparse:cast-to-restricted-io_req_flags_t
|-- nios2-randconfig-r123-20240305
|   |-- drivers-leds-flash-leds-ktd2692.c:sparse:sparse:symbol-ktd2692_timing-was-not-declared.-Should-it-be-static
|   |-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|   `-- io_uring-io_uring.c:sparse:sparse:cast-to-restricted-io_req_flags_t
|-- openrisc-allyesconfig
|   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- parisc-allmodconfig
|   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- parisc-allyesconfig
|   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- parisc-defconfig
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- parisc-randconfig-002-20240305
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- parisc-randconfig-r112-20240305
|   |-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|   `-- io_uring-io_uring.c:sparse:sparse:cast-to-restricted-io_req_flags_t
|-- parisc64-defconfig
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- powerpc-allmodconfig
|   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- powerpc-randconfig-001-20240305
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- powerpc-randconfig-r016-20220116
|   |-- arch-powerpc-include-asm-reg_fsl_emb.h:error:impossible-constraint-in-asm
|   `-- arch-powerpc-include-asm-reg_fsl_emb.h:warning:asm-operand-probably-does-not-match-constraints
|-- powerpc64-randconfig-r111-20240305
|   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|   |-- drivers-leds-flash-leds-ktd2692.c:sparse:sparse:symbol-ktd2692_timing-was-not-declared.-Should-it-be-static
|   `-- io_uring-io_uring.c:sparse:sparse:cast-to-restricted-io_req_flags_t
|-- riscv-randconfig-r113-20240305
|   |-- drivers-leds-flash-leds-ktd2692.c:sparse:sparse:symbol-ktd2692_timing-was-not-declared.-Should-it-be-static
|   |-- io_uring-io_uring.c:sparse:sparse:cast-to-restricted-io_req_flags_t
|   |-- lib-string_helpers.c:sparse:sparse:incompatible-types-for-operation-(-):
|   `-- lib-string_helpers.c:sparse:sparse:incompatible-types-in-conditional-expression-(different-types):
|-- s390-allyesconfig
|   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- s390-randconfig-001-20240305
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- sh-allmodconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- sh-allyesconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- sh-randconfig-002-20240305
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- sparc-allmodconfig
|   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- sparc-randconfig-001-20240305
|   |-- (.head.text):relocation-truncated-to-fit:R_SPARC_WDISP22-against-init.text
|   `-- (.init.text):relocation-truncated-to-fit:R_SPARC_WDISP22-against-symbol-leon_smp_cpu_startup-defined-in-.text-section-in-arch-sparc-kernel-trampoline_32.o
|-- sparc-randconfig-002-20240305
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- sparc-randconfig-r131-20240305
|   |-- (.head.text):relocation-truncated-to-fit:R_SPARC_WDISP22-against-init.text
|   |-- (.init.text):relocation-truncated-to-fit:R_SPARC_WDISP22-against-symbol-leon_smp_cpu_startup-defined-in-.text-section-in-arch-sparc-kernel-trampoline_32.o
|   |-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|   `-- io_uring-io_uring.c:sparse:sparse:cast-to-restricted-io_req_flags_t
|-- sparc64-allmodconfig
|   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- sparc64-allyesconfig
|   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- sparc64-randconfig-001-20240305
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- sparc64-randconfig-002-20240305
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- um-allyesconfig
|   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- x86_64-randconfig-003-20240305
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- x86_64-randconfig-121-20240305
|   |-- include-trace-..-..-drivers-bus-mhi-host-trace.h:sparse:sparse:cast-to-restricted-__le32
|   |-- include-trace-..-..-drivers-bus-mhi-host-trace.h:sparse:sparse:cast-to-restricted-__le64
|   |-- include-trace-..-..-drivers-bus-mhi-host-trace.h:sparse:sparse:restricted-__le32-degrades-to-integer
|   |-- include-trace-..-..-drivers-bus-mhi-host-trace.h:sparse:sparse:restricted-__le64-degrades-to-integer
|   `-- io_uring-io_uring.c:sparse:sparse:cast-to-restricted-io_req_flags_t
|-- x86_64-randconfig-161-20240305
|   `-- mm-page_owner.c-stack_print()-warn:unsigned-nr_entries-is-never-less-than-zero.
`-- xtensa-allyesconfig
    |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
    `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
clang_recent_errors
|-- arm-defconfig
|   |-- ERROR:__aeabi_uldivmod-drivers-gpu-drm-sun4i-sun4i-drm-hdmi.ko-undefined
|   |-- arch-arm-mach-omap2-prm33xx.c:warning:expecting-prototype-for-am33xx_prm_global_warm_sw_reset().-Prototype-was-for-am33xx_prm_global_sw_reset()-instead
|   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- arm-randconfig-003-20240305
|   `-- arch-arm-mach-omap2-prm33xx.c:warning:expecting-prototype-for-am33xx_prm_global_warm_sw_reset().-Prototype-was-for-am33xx_prm_global_sw_reset()-instead
|-- arm64-allmodconfig
|   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|   |-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|   `-- kernel-bpf-bpf_struct_ops.c:warning:bitwise-operation-between-different-enumeration-types-(-enum-bpf_type_flag-and-enum-bpf_reg_type-)
|-- hexagon-allmodconfig
|   |-- drivers-perf-starfive_starlink_pmu.c:error:call-to-undeclared-function-readq-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   |-- drivers-perf-starfive_starlink_pmu.c:error:call-to-undeclared-function-writeq-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- hexagon-allyesconfig
|   |-- drivers-perf-starfive_starlink_pmu.c:error:call-to-undeclared-function-readq-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   |-- drivers-perf-starfive_starlink_pmu.c:error:call-to-undeclared-function-writeq-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- hexagon-randconfig-r122-20240305
|   |-- fs-libfs.c:sparse:sparse:Using-plain-integer-as-NULL-pointer
|   `-- io_uring-io_uring.c:sparse:sparse:cast-to-restricted-io_req_flags_t
|-- i386-buildonly-randconfig-004-20240305
|   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- i386-randconfig-003-20240305
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- i386-randconfig-015-20240305
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- i386-randconfig-061-20240305
|   |-- include-trace-..-..-drivers-bus-mhi-host-trace.h:sparse:sparse:cast-to-restricted-__le32
|   |-- include-trace-..-..-drivers-bus-mhi-host-trace.h:sparse:sparse:cast-to-restricted-__le64
|   |-- include-trace-..-..-drivers-bus-mhi-host-trace.h:sparse:sparse:restricted-__le32-degrades-to-integer
|   |-- include-trace-..-..-drivers-bus-mhi-host-trace.h:sparse:sparse:restricted-__le64-degrades-to-integer
|   `-- io_uring-io_uring.c:sparse:sparse:cast-to-restricted-io_req_flags_t
|-- i386-randconfig-062-20240305
|   |-- kernel-power-energy_model.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-em_perf_state-table-got-struct-em_perf_state-noderef-__rcu
|   |-- kernel-power-energy_model.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-kref-kref-got-struct-kref-noderef-__rcu
|   |-- kernel-power-energy_model.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-void-const-objp-got-struct-em_perf_table-noderef-__rcu-assigned-em_table
|   `-- kernel-power-energy_model.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-em_perf_state-new_ps-got-struct-em_perf_state-noderef-__rcu
|-- i386-randconfig-063-20240305
|   |-- io_uring-io_uring.c:sparse:sparse:cast-to-restricted-io_req_flags_t
|   |-- kernel-power-energy_model.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-em_perf_state-table-got-struct-em_perf_state-noderef-__rcu
|   |-- kernel-power-energy_model.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-kref-kref-got-struct-kref-noderef-__rcu
|   |-- kernel-power-energy_model.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-void-const-objp-got-struct-em_perf_table-noderef-__rcu-assigned-em_table
|   `-- kernel-power-energy_model.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-em_perf_state-new_ps-got-struct-em_perf_state-noderef-__rcu
|-- powerpc-allyesconfig
|   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|   |-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|   `-- kernel-bpf-bpf_struct_ops.c:warning:bitwise-operation-between-different-enumeration-types-(-enum-bpf_type_flag-and-enum-bpf_reg_type-)
|-- riscv-allmodconfig
|   |-- ERROR:acpi_device_notify_remove-drivers-i2c-i2c-core.ko-undefined
|   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|   |-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|   `-- kernel-bpf-bpf_struct_ops.c:warning:bitwise-operation-between-different-enumeration-types-(-enum-bpf_type_flag-and-enum-bpf_reg_type-)
|-- riscv-allyesconfig
|   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|   |-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|   `-- kernel-bpf-bpf_struct_ops.c:warning:bitwise-operation-between-different-enumeration-types-(-enum-bpf_type_flag-and-enum-bpf_reg_type-)
|-- riscv-defconfig
|   |-- ERROR:acpi_device_notify_remove-drivers-i2c-i2c-core.ko-undefined
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- riscv-randconfig-001-20240305
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- s390-allmodconfig
|   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|   |-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|   `-- kernel-bpf-bpf_struct_ops.c:warning:bitwise-operation-between-different-enumeration-types-(-enum-bpf_type_flag-and-enum-bpf_reg_type-)
|-- s390-defconfig
|   `-- kernel-bpf-bpf_struct_ops.c:warning:bitwise-operation-between-different-enumeration-types-(-enum-bpf_type_flag-and-enum-bpf_reg_type-)
|-- x86_64-allmodconfig
|   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- x86_64-allyesconfig
|   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- x86_64-buildonly-randconfig-005-20240305
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- x86_64-randconfig-013-20240305
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- x86_64-randconfig-076-20240305
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- x86_64-randconfig-122-20240305
|   |-- include-trace-..-..-drivers-bus-mhi-host-trace.h:sparse:sparse:cast-to-restricted-__le32
|   |-- include-trace-..-..-drivers-bus-mhi-host-trace.h:sparse:sparse:cast-to-restricted-__le64
|   |-- include-trace-..-..-drivers-bus-mhi-host-trace.h:sparse:sparse:restricted-__le32-degrades-to-integer
|   |-- include-trace-..-..-drivers-bus-mhi-host-trace.h:sparse:sparse:restricted-__le64-degrades-to-integer
|   `-- io_uring-io_uring.c:sparse:sparse:cast-to-restricted-io_req_flags_t
|-- x86_64-randconfig-123-20240305
|   |-- include-trace-..-..-drivers-bus-mhi-host-trace.h:sparse:sparse:cast-to-restricted-__le32
|   |-- include-trace-..-..-drivers-bus-mhi-host-trace.h:sparse:sparse:cast-to-restricted-__le64
|   |-- include-trace-..-..-drivers-bus-mhi-host-trace.h:sparse:sparse:restricted-__le32-degrades-to-integer
|   |-- include-trace-..-..-drivers-bus-mhi-host-trace.h:sparse:sparse:restricted-__le64-degrades-to-integer
|   `-- io_uring-io_uring.c:sparse:sparse:cast-to-restricted-io_req_flags_t
`-- x86_64-randconfig-r132-20240305
    |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
    |-- drivers-gpu-drm-xe-xe_hw_engine_class_sysfs.c:error:unused-function-pdev_to_xe_device-Werror-Wunused-function
    |-- drivers-gpu-drm-xe-xe_hw_engine_class_sysfs.c:error:unused-function-to_xe_device-Werror-Wunused-function
    |-- include-trace-..-..-drivers-bus-mhi-host-trace.h:sparse:sparse:cast-to-restricted-__le32
    |-- include-trace-..-..-drivers-bus-mhi-host-trace.h:sparse:sparse:cast-to-restricted-__le64
    |-- include-trace-..-..-drivers-bus-mhi-host-trace.h:sparse:sparse:restricted-__le32-degrades-to-integer
    |-- include-trace-..-..-drivers-bus-mhi-host-trace.h:sparse:sparse:restricted-__le64-degrades-to-integer
    `-- io_uring-io_uring.c:sparse:sparse:cast-to-restricted-io_req_flags_t

elapsed time: 749m

configs tested: 179
configs skipped: 3

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                      axs103_smp_defconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240305   gcc  
arc                   randconfig-002-20240305   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                        clps711x_defconfig   clang
arm                                 defconfig   clang
arm                        keystone_defconfig   gcc  
arm                           omap1_defconfig   gcc  
arm                   randconfig-001-20240305   clang
arm                   randconfig-002-20240305   gcc  
arm                   randconfig-003-20240305   clang
arm                   randconfig-004-20240305   gcc  
arm                             rpc_defconfig   clang
arm                           u8500_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240305   gcc  
arm64                 randconfig-002-20240305   clang
arm64                 randconfig-003-20240305   gcc  
arm64                 randconfig-004-20240305   gcc  
csky                             alldefconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240305   gcc  
csky                  randconfig-002-20240305   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240305   clang
hexagon               randconfig-002-20240305   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240305   clang
i386         buildonly-randconfig-002-20240305   gcc  
i386         buildonly-randconfig-003-20240305   gcc  
i386         buildonly-randconfig-004-20240305   clang
i386         buildonly-randconfig-005-20240305   clang
i386         buildonly-randconfig-006-20240305   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240305   clang
i386                  randconfig-002-20240305   gcc  
i386                  randconfig-003-20240305   clang
i386                  randconfig-004-20240305   gcc  
i386                  randconfig-005-20240305   gcc  
i386                  randconfig-006-20240305   gcc  
i386                  randconfig-011-20240305   gcc  
i386                  randconfig-012-20240305   gcc  
i386                  randconfig-013-20240305   gcc  
i386                  randconfig-014-20240305   gcc  
i386                  randconfig-015-20240305   clang
i386                  randconfig-016-20240305   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240305   gcc  
loongarch             randconfig-002-20240305   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                          multi_defconfig   gcc  
m68k                        stmark2_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                      maltaaprp_defconfig   clang
mips                           mtx1_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240305   gcc  
nios2                 randconfig-002-20240305   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240305   gcc  
parisc                randconfig-002-20240305   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                        fsp2_defconfig   gcc  
powerpc                     ksi8560_defconfig   gcc  
powerpc               randconfig-001-20240305   gcc  
powerpc               randconfig-002-20240305   gcc  
powerpc               randconfig-003-20240305   gcc  
powerpc                     stx_gp3_defconfig   clang
powerpc64             randconfig-001-20240305   clang
powerpc64             randconfig-002-20240305   clang
powerpc64             randconfig-003-20240305   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240305   clang
riscv                 randconfig-002-20240305   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240305   gcc  
s390                  randconfig-002-20240305   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240305   gcc  
sh                    randconfig-002-20240305   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc                       sparc32_defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240305   gcc  
sparc64               randconfig-002-20240305   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240305   gcc  
um                    randconfig-002-20240305   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240305   clang
x86_64       buildonly-randconfig-002-20240305   clang
x86_64       buildonly-randconfig-003-20240305   clang
x86_64       buildonly-randconfig-004-20240305   clang
x86_64       buildonly-randconfig-005-20240305   clang
x86_64       buildonly-randconfig-006-20240305   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240305   clang
x86_64                randconfig-002-20240305   clang
x86_64                randconfig-003-20240305   gcc  
x86_64                randconfig-004-20240305   clang
x86_64                randconfig-005-20240305   clang
x86_64                randconfig-006-20240305   gcc  
x86_64                randconfig-011-20240305   gcc  
x86_64                randconfig-012-20240305   gcc  
x86_64                randconfig-013-20240305   clang
x86_64                randconfig-014-20240305   gcc  
x86_64                randconfig-015-20240305   clang
x86_64                randconfig-016-20240305   clang
x86_64                randconfig-071-20240305   gcc  
x86_64                randconfig-072-20240305   gcc  
x86_64                randconfig-073-20240305   clang
x86_64                randconfig-074-20240305   clang
x86_64                randconfig-075-20240305   gcc  
x86_64                randconfig-076-20240305   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240305   gcc  
xtensa                randconfig-002-20240305   gcc  
xtensa                         virt_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
