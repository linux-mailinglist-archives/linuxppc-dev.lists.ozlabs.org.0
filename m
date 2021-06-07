Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD7539D25E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jun 2021 02:20:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FyvCj5hCCz30G7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jun 2021 10:20:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FyvBr2Z4Yz2yXM
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Jun 2021 10:19:47 +1000 (AEST)
IronPort-SDR: 8LS9cJSdohy7/BU+25hadMhIbZmAaNdbZNoFImjUaZsg+CY2jMHyGeBg5BUDUAtWSCra0ukigc
 n8Qp46i0tQrw==
X-IronPort-AV: E=McAfee;i="6200,9189,10007"; a="204356221"
X-IronPort-AV: E=Sophos;i="5.83,254,1616482800"; d="scan'208";a="204356221"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2021 17:19:40 -0700
IronPort-SDR: BM0X2lfJDeD3nu2vMJ14QAXBuJkzqY0IC5gN2W2kADVRE7mDQcs6ophQmqm07pXAEmm8A8+tbF
 /j7F36jC6/ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,254,1616482800"; d="scan'208";a="634546476"
Received: from lkp-server02.sh.intel.com (HELO 1ec8406c5392) ([10.239.97.151])
 by fmsmga006.fm.intel.com with ESMTP; 06 Jun 2021 17:19:38 -0700
Received: from kbuild by 1ec8406c5392 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lq2zR-00087N-G1; Mon, 07 Jun 2021 00:19:37 +0000
Date: Mon, 07 Jun 2021 08:19:25 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD REGRESSION
 88d03cc0a992227ea2aa51bf78404670a2f6f2a6
Message-ID: <60bd660d.ol55PT/+qiRbWFsR%lkp@intel.com>
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
branch HEAD: 88d03cc0a992227ea2aa51bf78404670a2f6f2a6  selftests/powerpc: Remove the repeated declaration

Error/Warning in current branch:

ERROR: modpost: "disable_kuap_key" [drivers/fsi/fsi-scom.ko] undefined!
ERROR: modpost: "disable_kuap_key" [drivers/input/evdev.ko] undefined!
ERROR: modpost: "disable_kuap_key" [drivers/input/joydev.ko] undefined!
ERROR: modpost: "disable_kuap_key" [drivers/input/mousedev.ko] undefined!
ERROR: modpost: "disable_kuap_key" [drivers/input/serio/serio_raw.ko] undefined!
ERROR: modpost: "disable_kuap_key" [drivers/tee/tee.ko] undefined!
ERROR: modpost: "disable_kuap_key" [drivers/watchdog/mv64x60_wdt.ko] undefined!
ERROR: modpost: "disable_kuap_key" [net/decnet/decnet.ko] undefined!
ERROR: modpost: "disable_kuap_key" [net/phonet/phonet.ko] undefined!
ERROR: modpost: "disable_kuap_key" [net/phonet/pn_pep.ko] undefined!
arch/powerpc/kernel/rtasd.c:366:30: error: unused variable 'rtas_log_proc_ops' [-Werror,-Wunused-const-variable]
arch/powerpc/kernel/time.c:169:29: error: unused function 'read_spurr' [-Werror,-Wunused-function]
arch/powerpc/platforms/4xx/pci.c:47:19: error: unused function 'ppc440spe_revA' [-Werror,-Wunused-function]
arch/powerpc/sysdev/fsl_msi.c:574:37: error: unused variable 'vmpic_msi_feature' [-Werror,-Wunused-const-variable]
arch/powerpc/sysdev/grackle.c:26:20: error: unused function 'grackle_set_stg' [-Werror,-Wunused-function]

possible Error/Warning in current branch:

arch/powerpc/platforms/pseries/hotplug-memory.c:605:19: error: unused function 'pseries_remove_memblock' [-Werror,-Wunused-function]
arch/powerpc/platforms/pseries/vas.c:266:13: error: no previous prototype for function 'pseries_vas_fault_thread_fn' [-Werror,-Wmissing-prototypes]

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
`-- powerpc64-randconfig-r003-20210606
    |-- ERROR:disable_kuap_key-drivers-fsi-fsi-scom.ko-undefined
    |-- ERROR:disable_kuap_key-drivers-input-evdev.ko-undefined
    |-- ERROR:disable_kuap_key-drivers-input-joydev.ko-undefined
    |-- ERROR:disable_kuap_key-drivers-input-mousedev.ko-undefined
    |-- ERROR:disable_kuap_key-drivers-input-serio-serio_raw.ko-undefined
    |-- ERROR:disable_kuap_key-drivers-tee-tee.ko-undefined
    |-- ERROR:disable_kuap_key-drivers-watchdog-mv64x60_wdt.ko-undefined
    |-- ERROR:disable_kuap_key-net-decnet-decnet.ko-undefined
    |-- ERROR:disable_kuap_key-net-phonet-phonet.ko-undefined
    `-- ERROR:disable_kuap_key-net-phonet-pn_pep.ko-undefined

clang_recent_errors
|-- powerpc-randconfig-r011-20210606
|   `-- arch-powerpc-platforms-4xx-pci.c:error:unused-function-ppc440spe_revA-Werror-Wunused-function
|-- powerpc64-randconfig-r011-20210606
|   |-- arch-powerpc-platforms-pseries-hotplug-memory.c:error:unused-function-pseries_remove_memblock-Werror-Wunused-function
|   `-- arch-powerpc-platforms-pseries-vas.c:error:no-previous-prototype-for-function-pseries_vas_fault_thread_fn-Werror-Wmissing-prototypes
`-- powerpc64-randconfig-r016-20210606
    |-- arch-powerpc-kernel-rtasd.c:error:unused-variable-rtas_log_proc_ops-Werror-Wunused-const-variable
    |-- arch-powerpc-kernel-time.c:error:unused-function-read_spurr-Werror-Wunused-function
    |-- arch-powerpc-sysdev-fsl_msi.c:error:unused-variable-vmpic_msi_feature-Werror-Wunused-const-variable
    `-- arch-powerpc-sysdev-grackle.c:error:unused-function-grackle_set_stg-Werror-Wunused-function

elapsed time: 728m

configs tested: 198
configs skipped: 2

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
nds32                            alldefconfig
powerpc                      pcm030_defconfig
sh                           se7343_defconfig
arm                            mps2_defconfig
arm                           sunxi_defconfig
powerpc                  storcenter_defconfig
powerpc                     sequoia_defconfig
sh                             shx3_defconfig
powerpc                     kmeter1_defconfig
microblaze                          defconfig
openrisc                 simple_smp_defconfig
powerpc                       maple_defconfig
powerpc                      bamboo_defconfig
powerpc                      ppc64e_defconfig
arm                         mv78xx0_defconfig
xtensa                          iss_defconfig
m68k                                defconfig
sh                          r7785rp_defconfig
arm                          badge4_defconfig
arm                        multi_v5_defconfig
m68k                        m5272c3_defconfig
powerpc                     kilauea_defconfig
powerpc                      chrp32_defconfig
nds32                             allnoconfig
mips                      fuloong2e_defconfig
xtensa                    smp_lx200_defconfig
arm                       netwinder_defconfig
ia64                             allyesconfig
sh                            shmin_defconfig
h8300                    h8300h-sim_defconfig
arc                          axs101_defconfig
powerpc                   bluestone_defconfig
parisc                generic-64bit_defconfig
m68k                        mvme147_defconfig
mips                            e55_defconfig
xtensa                  cadence_csp_defconfig
mips                      pic32mzda_defconfig
sh                ecovec24-romimage_defconfig
powerpc                     stx_gp3_defconfig
m68k                          multi_defconfig
mips                             allmodconfig
arm                    vt8500_v6_v7_defconfig
powerpc                     ep8248e_defconfig
arm                            xcep_defconfig
arm                         s3c2410_defconfig
arm                          pxa910_defconfig
powerpc                    ge_imp3a_defconfig
arm                           corgi_defconfig
powerpc                      cm5200_defconfig
arc                            hsdk_defconfig
mips                  cavium_octeon_defconfig
powerpc                      pasemi_defconfig
arm                       cns3420vb_defconfig
sh                        apsh4ad0a_defconfig
arm                          iop32x_defconfig
arm                       aspeed_g4_defconfig
mips                  maltasmvp_eva_defconfig
s390                             allyesconfig
arc                        nsim_700_defconfig
powerpc                  mpc885_ads_defconfig
powerpc                     tqm8541_defconfig
mips                     decstation_defconfig
sh                          polaris_defconfig
sh                          kfr2r09_defconfig
powerpc                      pmac32_defconfig
arm                        spear3xx_defconfig
sh                          lboxre2_defconfig
mips                        jmr3927_defconfig
arm                        keystone_defconfig
arm                           tegra_defconfig
arm                        oxnas_v6_defconfig
arm                          collie_defconfig
powerpc                     pq2fads_defconfig
sh                             sh03_defconfig
riscv             nommu_k210_sdcard_defconfig
arc                          axs103_defconfig
powerpc                     mpc5200_defconfig
arm                         hackkit_defconfig
arm                         at91_dt_defconfig
mips                           ip32_defconfig
powerpc                 xes_mpc85xx_defconfig
mips                        omega2p_defconfig
arm                             rpc_defconfig
mips                          malta_defconfig
powerpc                      ppc44x_defconfig
powerpc                      tqm8xx_defconfig
riscv                    nommu_k210_defconfig
powerpc                     taishan_defconfig
sh                        sh7757lcr_defconfig
arm                        multi_v7_defconfig
sh                          rsk7264_defconfig
sh                          r7780mp_defconfig
sh                          sdk7786_defconfig
mips                        maltaup_defconfig
powerpc                     sbc8548_defconfig
powerpc                      ppc40x_defconfig
m68k                             alldefconfig
mips                         tb0219_defconfig
arm                       imx_v6_v7_defconfig
powerpc                     pseries_defconfig
m68k                          sun3x_defconfig
powerpc                 mpc8315_rdb_defconfig
openrisc                            defconfig
powerpc                        cell_defconfig
arm                          simpad_defconfig
powerpc                      makalu_defconfig
sh                        edosk7760_defconfig
m68k                       m5249evb_defconfig
mips                           xway_defconfig
arm                          pxa168_defconfig
parisc                           allyesconfig
mips                           ip22_defconfig
powerpc                     tqm5200_defconfig
arm                           stm32_defconfig
powerpc                mpc7448_hpc2_defconfig
arm                       imx_v4_v5_defconfig
powerpc                 mpc832x_mds_defconfig
mips                            gpr_defconfig
sh                        edosk7705_defconfig
arm                         nhk8815_defconfig
sh                           se7751_defconfig
csky                             alldefconfig
x86_64                            allnoconfig
arm                        neponset_defconfig
powerpc                          allyesconfig
m68k                        mvme16x_defconfig
xtensa                              defconfig
ia64                             allmodconfig
ia64                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
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
s390                             allmodconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a002-20210606
x86_64               randconfig-a004-20210606
x86_64               randconfig-a003-20210606
x86_64               randconfig-a006-20210606
x86_64               randconfig-a005-20210606
x86_64               randconfig-a001-20210606
i386                 randconfig-a003-20210606
i386                 randconfig-a006-20210606
i386                 randconfig-a004-20210606
i386                 randconfig-a001-20210606
i386                 randconfig-a005-20210606
i386                 randconfig-a002-20210606
i386                 randconfig-a015-20210606
i386                 randconfig-a013-20210606
i386                 randconfig-a016-20210606
i386                 randconfig-a011-20210606
i386                 randconfig-a014-20210606
i386                 randconfig-a012-20210606
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
x86_64               randconfig-b001-20210606
x86_64               randconfig-b001-20210607
x86_64               randconfig-a015-20210606
x86_64               randconfig-a011-20210606
x86_64               randconfig-a014-20210606
x86_64               randconfig-a012-20210606
x86_64               randconfig-a016-20210606
x86_64               randconfig-a013-20210606

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
