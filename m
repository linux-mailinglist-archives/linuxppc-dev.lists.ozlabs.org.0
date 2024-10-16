Return-Path: <linuxppc-dev+bounces-2305-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4A29A0144
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Oct 2024 08:20:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XT16S4pQ8z2y83;
	Wed, 16 Oct 2024 17:20:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729059616;
	cv=none; b=E7ILo+CmvGH6QOSZS5ZzKbL6SdoEAqvZW7pmmOnr5EgujbLlMw3SvZwRZgOa3HJFVUL2rnszUgKEKcYoKnEIWPuOcLxIZ6d/VYZ330JF9BqriBvkgOmrcjPuXcYKX7vEyrpnsCDW3Fhr51+4tSQdQnSSwvznX1KXTN87KvHFQh7VXjxCosboegUslIQMV/zDf3SnTLbQeGMc/E2Yv67nYCjM/Db3S5d5gEpnt41ctH7l33Y97y9LXs45iCgs82mAJBWTt4JZcFOef8pgR2F7JJS2wyFmYlfMhy8mwJ11RDHOY1JzvgWlVyLYUAbotchkURA6Z3PIW68v/fb1T7wmsA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729059616; c=relaxed/relaxed;
	bh=2Edtru0YWTP1bLKYmA50zbB1AfVf3SZ7fgQuKBmFfG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hUyHZmQEgHr77yqb1lGks/Kup2GZlHTkeoRHHKBpLVh0stS9vyzCJA/g9IYJ9zri+q2ViB9pPzTR3W/pQ0/PiWbYy2PZyXyGhPNiBzur6+8wH8gysBNcuWJ5zyBNhR0fLoTHJuKGZ0CbmLBBSW7W9IxuXp4Jgo6ZcUI5ctvsd3w1+WmP7K7Wqy0wdrwRwEfnwhVDa3UtFyKkekYMI/gE1+r6TiJDL6R+std2ze9JpVx4Wt0eBNrLbH3+NUmXs/O2l0lk+YCo6UgBomaye/OSwDyDXbA3qCxt29kDV9lqwx5eU8Q740ZdNd9tA9qSQzpwkgHwlbN8GETt5RVIx/qJLQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=e0N9hGx+; dkim-atps=neutral; spf=pass (client-ip=192.198.163.13; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=e0N9hGx+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.13; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XT16P1sZ4z2xpp
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2024 17:20:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729059613; x=1760595613;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qaJLAfJ+hrsrmwGpkbpiwW/a3cmep1qGh4KcmkUooaY=;
  b=e0N9hGx+8mboOQy/DfEFOxkBa1m3jqCEhaQIDxhdKEvJ+j9nXFXD+kP5
   fWvJSdmVGPDHPPy68T5qETF6MHfJXL+eG8Bb/02QnagdeIn++iC1Mplen
   7XBllr7/HIXq10oFGDEIomZ9dT+uAxBM7SwSKhzPB3fwGpKXITnBOUfMR
   qPCNrUG+BkBmpX9T020DRx4v9Lv5zKNTRPETiLIBCsL0INGnh0ExAYDLw
   Z/wOXz0VmxtoQHG4lUasybHEKBKuH7U8CMyz8q3s6CNj2qNhxmP/GnFFH
   +KczNkBnG6d/+71vqC6Wc2KrmyMCLC5bSa1EesZ3HKEqGA+kmnpftsllS
   w==;
X-CSE-ConnectionGUID: 5eikOin3SNebUmlhkhw2kw==
X-CSE-MsgGUID: yyrz7m+5RBWrQcPAziCmNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="31359201"
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; 
   d="scan'208";a="31359201"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 23:20:06 -0700
X-CSE-ConnectionGUID: Qz2YFxCPRX+DL4A1Q90/JA==
X-CSE-MsgGUID: pir6H9ovQH2NODdk0aN8xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; 
   d="scan'208";a="78295490"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 15 Oct 2024 23:20:01 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0xO2-000KRU-0W;
	Wed, 16 Oct 2024 06:19:58 +0000
Date: Wed, 16 Oct 2024 14:19:05 +0800
From: kernel test robot <lkp@intel.com>
To: Yicong Yang <yangyicong@huawei.com>, catalin.marinas@arm.com,
	will@kernel.org, sudeep.holla@arm.com, tglx@linutronix.de,
	mpe@ellerman.id.au, linux-arm-kernel@lists.infradead.org,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	pierre.gondois@arm.com, dietmar.eggemann@arm.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, morten.rasmussen@arm.com,
	msuchanek@suse.de, gregkh@linuxfoundation.org, rafael@kernel.org,
	jonathan.cameron@huawei.com, prime.zeng@hisilicon.com,
	linuxarm@huawei.com, yangyicong@hisilicon.com, xuwei5@huawei.com,
	guohanjun@huawei.com
Subject: Re: [PATCH v6 2/4] arch_topology: Support SMT control for OF based
 system
Message-ID: <202410161302.HjmSau6j-lkp@intel.com>
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
config: arm-defconfig (https://download.01.org/0day-ci/archive/20241016/202410161302.HjmSau6j-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241016/202410161302.HjmSau6j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410161302.HjmSau6j-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/base/arch_topology.c:32:21: warning: unused variable 'max_smt_thread_num' [-Wunused-variable]
   static unsigned int max_smt_thread_num;
                       ^
   1 warning generated.


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

