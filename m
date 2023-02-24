Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8066A1E58
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Feb 2023 16:17:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PNYRc5gyZz3f7T
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Feb 2023 02:17:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lw0/iE54;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lw0/iE54;
	dkim-atps=neutral
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PNYPg2Zm2z3bjX
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Feb 2023 02:16:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677251767; x=1708787767;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=c/aWJ/oiDSFoY0rbsLN32v/zMrh4u3kxF6aS/2m8LgQ=;
  b=lw0/iE54wosy5v9H2QUlWqM53BAy4INWn7XfnXA0PXsnn9BJ00HDeFkK
   eaqkiO2CXeSRKEOdebiQrePO+Acejf3sBrmywZXkk4ZBZ+68Qv+4H+YAf
   yatXfSCWLLRqj8OoxovJIu1lmImpLwXcgb/aBKN33Xd6Ts4fmMeyF0qYZ
   hr+lnakOsdcXuJykL2GhDVWjKJBq1SMdp2GqRv7k3V4X6MBLY3zgPpCn5
   Xu8BvzmUh6HaeZDHe+rBvkMptzuA7Wc2NLSWOFoMQ7tY5bD0Li+YR0a8s
   Dc+LO63aIh+F5bQD1QpGQ9eJgYEhTBCCm0ZmJI9yC8sl5UOIdiFiwi5Xl
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="313886940"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; 
   d="scan'208";a="313886940"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 07:15:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="815777010"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; 
   d="scan'208";a="815777010"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 24 Feb 2023 07:15:54 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVZne-0002Ug-0O;
	Fri, 24 Feb 2023 15:15:54 +0000
Date: Fri, 24 Feb 2023 23:15:40 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS
 ec0a1b360aec1ba0bdfad3dd69e300b028529c0d
Message-ID: <63f8d49c.fsYL2H/lyBX623Mh%lkp@intel.com>
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
branch HEAD: ec0a1b360aec1ba0bdfad3dd69e300b028529c0d  Automatic merge of 'master' into merge (2023-02-24 13:22)

elapsed time: 733m

configs tested: 24
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                               defconfig   gcc  
arc                                 defconfig   gcc  
arm                                 defconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
i386                                defconfig   gcc  
ia64                                defconfig   gcc  
loongarch                           defconfig   gcc  
m68k                         amcore_defconfig   gcc  
m68k                                defconfig   gcc  
mips                          malta_defconfig   clang
nios2                               defconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                      tqm8xx_defconfig   gcc  
riscv                               defconfig   gcc  
riscv                          rv32_defconfig   gcc  
s390                                defconfig   gcc  
sh                             espt_defconfig   gcc  
sh                          r7785rp_defconfig   gcc  
sparc                               defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                              defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
