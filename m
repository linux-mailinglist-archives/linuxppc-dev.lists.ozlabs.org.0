Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AD70F7AC617
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Sep 2023 03:20:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RuI1eeeo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RtSqM4YR4z3cbv
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Sep 2023 11:20:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RuI1eeeo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RtSpS2lJWz3bWW
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Sep 2023 11:19:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695518368; x=1727054368;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=qwbdzZ9YZc4PEwm2scK07yVZxE/6WeEX40p1ME2mjec=;
  b=RuI1eeeoGGIBeAhGf/biJTAIqxQNg4wwrOO1caWxG91r/mPElWKIyI/8
   24pAENvexRvKer/Z9qxCSsN0rk2RCAdsYlJw40jLqDPyYS26ILCemvFfS
   G2yDhWUxkSdCi1uKcZOFwuLM+4HGxy63YOD+RQvNyc7NOSdCnMV7Efijr
   edl1yzpFKG0SsdjYBo2/HGNtaBnRB2n2JPvWitP0sSJ+JsW91WwwZbxQ0
   llNHaI0ZHSPsPMccYlI/VdMvDnaid5VgRT9LyECzzcA9Q709gcyYBNtUr
   lIJwVTr/wZJcq2tTqHRE78zAPjJcLJ0FOLU+dLe3pIVonBGvMWcYG0Il9
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="361317426"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="361317426"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2023 18:19:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="994958657"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="994958657"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 23 Sep 2023 18:19:18 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkDmG-00034f-09;
	Sun, 24 Sep 2023 01:19:16 +0000
Date: Sun, 24 Sep 2023 09:18:20 +0800
From: kernel test robot <lkp@intel.com>
To: Yuanjun Gong <ruc_gongyuanjun@163.com>, tyreld@linux.ibm.com
Subject: Re: [PATCH v2 1/1] powerpc: fix a memory leak
Message-ID: <202309240954.1H3G2rpy-lkp@intel.com>
References: <20230915020559.3396566-1-ruc_gongyuanjun@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230915020559.3396566-1-ruc_gongyuanjun@163.com>
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
Cc: linux-kernel@vger.kernel.org, npiggin@gmail.com, Yuanjun Gong <ruc_gongyuanjun@163.com>, oe-kbuild-all@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Yuanjun,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.6-rc2 next-20230921]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yuanjun-Gong/powerpc-fix-a-memory-leak/20230915-100832
base:   linus/master
patch link:    https://lore.kernel.org/r/20230915020559.3396566-1-ruc_gongyuanjun%40163.com
patch subject: [PATCH v2 1/1] powerpc: fix a memory leak
config: powerpc-powernv_defconfig (https://download.01.org/0day-ci/archive/20230924/202309240954.1H3G2rpy-lkp@intel.com/config)
compiler: powerpc64le-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230924/202309240954.1H3G2rpy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309240954.1H3G2rpy-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/powerpc/platforms/powernv/vas.c: In function 'init_vas_instance':
>> arch/powerpc/platforms/powernv/vas.c:106:17: error: expected ';' before 'goto'
     106 |                 goto free_vinst;
         |                 ^~~~


vim +106 arch/powerpc/platforms/powernv/vas.c

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
1e5daa4a4c0658 Yuanjun Gong        2023-09-15  105  		rc = -ENODEV
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28 @106  		goto free_vinst;
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28  107  	}
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28  108  
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28  109  	vinst->paste_win_id_shift = 63 - res->end;
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28  110  
c20e1e299d936c Haren Myneni        2020-04-15  111  	hwirq = xive_native_alloc_irq_on_chip(chipid);
c20e1e299d936c Haren Myneni        2020-04-15  112  	if (!hwirq) {
c20e1e299d936c Haren Myneni        2020-04-15  113  		pr_err("Inst%d: Unable to allocate global irq for chip %d\n",
c20e1e299d936c Haren Myneni        2020-04-15  114  				vinst->vas_id, chipid);
1e5daa4a4c0658 Yuanjun Gong        2023-09-15  115  		rc = -ENOENT;
1e5daa4a4c0658 Yuanjun Gong        2023-09-15  116  		goto free_vinst;
c20e1e299d936c Haren Myneni        2020-04-15  117  	}
c20e1e299d936c Haren Myneni        2020-04-15  118  
c20e1e299d936c Haren Myneni        2020-04-15  119  	vinst->virq = irq_create_mapping(NULL, hwirq);
c20e1e299d936c Haren Myneni        2020-04-15  120  	if (!vinst->virq) {
c20e1e299d936c Haren Myneni        2020-04-15  121  		pr_err("Inst%d: Unable to map global irq %d\n",
c20e1e299d936c Haren Myneni        2020-04-15  122  				vinst->vas_id, hwirq);
1e5daa4a4c0658 Yuanjun Gong        2023-09-15  123  		rc = -EINVAL;
1e5daa4a4c0658 Yuanjun Gong        2023-09-15  124  		goto free_vinst;
c20e1e299d936c Haren Myneni        2020-04-15  125  	}
c20e1e299d936c Haren Myneni        2020-04-15  126  
c20e1e299d936c Haren Myneni        2020-04-15  127  	xd = irq_get_handler_data(vinst->virq);
c20e1e299d936c Haren Myneni        2020-04-15  128  	if (!xd) {
c20e1e299d936c Haren Myneni        2020-04-15  129  		pr_err("Inst%d: Invalid virq %d\n",
c20e1e299d936c Haren Myneni        2020-04-15  130  				vinst->vas_id, vinst->virq);
1e5daa4a4c0658 Yuanjun Gong        2023-09-15  131  		rc = -EINVAL;
1e5daa4a4c0658 Yuanjun Gong        2023-09-15  132  		goto free_vinst;
c20e1e299d936c Haren Myneni        2020-04-15  133  	}
c20e1e299d936c Haren Myneni        2020-04-15  134  
c20e1e299d936c Haren Myneni        2020-04-15  135  	vinst->irq_port = xd->trig_page;
c20e1e299d936c Haren Myneni        2020-04-15  136  	pr_devel("Initialized instance [%s, %d] paste_base 0x%llx paste_win_id_shift 0x%llx IRQ %d Port 0x%llx\n",
c20e1e299d936c Haren Myneni        2020-04-15  137  			pdev->name, vasid, vinst->paste_base_addr,
c20e1e299d936c Haren Myneni        2020-04-15  138  			vinst->paste_win_id_shift, vinst->virq,
c20e1e299d936c Haren Myneni        2020-04-15  139  			vinst->irq_port);
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28  140  
ca03258b6b338b Sukadev Bhattiprolu 2017-11-07  141  	for_each_possible_cpu(cpu) {
ca03258b6b338b Sukadev Bhattiprolu 2017-11-07  142  		if (cpu_to_chip_id(cpu) == of_get_ibm_chip_id(dn))
ca03258b6b338b Sukadev Bhattiprolu 2017-11-07  143  			per_cpu(cpu_vas_id, cpu) = vasid;
ca03258b6b338b Sukadev Bhattiprolu 2017-11-07  144  	}
ca03258b6b338b Sukadev Bhattiprolu 2017-11-07  145  
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28  146  	mutex_lock(&vas_mutex);
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28  147  	list_add(&vinst->node, &vas_instances);
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28  148  	mutex_unlock(&vas_mutex);
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28  149  
9774628acf8640 Haren Myneni        2020-04-15  150  	spin_lock_init(&vinst->fault_lock);
0d17de03ce6a7a Haren Myneni        2020-04-15  151  	/*
0d17de03ce6a7a Haren Myneni        2020-04-15  152  	 * IRQ and fault handling setup is needed only for user space
0d17de03ce6a7a Haren Myneni        2020-04-15  153  	 * send windows.
0d17de03ce6a7a Haren Myneni        2020-04-15  154  	 */
0d17de03ce6a7a Haren Myneni        2020-04-15  155  	if (vinst->virq) {
0d17de03ce6a7a Haren Myneni        2020-04-15  156  		rc = vas_irq_fault_window_setup(vinst);
0d17de03ce6a7a Haren Myneni        2020-04-15  157  		/*
0d17de03ce6a7a Haren Myneni        2020-04-15  158  		 * Fault window is used only for user space send windows.
0d17de03ce6a7a Haren Myneni        2020-04-15  159  		 * So if vinst->virq is NULL, tx_win_open returns -ENODEV
0d17de03ce6a7a Haren Myneni        2020-04-15  160  		 * for user space.
0d17de03ce6a7a Haren Myneni        2020-04-15  161  		 */
0d17de03ce6a7a Haren Myneni        2020-04-15  162  		if (rc)
0d17de03ce6a7a Haren Myneni        2020-04-15  163  			vinst->virq = 0;
0d17de03ce6a7a Haren Myneni        2020-04-15  164  	}
0d17de03ce6a7a Haren Myneni        2020-04-15  165  
ece4e51291485b Sukadev Bhattiprolu 2017-11-07  166  	vas_instance_init_dbgdir(vinst);
ece4e51291485b Sukadev Bhattiprolu 2017-11-07  167  
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28  168  	dev_set_drvdata(&pdev->dev, vinst);
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28  169  
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28  170  	return 0;
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28  171  
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28  172  free_vinst:
9dd31b11370380 Cédric Le Goater    2020-12-12  173  	kfree(vinst->name);
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28  174  	kfree(vinst);
1e5daa4a4c0658 Yuanjun Gong        2023-09-15  175  	return rc;
4dea2d1a927c61 Sukadev Bhattiprolu 2017-08-28  176  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
