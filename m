Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B6B35943E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 07:01:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGmF80FzVz3bwH
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 15:01:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGmDn26Ghz2yxH
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Apr 2021 15:01:11 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FGmDg44hFz9ttFR;
 Fri,  9 Apr 2021 07:01:07 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Ul5QcTE0vVYg; Fri,  9 Apr 2021 07:01:07 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FGmDg1J1Wz9ttF9;
 Fri,  9 Apr 2021 07:01:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F10F88B7D6;
 Fri,  9 Apr 2021 07:01:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 6uJIEUloPKIP; Fri,  9 Apr 2021 07:01:07 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6E34C8B76D;
 Fri,  9 Apr 2021 07:01:07 +0200 (CEST)
Subject: Re: [powerpc:next-test] BUILD REGRESSION
 3ac6488df9160f52bbd8b8ec3387a53ac3d0f2eb
To: kernel test robot <lkp@intel.com>, Michael Ellerman <mpe@ellerman.id.au>
References: <606fbbcd.YCqB+tR1NRgrmWMp%lkp@intel.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <fe21d1e9-2428-fe49-246f-50dd3b7d22cc@csgroup.eu>
Date: Fri, 9 Apr 2021 07:01:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <606fbbcd.YCqB+tR1NRgrmWMp%lkp@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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



Le 09/04/2021 à 04:28, kernel test robot a écrit :
> tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
> branch HEAD: 3ac6488df9160f52bbd8b8ec3387a53ac3d0f2eb  powerpc/xive: Modernize XIVE-IPI domain with an 'alloc' handler
> 
> Error/Warning reports:
> 
> https://lore.kernel.org/linuxppc-dev/202104090230.ACwnO03u-lkp@intel.com
> https://lore.kernel.org/linuxppc-dev/202104090827.jH0WBiCC-lkp@intel.com
> 
> Error/Warning in current branch:
> 
> include/linux/compiler_types.h:320:38: error: call to '__compiletime_assert_171' declared with attribute error: BUILD_BUG_ON failed: TASK_SIZE > MODULES_VADDR

As I pointed in the report, this is because the rand config has set TASK_SIZE to 0xc0000000 without 
changing PAGE_OFFSET. Therefore there is no space inbetween for the 256Mbytes segment for modules.
It is too complex to guard this inside the Kconfig, that's the reason why we have a BUILD_BUG_ON().

There was already a similar kind of build test to make sure TASK_SIZE is not greater than KERNEL_START.

> 
> Error/Warning ids grouped by kconfigs:
> 
> gcc_recent_errors
> |-- powerpc-randconfig-s031-20210408
> |   |-- drivers-w1-slaves-w1_ds28e04.c:sparse:sparse:incorrect-type-in-initializer-(different-address-spaces)-expected-char-const-noderef-__user-_gu_addr-got-char-const-buf
> |   `-- drivers-w1-slaves-w1_ds28e04.c:sparse:sparse:incorrect-type-in-initializer-(different-address-spaces)-expected-char-noderef-__user-_pu_addr-got-char-buf
> `-- powerpc64-randconfig-c004-20210408
>      `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:BUILD_BUG_ON-failed:TASK_SIZE-MODULES_VADDR
> 
> elapsed time: 727m
> 
> configs tested: 166
> configs skipped: 2
> 
> gcc tested configs:
> arm                                 defconfig
> arm64                            allyesconfig
> arm64                               defconfig
> arm                              allyesconfig
> arm                              allmodconfig
> x86_64                           allyesconfig
> riscv                            allmodconfig
> riscv                            allyesconfig
> i386                             allyesconfig
> mips                         rt305x_defconfig
> um                                allnoconfig
> sh                          urquell_defconfig
> sh                            titan_defconfig
> arm                             ezx_defconfig
> arm                        oxnas_v6_defconfig
> powerpc                     akebono_defconfig
> arm                     eseries_pxa_defconfig
> arm                            pleb_defconfig
> m68k                         amcore_defconfig
> sparc                       sparc32_defconfig
> powerpc                     ppa8548_defconfig
> x86_64                           alldefconfig
> mips                    maltaup_xpa_defconfig
> xtensa                  cadence_csp_defconfig
> powerpc                           allnoconfig
> powerpc                      mgcoge_defconfig
> powerpc                 linkstation_defconfig
> sh                            migor_defconfig
> mips                       lemote2f_defconfig
> m68k                        m5407c3_defconfig
> arm                            lart_defconfig
> arm                           spitz_defconfig
> arm                         palmz72_defconfig
> arm                         lpc32xx_defconfig
> ia64                             alldefconfig
> powerpc                 mpc832x_mds_defconfig
> powerpc                      ppc6xx_defconfig
> sh                   sh7770_generic_defconfig
> sh                           sh2007_defconfig
> mips                           ip28_defconfig
> sh                          r7780mp_defconfig
> m68k                        mvme16x_defconfig
> arm                        multi_v5_defconfig
> powerpc                     kmeter1_defconfig
> arc                     nsimosci_hs_defconfig
> arm                        clps711x_defconfig
> xtensa                    xip_kc705_defconfig
> m68k                       bvme6000_defconfig
> h8300                            alldefconfig
> riscv                    nommu_k210_defconfig
> mips                     loongson1b_defconfig
> mips                  decstation_64_defconfig
> powerpc                      ppc64e_defconfig
> mips                          rb532_defconfig
> powerpc                 mpc834x_mds_defconfig
> sh                          landisk_defconfig
> powerpc                      arches_defconfig
> m68k                          hp300_defconfig
> s390                          debug_defconfig
> sh                 kfr2r09-romimage_defconfig
> arm                             mxs_defconfig
> mips                          malta_defconfig
> arm                           u8500_defconfig
> sh                           se7206_defconfig
> nios2                            alldefconfig
> arc                        vdk_hs38_defconfig
> sh                          sdk7786_defconfig
> powerpc                     mpc83xx_defconfig
> arm                          pxa3xx_defconfig
> um                           x86_64_defconfig
> arm                            zeus_defconfig
> arm                      footbridge_defconfig
> powerpc                        warp_defconfig
> mips                           ip22_defconfig
> m68k                          multi_defconfig
> sh                          lboxre2_defconfig
> powerpc                     mpc5200_defconfig
> powerpc                      ep88xc_defconfig
> m68k                          amiga_defconfig
> arm                  colibri_pxa270_defconfig
> arm                            xcep_defconfig
> ia64                            zx1_defconfig
> sh                  sh7785lcr_32bit_defconfig
> arm                            dove_defconfig
> powerpc                 mpc85xx_cds_defconfig
> arm                         shannon_defconfig
> powerpc                 xes_mpc85xx_defconfig
> arm                         at91_dt_defconfig
> sh                   sh7724_generic_defconfig
> arc                    vdk_hs38_smp_defconfig
> mips                           ip32_defconfig
> powerpc                 mpc8272_ads_defconfig
> openrisc                            defconfig
> riscv             nommu_k210_sdcard_defconfig
> mips                          ath25_defconfig
> mips                          ath79_defconfig
> powerpc                         ps3_defconfig
> arm                          gemini_defconfig
> arm                        realview_defconfig
> arm                          iop32x_defconfig
> ia64                             allmodconfig
> ia64                                defconfig
> ia64                             allyesconfig
> m68k                             allmodconfig
> m68k                                defconfig
> m68k                             allyesconfig
> nios2                               defconfig
> arc                              allyesconfig
> nds32                             allnoconfig
> nds32                               defconfig
> nios2                            allyesconfig
> csky                                defconfig
> alpha                               defconfig
> alpha                            allyesconfig
> xtensa                           allyesconfig
> h8300                            allyesconfig
> arc                                 defconfig
> sh                               allmodconfig
> parisc                              defconfig
> s390                             allyesconfig
> s390                             allmodconfig
> parisc                           allyesconfig
> s390                                defconfig
> sparc                            allyesconfig
> sparc                               defconfig
> i386                                defconfig
> mips                             allyesconfig
> mips                             allmodconfig
> powerpc                          allyesconfig
> powerpc                          allmodconfig
> x86_64               randconfig-a004-20210408
> x86_64               randconfig-a005-20210408
> x86_64               randconfig-a003-20210408
> x86_64               randconfig-a001-20210408
> x86_64               randconfig-a002-20210408
> x86_64               randconfig-a006-20210408
> i386                 randconfig-a006-20210408
> i386                 randconfig-a003-20210408
> i386                 randconfig-a001-20210408
> i386                 randconfig-a004-20210408
> i386                 randconfig-a005-20210408
> i386                 randconfig-a002-20210408
> i386                 randconfig-a014-20210408
> i386                 randconfig-a016-20210408
> i386                 randconfig-a011-20210408
> i386                 randconfig-a012-20210408
> i386                 randconfig-a013-20210408
> i386                 randconfig-a015-20210408
> riscv                    nommu_virt_defconfig
> riscv                             allnoconfig
> riscv                               defconfig
> riscv                          rv32_defconfig
> um                               allmodconfig
> um                               allyesconfig
> um                                  defconfig
> x86_64                    rhel-8.3-kselftests
> x86_64                              defconfig
> x86_64                               rhel-8.3
> x86_64                      rhel-8.3-kbuiltin
> x86_64                                  kexec
> 
> clang tested configs:
> x86_64               randconfig-a014-20210408
> x86_64               randconfig-a015-20210408
> x86_64               randconfig-a012-20210408
> x86_64               randconfig-a011-20210408
> x86_64               randconfig-a013-20210408
> x86_64               randconfig-a016-20210408
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> 
