Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D40E64C73AD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Feb 2022 18:37:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6ncs07cJz3bXw
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Mar 2022 04:37:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=F9J2+EyP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=F9J2+EyP; dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6nc92d4Tz30N6
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Mar 2022 04:36:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646069786; x=1677605786;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=LV6WxyfV7WmrPPFnJO2M0zTOBvZNY76rsWwMTORr1+Q=;
 b=F9J2+EyPVZhjOEviIjTsfv0r8mOnEaH+Who5+B0NmT+WPODGCkmaSfkZ
 OvTn028D7u37Opbk2NcCVXtzLdWsrfer/iR28XAgC0eswI31ndzpZ22BJ
 Dvk3V/8esQ+d7Y0T8HXc3nVlpNfkiHpUl/L65E2kCbjQ9uFgschQ+Oub4
 PAAZdMbeanl4OxpKtUQ+7biRuibXWoJjHuFdfIpXyQbDneokn6RItPBQC
 iOSfy12R9vpt0+4BBSufgjzGw8SU/TombVg0Epj8SxntTgInjdZ8FDTOM
 QU5KYYtu6b0HL8AjSI0dX2hLzd24QSOZU45lTdr7H4X7gm55Mgc9ltexX Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="339373858"
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="339373858"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 09:35:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="608524510"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 28 Feb 2022 09:35:14 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nOjvW-0007ZS-7D; Mon, 28 Feb 2022 17:35:14 +0000
Date: Tue, 1 Mar 2022 01:35:06 +0800
From: kernel test robot <lkp@intel.com>
To: Haren Myneni <haren@linux.ibm.com>, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, nathanl@linux.ibm.com
Subject: Re: [PATCH v5 3/9] powerpc/vas: Add paste address mmap fault handler
Message-ID: <202202281913.4N2Af10e-lkp@intel.com>
References: <0325487209c8ad936b3b3165375c6ba1c8d3370c.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0325487209c8ad936b3b3165375c6ba1c8d3370c.camel@linux.ibm.com>
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
Cc: kbuild-all@lists.01.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Haren,

I love your patch! Perhaps something to improve:

[auto build test WARNING on powerpc/next]
[also build test WARNING on v5.17-rc6 next-20220225]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Haren-Myneni/powerpc-pseries-vas-NXGZIP-support-with-DLPAR/20220228-154814
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
config: powerpc64-randconfig-s031-20220227 (https://download.01.org/0day-ci/archive/20220228/202202281913.4N2Af10e-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/0day-ci/linux/commit/336150efb288e945786ca6d54b0eb7d9c956aad8
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Haren-Myneni/powerpc-pseries-vas-NXGZIP-support-with-DLPAR/20220228-154814
        git checkout 336150efb288e945786ca6d54b0eb7d9c956aad8
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=powerpc SHELL=/bin/bash arch/powerpc/platforms/book3s/ arch/powerpc/platforms/pseries/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> arch/powerpc/platforms/book3s/vas-api.c:403:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected int ret @@     got restricted vm_fault_t @@
   arch/powerpc/platforms/book3s/vas-api.c:403:29: sparse:     expected int ret
   arch/powerpc/platforms/book3s/vas-api.c:403:29: sparse:     got restricted vm_fault_t
>> arch/powerpc/platforms/book3s/vas-api.c:406:32: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted vm_fault_t @@     got int ret @@
   arch/powerpc/platforms/book3s/vas-api.c:406:32: sparse:     expected restricted vm_fault_t
   arch/powerpc/platforms/book3s/vas-api.c:406:32: sparse:     got int ret

vim +403 arch/powerpc/platforms/book3s/vas-api.c

   353	
   354	/*
   355	 * This fault handler is invoked when the core generates page fault on
   356	 * the paste address. Happens if the kernel closes window in hypervisor
   357	 * (on pseries) due to lost credit or the paste address is not mapped.
   358	 */
   359	static vm_fault_t vas_mmap_fault(struct vm_fault *vmf)
   360	{
   361		struct vm_area_struct *vma = vmf->vma;
   362		struct file *fp = vma->vm_file;
   363		struct coproc_instance *cp_inst = fp->private_data;
   364		struct vas_window *txwin;
   365		u64 paste_addr;
   366		int ret;
   367	
   368		/*
   369		 * window is not opened. Shouldn't expect this error.
   370		 */
   371		if (!cp_inst || !cp_inst->txwin) {
   372			pr_err("%s(): Unexpected fault on paste address with TX window closed\n",
   373					__func__);
   374			return VM_FAULT_SIGBUS;
   375		}
   376	
   377		txwin = cp_inst->txwin;
   378		/*
   379		 * When the LPAR lost credits due to core removal or during
   380		 * migration, invalidate the existing mapping for the current
   381		 * paste addresses and set windows in-active (zap_page_range in
   382		 * reconfig_close_windows()).
   383		 * New mapping will be done later after migration or new credits
   384		 * available. So continue to receive faults if the user space
   385		 * issue NX request.
   386		 */
   387		if (txwin->task_ref.vma != vmf->vma) {
   388			pr_err("%s(): No previous mapping with paste address\n",
   389				__func__);
   390			return VM_FAULT_SIGBUS;
   391		}
   392	
   393		mutex_lock(&txwin->task_ref.mmap_mutex);
   394		/*
   395		 * The window may be inactive due to lost credit (Ex: core
   396		 * removal with DLPAR). If the window is active again when
   397		 * the credit is available, map the new paste address at the
   398		 * the window virtual address.
   399		 */
   400		if (txwin->status == VAS_WIN_ACTIVE) {
   401			paste_addr = cp_inst->coproc->vops->paste_addr(txwin);
   402			if (paste_addr) {
 > 403				ret = vmf_insert_pfn(vma, vma->vm_start,
   404						(paste_addr >> PAGE_SHIFT));
   405				mutex_unlock(&txwin->task_ref.mmap_mutex);
 > 406				return ret;
   407			}
   408		}
   409		mutex_unlock(&txwin->task_ref.mmap_mutex);
   410	
   411		return VM_FAULT_SIGBUS;
   412	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
