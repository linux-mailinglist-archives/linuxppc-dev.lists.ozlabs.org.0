Return-Path: <linuxppc-dev+bounces-1294-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D79229769BB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2024 14:56:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4HVy36qGz2yR5;
	Thu, 12 Sep 2024 22:56:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726145770;
	cv=none; b=MzABuJ5veCT7A+gnFXBUPur3DwvzQkwC9p04A2+JzStLqYIElYrXt+EaDww1BLnCrfdAAt2yINehBKX+4w7tPSbQIm0VjWgMfAn7Ht2EQvnGg8nfHo8OfFjD9khR8G9wRK9nc19ZviS1rjV57GMYN4+buB4WntVcRRn1V6zY7xU6zEo203KMlZsmyN3S9L1nT5kpLmrizIDYTPkXusUeCQiVUPRGvvSYed0jAwUlyFXHfdjTP4E541xy8GI/hFE3Ft4kVmJiFlc1mrbhiP+3N8/zHamQNp61WsmJ01cvSTFEwIhZXBEuIxEsoqMuj+V7FenfcysRZ0GYSqPkjTsMLw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726145770; c=relaxed/relaxed;
	bh=YYj+OrHO7/9jg6cZXzRIzpWIlAtM9rD/jZjmfyc78c8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lxX0SVS2QrXLJYyrfGYUTWDodZz4SbpZLDMqLSS1BVqYeZNDKh2aywfCNhJ+zwn7MSnAj2EnyDtHIFBI3aEX12iN3wBCaoxVfM/yH0w0fpgXbd2y8d7CxeK6vaCVAgwm/Oe+o9mQB2D7vkPv/W6XIkyAd55BLYA173iopABuRK0zRcuP1sbZ0mT4LRgJokibJaFnmoLaRcXadMgitoXqVyP5lq459r7Ml492bFrIoLCFDUL6ObCdFKKiFLz9BgKSfuKzVWaW6lJooYyP2Nx0tlggOlJEF5Cu4sDftb3spVB3JsuWya/iT23UovpO4tD7GQUDqx2F/AhGKS0/YKYpVw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A7xrGz8J; dkim-atps=neutral; spf=pass (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A7xrGz8J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4HVx5snmz2yNj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2024 22:56:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726145770; x=1757681770;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dGAeN13W305HmHWI3EX/D8HuXsJ0/ArD+TPGFFRkJWc=;
  b=A7xrGz8J/V3QXZ/+tUAEfaC8bNbCwANF7RvKYsxTiV4PG8XwC8sZ7S5U
   YOYMJFVVfw2bZB1Uo3c8cNoWN2DLqoMaAn30jgmf/Zquzn+pevv9ubbd7
   SM9cAx9z2MjO1KvY4T4yypNcEFcc35s2wYyuIvPL+WxlmGdc97R3UHUwe
   DleBl0dEPSgxUoFyUGk3D4a8Wuvm6sMsIVIIATA6CUuN9WWymH3ESvDMy
   yRDWB8QBlsbt4mGScZrf9AsRbygUzDXLnOKx/lKaKRDyyWrzB9wYa01+X
   MSi/Aw3lkhGsDaiXr3w+pSbMSGZN0gTEgaIoux8tgyyDKsoOR0preHUbo
   A==;
X-CSE-ConnectionGUID: dfRvisaeS6en8y7P2w3Ifg==
X-CSE-MsgGUID: 6HVgJ8C8RdmXs2+L8hoC8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="47506318"
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; 
   d="scan'208";a="47506318"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 05:56:06 -0700
X-CSE-ConnectionGUID: WI5ZxRdPS1OSvF46W9f0Ng==
X-CSE-MsgGUID: 42Lg1Wh1Q/6X9fgClrychQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; 
   d="scan'208";a="98523065"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 Sep 2024 05:56:00 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sojMb-0005Ay-0r;
	Thu, 12 Sep 2024 12:55:57 +0000
Date: Thu, 12 Sep 2024 20:55:23 +0800
From: kernel test robot <lkp@intel.com>
To: Alistair Popple <apopple@nvidia.com>, dan.j.williams@intel.com,
	linux-mm@kvack.org
Cc: oe-kbuild-all@lists.linux.dev, Alistair Popple <apopple@nvidia.com>,
	vishal.l.verma@intel.com, dave.jiang@intel.com, logang@deltatee.com,
	bhelgaas@google.com, jack@suse.cz, jgg@ziepe.ca,
	catalin.marinas@arm.com, will@kernel.org, mpe@ellerman.id.au,
	npiggin@gmail.com, dave.hansen@linux.intel.com, ira.weiny@intel.com,
	willy@infradead.org, djwong@kernel.org, tytso@mit.edu,
	linmiaohe@huawei.com, david@redhat.com, peterx@redhat.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	nvdimm@lists.linux.dev, linux-cxl@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org
Subject: Re: [PATCH 12/12] mm: Remove devmap related functions and page table
 bits
Message-ID: <202409122016.5i2hNKRU-lkp@intel.com>
References: <39b1a78aa16ebe5db1c4b723e44fbdd217d302ac.1725941415.git-series.apopple@nvidia.com>
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
In-Reply-To: <39b1a78aa16ebe5db1c4b723e44fbdd217d302ac.1725941415.git-series.apopple@nvidia.com>

Hi Alistair,

kernel test robot noticed the following build errors:

[auto build test ERROR on 6f1833b8208c3b9e59eff10792667b6639365146]

url:    https://github.com/intel-lab-lkp/linux/commits/Alistair-Popple/mm-gup-c-Remove-redundant-check-for-PCI-P2PDMA-page/20240910-121806
base:   6f1833b8208c3b9e59eff10792667b6639365146
patch link:    https://lore.kernel.org/r/39b1a78aa16ebe5db1c4b723e44fbdd217d302ac.1725941415.git-series.apopple%40nvidia.com
patch subject: [PATCH 12/12] mm: Remove devmap related functions and page table bits
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20240912/202409122016.5i2hNKRU-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240912/202409122016.5i2hNKRU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409122016.5i2hNKRU-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/include/asm/book3s/64/mmu-hash.h:20,
                    from arch/powerpc/include/asm/book3s/64/mmu.h:32,
                    from arch/powerpc/include/asm/mmu.h:377,
                    from arch/powerpc/include/asm/paca.h:18,
                    from arch/powerpc/include/asm/current.h:13,
                    from include/linux/thread_info.h:23,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/powerpc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/alloc_tag.h:11,
                    from include/linux/rhashtable-types.h:12,
                    from include/linux/ipc.h:7,
                    from include/uapi/linux/sem.h:5,
                    from include/linux/sem.h:5,
                    from include/linux/compat.h:14,
                    from arch/powerpc/kernel/asm-offsets.c:12:
>> arch/powerpc/include/asm/book3s/64/pgtable.h:1390:1: error: expected identifier or '(' before '}' token
    1390 | }
         | ^
   make[3]: *** [scripts/Makefile.build:117: arch/powerpc/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1193: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:224: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:224: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +1390 arch/powerpc/include/asm/book3s/64/pgtable.h

953c66c2b22a30 Aneesh Kumar K.V  2016-12-12  1389  
ebd31197931d75 Oliver O'Halloran 2017-06-28 @1390  }
6a1ea36260f69f Aneesh Kumar K.V  2016-04-29  1391  #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
ebd31197931d75 Oliver O'Halloran 2017-06-28  1392  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

