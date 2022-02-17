Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 878214BAA2C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Feb 2022 20:49:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K054M0j1rz3ckR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Feb 2022 06:49:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ye7jyNUu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Ye7jyNUu; dkim-atps=neutral
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K053f6Vzyz3bcy
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Feb 2022 06:48:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645127311; x=1676663311;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=HSCKqfDMdMI/r89h9i7FEF/tyXYo2PHT5q86Bt1G8+0=;
 b=Ye7jyNUuuAfsTJitDxSphWRPjSXLO038uSV43LDljfmAlUO64qWeAPjK
 nld3M66W5TtM4uwKIAjI85XLXwYMV9DB1/R13hSR07UZ/kRL/VejO5S+o
 rr88fDoClWLdR9AIJ8bVm7WKe3WjbxxdrbfDRDrPTz+NREEycfaie3nlC
 2f7Ta+QY9SEPXnPvxV7WrUPnDV4tUOFJvZbaRXuGn9NMXIfLqfKwdueHh
 Y9yJnIa0kayVYltpUpD/2DVgIoAVrbN09b/d2XIM/C1pU8/kWym6+vqoa
 R//0e7IDFG8UfYokgU1w2fdubhJDpmE6Mxt7BXUSuS7o7MfMeoDnlTkbR Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="250700988"
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="250700988"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 11:47:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="571969855"
Received: from lkp-server01.sh.intel.com (HELO 6f05bf9e3301) ([10.239.97.150])
 by orsmga001.jf.intel.com with ESMTP; 17 Feb 2022 11:47:01 -0800
Received: from kbuild by 6f05bf9e3301 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nKmk1-0000U9-6S; Thu, 17 Feb 2022 19:47:01 +0000
Date: Fri, 18 Feb 2022 03:46:23 +0800
From: kernel test robot <lkp@intel.com>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Masami Hiramatsu <mhiramat@kernel.org>
Subject: Re: [PATCH 1/3] powerpc/ftrace: Reserve instructions from function
 entry for ftrace
Message-ID: <202202180014.IWuzQ9al-lkp@intel.com>
References: <8843d65ac0878232433573d10ebee30457748624.1645096227.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8843d65ac0878232433573d10ebee30457748624.1645096227.git.naveen.n.rao@linux.vnet.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linuxppc-dev@lists.ozlabs.org, bpf@vger.kernel.org, kbuild-all@lists.01.org,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi "Naveen,

I love your patch! Perhaps something to improve:

[auto build test WARNING on 1b43a74f255c5c00db25a5fedfd75ca0dc029022]

url:    https://github.com/0day-ci/linux/commits/Naveen-N-Rao/powerpc-ftrace-Reserve-instructions-from-function-entry-for-ftrace/20220217-200314
base:   1b43a74f255c5c00db25a5fedfd75ca0dc029022
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20220218/202202180014.IWuzQ9al-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/6a1891335e377e5def312e7c182aef676f04c926
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Naveen-N-Rao/powerpc-ftrace-Reserve-instructions-from-function-entry-for-ftrace/20220217-200314
        git checkout 6a1891335e377e5def312e7c182aef676f04c926
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=powerpc SHELL=/bin/bash arch/powerpc/kernel/trace/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/powerpc/kernel/trace/ftrace.c:504:5: warning: no previous prototype for 'ftrace_location_get_offset' [-Wmissing-prototypes]
     504 | int ftrace_location_get_offset(const struct dyn_ftrace *rec)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/ftrace_location_get_offset +504 arch/powerpc/kernel/trace/ftrace.c

   502	
   503	#if defined(CONFIG_MPROFILE_KERNEL) || defined(CONFIG_PPC32)
 > 504	int ftrace_location_get_offset(const struct dyn_ftrace *rec)
   505	{
   506		if (IS_ENABLED(CONFIG_MPROFILE_KERNEL))
   507			/*
   508			 * On ppc64le with -mprofile-kernel, function entry can have:
   509			 *   addis r2, r12, M
   510			 *   addi  r2, r2, N
   511			 *   mflr  r0
   512			 *   bl    _mcount
   513			 *
   514			 * The first two instructions are for TOC setup and represent the global entry
   515			 * point for cross-module calls, and may be missing if the function is never called
   516			 * from other modules.
   517			 */
   518			return ((unsigned long)rec->arch.mod & 0x1) ? FUNC_MCOUNT_OFFSET_PPC64_GEP :
   519								      FUNC_MCOUNT_OFFSET_PPC64_LEP;
   520		else
   521			/*
   522			 * On ppc32, function entry always has:
   523			 *   mflr r0
   524			 *   stw  r0, 4(r1)
   525			 *   bl   _mcount
   526			 */
   527			return FUNC_MCOUNT_OFFSET_PPC32;
   528	}
   529	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
