Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2836949247A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jan 2022 12:16:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JdR6X0jc7z3bcB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jan 2022 22:16:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ajjVz9F5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ajjVz9F5; dkim-atps=neutral
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JdR5p0v66z2yHL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jan 2022 22:15:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642504542; x=1674040542;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=PdjGb8hIwq16maEuK27zYJIzWdneeLxNEwbrcQwuyAM=;
 b=ajjVz9F5XcUfsH7uzcWX/nYgyO3I5IhB35SbJCoei9oX2bh+5j8/u7qq
 WccrUX4L93WcJVQ8slbDQGoYER/KsnF10W6BJxY0nS4vrNlPGk3vucGSN
 yUlaf8d3Q67DYChRpzgff9gYw7upP3UyoKl4myvZrJxRbEuvwpS83hNzJ
 O+n09Lbdag6abP5rJuxuB3UvW3eNRnF6N38jHetv4LjNgOB8TaNN18uoM
 1T1RKR+3sFRJGFdqVTPS+0151vdXOs7HHMxgmUHOfeprk4jOE5g0EinNK
 4aCIalJxu1Dd/6fJ7s3PG+opFBNn7pFr9czxphYp/GBByHq02yLmPP8G4 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10230"; a="232152195"
X-IronPort-AV: E=Sophos;i="5.88,297,1635231600"; d="scan'208";a="232152195"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2022 03:14:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,297,1635231600"; d="scan'208";a="595031364"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 18 Jan 2022 03:14:30 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1n9mRZ-000CUk-M1; Tue, 18 Jan 2022 11:14:29 +0000
Date: Tue, 18 Jan 2022 19:14:13 +0800
From: kernel test robot <lkp@intel.com>
To: Ganesh Goudar <ganeshgr@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
Subject: Re: [PATCH v4] powerpc/mce: Avoid using irq_work_queue() in realmode
Message-ID: <202201181831.VB3r6wzz-lkp@intel.com>
References: <20220117083217.330110-1-ganeshgr@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220117083217.330110-1-ganeshgr@linux.ibm.com>
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
Cc: Ganesh Goudar <ganeshgr@linux.ibm.com>, kbuild-all@lists.01.org,
 mahesh@linux.ibm.com, npiggin@gmail.com, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Ganesh,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on powerpc/next]
[also build test ERROR on v5.16 next-20220118]
[cannot apply to scottwood/next mpe/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Ganesh-Goudar/powerpc-mce-Avoid-using-irq_work_queue-in-realmode/20220117-163425
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
config: powerpc64-randconfig-c024-20220116 (https://download.01.org/0day-ci/archive/20220118/202201181831.VB3r6wzz-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/bb8f4e786eb9c838daad7a6187dcd59040ff2771
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Ganesh-Goudar/powerpc-mce-Avoid-using-irq_work_queue-in-realmode/20220117-163425
        git checkout bb8f4e786eb9c838daad7a6187dcd59040ff2771
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=powerpc SHELL=/bin/bash arch/powerpc/platforms/pseries/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/powerpc/platforms/pseries/ras.c: In function 'mce_handle_error':
>> arch/powerpc/platforms/pseries/ras.c:715:23: error: unused variable 'msr' [-Werror=unused-variable]
     715 |         unsigned long msr;
         |                       ^~~
   cc1: all warnings being treated as errors


vim +/msr +715 arch/powerpc/platforms/pseries/ras.c

a43c1590426c44 Mahesh Salgaonkar 2018-09-11  709  
4ff753feab0212 Ganesh Goudar     2020-07-24  710  static int mce_handle_error(struct pt_regs *regs, struct rtas_error_log *errp)
4ff753feab0212 Ganesh Goudar     2020-07-24  711  {
4ff753feab0212 Ganesh Goudar     2020-07-24  712  	struct pseries_errorlog *pseries_log;
4ff753feab0212 Ganesh Goudar     2020-07-24  713  	struct pseries_mc_errorlog *mce_log = NULL;
4ff753feab0212 Ganesh Goudar     2020-07-24  714  	int disposition = rtas_error_disposition(errp);
74c3354bc1d89d Nicholas Piggin   2021-02-07 @715  	unsigned long msr;
4ff753feab0212 Ganesh Goudar     2020-07-24  716  	u8 error_type;
4ff753feab0212 Ganesh Goudar     2020-07-24  717  
4ff753feab0212 Ganesh Goudar     2020-07-24  718  	if (!rtas_error_extended(errp))
4ff753feab0212 Ganesh Goudar     2020-07-24  719  		goto out;
4ff753feab0212 Ganesh Goudar     2020-07-24  720  
4ff753feab0212 Ganesh Goudar     2020-07-24  721  	pseries_log = get_pseries_errorlog(errp, PSERIES_ELOG_SECT_ID_MCE);
4ff753feab0212 Ganesh Goudar     2020-07-24  722  	if (!pseries_log)
4ff753feab0212 Ganesh Goudar     2020-07-24  723  		goto out;
4ff753feab0212 Ganesh Goudar     2020-07-24  724  
4ff753feab0212 Ganesh Goudar     2020-07-24  725  	mce_log = (struct pseries_mc_errorlog *)pseries_log->data;
4ff753feab0212 Ganesh Goudar     2020-07-24  726  	error_type = mce_log->error_type;
4ff753feab0212 Ganesh Goudar     2020-07-24  727  
4ff753feab0212 Ganesh Goudar     2020-07-24  728  	disposition = mce_handle_err_realmode(disposition, error_type);
4ff753feab0212 Ganesh Goudar     2020-07-24  729  out:
4ff753feab0212 Ganesh Goudar     2020-07-24  730  	disposition = mce_handle_err_virtmode(regs, errp, mce_log,
4ff753feab0212 Ganesh Goudar     2020-07-24  731  					      disposition);
9ca766f9891d23 Nicholas Piggin   2019-08-02  732  	return disposition;
7f177f9810ada8 Ganesh Goudar     2019-04-15  733  }
7f177f9810ada8 Ganesh Goudar     2019-04-15  734  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
