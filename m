Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E7B64BBFC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Dec 2022 19:30:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NWn9V6hwlz3bXc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Dec 2022 05:30:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YjSSRwZF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mga11.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YjSSRwZF;
	dkim-atps=neutral
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NWn8W2Hd9z2xJ6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Dec 2022 05:29:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670956171; x=1702492171;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=4QPyqb1pvMS81Vaf94Si1tAEYfCAa6LBQX4nMxoXvDU=;
  b=YjSSRwZFL/nNDb4NOh3QFA+hpndLZXX++wDMggvvZB7O+BabBfE7404d
   fW3KwOkQvcbH0SvO/h2X3eZRMvmvm5nFODm+lGwRpvZAlWtEwfHzke4U7
   ibqzstmiWsA9O74uWNg9sEFrd3Z4HHmBwALdsFfQKA1XBEWL40g7PykLs
   u42f/REwCPKRhwieuXqixOXYR+ERuSXyGV1UnJSBCBbyBjOpfS4dclo2Q
   /Zf6vg+CYHDnRfguyEyc+ktqkDdwG4rA/+o+Ak4FKqHyklt8VUKfWhGZa
   LxJiaiFFMNGHsPop7ZILO1zhwevvtft2gjUWcUEtcl6bQJ+ve5VCff9t2
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10560"; a="315843089"
X-IronPort-AV: E=Sophos;i="5.96,242,1665471600"; 
   d="scan'208";a="315843089"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2022 10:29:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10560"; a="893997924"
X-IronPort-AV: E=Sophos;i="5.96,242,1665471600"; 
   d="scan'208";a="893997924"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 13 Dec 2022 10:29:19 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p5A1m-0004el-1S;
	Tue, 13 Dec 2022 18:29:18 +0000
Date: Wed, 14 Dec 2022 02:28:39 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 39ab32797f072eaf86b1faa7384ac73450684110
Message-ID: <6398c457.hhPKRJ7/7EGjTQb/%lkp@intel.com>
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
Cc: linux-xfs@vger.kernel.org, ntfs3@lists.linux.dev, linux-iio@vger.kernel.org, netdev@vger.kernel.org, amd-gfx@lists.freedesktop.org, lvs-devel@vger.kernel.org, Linux Memory Management List <linux-mm@kvack.org>, linux-arm-msm@vger.kernel.org, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 39ab32797f072eaf86b1faa7384ac73450684110  Add linux-next specific files for 20221213

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202211142244.sGkXbWO2-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202211150003.LkfYS4HE-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202211242120.MzZVGULn-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202211282102.QUr7HHrW-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202211301634.cejLlTJP-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202212020520.0OkMIno3-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202212040713.rVney9e8-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202212051759.cEv6fyHy-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202212111423.XqZdM0Kt-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202212132047.wvOyEPMA-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202212132110.CvE3HjB8-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

Documentation/networking/devlink/etas_es58x.rst: WARNING: document isn't included in any toctree
arch/powerpc/kernel/kvm_emul.o: warning: objtool: kvm_template_end(): can't find starting instruction
arch/powerpc/kernel/optprobes_head.o: warning: objtool: optprobe_template_end(): can't find starting instruction
drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn201/irq_service_dcn201.c:139:43: warning: unused variable 'dmub_outbox_irq_info_funcs' [-Wunused-const-variable]
drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn201/irq_service_dcn201.c:40:20: warning: no previous prototype for 'to_dal_irq_source_dcn201' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn201/irq_service_dcn201.c:40:20: warning: no previous prototype for function 'to_dal_irq_source_dcn201' [-Wmissing-prototypes]
drivers/regulator/tps65219-regulator.c:310:32: warning: parameter 'dev' set but not used [-Wunused-but-set-parameter]
drivers/regulator/tps65219-regulator.c:310:60: warning: parameter 'dev' set but not used [-Wunused-but-set-parameter]
drivers/regulator/tps65219-regulator.c:370:26: sparse:    int
drivers/regulator/tps65219-regulator.c:370:26: sparse:    struct regulator_dev *[assigned] rdev
drivers/regulator/tps65219-regulator.c:370:26: warning: ordered comparison of pointer with integer zero [-Wextra]
include/linux/compiler_types.h:357:45: error: call to '__compiletime_assert_270' declared with attribute error: BUILD_BUG_ON failed: sizeof(priv_tbl->probs) % 16
net/netfilter/ipvs/ip_vs_est.c:688:17: sparse:    signed long long *
net/netfilter/ipvs/ip_vs_est.c:688:17: sparse:    unsigned long long [usertype] *

Unverified Error/Warning (likely false positive, please contact us if interested):

drivers/i2c/busses/i2c-qcom-geni.c:1028:28: sparse: sparse: symbol 'i2c_master_hub' was not declared. Should it be static?
drivers/iio/adc/twl6030-gpadc.c:955:16-23: duplicated argument to & or |
drivers/iio/light/tsl2563.c:768:8-33: WARNING: Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)
fs/xfs/xfs_iomap.c:86:29: sparse: sparse: symbol 'xfs_iomap_page_ops' was not declared. Should it be static?

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dcn201-irq_service_dcn201.c:warning:no-previous-prototype-for-to_dal_irq_source_dcn201
|   |-- drivers-regulator-tps65219-regulator.c:warning:ordered-comparison-of-pointer-with-integer-zero
|   `-- drivers-regulator-tps65219-regulator.c:warning:parameter-dev-set-but-not-used
|-- arc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dcn201-irq_service_dcn201.c:warning:no-previous-prototype-for-to_dal_irq_source_dcn201
|   |-- drivers-regulator-tps65219-regulator.c:warning:ordered-comparison-of-pointer-with-integer-zero
|   `-- drivers-regulator-tps65219-regulator.c:warning:parameter-dev-set-but-not-used
|-- arm-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dcn201-irq_service_dcn201.c:warning:no-previous-prototype-for-to_dal_irq_source_dcn201
|   |-- drivers-regulator-tps65219-regulator.c:warning:ordered-comparison-of-pointer-with-integer-zero
|   `-- drivers-regulator-tps65219-regulator.c:warning:parameter-dev-set-but-not-used
|-- arm-randconfig-s032-20221213
|   `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:BUILD_BUG_ON-failed:sizeof(priv_tbl-probs)
|-- arm64-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dcn201-irq_service_dcn201.c:warning:no-previous-prototype-for-to_dal_irq_source_dcn201
|   |-- drivers-regulator-tps65219-regulator.c:warning:ordered-comparison-of-pointer-with-integer-zero
|   `-- drivers-regulator-tps65219-regulator.c:warning:parameter-dev-set-but-not-used
|-- i386-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dcn201-irq_service_dcn201.c:warning:no-previous-prototype-for-to_dal_irq_source_dcn201
|   |-- drivers-regulator-tps65219-regulator.c:warning:ordered-comparison-of-pointer-with-integer-zero
|   `-- drivers-regulator-tps65219-regulator.c:warning:parameter-dev-set-but-not-used
|-- i386-randconfig-s002
|   `-- fs-xfs-xfs_iomap.c:sparse:sparse:symbol-xfs_iomap_page_ops-was-not-declared.-Should-it-be-static
|-- ia64-buildonly-randconfig-r001-20221213
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dcn201-irq_service_dcn201.c:warning:no-previous-prototype-for-to_dal_irq_source_dcn201
|-- ia64-randconfig-c034-20221213
|   `-- drivers-iio-light-tsl2563.c:WARNING:Threaded-IRQ-with-no-primary-handler-requested-without-IRQF_ONESHOT-(unless-it-is-nested-IRQ)
|-- ia64-randconfig-s043-20221213
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dcn201-irq_service_dcn201.c:warning:no-previous-prototype-for-to_dal_irq_source_dcn201
|   `-- fs-xfs-xfs_iomap.c:sparse:sparse:symbol-xfs_iomap_page_ops-was-not-declared.-Should-it-be-static
|-- loongarch-buildonly-randconfig-r005-20221213
|   |-- drivers-regulator-tps65219-regulator.c:warning:ordered-comparison-of-pointer-with-integer-zero
|   `-- drivers-regulator-tps65219-regulator.c:warning:parameter-dev-set-but-not-used
|-- m68k-allmodconfig
|   |-- drivers-regulator-tps65219-regulator.c:warning:ordered-comparison-of-pointer-with-integer-zero
|   `-- drivers-regulator-tps65219-regulator.c:warning:parameter-dev-set-but-not-used
|-- m68k-allyesconfig
|   |-- drivers-regulator-tps65219-regulator.c:warning:ordered-comparison-of-pointer-with-integer-zero
|   `-- drivers-regulator-tps65219-regulator.c:warning:parameter-dev-set-but-not-used
|-- m68k-randconfig-r004-20221213
|   |-- drivers-regulator-tps65219-regulator.c:warning:ordered-comparison-of-pointer-with-integer-zero
|   `-- drivers-regulator-tps65219-regulator.c:warning:parameter-dev-set-but-not-used
|-- microblaze-randconfig-c043-20221213
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dcn201-irq_service_dcn201.c:warning:no-previous-prototype-for-to_dal_irq_source_dcn201
|-- microblaze-randconfig-s052-20221213
|   `-- fs-xfs-xfs_iomap.c:sparse:sparse:symbol-xfs_iomap_page_ops-was-not-declared.-Should-it-be-static
|-- mips-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dcn201-irq_service_dcn201.c:warning:no-previous-prototype-for-to_dal_irq_source_dcn201
|   |-- drivers-regulator-tps65219-regulator.c:warning:ordered-comparison-of-pointer-with-integer-zero
clang_recent_errors
|-- arm64-randconfig-r023-20221213
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dcn201-irq_service_dcn201.c:warning:no-previous-prototype-for-function-to_dal_irq_source_dcn201
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dcn201-irq_service_dcn201.c:warning:unused-variable-dmub_outbox_irq_info_funcs
|-- hexagon-randconfig-r002-20221213
|   `-- drivers-regulator-tps65219-regulator.c:warning:parameter-dev-set-but-not-used
|-- i386-allmodconfig
|   `-- drivers-regulator-tps65219-regulator.c:warning:parameter-dev-set-but-not-used
`-- powerpc-randconfig-r026-20221213
    |-- arch-powerpc-kernel-kvm_emul.o:warning:objtool:kvm_template_end():can-t-find-starting-instruction
    |-- arch-powerpc-kernel-optprobes_head.o:warning:objtool:optprobe_template_end():can-t-find-starting-instruction
    `-- arch-powerpc-kernel-prom_init.o:warning:objtool:prom_init:unannotated-intra-function-call

elapsed time: 738m

configs tested: 64
configs skipped: 7

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
x86_64                            allnoconfig
x86_64                              defconfig
x86_64                           allyesconfig
m68k                          sun3x_defconfig
sh                             espt_defconfig
x86_64                               rhel-8.3
x86_64                           rhel-8.3-bpf
m68k                       m5275evb_defconfig
x86_64                           rhel-8.3-syz
arc                  randconfig-r043-20221213
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
arm                  randconfig-r046-20221213
powerpc                     rainier_defconfig
i386                          randconfig-c001
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a014
arm                          iop32x_defconfig
i386                          randconfig-a012
i386                          randconfig-a016
powerpc                        cell_defconfig
i386                          randconfig-a005
sh                               j2_defconfig
sh                          sdk7780_defconfig
sh                      rts7751r2d1_defconfig
sh                           se7712_defconfig
mips                         bigsur_defconfig
sh                               allmodconfig
mips                             allyesconfig
i386                                defconfig
powerpc                          allmodconfig
x86_64                          rhel-8.3-rust
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
arm                                 defconfig
m68k                             allyesconfig
m68k                             allmodconfig
i386                             allyesconfig
arc                              allyesconfig
alpha                            allyesconfig
arm64                            allyesconfig
arm                              allyesconfig

clang tested configs:
arm                       mainstone_defconfig
mips                           ip28_defconfig
hexagon              randconfig-r041-20221213
riscv                randconfig-r042-20221213
powerpc                     kilauea_defconfig
arm                   milbeaut_m10v_defconfig
hexagon              randconfig-r045-20221213
s390                 randconfig-r044-20221213
powerpc                     mpc512x_defconfig
i386                          randconfig-a013
i386                          randconfig-a002
i386                          randconfig-a004
mips                     cu1830-neo_defconfig
i386                          randconfig-a015
i386                          randconfig-a011
powerpc                     tqm8560_defconfig
i386                          randconfig-a006
arm                       netwinder_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
