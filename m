Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB577DC14F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Oct 2023 21:36:41 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BsLjkqnv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SK4n339vmz3cZ9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Oct 2023 07:36:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BsLjkqnv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SK4m902sfz2xmC
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Oct 2023 07:35:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698698153; x=1730234153;
  h=date:from:to:cc:subject:message-id;
  bh=J6IDuqW9c7NxU08fkaG/SOxz6ZaN37AGqfF/SrOEJdw=;
  b=BsLjkqnvP3+YaNp8hxtAnOj/SyqgHmbY8oRGTNaK31Jkd5+LBSxvQdbT
   DB3b6QmZ9VU5EpT9oAcO6cLa5FRaDmCzfhSD+xjYLYCLQyf11iIK6jDkT
   QBAdyDlcPqUlXfEunocmrzX7DiMAMFz/AiKcNjwU/P0dauZSM+J2EDayX
   DbxPWFjg/ee7TXRSaRTRVGOGul90Lgy4E4bDsKeNjvji5i0e+nDs1C4EV
   Gse9UHZGM4RDNhvnA1Ij2HYMJSU42YAPujBsvcIGdz4I6AkkVc9AMp6WJ
   YmzUzMsfO4zu12+GDc9Uh7Hh1o4TOF9B3+zFGmKMnpwkdAHdbUe/FQFIP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="387978770"
X-IronPort-AV: E=Sophos;i="6.03,264,1694761200"; 
   d="scan'208";a="387978770"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2023 13:35:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="830792546"
X-IronPort-AV: E=Sophos;i="6.03,264,1694761200"; 
   d="scan'208";a="830792546"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 30 Oct 2023 13:35:41 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxYz4-000DY2-0T;
	Mon, 30 Oct 2023 20:35:38 +0000
Date: Tue, 31 Oct 2023 04:35:23 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 c503e3eec382ac708ee7adf874add37b77c5d312
Message-ID: <202310310457.5LusQqF6-lkp@intel.com>
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
Cc: loongarch@lists.linux.dev, linux-bluetooth@vger.kernel.org, linux-pci@vger.kernel.org, intel-gfx@lists.freedesktop.org, linux-sh@vger.kernel.org, amd-gfx@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, Linux Memory Management List <linux-mm@kvack.org>, linux-sparse@vger.kernel.org, linux-riscv@lists.infradead.org, linux-cxl@vger.kernel.org, linux-gpio@vger.kernel.org, netdev@vger.kernel.org, sparclinux@vger.kernel.org, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: c503e3eec382ac708ee7adf874add37b77c5d312  Add linux-next specific files for 20231030

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202310052201.AnVbpgPr-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202310121157.aRky475m-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202310171905.azfrKoID-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202310261059.USL6VstF-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202310302025.Pokm9vEs-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202310302043.as36UFED-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202310302206.Pkr5eBDi-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202310302338.MpPQAr10-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202310310055.RDWloNPr-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/iio/imu/bosch,bma400.yaml
aarch64-linux-ld: drivers/cxl/core/pci.c:921:(.text+0xbbc): undefined reference to `pci_print_aer'
arch/loongarch/kvm/mmu.c:411:6: warning: no previous prototype for 'kvm_unmap_gfn_range' [-Wmissing-prototypes]
arch/loongarch/kvm/mmu.c:420:48: error: invalid use of undefined type 'struct kvm_gfn_range'
arch/loongarch/kvm/mmu.c:422:1: error: control reaches end of non-void function [-Werror=return-type]
arch/loongarch/kvm/mmu.c:424:6: warning: no previous prototype for 'kvm_set_spte_gfn' [-Wmissing-prototypes]
arch/loongarch/kvm/mmu.c:456:6: warning: no previous prototype for 'kvm_age_gfn' [-Wmissing-prototypes]
arch/loongarch/kvm/mmu.c:468:6: warning: no previous prototype for 'kvm_test_age_gfn' [-Wmissing-prototypes]
arch/loongarch/kvm/mmu.c:787:24: error: 'struct kvm' has no member named 'mmu_invalidate_seq'; did you mean 'mn_invalidate_lock'?
arch/loongarch/kvm/mmu.c:810:13: error: implicit declaration of function 'mmu_invalidate_retry_hva' [-Werror=implicit-function-declaration]
arch/riscv/include/asm/mmio.h:67:(.text+0xd66): undefined reference to `pci_print_aer'
csky-linux-ld: pci.c:(.text+0x6e8): undefined reference to `pci_print_aer'
drivers/cxl/core/pci.c:921: undefined reference to `pci_print_aer'
drivers/cxl/core/pci.c:921:(.text+0xbc0): undefined reference to `pci_print_aer'
drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c:1105 dcn35_clk_mgr_construct() warn: variable dereferenced before check 'ctx->dc_bios' (see line 1032)
drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c:1105 dcn35_clk_mgr_construct() warn: variable dereferenced before check 'ctx->dc_bios->integrated_info' (see line 1032)
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:286:45: warning: '%s' directive output may be truncated writing up to 29 bytes into a region of size 23 [-Wformat-truncation=]
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:286:52: warning: '%s' directive output may be truncated writing up to 29 bytes into a region of size 23 [-Wformat-truncation=]
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu14/smu_v14_0.c:72:45: warning: '%s' directive output may be truncated writing up to 29 bytes into a region of size 23 [-Wformat-truncation=]
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu14/smu_v14_0.c:72:52: warning: '%s' directive output may be truncated writing up to 29 bytes into a region of size 23 [-Wformat-truncation=]
drivers/hwtracing/coresight/coresight-etm4x-core.c:1183:24: warning: result of comparison of constant 256 with expression of type 'u8' (aka 'unsigned char') is always false [-Wtautological-constant-out-of-range-compare]
include/linux/atomic/atomic-arch-fallback.h:384:27: error: implicit declaration of function 'arch_cmpxchg_local'; did you mean 'raw_cmpxchg_local'? [-Werror=implicit-function-declaration]
include/linux/compiler.h:212:29: error: pasting "__addressable_" and "(" does not give a valid preprocessing token
include/linux/export.h:47:9: error: pasting "__export_symbol_" and "(" does not give a valid preprocessing token
include/linux/stddef.h:8:15: error: expected declaration specifiers or '...' before '(' token
include/linux/stddef.h:8:16: error: expected identifier or '(' before 'void'
include/linux/stddef.h:8:23: error: expected ')' before numeric constant
include/linux/stddef.h:8:24: error: pasting ")" and "218" does not give a valid preprocessing token
kernel/bpf/task_iter.c:917:29: error: use of undeclared identifier 'CSS_TASK_ITER_THREADED'
kernel/bpf/task_iter.c:917:7: error: use of undeclared identifier 'CSS_TASK_ITER_PROCS'
kernel/bpf/task_iter.c:919:14: error: 'CSS_TASK_ITER_PROCS' undeclared (first use in this function)
kernel/bpf/task_iter.c:919:36: error: 'CSS_TASK_ITER_THREADED' undeclared (first use in this function)
kernel/bpf/task_iter.c:925:46: error: invalid application of 'sizeof' to an incomplete type 'struct css_task_iter'
kernel/bpf/task_iter.c:927:60: error: invalid application of 'sizeof' to incomplete type 'struct css_task_iter'
kernel/bpf/task_iter.c:928:2: error: call to undeclared function 'css_task_iter_start'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
kernel/bpf/task_iter.c:930:9: error: implicit declaration of function 'css_task_iter_start'; did you mean 'task_seq_start'? [-Werror=implicit-function-declaration]
kernel/bpf/task_iter.c:938:9: error: call to undeclared function 'css_task_iter_next'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
kernel/bpf/task_iter.c:938:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'struct task_struct *' [-Wint-conversion]
kernel/bpf/task_iter.c:940:16: error: implicit declaration of function 'css_task_iter_next'; did you mean 'class_dev_iter_next'? [-Werror=implicit-function-declaration]
kernel/bpf/task_iter.c:947:2: error: call to undeclared function 'css_task_iter_end'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
kernel/bpf/task_iter.c:949:9: error: implicit declaration of function 'css_task_iter_end' [-Werror=implicit-function-declaration]
ld: drivers/cxl/core/pci.c:921: undefined reference to `pci_print_aer'
loongarch64-linux-ld: drivers/cxl/core/pci.c:921:(.text+0xa38): undefined reference to `pci_print_aer'
pci.c:(.text+0x662): undefined reference to `pci_print_aer'
powerpc-linux-ld: pci.c:(.text+0xf10): undefined reference to `pci_print_aer'
riscv64-linux-ld: pci.c:(.text+0x11ec): undefined reference to `pci_print_aer'

Unverified Error/Warning (likely false positive, please contact us if interested):

drivers/pci/controller/dwc/pcie-rcar-gen4.c:439:15: warning: cast to smaller integer type 'enum dw_pcie_device_mode' from 'const void *' [-Wvoid-pointer-to-enum-cast]
net/bluetooth/hci_event.c:3274 hci_conn_request_evt() warn: variable dereferenced before check 'hdev' (see line 3264)

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|-- alpha-buildonly-randconfig-r002-20220223
|   `-- include-linux-compiler_types.h:error:expression-in-static-assertion-is-not-an-integer
|-- arc-randconfig-001-20231030
|   `-- include-linux-atomic-atomic-arch-fallback.h:error:implicit-declaration-of-function-arch_cmpxchg_local
|-- arc-randconfig-r043-20211006
|   |-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:BUILD_BUG_ON-failed:
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:BUILD_BUG_ON-failed:(PTRS_PER_PTE-sizeof(pte_t))-PAGE_SIZE
|-- arm-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|-- arm-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|-- arm64-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|-- arm64-buildonly-randconfig-r003-20220511
|   `-- aarch64-linux-ld:drivers-cxl-core-pci.c:(.text):undefined-reference-to-pci_print_aer
|-- csky-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|-- csky-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|-- csky-randconfig-001-20231030
|   |-- csky-linux-ld:pci.c:(.text):undefined-reference-to-pci_print_aer
|   `-- pci.c:(.text):undefined-reference-to-pci_print_aer
|-- csky-randconfig-002-20231030
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|-- csky-randconfig-r034-20230910
|   `-- standard-input:Error:The-instruction-is-not-recognized.
|-- i386-randconfig-141-20231030
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-clk_mgr-dcn35-dcn35_clk_mgr.c-dcn35_clk_mgr_construct()-warn:variable-dereferenced-before-check-ctx-dc_bios-(see-line-)
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-clk_mgr-dcn35-dcn35_clk_mgr.c-dcn35_clk_mgr_construct()-warn:variable-dereferenced-before-check-ctx-dc_bios-integrated_info-(see-line-)
|   |-- drivers-gpu-drm-i915-display-intel_dsb.c-_intel_dsb_commit()-warn:always-true-condition-(dewake_scanline-)-(-u32max-)
|   |-- ld:drivers-cxl-core-pci.c:undefined-reference-to-pci_print_aer
|   `-- net-bluetooth-hci_event.c-hci_conn_request_evt()-warn:variable-dereferenced-before-check-hdev-(see-line-)
|-- loongarch-allmodconfig
|   |-- arch-loongarch-kvm-mmu.c:error:control-reaches-end-of-non-void-function
|   |-- arch-loongarch-kvm-mmu.c:error:implicit-declaration-of-function-mmu_invalidate_retry_hva
|   |-- arch-loongarch-kvm-mmu.c:error:invalid-use-of-undefined-type-struct-kvm_gfn_range
|   |-- arch-loongarch-kvm-mmu.c:error:struct-kvm-has-no-member-named-mmu_invalidate_seq
|   |-- arch-loongarch-kvm-mmu.c:warning:no-previous-prototype-for-kvm_age_gfn
|   |-- arch-loongarch-kvm-mmu.c:warning:no-previous-prototype-for-kvm_set_spte_gfn
|   |-- arch-loongarch-kvm-mmu.c:warning:no-previous-prototype-for-kvm_test_age_gfn
|   |-- arch-loongarch-kvm-mmu.c:warning:no-previous-prototype-for-kvm_unmap_gfn_range
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|-- loongarch-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|-- loongarch-defconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|-- loongarch-randconfig-002-20231030
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|-- loongarch-randconfig-r014-20230225
|   `-- drivers-cxl-core-pci.c:(.text):undefined-reference-to-pci_print_aer
|-- loongarch-randconfig-r032-20220926
|   `-- loongarch64-linux-ld:drivers-cxl-core-pci.c:(.text):undefined-reference-to-pci_print_aer
|-- m68k-defconfig
|   `-- kernel-bpf-task_iter.c:error:CSS_TASK_ITER_PROCS-undeclared-(first-use-in-this-function)
|-- microblaze-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|-- microblaze-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|-- openrisc-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|-- openrisc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|-- parisc-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|-- parisc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|-- powerpc-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|-- powerpc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|-- powerpc-buildonly-randconfig-r006-20221105
|   |-- arch-powerpc-sysdev-udbg_memcons.c:error:no-previous-prototype-for-memcons_getc
|   |-- arch-powerpc-sysdev-udbg_memcons.c:error:no-previous-prototype-for-memcons_getc_poll
|   `-- arch-powerpc-sysdev-udbg_memcons.c:error:no-previous-prototype-for-memcons_putc
|-- powerpc-randconfig-002-20231030
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|-- powerpc-randconfig-003-20231016
|   `-- powerpc-linux-ld:pci.c:(.text):undefined-reference-to-pci_print_aer
|-- powerpc64-buildonly-randconfig-r001-20220430
|   |-- arch-powerpc-kernel-rtas_pci.c:error:no-previous-prototype-for-rtas_read_config
|   `-- arch-powerpc-kernel-rtas_pci.c:error:no-previous-prototype-for-rtas_write_config
|-- powerpc64-randconfig-003-20231030
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|-- powerpc64-randconfig-r001-20230910
|   `-- ERROR:start_text-address-is-c000000000000d00-should-be-c000000000000200
|-- riscv-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|-- riscv-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|-- riscv-randconfig-002-20231030
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|-- riscv-randconfig-r002-20220124
|   `-- arch-riscv-include-asm-mmio.h:(.text):undefined-reference-to-pci_print_aer
|-- riscv-randconfig-r011-20220606
|   `-- riscv64-linux-ld:pci.c:(.text):undefined-reference-to-pci_print_aer
|-- s390-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|-- s390-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|-- s390-randconfig-002-20231030
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|-- sh-randconfig-r022-20220318
|   `-- standard-input:Error:offset-to-unaligned-destination
|-- sh-randconfig-r023-20211018
|   |-- standard-input:Warning:overflow-in-branch-to-.L63-converted-into-longer-instruction-sequence
|   `-- standard-input:Warning:overflow-in-branch-to-.L72-converted-into-longer-instruction-sequence
|-- sh-randconfig-r023-20221113
|   |-- arch-sh-mm-cache-sh4.c:error:cached_to_uncached-undeclared-(first-use-in-this-function)
|   |-- arch-sh-mm-cache-sh4.c:error:implicit-declaration-of-function-cpu_context
|   |-- arch-sh-mm-cache-sh4.c:error:implicit-declaration-of-function-pmd_off
|   `-- arch-sh-mm-cache-sh4.c:error:implicit-declaration-of-function-pte_offset_kernel
|-- sparc-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|-- sparc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|-- sparc-randconfig-002-20231030
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|-- sparc64-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|-- sparc64-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|-- sparc64-randconfig-002-20231030
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|-- sparc64-randconfig-r006-20230130
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:BUILD_BUG_ON-failed:SECTIONS_WIDTH-NODES_WIDTH-ZONES_WIDTH-ilog2(roundup_pow_of_two(NR_CPUS))
|-- sparc64-randconfig-r011-20230520
|   `-- arch-sparc-mm-init_64.c:error:variable-pagecv_flag-set-but-not-used
|-- sparc64-randconfig-r024-20220211
|   |-- arch-sparc-kernel-adi_64.c:error:no-previous-prototype-for-alloc_tag_store
|   |-- arch-sparc-kernel-adi_64.c:error:no-previous-prototype-for-find_tag_store
|   |-- arch-sparc-kernel-module.c:error:variable-strtab-set-but-not-used
|   |-- arch-sparc-kernel-pci_sun4v.c:error:no-previous-prototype-for-dma_4v_iotsb_bind
|   `-- arch-sparc-kernel-traps_64.c:error:no-previous-prototype-for-trap_init
|-- um-randconfig-r016-20230729
|   `-- bin-sh::gcc:not-found
|-- x86_64-allnoconfig
|   `-- Warning:MAINTAINERS-references-a-file-that-doesn-t-exist:Documentation-devicetree-bindings-iio-imu-bosch-bma400.yaml
|-- x86_64-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|-- x86_64-buildonly-randconfig-001-20231030
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|-- x86_64-buildonly-randconfig-003-20231030
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|-- x86_64-buildonly-randconfig-006-20231030
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|-- x86_64-randconfig-001-20231030
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|-- x86_64-randconfig-003-20231030
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|-- x86_64-randconfig-004-20231030
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|-- x86_64-randconfig-071-20231030
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|-- x86_64-randconfig-161-20231030
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu14-smu_v14_0.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- drivers-gpu-drm-i915-display-intel_dsb.c-_intel_dsb_commit()-warn:always-true-condition-(dewake_scanline-)-(-u32max-)
|   |-- net-bluetooth-hci_event.c-hci_conn_request_evt()-warn:variable-dereferenced-before-check-hdev-(see-line-)
|   `-- net-ipv4-tcp_ao.c-tcp_ao_del_cmd()-error:memcmp()-key-addr-too-small-(-vs-)
|-- x86_64-randconfig-x052-20230810
|   `-- drivers-cxl-core-pci.c:undefined-reference-to-pci_print_aer
|-- xtensa-randconfig-001-20231030
|   |-- kernel-bpf-task_iter.c:error:CSS_TASK_ITER_THREADED-undeclared-(first-use-in-this-function)
|   |-- kernel-bpf-task_iter.c:error:implicit-declaration-of-function-css_task_iter_end
|   |-- kernel-bpf-task_iter.c:error:implicit-declaration-of-function-css_task_iter_next
|   |-- kernel-bpf-task_iter.c:error:implicit-declaration-of-function-css_task_iter_start
|   `-- kernel-bpf-task_iter.c:error:invalid-application-of-sizeof-to-incomplete-type-struct-css_task_iter
|-- xtensa-randconfig-r015-20221109
|   |-- include-linux-compiler.h:error:pasting-__addressable_-and-(-does-not-give-a-valid-preprocessing-token
|   |-- include-linux-export.h:error:pasting-__export_symbol_-and-(-does-not-give-a-valid-preprocessing-token
|   |-- include-linux-stddef.h:error:expected-)-before-numeric-constant
|   |-- include-linux-stddef.h:error:expected-declaration-specifiers-or-...-before-(-token
|   |-- include-linux-stddef.h:error:expected-identifier-or-(-before-void
|   `-- include-linux-stddef.h:error:pasting-)-and-does-not-give-a-valid-preprocessing-token
`-- xtensa-randconfig-r133-20230821
    |-- drivers-gpio-gpio-xtensa.c:Error:unknown-opcode-or-format-name-read_impwire
    |-- drivers-gpio-gpio-xtensa.c:Error:unknown-opcode-or-format-name-rur.expstate
    `-- drivers-gpio-gpio-xtensa.c:Error:unknown-opcode-or-format-name-wrmsk_expstate
clang_recent_errors
|-- arm64-allmodconfig
|   `-- drivers-hwtracing-coresight-coresight-etm4x-core.c:warning:result-of-comparison-of-constant-with-expression-of-type-u8-(aka-unsigned-char-)-is-always-false
|-- hexagon-randconfig-r045-20221230
|   |-- kernel-bpf-task_iter.c:error:call-to-undeclared-function-css_task_iter_end-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   |-- kernel-bpf-task_iter.c:error:call-to-undeclared-function-css_task_iter_next-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   |-- kernel-bpf-task_iter.c:error:call-to-undeclared-function-css_task_iter_start-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   |-- kernel-bpf-task_iter.c:error:incompatible-integer-to-pointer-conversion-returning-int-from-a-function-with-result-type-struct-task_struct
|   |-- kernel-bpf-task_iter.c:error:invalid-application-of-sizeof-to-an-incomplete-type-struct-css_task_iter
|   |-- kernel-bpf-task_iter.c:error:use-of-undeclared-identifier-CSS_TASK_ITER_PROCS
|   |-- kernel-bpf-task_iter.c:error:use-of-undeclared-identifier-CSS_TASK_ITER_THREADED
|   `-- lib-objpool.c:error:call-to-undeclared-function-arch_cmpxchg_local-ISO-C99-and-later-do-not-support-implicit-function-declarations
`-- powerpc64-allmodconfig
    `-- drivers-pci-controller-dwc-pcie-rcar-gen4.c:warning:cast-to-smaller-integer-type-enum-dw_pcie_device_mode-from-const-void

elapsed time: 823m

configs tested: 148
configs skipped: 2

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20231030   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                       aspeed_g4_defconfig   clang
arm                                 defconfig   gcc  
arm                            dove_defconfig   clang
arm                         orion5x_defconfig   clang
arm                   randconfig-001-20231030   gcc  
arm                         wpcm450_defconfig   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20231030   gcc  
i386         buildonly-randconfig-002-20231030   gcc  
i386         buildonly-randconfig-003-20231030   gcc  
i386         buildonly-randconfig-005-20231030   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231030   gcc  
i386                  randconfig-002-20231030   gcc  
i386                  randconfig-003-20231030   gcc  
i386                  randconfig-004-20231030   gcc  
i386                  randconfig-005-20231030   gcc  
i386                  randconfig-006-20231030   gcc  
i386                  randconfig-011-20231030   gcc  
i386                  randconfig-012-20231030   gcc  
i386                  randconfig-013-20231030   gcc  
i386                  randconfig-014-20231030   gcc  
i386                  randconfig-015-20231030   gcc  
i386                  randconfig-016-20231030   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231030   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                        mvme16x_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                     cu1000-neo_defconfig   clang
mips                        qi_lb60_defconfig   clang
mips                          rm200_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                   bluestone_defconfig   clang
powerpc                   currituck_defconfig   gcc  
powerpc                  storcenter_defconfig   gcc  
powerpc                         wii_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231030   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231030   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                            hp6xx_defconfig   gcc  
sh                          polaris_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20231030   gcc  
sparc                       sparc64_defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20231030   gcc  
x86_64       buildonly-randconfig-002-20231030   gcc  
x86_64       buildonly-randconfig-003-20231030   gcc  
x86_64       buildonly-randconfig-004-20231030   gcc  
x86_64       buildonly-randconfig-005-20231030   gcc  
x86_64       buildonly-randconfig-006-20231030   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231030   gcc  
x86_64                randconfig-002-20231030   gcc  
x86_64                randconfig-003-20231030   gcc  
x86_64                randconfig-004-20231030   gcc  
x86_64                randconfig-005-20231030   gcc  
x86_64                randconfig-006-20231030   gcc  
x86_64                randconfig-011-20231030   gcc  
x86_64                randconfig-012-20231030   gcc  
x86_64                randconfig-013-20231030   gcc  
x86_64                randconfig-014-20231030   gcc  
x86_64                randconfig-015-20231030   gcc  
x86_64                randconfig-016-20231030   gcc  
x86_64                randconfig-071-20231030   gcc  
x86_64                randconfig-072-20231030   gcc  
x86_64                randconfig-073-20231030   gcc  
x86_64                randconfig-074-20231030   gcc  
x86_64                randconfig-075-20231030   gcc  
x86_64                randconfig-076-20231030   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                generic_kc705_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
