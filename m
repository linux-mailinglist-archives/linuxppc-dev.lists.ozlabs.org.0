Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9223153DF72
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jun 2022 03:43:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LGbq83sc5z3bpH
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jun 2022 11:43:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TkvpOq9I;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mga11.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TkvpOq9I;
	dkim-atps=neutral
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LGbpX3ZR6z30F8
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jun 2022 11:42:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654479764; x=1686015764;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=89fRXrMCu5gUf0qTnTDqrSzw14ZMCulzmcEHQKRg2Kw=;
  b=TkvpOq9IaBz7TMR9RdHdeOLDtXxG9jWCzbNqDvUAW32iLb46lXASJ2m1
   2iKoTg3mAblAJAOZ8KF5OL/AYj4/4CmeJrhuDhS39iyHwZO85uUQl8cLT
   0BCN5GOgLCDaCfgNWzuvqu+bktA1ecrxzYXr0Nc2LQARlAzV7chuJ0Tzb
   QhpWxG8we/eKZIZ47RWtd9y+OCtGbQbWf0kltNZLJ3Ir654tuD1RbEm7y
   uojv4yelQDf/oax4hrCzRSLk/sPjEwsiJ6XGFER1ZbA1EUrj3dUqXTo5G
   h1biUPHu4l48f7P05gyfRx+JN4Hk7aI6HZVT5gHfIQxbJyRhvsbtjUMXl
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10369"; a="274147325"
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; 
   d="scan'208";a="274147325"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2022 18:42:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; 
   d="scan'208";a="564665634"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 05 Jun 2022 18:42:03 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ny1ko-000COk-QU;
	Mon, 06 Jun 2022 01:42:02 +0000
Date: Mon, 6 Jun 2022 09:41:56 +0800
From: kernel test robot <lkp@intel.com>
To: Laurent Dufour <ldufour@linux.ibm.com>, mpe@ellerman.id.au,
	benh@kernel.crashing.org, paulus@samba.org, nathanl@linux.ibm.com,
	haren@linux.vnet.ibm.com, npiggin@gmail.com
Subject: Re: [PATCH 2/2] powerpc/mobility: disabling hard lockup watchdog
 during LPM
Message-ID: <202206060910.rYNTFqdI-lkp@intel.com>
References: <20220601155315.35109-3-ldufour@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220601155315.35109-3-ldufour@linux.ibm.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, kbuild-all@lists.01.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Laurent,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on powerpc/next]
[also build test ERROR on v5.18 next-20220603]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Laurent-Dufour/Disabling-NMI-watchdog-during-LPM-s-memory-transfer/20220601-235741
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
config: powerpc64-randconfig-r002-20220605 (https://download.01.org/0day-ci/archive/20220606/202206060910.rYNTFqdI-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/d409d8549db37257e33691523100679a23cfd887
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Laurent-Dufour/Disabling-NMI-watchdog-during-LPM-s-memory-transfer/20220601-235741
        git checkout d409d8549db37257e33691523100679a23cfd887
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   powerpc64-linux-ld: warning: discarding dynamic section .glink
   powerpc64-linux-ld: warning: discarding dynamic section .plt
   powerpc64-linux-ld: linkage table error against `watchdog_nmi_stop'
   powerpc64-linux-ld: stubs don't match calculated size
   powerpc64-linux-ld: can not build stubs: bad value
   powerpc64-linux-ld: arch/powerpc/platforms/pseries/mobility.o: in function `.pseries_migrate_partition':
>> arch/powerpc/platforms/pseries/mobility.c:705: undefined reference to `.watchdog_nmi_stop'
>> powerpc64-linux-ld: arch/powerpc/platforms/pseries/mobility.c:715: undefined reference to `.watchdog_nmi_start'


vim +705 arch/powerpc/platforms/pseries/mobility.c

   693	
   694	static int pseries_migrate_partition(u64 handle)
   695	{
   696		int ret;
   697	
   698		ret = wait_for_vasi_session_suspending(handle);
   699		if (ret)
   700			return ret;
   701	
   702		vas_migration_handler(VAS_SUSPEND);
   703	
   704		pr_debug("Disabling the NMI watchdog\n");
 > 705		watchdog_nmi_stop();
   706	
   707		ret = pseries_suspend(handle);
   708		if (ret == 0) {
   709			post_mobility_fixup();
   710			wait_for_vasi_session_completed(handle);
   711		} else
   712			pseries_cancel_migration(handle, ret);
   713	
   714		pr_debug("Enabling the NMI watchdog again\n");
 > 715		watchdog_nmi_start();
   716	
   717		vas_migration_handler(VAS_RESUME);
   718	
   719		return ret;
   720	}
   721	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
