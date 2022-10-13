Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2D15FDE1E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Oct 2022 18:21:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MpFBq1KGBz3dqS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Oct 2022 03:21:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RgD2Zt5/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mga02.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RgD2Zt5/;
	dkim-atps=neutral
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MpF9s1vrRz2ywY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Oct 2022 03:20:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665678033; x=1697214033;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=JdM6fRjtfQFPJ08asGi0OyQ7Kn3mWk6zXePhD5kQRm0=;
  b=RgD2Zt5/P1mWj+y+4IIKdKRTc20VO/4PTuSqNVc/Jh0UQN5TX1MRUk2g
   0n2nU0CmRh+eiXfyTJ9mTQrF59eLoJzLbWdw3E2s3ElVf2E8omDYktfAS
   8xkRGrOW0OpT0CrYRyS1F/msB8rC0wvuS226Dhvoj/gXaKNJlk7ZZRhg/
   R79ajXibulvZeB2+UbqFQG8AVqQnrKGsxCQaaAUt99yPj55qF3zDE6e1L
   BxFB8J4iMBaFgF3OLMgZF9fGouQo3gBlI4NbKshWhxdVQ6eEpRL/HOFKP
   hWU8Fk3c3yuDdNwaUpFpirOESrAroK5xMeK9inzc3M6VBc5aebt8UNWRj
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10499"; a="292467612"
X-IronPort-AV: E=Sophos;i="5.95,182,1661842800"; 
   d="scan'208";a="292467612"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2022 09:16:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10499"; a="752581669"
X-IronPort-AV: E=Sophos;i="5.95,182,1661842800"; 
   d="scan'208";a="752581669"
Received: from lkp-server01.sh.intel.com (HELO 2af0a69ca4e0) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 13 Oct 2022 09:16:34 -0700
Received: from kbuild by 2af0a69ca4e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oj0sr-0005L8-14;
	Thu, 13 Oct 2022 16:16:33 +0000
Date: Fri, 14 Oct 2022 00:16:27 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 56e8142dda103af35e1a47e560517dce355ac001
Message-ID: <634839db.CE/+5MHDyt/TjFSC%lkp@intel.com>
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
Cc: ntfs3@lists.linux.dev, Linux Memory Management List <linux-mm@kvack.org>, linux-mediatek@lists.infradead.org, linux-ext4@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 56e8142dda103af35e1a47e560517dce355ac001  Add linux-next specific files for 20221013

Error/Warning reports:

https://lore.kernel.org/linux-mm/202210090954.pTR6m6rj-lkp@intel.com
https://lore.kernel.org/linux-mm/202210110857.9s0tXVNn-lkp@intel.com
https://lore.kernel.org/linux-mm/202210111318.mbUfyhps-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

ERROR: modpost: "devm_ioremap_resource" [drivers/dma/fsl-edma.ko] undefined!
ERROR: modpost: "devm_ioremap_resource" [drivers/dma/idma64.ko] undefined!
ERROR: modpost: "devm_ioremap_resource" [drivers/dma/qcom/hdma.ko] undefined!
ERROR: modpost: "devm_memremap" [drivers/misc/open-dice.ko] undefined!
ERROR: modpost: "devm_memunmap" [drivers/misc/open-dice.ko] undefined!
ERROR: modpost: "devm_platform_ioremap_resource" [drivers/char/xillybus/xillybus_of.ko] undefined!
ERROR: modpost: "ioremap" [drivers/net/ethernet/8390/pcnet_cs.ko] undefined!
ERROR: modpost: "ioremap" [drivers/tty/ipwireless/ipwireless.ko] undefined!
ERROR: modpost: "iounmap" [drivers/net/ethernet/8390/pcnet_cs.ko] undefined!
ERROR: modpost: "iounmap" [drivers/tty/ipwireless/ipwireless.ko] undefined!
arch/arm64/kernel/alternative.c:199:6: warning: no previous prototype for 'apply_alternatives_vdso' [-Wmissing-prototypes]
arch/arm64/kernel/alternative.c:295:14: warning: no previous prototype for 'alt_cb_patch_nops' [-Wmissing-prototypes]
fs/ext4/super.c:1744:19: warning: 'deprecated_msg' defined but not used [-Wunused-const-variable=]
mm/mmap.c:802 __vma_adjust() error: uninitialized symbol 'next_next'.
vcpu.c:(.text+0xc56): undefined reference to `riscv_cbom_block_size'

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arc-randconfig-s051-20221012
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-int-priv1-got-restricted-__le16-addressable-usertype-fc_len
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-int-tag-got-restricted-__le16-addressable-usertype-fc_tag
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-unsigned-short-usertype-tag-got-restricted-__le16-addressable-usertype-fc_tag
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-restricted-__le16-usertype-fc_len-got-unsigned-short-usertype
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-restricted-__le16-usertype-fc_tag-got-unsigned-short-usertype
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-initializer-(different-base-types)-expected-int-tag-got-restricted-__le16-usertype-fc_tag
|   `-- fs-ext4-fast_commit.c:sparse:sparse:restricted-__le16-degrades-to-integer
|-- arm64-alldefconfig
|   |-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-alt_cb_patch_nops
|   `-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-apply_alternatives_vdso
|-- arm64-allyesconfig
|   |-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-alt_cb_patch_nops
|   `-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-apply_alternatives_vdso
|-- i386-allyesconfig
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- i386-defconfig
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- i386-randconfig-a003
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- i386-randconfig-a005
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- i386-randconfig-a012
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- i386-randconfig-a014
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- i386-randconfig-a016
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- i386-randconfig-c021
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- i386-randconfig-m021
|   `-- mm-mmap.c-__vma_adjust()-error:uninitialized-symbol-next_next-.
|-- microblaze-randconfig-s033-20221012
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-int-priv1-got-restricted-__le16-addressable-usertype-fc_len
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-int-tag-got-restricted-__le16-addressable-usertype-fc_tag
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-unsigned-short-usertype-tag-got-restricted-__le16-addressable-usertype-fc_tag
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-restricted-__le16-usertype-fc_len-got-unsigned-short-usertype
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-restricted-__le16-usertype-fc_tag-got-unsigned-short-usertype
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-initializer-(different-base-types)-expected-int-tag-got-restricted-__le16-usertype-fc_tag
|   |-- fs-ext4-fast_commit.c:sparse:sparse:restricted-__le16-degrades-to-integer
|   |-- fs-ntfs3-index.c:sparse:sparse:restricted-__le32-degrades-to-integer
|   |-- fs-ntfs3-namei.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-restricted-__le16-const-usertype-s1-got-unsigned-short
|   `-- fs-ntfs3-namei.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-restricted-__le16-const-usertype-s2-got-unsigned-short
|-- riscv-randconfig-r016-20221012
|   `-- vcpu.c:(.text):undefined-reference-to-riscv_cbom_block_size
|-- s390-allmodconfig
|   |-- ERROR:devm_ioremap_resource-drivers-dma-fsl-edma.ko-undefined
|   |-- ERROR:devm_ioremap_resource-drivers-dma-idma64.ko-undefined
|   |-- ERROR:devm_ioremap_resource-drivers-dma-qcom-hdma.ko-undefined
|   |-- ERROR:devm_memremap-drivers-misc-open-dice.ko-undefined
clang_recent_errors
|-- arm64-buildonly-randconfig-r002-20221012
|   `-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-function-apply_alternatives_vdso
|-- hexagon-randconfig-r032-20221012
|   |-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|   `-- fs-ntfs3-namei.c:warning:variable-uni1-is-used-uninitialized-whenever-if-condition-is-true
|-- hexagon-randconfig-r041-20221012
|   |-- drivers-phy-mediatek-phy-mtk-tphy.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:(unsigned-c
|   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|-- hexagon-randconfig-r045-20221012
|   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|-- i386-randconfig-a002
|   |-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|   `-- fs-ntfs3-namei.c:warning:variable-uni1-is-used-uninitialized-whenever-if-condition-is-true
|-- i386-randconfig-a004
|   |-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|   `-- fs-ntfs3-namei.c:warning:variable-uni1-is-used-uninitialized-whenever-if-condition-is-true
|-- i386-randconfig-a011
|   |-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|   `-- fs-ntfs3-namei.c:warning:variable-uni1-is-used-uninitialized-whenever-if-condition-is-true
|-- i386-randconfig-a013
|   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|-- i386-randconfig-a015
|   |-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|   `-- fs-ntfs3-namei.c:warning:variable-uni1-is-used-uninitialized-whenever-if-condition-is-true
|-- powerpc-mpc832x_rdb_defconfig
|   |-- arch-powerpc-math-emu-fcmpu.c:error:variable-A_c-set-but-not-used-Werror-Wunused-but-set-variable
|   |-- arch-powerpc-math-emu-fcmpu.c:error:variable-B_c-set-but-not-used-Werror-Wunused-but-set-variable
|   |-- arch-powerpc-math-emu-fcmpu.c:error:variable-_fex-set-but-not-used-Werror-Wunused-but-set-variable
|   |-- arch-powerpc-math-emu-fctiw.c:error:variable-_fex-set-but-not-used-Werror-Wunused-but-set-variable
|   |-- arch-powerpc-math-emu-fctiwz.c:error:variable-_fex-set-but-not-used-Werror-Wunused-but-set-variable
|   |-- arch-powerpc-math-emu-fsel.c:error:variable-_fex-set-but-not-used-Werror-Wunused-but-set-variable
|   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|-- riscv-randconfig-r001-20221012
|   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|-- x86_64-randconfig-a005
|   |-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|   `-- fs-ntfs3-namei.c:warning:variable-uni1-is-used-uninitialized-whenever-if-condition-is-true
|-- x86_64-randconfig-a012
|   |-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|   `-- fs-ntfs3-namei.c:warning:variable-uni1-is-used-uninitialized-whenever-if-condition-is-true
|-- x86_64-randconfig-a014
|   |-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|   `-- fs-ntfs3-namei.c:warning:variable-uni1-is-used-uninitialized-whenever-if-condition-is-true
`-- x86_64-rhel-8.3-rust
    `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg

elapsed time: 725m

configs tested: 83
configs skipped: 3

gcc tested configs:
riscv                randconfig-r042-20221012
arc                  randconfig-r043-20221012
s390                 randconfig-r044-20221012
arc                                 defconfig
alpha                               defconfig
x86_64                        randconfig-a004
i386                                defconfig
x86_64                        randconfig-a002
x86_64                        randconfig-a006
x86_64                           rhel-8.3-syz
s390                             allmodconfig
x86_64                         rhel-8.3-kunit
x86_64                              defconfig
alpha                             allnoconfig
x86_64                        randconfig-a013
x86_64                           rhel-8.3-kvm
x86_64                        randconfig-a011
arm                                 defconfig
riscv                             allnoconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
s390                                defconfig
csky                              allnoconfig
i386                          randconfig-a014
i386                          randconfig-a001
powerpc                           allnoconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
m68k                             allmodconfig
i386                          randconfig-a003
x86_64                        randconfig-a015
arc                               allnoconfig
s390                             allyesconfig
powerpc                          allmodconfig
i386                          randconfig-a012
i386                          randconfig-a005
i386                             allyesconfig
i386                          randconfig-a016
arc                              allyesconfig
mips                             allyesconfig
alpha                            allyesconfig
ia64                             allmodconfig
m68k                             allyesconfig
sh                               allmodconfig
powerpc                      cm5200_defconfig
arm                              allyesconfig
arc                        nsimosci_defconfig
arm64                            allyesconfig
sh                            hp6xx_defconfig
m68k                          amiga_defconfig
powerpc                   currituck_defconfig
m68k                       bvme6000_defconfig
um                             i386_defconfig
um                           x86_64_defconfig
arm                        cerfcube_defconfig
powerpc                 mpc837x_mds_defconfig
ia64                        generic_defconfig
arc                 nsimosci_hs_smp_defconfig
arm64                            alldefconfig
powerpc                     tqm8541_defconfig
xtensa                    smp_lx200_defconfig
sh                        edosk7705_defconfig

clang tested configs:
hexagon              randconfig-r045-20221012
hexagon              randconfig-r041-20221012
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a013
x86_64                        randconfig-a005
x86_64                        randconfig-a016
x86_64                        randconfig-a012
i386                          randconfig-a011
i386                          randconfig-a002
x86_64                        randconfig-a014
i386                          randconfig-a006
i386                          randconfig-a004
i386                          randconfig-a015
mips                   sb1250_swarm_defconfig
powerpc                 mpc832x_rdb_defconfig
x86_64                          rhel-8.3-rust
powerpc                      walnut_defconfig
arm                         hackkit_defconfig
arm                         lpc32xx_defconfig
arm                      pxa255-idp_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
