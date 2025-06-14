Return-Path: <linuxppc-dev+bounces-9377-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F68AD9E7D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Jun 2025 19:29:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bKNYF3db3z2xd3;
	Sun, 15 Jun 2025 03:29:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749922161;
	cv=none; b=Rv/5d0/gi9URbqSlR+CDlvotTENYbBkcYho4VVrDz3yqwb/DNlDMPkAAyq9iKAXgd+7cFZMmCmIphpJqN23A0TX4jwjYv5jgQbOcFG7y/RLsoFl9QXkf67Byp6CciV9LBT2TilLlBH+ixjlqWdHyFvgZmREiMs16byVxH9ihiA14z73PDf0wB62IZm6GHSlDlEjzRyRJFv2k3KKSN4iZJ46xvVAJYjMSqTx9ClPHhhZ20B1JT9NUt1MHVCsI1nt0rbfRKJJ9p2V0d4ARW60n6W8ngPVA8Fnv79tuqe+NhlPytzwJIU6PNA5caotuEOUQO2/K4NEJITSDg4QKEKTe1A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749922161; c=relaxed/relaxed;
	bh=SzwQI56sK3FcllTzOZvvcaXW+vRPyzJjSHRcsHe8Tnc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XuAk6AfyohqF5AtlG+N08X60XIcbmYCs2KyDXLspgBHnKniPt0Bmu4xkYN9DzYdOQ1BOJnYMg1lBOXwmDHTsYJKr+EV95rcwwnvFtWBZAnbPGQ+oKk/73yd3UpdcDQ+KIYVSDmmf5v89FkFqD3t/XRBtNox3vX1bZp+BdLJcT6svWtmYA3QU9kiAmzcgFxS1tt9+3JGW2rGSQGPkNWyveEfQKtvpp77G+5/LckhFnDRHS3Yi9H+rUPqF7j/X7LxFbEfBaux2ATLjiQr4PMuvQ5w50ypiz0uJq1z+NCC/LOU6X6zxMSnEfmQfD8biq3uPcEGIe7Cxj4eajsYQJ87Y5g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nprPuUbl; dkim-atps=neutral; spf=pass (client-ip=192.198.163.9; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nprPuUbl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.9; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bKNYC171zz2xYl
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Jun 2025 03:29:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749922159; x=1781458159;
  h=date:from:to:cc:subject:message-id;
  bh=d0RyCQgaX1sYzcxV8my/6+7Mt90MyHviCavUre/kjAs=;
  b=nprPuUbliGJJQrcwt96J39qUyg2CeIgaJjYCfrrCvFOop5NqSTcXn9x7
   LmyZ3RBwa0dsrT+14h78UKcfkHVXXIdaZrzdNeQPLPVUwVi3wPI20wqoe
   XrJMYXDkpseG4sY8Rc2MV8YyIaDXiBP+tPJHjm33OPM/kwIRfXt6X0932
   6NuXMSjlPTUdN0E5mpc3Bu5dN9J39ex+6Ub2A8FveoBG7Z7/XNZZPKcz/
   TumgV+8Nf8haAgUweSgmY9I56p6uhAZ9YfiLFmg//rW8sQtjoXK7Bli5Y
   9raT+ctmB7M6Lmidm0Y0JR0cqeNs2F5MWb4cRtyRP5Yg2zqv9aiTTaVAB
   Q==;
X-CSE-ConnectionGUID: 6wLOLuqrSR+tBdVsCj7Xnw==
X-CSE-MsgGUID: lD/+ZoHYT9KcBC5MwEGeGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11464"; a="62767809"
X-IronPort-AV: E=Sophos;i="6.16,237,1744095600"; 
   d="scan'208";a="62767809"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2025 10:29:13 -0700
X-CSE-ConnectionGUID: 1QZTB09AQ4C4/DBqdhL+Aw==
X-CSE-MsgGUID: XGcpKeL+RVeH0bLWp7Kr5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,237,1744095600"; 
   d="scan'208";a="147926265"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 14 Jun 2025 10:29:12 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQUgo-000DiV-0R;
	Sat, 14 Jun 2025 17:29:10 +0000
Date: Sun, 15 Jun 2025 01:29:03 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:fixes-test] BUILD SUCCESS
 ab107276607af90b13a5994997e19b7b9731e251
Message-ID: <202506150153.fS1hh6VH-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git fixes-test
branch HEAD: ab107276607af90b13a5994997e19b7b9731e251  powerpc: Fix struct termio related ioctl macros

elapsed time: 1442m

configs tested: 7
configs skipped: 122

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
powerpc                allnoconfig    gcc-15.1.0
powerpc    randconfig-001-20250614    gcc-13.3.0
powerpc    randconfig-002-20250614    clang-21
powerpc    randconfig-003-20250614    gcc-12.4.0
powerpc64  randconfig-001-20250614    gcc-11.5.0
powerpc64  randconfig-002-20250614    clang-21
powerpc64  randconfig-003-20250614    gcc-12.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

