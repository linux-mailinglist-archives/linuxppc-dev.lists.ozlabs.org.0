Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B41A575E278
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Jul 2023 16:13:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UCDEjMS4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R84yz4Tndz2ygG
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jul 2023 00:13:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UCDEjMS4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R84x438gnz2yV5
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jul 2023 00:12:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690121528; x=1721657528;
  h=date:from:to:cc:subject:message-id;
  bh=r6t5P46iYRB2icKpTMMLHchtFLmNbOPuB26LL6N1WVU=;
  b=UCDEjMS4maPm8U4AyxBNkrq4EtPsYhT58Gb7S7mk7ohd7yTIN4N2Im2d
   4LuNKYLhD5xQ/iOfqu8krBlFPZQYbMxoOkx+I8bZsrkJSINGoFKHxyB7C
   l6CL6ncGuHvnxFWY1BRx5Qq46+3lbG8YR1do62AZzbKAgkLmv3aWxuwCX
   JAO+H0tbr52rAegyxvxBIgi5C+seTt3oBGgZiaUbtJXrpexcV0MfFWmFb
   lrq9JcMKMRzbo6/dKwJi5MreUCJL9lgz69LpGQMHbnjr6fLqIX1WIRJBw
   U17n5Idpf3JL2O4Oyna8xGp+gCmghB9aoMZtoqt+FscE6iRpY+qeS69Cr
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="346881118"
X-IronPort-AV: E=Sophos;i="6.01,227,1684825200"; 
   d="scan'208";a="346881118"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2023 07:11:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="971970032"
X-IronPort-AV: E=Sophos;i="6.01,227,1684825200"; 
   d="scan'208";a="971970032"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 23 Jul 2023 07:11:58 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNZoU-00092v-0E;
	Sun, 23 Jul 2023 14:11:58 +0000
Date: Sun, 23 Jul 2023 22:11:40 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 6391d2478e2f6fc8db2c78f62b13085fd5dfb10e
Message-ID: <202307232238.MZ52QOD3-lkp@intel.com>
User-Agent: s-nail v14.9.24
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
branch HEAD: 6391d2478e2f6fc8db2c78f62b13085fd5dfb10e  powerpc/64s/radix: combine final TLB flush and lazy tlb mm shootdown IPIs

elapsed time: 722m

configs tested: 5
configs skipped: 141

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r022-20230723   gcc  
powerpc              randconfig-r032-20230723   clang
powerpc              randconfig-r034-20230723   clang

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
