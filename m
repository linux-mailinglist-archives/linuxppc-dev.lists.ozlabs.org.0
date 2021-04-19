Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC9F3639D0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 05:46:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FNt5f20Trz3c3Z
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 13:46:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FNt5J69jnz2yx9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 13:45:56 +1000 (AEST)
IronPort-SDR: xmMsYrbw1JEsKsm3iJI0F7aeXYT1c7GFRyq2B1dZv5vC9UkhWmWTiEBu8dSPDG9GavWKEyty7l
 JRgzAFOCpgoA==
X-IronPort-AV: E=McAfee;i="6200,9189,9958"; a="174752201"
X-IronPort-AV: E=Sophos;i="5.82,233,1613462400"; d="scan'208";a="174752201"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2021 20:45:55 -0700
IronPort-SDR: dCKQmarO/gX0GFVcfZKeZEtyzLqCBbvCrvo1hrTAdXOQuJG6hYsRJ2droP5ME8UlAki+aCloTZ
 p4BaIOpoMCXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,233,1613462400"; d="scan'208";a="426349465"
Received: from lkp-server01.sh.intel.com (HELO a48ff7ddd223) ([10.239.97.150])
 by orsmga008.jf.intel.com with ESMTP; 18 Apr 2021 20:45:53 -0700
Received: from kbuild by a48ff7ddd223 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lYKrA-0001Wb-Pf; Mon, 19 Apr 2021 03:45:52 +0000
Date: Mon, 19 Apr 2021 11:44:53 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:topic/ppc-kvm] BUILD SUCCESS
 732f21a3053cf279eb6b85d19b7818a8f1dd2071
Message-ID: <607cfcb5.JPvLq/0p2aWK5Tbj%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git topic/ppc-kvm
branch HEAD: 732f21a3053cf279eb6b85d19b7818a8f1dd2071  KVM: PPC: Book3S HV: Ensure MSR[HV] is always clear in guest MSR

elapsed time: 727m

configs tested: 15
configs skipped: 95

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
mips                     loongson1c_defconfig
m68k                       m5275evb_defconfig
arc                     nsimosci_hs_defconfig
powerpc                 mpc837x_rdb_defconfig
powerpc                   motionpro_defconfig
powerpc                      katmai_defconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
