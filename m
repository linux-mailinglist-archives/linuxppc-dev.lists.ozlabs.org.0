Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E64B693BB2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Feb 2023 02:20:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PFRP36HQDz3c6H
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Feb 2023 12:20:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dRGto4o1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dRGto4o1;
	dkim-atps=neutral
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PFRN83dZJz309V
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Feb 2023 12:20:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676251208; x=1707787208;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=YnWjXZlHivWHMWnCFt0M8oPRBq374t1lHLogRj2qHGo=;
  b=dRGto4o1VMnhwBFkU3TBzLHWFWCWNX04C0pHkhKtnCgnA6i+vjVC2EJo
   sK7+hBpAZXncRLMQxvjNYiOCNCRe9VQQM3myxW1MogMSG3BuRJh0zA8b+
   W6G2z7Ev4UjmUTSa4FxcrlnKkeAD7vmznlN01kw/HCC1Btj8Qm8B8DvZq
   XtfeQuKfi1Y00Jk4rU1kFL4FoTzXNxoI0I7Y0US0+vetlsDrxARcgrUXi
   8RpERMHgLIF9rTsrd8wZNLDTPX/CHsPwud2YhMo+7fWV/qADg+zUnD7lw
   EQMxyBoMlo+YNRDwCrSZYrcQvui+hmogDvaC3q4fMAyKPOBsEZxTGUCIM
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="358192514"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="358192514"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2023 17:20:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="732315354"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="732315354"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 12 Feb 2023 17:20:00 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRNVf-0007Tl-26;
	Mon, 13 Feb 2023 01:19:59 +0000
Date: Mon, 13 Feb 2023 09:19:58 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS
 99dcb8a071130d5a5d33d255416debf7f5a92a06
Message-ID: <63e9903e.EnADwFKMA4uvCfoC%lkp@intel.com>
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
branch HEAD: 99dcb8a071130d5a5d33d255416debf7f5a92a06  integrity/powerpc: Support loading keys from PLPKS

elapsed time: 809m

configs tested: 42
configs skipped: 37

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
alpha                            allyesconfig
arc                  randconfig-r043-20230212
arm                         at91_dt_defconfig
arm                  randconfig-r046-20230212
arm                           sama5_defconfig
csky                                defconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
m68k                             allmodconfig
mips                             allmodconfig
mips                            ar7_defconfig
mips                      fuloong2e_defconfig
mips                           jazz_defconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
s390                             allmodconfig
s390                             allyesconfig
s390                                defconfig
sparc                               defconfig
x86_64                            allnoconfig
x86_64                                  kexec
x86_64                        randconfig-a002
x86_64                        randconfig-a004
x86_64                        randconfig-a006
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015

clang tested configs:
hexagon              randconfig-r041-20230212
hexagon              randconfig-r045-20230212
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
i386                          randconfig-a013
riscv                randconfig-r042-20230212
s390                 randconfig-r044-20230212
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
