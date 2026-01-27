Return-Path: <linuxppc-dev+bounces-16313-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yAEcFSuZeGkWrQEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16313-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jan 2026 11:53:31 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D7F93331
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jan 2026 11:53:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f0j1g4vkjz309N;
	Tue, 27 Jan 2026 21:53:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769511207;
	cv=none; b=oylac2GeCAGWVDgesqZA+B51+RRiX/X7BMqvC1xIosMciq7E6F2jGq6t3knHBguP2oxSah3zXB2aiEc36X/E+mnoQAqGwJCoTYTSwx0vxj3H/DRUR8/p89lPbO7wdbDILZ5sObLrUByYWFDPRVoiIYTnd36DYOt5I3xa42uWbs5VxYueQndQn7TbOtbmBeUBduLaymW0Low2jF+s/osOEIbsd3Ib+LK23yoXvpPrgpMwaq5M3KfRKMw3FzweJW/rJA3zSWaydcCyo40DK4XaA11i9qKDUTZZOybfUQFUyHDgunFDqHWGEivauex2obrAP5b6eZe9k7AMT5JePog2vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769511207; c=relaxed/relaxed;
	bh=5Zz3Wvw2skGp1+4xP3UWjyn0FpYnUP/vHGLhsQfqFHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I3aqivV8GMw4jALA435KjSUmkUBnO+Bs/khS6W0lIdx6qx5+ryKNswpkEUf9cma8AoolXkMehEHCzXT6D2jw0z0KDY+/Hs1ORUr3HlLqbudF/wwfqGDpyFv+HmE6icEAEAH690VFOkVA7TarE30hXHhmF4GqwNCrXXYXpRw1+FdTLWj2N4+e5OKMJzf/5/lC6O5Ubwpb1ZEFSXk+rtxn70a43ddEDJ2ZlFkMELEJxPo722lXMZp8rg5BwbTlcE/g7tvK2GDqHsLsFh92SW6vElkzu5O2oIID/p8g8rIp7pHhVL9mPMz9GveFbXgB0NUxrhxix7vVrUlPVbFwWBBsPw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nNDZl+TU; dkim-atps=neutral; spf=pass (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nNDZl+TU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f0j1d0fyQz2xjP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jan 2026 21:53:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769511205; x=1801047205;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5JVIknwk5gyxKcnzOslVb7nY28N3YTAZLF4V1LuATPs=;
  b=nNDZl+TUJcbWzxH1XUYCF+0wrSiKYDJeGUt4BUzwcYUBlPIW1Mn+kw/Z
   SdqmLe9uvi8C/HHMA6Yhx8NBmQGiFiQtQnQIwkMOxS0+TRTOHfW4UnYMn
   zI43Y5wgNQpSsT4GRbIN4z0C7L/uTzxZ+woGI/R6Ckl1TOUezuSIH5Q1O
   IDCKChL+n3Sa1ktl3aSnQExW5nfR7XPN7s74mUAHlcXj7MdDgHUB9v9Vh
   BCcgo24gePPdUjdPK8CZO0cTICj/wCXf9iN4iHPfZ5zVLpuLdV3td0OSV
   YREblh3m75f9P2U8raHvljFDythYwySq7p2NHzrZht9UGyzK2GwgfL11A
   g==;
X-CSE-ConnectionGUID: vvi3sgLcTYWBL59f4WFgdA==
X-CSE-MsgGUID: XJEjsvnfR7a5v60eyadmOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="96167230"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="96167230"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 02:53:21 -0800
X-CSE-ConnectionGUID: Wq+eU3UVTW+G0hcvS3CrrA==
X-CSE-MsgGUID: uJpKnxgYQ4e4CIXFaVV5NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="208376105"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 27 Jan 2026 02:53:19 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkghB-00000000YNk-2m22;
	Tue, 27 Jan 2026 10:53:17 +0000
Date: Tue, 27 Jan 2026 18:53:12 +0800
From: kernel test robot <lkp@intel.com>
To: wenxiong@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: oe-kbuild-all@lists.linux.dev, maddy@linux.ibm.com, haren@linux.ibm.com,
	tyreld@linux.ibm.com, Wen Xiong <wenxiong@linux.ibm.com>
Subject: Re: [PATCH] error path improvement in dlpar add
Message-ID: <202601271817.2ldcFxjL-lkp@intel.com>
References: <20260127021845.2326-1-wenxiong@linux.ibm.com>
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
In-Reply-To: <20260127021845.2326-1-wenxiong@linux.ibm.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-16313-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:wenxiong@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:oe-kbuild-all@lists.linux.dev,m:maddy@linux.ibm.com,m:haren@linux.ibm.com,m:tyreld@linux.ibm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[lkp@intel.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,intel.com:email,intel.com:dkim,intel.com:mid,01.org:url]
X-Rspamd-Queue-Id: 10D7F93331
X-Rspamd-Action: no action

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/next]
[also build test WARNING on powerpc/fixes linus/master v6.19-rc7 next-20260126]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/wenxiong-linux-ibm-com/error-path-improvement-in-dlpar-add/20260127-121714
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20260127021845.2326-1-wenxiong%40linux.ibm.com
patch subject: [PATCH] error path improvement in dlpar add
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20260127/202601271817.2ldcFxjL-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601271817.2ldcFxjL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601271817.2ldcFxjL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/powerpc/kernel/pci-hotplug.c:182:12: warning: more '%' conversions than data arguments [-Wformat-insufficient-args]
     182 |                 pr_err("%s: unable to add hotplug pci device!\n");
         |                         ~^
   include/linux/printk.h:555:25: note: expanded from macro 'pr_err'
     555 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                                ^~~
   include/linux/printk.h:402:21: note: expanded from macro 'pr_fmt'
     402 | #define pr_fmt(fmt) fmt
         |                     ^~~
   include/linux/printk.h:512:53: note: expanded from macro 'printk'
     512 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ^~~
   include/linux/printk.h:484:11: note: expanded from macro 'printk_index_wrap'
     484 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   1 warning generated.


vim +182 arch/powerpc/kernel/pci-hotplug.c

   125	
   126	/**
   127	 * pci_hp_add_devices - adds new pci devices to bus
   128	 * @bus: the indicated PCI bus
   129	 *
   130	 * This routine will find and fixup new pci devices under
   131	 * the indicated bus. This routine presumes that there
   132	 * might already be some devices under this bridge, so
   133	 * it carefully tries to add only new devices.  (And that
   134	 * is how this routine differs from other, similar pcibios
   135	 * routines.)
   136	 */
   137	void pci_hp_add_devices(struct pci_bus *bus)
   138	{
   139		int mode, max;
   140		struct pci_dev *dev;
   141		struct pci_controller *phb;
   142		struct device_node *dn = pci_bus_to_OF_node(bus);
   143		int ret = 0;
   144	
   145		if (!dn)
   146			return;
   147	
   148		phb = pci_bus_to_host(bus);
   149	
   150		mode = PCI_PROBE_NORMAL;
   151		if (phb->controller_ops.probe_mode)
   152			mode = phb->controller_ops.probe_mode(bus);
   153	
   154		if (mode == PCI_PROBE_DEVTREE) {
   155			/* use ofdt-based probe */
   156			of_rescan_bus(dn, bus);
   157		} else if (mode == PCI_PROBE_NORMAL &&
   158			   dn->child && PCI_DN(dn->child)) {
   159			/*
   160			 * Use legacy probe. In the partial hotplug case, we
   161			 * probably have grandchildren devices unplugged. So
   162			 * we don't check the return value from pci_scan_slot() in
   163			 * order for fully rescan all the way down to pick them up.
   164			 * They can have been removed during partial hotplug.
   165			 */
   166			traverse_siblings_and_scan_slot(dn, bus);
   167			max = bus->busn_res.start;
   168			/*
   169			 * Scan bridges that are already configured. We don't touch
   170			 * them unless they are misconfigured (which will be done in
   171			 * the second scan below).
   172			 */
   173			for_each_pci_bridge(dev, bus)
   174				max = pci_scan_bridge(bus, dev, max, 0);
   175	
   176			/* Scan bridges that need to be reconfigured */
   177			for_each_pci_bridge(dev, bus)
   178				max = pci_scan_bridge(bus, dev, max, 1);
   179		}
   180		ret = pcibios_finish_adding_to_bus(bus);
   181		if (ret)
 > 182			pr_err("%s: unable to add hotplug pci device!\n");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

