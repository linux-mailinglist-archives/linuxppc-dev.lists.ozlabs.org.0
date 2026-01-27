Return-Path: <linuxppc-dev+bounces-16309-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +ESgMceTeGmxrAEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16309-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jan 2026 11:30:31 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D5A92CBC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jan 2026 11:30:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f0hW81Vvpz309N;
	Tue, 27 Jan 2026 21:30:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769509828;
	cv=none; b=Qc3BCD6AQjJR/sWdd0B8Na7aB/zh6u9qLwhb2q+syy99wmvxLTTmHr0ssaJbHhko95v/T6bv/XUK4sdHWdq70nIl7Wg+dxNvwNWe7DSHXU9YBAH/9sO6M7w0QwkRDhhnIOUTogNLQgfvc9hHq8ApiQj/Rk0FbueQun9p49u6FxifATtRiM+v4hUYLnUvo0enPHfvBGczFm9JXebMDzqGtp5CDMOw7cOthXLxSbLCfEFt1h+Zy/54ESgpDKkHWXmTU62R3li96olPbMQHogyUJAjiGaEJX4SdyP3N4XQQWu3UEmZ7aERP9VdbHITmhmfBLLcC4Yrby8fHvddnLVI6rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769509828; c=relaxed/relaxed;
	bh=GBYCJHBtjNk0whqxFMLn3U3+4Jo1tumKbMRUB0lfM08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mpeGMkzoKadMytVvp7oOFIOUTLulSTZyOlNrbTjVNbCKfV6k9rQ506jpLimFbKHOQDXMARCpSamAdCeTEkGHHcn+gLgAe+ClSZYiNDQE7F0rVHUkq+V9la0z2TgtBcfCQ+kicYelySOJZaPEwo1vvKXICDTZHXwkbeGUh9T0wMwtGbJLpeb6/Y7o0t+BBT+nXewa7U5a4kNUYEjX4ZE0Zc/H9wLHSPKikduugEm2HRXAoYn5157lPi//fDu4MiF4OhYiteZbjk1I/kVr/vB+63zboBGeK7Odk+q156sgd933EjUy/hDQz9dCV8nhsvZ3016qWJVjY/9titI/onpvig==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Sd/ZhV0L; dkim-atps=neutral; spf=pass (client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Sd/ZhV0L;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f0hW53LRrz2xcB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jan 2026 21:30:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769509825; x=1801045825;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vtY/pLSeWwXzGEzypFz+sT8HToe3F5KU/4Z7xlJelUQ=;
  b=Sd/ZhV0Lv/ovnd1IANYEojLbHS+EF10sgMsRoQ93DzH5VEmLwttcHGUQ
   j8grXiapL5Z6dBANiczjyzqPkxRiABmd1T/WU3Wkv98sm2zYbKRic+JZR
   gH04PjE2Uyv5e1n8HxlmrUoQsOR0YJiWvYzu6nUFtNUuZncZKsNaQ82uB
   zaSx9uce6xHaJ0iJf7+pyjv6zD9cx/+uj4grK1I/BZ1/PN3ngOjsmTvMg
   qQmCg9uHhokosAHLoTV+Cc/TtjqEXg9cTovLxFKCxwzZuaqyghJjOhgbb
   7pxi6eaylHPGf1RlWL3D/T/7nzpzIPiNqmO79+rciiQmerWB2HFa3h9of
   w==;
X-CSE-ConnectionGUID: vJz7/Iq9TW+99ptZeEFkZg==
X-CSE-MsgGUID: ijeHCoD7SSiDT6ANlGDMWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="82131377"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="82131377"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 02:30:19 -0800
X-CSE-ConnectionGUID: 4O2r9//1TJ+8F96+BRB/ag==
X-CSE-MsgGUID: U7tkLRyjSY6umru95jVdYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="245555790"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 27 Jan 2026 02:30:18 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkgKt-00000000YJY-0eZE;
	Tue, 27 Jan 2026 10:30:15 +0000
Date: Tue, 27 Jan 2026 18:29:48 +0800
From: kernel test robot <lkp@intel.com>
To: wenxiong@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: oe-kbuild-all@lists.linux.dev, maddy@linux.ibm.com, haren@linux.ibm.com,
	tyreld@linux.ibm.com, Wen Xiong <wenxiong@linux.ibm.com>
Subject: Re: [PATCH] error path improvement in dlpar add
Message-ID: <202601271847.dv1oYfPw-lkp@intel.com>
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
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-16309-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:wenxiong@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:oe-kbuild-all@lists.linux.dev,m:maddy@linux.ibm.com,m:haren@linux.ibm.com,m:tyreld@linux.ibm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[lkp@intel.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,intel.com:mid,01.org:url]
X-Rspamd-Queue-Id: D1D5A92CBC
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
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260127/202601271847.dv1oYfPw-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601271847.dv1oYfPw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601271847.dv1oYfPw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:31,
                    from arch/powerpc/include/asm/bug.h:116,
                    from include/linux/bug.h:5,
                    from include/linux/fortify-string.h:6,
                    from include/linux/string.h:386,
                    from include/linux/uuid.h:11,
                    from include/linux/mod_devicetable.h:14,
                    from include/linux/pci.h:27,
                    from arch/powerpc/kernel/pci-hotplug.c:13:
   arch/powerpc/kernel/pci-hotplug.c: In function 'pci_hp_add_devices':
>> include/linux/kern_levels.h:5:25: warning: format '%s' expects a matching 'char *' argument [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:484:25: note: in definition of macro 'printk_index_wrap'
     484 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:555:9: note: in expansion of macro 'printk'
     555 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:555:16: note: in expansion of macro 'KERN_ERR'
     555 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   arch/powerpc/kernel/pci-hotplug.c:182:17: note: in expansion of macro 'pr_err'
     182 |                 pr_err("%s: unable to add hotplug pci device!\n");
         |                 ^~~~~~


vim +5 include/linux/kern_levels.h

314ba3520e513a Joe Perches 2012-07-30  4  
04d2c8c83d0e3a Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3a Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3a Joe Perches 2012-07-30  7  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

