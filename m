Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D47F75884BF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Aug 2022 01:35:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LyBDp65Vtz3c3T
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Aug 2022 09:35:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YRIlQiia;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YRIlQiia;
	dkim-atps=neutral
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LyBD90RqVz2xFx
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Aug 2022 09:34:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659483289; x=1691019289;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ScA6L2EqoU5B8GoTdno7aznAwsdg2zXfOItZxWKReqg=;
  b=YRIlQiia5nf+Y65F8pemKnPB+ZKO0a7ACLL/l1ZY7VXuNVJre2W+6dHP
   RGhwoU45T1aHvHls2JJMbRAabCpH5QXLYdwSgD6CZjOBWnECfDTRJAOhI
   C+H7AonN8Sciphhja3Gxgs/33vYlc8N+JpnAhTzIv4hG3TZNdl4nFt66Q
   QvQr514r9kCqKewZl5N7BPhfeDRcTQfMOJCtV5wGuJFsdbfNkljY20kF7
   p6FvGF+XvlWOrEBGgkZ9GIFgMonFOvZfbqVMVrzKUX4STh8VNab6ZdPul
   EjjtqgRrK33sOhXlBWkZ9EiThBFEPK7wkGmIMVHeUha0+5/lzlJ/pciMK
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10427"; a="288298108"
X-IronPort-AV: E=Sophos;i="5.93,212,1654585200"; 
   d="scan'208";a="288298108"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2022 16:34:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,212,1654585200"; 
   d="scan'208";a="692034965"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 02 Aug 2022 16:34:38 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oJ1PJ-000GYp-2s;
	Tue, 02 Aug 2022 23:34:37 +0000
Date: Wed, 03 Aug 2022 07:34:25 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS
 e538227647dc2a96ae640e25043e04cf5f735189
Message-ID: <62e9b481.lIw/9fP0NDF/bekJ%lkp@intel.com>
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
branch HEAD: e538227647dc2a96ae640e25043e04cf5f735189  Automatic merge of 'master' into merge (2022-08-01 11:37)

elapsed time: 716m

configs tested: 61
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
m68k                             allyesconfig
x86_64               randconfig-a011-20220801
x86_64               randconfig-a012-20220801
m68k                             allmodconfig
x86_64               randconfig-a013-20220801
arc                              allyesconfig
alpha                            allyesconfig
x86_64               randconfig-a014-20220801
x86_64               randconfig-a015-20220801
x86_64                              defconfig
x86_64               randconfig-a016-20220801
i386                             allyesconfig
i386                                defconfig
riscv                randconfig-r042-20220801
arc                  randconfig-r043-20220801
i386                 randconfig-a012-20220801
s390                 randconfig-r044-20220801
x86_64                               rhel-8.3
i386                 randconfig-a013-20220801
powerpc                           allnoconfig
arm                                 defconfig
i386                 randconfig-a011-20220801
x86_64                           allyesconfig
powerpc                          allmodconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
mips                             allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
i386                 randconfig-a016-20220801
i386                 randconfig-a015-20220801
i386                 randconfig-a014-20220801
sh                               allmodconfig
arm64                            allyesconfig
arm                              allyesconfig
ia64                             allmodconfig
arc                               allnoconfig
alpha                             allnoconfig
csky                              allnoconfig
riscv                             allnoconfig
arc                      axs103_smp_defconfig
powerpc                 mpc85xx_cds_defconfig

clang tested configs:
x86_64               randconfig-a002-20220801
x86_64               randconfig-a001-20220801
x86_64               randconfig-a003-20220801
x86_64               randconfig-a004-20220801
i386                 randconfig-a001-20220801
i386                 randconfig-a002-20220801
i386                 randconfig-a005-20220801
i386                 randconfig-a003-20220801
i386                 randconfig-a004-20220801
x86_64               randconfig-a005-20220801
x86_64               randconfig-a006-20220801
i386                 randconfig-a006-20220801
hexagon              randconfig-r045-20220801
hexagon              randconfig-r041-20220801
arm                   milbeaut_m10v_defconfig
powerpc                      obs600_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
