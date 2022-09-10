Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0005B43B7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Sep 2022 04:09:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MPbs20FXjz3c6N
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Sep 2022 12:09:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VufQErAY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VufQErAY;
	dkim-atps=neutral
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MPbrM3P79z2xB5
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Sep 2022 12:08:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662775731; x=1694311731;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=MZte7nuC/t4BNBmNFqKoRny8+G/qGHFI71lNA6qj+rE=;
  b=VufQErAYO5aHhSNOgABdHeyzKrVUf88OfU8Sm620qlZHCbW8Th9va6dJ
   4IlmqG0iVJnUDqMrw2J5ND3ui5t7wpkrC4Onu1E2nnj2IzR2IEtCWqog8
   0DtLgXPeqN622umNVnc+n9E44un2bofSINvOuOkzNw5chzi7SgQTsa6iI
   Kwph7V4hheAUyuCvO25EWfhUuvj0XUJImEj1fQnCcIZ7fNswI464AmEnc
   i1fYQI0YWwIv4XRznJ3GM5GMFJKuJLvdlstx/B/QdGLWLWrtZ9z4Igzy/
   i/HT5Oik5kOjyzj41rsVsVUCJpkPtDwCVAtVMGPHu2emQnfbArV15S6af
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10465"; a="298404912"
X-IronPort-AV: E=Sophos;i="5.93,304,1654585200"; 
   d="scan'208";a="298404912"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2022 19:08:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,304,1654585200"; 
   d="scan'208";a="645761395"
Received: from lkp-server02.sh.intel.com (HELO b2938d2e5c5a) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 09 Sep 2022 19:08:38 -0700
Received: from kbuild by b2938d2e5c5a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oWpuw-000201-2X;
	Sat, 10 Sep 2022 02:08:22 +0000
Date: Sat, 10 Sep 2022 10:08:05 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 71a92e99c47900cc164620948b3863382cec4f1a
Message-ID: <631bf185.OAV5yiFf4D9VEm5G%lkp@intel.com>
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
branch HEAD: 71a92e99c47900cc164620948b3863382cec4f1a  powerpc/powernv: add missing of_node_put() in opal_export_attrs()

elapsed time: 875m

configs tested: 100
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
m68k                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
arc                              allyesconfig
mips                             allyesconfig
x86_64                           allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
sh                               allmodconfig
arc                  randconfig-r043-20220907
i386                                defconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
x86_64                        randconfig-a013
x86_64                           rhel-8.3-kvm
x86_64                        randconfig-a011
x86_64                           rhel-8.3-syz
x86_64                        randconfig-a015
i386                          randconfig-a001
x86_64                        randconfig-a004
i386                          randconfig-a003
x86_64                        randconfig-a002
arm                                 defconfig
x86_64                        randconfig-a006
i386                          randconfig-a005
arm64                            allyesconfig
arm                              allyesconfig
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
i386                             allyesconfig
sh                             espt_defconfig
riscv             nommu_k210_sdcard_defconfig
arm                            mps2_defconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
powerpc                      ppc40x_defconfig
arm                         axm55xx_defconfig
mips                         db1xxx_defconfig
arm                            zeus_defconfig
parisc                              defconfig
sh                     sh7710voipgw_defconfig
arm                        keystone_defconfig
x86_64                           alldefconfig
xtensa                    xip_kc705_defconfig
mips                    maltaup_xpa_defconfig
mips                      maltasmvp_defconfig
i386                          randconfig-c001
m68k                        m5407c3_defconfig
nios2                         3c120_defconfig
loongarch                           defconfig
loongarch                         allnoconfig
arm                         cm_x300_defconfig
powerpc                    klondike_defconfig
arm                          badge4_defconfig
mips                      fuloong2e_defconfig
s390                       zfcpdump_defconfig
mips                        bcm47xx_defconfig
arm                            pleb_defconfig
riscv                               defconfig
nios2                         10m50_defconfig
powerpc                 mpc837x_rdb_defconfig
arc                              alldefconfig
sh                              ul2_defconfig
arm                           sunxi_defconfig
arm                          exynos_defconfig
sh                   secureedge5410_defconfig
arm                         lubbock_defconfig
sh                          rsk7264_defconfig
ia64                             allmodconfig

clang tested configs:
hexagon              randconfig-r041-20220907
s390                 randconfig-r044-20220907
hexagon              randconfig-r045-20220907
riscv                randconfig-r042-20220907
x86_64                        randconfig-a012
x86_64                        randconfig-a016
x86_64                        randconfig-a014
x86_64                        randconfig-a001
i386                          randconfig-a004
i386                          randconfig-a002
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a006
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
riscv                randconfig-r042-20220909
hexagon              randconfig-r041-20220909
hexagon              randconfig-r045-20220909
s390                 randconfig-r044-20220909
x86_64                        randconfig-k001
hexagon              randconfig-r041-20220908
hexagon              randconfig-r045-20220908

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
