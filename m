Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3F81D6559
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 May 2020 04:30:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49PmMc5pJLzDqcG
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 May 2020 12:30:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49PmLB0jDhzDqZV
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 May 2020 12:29:00 +1000 (AEST)
IronPort-SDR: p4Tn6bPhjXPgxNJ8tEmWOT0l10b54EbesE1Eqb2Ar8l9AjHRJm4jlhdsW8/cnaccwdxOzFhS0T
 +/t7RJsteFCA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2020 19:28:57 -0700
IronPort-SDR: cFhP3cI1F8wrJd/GQGZ+E89G7bBqzaIjS2UNo2Z48YuVnTMNRDhbI+497rHNoyayKHLyYYjSmN
 f9rutis5Donw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,401,1583222400"; d="scan'208";a="410885221"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 16 May 2020 19:28:55 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1ja92t-000Aqd-1p; Sun, 17 May 2020 10:28:55 +0800
Date: Sun, 17 May 2020 10:27:59 +0800
From: kbuild test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 7b92ee1db93df64553a36f23fec86298d37ee10a
Message-ID: <5ec0a12f.VKyT0tERLqg8fhQ9%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git  next-test
branch HEAD: 7b92ee1db93df64553a36f23fec86298d37ee10a  powerpc/watchpoint/xmon: Support 2nd DAWR

i386-tinyconfig vmlinux size:

+-------+------------------------------------+-----------------------------------------------------------------------+
| DELTA |               SYMBOL               |                                COMMIT                                 |
+-------+------------------------------------+-----------------------------------------------------------------------+
|  +118 | TOTAL                              | ae83d0b416db..7b92ee1db93d (ALL COMMITS)                              |
|  +114 | TEXT                               | ae83d0b416db..7b92ee1db93d (ALL COMMITS)                              |
| +1355 | balance_dirty_pages()              | ae83d0b416db..7b92ee1db93d (ALL COMMITS)                              |
|  +615 | __setup_rt_frame()                 | ae83d0b416db..7b92ee1db93d (ALL COMMITS)                              |
|  +136 | arch/x86/events/zhaoxin/built-in.* | ae83d0b416db..7b92ee1db93d (ALL COMMITS)                              |
|  +136 | arch/x86/events/zhaoxin/built-in.* | 722c1963aba5 selftests/powerpc: Add README for GZIP engine tests      |
|  -136 | arch/x86/events/zhaoxin/built-in.* | 45591da76588 powerpc/vas: Include linux/types.h in uapi/asm/vas-api.h |
|  +113 | klist_release()                    | ae83d0b416db..7b92ee1db93d (ALL COMMITS)                              |
|   +93 | change_clocksource()               | ae83d0b416db..7b92ee1db93d (ALL COMMITS)                              |
|   +86 | release_bdi()                      | ae83d0b416db..7b92ee1db93d (ALL COMMITS)                              |
|   +84 | kobject_release()                  | ae83d0b416db..7b92ee1db93d (ALL COMMITS)                              |
|   -68 | bdi_put()                          | ae83d0b416db..7b92ee1db93d (ALL COMMITS)                              |
|   -77 | kobject_put()                      | ae83d0b416db..7b92ee1db93d (ALL COMMITS)                              |
|   -79 | timekeeping_notify()               | ae83d0b416db..7b92ee1db93d (ALL COMMITS)                              |
|   -99 | klist_dec_and_del()                | ae83d0b416db..7b92ee1db93d (ALL COMMITS)                              |
|  -555 | do_signal()                        | ae83d0b416db..7b92ee1db93d (ALL COMMITS)                              |
| -1383 | balance_dirty_pages_ratelimited()  | ae83d0b416db..7b92ee1db93d (ALL COMMITS)                              |
+-------+------------------------------------+-----------------------------------------------------------------------+

elapsed time: 695m

configs tested: 67
configs skipped: 77

The following configs have been built successfully.
More configs may be tested in the coming days.

sparc                            allyesconfig
mips                             allyesconfig
m68k                             allyesconfig
arm                         em_x270_defconfig
powerpc                     pq2fads_defconfig
mips                     cu1000-neo_defconfig
powerpc                      ppc40x_defconfig
sh                             shx3_defconfig
m68k                          hp300_defconfig
ia64                             allmodconfig
powerpc                     powernv_defconfig
arm                       aspeed_g5_defconfig
sh                            titan_defconfig
microblaze                      mmu_defconfig
arm                      jornada720_defconfig
arm                        spear3xx_defconfig
i386                              allnoconfig
xtensa                           allyesconfig
h8300                            allyesconfig
h8300                            allmodconfig
xtensa                              defconfig
nios2                               defconfig
nios2                            allyesconfig
openrisc                            defconfig
c6x                              allyesconfig
c6x                               allnoconfig
openrisc                         allyesconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a006-20200517
i386                 randconfig-a005-20200517
i386                 randconfig-a003-20200517
i386                 randconfig-a001-20200517
i386                 randconfig-a004-20200517
i386                 randconfig-a002-20200517
x86_64               randconfig-a005-20200517
x86_64               randconfig-a003-20200517
x86_64               randconfig-a006-20200517
x86_64               randconfig-a004-20200517
x86_64               randconfig-a001-20200517
x86_64               randconfig-a002-20200517
i386                 randconfig-a012-20200517
i386                 randconfig-a016-20200517
i386                 randconfig-a014-20200517
i386                 randconfig-a011-20200517
i386                 randconfig-a013-20200517
i386                 randconfig-a015-20200517
i386                 randconfig-a012-20200515
i386                 randconfig-a016-20200515
i386                 randconfig-a014-20200515
i386                 randconfig-a013-20200515
x86_64                              defconfig
i386                             allyesconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                                   rhel
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
