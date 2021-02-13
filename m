Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BCE31ABE6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Feb 2021 14:37:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DdBHj5ZTQzDwqV
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Feb 2021 00:37:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DdBDk2WrczDwny
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Feb 2021 00:34:41 +1100 (AEDT)
IronPort-SDR: eV1TWfXGtoo3eyZzW0hSn9kxF4esVhHPMdtEvi2qc7yF1GJAPHQi75sLAz8HJ1wwyoNtElvIu6
 ONI3NeKrX24Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9893"; a="161668023"
X-IronPort-AV: E=Sophos;i="5.81,176,1610438400"; d="scan'208";a="161668023"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2021 05:34:38 -0800
IronPort-SDR: JktGSc5BTso5Hwf1e8KhiOT1Gnu6bXkg8HSWAY4i503oM4hcwGVd03r8cbBoHKVaM9iYozHWFe
 pYIEitN2noTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,176,1610438400"; d="scan'208";a="400160579"
Received: from lkp-server02.sh.intel.com (HELO cd560a204411) ([10.239.97.151])
 by orsmga007.jf.intel.com with ESMTP; 13 Feb 2021 05:34:36 -0800
Received: from kbuild by cd560a204411 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lAv4G-0005T0-2U; Sat, 13 Feb 2021 13:34:36 +0000
Date: Sat, 13 Feb 2021 21:33:35 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS 463d77b1993642f56ce6929be97c08ef065f48ba
Message-ID: <6027d52f.bJgvTQi4o1hgGlnF%lkp@intel.com>
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
branch HEAD: 463d77b1993642f56ce6929be97c08ef065f48ba  Automatic merge of 'next' into merge (2021-02-12 00:44)

elapsed time: 2807m

configs tested: 205
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
alpha                            alldefconfig
arc                     haps_hs_smp_defconfig
sh                               j2_defconfig
powerpc                      ppc64e_defconfig
arm                       netwinder_defconfig
arm                     davinci_all_defconfig
sh                        sh7763rdp_defconfig
c6x                        evmc6474_defconfig
arm                         shannon_defconfig
arc                        vdk_hs38_defconfig
sh                      rts7751r2d1_defconfig
m68k                            q40_defconfig
arm                            lart_defconfig
arm                            pleb_defconfig
arm                   milbeaut_m10v_defconfig
h8300                            alldefconfig
powerpc                         ps3_defconfig
h8300                     edosk2674_defconfig
arm                          moxart_defconfig
arm                             rpc_defconfig
mips                         mpc30x_defconfig
arm                  colibri_pxa300_defconfig
powerpc                    ge_imp3a_defconfig
m68k                          atari_defconfig
mips                      bmips_stb_defconfig
powerpc                     stx_gp3_defconfig
arm                           sunxi_defconfig
openrisc                         alldefconfig
sh                           se7712_defconfig
h8300                               defconfig
sh                            hp6xx_defconfig
arm                          simpad_defconfig
powerpc                 mpc8315_rdb_defconfig
mips                     cu1830-neo_defconfig
mips                         tb0219_defconfig
sh                          rsk7264_defconfig
arm                            u300_defconfig
arm                          pxa3xx_defconfig
sh                           se7206_defconfig
sh                         ap325rxa_defconfig
xtensa                  cadence_csp_defconfig
powerpc                       eiger_defconfig
mips                         rt305x_defconfig
xtensa                    xip_kc705_defconfig
powerpc                     tqm5200_defconfig
sh                     sh7710voipgw_defconfig
mips                      maltaaprp_defconfig
powerpc                 linkstation_defconfig
mips                           jazz_defconfig
powerpc                 mpc832x_mds_defconfig
mips                       capcella_defconfig
powerpc                      chrp32_defconfig
um                           x86_64_defconfig
powerpc                      obs600_defconfig
arm64                            alldefconfig
arm                         axm55xx_defconfig
x86_64                           alldefconfig
mips                        jmr3927_defconfig
mips                       bmips_be_defconfig
powerpc                 mpc834x_mds_defconfig
powerpc                   bluestone_defconfig
sh                          rsk7203_defconfig
nds32                               defconfig
powerpc                    gamecube_defconfig
mips                          ath79_defconfig
powerpc64                        alldefconfig
s390                          debug_defconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                       holly_defconfig
powerpc                     kmeter1_defconfig
powerpc                     mpc5200_defconfig
openrisc                  or1klitex_defconfig
arm                       cns3420vb_defconfig
arm                           h5000_defconfig
arm                        clps711x_defconfig
arc                        nsim_700_defconfig
powerpc                      pmac32_defconfig
openrisc                 simple_smp_defconfig
powerpc                        icon_defconfig
sh                                  defconfig
mips                      malta_kvm_defconfig
powerpc                     taishan_defconfig
arm                          pxa910_defconfig
arm                         lpc32xx_defconfig
arm                          badge4_defconfig
powerpc                    sam440ep_defconfig
powerpc                  mpc885_ads_defconfig
c6x                        evmc6457_defconfig
openrisc                            defconfig
arm                           omap1_defconfig
xtensa                         virt_defconfig
mips                         bigsur_defconfig
arm                        magician_defconfig
arm                         vf610m4_defconfig
sparc                       sparc32_defconfig
mips                            e55_defconfig
parisc                              defconfig
parisc                generic-32bit_defconfig
powerpc                      pcm030_defconfig
mips                    maltaup_xpa_defconfig
arm                         palmz72_defconfig
powerpc                     tqm8548_defconfig
microblaze                          defconfig
powerpc                      ep88xc_defconfig
sh                          kfr2r09_defconfig
mips                           ip32_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
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
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20210209
x86_64               randconfig-a001-20210209
x86_64               randconfig-a005-20210209
x86_64               randconfig-a004-20210209
x86_64               randconfig-a002-20210209
x86_64               randconfig-a003-20210209
x86_64               randconfig-a003-20210212
x86_64               randconfig-a002-20210212
x86_64               randconfig-a004-20210212
x86_64               randconfig-a001-20210212
x86_64               randconfig-a005-20210212
x86_64               randconfig-a006-20210212
i386                 randconfig-a001-20210209
i386                 randconfig-a005-20210209
i386                 randconfig-a003-20210209
i386                 randconfig-a002-20210209
i386                 randconfig-a006-20210209
i386                 randconfig-a004-20210209
i386                 randconfig-a003-20210212
i386                 randconfig-a005-20210212
i386                 randconfig-a002-20210212
i386                 randconfig-a001-20210212
i386                 randconfig-a004-20210212
i386                 randconfig-a006-20210212
x86_64               randconfig-a016-20210211
x86_64               randconfig-a013-20210211
x86_64               randconfig-a012-20210211
x86_64               randconfig-a015-20210211
x86_64               randconfig-a014-20210211
x86_64               randconfig-a011-20210211
i386                 randconfig-a016-20210209
i386                 randconfig-a013-20210209
i386                 randconfig-a012-20210209
i386                 randconfig-a014-20210209
i386                 randconfig-a011-20210209
i386                 randconfig-a015-20210209
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a003-20210211
x86_64               randconfig-a002-20210211
x86_64               randconfig-a001-20210211
x86_64               randconfig-a004-20210211
x86_64               randconfig-a005-20210211
x86_64               randconfig-a006-20210211
x86_64               randconfig-a013-20210209
x86_64               randconfig-a014-20210209
x86_64               randconfig-a015-20210209
x86_64               randconfig-a012-20210209
x86_64               randconfig-a016-20210209
x86_64               randconfig-a011-20210209

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
