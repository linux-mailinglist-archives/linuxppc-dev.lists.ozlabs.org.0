Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68294685C2A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 01:30:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P62rG1Yplz3f5B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 11:30:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V/P2b4RW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V/P2b4RW;
	dkim-atps=neutral
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P62pK4psnz3bfp
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Feb 2023 11:28:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675211321; x=1706747321;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=7ipeNsaVVwIqhwUJavk4PCDMsctidv1/7fUdH86dHPs=;
  b=V/P2b4RWLq1Ep1FyffEToCdiwaLc6vA8zE+rNI8iCbTRVA2JUfd21J5o
   hIkYSJNDLHwMJkxCNS544+7rP1NE96aIejRJ/hup5aBoa5k/R7rQJBuhe
   U96VTQwKQ16IDUEMWRu5/d17+Wh7DNj8zNqHiXB7wkpotFmPOl3XbdfKb
   dLXYxt/qbQkZ5Uvlo+JxOutamBCgWmGQ3lYc3QgaL28xcus2ElK8kHezx
   zrqjkYzMA+cqbQpYZjxz2A1gdOa0mEpmb+3Mtr/nhN+XxauTPF6hyfrYM
   f3i3ybuZL/lH+tHEOkt/O8mXTiyJljZWX1iggrawvT+xhxYuGcB8/lPtn
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="355330306"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="355330306"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2023 16:28:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="664689760"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="664689760"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 31 Jan 2023 16:28:34 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pN0zJ-0004qQ-10;
	Wed, 01 Feb 2023 00:28:33 +0000
Date: Wed, 01 Feb 2023 08:28:25 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 5746ca131e2496ccd5bb4d7a0244d6c38070cbf5
Message-ID: <63d9b229.FMAj9vZ6XD3uWKXj%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
branch HEAD: 5746ca131e2496ccd5bb4d7a0244d6c38070cbf5  powerpc/64: Don't recurse irq replay

elapsed time: 720m

configs tested: 2
configs skipped: 115

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
powerpc                          allmodconfig

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
