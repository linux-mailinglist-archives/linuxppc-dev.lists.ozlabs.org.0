Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C646448D0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Dec 2022 17:09:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NRQNM40vjz3bjc
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Dec 2022 03:09:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SXOQSa6/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mga18.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SXOQSa6/;
	dkim-atps=neutral
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NRQMN3WVWz2xGq
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Dec 2022 03:08:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670342928; x=1701878928;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=2mfC+49Zrk6yU1xCCdQmj+99niP/bcoQaPMPKBsQNWE=;
  b=SXOQSa6/UXTZhSnXvVQy+uLsBnVVZ/fa/+nq8hOwZ+7ftFrffsE9UJcC
   YRbL20ZwZd2XYaZZqvq8UxDz3e46rcf4CFLJKj5ekHvcq1eCoye0wKsr/
   /vYVsshpf43a8iAQwiJ+M90hiOHqpQBqj0LaaiJC+cqkgHQzO/7QBY9kb
   M8WDZMpzCGNf7cIDM0DiGI0v9rX8Cz4tgDehTOH690jIdDvgJChSgbpSD
   47qUfVAPLRzA+ozFDp881ps/B/o7po1Xn/u1Y3Hmfn0V0WYMvV7WIsPfz
   9vtMlSua4YjYa4w+FYmgl3liOIlU9/SoTvU+ldfhs2LBI5eqPGWXPSXBH
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="300077762"
X-IronPort-AV: E=Sophos;i="5.96,222,1665471600"; 
   d="scan'208";a="300077762"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2022 08:06:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="678797228"
X-IronPort-AV: E=Sophos;i="5.96,222,1665471600"; 
   d="scan'208";a="678797228"
Received: from lkp-server01.sh.intel.com (HELO b3c45e08cbc1) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 06 Dec 2022 08:06:09 -0800
Received: from kbuild by b3c45e08cbc1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p2aSP-00012q-0F;
	Tue, 06 Dec 2022 16:06:09 +0000
Date: Wed, 07 Dec 2022 00:06:06 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 5d562c48a21eeb029a8fd3f18e1b31fd83660474
Message-ID: <638f686e.w2vVDS/ig/YhejNK%lkp@intel.com>
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
Cc: amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Linux Memory Management List <linux-mm@kvack.org>, linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, netdev@vger.kernel.org, linux-riscv@lists.infradead.org, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, bpf@vger.kernel.org, linux-btrfs@vger.kernel.org, linux-media@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 5d562c48a21eeb029a8fd3f18e1b31fd83660474  Add linux-next specific files for 20221206

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202211231857.0DmUeoa1-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202211242120.MzZVGULn-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202211290656.VHeDfThu-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202211301840.y7rROb13-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202212020520.0OkMIno3-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202212032205.IeHBbyyp-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202212060700.NjMecjxS-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202212061249.U0bAsqZk-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202212061341.GNALCbX6-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202212061455.6GE7y0jg-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202212061633.U9qHpe62-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202212061758.tlPQNuof-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202212061918.W5IUPcyA-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202212062250.tR0otHcz-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

Error: failed to load BTF from vmlinux: No such file or directory
arch/loongarch/kernel/asm-offsets.c:262:6: warning: no previous prototype for 'output_pbe_defines' [-Wmissing-prototypes]
arch/loongarch/power/hibernate.c:14:6: warning: no previous prototype for 'save_processor_state' [-Wmissing-prototypes]
arch/loongarch/power/hibernate.c:26:6: warning: no previous prototype for 'restore_processor_state' [-Wmissing-prototypes]
arch/loongarch/power/hibernate.c:38:5: warning: no previous prototype for 'pfn_is_nosave' [-Wmissing-prototypes]
arch/loongarch/power/hibernate.c:48:5: warning: no previous prototype for 'swsusp_arch_suspend' [-Wmissing-prototypes]
arch/loongarch/power/hibernate.c:56:5: warning: no previous prototype for 'swsusp_arch_resume' [-Wmissing-prototypes]
arch/powerpc/kernel/kvm_emul.o: warning: objtool: kvm_template_end(): can't find starting instruction
arch/powerpc/kernel/optprobes_head.o: warning: objtool: optprobe_template_end(): can't find starting instruction
arch/riscv/kernel/crash_core.c:12:57: warning: format specifies type 'unsigned long' but the argument has type 'int' [-Wformat]
arch/riscv/kernel/crash_core.c:14:57: error: use of undeclared identifier 'VMEMMAP_START'
arch/riscv/kernel/crash_core.c:15:55: error: use of undeclared identifier 'VMEMMAP_END'; did you mean 'MEMREMAP_ENC'?
arch/riscv/kernel/crash_core.c:17:57: error: use of undeclared identifier 'MODULES_VADDR'
arch/riscv/kernel/crash_core.c:18:55: error: use of undeclared identifier 'MODULES_END'
arch/riscv/kernel/crash_core.c:8:20: error: use of undeclared identifier 'VA_BITS'
clang-16: error: no such file or directory: 'liburandom_read.so'
drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn201/irq_service_dcn201.c:40:20: warning: no previous prototype for 'to_dal_irq_source_dcn201' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.c:353:5: warning: no previous prototype for 'amdgpu_mcbp_scan' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.c:373:5: warning: no previous prototype for 'amdgpu_mcbp_trigger_preempt' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c:451:1: warning: no previous prototype for 'gf100_fifo_nonstall_block' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c:451:1: warning: no previous prototype for function 'gf100_fifo_nonstall_block' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c:34:1: warning: no previous prototype for 'nvkm_engn_cgrp_get' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c:34:1: warning: no previous prototype for function 'nvkm_engn_cgrp_get' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c:210:1: warning: no previous prototype for 'tu102_gr_load' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c:210:1: warning: no previous prototype for function 'tu102_gr_load' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c:49:1: warning: no previous prototype for 'wpr_generic_header_dump' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c:49:1: warning: no previous prototype for function 'wpr_generic_header_dump' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c:221:21: warning: variable 'loc' set but not used [-Wunused-but-set-variable]
drivers/media/i2c/tc358746.c:816:13: warning: 'm_best' is used uninitialized [-Wuninitialized]
drivers/media/i2c/tc358746.c:817:13: warning: 'p_best' is used uninitialized [-Wuninitialized]
drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c:445:7: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
drivers/mmc/host/sdhci-brcmstb.c:182:34: warning: unused variable 'sdhci_brcm_of_match' [-Wunused-const-variable]
drivers/regulator/tps65219-regulator.c:310:32: warning: parameter 'dev' set but not used [-Wunused-but-set-parameter]
drivers/regulator/tps65219-regulator.c:310:60: warning: parameter 'dev' set but not used [-Wunused-but-set-parameter]
drivers/regulator/tps65219-regulator.c:370:26: warning: ordered comparison of pointer with integer zero [-Wextra]
error: unable to open output file 'kselftest/net/bpf/nat6to4.o': 'No such file or directory'
fs/btrfs/btrfs.o: warning: objtool: __btrfs_map_block+0x1c67: unreachable instruction
hugetlb-madvise.c:20: warning: "__USE_GNU" redefined
kismet: WARNING: unmet direct dependencies detected for MUX_MMIO when selected by PHY_AM654_SERDES
kismet: WARNING: unmet direct dependencies detected for MUX_MMIO when selected by SPI_DW_BT1
ld.lld: error: .btf.vmlinux.bin.o: unknown file type
make[4]: *** No rule to make target 'scripts/module.lds', needed by 'tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.ko'.
mount_setattr_test.c:107:8: error: redefinition of 'struct mount_attr'
pahole: .tmp_vmlinux.btf: No such file or directory
thermal_nl.h:6:10: fatal error: netlink/netlink.h: No such file or directory
thermometer.c:21:10: fatal error: libconfig.h: No such file or directory
tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:131:14: warning: no previous prototype for 'bpf_testmod_fentry_test1' [-Wmissing-prototypes]
tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:136:14: warning: no previous prototype for 'bpf_testmod_fentry_test2' [-Wmissing-prototypes]
tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:141:14: warning: no previous prototype for 'bpf_testmod_fentry_test3' [-Wmissing-prototypes]

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dcn201-irq_service_dcn201.c:warning:no-previous-prototype-for-to_dal_irq_source_dcn201
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ring_mux.c:warning:no-previous-prototype-for-amdgpu_mcbp_scan
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ring_mux.c:warning:no-previous-prototype-for-amdgpu_mcbp_trigger_preempt
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-gf100.c:warning:no-previous-prototype-for-gf100_fifo_nonstall_block
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-runl.c:warning:no-previous-prototype-for-nvkm_engn_cgrp_get
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-gr-tu102.c:warning:no-previous-prototype-for-tu102_gr_load
|   |-- drivers-gpu-drm-nouveau-nvkm-nvfw-acr.c:warning:no-previous-prototype-for-wpr_generic_header_dump
|   |-- drivers-gpu-drm-nouveau-nvkm-subdev-acr-lsfw.c:warning:variable-loc-set-but-not-used
|   |-- drivers-regulator-tps65219-regulator.c:warning:ordered-comparison-of-pointer-with-integer-zero
|   `-- drivers-regulator-tps65219-regulator.c:warning:parameter-dev-set-but-not-used
|-- alpha-randconfig-r002-20221205
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dcn201-irq_service_dcn201.c:warning:no-previous-prototype-for-to_dal_irq_source_dcn201
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ring_mux.c:warning:no-previous-prototype-for-amdgpu_mcbp_scan
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_ring_mux.c:warning:no-previous-prototype-for-amdgpu_mcbp_trigger_preempt
|-- alpha-randconfig-r003-20221204
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-gf100.c:warning:no-previous-prototype-for-gf100_fifo_nonstall_block
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-runl.c:warning:no-previous-prototype-for-nvkm_engn_cgrp_get
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-gr-tu102.c:warning:no-previous-prototype-for-tu102_gr_load
|   |-- drivers-gpu-drm-nouveau-nvkm-nvfw-acr.c:warning:no-previous-prototype-for-wpr_generic_header_dump
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-acr-lsfw.c:warning:variable-loc-set-but-not-used
|-- arc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dcn201-irq_service_dcn201.c:warning:no-previous-prototype-for-to_dal_irq_source_dcn201
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ring_mux.c:warning:no-previous-prototype-for-amdgpu_mcbp_scan
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ring_mux.c:warning:no-previous-prototype-for-amdgpu_mcbp_trigger_preempt
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-gf100.c:warning:no-previous-prototype-for-gf100_fifo_nonstall_block
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-runl.c:warning:no-previous-prototype-for-nvkm_engn_cgrp_get
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-gr-tu102.c:warning:no-previous-prototype-for-tu102_gr_load
|   |-- drivers-gpu-drm-nouveau-nvkm-nvfw-acr.c:warning:no-previous-prototype-for-wpr_generic_header_dump
|   |-- drivers-gpu-drm-nouveau-nvkm-subdev-acr-lsfw.c:warning:variable-loc-set-but-not-used
|   |-- drivers-regulator-tps65219-regulator.c:warning:ordered-comparison-of-pointer-with-integer-zero
|   `-- drivers-regulator-tps65219-regulator.c:warning:parameter-dev-set-but-not-used
|-- arc-randconfig-r036-20221204
|   |-- drivers-media-i2c-tc358746.c:warning:m_best-is-used-uninitialized
|   `-- drivers-media-i2c-tc358746.c:warning:p_best-is-used-uninitialized
|-- arc-randconfig-r043-20221204
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dcn201-irq_service_dcn201.c:warning:no-previous-prototype-for-to_dal_irq_source_dcn201
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ring_mux.c:warning:no-previous-prototype-for-amdgpu_mcbp_scan
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_ring_mux.c:warning:no-previous-prototype-for-amdgpu_mcbp_trigger_preempt
|-- arm-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dcn201-irq_service_dcn201.c:warning:no-previous-prototype-for-to_dal_irq_source_dcn201
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ring_mux.c:warning:no-previous-prototype-for-amdgpu_mcbp_scan
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ring_mux.c:warning:no-previous-prototype-for-amdgpu_mcbp_trigger_preempt
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-gf100.c:warning:no-previous-prototype-for-gf100_fifo_nonstall_block
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-runl.c:warning:no-previous-prototype-for-nvkm_engn_cgrp_get
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-gr-tu102.c:warning:no-previous-prototype-for-tu102_gr_load
|   |-- drivers-gpu-drm-nouveau-nvkm-nvfw-acr.c:warning:no-previous-prototype-for-wpr_generic_header_dump
|   |-- drivers-gpu-drm-nouveau-nvkm-subdev-acr-lsfw.c:warning:variable-loc-set-but-not-used
|   |-- drivers-regulator-tps65219-regulator.c:warning:ordered-comparison-of-pointer-with-integer-zero
|   `-- drivers-regulator-tps65219-regulator.c:warning:parameter-dev-set-but-not-used
clang_recent_errors
|-- arm-randconfig-r046-20221205
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-gf100.c:warning:no-previous-prototype-for-function-gf100_fifo_nonstall_block
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-runl.c:warning:no-previous-prototype-for-function-nvkm_engn_cgrp_get
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-gr-tu102.c:warning:no-previous-prototype-for-function-tu102_gr_load
|   `-- drivers-gpu-drm-nouveau-nvkm-nvfw-acr.c:warning:no-previous-prototype-for-function-wpr_generic_header_dump
|-- arm64-randconfig-r016-20221206
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-gf100.c:warning:no-previous-prototype-for-function-gf100_fifo_nonstall_block
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-runl.c:warning:no-previous-prototype-for-function-nvkm_engn_cgrp_get
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-gr-tu102.c:warning:no-previous-prototype-for-function-tu102_gr_load
|   |-- drivers-gpu-drm-nouveau-nvkm-nvfw-acr.c:warning:no-previous-prototype-for-function-wpr_generic_header_dump
|   `-- drivers-media-platform-renesas-rzg2l-cru-rzg2l-csi2.c:warning:variable-ret-is-used-uninitialized-whenever-if-condition-is-true
|-- arm64-randconfig-r032-20221205
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-gf100.c:warning:no-previous-prototype-for-function-gf100_fifo_nonstall_block
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-runl.c:warning:no-previous-prototype-for-function-nvkm_engn_cgrp_get
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-gr-tu102.c:warning:no-previous-prototype-for-function-tu102_gr_load
|   `-- drivers-gpu-drm-nouveau-nvkm-nvfw-acr.c:warning:no-previous-prototype-for-function-wpr_generic_header_dump
|-- hexagon-randconfig-r015-20221206
|   `-- drivers-mmc-host-sdhci-brcmstb.c:warning:unused-variable-sdhci_brcm_of_match
|-- hexagon-randconfig-r041-20221204
|   |-- ld.lld:error:.btf.vmlinux.bin.o:unknown-file-type
|   `-- pahole:.tmp_vmlinux.btf:No-such-file-or-directory
|-- powerpc-randconfig-r014-20221206
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-gf100.c:warning:no-previous-prototype-for-function-gf100_fifo_nonstall_block
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-runl.c:warning:no-previous-prototype-for-function-nvkm_engn_cgrp_get
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-gr-tu102.c:warning:no-previous-prototype-for-function-tu102_gr_load
|   |-- drivers-gpu-drm-nouveau-nvkm-nvfw-acr.c:warning:no-previous-prototype-for-function-wpr_generic_header_dump
|   `-- drivers-regulator-tps65219-regulator.c:warning:parameter-dev-set-but-not-used
`-- riscv-randconfig-r014-20221206
    |-- arch-riscv-kernel-crash_core.c:error:use-of-undeclared-identifier-MODULES_END
    |-- arch-riscv-kernel-crash_core.c:error:use-of-undeclared-identifier-MODULES_VADDR
    |-- arch-riscv-kernel-crash_core.c:error:use-of-undeclared-identifier-VA_BITS
    |-- arch-riscv-kernel-crash_core.c:error:use-of-undeclared-identifier-VMEMMAP_END
    |-- arch-riscv-kernel-crash_core.c:error:use-of-undeclared-identifier-VMEMMAP_START
    `-- arch-riscv-kernel-crash_core.c:warning:format-specifies-type-unsigned-long-but-the-argument-has-type-int

elapsed time: 723m

configs tested: 65
configs skipped: 3

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
arc                                 defconfig
i386                                defconfig
alpha                               defconfig
x86_64                              defconfig
sh                               allmodconfig
arm                                 defconfig
powerpc                          allmodconfig
x86_64                               rhel-8.3
x86_64               randconfig-a011-20221205
mips                             allyesconfig
x86_64               randconfig-a012-20221205
x86_64               randconfig-a014-20221205
x86_64               randconfig-a013-20221205
x86_64               randconfig-a015-20221205
s390                                defconfig
x86_64                           allyesconfig
s390                             allmodconfig
x86_64               randconfig-a016-20221205
ia64                             allmodconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
arm64                            allyesconfig
x86_64                           rhel-8.3-kvm
m68k                             allmodconfig
arm                              allyesconfig
arc                              allyesconfig
s390                             allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
alpha                            allyesconfig
i386                 randconfig-a014-20221205
m68k                             allyesconfig
i386                 randconfig-a013-20221205
i386                 randconfig-a016-20221205
i386                 randconfig-a012-20221205
arc                  randconfig-r043-20221205
i386                             allyesconfig
arm                  randconfig-r046-20221204
i386                 randconfig-a015-20221205
i386                 randconfig-a011-20221205
s390                 randconfig-r044-20221205
arc                  randconfig-r043-20221204
riscv                randconfig-r042-20221205

clang tested configs:
x86_64               randconfig-a003-20221205
x86_64               randconfig-a001-20221205
x86_64               randconfig-a002-20221205
i386                 randconfig-a001-20221205
x86_64               randconfig-a004-20221205
i386                 randconfig-a002-20221205
i386                 randconfig-a005-20221205
x86_64               randconfig-a006-20221205
i386                 randconfig-a004-20221205
i386                 randconfig-a003-20221205
x86_64               randconfig-a005-20221205
i386                 randconfig-a006-20221205
hexagon              randconfig-r041-20221204
s390                 randconfig-r044-20221204
hexagon              randconfig-r045-20221204
hexagon              randconfig-r045-20221205
arm                  randconfig-r046-20221205
hexagon              randconfig-r041-20221205
riscv                randconfig-r042-20221204

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
