Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E57769AEF3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 16:05:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PJFVy1DBGz3fc6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Feb 2023 02:05:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nD/MENPc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nD/MENPc;
	dkim-atps=neutral
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PJFKK1g27z3f8k
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Feb 2023 01:57:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676645845; x=1708181845;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=WvJSbDFWxkRmenKNqHKXaSLyQyNMBK5dOs+74H9wdf0=;
  b=nD/MENPcCjbHeXwhO21rg/fLBXUEpjqGDVs0/fm5XPus8Mfd6h+PpJWq
   5W0qz1srvovkqM85fumCAhW//Qtw1PgpXQdPBY3nEO7EQ2e6YwJaCtZY4
   7uDCx7o5JaQzo03vztwrQHEA7VyvVoRMuxN9rdwnK/ZNd4z8gZOJ6qbg0
   rBikuSVPKMTnLAuWnOQcBzWP2EdkO1N7hQ93G7svRs5y88OQLe0gz+z95
   PLdnWNK+eUnj6HhnLuIGTPXI5jH8JJTyL97p8hivDumKlkMmTidD+Ab/z
   +/GGoGcicJD52XNF6jRxHQiBV/ki3rRW8x71L6uX8CWNwgbET7VpoTolG
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="359451306"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="359451306"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2023 06:57:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="844599273"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="844599273"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 17 Feb 2023 06:57:17 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pT2Am-000BYr-2J;
	Fri, 17 Feb 2023 14:57:16 +0000
Date: Fri, 17 Feb 2023 22:56:51 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 4302abc628fc0dc08e5855f21bbfaed407a72bc3
Message-ID: <63ef95b3.29irWv8PQ7sBRdEn%lkp@intel.com>
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
branch HEAD: 4302abc628fc0dc08e5855f21bbfaed407a72bc3  powerpc/64s: Prevent fallthrough to hash TLB flush when using radix

elapsed time: 724m

configs tested: 2
configs skipped: 126

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                          allmodconfig
powerpc                           allnoconfig

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
