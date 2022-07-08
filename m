Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B233156BA97
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Jul 2022 15:24:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LfYsl4Lx0z3cS8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Jul 2022 23:24:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=id/hCxM5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mga05.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=id/hCxM5;
	dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LfYs34z8kz3c2H
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Jul 2022 23:24:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657286647; x=1688822647;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oYhBSaiW1UBg6AWLFa9PNoYfdaB2PrXd0fUmsivGyyY=;
  b=id/hCxM5sOUBaZyRLnpBT2NCJ1MDcftfzxb/TV19bq31NWxWfGf/+bug
   0a3Dta7maeuGejHy1fcatzg76wCwd9nnl6WAFELTrlzGREpI7dwV1C9el
   oV6BL1HTxEKGPzcIqDM+HigBaCanqzhtKypD5Mtqgk4Uy37M7B9rkjTC8
   0BwoHrdIvHB0N+nkE3jIrXNOHBeR/ZgI636ZJ72iiD5QPzQVSk0+wkY00
   1/x7Key0OG+EQ/vA1gwIZ9BLgx9BPhegI9jcX4aTjXtL0HPlL/MkljXDF
   oFh5lN2UNnIvSkF+hb9/G8usieHsJiKMBM0uCeEKKdz6IDTcN4rCnzNNC
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="370591722"
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; 
   d="scan'208";a="370591722"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2022 06:23:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; 
   d="scan'208";a="594118872"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 08 Jul 2022 06:23:50 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o9nxV-000NWE-Rw;
	Fri, 08 Jul 2022 13:23:49 +0000
Date: Fri, 8 Jul 2022 21:23:29 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>, deller@gmx.de,
	manoj@linux.ibm.com, mrochs@linux.ibm.com, ukrishn@linux.ibm.com,
	jejb@linux.ibm.com, martin.petersen@oracle.com, tzimmermann@suse.de
Subject: Re: [PATCH v3 3/4] powerpc: Remove asm/prom.h from asm/mpc52xx.h and
 asm/pci.h
Message-ID: <202207082135.sstYWd2x-lkp@intel.com>
References: <cf5243343e2364c2b40f22ee5ad9a6e2453d1121.1657264228.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cf5243343e2364c2b40f22ee5ad9a6e2453d1121.1657264228.git.christophe.leroy@csgroup.eu>
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
Cc: linux-fbdev@vger.kernel.org, kbuild-all@lists.01.org, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

I love your patch! Yet something to improve:

[auto build test ERROR on powerpc/next]
[also build test ERROR on mkp-scsi/for-next linus/master v5.19-rc5 next-20220708]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christophe-Leroy/video-fbdev-offb-Include-missing-linux-platform_device-h/20220708-151246
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
config: powerpc-randconfig-m031-20220708 (https://download.01.org/0day-ci/archive/20220708/202207082135.sstYWd2x-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/e04280406bcc48b3e940fdd770fa9a7c62185e02
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Christophe-Leroy/video-fbdev-offb-Include-missing-linux-platform_device-h/20220708-151246
        git checkout e04280406bcc48b3e940fdd770fa9a7c62185e02
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/edac/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/edac/mpc85xx_edac.c: In function 'mpc85xx_l2_err_probe':
>> drivers/edac/mpc85xx_edac.c:514:15: error: implicit declaration of function 'of_address_to_resource' [-Werror=implicit-function-declaration]
     514 |         res = of_address_to_resource(op->dev.of_node, 0, &r);
         |               ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/edac/mpc85xx_edac.c:559:30: error: implicit declaration of function 'irq_of_parse_and_map' [-Werror=implicit-function-declaration]
     559 |                 pdata->irq = irq_of_parse_and_map(op->dev.of_node, 0);
         |                              ^~~~~~~~~~~~~~~~~~~~
>> drivers/edac/mpc85xx_edac.c:566:25: error: implicit declaration of function 'irq_dispose_mapping' [-Werror=implicit-function-declaration]
     566 |                         irq_dispose_mapping(pdata->irq);
         |                         ^~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/of_address_to_resource +514 drivers/edac/mpc85xx_edac.c

a9a753d53204bf Dave Jiang         2008-02-07  488  
9b3c6e85c2cfa7 Greg Kroah-Hartman 2012-12-21  489  static int mpc85xx_l2_err_probe(struct platform_device *op)
a9a753d53204bf Dave Jiang         2008-02-07  490  {
a9a753d53204bf Dave Jiang         2008-02-07  491  	struct edac_device_ctl_info *edac_dev;
a9a753d53204bf Dave Jiang         2008-02-07  492  	struct mpc85xx_l2_pdata *pdata;
a9a753d53204bf Dave Jiang         2008-02-07  493  	struct resource r;
a9a753d53204bf Dave Jiang         2008-02-07  494  	int res;
a9a753d53204bf Dave Jiang         2008-02-07  495  
a9a753d53204bf Dave Jiang         2008-02-07  496  	if (!devres_open_group(&op->dev, mpc85xx_l2_err_probe, GFP_KERNEL))
a9a753d53204bf Dave Jiang         2008-02-07  497  		return -ENOMEM;
a9a753d53204bf Dave Jiang         2008-02-07  498  
a9a753d53204bf Dave Jiang         2008-02-07  499  	edac_dev = edac_device_alloc_ctl_info(sizeof(*pdata),
a9a753d53204bf Dave Jiang         2008-02-07  500  					      "cpu", 1, "L", 1, 2, NULL, 0,
a9a753d53204bf Dave Jiang         2008-02-07  501  					      edac_dev_idx);
a9a753d53204bf Dave Jiang         2008-02-07  502  	if (!edac_dev) {
a9a753d53204bf Dave Jiang         2008-02-07  503  		devres_release_group(&op->dev, mpc85xx_l2_err_probe);
a9a753d53204bf Dave Jiang         2008-02-07  504  		return -ENOMEM;
a9a753d53204bf Dave Jiang         2008-02-07  505  	}
a9a753d53204bf Dave Jiang         2008-02-07  506  
a9a753d53204bf Dave Jiang         2008-02-07  507  	pdata = edac_dev->pvt_info;
a9a753d53204bf Dave Jiang         2008-02-07  508  	pdata->name = "mpc85xx_l2_err";
a9a753d53204bf Dave Jiang         2008-02-07  509  	edac_dev->dev = &op->dev;
a9a753d53204bf Dave Jiang         2008-02-07  510  	dev_set_drvdata(edac_dev->dev, edac_dev);
a9a753d53204bf Dave Jiang         2008-02-07  511  	edac_dev->ctl_name = pdata->name;
a9a753d53204bf Dave Jiang         2008-02-07  512  	edac_dev->dev_name = pdata->name;
a9a753d53204bf Dave Jiang         2008-02-07  513  
a26f95fed31d91 Anatolij Gustschin 2010-06-03 @514  	res = of_address_to_resource(op->dev.of_node, 0, &r);
a9a753d53204bf Dave Jiang         2008-02-07  515  	if (res) {
88857ebe7116b0 York Sun           2016-08-09  516  		pr_err("%s: Unable to get resource for L2 err regs\n", __func__);
a9a753d53204bf Dave Jiang         2008-02-07  517  		goto err;
a9a753d53204bf Dave Jiang         2008-02-07  518  	}
a9a753d53204bf Dave Jiang         2008-02-07  519  
a9a753d53204bf Dave Jiang         2008-02-07  520  	/* we only need the error registers */
a9a753d53204bf Dave Jiang         2008-02-07  521  	r.start += 0xe00;
a9a753d53204bf Dave Jiang         2008-02-07  522  
28f65c11f2ffb3 Joe Perches        2011-06-09  523  	if (!devm_request_mem_region(&op->dev, r.start, resource_size(&r),
28f65c11f2ffb3 Joe Perches        2011-06-09  524  				     pdata->name)) {
88857ebe7116b0 York Sun           2016-08-09  525  		pr_err("%s: Error while requesting mem region\n", __func__);
a9a753d53204bf Dave Jiang         2008-02-07  526  		res = -EBUSY;
a9a753d53204bf Dave Jiang         2008-02-07  527  		goto err;
a9a753d53204bf Dave Jiang         2008-02-07  528  	}
a9a753d53204bf Dave Jiang         2008-02-07  529  
28f65c11f2ffb3 Joe Perches        2011-06-09  530  	pdata->l2_vbase = devm_ioremap(&op->dev, r.start, resource_size(&r));
a9a753d53204bf Dave Jiang         2008-02-07  531  	if (!pdata->l2_vbase) {
88857ebe7116b0 York Sun           2016-08-09  532  		pr_err("%s: Unable to setup L2 err regs\n", __func__);
a9a753d53204bf Dave Jiang         2008-02-07  533  		res = -ENOMEM;
a9a753d53204bf Dave Jiang         2008-02-07  534  		goto err;
a9a753d53204bf Dave Jiang         2008-02-07  535  	}
a9a753d53204bf Dave Jiang         2008-02-07  536  
a9a753d53204bf Dave Jiang         2008-02-07  537  	out_be32(pdata->l2_vbase + MPC85XX_L2_ERRDET, ~0);
a9a753d53204bf Dave Jiang         2008-02-07  538  
a9a753d53204bf Dave Jiang         2008-02-07  539  	orig_l2_err_disable = in_be32(pdata->l2_vbase + MPC85XX_L2_ERRDIS);
a9a753d53204bf Dave Jiang         2008-02-07  540  
a9a753d53204bf Dave Jiang         2008-02-07  541  	/* clear the err_dis */
a9a753d53204bf Dave Jiang         2008-02-07  542  	out_be32(pdata->l2_vbase + MPC85XX_L2_ERRDIS, 0);
a9a753d53204bf Dave Jiang         2008-02-07  543  
a9a753d53204bf Dave Jiang         2008-02-07  544  	edac_dev->mod_name = EDAC_MOD_STR;
a9a753d53204bf Dave Jiang         2008-02-07  545  
a9a753d53204bf Dave Jiang         2008-02-07  546  	if (edac_op_state == EDAC_OPSTATE_POLL)
a9a753d53204bf Dave Jiang         2008-02-07  547  		edac_dev->edac_check = mpc85xx_l2_check;
a9a753d53204bf Dave Jiang         2008-02-07  548  
a9a753d53204bf Dave Jiang         2008-02-07  549  	mpc85xx_set_l2_sysfs_attributes(edac_dev);
a9a753d53204bf Dave Jiang         2008-02-07  550  
a9a753d53204bf Dave Jiang         2008-02-07  551  	pdata->edac_idx = edac_dev_idx++;
a9a753d53204bf Dave Jiang         2008-02-07  552  
a9a753d53204bf Dave Jiang         2008-02-07  553  	if (edac_device_add_device(edac_dev) > 0) {
956b9ba156dbfd Joe Perches        2012-04-29  554  		edac_dbg(3, "failed edac_device_add_device()\n");
a9a753d53204bf Dave Jiang         2008-02-07  555  		goto err;
a9a753d53204bf Dave Jiang         2008-02-07  556  	}
a9a753d53204bf Dave Jiang         2008-02-07  557  
a9a753d53204bf Dave Jiang         2008-02-07  558  	if (edac_op_state == EDAC_OPSTATE_INT) {
a26f95fed31d91 Anatolij Gustschin 2010-06-03 @559  		pdata->irq = irq_of_parse_and_map(op->dev.of_node, 0);
a9a753d53204bf Dave Jiang         2008-02-07  560  		res = devm_request_irq(&op->dev, pdata->irq,
a18c3f16a907b8 Borislav Petkov    2014-09-30  561  				       mpc85xx_l2_isr, IRQF_SHARED,
a9a753d53204bf Dave Jiang         2008-02-07  562  				       "[EDAC] L2 err", edac_dev);
a9a753d53204bf Dave Jiang         2008-02-07  563  		if (res < 0) {
88857ebe7116b0 York Sun           2016-08-09  564  			pr_err("%s: Unable to request irq %d for MPC85xx L2 err\n",
88857ebe7116b0 York Sun           2016-08-09  565  				__func__, pdata->irq);
a9a753d53204bf Dave Jiang         2008-02-07 @566  			irq_dispose_mapping(pdata->irq);
a9a753d53204bf Dave Jiang         2008-02-07  567  			res = -ENODEV;
a9a753d53204bf Dave Jiang         2008-02-07  568  			goto err2;
a9a753d53204bf Dave Jiang         2008-02-07  569  		}
a9a753d53204bf Dave Jiang         2008-02-07  570  
88857ebe7116b0 York Sun           2016-08-09  571  		pr_info(EDAC_MOD_STR " acquired irq %d for L2 Err\n", pdata->irq);
a9a753d53204bf Dave Jiang         2008-02-07  572  
a9a753d53204bf Dave Jiang         2008-02-07  573  		edac_dev->op_state = OP_RUNNING_INTERRUPT;
a9a753d53204bf Dave Jiang         2008-02-07  574  
a9a753d53204bf Dave Jiang         2008-02-07  575  		out_be32(pdata->l2_vbase + MPC85XX_L2_ERRINTEN, L2_EIE_MASK);
a9a753d53204bf Dave Jiang         2008-02-07  576  	}
a9a753d53204bf Dave Jiang         2008-02-07  577  
a9a753d53204bf Dave Jiang         2008-02-07  578  	devres_remove_group(&op->dev, mpc85xx_l2_err_probe);
a9a753d53204bf Dave Jiang         2008-02-07  579  
956b9ba156dbfd Joe Perches        2012-04-29  580  	edac_dbg(3, "success\n");
88857ebe7116b0 York Sun           2016-08-09  581  	pr_info(EDAC_MOD_STR " L2 err registered\n");
a9a753d53204bf Dave Jiang         2008-02-07  582  
a9a753d53204bf Dave Jiang         2008-02-07  583  	return 0;
a9a753d53204bf Dave Jiang         2008-02-07  584  
a9a753d53204bf Dave Jiang         2008-02-07  585  err2:
a9a753d53204bf Dave Jiang         2008-02-07  586  	edac_device_del_device(&op->dev);
a9a753d53204bf Dave Jiang         2008-02-07  587  err:
a9a753d53204bf Dave Jiang         2008-02-07  588  	devres_release_group(&op->dev, mpc85xx_l2_err_probe);
a9a753d53204bf Dave Jiang         2008-02-07  589  	edac_device_free_ctl_info(edac_dev);
a9a753d53204bf Dave Jiang         2008-02-07  590  	return res;
a9a753d53204bf Dave Jiang         2008-02-07  591  }
a9a753d53204bf Dave Jiang         2008-02-07  592  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
