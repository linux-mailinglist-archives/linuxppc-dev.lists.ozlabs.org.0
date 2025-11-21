Return-Path: <linuxppc-dev+bounces-14411-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 439A2C77E7C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Nov 2025 09:29:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dCT0n652sz2yFq;
	Fri, 21 Nov 2025 19:29:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763713785;
	cv=none; b=RgJ8iaiswRSQEh4xu1K3qCSuYrm/7DOX0l1UtRldi634ztzvWN2DlYO9ZF44kSsw6ie0GjG6mzEb2nekn/iqyVxTeiF52ZHE2lSNGMBZothbb+ObcoyzUVdB9hQMLpmAj1hhAU2EcStB6Ji79LeWNWzc6eV/rrlVKFGrDS4KcrEAMhbKEHrsAquQqjuMM8t4XwiNkpmJ1JtEKaGD39YMOUzbNOuvsBqyycxTb8yeEMgRf25z2/OhuH4MAs9Q35RkxCHIHQjGTTP+Bl8l9x2cTvf+0/c64tUT3CFi9ZsLAuXR0PS7PzF4IQNU9zMFDGq142NunF9TPQhUBm6MupmY5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763713785; c=relaxed/relaxed;
	bh=Zg80lzeJdeQcn7i0xSP07fimY5POxQfUDNdhJ4rwiL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OZOc0uSiP2VY+qvSFU0VgFp88mUWrKigWap9p0FB7wwayzFmOzCf/BX5P7uElnaycTLEih4SGZQO81YxCH9VvoDBthTuof/3OLyOV6l11iv3kD2FHnzAkoGDMGyJGSAd1ZT5tpZk37kANmyT72JCKs/WGn73hx38fhrI6zl0IHc1UBx2TsPoQlx3BTrJvC7i9yhkwb539HQ0Dl1/mkQv0F4UUKNrz4B8g13VJzt/jg190JaQudl81oN40T6w/723CSpnudU3waeUI6GvAd/eextO4uXqwrswOMY6VKyifsTnunMy/hyKb49MpSKvGZUGO0e4tfKgw7yYxvOVg5p5Zg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IcBglDGS; dkim-atps=neutral; spf=pass (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IcBglDGS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dCT0l1Rh3z2xSY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Nov 2025 19:29:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763713784; x=1795249784;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BB4/6hGUoiLibs4Na2AJzu1fx/ZenLoo01mFy4fD8p4=;
  b=IcBglDGSAjvsvWQSgtH4vo4PjsADhHmyXYgQt96b33AvAd++FQ24uxTc
   bsv4q+Je6nkJGJ4iCXYr0lvraPTYfJfxEBbEaPvPGOOZ8KF7G8593kJDy
   ky+5AejslESk0MFqI6H/9RRgYf+mEZwaNRJBxM6qw9IkIQhzzdPcf5IKP
   /YEG7u/7VWOxuu6P4OrK9wI3KyvUcSsBE6nRVg7FofMnZOcP5DV0cn7Sh
   FSFX1jd3rdt8R4l6svjDKkvHplzSkkjCeuw4UVwCArfpHy3KBNQrB4qHx
   uNEVqfXt6NcWM46pnqfnjF2Pvuxb31NPEFkO56hH+41Ns9oi76Mr097tN
   g==;
X-CSE-ConnectionGUID: cp+hPEz3TSC+1+ShzftM0w==
X-CSE-MsgGUID: Yy7NpTRfSSWpZ+icXLAntw==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="83193113"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="83193113"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 00:29:37 -0800
X-CSE-ConnectionGUID: IFcT6buWSgylRLtiFzTJOw==
X-CSE-MsgGUID: HnY3eJyGTEa8YGbHZclxEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="191428265"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 21 Nov 2025 00:29:31 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMMWH-00056t-07;
	Fri, 21 Nov 2025 08:29:29 +0000
Date: Fri, 21 Nov 2025 16:29:28 +0800
From: kernel test robot <lkp@intel.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Cc: oe-kbuild-all@lists.linux.dev, sshegde@linux.ibm.com, mingo@redhat.com,
	peterz@infradead.org, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, tglx@linutronix.de,
	yury.norov@gmail.com, maddy@linux.ibm.com, srikar@linux.ibm.com,
	gregkh@linuxfoundation.org, pbonzini@redhat.com, seanjc@google.com,
	kprateek.nayak@amd.com, vschneid@redhat.com, iii@linux.ibm.com,
	huschle@linux.ibm.com, rostedt@goodmis.org,
	dietmar.eggemann@arm.com, christophe.leroy@csgroup.eu
Subject: Re: [PATCH 12/17] powerpc: method to initialize ec and vp cores
Message-ID: <202511211643.QVn7aDHd-lkp@intel.com>
References: <20251119124449.1149616-13-sshegde@linux.ibm.com>
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
In-Reply-To: <20251119124449.1149616-13-sshegde@linux.ibm.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Shrikanth,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/sched/core]
[also build test ERROR on next-20251121]
[cannot apply to powerpc/next powerpc/fixes driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus linus/master v6.18-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shrikanth-Hegde/sched-docs-Document-cpu_paravirt_mask-and-Paravirt-CPU-concept/20251119-204931
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20251119124449.1149616-13-sshegde%40linux.ibm.com
patch subject: [PATCH 12/17] powerpc: method to initialize ec and vp cores
config: powerpc-randconfig-002-20251121 (https://download.01.org/0day-ci/archive/20251121/202511211643.QVn7aDHd-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251121/202511211643.QVn7aDHd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511211643.QVn7aDHd-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: arch/powerpc/kernel/smp.o: in function `smp_cpus_done':
>> arch/powerpc/kernel/smp.c:1735:(.init.text+0xd5c): undefined reference to `pseries_init_ec_vp_cores'


vim +1735 arch/powerpc/kernel/smp.c

  1721	
  1722	void __init smp_cpus_done(unsigned int max_cpus)
  1723	{
  1724		/*
  1725		 * We are running pinned to the boot CPU, see rest_init().
  1726		 */
  1727		if (smp_ops && smp_ops->setup_cpu)
  1728			smp_ops->setup_cpu(boot_cpuid);
  1729	
  1730		if (smp_ops && smp_ops->bringup_done)
  1731			smp_ops->bringup_done();
  1732	
  1733		dump_numa_cpu_topology();
  1734		build_sched_topology();
> 1735		pseries_init_ec_vp_cores();
  1736	}
  1737	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

