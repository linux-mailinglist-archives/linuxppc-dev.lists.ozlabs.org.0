Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCF281ED68
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Dec 2023 09:47:20 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ta6f+RXE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T0QHp10LCz3bNs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Dec 2023 19:47:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ta6f+RXE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T0QGw2qmWz2xmC
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Dec 2023 19:46:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703666793; x=1735202793;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=aKYdAofQSdY6ZCQ6FKTD1+CS027C9wqNRrVL1BMR1kA=;
  b=Ta6f+RXEdYQF+3AFDcOWYmmFuXcfWYyd7gzffFTGwZ7aXPZNj0mYneCe
   //DAD09nOOBh7FYLHzXBn6Km6bUsEEDzBA24zFY44Jjsd58kG4XM3PFX+
   M6L2a5Bk5G7xUvni5+PvLBXVlELBlTqUvl7urJMaXtb0f/2GfYiF63PX1
   a/zklw/p9GKRM4JgX1XY8uRVWXCwxdpS3xho8lNkulweYACj3qfDgBFdA
   h2WhTX4sWtVsiDZqUuHF8SiYa9mmAsw0yoF2jZ9w3Y04S0KA01q6zDdka
   vUBW/rc82seG6uLk5MHysYiRiqPbYD2tteAh6n6Lef0GSLZ2njnuM+6rq
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10935"; a="9976365"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; 
   d="scan'208";a="9976365"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2023 00:46:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10935"; a="868816509"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; 
   d="scan'208";a="868816509"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 27 Dec 2023 00:46:24 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rIPYU-000FEj-0p;
	Wed, 27 Dec 2023 08:46:22 +0000
Date: Wed, 27 Dec 2023 16:46:07 +0800
From: kernel test robot <lkp@intel.com>
To: Luming Yu <luming.yu@shingroup.cn>, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, mpe@ellerman.id.au, npiggin@gmail.com,
	christophe.leroy@csgroup.eu
Subject: Re: [PATCH 1/1] powerpc/powernv: fix up kernel compile issues
Message-ID: <202312271646.LeEziRMt-lkp@intel.com>
References: <1655B2CD28DA1F77+20231225025824.830-1-luming.yu@shingroup.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1655B2CD28DA1F77+20231225025824.830-1-luming.yu@shingroup.cn>
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
Cc: Luming Yu <luming.yu@shingroup.cn>, ke.zhao@shingroup.cn, dawei.li@shingroup.cn, luming.yu@gmail.com, shenghui.qu@shingroup.cn, oe-kbuild-all@lists.linux.dev
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Luming,

kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes linus/master v6.7-rc7 next-20231222]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Luming-Yu/powerpc-powernv-fix-up-kernel-compile-issues/20231225-153228
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/1655B2CD28DA1F77%2B20231225025824.830-1-luming.yu%40shingroup.cn
patch subject: [PATCH 1/1] powerpc/powernv: fix up kernel compile issues
config: powerpc-powernv_defconfig (https://download.01.org/0day-ci/archive/20231227/202312271646.LeEziRMt-lkp@intel.com/config)
compiler: powerpc64le-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231227/202312271646.LeEziRMt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312271646.LeEziRMt-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/powerpc/platforms/powernv/vas.c: In function 'init_vas_instance':
>> arch/powerpc/platforms/powernv/vas.c:138:21: error: implicit declaration of function 'cpu_to_chip_id' [-Werror=implicit-function-declaration]
     138 |                 if (cpu_to_chip_id(cpu) == of_get_ibm_chip_id(dn))
         |                     ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from arch/powerpc/platforms/powernv/vas-window.c:20:
>> arch/powerpc/platforms/powernv/vas.h:428:8: error: unknown type name 'irqreturn_t'
     428 | extern irqreturn_t vas_fault_thread_fn(int irq, void *data);
         |        ^~~~~~~~~~~
   arch/powerpc/platforms/powernv/vas.h:429:8: error: unknown type name 'irqreturn_t'
     429 | extern irqreturn_t vas_fault_handler(int irq, void *dev_id);
         |        ^~~~~~~~~~~
--
   In file included from arch/powerpc/platforms/powernv/vas-fault.c:18:
>> arch/powerpc/platforms/powernv/vas.h:428:8: error: unknown type name 'irqreturn_t'
     428 | extern irqreturn_t vas_fault_thread_fn(int irq, void *data);
         |        ^~~~~~~~~~~
   arch/powerpc/platforms/powernv/vas.h:429:8: error: unknown type name 'irqreturn_t'
     429 | extern irqreturn_t vas_fault_handler(int irq, void *dev_id);
         |        ^~~~~~~~~~~
>> arch/powerpc/platforms/powernv/vas-fault.c:66:1: error: unknown type name 'irqreturn_t'
      66 | irqreturn_t vas_fault_thread_fn(int irq, void *data)
         | ^~~~~~~~~~~
   arch/powerpc/platforms/powernv/vas-fault.c: In function 'vas_fault_thread_fn':
>> arch/powerpc/platforms/powernv/vas-fault.c:111:32: error: 'IRQ_HANDLED' undeclared (first use in this function); did you mean 'IRQS_ENABLED'?
     111 |                         return IRQ_HANDLED;
         |                                ^~~~~~~~~~~
         |                                IRQS_ENABLED
   arch/powerpc/platforms/powernv/vas-fault.c:111:32: note: each undeclared identifier is reported only once for each function it appears in
   arch/powerpc/platforms/powernv/vas-fault.c: At top level:
   arch/powerpc/platforms/powernv/vas-fault.c:169:1: error: unknown type name 'irqreturn_t'
     169 | irqreturn_t vas_fault_handler(int irq, void *dev_id)
         | ^~~~~~~~~~~
   arch/powerpc/platforms/powernv/vas-fault.c: In function 'vas_fault_handler':
   arch/powerpc/platforms/powernv/vas-fault.c:172:9: error: unknown type name 'irqreturn_t'
     172 |         irqreturn_t ret = IRQ_WAKE_THREAD;
         |         ^~~~~~~~~~~
>> arch/powerpc/platforms/powernv/vas-fault.c:172:27: error: 'IRQ_WAKE_THREAD' undeclared (first use in this function); did you mean 'RUSAGE_THREAD'?
     172 |         irqreturn_t ret = IRQ_WAKE_THREAD;
         |                           ^~~~~~~~~~~~~~~
         |                           RUSAGE_THREAD
   arch/powerpc/platforms/powernv/vas-fault.c:186:23: error: 'IRQ_HANDLED' undeclared (first use in this function); did you mean 'IRQS_ENABLED'?
     186 |                 ret = IRQ_HANDLED;
         |                       ^~~~~~~~~~~
         |                       IRQS_ENABLED
--
   drivers/crypto/nx/nx-common-powernv.c: In function 'nx_open_percpu_txwins':
>> drivers/crypto/nx/nx-common-powernv.c:718:27: error: implicit declaration of function 'cpu_to_chip_id' [-Werror=implicit-function-declaration]
     718 |                 chip_id = cpu_to_chip_id(i);
         |                           ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/cpu_to_chip_id +138 arch/powerpc/platforms/powernv/vas.c

0d17de03ce6a7a Haren Myneni        2020-04-15   49  
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28   50  static int init_vas_instance(struct platform_device *pdev)
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28   51  {
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28   52  	struct device_node *dn = pdev->dev.of_node;
c20e1e299d936c Haren Myneni        2020-04-15   53  	struct vas_instance *vinst;
c20e1e299d936c Haren Myneni        2020-04-15   54  	struct xive_irq_data *xd;
c20e1e299d936c Haren Myneni        2020-04-15   55  	uint32_t chipid, hwirq;
c20e1e299d936c Haren Myneni        2020-04-15   56  	struct resource *res;
c20e1e299d936c Haren Myneni        2020-04-15   57  	int rc, cpu, vasid;
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28   58  
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28   59  	rc = of_property_read_u32(dn, "ibm,vas-id", &vasid);
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28   60  	if (rc) {
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28   61  		pr_err("No ibm,vas-id property for %s?\n", pdev->name);
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28   62  		return -ENODEV;
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28   63  	}
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28   64  
c20e1e299d936c Haren Myneni        2020-04-15   65  	rc = of_property_read_u32(dn, "ibm,chip-id", &chipid);
c20e1e299d936c Haren Myneni        2020-04-15   66  	if (rc) {
c20e1e299d936c Haren Myneni        2020-04-15   67  		pr_err("No ibm,chip-id property for %s?\n", pdev->name);
c20e1e299d936c Haren Myneni        2020-04-15   68  		return -ENODEV;
c20e1e299d936c Haren Myneni        2020-04-15   69  	}
c20e1e299d936c Haren Myneni        2020-04-15   70  
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28   71  	if (pdev->num_resources != 4) {
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28   72  		pr_err("Unexpected DT configuration for [%s, %d]\n",
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28   73  				pdev->name, vasid);
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28   74  		return -ENODEV;
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28   75  	}
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28   76  
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28   77  	vinst = kzalloc(sizeof(*vinst), GFP_KERNEL);
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28   78  	if (!vinst)
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28   79  		return -ENOMEM;
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28   80  
9dd31b11370380 Cédric Le Goater    2020-12-12   81  	vinst->name = kasprintf(GFP_KERNEL, "vas-%d", vasid);
9dd31b11370380 Cédric Le Goater    2020-12-12   82  	if (!vinst->name) {
9dd31b11370380 Cédric Le Goater    2020-12-12   83  		kfree(vinst);
9dd31b11370380 Cédric Le Goater    2020-12-12   84  		return -ENOMEM;
9dd31b11370380 Cédric Le Goater    2020-12-12   85  	}
9dd31b11370380 Cédric Le Goater    2020-12-12   86  
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28   87  	INIT_LIST_HEAD(&vinst->node);
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28   88  	ida_init(&vinst->ida);
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28   89  	mutex_init(&vinst->mutex);
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28   90  	vinst->vas_id = vasid;
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28   91  	vinst->pdev = pdev;
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28   92  
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28   93  	res = &pdev->resource[0];
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28   94  	vinst->hvwc_bar_start = res->start;
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28   95  
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28   96  	res = &pdev->resource[1];
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28   97  	vinst->uwc_bar_start = res->start;
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28   98  
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28   99  	res = &pdev->resource[2];
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28  100  	vinst->paste_base_addr = res->start;
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28  101  
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28  102  	res = &pdev->resource[3];
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28  103  	if (res->end > 62) {
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28  104  		pr_err("Bad 'paste_win_id_shift' in DT, %llx\n", res->end);
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28  105  		goto free_vinst;
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28  106  	}
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28  107  
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28  108  	vinst->paste_win_id_shift = 63 - res->end;
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28  109  
c20e1e299d936c Haren Myneni        2020-04-15  110  	hwirq = xive_native_alloc_irq_on_chip(chipid);
c20e1e299d936c Haren Myneni        2020-04-15  111  	if (!hwirq) {
c20e1e299d936c Haren Myneni        2020-04-15  112  		pr_err("Inst%d: Unable to allocate global irq for chip %d\n",
c20e1e299d936c Haren Myneni        2020-04-15  113  				vinst->vas_id, chipid);
c20e1e299d936c Haren Myneni        2020-04-15  114  		return -ENOENT;
c20e1e299d936c Haren Myneni        2020-04-15  115  	}
c20e1e299d936c Haren Myneni        2020-04-15  116  
c20e1e299d936c Haren Myneni        2020-04-15  117  	vinst->virq = irq_create_mapping(NULL, hwirq);
c20e1e299d936c Haren Myneni        2020-04-15  118  	if (!vinst->virq) {
c20e1e299d936c Haren Myneni        2020-04-15  119  		pr_err("Inst%d: Unable to map global irq %d\n",
c20e1e299d936c Haren Myneni        2020-04-15  120  				vinst->vas_id, hwirq);
c20e1e299d936c Haren Myneni        2020-04-15  121  		return -EINVAL;
c20e1e299d936c Haren Myneni        2020-04-15  122  	}
c20e1e299d936c Haren Myneni        2020-04-15  123  
c20e1e299d936c Haren Myneni        2020-04-15  124  	xd = irq_get_handler_data(vinst->virq);
c20e1e299d936c Haren Myneni        2020-04-15  125  	if (!xd) {
c20e1e299d936c Haren Myneni        2020-04-15  126  		pr_err("Inst%d: Invalid virq %d\n",
c20e1e299d936c Haren Myneni        2020-04-15  127  				vinst->vas_id, vinst->virq);
c20e1e299d936c Haren Myneni        2020-04-15  128  		return -EINVAL;
c20e1e299d936c Haren Myneni        2020-04-15  129  	}
c20e1e299d936c Haren Myneni        2020-04-15  130  
c20e1e299d936c Haren Myneni        2020-04-15  131  	vinst->irq_port = xd->trig_page;
c20e1e299d936c Haren Myneni        2020-04-15  132  	pr_devel("Initialized instance [%s, %d] paste_base 0x%llx paste_win_id_shift 0x%llx IRQ %d Port 0x%llx\n",
c20e1e299d936c Haren Myneni        2020-04-15  133  			pdev->name, vasid, vinst->paste_base_addr,
c20e1e299d936c Haren Myneni        2020-04-15  134  			vinst->paste_win_id_shift, vinst->virq,
c20e1e299d936c Haren Myneni        2020-04-15  135  			vinst->irq_port);
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28  136  
ca03258b6b338b Sukadev Bhattiprolu 2017-11-07  137  	for_each_possible_cpu(cpu) {
ca03258b6b338b Sukadev Bhattiprolu 2017-11-07 @138  		if (cpu_to_chip_id(cpu) == of_get_ibm_chip_id(dn))
ca03258b6b338b Sukadev Bhattiprolu 2017-11-07  139  			per_cpu(cpu_vas_id, cpu) = vasid;
ca03258b6b338b Sukadev Bhattiprolu 2017-11-07  140  	}
ca03258b6b338b Sukadev Bhattiprolu 2017-11-07  141  
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28  142  	mutex_lock(&vas_mutex);
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28  143  	list_add(&vinst->node, &vas_instances);
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28  144  	mutex_unlock(&vas_mutex);
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28  145  
9774628acf8640 Haren Myneni        2020-04-15  146  	spin_lock_init(&vinst->fault_lock);
0d17de03ce6a7a Haren Myneni        2020-04-15  147  	/*
0d17de03ce6a7a Haren Myneni        2020-04-15  148  	 * IRQ and fault handling setup is needed only for user space
0d17de03ce6a7a Haren Myneni        2020-04-15  149  	 * send windows.
0d17de03ce6a7a Haren Myneni        2020-04-15  150  	 */
0d17de03ce6a7a Haren Myneni        2020-04-15  151  	if (vinst->virq) {
0d17de03ce6a7a Haren Myneni        2020-04-15  152  		rc = vas_irq_fault_window_setup(vinst);
0d17de03ce6a7a Haren Myneni        2020-04-15  153  		/*
0d17de03ce6a7a Haren Myneni        2020-04-15  154  		 * Fault window is used only for user space send windows.
0d17de03ce6a7a Haren Myneni        2020-04-15  155  		 * So if vinst->virq is NULL, tx_win_open returns -ENODEV
0d17de03ce6a7a Haren Myneni        2020-04-15  156  		 * for user space.
0d17de03ce6a7a Haren Myneni        2020-04-15  157  		 */
0d17de03ce6a7a Haren Myneni        2020-04-15  158  		if (rc)
0d17de03ce6a7a Haren Myneni        2020-04-15  159  			vinst->virq = 0;
0d17de03ce6a7a Haren Myneni        2020-04-15  160  	}
0d17de03ce6a7a Haren Myneni        2020-04-15  161  
ece4e51291485b Sukadev Bhattiprolu 2017-11-07  162  	vas_instance_init_dbgdir(vinst);
ece4e51291485b Sukadev Bhattiprolu 2017-11-07  163  
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28  164  	dev_set_drvdata(&pdev->dev, vinst);
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28  165  
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28  166  	return 0;
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28  167  
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28  168  free_vinst:
9dd31b11370380 Cédric Le Goater    2020-12-12  169  	kfree(vinst->name);
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28  170  	kfree(vinst);
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28  171  	return -ENODEV;
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28  172  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
