Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 184E54D0B10
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Mar 2022 23:28:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCCmR6p4Fz3bc4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 09:28:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C94SHzqo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=C94SHzqo; dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCClk1z5lz2yWH
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Mar 2022 09:28:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646692099; x=1678228099;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=Yug94W63r6WREE6ynlS3sHWiifw27sAbR90rhcQecmc=;
 b=C94SHzqoultSZshxEVRw/e5J4vlEaDYJl7hVxKvKbphufi5NCy4Ss3B9
 vvHgHsUiX7lbQyh3KxnYmMZvUdl5AYoSJLhtcFXcKq0xKb2JVW+9Kt/nW
 40nxpSiTNjlnu628E5vqDHUnVzVi2FlhiRA7A/UgYwqr0JkjOAbKo/HAh
 L7PUy5Ug/kiVmTUsEwMRnCTtwZ3o3ZFGl9B1epEZayHkeN8WVkgbGPWNV
 Hs+Qq0FCUH9CIjcYdFusk1EIWb1AM6kaw4vnCY75vQu1dk8G04XRd+EDc
 CVD3uhKU1l7zYyHA2pBZ4CgntYKKgwk/3ajgnA9/Af/fiqNXkwhGNTWY4 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="340956594"
X-IronPort-AV: E=Sophos;i="5.90,163,1643702400"; d="scan'208";a="340956594"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 14:27:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,163,1643702400"; d="scan'208";a="512857787"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by orsmga006.jf.intel.com with ESMTP; 07 Mar 2022 14:27:08 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nRLop-0000kX-Jg; Mon, 07 Mar 2022 22:27:07 +0000
Date: Tue, 08 Mar 2022 06:26:05 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS 782b30d101f6d0a4bfe76ae2359698cfd91b8fff
Message-ID: <6226867d.XsqWaHrZGgAPdIGj%lkp@intel.com>
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
branch HEAD: 782b30d101f6d0a4bfe76ae2359698cfd91b8fff  Automatic merge of 'next' into merge (2022-03-05 20:45)

elapsed time: 943m

configs tested: 102
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allmodconfig
arm                              allyesconfig
arm64                               defconfig
arm64                            allyesconfig
arm                        clps711x_defconfig
sh                               j2_defconfig
m68k                          amiga_defconfig
powerpc                       ppc64_defconfig
sh                          rsk7269_defconfig
arc                      axs103_smp_defconfig
arm                         lubbock_defconfig
arm                            hisi_defconfig
powerpc                 mpc837x_mds_defconfig
arm                        mvebu_v7_defconfig
mips                       capcella_defconfig
powerpc                mpc7448_hpc2_defconfig
sh                        sh7757lcr_defconfig
arm                           h3600_defconfig
arm                  randconfig-c002-20220307
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nds32                             allnoconfig
arc                              allyesconfig
nios2                               defconfig
alpha                            allyesconfig
alpha                               defconfig
nds32                               defconfig
csky                                defconfig
nios2                            allyesconfig
arc                                 defconfig
h8300                            allyesconfig
sh                               allmodconfig
xtensa                           allyesconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allmodconfig
s390                                defconfig
s390                             allyesconfig
sparc                            allyesconfig
i386                             allyesconfig
i386                              debian-10.3
i386                                defconfig
sparc                               defconfig
i386                   debian-10.3-kselftests
mips                             allmodconfig
mips                             allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
i386                 randconfig-a003-20220307
i386                 randconfig-a001-20220307
i386                 randconfig-a004-20220307
i386                 randconfig-a002-20220307
i386                 randconfig-a005-20220307
i386                 randconfig-a006-20220307
x86_64               randconfig-a003-20220307
x86_64               randconfig-a001-20220307
x86_64               randconfig-a002-20220307
x86_64               randconfig-a004-20220307
x86_64               randconfig-a005-20220307
x86_64               randconfig-a006-20220307
arc                  randconfig-r043-20220307
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                          rv32_defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                                  kexec

clang tested configs:
arm                        neponset_defconfig
powerpc                      obs600_defconfig
powerpc                      ppc64e_defconfig
arm                       netwinder_defconfig
arm                       mainstone_defconfig
mips                           ip27_defconfig
arm                       versatile_defconfig
powerpc                  mpc885_ads_defconfig
i386                 randconfig-a013-20220307
i386                 randconfig-a012-20220307
i386                 randconfig-a011-20220307
i386                 randconfig-a014-20220307
i386                 randconfig-a015-20220307
i386                 randconfig-a016-20220307
hexagon              randconfig-r045-20220307
riscv                randconfig-r042-20220307
hexagon              randconfig-r041-20220307
s390                 randconfig-r044-20220307

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
