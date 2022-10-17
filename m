Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F17600531
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Oct 2022 04:22:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MrLNt5ZFZz3cfN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Oct 2022 13:22:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JfIklEed;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JfIklEed;
	dkim-atps=neutral
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MrLMv3mknz2xfS
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Oct 2022 13:21:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665973291; x=1697509291;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=pxkq8CtebPBZrIMMWls0f4MW4tsfYO45wW3jhnHk44o=;
  b=JfIklEedz24V/ZFsZ1MvrEHzj42CShzEWRtMfonJekTt1jSgmRz8kx46
   ggDe5hmBt0/9axlZJ2R7bfmg5PvAr312qluC3aCB+TlUUjhXH6TUJ0/+O
   30JIt+oUeOts5yJmFNPIcist5T+E5J8/8IIeWyNUsR8Sv3104aEWrneHy
   i6jMRGUwoMQOMDBFJ5td6Jmykc0Vj3+7xmxhPhlYSkFOV66FOO5T56x02
   aoyjt7Qb0Jz6HYhGi9WDuvddUORWjTC7MxPSabXRyiHAk7VX7JEoySmaO
   FpOotvmcwsNjl1OT/EmGO/jRQGlc+MZocX2+yVOE+QAvTKva6jLYB1qeM
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10502"; a="307344381"
X-IronPort-AV: E=Sophos;i="5.95,190,1661842800"; 
   d="scan'208";a="307344381"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2022 19:21:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10502"; a="628136676"
X-IronPort-AV: E=Sophos;i="5.95,190,1661842800"; 
   d="scan'208";a="628136676"
Received: from lkp-server02.sh.intel.com (HELO 8556ec0e0fdc) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 16 Oct 2022 19:21:19 -0700
Received: from kbuild by 8556ec0e0fdc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1okFkk-00003p-2Y;
	Mon, 17 Oct 2022 02:21:18 +0000
Date: Mon, 17 Oct 2022 10:21:14 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 af544511aa1b39150d7526acdd8b7076bceda538
Message-ID: <634cbc1a.Q2RsVBj4Aj8zNRK0%lkp@intel.com>
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
branch HEAD: af544511aa1b39150d7526acdd8b7076bceda538  powerpc/64s: make linear_map_hash_lock a raw spinlock

elapsed time: 4384m

configs tested: 2
configs skipped: 100

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
powerpc                          allmodconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
