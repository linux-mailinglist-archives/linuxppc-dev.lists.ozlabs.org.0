Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 406EF5AFAF4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 06:05:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMpZm1TXYz3c61
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 14:05:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LnxWcEP9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Two or more type TXT spf records found.) smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LnxWcEP9;
	dkim-atps=neutral
X-Greylist: delayed 64 seconds by postgrey-1.36 at boromir; Wed, 07 Sep 2022 14:05:16 AEST
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMpZ40FlFz2ypV
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Sep 2022 14:05:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662523516; x=1694059516;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=O/j+bThOni03aQH6nzxkBw+ZlHEKIJMxCdI91qZq0Rs=;
  b=LnxWcEP9qyQSjjFPMo72420thgJ79Mq/dH1tHN5iOvuuH4Fu+bgpquSX
   TDHmRo4YludmQaN0YDglRPiFsPwxfg4FzdDIjKSq8rahH46s41U5905D1
   UBo5sTd7NHLzzrj5xE22INc6rL/JI+Tde7kAhPs2MzL+ryDH8m7yHNISh
   qLJVFRQFxO+8wbEO9wekysYM6P87gqzWIhvQytwRyk31u1VDa5tiSkAtk
   mK57np//QxltF9g/3/P+4ERdXctDViR0lcyEytOZvlDM8kzKqZ5ZLoYZE
   6fCFWAdhdE3cCy2o9f+SlgaTsggHwLeT3lkVymK/bzyaf4YdaMnoN+NdV
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10462"; a="298088091"
X-IronPort-AV: E=Sophos;i="5.93,295,1654585200"; 
   d="scan'208";a="298088091"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2022 21:04:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,295,1654585200"; 
   d="scan'208";a="789912724"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 06 Sep 2022 21:04:01 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oVmID-00065J-0v;
	Wed, 07 Sep 2022 04:04:01 +0000
Date: Wed, 07 Sep 2022 12:03:43 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD REGRESSION
 7611de9cd7806a9c41426d12b98cf8867263a05f
Message-ID: <6318181f.V0GF6IzP179fns2h%lkp@intel.com>
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
branch HEAD: 7611de9cd7806a9c41426d12b98cf8867263a05f  powerpc/64s: add pte_needs_flush and huge_pmd_needs_flush

Error/Warning reports:

https://lore.kernel.org/linuxppc-dev/202209070030.PX7JcwtO-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

arch/powerpc/math-emu/fabs.c:7:1: error: no previous prototype for 'fabs' [-Werror=missing-prototypes]
arch/powerpc/math-emu/fadd.c:11:1: error: no previous prototype for 'fadd' [-Werror=missing-prototypes]
arch/powerpc/math-emu/fadds.c:12:1: error: no previous prototype for 'fadds' [-Werror=missing-prototypes]
arch/powerpc/math-emu/fcmpo.c:11:1: error: no previous prototype for 'fcmpo' [-Werror=missing-prototypes]
arch/powerpc/math-emu/fcmpu.c:11:1: error: no previous prototype for 'fcmpu' [-Werror=missing-prototypes]
arch/powerpc/math-emu/fcmpu.c:13:19: error: variable 'A_c' set but not used [-Werror=unused-but-set-variable]
arch/powerpc/math-emu/fcmpu.c:14:19: error: variable 'B_c' set but not used [-Werror=unused-but-set-variable]
arch/powerpc/math-emu/fctiw.c:11:1: error: no previous prototype for 'fctiw' [-Werror=missing-prototypes]
arch/powerpc/math-emu/fctiwz.c:11:1: error: no previous prototype for 'fctiwz' [-Werror=missing-prototypes]
arch/powerpc/math-emu/fdiv.c:11:1: error: no previous prototype for 'fdiv' [-Werror=missing-prototypes]
arch/powerpc/math-emu/fdivs.c:12:1: error: no previous prototype for 'fdivs' [-Werror=missing-prototypes]
arch/powerpc/math-emu/fmadd.c:11:1: error: no previous prototype for 'fmadd' [-Werror=missing-prototypes]
arch/powerpc/math-emu/fmadds.c:12:1: error: no previous prototype for 'fmadds' [-Werror=missing-prototypes]
arch/powerpc/math-emu/fmr.c:7:1: error: no previous prototype for 'fmr' [-Werror=missing-prototypes]
arch/powerpc/math-emu/fmsub.c:11:1: error: no previous prototype for 'fmsub' [-Werror=missing-prototypes]
arch/powerpc/math-emu/fmsubs.c:12:1: error: no previous prototype for 'fmsubs' [-Werror=missing-prototypes]
arch/powerpc/math-emu/fmul.c:11:1: error: no previous prototype for 'fmul' [-Werror=missing-prototypes]
arch/powerpc/math-emu/fmuls.c:12:1: error: no previous prototype for 'fmuls' [-Werror=missing-prototypes]
arch/powerpc/math-emu/fnabs.c:7:1: error: no previous prototype for 'fnabs' [-Werror=missing-prototypes]
arch/powerpc/math-emu/fneg.c:7:1: error: no previous prototype for 'fneg' [-Werror=missing-prototypes]
arch/powerpc/math-emu/fnmadd.c:11:1: error: no previous prototype for 'fnmadd' [-Werror=missing-prototypes]
arch/powerpc/math-emu/fnmadds.c:12:1: error: no previous prototype for 'fnmadds' [-Werror=missing-prototypes]
arch/powerpc/math-emu/fnmsub.c:11:1: error: no previous prototype for 'fnmsub' [-Werror=missing-prototypes]
arch/powerpc/math-emu/fnmsubs.c:12:1: error: no previous prototype for 'fnmsubs' [-Werror=missing-prototypes]
arch/powerpc/math-emu/fre.c:6:5: error: no previous prototype for 'fre' [-Werror=missing-prototypes]
arch/powerpc/math-emu/fres.c:7:1: error: no previous prototype for 'fres' [-Werror=missing-prototypes]
arch/powerpc/math-emu/frsp.c:12:1: error: no previous prototype for 'frsp' [-Werror=missing-prototypes]
arch/powerpc/math-emu/frsqrte.c:7:1: error: no previous prototype for 'frsqrte' [-Werror=missing-prototypes]
arch/powerpc/math-emu/frsqrtes.c:6:5: error: no previous prototype for 'frsqrtes' [-Werror=missing-prototypes]
arch/powerpc/math-emu/fsel.c:11:1: error: no previous prototype for 'fsel' [-Werror=missing-prototypes]
arch/powerpc/math-emu/fsqrt.c:11:1: error: no previous prototype for 'fsqrt' [-Werror=missing-prototypes]
arch/powerpc/math-emu/fsqrts.c:12:1: error: no previous prototype for 'fsqrts' [-Werror=missing-prototypes]
arch/powerpc/math-emu/fsub.c:11:1: error: no previous prototype for 'fsub' [-Werror=missing-prototypes]
arch/powerpc/math-emu/fsubs.c:12:1: error: no previous prototype for 'fsubs' [-Werror=missing-prototypes]
arch/powerpc/math-emu/lfd.c:10:1: error: no previous prototype for 'lfd' [-Werror=missing-prototypes]
arch/powerpc/math-emu/lfs.c:12:1: error: no previous prototype for 'lfs' [-Werror=missing-prototypes]
arch/powerpc/math-emu/math_efp.c:177:5: error: no previous prototype for 'do_spe_mathemu' [-Werror=missing-prototypes]
arch/powerpc/math-emu/math_efp.c:726:5: error: no previous prototype for 'speround_handler' [-Werror=missing-prototypes]
arch/powerpc/math-emu/math_efp.c:893:12: error: no previous prototype for 'spe_mathemu_init' [-Werror=missing-prototypes]
arch/powerpc/math-emu/mcrfs.c:10:1: error: no previous prototype for 'mcrfs' [-Werror=missing-prototypes]
arch/powerpc/math-emu/mffs.c:10:1: error: no previous prototype for 'mffs' [-Werror=missing-prototypes]
arch/powerpc/math-emu/mtfsb0.c:10:1: error: no previous prototype for 'mtfsb0' [-Werror=missing-prototypes]
arch/powerpc/math-emu/mtfsb1.c:10:1: error: no previous prototype for 'mtfsb1' [-Werror=missing-prototypes]
arch/powerpc/math-emu/mtfsf.c:10:1: error: no previous prototype for 'mtfsf' [-Werror=missing-prototypes]
arch/powerpc/math-emu/mtfsfi.c:10:1: error: no previous prototype for 'mtfsfi' [-Werror=missing-prototypes]
arch/powerpc/math-emu/stfd.c:7:1: error: no previous prototype for 'stfd' [-Werror=missing-prototypes]
arch/powerpc/math-emu/stfiwx.c:7:1: error: no previous prototype for 'stfiwx' [-Werror=missing-prototypes]
arch/powerpc/math-emu/stfs.c:12:1: error: no previous prototype for 'stfs' [-Werror=missing-prototypes]

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- powerpc-buildonly-randconfig-r003-20220906
|   |-- arch-powerpc-math-emu-fre.c:error:no-previous-prototype-for-fre
|   |-- arch-powerpc-math-emu-frsqrtes.c:error:no-previous-prototype-for-frsqrtes
|   |-- arch-powerpc-math-emu-fsqrt.c:error:no-previous-prototype-for-fsqrt
|   |-- arch-powerpc-math-emu-fsqrts.c:error:no-previous-prototype-for-fsqrts
|   |-- arch-powerpc-math-emu-mtfsf.c:error:no-previous-prototype-for-mtfsf
|   `-- arch-powerpc-math-emu-mtfsfi.c:error:no-previous-prototype-for-mtfsfi
|-- powerpc-currituck_defconfig
|   |-- arch-powerpc-math-emu-fabs.c:error:no-previous-prototype-for-fabs
|   |-- arch-powerpc-math-emu-fadd.c:error:no-previous-prototype-for-fadd
|   |-- arch-powerpc-math-emu-fadds.c:error:no-previous-prototype-for-fadds
|   |-- arch-powerpc-math-emu-fcmpo.c:error:no-previous-prototype-for-fcmpo
|   |-- arch-powerpc-math-emu-fcmpu.c:error:no-previous-prototype-for-fcmpu
|   |-- arch-powerpc-math-emu-fcmpu.c:error:variable-A_c-set-but-not-used
|   |-- arch-powerpc-math-emu-fcmpu.c:error:variable-B_c-set-but-not-used
|   |-- arch-powerpc-math-emu-fctiw.c:error:no-previous-prototype-for-fctiw
|   |-- arch-powerpc-math-emu-fctiwz.c:error:no-previous-prototype-for-fctiwz
|   |-- arch-powerpc-math-emu-fdiv.c:error:no-previous-prototype-for-fdiv
|   |-- arch-powerpc-math-emu-fdivs.c:error:no-previous-prototype-for-fdivs
|   |-- arch-powerpc-math-emu-fmadd.c:error:no-previous-prototype-for-fmadd
|   |-- arch-powerpc-math-emu-fmadds.c:error:no-previous-prototype-for-fmadds
|   |-- arch-powerpc-math-emu-fmr.c:error:no-previous-prototype-for-fmr
|   |-- arch-powerpc-math-emu-fmsub.c:error:no-previous-prototype-for-fmsub
|   |-- arch-powerpc-math-emu-fmsubs.c:error:no-previous-prototype-for-fmsubs
|   |-- arch-powerpc-math-emu-fmul.c:error:no-previous-prototype-for-fmul
|   |-- arch-powerpc-math-emu-fmuls.c:error:no-previous-prototype-for-fmuls
|   |-- arch-powerpc-math-emu-fnabs.c:error:no-previous-prototype-for-fnabs
|   |-- arch-powerpc-math-emu-fneg.c:error:no-previous-prototype-for-fneg
|   |-- arch-powerpc-math-emu-fnmadd.c:error:no-previous-prototype-for-fnmadd
|   |-- arch-powerpc-math-emu-fnmadds.c:error:no-previous-prototype-for-fnmadds
|   |-- arch-powerpc-math-emu-fnmsub.c:error:no-previous-prototype-for-fnmsub
|   |-- arch-powerpc-math-emu-fnmsubs.c:error:no-previous-prototype-for-fnmsubs
|   |-- arch-powerpc-math-emu-fre.c:error:no-previous-prototype-for-fre
|   |-- arch-powerpc-math-emu-fres.c:error:no-previous-prototype-for-fres
|   |-- arch-powerpc-math-emu-frsp.c:error:no-previous-prototype-for-frsp
|   |-- arch-powerpc-math-emu-frsqrte.c:error:no-previous-prototype-for-frsqrte
|   |-- arch-powerpc-math-emu-frsqrtes.c:error:no-previous-prototype-for-frsqrtes
|   |-- arch-powerpc-math-emu-fsel.c:error:no-previous-prototype-for-fsel
|   |-- arch-powerpc-math-emu-fsqrt.c:error:no-previous-prototype-for-fsqrt
|   |-- arch-powerpc-math-emu-fsqrts.c:error:no-previous-prototype-for-fsqrts
|   |-- arch-powerpc-math-emu-fsub.c:error:no-previous-prototype-for-fsub
|   |-- arch-powerpc-math-emu-fsubs.c:error:no-previous-prototype-for-fsubs
|   |-- arch-powerpc-math-emu-lfd.c:error:no-previous-prototype-for-lfd
|   |-- arch-powerpc-math-emu-lfs.c:error:no-previous-prototype-for-lfs
|   |-- arch-powerpc-math-emu-mcrfs.c:error:no-previous-prototype-for-mcrfs
|   |-- arch-powerpc-math-emu-mffs.c:error:no-previous-prototype-for-mffs
|   |-- arch-powerpc-math-emu-mtfsb0.c:error:no-previous-prototype-for-mtfsb0
|   |-- arch-powerpc-math-emu-mtfsb1.c:error:no-previous-prototype-for-mtfsb1
|   |-- arch-powerpc-math-emu-mtfsf.c:error:no-previous-prototype-for-mtfsf
|   |-- arch-powerpc-math-emu-mtfsfi.c:error:no-previous-prototype-for-mtfsfi

elapsed time: 966m

configs tested: 111
configs skipped: 2

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
i386                             allyesconfig
i386                                defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
riscv                randconfig-r042-20220906
arc                  randconfig-r043-20220906
s390                 randconfig-r044-20220906
x86_64                           rhel-8.3-kvm
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
sh                               j2_defconfig
arm                       aspeed_g5_defconfig
m68k                          multi_defconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
sh                           se7780_defconfig
mips                           xway_defconfig
powerpc                       holly_defconfig
sparc64                             defconfig
parisc                generic-32bit_defconfig
arc                         haps_hs_defconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
arm                           tegra_defconfig
arm                          gemini_defconfig
sh                         ecovec24_defconfig
xtensa                generic_kc705_defconfig
i386                          randconfig-c001
sh                          polaris_defconfig
sh                   sh7770_generic_defconfig
ia64                                defconfig
powerpc                    klondike_defconfig
ia64                            zx1_defconfig
sh                          r7780mp_defconfig
sparc                       sparc64_defconfig
parisc64                            defconfig
powerpc                 canyonlands_defconfig
arm                           viper_defconfig
powerpc                    adder875_defconfig
sh                        dreamcast_defconfig
sh                          lboxre2_defconfig
powerpc                      bamboo_defconfig
powerpc                      makalu_defconfig
csky                             alldefconfig
m68k                                defconfig
powerpc                     pq2fads_defconfig
xtensa                          iss_defconfig
powerpc                    amigaone_defconfig
arm                        cerfcube_defconfig
sparc                            allyesconfig
sh                           se7705_defconfig
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc                           allyesconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220906
sparc                               defconfig
xtensa                           allyesconfig
csky                                defconfig
x86_64                                  kexec
s390                                defconfig
s390                             allmodconfig
arc                                 defconfig
alpha                               defconfig
s390                             allyesconfig
ia64                             allmodconfig

clang tested configs:
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
powerpc                    mvme5100_defconfig
arm                             mxs_defconfig
powerpc                 mpc8313_rdb_defconfig
arm                            mmp2_defconfig
powerpc                      acadia_defconfig
powerpc                     pseries_defconfig
arm                        neponset_defconfig
hexagon              randconfig-r041-20220906
hexagon              randconfig-r045-20220906
powerpc                     kilauea_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
