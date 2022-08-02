Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC915884C7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Aug 2022 01:37:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LyBGz0w6Gz3cMq
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Aug 2022 09:37:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=h8lNcMea;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mga05.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=h8lNcMea;
	dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LyBGL4K3kz2xGH
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Aug 2022 09:36:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659483402; x=1691019402;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=M3yf+PrsKzfK+nuAbAh/7AUP7QgOZ237qwkG9tuJPNo=;
  b=h8lNcMeaoETEih0AVfxSTH1HhXpu0gZ0djDpuNXsz7YCfB0U7kWeZWLU
   GBo+NdABeYtyH8UW6rGw8qIZnMD/JKVVYlmFxL9il/sxdJb4chS/YJelw
   BwtmtncccXdXS1f+sPVMNEjYt4+eSrOd5s6QhNUkgmiBkNAfCLHy5Mqwa
   vYvoMrvqtw2bPQmHVuEoTBh2W4C3wratvXcOrg5VJuDxhYkJd5yn/sB4z
   gnyNmJvZv8EPENtc2KD4t6Lpq/FKQaOzCuCjH5x6yOO3MJGzZxNGgJlvR
   XMzeIdwd3HT5h4NecOx13eGzenPVfuv76hwKB+Peh7Fel+esTLMjlsTxg
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10427"; a="375842873"
X-IronPort-AV: E=Sophos;i="5.93,212,1654585200"; 
   d="scan'208";a="375842873"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2022 16:36:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,212,1654585200"; 
   d="scan'208";a="630915440"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 02 Aug 2022 16:36:38 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oJ1RG-000GZ5-0C;
	Tue, 02 Aug 2022 23:36:38 +0000
Date: Wed, 03 Aug 2022 07:35:55 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 fb5699779213dd944845b8a19e6b8a8c20d899c8
Message-ID: <62e9b4db.zCk4D5/n2YsgMmDC%lkp@intel.com>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
branch HEAD: fb5699779213dd944845b8a19e6b8a8c20d899c8  powerpc/pci: Fix PHB numbering when using opal-phbid

elapsed time: 718m

configs tested: 92
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
arc                  randconfig-r043-20220802
x86_64                              defconfig
x86_64               randconfig-a014-20220801
x86_64               randconfig-a011-20220801
x86_64               randconfig-a012-20220801
x86_64               randconfig-a013-20220801
x86_64                               rhel-8.3
x86_64               randconfig-a015-20220801
x86_64                           allyesconfig
x86_64               randconfig-a016-20220801
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
powerpc                           allnoconfig
powerpc                          allmodconfig
mips                             allyesconfig
x86_64                           rhel-8.3-syz
i386                                defconfig
x86_64                           rhel-8.3-kvm
arm                                 defconfig
sh                               allmodconfig
i386                 randconfig-a012-20220801
i386                 randconfig-a013-20220801
i386                             allyesconfig
i386                 randconfig-a014-20220801
i386                 randconfig-a011-20220801
i386                 randconfig-a016-20220801
i386                 randconfig-a015-20220801
arm                              allyesconfig
arm64                            allyesconfig
ia64                             allmodconfig
m68k                             allmodconfig
alpha                            allyesconfig
arc                              allyesconfig
m68k                             allyesconfig
s390                 randconfig-r044-20220801
arc                  randconfig-r043-20220801
riscv                randconfig-r042-20220801
arc                        vdk_hs38_defconfig
mips                            ar7_defconfig
sh                   sh7724_generic_defconfig
alpha                             allnoconfig
xtensa                generic_kc705_defconfig
sh                   secureedge5410_defconfig
arm                        mini2440_defconfig
nios2                         10m50_defconfig
sh                     sh7710voipgw_defconfig
i386                 randconfig-c001-20220801
csky                              allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
loongarch                           defconfig
loongarch                         allnoconfig
arm                       imx_v6_v7_defconfig
parisc                              defconfig
xtensa                         virt_defconfig
powerpc                      makalu_defconfig
m68k                          atari_defconfig
arc                      axs103_smp_defconfig
x86_64               randconfig-k001-20220801
mips                      loongson3_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func

clang tested configs:
hexagon              randconfig-r041-20220802
hexagon              randconfig-r045-20220802
s390                 randconfig-r044-20220802
riscv                randconfig-r042-20220802
x86_64               randconfig-a002-20220801
x86_64               randconfig-a001-20220801
x86_64               randconfig-a003-20220801
x86_64               randconfig-a006-20220801
x86_64               randconfig-a004-20220801
x86_64               randconfig-a005-20220801
i386                 randconfig-a001-20220801
i386                 randconfig-a002-20220801
i386                 randconfig-a003-20220801
i386                 randconfig-a005-20220801
i386                 randconfig-a004-20220801
i386                 randconfig-a006-20220801
powerpc                      ppc44x_defconfig
arm                       cns3420vb_defconfig
arm                   milbeaut_m10v_defconfig
powerpc                      obs600_defconfig
s390                             alldefconfig
arm                         mv78xx0_defconfig
powerpc                   bluestone_defconfig
powerpc                 mpc8560_ads_defconfig
powerpc                    gamecube_defconfig
mips                malta_qemu_32r6_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
