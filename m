Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D3247E548
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Dec 2021 15:57:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JKYFw1S04z3c9d
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Dec 2021 01:57:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ug9hgOrC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Ug9hgOrC; dkim-atps=neutral
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JKYF95rbBz2xrC
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Dec 2021 01:56:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640271422; x=1671807422;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=nrePuIn6WBrSiZ/Zdm1/q5xA58XiHr1nZjJoOxTY4RQ=;
 b=Ug9hgOrC6Fz47xonaDi/Zz0FcL0CwjoqNIq5GjQMLJwiezs+EHfMYabf
 iFzb5B2wSUYQ8bF9DncMFttzLfWbst38UPBgzPpvxt+Rqmu2UkodQnUO5
 E1qDgviya1nTp9RIZEcsE03HcflJ9fYmA1QqudxHQ0UJPpkb6FJtGtZuu
 +lOcyunYPrP3q5Ab5YtMt8/vaDn0GYcueKFZItkV4Vz3fYasnEWzSMYzi
 dv0pNKX4P6LVEMt7Wzr3+dkeMkiWw5NjJs7G5N8/MJKkhTkTNQ76QSVAQ
 Vg+ksyDixMF6Hjf+89U7krxmDRpCvb24QnJCeO9PvxU3PnL0KWa2LsSpx w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10206"; a="240637987"
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="240637987"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 06:55:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="685399728"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 23 Dec 2021 06:55:46 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1n0PVR-0001yx-UO; Thu, 23 Dec 2021 14:55:45 +0000
Date: Thu, 23 Dec 2021 22:55:37 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 3f51a5add7bc61eddbd1049eb0fbd7ee95cd08ac
Message-ID: <61c48de9.vRbLyTSa4IRH4LOc%lkp@intel.com>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
branch HEAD: 3f51a5add7bc61eddbd1049eb0fbd7ee95cd08ac  powerpc/code-patching: Replace patch_instruction() by ppc_inst_write() in selftests

elapsed time: 1339m

configs tested: 160
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                            allyesconfig
arm64                               defconfig
i386                 randconfig-c001-20211223
arm                          moxart_defconfig
powerpc               mpc834x_itxgp_defconfig
sparc                       sparc64_defconfig
powerpc                         wii_defconfig
powerpc64                        alldefconfig
powerpc                      ppc44x_defconfig
arm                         shannon_defconfig
m68k                         apollo_defconfig
powerpc                      katmai_defconfig
arm                        magician_defconfig
sh                 kfr2r09-romimage_defconfig
powerpc                      pcm030_defconfig
arc                     nsimosci_hs_defconfig
mips                         db1xxx_defconfig
sh                          sdk7786_defconfig
arm                          badge4_defconfig
powerpc                     tqm8540_defconfig
mips                           ip22_defconfig
powerpc                   motionpro_defconfig
arm                        clps711x_defconfig
sh                           se7343_defconfig
ia64                      gensparse_defconfig
h8300                     edosk2674_defconfig
arc                        vdk_hs38_defconfig
m68k                       m5208evb_defconfig
powerpc                     tqm8555_defconfig
arm                         lpc32xx_defconfig
mips                   sb1250_swarm_defconfig
arm                       aspeed_g4_defconfig
arm                          pxa3xx_defconfig
sh                           se7722_defconfig
mips                     cu1000-neo_defconfig
mips                            e55_defconfig
arm                             pxa_defconfig
sh                          kfr2r09_defconfig
powerpc                 mpc832x_mds_defconfig
ia64                             allyesconfig
powerpc                     skiroot_defconfig
sh                          rsk7264_defconfig
powerpc64                           defconfig
sh                        edosk7760_defconfig
powerpc                     kilauea_defconfig
arm                         hackkit_defconfig
mips                     loongson2k_defconfig
ia64                         bigsur_defconfig
mips                          ath25_defconfig
mips                          ath79_defconfig
arm                            mmp2_defconfig
mips                 decstation_r4k_defconfig
mips                           mtx1_defconfig
arm                          pxa168_defconfig
powerpc                      makalu_defconfig
arm                        trizeps4_defconfig
arm                            zeus_defconfig
m68k                       m5475evb_defconfig
xtensa                    smp_lx200_defconfig
arm                        vexpress_defconfig
powerpc                          allmodconfig
sh                      rts7751r2d1_defconfig
s390                             allyesconfig
openrisc                            defconfig
m68k                       bvme6000_defconfig
alpha                               defconfig
riscv             nommu_k210_sdcard_defconfig
arm                  randconfig-c002-20211222
arm                  randconfig-c002-20211223
ia64                             allmodconfig
ia64                                defconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
x86_64               randconfig-a001-20211222
x86_64               randconfig-a003-20211222
x86_64               randconfig-a005-20211222
x86_64               randconfig-a006-20211222
x86_64               randconfig-a004-20211222
x86_64               randconfig-a002-20211222
i386                 randconfig-a006-20211222
i386                 randconfig-a004-20211222
i386                 randconfig-a002-20211222
i386                 randconfig-a003-20211222
i386                 randconfig-a005-20211222
i386                 randconfig-a001-20211222
x86_64               randconfig-a013-20211223
x86_64               randconfig-a015-20211223
x86_64               randconfig-a014-20211223
x86_64               randconfig-a011-20211223
x86_64               randconfig-a012-20211223
x86_64               randconfig-a016-20211223
i386                 randconfig-a012-20211223
i386                 randconfig-a011-20211223
i386                 randconfig-a014-20211223
i386                 randconfig-a016-20211223
i386                 randconfig-a015-20211223
i386                 randconfig-a013-20211223
arc                  randconfig-r043-20211223
riscv                randconfig-r042-20211223
s390                 randconfig-r044-20211223
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a001-20211223
x86_64               randconfig-a003-20211223
x86_64               randconfig-a005-20211223
x86_64               randconfig-a006-20211223
x86_64               randconfig-a004-20211223
x86_64               randconfig-a002-20211223
i386                 randconfig-a006-20211223
i386                 randconfig-a004-20211223
i386                 randconfig-a002-20211223
i386                 randconfig-a003-20211223
i386                 randconfig-a005-20211223
i386                 randconfig-a001-20211223
hexagon              randconfig-r041-20211222
hexagon              randconfig-r045-20211222
riscv                randconfig-r042-20211222
s390                 randconfig-r044-20211222

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
