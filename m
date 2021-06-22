Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9843AFBB7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 06:23:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8Ctv0bMyz3btL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 14:23:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8CtV60V7z2ysk
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 14:22:57 +1000 (AEST)
IronPort-SDR: SYVXEh1BBRWgjmrq4nZAbgCCknt6Zk+ah251qZRe+BVt84R0jAejsWJQFJDU8nzlOwjFieWqiW
 dTktmeVWnT9A==
X-IronPort-AV: E=McAfee;i="6200,9189,10022"; a="187362175"
X-IronPort-AV: E=Sophos;i="5.83,291,1616482800"; d="scan'208";a="187362175"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2021 21:22:52 -0700
IronPort-SDR: +lHR6ZowVmHlavOQjuXHljd9YvHsjCriUL06HdgUV/zSpYt7Q8nUBYBDqBGovcvFviOADeGCY5
 WX64BDlGc3Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,291,1616482800"; d="scan'208";a="406197201"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 21 Jun 2021 21:22:50 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lvXw0-0004wD-5W; Tue, 22 Jun 2021 04:22:48 +0000
Date: Tue, 22 Jun 2021 12:22:20 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS 9a0b020d61685913a1504398273ccec8dbc8c32e
Message-ID: <60d1657c.NSsNNw+NSNDl1TR+%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
branch HEAD: 9a0b020d61685913a1504398273ccec8dbc8c32e  Merge branch 'topic/ppc-kvm' into next

elapsed time: 724m

configs tested: 146
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                            allyesconfig
arm64                               defconfig
arm                        spear6xx_defconfig
powerpc                 mpc8313_rdb_defconfig
arm                      pxa255-idp_defconfig
arm                      integrator_defconfig
powerpc                 mpc8540_ads_defconfig
mips                      pic32mzda_defconfig
arc                     nsimosci_hs_defconfig
mips                         rt305x_defconfig
arm                           h5000_defconfig
sh                           se7343_defconfig
sh                           sh2007_defconfig
sh                           se7619_defconfig
nios2                         10m50_defconfig
arm                             mxs_defconfig
powerpc                     sequoia_defconfig
arm                          badge4_defconfig
mips                          ath79_defconfig
arc                              allyesconfig
h8300                       h8s-sim_defconfig
sh                         ap325rxa_defconfig
m68k                            mac_defconfig
ia64                             alldefconfig
sh                 kfr2r09-romimage_defconfig
sh                ecovec24-romimage_defconfig
ia64                        generic_defconfig
powerpc                      ppc44x_defconfig
powerpc                   motionpro_defconfig
mips                malta_qemu_32r6_defconfig
parisc                generic-64bit_defconfig
powerpc                      acadia_defconfig
sh                            shmin_defconfig
powerpc                  mpc866_ads_defconfig
sh                          landisk_defconfig
powerpc                      ep88xc_defconfig
mips                  maltasmvp_eva_defconfig
s390                             alldefconfig
m68k                          multi_defconfig
powerpc                     tqm5200_defconfig
m68k                        mvme16x_defconfig
h8300                    h8300h-sim_defconfig
mips                       lemote2f_defconfig
arm                            qcom_defconfig
powerpc                 mpc832x_rdb_defconfig
mips                        jmr3927_defconfig
mips                       bmips_be_defconfig
mips                            e55_defconfig
powerpc                     pq2fads_defconfig
powerpc                    amigaone_defconfig
sh                          rsk7269_defconfig
powerpc                          g5_defconfig
arm                            hisi_defconfig
powerpc                      katmai_defconfig
mips                  decstation_64_defconfig
m68k                        m5272c3_defconfig
sh                         ecovec24_defconfig
arm                          collie_defconfig
s390                                defconfig
s390                       zfcpdump_defconfig
parisc                           alldefconfig
sh                              ul2_defconfig
powerpc                      pmac32_defconfig
arm                       cns3420vb_defconfig
m68k                           sun3_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                              defconfig
parisc                           allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a002-20210621
x86_64               randconfig-a001-20210621
x86_64               randconfig-a003-20210621
x86_64               randconfig-a004-20210621
x86_64               randconfig-a005-20210621
x86_64               randconfig-a006-20210621
i386                 randconfig-a002-20210621
i386                 randconfig-a001-20210621
i386                 randconfig-a003-20210621
i386                 randconfig-a006-20210621
i386                 randconfig-a005-20210621
i386                 randconfig-a004-20210621
i386                 randconfig-a011-20210621
i386                 randconfig-a014-20210621
i386                 randconfig-a013-20210621
i386                 randconfig-a015-20210621
i386                 randconfig-a012-20210621
i386                 randconfig-a016-20210621
i386                 randconfig-a011-20210622
i386                 randconfig-a014-20210622
i386                 randconfig-a013-20210622
i386                 randconfig-a015-20210622
i386                 randconfig-a012-20210622
i386                 randconfig-a016-20210622
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
um                            kunit_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210621
x86_64               randconfig-a012-20210621
x86_64               randconfig-a016-20210621
x86_64               randconfig-a015-20210621
x86_64               randconfig-a014-20210621
x86_64               randconfig-a013-20210621
x86_64               randconfig-a011-20210621

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
