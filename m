Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A77C64EDB7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Dec 2022 16:19:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NYXp100Dfz3bvs
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Dec 2022 02:19:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dKiW0JxT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dKiW0JxT;
	dkim-atps=neutral
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NYXn41Nngz2y34
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Dec 2022 02:18:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671203928; x=1702739928;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=02QCuar4dYfcGk8X71Ps6oFW/ok7pF7lniU7WvO+y+o=;
  b=dKiW0JxThzR6slCRbUvp23dvNXadUn6UxdabkB75ua8jVSItHShbTESV
   O1+GXtRrBJ1SFQCtQUqpwq051R5kdjJfKdrVzE4zImZdQGM2KQDxC3wm7
   d8qlq642WCgFpS4wCGfRtJpvAilgMD7iuQo2NKdaQSnb5Mu5JK1jovhW+
   3Hi+V0PnXfsVKgh9mfdoTp6JR70mwsjR19y5WI+ou4uwbPu8N2SrxzMDZ
   mhUQoPfX1za1YSHzfUtJNNAQJkIUZhoMQhjgGp7hAchT3K3tbQ8gduqwz
   a/yI9Cnzmprj3b5uYu1H17MpmythFeNLdX3OcNzPQCQC5Xl3CypR1WExs
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10563"; a="383319602"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; 
   d="scan'208";a="383319602"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2022 07:18:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10563"; a="756782958"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; 
   d="scan'208";a="756782958"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 16 Dec 2022 07:18:33 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p6CTo-0007EQ-1R;
	Fri, 16 Dec 2022 15:18:32 +0000
Date: Fri, 16 Dec 2022 23:18:17 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 ca39c4daa6f7f770b1329ffb46f1e4a6bcc3f291
Message-ID: <639c8c39./q+QZSDrWluXOpoJ%lkp@intel.com>
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
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, speakup@linux-speakup.org, amd-gfx@lists.freedesktop.org, linux-can@vger.kernel.org, linux-xfs@vger.kernel.org, Linux Memory Management List <linux-mm@kvack.org>, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-media@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: ca39c4daa6f7f770b1329ffb46f1e4a6bcc3f291  Add linux-next specific files for 20221216

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202211180516.dtOWIlEo-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202211180955.UiXgTkeu-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202211190207.Rf66o1j0-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202211242120.MzZVGULn-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202212020520.0OkMIno3-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202212051759.cEv6fyHy-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202212142121.vendKsOc-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

Documentation/gpu/drm-internals:179: ./include/drm/drm_file.h:411: WARNING: undefined label: drm_accel_node (if the link has no caption the label must precede a section header)
Documentation/networking/devlink/etas_es58x.rst: WARNING: document isn't included in any toctree
Warning: tools/power/cpupower/man/cpupower-powercap-info.1 references a file that doesn't exist: Documentation/power/powercap/powercap.txt
arch/powerpc/kernel/kvm_emul.o: warning: objtool: kvm_template_end(): can't find starting instruction
arch/powerpc/kernel/optprobes_head.o: warning: objtool: optprobe_template_end(): can't find starting instruction
drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn201/irq_service_dcn201.c:40:20: warning: no previous prototype for 'to_dal_irq_source_dcn201' [-Wmissing-prototypes]
drivers/regulator/tps65219-regulator.c:310:32: warning: parameter 'dev' set but not used [-Wunused-but-set-parameter]
drivers/regulator/tps65219-regulator.c:310:60: warning: parameter 'dev' set but not used [-Wunused-but-set-parameter]
drivers/regulator/tps65219-regulator.c:370:26: sparse:    int
drivers/regulator/tps65219-regulator.c:370:26: sparse:    struct regulator_dev *[assigned] rdev
drivers/regulator/tps65219-regulator.c:370:26: warning: ordered comparison of pointer with integer zero [-Wextra]

Unverified Error/Warning (likely false positive, please contact us if interested):

drivers/accessibility/speakup/main.c:1290:26: sparse: sparse: obsolete array initializer, use C99 syntax
drivers/i2c/busses/i2c-qcom-geni.c:1028:28: sparse: sparse: symbol 'i2c_master_hub' was not declared. Should it be static?
drivers/media/platform/ti/davinci/vpif.c:483:20: sparse: sparse: cast from non-scalar
drivers/media/platform/ti/davinci/vpif.c:483:20: sparse: sparse: cast to non-scalar
drivers/media/test-drivers/visl/visl-video.c:690:22: sparse: sparse: symbol 'visl_qops' was not declared. Should it be static?
drivers/usb/misc/sisusbvga/sisusbvga.c:528:9: sparse: sparse: incorrect type in assignment (different base types)
fs/xfs/xfs_iomap.c:86:29: sparse: sparse: symbol 'xfs_iomap_page_ops' was not declared. Should it be static?
hidma.c:(.text+0x46): undefined reference to `devm_ioremap_resource'
mm/hugetlb.c:6897 hugetlb_reserve_pages() error: uninitialized symbol 'chg'.

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
|-- arc-randconfig-s053-20221216
|   |-- drivers-i2c-busses-i2c-qcom-geni.c:sparse:sparse:symbol-i2c_master_hub-was-not-declared.-Should-it-be-static
|   `-- drivers-media-test-drivers-visl-visl-video.c:sparse:sparse:symbol-visl_qops-was-not-declared.-Should-it-be-static
|-- arm-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dcn201-irq_service_dcn201.c:warning:no-previous-prototype-for-to_dal_irq_source_dcn201
|   |-- drivers-regulator-tps65219-regulator.c:warning:ordered-comparison-of-pointer-with-integer-zero
|   `-- drivers-regulator-tps65219-regulator.c:warning:parameter-dev-set-but-not-used
|-- arm64-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dcn201-irq_service_dcn201.c:warning:no-previous-prototype-for-to_dal_irq_source_dcn201
|   |-- drivers-regulator-tps65219-regulator.c:warning:ordered-comparison-of-pointer-with-integer-zero
|   `-- drivers-regulator-tps65219-regulator.c:warning:parameter-dev-set-but-not-used
|-- arm64-buildonly-randconfig-r006-20221215
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dcn201-irq_service_dcn201.c:warning:no-previous-prototype-for-to_dal_irq_source_dcn201
|-- arm64-randconfig-s051-20221216
|   |-- drivers-i2c-busses-i2c-qcom-geni.c:sparse:sparse:symbol-i2c_master_hub-was-not-declared.-Should-it-be-static
|   |-- drivers-regulator-tps65219-regulator.c:sparse:int
|   |-- drivers-regulator-tps65219-regulator.c:sparse:sparse:incompatible-types-for-operation-(-):
|   |-- drivers-regulator-tps65219-regulator.c:sparse:struct-regulator_dev-assigned-rdev
|   |-- drivers-regulator-tps65219-regulator.c:warning:ordered-comparison-of-pointer-with-integer-zero
|   |-- drivers-regulator-tps65219-regulator.c:warning:parameter-dev-set-but-not-used
|   `-- fs-xfs-xfs_iomap.c:sparse:sparse:symbol-xfs_iomap_page_ops-was-not-declared.-Should-it-be-static
|-- i386-allyesconfig
|   |-- drivers-regulator-tps65219-regulator.c:warning:ordered-comparison-of-pointer-with-integer-zero
|   `-- drivers-regulator-tps65219-regulator.c:warning:parameter-dev-set-but-not-used
|-- i386-randconfig-s002
|   `-- fs-xfs-xfs_iomap.c:sparse:sparse:symbol-xfs_iomap_page_ops-was-not-declared.-Should-it-be-static
|-- ia64-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dcn201-irq_service_dcn201.c:warning:no-previous-prototype-for-to_dal_irq_source_dcn201
|   |-- drivers-regulator-tps65219-regulator.c:warning:ordered-comparison-of-pointer-with-integer-zero
|   `-- drivers-regulator-tps65219-regulator.c:warning:parameter-dev-set-but-not-used
|-- m68k-allmodconfig
|   |-- drivers-regulator-tps65219-regulator.c:warning:ordered-comparison-of-pointer-with-integer-zero
|   `-- drivers-regulator-tps65219-regulator.c:warning:parameter-dev-set-but-not-used
|-- m68k-allyesconfig
|   |-- drivers-regulator-tps65219-regulator.c:warning:ordered-comparison-of-pointer-with-integer-zero
|   `-- drivers-regulator-tps65219-regulator.c:warning:parameter-dev-set-but-not-used
|-- m68k-randconfig-s041-20221216
|   |-- drivers-media-platform-ti-davinci-vpif.c:sparse:sparse:cast-from-non-scalar
|   `-- drivers-media-platform-ti-davinci-vpif.c:sparse:sparse:cast-to-non-scalar
|-- m68k-randconfig-s043-20221216
|   |-- drivers-accessibility-speakup-main.c:sparse:sparse:obsolete-array-initializer-use-C99-syntax
|   |-- drivers-usb-misc-sisusbvga-sisusbvga.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-unsigned-int-usertype-address-got-restricted-__le32-usertype
clang_recent_errors
|-- hexagon-allyesconfig
|   `-- drivers-regulator-tps65219-regulator.c:warning:parameter-dev-set-but-not-used
|-- riscv-randconfig-r023-20221215
|   |-- ld.lld:error:too-many-errors-emitted-stopping-now-(use-error-limit-to-see-all-errors)
|   |-- ld.lld:error:vmlinux.a(kernel-kallsyms.o):(function-kallsyms_lookup_name:.text):relocation-R_RISCV_PCREL_HI20-out-of-range:is-not-in-references-kallsyms_seqs_of_names
|   |-- ld.lld:error:vmlinux.a(kernel-kallsyms.o):(function-kallsyms_lookup_names:.text):relocation-R_RISCV_PCREL_HI20-out-of-range:is-not-in-references-kallsyms_num_syms
|   |-- ld.lld:error:vmlinux.a(kernel-kallsyms.o):(function-kallsyms_lookup_names:.text):relocation-R_RISCV_PCREL_HI20-out-of-range:is-not-in-references-kallsyms_seqs_of_names
|   |-- ld.lld:error:vmlinux.a(kernel-kallsyms.o):(function-kallsyms_on_each_match_symbol:.text):relocation-R_RISCV_PCREL_HI20-out-of-range:is-not-in-references-kallsyms_offsets
|   |-- ld.lld:error:vmlinux.a(kernel-kallsyms.o):(function-kallsyms_on_each_match_symbol:.text):relocation-R_RISCV_PCREL_HI20-out-of-range:is-not-in-references-kallsyms_relative_base
|   |-- ld.lld:error:vmlinux.a(kernel-kallsyms.o):(function-kallsyms_on_each_match_symbol:.text):relocation-R_RISCV_PCREL_HI20-out-of-range:is-not-in-references-kallsyms_seqs_of_names
|   |-- ld.lld:error:vmlinux.a(kernel-kallsyms.o):(function-kallsyms_sym_address:.text):relocation-R_RISCV_PCREL_HI20-out-of-range:is-not-in-references-kallsyms_offsets
|   `-- ld.lld:error:vmlinux.a(kernel-kallsyms.o):(function-kallsyms_sym_address:.text):relocation-R_RISCV_PCREL_HI20-out-of-range:is-not-in-references-kallsyms_relative_base
`-- s390-randconfig-r022-20221215
    `-- hidma.c:(.text):undefined-reference-to-devm_ioremap_resource

elapsed time: 731m

configs tested: 81
configs skipped: 2

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                               rhel-8.3
arm                                 defconfig
ia64                             allmodconfig
x86_64                           rhel-8.3-bpf
m68k                             allyesconfig
x86_64                           allyesconfig
m68k                             allmodconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
arc                  randconfig-r043-20221215
x86_64                        randconfig-a015
i386                          randconfig-a001
x86_64                          rhel-8.3-func
i386                          randconfig-a003
s390                             allmodconfig
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-kvm
s390                             allyesconfig
s390                                defconfig
x86_64                            allnoconfig
x86_64                        randconfig-a004
arm                  randconfig-r046-20221215
arm64                            allyesconfig
i386                          randconfig-a005
arc                              allyesconfig
i386                                defconfig
powerpc                           allnoconfig
x86_64                        randconfig-a002
arm                              allyesconfig
i386                          randconfig-a014
alpha                            allyesconfig
powerpc                          allmodconfig
i386                          randconfig-a012
x86_64                        randconfig-a006
i386                          randconfig-a016
sh                               allmodconfig
mips                             allyesconfig
mips                           xway_defconfig
arc                              alldefconfig
sh                            shmin_defconfig
i386                             allyesconfig
sh                          r7785rp_defconfig
sparc                            alldefconfig
sh                         ecovec24_defconfig
i386                          randconfig-c001
sh                         apsh4a3a_defconfig
sh                        sh7757lcr_defconfig
m68k                        m5307c3_defconfig
arc                               allnoconfig
arm                        clps711x_defconfig
sh                            titan_defconfig

clang tested configs:
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                          rhel-8.3-rust
i386                          randconfig-a013
x86_64                        randconfig-a016
i386                          randconfig-a002
i386                          randconfig-a015
i386                          randconfig-a006
hexagon              randconfig-r041-20221215
i386                          randconfig-a004
hexagon              randconfig-r045-20221215
x86_64                        randconfig-a005
i386                          randconfig-a011
x86_64                        randconfig-a001
riscv                randconfig-r042-20221215
s390                 randconfig-r044-20221215
x86_64                        randconfig-a003
mips                        qi_lb60_defconfig
arm                             mxs_defconfig
arm                         palmz72_defconfig
arm                         hackkit_defconfig
arm                          ixp4xx_defconfig
arm                        vexpress_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
