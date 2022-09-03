Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8205ABD6E
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Sep 2022 08:25:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MKPt45YR2z3bsy
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Sep 2022 16:25:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UIIzmOdg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Two or more type TXT spf records found.) smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mga11.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UIIzmOdg;
	dkim-atps=neutral
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MKPsP4DVZz2yYL
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Sep 2022 16:25:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662186313; x=1693722313;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=P6vXlIGnFY4NDwkvSeLarOQuSSEPOyYFDiLVvm3NOmM=;
  b=UIIzmOdgamIS/aGi/smtYxH9vQaNdvdXlpPxDb/uo7SU84/ZGf8rWgQf
   Q58xPIn8WrtjXvinPBS2W3FcBNqmf8Ph10bkRSOPMPvpFFOsEpn0cWKKw
   3gysKFS5bqcteW42Zo+kJWmEalbsRgaPnf7YsMcINlKkIqn1UpRlcKD7B
   +E+F7mbzQu9OhPJAjcmCMwRA1eW/bgAGtTNNMsbRiy3YvrgtGD80vKgfF
   gDG7y3BrjioSNCbh5Fr/JoDSEfOHLNNjFjrOCgDg+aHqu9FiXyR+39dIp
   wk3+ynoXFqlTLQu5C5Q5T5BGOULYzSDe7/T7h5brD8ajc6CQwotP7Oy+6
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10458"; a="293723281"
X-IronPort-AV: E=Sophos;i="5.93,286,1654585200"; 
   d="scan'208";a="293723281"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2022 23:24:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,286,1654585200"; 
   d="scan'208";a="564195225"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 02 Sep 2022 23:24:54 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oUMaL-0001Ac-0x;
	Sat, 03 Sep 2022 06:24:53 +0000
Date: Sat, 03 Sep 2022 14:24:34 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS
 8b4bb0ad00cb347f62e76a636ce08eb179c843fc
Message-ID: <6312f322.etqJB4cE31lbqPK6%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
branch HEAD: 8b4bb0ad00cb347f62e76a636ce08eb179c843fc  powerpc/code-patching: Speed up page mapping/unmapping

elapsed time: 1004m

configs tested: 57
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
arc                  randconfig-r043-20220901
i386                          randconfig-a001
i386                          randconfig-a003
x86_64                        randconfig-a013
m68k                             allyesconfig
x86_64                        randconfig-a011
powerpc                           allnoconfig
m68k                             allmodconfig
i386                          randconfig-a005
powerpc                          allmodconfig
x86_64                           rhel-8.3-kvm
alpha                            allyesconfig
sh                               allmodconfig
mips                             allyesconfig
x86_64                              defconfig
x86_64                    rhel-8.3-kselftests
arc                              allyesconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                        randconfig-a015
x86_64                               rhel-8.3
x86_64                           rhel-8.3-syz
x86_64                        randconfig-a004
i386                                defconfig
x86_64                        randconfig-a002
i386                          randconfig-a014
x86_64                        randconfig-a006
i386                          randconfig-a012
i386                          randconfig-a016
x86_64                           allyesconfig
i386                             allyesconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
ia64                             allmodconfig

clang tested configs:
hexagon              randconfig-r041-20220901
riscv                randconfig-r042-20220901
hexagon              randconfig-r045-20220901
s390                 randconfig-r044-20220901
i386                          randconfig-a002
x86_64                        randconfig-a012
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a014
i386                          randconfig-a013
x86_64                        randconfig-a016
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a011
i386                          randconfig-a015

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
