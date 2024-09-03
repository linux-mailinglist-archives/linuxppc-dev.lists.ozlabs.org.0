Return-Path: <linuxppc-dev+bounces-920-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45ECC96A32F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2024 17:47:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wyqkh0CC5z2xvR;
	Wed,  4 Sep 2024 01:47:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725378443;
	cv=none; b=bIhLEasWkr1VajgEXH/eiEEq5D+JXVRiX7j0OHx5qh4QLtkWRwLKqNTUHgGykQZwrUJTkfahb3tSCS7SrM1GGJO/CFwYHQlzpD+eRw0MBArwP6m7K6bJQLrmQw19bf4ts9oGYW7zvDLEKfgfgwb1KFKvDbl5ZLwG9RAQcNztxk4a+dk3sJS9z99BM0WHp2Kl6ZHmkAJXBhXiXP4uuNbJMCDXYNQiTlhPFP5WPMiMnf2v+fnZBdo/1CHhtGnejlIQt6XJK7HyflzIEGxWujdiLnBMHK41Rzb5c1hjRA4E4NhteDn3fdlfW1OV0LC4h1xXavA1QTAULJUPiawjNYngUg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725378443; c=relaxed/relaxed;
	bh=Y19+gsGfIUcWQ+eJbjRQ0jalONLNBOE/rRPHywAd6DI=;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=VB/20lqaOw159UDC/XHZyBwyTuqm9zbk4+mILBsX+eykjzkt/qJ1AoMEgxKtIFyAE4fQ7nNQCeLpzIqzezscieMTcgMEl0xVZhq/lLGZXLoujvMKySx/B6xYeN4hDr8zkzWv2RFmJfXUZl8iVIK+PkrjdjOXqJFmEyoJTDTd7dGj2dVf8/LpDW6EAEuemRAKmJjccOOhR6cyP9Wem5cdgX6bv3mrwlW0tfX3aYh/7U6ug842/3gu8pRN5S+J03Dtb0nqlzwsFI9JGavDJpbrw/9cVCoSdpAQv/SjhaltQbL/QWM7paGAYjob+yUorAqumJWKsfSUzRRuQbJY6WNYLQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j1v13c/i; dkim-atps=neutral; spf=pass (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j1v13c/i;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wyqkf1LGvz2xsK
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2024 01:47:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725378443; x=1756914443;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MJh2V+auA/rLdCEOxa08zCix2D9oA5EOwctHljU9Vks=;
  b=j1v13c/iEiwfXx/m9tcMto3ge4T1hHOj0Zl02QVZuiJl2H1okXeAUgsu
   r8LRcGhxSUifXTRYRheOMW/lpDcaWsBFYvmHsCP2Z4djNYJ9/Q3B6BBRx
   D3yZSTDjo8iaOHFOa8AST/AhjUZvaIKhizmqqeqnKxm1zjEoP9rPq2eqY
   W92Lv0Wjcb5c5UEvjZepQIVPQrvl2PtLPA8Mp+ppqdAUSrhBzG1FCvEYT
   VJj7wLyhXX72NhUh2avIfGq1vL3mIOVTY4XhWctBBlb2Ko/7sv62D/XKB
   rtlbU4yO/csFui4kq7oZdeAX0t2qkbgslWUZHsnR9qV23c4rg1ZC3cV60
   A==;
X-CSE-ConnectionGUID: cjv4L6SoRkGIOaQzvCG6Fw==
X-CSE-MsgGUID: /Qio6dxfTG60EC77Yiwu1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="24176667"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="24176667"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 08:47:17 -0700
X-CSE-ConnectionGUID: 7Jzz+qfgSwOZXceBWyl2cw==
X-CSE-MsgGUID: nSO2torVToaMOlESOHRY7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="88202644"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 Sep 2024 08:47:14 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slVkO-0006qy-1L;
	Tue, 03 Sep 2024 15:47:12 +0000
Date: Tue, 3 Sep 2024 23:46:30 +0800
From: kernel test robot <lkp@intel.com>
To: Hongbo Li <lihongbo22@huawei.com>, christophe.leroy@csgroup.eu
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	lihongbo22@huawei.com, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH -next] soc/fsl/qbman: make use of the helper function
 kthread_run_on_cpu()
Message-ID: <202409032300.9u9g0C8J-lkp@intel.com>
References: <20240902133125.3089560-1-lihongbo22@huawei.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240902133125.3089560-1-lihongbo22@huawei.com>

Hi Hongbo,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20240902]

url:    https://github.com/intel-lab-lkp/linux/commits/Hongbo-Li/soc-fsl-qbman-make-use-of-the-helper-function-kthread_run_on_cpu/20240903-060257
base:   next-20240902
patch link:    https://lore.kernel.org/r/20240902133125.3089560-1-lihongbo22%40huawei.com
patch subject: [PATCH -next] soc/fsl/qbman: make use of the helper function kthread_run_on_cpu()
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240903/202409032300.9u9g0C8J-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240903/202409032300.9u9g0C8J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409032300.9u9g0C8J-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/soc/fsl/qbman/qman_test_stash.c:112:27: error: too many arguments to function call, expected 4, have 5
     111 |                 struct task_struct *k = kthread_run_on_cpu(bstrap_fn, &bstrap,
         |                                         ~~~~~~~~~~~~~~~~~~
     112 |                                                 cpu, "hotpotato%d", cpu);
         |                                                                     ^~~
   include/linux/kthread.h:73:1: note: 'kthread_run_on_cpu' declared here
      73 | kthread_run_on_cpu(int (*threadfn)(void *data), void *data,
         | ^                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      74 |                         unsigned int cpu, const char *namefmt)
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OMAP2PLUS_MBOX
   Depends on [n]: MAILBOX [=y] && (ARCH_OMAP2PLUS || ARCH_K3)
   Selected by [y]:
   - TI_K3_M4_REMOTEPROC [=y] && REMOTEPROC [=y] && (ARCH_K3 || COMPILE_TEST [=y])


vim +112 drivers/soc/fsl/qbman/qman_test_stash.c

    35	
    36	/*
    37	 * Algorithm:
    38	 *
    39	 * Each cpu will have HP_PER_CPU "handlers" set up, each of which incorporates
    40	 * an rx/tx pair of FQ objects (both of which are stashed on dequeue). The
    41	 * organisation of FQIDs is such that the HP_PER_CPU*NUM_CPUS handlers will
    42	 * shuttle a "hot potato" frame around them such that every forwarding action
    43	 * moves it from one cpu to another. (The use of more than one handler per cpu
    44	 * is to allow enough handlers/FQs to truly test the significance of caching -
    45	 * ie. when cache-expiries are occurring.)
    46	 *
    47	 * The "hot potato" frame content will be HP_NUM_WORDS*4 bytes in size, and the
    48	 * first and last words of the frame data will undergo a transformation step on
    49	 * each forwarding action. To achieve this, each handler will be assigned a
    50	 * 32-bit "mixer", that is produced using a 32-bit LFSR. When a frame is
    51	 * received by a handler, the mixer of the expected sender is XOR'd into all
    52	 * words of the entire frame, which is then validated against the original
    53	 * values. Then, before forwarding, the entire frame is XOR'd with the mixer of
    54	 * the current handler. Apart from validating that the frame is taking the
    55	 * expected path, this also provides some quasi-realistic overheads to each
    56	 * forwarding action - dereferencing *all* the frame data, computation, and
    57	 * conditional branching. There is a "special" handler designated to act as the
    58	 * instigator of the test by creating an enqueuing the "hot potato" frame, and
    59	 * to determine when the test has completed by counting HP_LOOPS iterations.
    60	 *
    61	 * Init phases:
    62	 *
    63	 * 1. prepare each cpu's 'hp_cpu' struct using on_each_cpu(,,1) and link them
    64	 *    into 'hp_cpu_list'. Specifically, set processor_id, allocate HP_PER_CPU
    65	 *    handlers and link-list them (but do no other handler setup).
    66	 *
    67	 * 2. scan over 'hp_cpu_list' HP_PER_CPU times, the first time sets each
    68	 *    hp_cpu's 'iterator' to point to its first handler. With each loop,
    69	 *    allocate rx/tx FQIDs and mixer values to the hp_cpu's iterator handler
    70	 *    and advance the iterator for the next loop. This includes a final fixup,
    71	 *    which connects the last handler to the first (and which is why phase 2
    72	 *    and 3 are separate).
    73	 *
    74	 * 3. scan over 'hp_cpu_list' HP_PER_CPU times, the first time sets each
    75	 *    hp_cpu's 'iterator' to point to its first handler. With each loop,
    76	 *    initialise FQ objects and advance the iterator for the next loop.
    77	 *    Moreover, do this initialisation on the cpu it applies to so that Rx FQ
    78	 *    initialisation targets the correct cpu.
    79	 */
    80	
    81	/*
    82	 * helper to run something on all cpus (can't use on_each_cpu(), as that invokes
    83	 * the fn from irq context, which is too restrictive).
    84	 */
    85	struct bstrap {
    86		int (*fn)(void);
    87		atomic_t started;
    88	};
    89	static int bstrap_fn(void *bs)
    90	{
    91		struct bstrap *bstrap = bs;
    92		int err;
    93	
    94		atomic_inc(&bstrap->started);
    95		err = bstrap->fn();
    96		if (err)
    97			return err;
    98		while (!kthread_should_stop())
    99			msleep(20);
   100		return 0;
   101	}
   102	static int on_all_cpus(int (*fn)(void))
   103	{
   104		int cpu;
   105	
   106		for_each_cpu(cpu, cpu_online_mask) {
   107			struct bstrap bstrap = {
   108				.fn = fn,
   109				.started = ATOMIC_INIT(0)
   110			};
   111			struct task_struct *k = kthread_run_on_cpu(bstrap_fn, &bstrap,
 > 112							cpu, "hotpotato%d", cpu);
   113			int ret;
   114	
   115			if (IS_ERR(k))
   116				return -ENOMEM;
   117			/*
   118			 * If we call kthread_stop() before the "wake up" has had an
   119			 * effect, then the thread may exit with -EINTR without ever
   120			 * running the function. So poll until it's started before
   121			 * requesting it to stop.
   122			 */
   123			while (!atomic_read(&bstrap.started))
   124				msleep(20);
   125			ret = kthread_stop(k);
   126			if (ret)
   127				return ret;
   128		}
   129		return 0;
   130	}
   131	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

