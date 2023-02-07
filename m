Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A60F68CB41
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Feb 2023 01:35:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P9kgK09s4z30Bp
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Feb 2023 11:35:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DmCZJZwK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mga11.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DmCZJZwK;
	dkim-atps=neutral
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P9kfN0rQxz2ym7
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Feb 2023 11:34:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675730076; x=1707266076;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=jRGf0qL1I13mcRgtSwikUDOcrtFxl3XprL/tlKbcqVI=;
  b=DmCZJZwKUZeJH59RrJg7AqXWztKLjLh0x8pwve0CKusR/Eje6a+js86H
   ztnibd8DKcIRoyo/8ffv1zYBhwzTKwk5v9Eh+/K9iY7jALVu9YO+zVU/D
   2/HsJUUmfDazGqgjw1rxBPjmT7tiyqchShPv/6RfGtcJd6w3W6IGSkJXk
   LHbomNGpDuNW2vKCCwkhClwrRWpgmy9HdApmTvHnsNowsEJU/097IfJ8u
   zs20jedAfa9MaJ8n6Hy+y6rOgh5Tbxu1JFM6vuUJynusg7XI1EKqkuPVl
   ouTQzlYa+dU9j5zoqIQsOkq7QpnC5kiSNF7aaFn8ietErfuWSqWTvMyME
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="327043301"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="327043301"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2023 16:34:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="668584453"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="668584453"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 06 Feb 2023 16:34:25 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPBwG-0002tu-38;
	Tue, 07 Feb 2023 00:34:24 +0000
Date: Tue, 07 Feb 2023 08:33:43 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 97e45d469eb180a7bd2809e4e079331552c73e42
Message-ID: <63e19c67.dzRAVqGU9qei0z+H%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git fixes-test
branch HEAD: 97e45d469eb180a7bd2809e4e079331552c73e42  powerpc/kexec_file: fix implicit decl error

elapsed time: 721m

configs tested: 16
configs skipped: 111

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
powerpc                          allmodconfig
ia64                             allmodconfig
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                           rhel-8.3-bpf
x86_64                         rhel-8.3-kunit
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
mips                             allyesconfig
sh                               allmodconfig
i386                             allyesconfig
i386                                defconfig
i386                          randconfig-c001
powerpc              randconfig-c003-20230205

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
