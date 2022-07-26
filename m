Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83283580925
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jul 2022 03:42:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LsKQc2f74z3cf4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jul 2022 11:42:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ayErtdhB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mga11.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ayErtdhB;
	dkim-atps=neutral
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LsKPy64YDz304J
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jul 2022 11:41:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658799687; x=1690335687;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=v67MY5lEIlYOSqBJlE2E2YwaHlcpIaPf2gqhbfuwarA=;
  b=ayErtdhBkZTWJUwqDIPDS52oOJGUqgVF9rGIufJgzPVB0dIR3fwVjCFy
   OpGs79TR55qMPZQ5mafRLh1fjU6p5TvH4d/Igms2gZh5H739gn5eIf8dC
   ahgdvVQX7hguuaM69fb/iMkJfmd+8+hz6WkCXgIuk8u5evciV4HvfaAue
   3G2Ehk2/h21m5TQ5oIGkRyYFaWcnThblI66J+qldUzKSc1W67wBHvMOY9
   dMT/gY1XsqC3+buanvMV0RMtwtpEC3i6J1xXxFINqCWQTraPTqdDvx0pV
   6iKWom1MN7hLk3Fshad2w31NDdc9n+Q0jHMrsonyc4Y84jmWy3QGhXpBI
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10419"; a="285381921"
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; 
   d="scan'208";a="285381921"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2022 18:41:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; 
   d="scan'208";a="632564631"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 25 Jul 2022 18:41:23 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oG9Za-0005oK-11;
	Tue, 26 Jul 2022 01:41:22 +0000
Date: Tue, 26 Jul 2022 09:40:49 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:topic/ppc-kvm] BUILD SUCCESS
 4008d54e29531813e800580f8309133b9b14a921
Message-ID: <62df4621.zKDQCZn08WCqLKqB%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git topic/ppc-kvm
branch HEAD: 4008d54e29531813e800580f8309133b9b14a921  powerpc/kvm: Remove comment related to moving PMU code to perf subsystem

elapsed time: 741m

configs tested: 91
configs skipped: 110

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
powerpc              randconfig-c003-20220724
i386                          randconfig-c001
arm                        clps711x_defconfig
powerpc                 mpc85xx_cds_defconfig
parisc64                         alldefconfig
arm                       imx_v6_v7_defconfig
arm                       aspeed_g5_defconfig
sh                      rts7751r2d1_defconfig
sh                 kfr2r09-romimage_defconfig
arm                          lpd270_defconfig
powerpc                    amigaone_defconfig
arm                        cerfcube_defconfig
arc                          axs101_defconfig
arm                        shmobile_defconfig
m68k                           virt_defconfig
sh                             espt_defconfig
m68k                                defconfig
mips                           gcw0_defconfig
sh                     sh7710voipgw_defconfig
m68k                          atari_defconfig
powerpc                      tqm8xx_defconfig
powerpc                     tqm8555_defconfig
mips                      fuloong2e_defconfig
arm                        oxnas_v6_defconfig
microblaze                      mmu_defconfig
xtensa                  cadence_csp_defconfig
mips                             allmodconfig
arm                            lart_defconfig
xtensa                generic_kc705_defconfig
powerpc                       ppc64_defconfig
powerpc                     mpc83xx_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
loongarch                           defconfig
loongarch                         allnoconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
x86_64                        randconfig-c001
arm                  randconfig-c002-20220724
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
i386                             allyesconfig
i386                                defconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
s390                 randconfig-r044-20220724
riscv                randconfig-r042-20220724
arc                  randconfig-r043-20220724
x86_64                    rhel-8.3-kselftests
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           rhel-8.3-kvm
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit

clang tested configs:
mips                   sb1250_swarm_defconfig
powerpc                     powernv_defconfig
powerpc                      ppc44x_defconfig
powerpc                     mpc5200_defconfig
powerpc                      walnut_defconfig
powerpc                 mpc832x_rdb_defconfig
arm                          moxart_defconfig
arm                         hackkit_defconfig
mips                         tb0219_defconfig
arm                        mvebu_v5_defconfig
x86_64                        randconfig-k001
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
