Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 710D66CCF8B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Mar 2023 03:35:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PmTdV27zHz3fRP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Mar 2023 12:35:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BEeTHhfZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mga11.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BEeTHhfZ;
	dkim-atps=neutral
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PmTcb5zJWz3bbX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Mar 2023 12:34:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680053680; x=1711589680;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=XTO2Ytb9tV/vMkspdcHIQvqsWWj/gj8pfioDA4rIx8M=;
  b=BEeTHhfZ3lKq4uDbmTKGmTgH9R2LFblvxpDyL/xxTEKU1vQv2Nwq5e5D
   8nA+PzC18+BiB+GtPNJ0cMSDXIeW61oMBMxO4wKJDxiP6JIdfWrciLKlQ
   fcRY9NGJhRpGLtFQ3xCavFvnUPq9UpvoTT2D7YHvqkWrMRhwE65SD4rrY
   uFJ+egTeYq5zuNBhoVHmrikGYGb+9KJs+KKchuGCPA1bzlmm3u1UkjiLi
   8+zYU61QiSecTrN7qsDqyRTQ3kXCf2rVJQoZ997nCC0X+gI3Hk8oNNo5D
   t1hu+jlkZwS0EPWRvnZJznZuVNAcz1ZrYTjxf/t2QDZag6/rbxXcDlSRn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="338246925"
X-IronPort-AV: E=Sophos;i="5.98,299,1673942400"; 
   d="scan'208";a="338246925"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2023 18:34:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="858290289"
X-IronPort-AV: E=Sophos;i="5.98,299,1673942400"; 
   d="scan'208";a="858290289"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 28 Mar 2023 18:34:29 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phKho-000J2y-23;
	Wed, 29 Mar 2023 01:34:28 +0000
Date: Wed, 29 Mar 2023 09:33:58 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 fd7276189450110ed835eb0a334e62d2f1c4e3be
Message-ID: <64239586.rSvoJvdMh0c+KAEN%lkp@intel.com>
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
branch HEAD: fd7276189450110ed835eb0a334e62d2f1c4e3be  powerpc: Don't try to copy PPR for task with NULL pt_regs

elapsed time: 742m

configs tested: 7
configs skipped: 163

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
nios2                               defconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
sh                               allmodconfig   gcc  
x86_64                        randconfig-k001   clang

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
