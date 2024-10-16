Return-Path: <linuxppc-dev+bounces-2302-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9041899FF18
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Oct 2024 05:04:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XSwmr3FMGz2xrJ;
	Wed, 16 Oct 2024 14:04:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729047884;
	cv=none; b=KA0gAvkDNAa4Tuyk2jdmbMUaHE1XrpV0XT9qHkUCPqoCuB1pNqO6mSM04JOXheTCYC7Q9UPhcolKfh+EUu/h39dpGQaSuAoDB7YaKN9vHg2Ji5CmwQTwThryboqatbYMOIPHjuleq9PUcv7UapBuqexor9MC+jc9g1pYauA71qtDz9KZzfGcJfJEVWt6A4bVVfCiTnuEOphKGoigaftxmN/UbXlg8V7++X4xQSm0HAst5m6zTlQ11o1dXkP+GJ/oUCdPiysKvXqifBGNP4szKe7PNHq9SIpEMpIQyMBz0itUmW/ErIKl6KnVpC7Ez94RAwB4iRB5yLeuN5nzEFweBg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729047884; c=relaxed/relaxed;
	bh=9D3euhH+vsKCoGfj48IdTyzq9+B7g/QXhHlVv743pkM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FTU7bCwdhU3OiaGj92M6IOjxx4NdyIs0OJJzqe5BmKJIO5CY3mOIkJqjGnnaJF4b4sAQ55kwTo+1lqNwX0+l9JJPQVWcU7s9j+4o5s7gjDsZ7zCMI72PgDQtI4eor+IBA15+AFj5CGShk6qMisB+AAOROGen7qAZQLC7JdboIKIlHJ3KBxs1pAQbS5myyFY2PMlX5zwkyCuoczCO5M2OsQGUTnwWV7R+ulVjF23qTja5ZSjEmdJanGuyFiRBwAW5FHdULTJSskzZuMV0KDGmXtCks22ZZw1EnTTQTCjfWHA7jRs+UZwynqdF9vC1se0co62+HlGXAKu3dvyrnWFhHw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZqqEgWS4; dkim-atps=neutral; spf=pass (client-ip=192.198.163.12; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZqqEgWS4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.12; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XSwmn2hv4z2xpx
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2024 14:04:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729047882; x=1760583882;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4iNh84o83ZQH4Z4x2bLRWS6mJj3EonFvkfgivqaPnFs=;
  b=ZqqEgWS4CGEGz6gJ/cPNaseESDjK+iTiCq3c3tmiNhdrbv+jfVh4mre1
   4u4uqd06nnenSTQaqRTpi4UGeGcX0ka9aszKdnVf0ss1UwLZkrClDTlmC
   kJb29hqf4YJhECn+Ydh8SM8yQr5HbVDYQgSRLZyzRiYUaDYqPDnAdejrS
   A4X4X9JLwPJ8cCoLmYpOAkQIeo4+FbH29idJ+momPsrNbw2nEA2S2CI1y
   6D3XoYp09QVrtbqZ62C2R/ftlviuhdEDBPqOFhUL5xNSg5Zbew8LQrcAz
   N7w49datGWd98cPcj9v9PiWn44rHHBuFcElFJdB7/uaJprQAAcl+Laqlj
   A==;
X-CSE-ConnectionGUID: TCdCE6fgQ+yWhG0OFz07Kg==
X-CSE-MsgGUID: RJD5I1EKT5K3EuB2ZJh1xg==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="32395548"
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; 
   d="scan'208";a="32395548"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 20:04:35 -0700
X-CSE-ConnectionGUID: fx3FGI0wTgGQWYVIDfOung==
X-CSE-MsgGUID: NHHcDv0ZT/qJqXahQpOP+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; 
   d="scan'208";a="83168145"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 15 Oct 2024 20:04:30 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0uKo-000KCh-2I;
	Wed, 16 Oct 2024 03:04:26 +0000
Date: Wed, 16 Oct 2024 11:03:35 +0800
From: kernel test robot <lkp@intel.com>
To: Yicong Yang <yangyicong@huawei.com>, catalin.marinas@arm.com,
	will@kernel.org, sudeep.holla@arm.com, tglx@linutronix.de,
	mpe@ellerman.id.au, linux-arm-kernel@lists.infradead.org,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	pierre.gondois@arm.com, dietmar.eggemann@arm.com
Cc: oe-kbuild-all@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org, linux-kernel@vger.kernel.org,
	morten.rasmussen@arm.com, msuchanek@suse.de,
	gregkh@linuxfoundation.org, rafael@kernel.org,
	jonathan.cameron@huawei.com, prime.zeng@hisilicon.com,
	linuxarm@huawei.com, yangyicong@hisilicon.com, xuwei5@huawei.com,
	guohanjun@huawei.com
Subject: Re: [PATCH v6 2/4] arch_topology: Support SMT control for OF based
 system
Message-ID: <202410161038.WVTopMNt-lkp@intel.com>
References: <20241015021841.35713-3-yangyicong@huawei.com>
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
In-Reply-To: <20241015021841.35713-3-yangyicong@huawei.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Yicong,

kernel test robot noticed the following build warnings:

[auto build test WARNING on arm64/for-next/core]
[also build test WARNING on powerpc/next powerpc/fixes driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus linus/master tip/x86/core v6.12-rc3 next-20241015]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yicong-Yang/cpu-SMT-Provide-a-default-topology_is_primary_thread/20241015-102147
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20241015021841.35713-3-yangyicong%40huawei.com
patch subject: [PATCH v6 2/4] arch_topology: Support SMT control for OF based system
config: arm-randconfig-001-20241016 (https://download.01.org/0day-ci/archive/20241016/202410161038.WVTopMNt-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241016/202410161038.WVTopMNt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410161038.WVTopMNt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/base/arch_topology.c:32:21: warning: 'max_smt_thread_num' defined but not used [-Wunused-variable]
      32 | static unsigned int max_smt_thread_num;
         |                     ^~~~~~~~~~~~~~~~~~


vim +/max_smt_thread_num +32 drivers/base/arch_topology.c

    28	
    29	static DEFINE_PER_CPU(struct scale_freq_data __rcu *, sft_data);
    30	static struct cpumask scale_freq_counters_mask;
    31	static bool scale_freq_invariant;
  > 32	static unsigned int max_smt_thread_num;
    33	DEFINE_PER_CPU(unsigned long, capacity_freq_ref) = 1;
    34	EXPORT_PER_CPU_SYMBOL_GPL(capacity_freq_ref);
    35	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

