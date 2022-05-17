Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A80452A906
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 May 2022 19:12:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2jNV1Y2lz3cJq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 03:12:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=k5wcl2Pr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=k5wcl2Pr; dkim-atps=neutral
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2jMr42skz3bZs
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 May 2022 03:11:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652807512; x=1684343512;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=s3feJR7Sx+/HSdzVhKMtadlDZJTbBIc6lvk/1Hjc2BA=;
 b=k5wcl2Pr5FMGHJfgogktNXhdEPVVwhPpvIzx02iVxw8j0SykP0n3w3Ux
 T6YCC77uOVhplAV62z/NfSGxaw+ljyW4tx3FXJx6oZgO9jSxpnEHGYLdZ
 XIO/+xlmNIZA7kysKuqH/V3D3LdZfQJrczGaTz4kX1Zs6A8wnWiqbn1zj
 MWDoZIzR5a+CIxIMZNmxRZ0Xivp0f89gf5/pl1pdJdJZzmQe+39M9/cHR
 aYKBYBnMFiSTfokXqZ69dhenpVxSp2s76bH1eqfkuXIR8YmeAatrZnyQo
 /gPW3NhJ4mwmfYx3Cd8dOyuCdKxArylPBgk7QRkjv87A3pRLGVyl4vPtS w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10350"; a="270946020"
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; d="scan'208";a="270946020"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2022 10:11:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; d="scan'208";a="713950426"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
 by fmsmga001.fm.intel.com with ESMTP; 17 May 2022 10:11:48 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nr0jb-0001Az-IP;
 Tue, 17 May 2022 17:11:47 +0000
Date: Wed, 18 May 2022 01:11:37 +0800
From: kernel test robot <lkp@intel.com>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: [powerpc:next-test 141/145]
 arch/powerpc/kernel/trace/ftrace.c:714:6: error: redefinition of
 'ftrace_free_init_tramp'
Message-ID: <202205180129.rAXTjqF6-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: linuxppc-dev@lists.ozlabs.org, kbuild-all@lists.01.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
head:   2e4a9942261f89ad204a8189634029a4b1f0efb6
commit: 0cad223e88229b1f021f9e167bdb2ba7b0d0c369 [141/145] powerpc/ftrace: Remove ftrace init tramp once kernel init is complete
config: powerpc-buildonly-randconfig-r005-20220516 (https://download.01.org/0day-ci/archive/20220518/202205180129.rAXTjqF6-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?id=0cad223e88229b1f021f9e167bdb2ba7b0d0c369
        git remote add powerpc https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
        git fetch --no-tags powerpc next-test
        git checkout 0cad223e88229b1f021f9e167bdb2ba7b0d0c369
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/powerpc/kernel/trace/ftrace.c:714:6: error: redefinition of 'ftrace_free_init_tramp'
     714 | void ftrace_free_init_tramp(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/ftrace.h:23,
                    from arch/powerpc/kernel/trace/ftrace.c:20:
   arch/powerpc/include/asm/ftrace.h:119:20: note: previous definition of 'ftrace_free_init_tramp' with type 'void(void)'
     119 | static inline void ftrace_free_init_tramp(void) { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~


vim +/ftrace_free_init_tramp +714 arch/powerpc/kernel/trace/ftrace.c

   713	
 > 714	void ftrace_free_init_tramp(void)
   715	{
   716		int i;
   717	
   718		for (i = 0; i < NUM_FTRACE_TRAMPS && ftrace_tramps[i]; i++)
   719			if (ftrace_tramps[i] == (unsigned long)ftrace_tramp_init) {
   720				ftrace_tramps[i] = 0;
   721				return;
   722			}
   723	}
   724	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
