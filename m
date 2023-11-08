Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4927E529E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Nov 2023 10:25:21 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PvduQcNu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SQKSH4TGHz3cTT
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Nov 2023 20:25:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PvduQcNu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SQKRQ4MhFz30MQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Nov 2023 20:24:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699435474; x=1730971474;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+ozbvOh9QgkXzArne3BozOuyXZ3IFbp01ExHHqvSLCA=;
  b=PvduQcNuIyqAxhzuMsozCDDfFLNy23MSVcIz3WOxrNplR0KlcTaDYgVr
   +7jsASNpxzEzDCNH9sWHec0WDZIDO+Dh68NNNW/utz9IqzG6QcGTsHnfZ
   IpK531R7W5SdbgwXTPOjTt5Dq4LFldX8K37zw+fsexIghQowaV1ljUugp
   ezwGq/iLaMSbipdywK2AdquZLXL68ptCvN/qWoX4iY0Cr9BtVf9XKwW91
   XQahSeyr9+8N0P4LFjnRPAdQzIU0Gr+Ljj5d0zQo+JmGDeOg/ilXgNNef
   gFu6HrokrUCnoou3bGVCSOufu0U6JIVFj7AQB/Cf2qhlFpAIHmFhNQT5d
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="389534239"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="389534239"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2023 01:24:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="880142456"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="880142456"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 08 Nov 2023 01:24:25 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0enP-0007qe-1V;
	Wed, 08 Nov 2023 09:24:23 +0000
Date: Wed, 8 Nov 2023 17:24:04 +0800
From: kernel test robot <lkp@intel.com>
To: Yuanjun Gong <ruc_gongyuanjun@163.com>, tyreld@linux.ibm.com
Subject: Re: [PATCH v2 1/1] powerpc: fix a memory leak
Message-ID: <202311081645.j68Cla77-lkp@intel.com>
References: <20230915020559.3396566-1-ruc_gongyuanjun@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, Yuanjun Gong <ruc_gongyuanjun@163.com>, npiggin@gmail.com, oe-kbuild-all@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Yuanjun,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.6 next-20231108]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yuanjun-Gong/powerpc-fix-a-memory-leak/20230915-100832
base:   linus/master
patch link:    https://lore.kernel.org/r/20230915020559.3396566-1-ruc_gongyuanjun%40163.com
patch subject: [PATCH v2 1/1] powerpc: fix a memory leak
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20231108/202311081645.j68Cla77-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231108/202311081645.j68Cla77-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311081645.j68Cla77-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/powerpc/platforms/powernv/vas.c:105:15: error: expected ';' after expression
     105 |                 rc = -ENODEV
         |                             ^
         |                             ;
   1 error generated.


vim +105 arch/powerpc/platforms/powernv/vas.c

    49	
    50	static int init_vas_instance(struct platform_device *pdev)
    51	{
    52		struct device_node *dn = pdev->dev.of_node;
    53		struct vas_instance *vinst;
    54		struct xive_irq_data *xd;
    55		uint32_t chipid, hwirq;
    56		struct resource *res;
    57		int rc, cpu, vasid;
    58	
    59		rc = of_property_read_u32(dn, "ibm,vas-id", &vasid);
    60		if (rc) {
    61			pr_err("No ibm,vas-id property for %s?\n", pdev->name);
    62			return -ENODEV;
    63		}
    64	
    65		rc = of_property_read_u32(dn, "ibm,chip-id", &chipid);
    66		if (rc) {
    67			pr_err("No ibm,chip-id property for %s?\n", pdev->name);
    68			return -ENODEV;
    69		}
    70	
    71		if (pdev->num_resources != 4) {
    72			pr_err("Unexpected DT configuration for [%s, %d]\n",
    73					pdev->name, vasid);
    74			return -ENODEV;
    75		}
    76	
    77		vinst = kzalloc(sizeof(*vinst), GFP_KERNEL);
    78		if (!vinst)
    79			return -ENOMEM;
    80	
    81		vinst->name = kasprintf(GFP_KERNEL, "vas-%d", vasid);
    82		if (!vinst->name) {
    83			kfree(vinst);
    84			return -ENOMEM;
    85		}
    86	
    87		INIT_LIST_HEAD(&vinst->node);
    88		ida_init(&vinst->ida);
    89		mutex_init(&vinst->mutex);
    90		vinst->vas_id = vasid;
    91		vinst->pdev = pdev;
    92	
    93		res = &pdev->resource[0];
    94		vinst->hvwc_bar_start = res->start;
    95	
    96		res = &pdev->resource[1];
    97		vinst->uwc_bar_start = res->start;
    98	
    99		res = &pdev->resource[2];
   100		vinst->paste_base_addr = res->start;
   101	
   102		res = &pdev->resource[3];
   103		if (res->end > 62) {
   104			pr_err("Bad 'paste_win_id_shift' in DT, %llx\n", res->end);
 > 105			rc = -ENODEV
   106			goto free_vinst;
   107		}
   108	
   109		vinst->paste_win_id_shift = 63 - res->end;
   110	
   111		hwirq = xive_native_alloc_irq_on_chip(chipid);
   112		if (!hwirq) {
   113			pr_err("Inst%d: Unable to allocate global irq for chip %d\n",
   114					vinst->vas_id, chipid);
   115			rc = -ENOENT;
   116			goto free_vinst;
   117		}
   118	
   119		vinst->virq = irq_create_mapping(NULL, hwirq);
   120		if (!vinst->virq) {
   121			pr_err("Inst%d: Unable to map global irq %d\n",
   122					vinst->vas_id, hwirq);
   123			rc = -EINVAL;
   124			goto free_vinst;
   125		}
   126	
   127		xd = irq_get_handler_data(vinst->virq);
   128		if (!xd) {
   129			pr_err("Inst%d: Invalid virq %d\n",
   130					vinst->vas_id, vinst->virq);
   131			rc = -EINVAL;
   132			goto free_vinst;
   133		}
   134	
   135		vinst->irq_port = xd->trig_page;
   136		pr_devel("Initialized instance [%s, %d] paste_base 0x%llx paste_win_id_shift 0x%llx IRQ %d Port 0x%llx\n",
   137				pdev->name, vasid, vinst->paste_base_addr,
   138				vinst->paste_win_id_shift, vinst->virq,
   139				vinst->irq_port);
   140	
   141		for_each_possible_cpu(cpu) {
   142			if (cpu_to_chip_id(cpu) == of_get_ibm_chip_id(dn))
   143				per_cpu(cpu_vas_id, cpu) = vasid;
   144		}
   145	
   146		mutex_lock(&vas_mutex);
   147		list_add(&vinst->node, &vas_instances);
   148		mutex_unlock(&vas_mutex);
   149	
   150		spin_lock_init(&vinst->fault_lock);
   151		/*
   152		 * IRQ and fault handling setup is needed only for user space
   153		 * send windows.
   154		 */
   155		if (vinst->virq) {
   156			rc = vas_irq_fault_window_setup(vinst);
   157			/*
   158			 * Fault window is used only for user space send windows.
   159			 * So if vinst->virq is NULL, tx_win_open returns -ENODEV
   160			 * for user space.
   161			 */
   162			if (rc)
   163				vinst->virq = 0;
   164		}
   165	
   166		vas_instance_init_dbgdir(vinst);
   167	
   168		dev_set_drvdata(&pdev->dev, vinst);
   169	
   170		return 0;
   171	
   172	free_vinst:
   173		kfree(vinst->name);
   174		kfree(vinst);
   175		return rc;
   176	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
