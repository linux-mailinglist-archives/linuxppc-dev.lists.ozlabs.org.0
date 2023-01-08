Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A4D66150A
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Jan 2023 13:28:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NqbvT4WcDz3cFJ
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Jan 2023 23:28:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NcZ7nm0y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NcZ7nm0y;
	dkim-atps=neutral
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NqbsW0Ph5z2xvL
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 Jan 2023 23:26:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673180783; x=1704716783;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=TK5C9g8tnVhA+UZKeBW5Q1sWdIOXfqvZEb+gDDyw/1I=;
  b=NcZ7nm0yMS6SU9atpDzh8EtUz3LTX4amInB/DQRYX2vAhdAknLn+TAu5
   0FitjdkwMWQNipAuSDCfmKyAeVqFX3NlHvYsHcc2aArZ5LrweB8RJxHXh
   d5YF5XEkr8tXMMdXZfG1LGk5o/U5MKW6ND6Jy2z/x+mw1fEnNCtkkvS4h
   EdUbUnROfH1c7uy3dffaeDpre6Wp8iPG+VfNtgOWo9ajnly5JrLCMkFR+
   ZVHcQ6FSLqOElhxHg9PoJ0pnSC/onfW8BySeTmDBxRs0lamfYlXe1qyHw
   5/kf8ax1NLsUnFblINbJXgM3QsLDYKSDuGEiwyKxReJzaS2TUPQi4Sniy
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10583"; a="349928299"
X-IronPort-AV: E=Sophos;i="5.96,310,1665471600"; 
   d="scan'208";a="349928299"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2023 04:26:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10583"; a="606337940"
X-IronPort-AV: E=Sophos;i="5.96,310,1665471600"; 
   d="scan'208";a="606337940"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 08 Jan 2023 04:26:16 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pEUkg-0005LS-3D;
	Sun, 08 Jan 2023 12:26:15 +0000
Date: Sun, 08 Jan 2023 20:26:12 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS
 fbb89f11118f6ed27af1ad85ac983eb55574328d
Message-ID: <63bab664.s1mTgYCfFRq+cmrt%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git merge
branch HEAD: fbb89f11118f6ed27af1ad85ac983eb55574328d  powerpc/ci: Update actions/upload-artifact to v3

elapsed time: 2157m

configs tested: 91
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                            allnoconfig
um                           x86_64_defconfig
um                             i386_defconfig
powerpc                           allnoconfig
arc                  randconfig-r043-20230106
alpha                            allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
arm                  randconfig-r046-20230106
arc                              allyesconfig
x86_64                              defconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
arc                                 defconfig
i386                          randconfig-a014
alpha                               defconfig
x86_64                               rhel-8.3
s390                             allmodconfig
x86_64                        randconfig-a006
s390                                defconfig
x86_64                           allyesconfig
i386                          randconfig-a012
i386                          randconfig-a001
s390                             allyesconfig
i386                          randconfig-a016
i386                          randconfig-a003
i386                          randconfig-a005
i386                                defconfig
sh                               allmodconfig
x86_64                           rhel-8.3-bpf
x86_64                        randconfig-a013
x86_64                           rhel-8.3-syz
x86_64                        randconfig-a011
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                        randconfig-a015
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
mips                             allyesconfig
powerpc                          allmodconfig
ia64                             allmodconfig
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
i386                             allyesconfig
sh                          rsk7264_defconfig
x86_64                           alldefconfig
powerpc                      ppc40x_defconfig
arc                              alldefconfig
m68k                        mvme147_defconfig
arm                  randconfig-r046-20230108
arc                  randconfig-r043-20230108
nios2                         3c120_defconfig
arm                        trizeps4_defconfig
mips                     loongson1b_defconfig
ia64                            zx1_defconfig
powerpc                  storcenter_defconfig
xtensa                          iss_defconfig
sh                ecovec24-romimage_defconfig
sh                                  defconfig

clang tested configs:
hexagon              randconfig-r041-20230106
hexagon              randconfig-r045-20230106
riscv                randconfig-r042-20230106
s390                 randconfig-r044-20230106
i386                          randconfig-a013
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a011
i386                          randconfig-a002
i386                          randconfig-a015
i386                          randconfig-a004
x86_64                        randconfig-a014
x86_64                          rhel-8.3-rust
i386                          randconfig-a006
x86_64                        randconfig-a012
x86_64                        randconfig-a016
hexagon              randconfig-r041-20230107
hexagon              randconfig-r045-20230107
arm                  randconfig-r046-20230107
hexagon              randconfig-r041-20230108
hexagon              randconfig-r045-20230108
riscv                randconfig-r042-20230108
s390                 randconfig-r044-20230108
arm                          ep93xx_defconfig
arm                        magician_defconfig
mips                     loongson1c_defconfig
powerpc                 mpc836x_rdk_defconfig
powerpc                     pseries_defconfig
powerpc                 mpc832x_mds_defconfig
arm                     am200epdkit_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
