Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6875544DD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jun 2022 11:28:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LSdNk0Jdrz3bnr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jun 2022 19:28:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N4r3hEGp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N4r3hEGp;
	dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LSdN40R22z306Y
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jun 2022 19:27:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655890084; x=1687426084;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iiFLOMxIIm5NPds5E0AcgENCgnumF65jA2ZbRysJsY0=;
  b=N4r3hEGpcPY3cWQGgrHaTpnV8F3DV5YaN2yDrZe/jVzTJBkwYbOXXNda
   Xa2xMgvtPtkETTLASFWPMOt2gyIZ0VqCGADkxDnEWPX5TwI2nPFNEGmxm
   bfIrEmxREFfszStLXCnJDQ8gByLYOBl4DPZgsNJsOthUtCfWgBUroHAmf
   St4nKj1tREaTBdwOSMmEXqdIB4LxIcr+T5rW8cjSGYIHlxgxwCFpoC3GQ
   sTzu2KYQI5Y9BGEva65koo5nAwYm8AzObfSX0CloH2CRtZUsnv7tJcamH
   fOzU5qQ0CjqkpdtcundO+u0rWTA75sAz5MGdvh29A0cmpMPiWpHzqMOjm
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="280413709"
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; 
   d="scan'208";a="280413709"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2022 02:27:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; 
   d="scan'208";a="620835546"
Received: from lkp-server02.sh.intel.com (HELO a67cc04a5eeb) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 22 Jun 2022 02:27:41 -0700
Received: from kbuild by a67cc04a5eeb with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o3weC-00015d-Ot;
	Wed, 22 Jun 2022 09:27:40 +0000
Date: Wed, 22 Jun 2022 17:26:43 +0800
From: kernel test robot <lkp@intel.com>
To: Laurent Dufour <ldufour@linux.ibm.com>, mpe@ellerman.id.au,
	benh@kernel.crashing.org, paulus@samba.org, nathanl@linux.ibm.com,
	haren@linux.vnet.ibm.com, npiggin@gmail.com
Subject: Re: [PATCH v2 3/4] powerpc/watchdog: introduce a LPM factor
Message-ID: <202206221732.AujJ8kWm-lkp@intel.com>
References: <20220614135414.37746-4-ldufour@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220614135414.37746-4-ldufour@linux.ibm.com>
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
[also build test ERROR on linus/master v5.19-rc3 next-20220621]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Laurent-Dufour/Extending-NMI-watchdog-during-LPM/20220614-215716
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
config: powerpc-mgcoge_defconfig (https://download.01.org/0day-ci/archive/20220622/202206221732.AujJ8kWm-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/368bca30c0737461c2ed32a788293018c25fc9c7
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Laurent-Dufour/Extending-NMI-watchdog-during-LPM/20220614-215716
        git checkout 368bca30c0737461c2ed32a788293018c25fc9c7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash arch/powerpc/kernel/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/kernel/traps.c:69:
>> arch/powerpc/include/asm/nmi.h:11:13: error: 'watchdog_nmi_set_lpm_factor' defined but not used [-Werror=unused-function]
      11 | static void watchdog_nmi_set_lpm_factor(u64 factor) {}
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/watchdog_nmi_set_lpm_factor +11 arch/powerpc/include/asm/nmi.h

     4	
     5	#ifdef CONFIG_PPC_WATCHDOG
     6	extern void arch_touch_nmi_watchdog(void);
     7	long soft_nmi_interrupt(struct pt_regs *regs);
     8	void watchdog_nmi_set_lpm_factor(u64 factor);
     9	#else
    10	static inline void arch_touch_nmi_watchdog(void) {}
  > 11	static void watchdog_nmi_set_lpm_factor(u64 factor) {}
    12	#endif
    13	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
