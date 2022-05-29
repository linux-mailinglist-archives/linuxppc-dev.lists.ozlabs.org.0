Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 499F35372AC
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 May 2022 23:13:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LBB9G0vbRz3bqJ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 May 2022 07:13:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Or69IeOO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Or69IeOO;
	dkim-atps=neutral
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LBB8b6j7Hz2yV6
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 May 2022 07:13:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653858784; x=1685394784;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=k2R2AiELh+XAQTmLCs96mEeCLiS218+FFg8ogBKujcM=;
  b=Or69IeOOOCDWbgK7XKV5yqC2Y2uU9ujolFFZWbt8hf6yRGI0fx8mwyPI
   EwG2xImxiyZ+5ci49qW+Dtkt3kyKYN0pHIYfM8p4HqNBRJtGOpJf3xyLV
   pp/AV1gsQ4p2XcPnxnwYlhMQRFR6pi7dTEPn0CeDR8x5ghKfeYM5s5m0Q
   dUIUhVmUO58Fkf4b49WysWUrnnW5Voq+l/J/gAtJ9j5NkjbFcX4kB6zJ1
   4zZNK3Db8JubZognphMRm5figmzh4oss1PFOfQLLn39jnCU8IJ7I/TTd0
   vU0IZT/no3IAfOHpdy7cMKApOZmVBnlyGpJkdVD5UEYAfR4ScLB5Bf3Zt
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10362"; a="255331274"
X-IronPort-AV: E=Sophos;i="5.91,261,1647327600"; 
   d="scan'208";a="255331274"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2022 14:11:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,261,1647327600"; 
   d="scan'208";a="719628981"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 29 May 2022 14:11:59 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nvQCc-0001F8-9C;
	Sun, 29 May 2022 21:11:58 +0000
Date: Mon, 30 May 2022 05:11:38 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 1346d00e1bdfd4067f92bc14e8a6131a01de4190
Message-ID: <6293e18a.VG+UHdR7D86+JeRE%lkp@intel.com>
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
branch HEAD: 1346d00e1bdfd4067f92bc14e8a6131a01de4190  powerpc: Don't select HAVE_IRQ_EXIT_ON_IRQ_STACK

elapsed time: 725m

configs tested: 12
configs skipped: 118

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                     redwood_defconfig
powerpc                 mpc834x_mds_defconfig
powerpc                 mpc8540_ads_defconfig
powerpc                     pq2fads_defconfig
powerpc                        cell_defconfig
powerpc                      pcm030_defconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig

clang tested configs:
powerpc              randconfig-c003-20220529
powerpc                   bluestone_defconfig
powerpc                     kmeter1_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
