Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3563A8F6D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 05:38:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G4W9y1nCkz3bwl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 13:38:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G4W9X1jCDz2yYP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Jun 2021 13:38:07 +1000 (AEST)
IronPort-SDR: 2cGICnrj21eTSlT61+hVkAVlZ6jO2VL1Cd5kqVZEiEZAj2lHWko8TDMw0wW0TAtgMoZCRJU+uO
 w7+BkzBSGE6Q==
X-IronPort-AV: E=McAfee;i="6200,9189,10016"; a="186484261"
X-IronPort-AV: E=Sophos;i="5.83,277,1616482800"; d="scan'208";a="186484261"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2021 20:38:01 -0700
IronPort-SDR: yUssMfgtZLImPNQlXDfF8ssl8ReqNXcuz+yd3NdNECNqXeUpqzNOamlQ/NKruqi4vU5BbTBV2/
 /QyCTB6Glnng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,277,1616482800"; d="scan'208";a="452188866"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 15 Jun 2021 20:38:00 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1ltMNM-0000nm-9U; Wed, 16 Jun 2021 03:38:00 +0000
Date: Wed, 16 Jun 2021 11:37:33 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD REGRESSION
 103bf32b0d2dd8b8a4d3d9ebdded5ba4e8263e6a
Message-ID: <60c971fd.9loRM1929BGojev3%lkp@intel.com>
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
branch HEAD: 103bf32b0d2dd8b8a4d3d9ebdded5ba4e8263e6a  powerpc/interrupt: Remove prep_irq_for_user_exit()

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- powerpc-allyesconfig
|   |-- arch-powerpc-kernel-interrupt.c:warning:no-previous-prototype-for-interrupt_exit_kernel_restart
|   |-- arch-powerpc-kernel-interrupt.c:warning:no-previous-prototype-for-interrupt_exit_user_restart
|   |-- arch-powerpc-kernel-interrupt.c:warning:no-previous-prototype-for-syscall_exit_restart
|   `-- arch-powerpc-lib-restart_table.c:warning:no-previous-prototype-for-search_kernel_restart_table
`-- x86_64-allnoconfig
    `-- arch-powerpc-kernel-interrupt_64.S:asm-head-.h-is-included-more-than-once.

clang_recent_errors
`-- powerpc-randconfig-r012-20210615
    |-- arch-powerpc-kernel-rtasd.c:error:unused-variable-rtas_log_proc_ops-Werror-Wunused-const-variable
    |-- arch-powerpc-platforms-pseries-lpar.c:error:unused-variable-vcpudispatch_stats_freq_proc_ops-Werror-Wunused-const-variable
    |-- arch-powerpc-platforms-pseries-lpar.c:error:unused-variable-vcpudispatch_stats_proc_ops-Werror-Wunused-const-variable
    |-- arch-powerpc-platforms-pseries-reconfig.c:error:unused-variable-ofdt_proc_ops-Werror-Wunused-const-variable
    `-- drivers-misc-cxl-native.c:error:unused-function-detach_spa-Werror-Wunused-function

elapsed time: 730m

configs tested: 94
configs skipped: 2

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
xtensa                         virt_defconfig
arm                            lart_defconfig
sh                           se7619_defconfig
ia64                      gensparse_defconfig
powerpc                 mpc836x_mds_defconfig
mips                     cu1000-neo_defconfig
m68k                       m5275evb_defconfig
arm                        keystone_defconfig
arm                         palmz72_defconfig
powerpc                mpc7448_hpc2_defconfig
s390                          debug_defconfig
powerpc                 mpc832x_mds_defconfig
arm                        mvebu_v5_defconfig
sparc                       sparc64_defconfig
powerpc                 mpc85xx_cds_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
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
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a002-20210615
i386                 randconfig-a006-20210615
i386                 randconfig-a004-20210615
i386                 randconfig-a001-20210615
i386                 randconfig-a005-20210615
i386                 randconfig-a003-20210615
i386                 randconfig-a015-20210615
i386                 randconfig-a013-20210615
i386                 randconfig-a016-20210615
i386                 randconfig-a012-20210615
i386                 randconfig-a014-20210615
i386                 randconfig-a011-20210615
x86_64               randconfig-a001-20210615
x86_64               randconfig-a004-20210615
x86_64               randconfig-a002-20210615
x86_64               randconfig-a003-20210615
x86_64               randconfig-a006-20210615
x86_64               randconfig-a005-20210615
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
x86_64               randconfig-b001-20210615
x86_64               randconfig-a015-20210615
x86_64               randconfig-a011-20210615
x86_64               randconfig-a012-20210615
x86_64               randconfig-a014-20210615
x86_64               randconfig-a016-20210615
x86_64               randconfig-a013-20210615

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
