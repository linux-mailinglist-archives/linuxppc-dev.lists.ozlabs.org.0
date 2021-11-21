Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 150614584EE
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Nov 2021 17:56:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HxxQG4Dswz3cTQ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Nov 2021 03:56:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HxxPL6Z6Lz2xv8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Nov 2021 03:56:02 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10175"; a="233395519"
X-IronPort-AV: E=Sophos;i="5.87,252,1631602800"; d="scan'208";a="233395519"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2021 08:54:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,252,1631602800"; d="scan'208";a="456374141"
Received: from lkp-server02.sh.intel.com (HELO c20d8bc80006) ([10.239.97.151])
 by orsmga006.jf.intel.com with ESMTP; 21 Nov 2021 08:54:57 -0800
Received: from kbuild by c20d8bc80006 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1moq7E-000718-Th; Sun, 21 Nov 2021 16:54:56 +0000
Date: Mon, 22 Nov 2021 00:54:19 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS a4884e88b53ceabfdf5ea95a95fb56766a826246
Message-ID: <619a79bb.X1BmwfK6UI+AxMQE%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git merge
branch HEAD: a4884e88b53ceabfdf5ea95a95fb56766a826246  Automatic merge of 'fixes' into merge (2021-11-21 15:36)

elapsed time: 723m

configs tested: 128
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                            allyesconfig
arm64                               defconfig
mips                     cu1830-neo_defconfig
parisc                generic-32bit_defconfig
sh                           se7619_defconfig
sh                        edosk7705_defconfig
mips                        omega2p_defconfig
powerpc                   microwatt_defconfig
arm                              alldefconfig
arm                         at91_dt_defconfig
powerpc                     tqm8555_defconfig
sh                           se7722_defconfig
sh                          rsk7264_defconfig
mips                      fuloong2e_defconfig
mips                     loongson1b_defconfig
arm                          simpad_defconfig
sh                         microdev_defconfig
ia64                          tiger_defconfig
arm                       netwinder_defconfig
sh                   sh7770_generic_defconfig
arm                        vexpress_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                     tqm8541_defconfig
sh                               alldefconfig
powerpc                 mpc832x_mds_defconfig
riscv                    nommu_virt_defconfig
arm                            dove_defconfig
mips                      loongson3_defconfig
mips                      maltasmvp_defconfig
sh                          urquell_defconfig
sh                        apsh4ad0a_defconfig
powerpc                      pcm030_defconfig
sh                          r7785rp_defconfig
riscv                            allyesconfig
mips                         tb0219_defconfig
openrisc                 simple_smp_defconfig
arm                         orion5x_defconfig
powerpc                     mpc5200_defconfig
sh                      rts7751r2d1_defconfig
m68k                       bvme6000_defconfig
powerpc                    socrates_defconfig
powerpc                 mpc832x_rdb_defconfig
s390                       zfcpdump_defconfig
arm                  randconfig-c002-20211121
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
csky                                defconfig
alpha                               defconfig
nds32                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
h8300                            allyesconfig
parisc                              defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
s390                             allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                              debian-10.3
nds32                             allnoconfig
nios2                               defconfig
arc                              allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
x86_64               randconfig-a001-20211121
x86_64               randconfig-a003-20211121
x86_64               randconfig-a002-20211121
x86_64               randconfig-a006-20211121
x86_64               randconfig-a004-20211121
x86_64               randconfig-a005-20211121
i386                 randconfig-a001-20211121
i386                 randconfig-a002-20211121
i386                 randconfig-a005-20211121
i386                 randconfig-a006-20211121
i386                 randconfig-a004-20211121
i386                 randconfig-a003-20211121
arc                  randconfig-r043-20211121
riscv                    nommu_k210_defconfig
riscv                          rv32_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                                  kexec
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests

clang tested configs:
i386                 randconfig-c001-20211121
powerpc              randconfig-c003-20211121
arm                  randconfig-c002-20211121
x86_64               randconfig-c007-20211121
mips                 randconfig-c004-20211121
s390                 randconfig-c005-20211121
riscv                randconfig-c006-20211121
x86_64               randconfig-a016-20211121
x86_64               randconfig-a011-20211121
x86_64               randconfig-a014-20211121
x86_64               randconfig-a012-20211121
x86_64               randconfig-a013-20211121
x86_64               randconfig-a015-20211121
i386                 randconfig-a015-20211121
i386                 randconfig-a016-20211121
i386                 randconfig-a012-20211121
i386                 randconfig-a013-20211121
i386                 randconfig-a011-20211121
i386                 randconfig-a014-20211121
s390                 randconfig-r044-20211121
hexagon              randconfig-r045-20211121
hexagon              randconfig-r041-20211121
riscv                randconfig-r042-20211121

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
