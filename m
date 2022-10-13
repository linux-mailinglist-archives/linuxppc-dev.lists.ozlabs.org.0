Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE755FD370
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Oct 2022 05:08:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MnvcN3Cbmz2xyB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Oct 2022 14:08:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YK76fBun;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YK76fBun;
	dkim-atps=neutral
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MnvbP6q6jz2xHW
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Oct 2022 14:07:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665630482; x=1697166482;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=/A/cVdjMpvP03MdZQLsz5HAiNM+ff9WLbQ1rm+tbkqc=;
  b=YK76fBunzjODCX/DOrpgO/d3/ADFYc/rznt9A5UHx3nELe4ckzHaohsK
   ns26vPiQAGLemTggJn87+TfZqEZaj/mSthDsCtPfeKgZkveD6iRg33XjZ
   VX0hpEhcY8b5qb4c0nfwm9aLSF5zESAbcTZ+NfUVCcBmwA7dK62Uf5Xbu
   k15vW/kH+EAik+mA77vIHZcqYcu+KA2iQHINMvleSY0wjvRu9rx8QsBx2
   giuZ0oJPl/QcxOh7UBAc9HjiJhLBZ7XALbr7BX+o+XThrwesiNNCiw4sr
   bvHv+ROBVPD+9UthybrebHUFne6JTOJPHDxs/tCmiokUP21OXfnf6REOm
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10498"; a="285347827"
X-IronPort-AV: E=Sophos;i="5.95,180,1661842800"; 
   d="scan'208";a="285347827"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2022 20:07:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10498"; a="629352370"
X-IronPort-AV: E=Sophos;i="5.95,180,1661842800"; 
   d="scan'208";a="629352370"
Received: from lkp-server01.sh.intel.com (HELO 2af0a69ca4e0) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 12 Oct 2022 20:07:44 -0700
Received: from kbuild by 2af0a69ca4e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oioZU-0004Xr-05;
	Thu, 13 Oct 2022 03:07:44 +0000
Date: Thu, 13 Oct 2022 11:07:17 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 e237506238352f3bfa9cf3983cdab873e35651eb
Message-ID: <634780e5.FXih0yrEUt6QllD+%lkp@intel.com>
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
branch HEAD: e237506238352f3bfa9cf3983cdab873e35651eb  powerpc/32: fix syscall wrappers with 64-bit arguments of unaligned register-pairs

elapsed time: 728m

configs tested: 2
configs skipped: 96

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
powerpc                          allmodconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
