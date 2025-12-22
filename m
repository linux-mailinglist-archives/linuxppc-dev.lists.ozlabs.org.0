Return-Path: <linuxppc-dev+bounces-14945-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA2BCD7712
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Dec 2025 00:14:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dZv94048vz2xpt;
	Tue, 23 Dec 2025 10:14:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766445255;
	cv=none; b=Exor1kvxRlx4H9HL+OE0ZSxB7ZgWO52Ad1uLtYjP8fur82yTv/afQwxWboYtOeEbUbjTF28M9kdTshu8N49UAfur5uhhWZgtp8ihnF1Q6YOuNOspusXVjNll03XdWWv5kfqyyB47BNl4HFye2cNN0QPPztNchQuDH/3EEe0h2PhjhG4X0DWmcaWgDuF32qj7BlEJM8ofO3BN1sD6LLm9Ip6Mwn3afveEoyDcrq6E7kXWeQaU3TCo5Nk3NwNW6yvKt8fYzBBWwPX8Uw19pv22dLfRomAvqDP7GP2M+BEjXyokVIMClpqshly2eAtwR3FV/cE22HD/ISjGlFHSXOEDmg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766445255; c=relaxed/relaxed;
	bh=Y0ZZoSXVtX1HrexqarCXm1FjtdkS4Qqx4v8kdPwf6EQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NUhV6A4XmfscOm5XHKy0qo23QTD335Ho55a7YdL6ROeBl8PkgEMhJmKm39jQKK1O3NsSnSGTYCxHJJkk/qR3jKVHbHspMBlI9cqTrQEz+ilMq69/ihgb0K4fioWIksfL293tkH1769N9PFIQATWSo6BAnl7YJ4AgE7U10aMBa3KPj3j1nnhvKj6FuG8ZVSjKCCFGdUzpVz0XR855vnOElgRwEEIRFbQHHaxBp2NBORAg+D4UxE0I7VQkzC/WXmAozvkLKLJpEHYdNoFKW2WeaO6TvDzf55ovUm38FSF9wtBV2KHdq+p5QvvLcItf/sjFoFWa2bAQmISQWQAFGfHlGQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kUzQHZJ+; dkim-atps=neutral; spf=pass (client-ip=198.175.65.18; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kUzQHZJ+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.18; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dZv910Zlxz2x99
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Dec 2025 10:14:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766445254; x=1797981254;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CofqaZWpWt13T0GU5qVJ52+r9Y4zfBJTIBkhxK+Tvx8=;
  b=kUzQHZJ+i/URETnJiGGBKmI2dSysYNS5aM9bbS/Hd1RKxVAoNxEJ07Xt
   W+FvwYN6g19KrwpCbQEcIyj0sXwwspLLRfZ1uEmvf7MYc3FS5iGxK77Zs
   nlyoq3KbCOF9g5Vmqhr85Ppp0ugZteXRrQdK1Tm5NoFJnQ0n1ruaUQOl4
   n3xIUmb8he0btVTi/UF1/Db3Hd12rniVeYtqmWHIeiuNggzrTe9SudkYC
   Kzr7g2IbCUWCc4GMxrhXTJdNi9OnltGQQU/7iP63qmjtdVSPL/sLqaaKz
   mZo66np+AY4Nq6vqVW1lj68dplxRnKc2rGOREsS1XNMA2P/Ver50H/0ql
   Q==;
X-CSE-ConnectionGUID: 12e2Xi+4RT2JhgSPPG8QPw==
X-CSE-MsgGUID: OGYf5JyATYmUSnGBQ7xPIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="68344673"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="68344673"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 15:14:08 -0800
X-CSE-ConnectionGUID: 36XJ39oGS0WN/EcZsFa2sA==
X-CSE-MsgGUID: oBqDUO0gShKaVn6QWwowDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="199404456"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 22 Dec 2025 15:14:03 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXp67-000000001Cj-2Ac3;
	Mon, 22 Dec 2025 23:13:54 +0000
Date: Tue, 23 Dec 2025 07:13:19 +0800
From: kernel test robot <lkp@intel.com>
To: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>, ioana.ciornei@nxp.com
Cc: oe-kbuild-all@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>,
	Dan Carpenter <error27@gmail.com>, Su Hui <suhui@nfschina.com>
Subject: Re: [PATCH] bus: fsl-mc: fix an error handling in fsl_mc_device_add()
Message-ID: <202512230653.PaZGjmCW-lkp@intel.com>
References: <20251222074958.992911-1-lihaoxiang@isrc.iscas.ac.cn>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222074958.992911-1-lihaoxiang@isrc.iscas.ac.cn>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Haoxiang,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.19-rc2 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Haoxiang-Li/bus-fsl-mc-fix-an-error-handling-in-fsl_mc_device_add/20251222-155324
base:   linus/master
patch link:    https://lore.kernel.org/r/20251222074958.992911-1-lihaoxiang%40isrc.iscas.ac.cn
patch subject: [PATCH] bus: fsl-mc: fix an error handling in fsl_mc_device_add()
config: arm-randconfig-004-20251223 (https://download.01.org/0day-ci/archive/20251223/202512230653.PaZGjmCW-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512230653.PaZGjmCW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512230653.PaZGjmCW-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/bus/fsl-mc/fsl-mc-bus.c: In function 'fsl_mc_device_add':
>> drivers/bus/fsl-mc/fsl-mc-bus.c:899:27: error: expected ';' before 'return'
      put_device(&mc_dev->dev)
                              ^
                              ;
      return error;
      ~~~~~~                   


vim +899 drivers/bus/fsl-mc/fsl-mc-bus.c

   778	
   779	/*
   780	 * Add a newly discovered fsl-mc device to be visible in Linux
   781	 */
   782	int fsl_mc_device_add(struct fsl_mc_obj_desc *obj_desc,
   783			      struct fsl_mc_io *mc_io,
   784			      struct device *parent_dev,
   785			      struct fsl_mc_device **new_mc_dev)
   786	{
   787		int error;
   788		struct fsl_mc_device *mc_dev = NULL;
   789		struct fsl_mc_bus *mc_bus = NULL;
   790		struct fsl_mc_device *parent_mc_dev;
   791	
   792		if (dev_is_fsl_mc(parent_dev))
   793			parent_mc_dev = to_fsl_mc_device(parent_dev);
   794		else
   795			parent_mc_dev = NULL;
   796	
   797		if (strcmp(obj_desc->type, "dprc") == 0) {
   798			/*
   799			 * Allocate an MC bus device object:
   800			 */
   801			mc_bus = kzalloc(sizeof(*mc_bus), GFP_KERNEL);
   802			if (!mc_bus)
   803				return -ENOMEM;
   804	
   805			mutex_init(&mc_bus->scan_mutex);
   806			mc_dev = &mc_bus->mc_dev;
   807		} else {
   808			/*
   809			 * Allocate a regular fsl_mc_device object:
   810			 */
   811			mc_dev = kzalloc(sizeof(*mc_dev), GFP_KERNEL);
   812			if (!mc_dev)
   813				return -ENOMEM;
   814		}
   815	
   816		mc_dev->obj_desc = *obj_desc;
   817		mc_dev->mc_io = mc_io;
   818		device_initialize(&mc_dev->dev);
   819		mc_dev->dev.parent = parent_dev;
   820		mc_dev->dev.bus = &fsl_mc_bus_type;
   821		mc_dev->dev.release = fsl_mc_device_release;
   822		mc_dev->dev.type = fsl_mc_get_device_type(obj_desc->type);
   823		if (!mc_dev->dev.type) {
   824			error = -ENODEV;
   825			dev_err(parent_dev, "unknown device type %s\n", obj_desc->type);
   826			goto error_cleanup_dev;
   827		}
   828		dev_set_name(&mc_dev->dev, "%s.%d", obj_desc->type, obj_desc->id);
   829	
   830		if (strcmp(obj_desc->type, "dprc") == 0) {
   831			struct fsl_mc_io *mc_io2;
   832	
   833			mc_dev->flags |= FSL_MC_IS_DPRC;
   834	
   835			/*
   836			 * To get the DPRC's ICID, we need to open the DPRC
   837			 * in get_dprc_icid(). For child DPRCs, we do so using the
   838			 * parent DPRC's MC portal instead of the child DPRC's MC
   839			 * portal, in case the child DPRC is already opened with
   840			 * its own portal (e.g., the DPRC used by AIOP).
   841			 *
   842			 * NOTE: There cannot be more than one active open for a
   843			 * given MC object, using the same MC portal.
   844			 */
   845			if (parent_mc_dev) {
   846				/*
   847				 * device being added is a child DPRC device
   848				 */
   849				mc_io2 = parent_mc_dev->mc_io;
   850			} else {
   851				/*
   852				 * device being added is the root DPRC device
   853				 */
   854				if (!mc_io) {
   855					error = -EINVAL;
   856					goto error_cleanup_dev;
   857				}
   858	
   859				mc_io2 = mc_io;
   860			}
   861	
   862			error = get_dprc_icid(mc_io2, obj_desc->id, &mc_dev->icid);
   863			if (error < 0)
   864				goto error_cleanup_dev;
   865		} else {
   866			/*
   867			 * A non-DPRC object has to be a child of a DPRC, use the
   868			 * parent's ICID and interrupt domain.
   869			 */
   870			mc_dev->icid = parent_mc_dev->icid;
   871			mc_dev->dma_mask = FSL_MC_DEFAULT_DMA_MASK;
   872			mc_dev->dev.dma_mask = &mc_dev->dma_mask;
   873			mc_dev->dev.coherent_dma_mask = mc_dev->dma_mask;
   874			dev_set_msi_domain(&mc_dev->dev,
   875					   dev_get_msi_domain(&parent_mc_dev->dev));
   876		}
   877	
   878		/*
   879		 * Get MMIO regions for the device from the MC:
   880		 *
   881		 * NOTE: the root DPRC is a special case as its MMIO region is
   882		 * obtained from the device tree
   883		 */
   884		if (parent_mc_dev && obj_desc->region_count != 0) {
   885			error = fsl_mc_device_get_mmio_regions(mc_dev,
   886							       parent_mc_dev);
   887			if (error < 0)
   888				goto error_cleanup_dev;
   889		}
   890	
   891		/*
   892		 * The device-specific probe callback will get invoked by device_add()
   893		 */
   894		error = device_add(&mc_dev->dev);
   895		if (error < 0) {
   896			dev_err(parent_dev,
   897				"device_add() failed for device %s: %d\n",
   898				dev_name(&mc_dev->dev), error);
 > 899			put_device(&mc_dev->dev)
   900			return error;
   901		}
   902	
   903		dev_dbg(parent_dev, "added %s\n", dev_name(&mc_dev->dev));
   904	
   905		*new_mc_dev = mc_dev;
   906		return 0;
   907	
   908	error_cleanup_dev:
   909		kfree(mc_dev->regions);
   910		if (mc_bus)
   911			kfree(mc_bus);
   912		else
   913			kfree(mc_dev);
   914	
   915		return error;
   916	}
   917	EXPORT_SYMBOL_GPL(fsl_mc_device_add);
   918	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

