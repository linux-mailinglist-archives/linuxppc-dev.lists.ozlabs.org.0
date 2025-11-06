Return-Path: <linuxppc-dev+bounces-13886-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4740C3BCC4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 06 Nov 2025 15:38:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2PvG2gS0z2xS2;
	Fri,  7 Nov 2025 01:38:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762439914;
	cv=none; b=kw0cmL7l/gRb8q2iojLz5UDYZTn2Gp+3crdsHzudbcQfU7jrvt0ekNzETiU79689NSqQZuFLIEMAyYs5TfZWwEbMjWbUbLNPFwL17N4CqVlUST1tncp/EuJje0uHP4MGbVx+0uTsJrbZGXUdHZJQu1PTNswqE+kLhako+AEPtVEB2URZbxfHf47frchTixfoKdswwjMOr1lcpwKMpgmFy7xUORE4nQtu3QxrJUHKWZc//153iah8eIVcv1GXjwTLSb+g8V0DPnT0knUWQyZqgeECCWjwAiFRJ+rV55/A0Kwtl2jkgTbi/71U2E0Wux46kDlhjX7q8eZH4ZFNaEkeOA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762439914; c=relaxed/relaxed;
	bh=jh3BnHvW8PIXMHNCqBwP8m/N0iJoZMQt+GVZ+IQ2MbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=THZqG4uA9nbL0CbKg8U2Uo1cvUuh9A5woqfh3MNyPVpVaUsOvBXYPJlSQNeStKaKzCw28O/Ww75AyfeP9C9xQc9Ih9EIhKNjZSdh6536YrCAQ6fV+9XMXOWjn5T+91IW9qON68MEmvX06ltoMqBHCVfCISSMmWhGwfKTb2v0npy7K6/pCkhrXIPmRM3sZcu4dUNnLB958oT4NmSYyYyv2To9rjh+7uxwAzATAbedsocQBeFW0ZXLZdkoLJFWc0I0zz0KmipyQez/iKzGn74TJaK8EuOD9h5LjRgqOF0sIfWhTHo9AmnREoQu/iDGV4uYB4nd9fmMJoJR26B78udqrw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V1mpEM3H; dkim-atps=neutral; spf=pass (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V1mpEM3H;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d2PvD10THz2xQD
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Nov 2025 01:38:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762439913; x=1793975913;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+75GKPCI5jNkPc6bb4WB2j4Mz3JYShSPvH/44slbqt4=;
  b=V1mpEM3H76B1xmi6nMYsSfww7l/jvJmzPA4U7t7bbFdzjibSsit1cdKz
   AWV47F3xI+qWdkl7U134odeKTdEf4Ed6SA5EVNPe86K2ZVacxtXqls21i
   lq4OchnZh+Hk8VcsipDmDuDFJZZjO54sApsGD9Q/VvV0aiMUkw3R63sRP
   0mZFIn6rcl8/jZkYYZ0kuwKouuCAl8c2VQB2PXi35MpXweXctuhWBwyV3
   VVDOx5VKGtHagYzJi1jFWYyjmNCdEVFQ72Yx0KKh8LCr+7b04cSO+I69R
   U6rvLnz0rKSXYp0mKoBp2MScaRYAWQ3ORYa4J/9Yi4sCHpgu6HTtcPLsh
   g==;
X-CSE-ConnectionGUID: EyhnB47ERa+9pLm1HnoPgQ==
X-CSE-MsgGUID: 4FAtTdppQ/ST5CDTv2mobw==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="75692357"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
   d="scan'208";a="75692357"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 06:38:28 -0800
X-CSE-ConnectionGUID: mtLqvztIR2+6pQQoTPF7Mg==
X-CSE-MsgGUID: ezPYJZsdQpq225RUv4XYxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
   d="scan'208";a="187487529"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 06 Nov 2025 06:38:24 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vH182-000U1K-1F;
	Thu, 06 Nov 2025 14:38:22 +0000
Date: Thu, 6 Nov 2025 22:38:11 +0800
From: kernel test robot <lkp@intel.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: oe-kbuild-all@lists.linux.dev, Sourabh Jain <sourabhjain@linux.ibm.com>,
	Baoquan he <bhe@redhat.com>, Jiri Bohac <jbohac@suse.cz>,
	Hari Bathini <hbathini@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mahesh Salgaonkar <mahesh@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shivang Upadhyay <shivangu@linux.ibm.com>,
	kexec@lists.infradead.org
Subject: Re: [PATCH v6] powerpc/kdump: Add support for crashkernel CMA
 reservation
Message-ID: <202511062213.dHidoorr-lkp@intel.com>
References: <20251104132818.1724562-1-sourabhjain@linux.ibm.com>
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
In-Reply-To: <20251104132818.1724562-1-sourabhjain@linux.ibm.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Sourabh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/next]
[also build test WARNING on powerpc/fixes linus/master v6.18-rc4 next-20251106]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sourabh-Jain/powerpc-kdump-Add-support-for-crashkernel-CMA-reservation/20251104-213036
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20251104132818.1724562-1-sourabhjain%40linux.ibm.com
patch subject: [PATCH v6] powerpc/kdump: Add support for crashkernel CMA reservation
config: powerpc64-randconfig-r113-20251106 (https://download.01.org/0day-ci/archive/20251106/202511062213.dHidoorr-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251106/202511062213.dHidoorr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511062213.dHidoorr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/powerpc/kexec/core.c:62:20: sparse: sparse: symbol 'crashk_cma_size' was not declared. Should it be static?
   arch/powerpc/kexec/core.c:188:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long static [addressable] [toplevel] [usertype] crashk_base @@     got restricted __be64 [usertype] @@
   arch/powerpc/kexec/core.c:188:29: sparse:     expected unsigned long long static [addressable] [toplevel] [usertype] crashk_base
   arch/powerpc/kexec/core.c:188:29: sparse:     got restricted __be64 [usertype]
   arch/powerpc/kexec/core.c:190:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long static [addressable] [toplevel] [usertype] crashk_size @@     got restricted __be64 [usertype] @@
   arch/powerpc/kexec/core.c:190:29: sparse:     expected unsigned long long static [addressable] [toplevel] [usertype] crashk_size
   arch/powerpc/kexec/core.c:190:29: sparse:     got restricted __be64 [usertype]
   arch/powerpc/kexec/core.c:198:19: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long static [addressable] [toplevel] mem_limit @@     got restricted __be64 [usertype] @@
   arch/powerpc/kexec/core.c:198:19: sparse:     expected unsigned long long static [addressable] [toplevel] mem_limit
   arch/powerpc/kexec/core.c:198:19: sparse:     got restricted __be64 [usertype]
   arch/powerpc/kexec/core.c:214:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long static [addressable] [toplevel] [usertype] kernel_end @@     got restricted __be64 [usertype] @@
   arch/powerpc/kexec/core.c:214:20: sparse:     expected unsigned long long static [addressable] [toplevel] [usertype] kernel_end
   arch/powerpc/kexec/core.c:214:20: sparse:     got restricted __be64 [usertype]

vim +/crashk_cma_size +62 arch/powerpc/kexec/core.c

    61	
  > 62	unsigned long long crashk_cma_size;
    63	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

