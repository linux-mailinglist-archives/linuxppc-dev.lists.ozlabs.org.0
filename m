Return-Path: <linuxppc-dev+bounces-14930-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD49CD4759
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Dec 2025 00:42:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dZHrC5jxrz2xqL;
	Mon, 22 Dec 2025 10:42:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766360555;
	cv=none; b=Xc9E3dMxYQnGnhwzM0blrHQmL+Qx3tKJwHLEJuCKuTxAwJ6V4D8X7LzuC7MLJg7JZh4mwXPODbNPRRYsKrWwygJCghsasgXoXSugCl/WliRsGQQgl3pxW5Ay+7VUYNhSDI/2e10vV3+239a5hIL1IV7cjT7Pd/mFRGKbS4Cu3qjZXrqUr31tkdFNC+5OFE/OMb+iAWqfrxsszeSkWK0S5I2gxk2l1C6pWQYnaTkLNtxHIfdKMuzTNI/K3EHiIOrU7dQS5LNJ0kOwhlXIg5qaKSNj82BkmUmzTsbi3gCtJIpbHGwT7L7qJ7JtZWz8G7hFiZAJWMKsn0NUi+C9pibmXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766360555; c=relaxed/relaxed;
	bh=VXV/4YXkIuBowvca7hFWsL0aDHJ+pblILf22L+sGA+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F3bwPSoY7MWaHsNjnqHUz8t7PhpsSXro+SAJFKY6jZ+kfjEJzf/2s0RrcN/BEo9THCTuxq7jrLuz8SS3PzfH6DbWmItBDrH+nkwQsaok6K4XWIgpW5GzoxHXYb1EBYBzsJ53/ZIXr6yy/IHUXC7ofXs8o+rRfw9nxB8ZSdt7rAoDme2TeB5S9qyA3We/ZXJo+hB92d2ACYElRGaZsLghQBOc7IHCfGAua0Z7k+Jytf1WhfcC7VG5QFi+fwz8XrV7N5j571B9a+qtCEv1OaviGiBHtPN6KQqkLeGreV2UuDmr309ZQFgZlgrU8oI04JNPyMktAK/clT5lM5JxjjLd5A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=J+1NNZ5S; dkim-atps=neutral; spf=pass (client-ip=192.198.163.10; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=J+1NNZ5S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.10; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dZHr82QwNz2xnl
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Dec 2025 10:42:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766360552; x=1797896552;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gGxGbnasspaVRRI7by5dOPE84jKe4QonzMZG00rj0ik=;
  b=J+1NNZ5Sfwx/FAd/r+26XqoJVY8V6BpFSs76QSUMXGTAY149aNpJ24ck
   9T4ppCFP6RrymM30vmbWFEmUR9U05S2U69MzrBotnuYziZBKC4h3q4sF6
   diP5mCRr+PXy2dykNKrIIIRduicj8cxA+a2pLGuka/Ne10m2Mxr3/UpE8
   tZslsqfn6NM3W2C4G2NFiHGboh/DGChNSLvvGgB0cQERVplop45A+AcLx
   Pqc9oFCYCV8ejVNvELrVKFxI4KTvr8+PPDFdepNlmKny/XxNwpwzKsY2e
   hwezvZw308XSOusLiUxxJAEOnoPpSC87l3OKPB2eQbc4E62Rj0xGNq6pT
   Q==;
X-CSE-ConnectionGUID: qXJaGNf7Rtu+WdBkfxQLOQ==
X-CSE-MsgGUID: /EpbchO4QgWQJ4X9CiB5xA==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="79588030"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="79588030"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 15:42:26 -0800
X-CSE-ConnectionGUID: r93/8ivDRxKA/B+8tTPRGA==
X-CSE-MsgGUID: 0Kw/AbA4S4SkWxcQYJvWJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="199403859"
Received: from lkp-server01.sh.intel.com (HELO 0713df988ca2) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 21 Dec 2025 15:42:24 -0800
Received: from kbuild by 0713df988ca2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXT49-000000000It-2tdX;
	Sun, 21 Dec 2025 23:42:21 +0000
Date: Mon, 22 Dec 2025 07:42:21 +0800
From: kernel test robot <lkp@intel.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org, Ryan Roberts <ryan.roberts@arm.com>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	linuxppc-dev@lists.ozlabs.org,
	Kevin Brodsky <kevin.brodsky@arm.com>
Subject: Re: [PATCH] powerpc/mm: export symbols for lazy_mmu_mode KUnit tests
Message-ID: <202512220735.UL4ukFLo-lkp@intel.com>
References: <20251217163812.2633648-1-kevin.brodsky@arm.com>
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
In-Reply-To: <20251217163812.2633648-1-kevin.brodsky@arm.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Kevin,

kernel test robot noticed the following build warnings:



url:    https://github.com/intel-lab-lkp/linux/commits/UPDATE-20251218-003955/Kevin-Brodsky/powerpc-64s-Do-not-re-activate-batched-TLB-flush/20251215-230757
base:   the 14th patch of https://lore.kernel.org/r/20251215150323.2218608-15-kevin.brodsky%40arm.com
patch link:    https://lore.kernel.org/r/20251217163812.2633648-1-kevin.brodsky%40arm.com
patch subject: [PATCH] powerpc/mm: export symbols for lazy_mmu_mode KUnit tests
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20251222/202512220735.UL4ukFLo-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512220735.UL4ukFLo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512220735.UL4ukFLo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/powerpc/mm/book3s64/hash_tlb.c:33:1: warning: data definition has no type or storage class
      33 | EXPORT_SYMBOL_IF_KUNIT(ppc64_tlb_batch); /* For lazy_mmu_mode KUnit tests */
         | ^~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/mm/book3s64/hash_tlb.c:33:1: error: type defaults to 'int' in declaration of 'EXPORT_SYMBOL_IF_KUNIT' [-Wimplicit-int]
   arch/powerpc/mm/book3s64/hash_tlb.c:33:1: error: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]
   arch/powerpc/mm/book3s64/hash_tlb.c:158:1: warning: data definition has no type or storage class
     158 | EXPORT_SYMBOL_IF_KUNIT(__flush_tlb_pending); /* For lazy_mmu_mode KUnit tests */
         | ^~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/mm/book3s64/hash_tlb.c:158:1: error: type defaults to 'int' in declaration of 'EXPORT_SYMBOL_IF_KUNIT' [-Wimplicit-int]
   arch/powerpc/mm/book3s64/hash_tlb.c:158:1: error: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]


vim +33 arch/powerpc/mm/book3s64/hash_tlb.c

    31	
    32	DEFINE_PER_CPU(struct ppc64_tlb_batch, ppc64_tlb_batch);
  > 33	EXPORT_SYMBOL_IF_KUNIT(ppc64_tlb_batch); /* For lazy_mmu_mode KUnit tests */
    34	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

