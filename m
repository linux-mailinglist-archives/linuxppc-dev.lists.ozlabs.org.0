Return-Path: <linuxppc-dev+bounces-4798-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5E2A051C0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 04:54:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSYvw36KJz304f;
	Wed,  8 Jan 2025 14:54:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736308492;
	cv=none; b=gIHpcJeDYi6eu2Bgxb3V9ICCdCL5K9YpNWlkbp+5rwqSf6UYHsU2SYuyJldSeEF+D+bMC2yqvNj62KI+CNMUuPJvpqWUDh+Qlamz3zls2qkZXMxnJ2RorTI48SelJOowTf/lhv9sQ2KxNoaCuAT6jUH5HzuWgEtH83Tl8vZk0k6vhUhkDuqoqHo9B2CrK+mzVSY1crfIH65rkZJ8/QUECY6QY9QiDWPkvNO3klXHZmC2+5tDdtv7IYPAuOm9peDa2D+g5IdfLcEvQMLQhk461rjRoyvR7vBuBuwYNhGC1O01vgho3qcbNF8I0oCJSZ4VibeTLTa1qB4H9OLxjybd0w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736308492; c=relaxed/relaxed;
	bh=v5eb8IWYDkedYq2wqpvbvt6UnIvHYw+BRl+T8m5JCr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OMoHgIujx1R5WWQBJDG9tn/n1Laggow15B6MdPc5Z6Zzgxhx/IINHzBUY+XRXyH/gSe/eYDEZLEZ/FWiP+jgmbvkNeLYsdTWBmqVUZiSwyEv9jxkrmAexjPziu9N1gzILA73OcS6mwl0/ILR/G3XV5/iV8xvw0QZV/ptJJfTj+z2Ftau2wRRVDPYnFKvnkh+JA8RO3CT7pPMjrKBBaG/fG+KtbzsHmaMYm0aXyoEsrwbvG7UC6Orial4VaafRTXHSrk2tA0NWKyyBDB8IObkjmhyjnBjejXLw3qCJE9bG/IE3KFQVwd11ohs3yc1iN/QSONdJPQAQUUDP+8KSwzusw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=M5nNYbQX; dkim-atps=neutral; spf=pass (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=M5nNYbQX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YSYvs2bnPz304C
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2025 14:54:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736308489; x=1767844489;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4hsOMAZJ7j21xofFoIQjJ3dhFztVfnFxioSs/Xh+tLU=;
  b=M5nNYbQXqPkSmUgordze4bRajriirxIU4mEX3jz2B22o9dDIRCshZ9PF
   mkFPqYKBbz5xujdcG/DI2kqkGhCwLuBcnpgANVna7X4T9nATTjHEVoAHB
   NjGRfGKQPjCkNaIvwfsBM/rcVkI8E/GNDAoWb6y1v9X60YQY39e5c5Z6T
   Ai/U1VnCXTTpr9wGol8no6d86Wsvjx+Ub6gtHygpBQVxha69bd6cfIEUO
   AMvU9oeHMpIsOi0Rm1eVF2BVApW+FgGF2mdHrCSGpZgnFphbogRTfVEMz
   smb7svKHLjdOOZkA/tEBIScSAN3t5hVEgk78V7vTm3W60OoTpUpDJwKxm
   Q==;
X-CSE-ConnectionGUID: 1m3VwxW0RhuKEeuKlwUsBQ==
X-CSE-MsgGUID: CkDi+VnSRPabaaUOnzAbVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="47510446"
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; 
   d="scan'208";a="47510446"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 19:54:41 -0800
X-CSE-ConnectionGUID: SJ5v1rFaTKWUWQYQjFva9w==
X-CSE-MsgGUID: YgoBDvlkT9i+Phi1I3SMyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; 
   d="scan'208";a="103034161"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 Jan 2025 19:54:35 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVN9M-000FaR-39;
	Wed, 08 Jan 2025 03:54:32 +0000
Date: Wed, 8 Jan 2025 11:54:32 +0800
From: kernel test robot <lkp@intel.com>
To: Alistair Popple <apopple@nvidia.com>, akpm@linux-foundation.org,
	dan.j.williams@intel.com, linux-mm@kvack.org
Cc: oe-kbuild-all@lists.linux.dev, Alistair Popple <apopple@nvidia.com>,
	lina@asahilina.net, zhang.lyra@gmail.com,
	gerald.schaefer@linux.ibm.com, vishal.l.verma@intel.com,
	dave.jiang@intel.com, logang@deltatee.com, bhelgaas@google.com,
	jack@suse.cz, jgg@ziepe.ca, catalin.marinas@arm.com,
	will@kernel.org, mpe@ellerman.id.au, npiggin@gmail.com,
	dave.hansen@linux.intel.com, ira.weiny@intel.com,
	willy@infradead.org, djwong@kernel.org, tytso@mit.edu,
	linmiaohe@huawei.com, david@redhat.com, peterx@redhat.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	nvdimm@lists.linux.dev
Subject: Re: [PATCH v5 15/25] huge_memory: Add vmf_insert_folio_pud()
Message-ID: <202501081149.VDLF8cwh-lkp@intel.com>
References: <5729b98a4f8edfec80edffddc36cac6dbaa8f4b9.1736221254.git-series.apopple@nvidia.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5729b98a4f8edfec80edffddc36cac6dbaa8f4b9.1736221254.git-series.apopple@nvidia.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Alistair,

kernel test robot noticed the following build warnings:

[auto build test WARNING on e25c8d66f6786300b680866c0e0139981273feba]

url:    https://github.com/intel-lab-lkp/linux/commits/Alistair-Popple/fuse-Fix-dax-truncate-punch_hole-fault-path/20250107-114726
base:   e25c8d66f6786300b680866c0e0139981273feba
patch link:    https://lore.kernel.org/r/5729b98a4f8edfec80edffddc36cac6dbaa8f4b9.1736221254.git-series.apopple%40nvidia.com
patch subject: [PATCH v5 15/25] huge_memory: Add vmf_insert_folio_pud()
config: i386-buildonly-randconfig-004-20250108 (https://download.01.org/0day-ci/archive/20250108/202501081149.VDLF8cwh-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250108/202501081149.VDLF8cwh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501081149.VDLF8cwh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/huge_memory.c:1561: warning: Function parameter or struct member 'folio' not described in 'vmf_insert_folio_pud'
>> mm/huge_memory.c:1561: warning: Excess function parameter 'pfn' description in 'vmf_insert_folio_pud'


vim +1561 mm/huge_memory.c

  1551	
  1552	/**
  1553	 * vmf_insert_folio_pud - insert a pud size folio mapped by a pud entry
  1554	 * @vmf: Structure describing the fault
  1555	 * @pfn: pfn of the page to insert
  1556	 * @write: whether it's a write fault
  1557	 *
  1558	 * Return: vm_fault_t value.
  1559	 */
  1560	vm_fault_t vmf_insert_folio_pud(struct vm_fault *vmf, struct folio *folio, bool write)
> 1561	{
  1562		struct vm_area_struct *vma = vmf->vma;
  1563		unsigned long addr = vmf->address & PUD_MASK;
  1564		pud_t *pud = vmf->pud;
  1565		struct mm_struct *mm = vma->vm_mm;
  1566		spinlock_t *ptl;
  1567	
  1568		if (addr < vma->vm_start || addr >= vma->vm_end)
  1569			return VM_FAULT_SIGBUS;
  1570	
  1571		if (WARN_ON_ONCE(folio_order(folio) != PUD_ORDER))
  1572			return VM_FAULT_SIGBUS;
  1573	
  1574		ptl = pud_lock(mm, pud);
  1575		if (pud_none(*vmf->pud)) {
  1576			folio_get(folio);
  1577			folio_add_file_rmap_pud(folio, &folio->page, vma);
  1578			add_mm_counter(mm, mm_counter_file(folio), HPAGE_PUD_NR);
  1579		}
  1580		insert_pfn_pud(vma, addr, vmf->pud, pfn_to_pfn_t(folio_pfn(folio)), write);
  1581		spin_unlock(ptl);
  1582	
  1583		return VM_FAULT_NOPAGE;
  1584	}
  1585	EXPORT_SYMBOL_GPL(vmf_insert_folio_pud);
  1586	#endif /* CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD */
  1587	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

