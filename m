Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB42ED856
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2019 05:57:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4760sG6mxjzF3Ls
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2019 15:57:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4760q34XJGzF5KF
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Nov 2019 15:55:22 +1100 (AEDT)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Nov 2019 20:55:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,266,1569308400"; 
 d="gz'50?scan'50,208,50";a="284862240"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga001.jf.intel.com with ESMTP; 03 Nov 2019 20:55:15 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1iRUOY-0001xY-Md; Mon, 04 Nov 2019 12:55:14 +0800
Date: Mon, 4 Nov 2019 12:54:59 +0800
From: kbuild test robot <lkp@intel.com>
To: Alastair D'Silva <alastair@au1.ibm.com>
Subject: Re: [PATCH v5 4/6] powerpc: Convert flush_icache_range & friends to C
Message-ID: <201911041239.EsFtgq96%lkp@intel.com>
References: <20191104023305.9581-5-alastair@au1.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="a57thqrdgqyw4x4q"
Content-Disposition: inline
In-Reply-To: <20191104023305.9581-5-alastair@au1.ibm.com>
X-Patchwork-Hint: ignore
User-Agent: NeoMutt/20170113 (1.7.2)
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: kbuild-all@lists.01.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 alastair@d-silva.org, David Hildenbrand <david@redhat.com>,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Paul Mackerras <paulus@samba.org>, Qian Cai <cai@lca.pw>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--a57thqrdgqyw4x4q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alastair,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on powerpc/next]
[also build test ERROR on v5.4-rc6 next-20191031]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Alastair-D-Silva/powerpc-convert-cache-asm-to-C/20191104-103528
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
config: powerpc-allnoconfig (attached as .config)
compiler: powerpc-linux-gcc (GCC) 7.4.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        GCC_VERSION=7.4.0 make.cross ARCH=powerpc 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/powerpc/mm/mem.c: In function 'flush_dcache_icache_page':
>> arch/powerpc/mm/mem.c:469:29: error: passing argument 1 of 'flush_coherent_icache' makes integer from pointer without a cast [-Werror=int-conversion]
      if (flush_coherent_icache((void *)addr))
                                ^
   arch/powerpc/mm/mem.c:326:20: note: expected 'long unsigned int' but argument is of type 'void *'
    static inline bool flush_coherent_icache(unsigned long addr)
                       ^~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/mm/mem.c: In function '__flush_dcache_icache':
>> arch/powerpc/mm/mem.c:486:13: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
     u64 addr = (u64)page;
                ^
   cc1: all warnings being treated as errors

vim +/flush_coherent_icache +469 arch/powerpc/mm/mem.c

   449	
   450	void flush_dcache_icache_page(struct page *page)
   451	{
   452	#ifdef CONFIG_HUGETLB_PAGE
   453		if (PageCompound(page)) {
   454			flush_dcache_icache_hugepage(page);
   455			return;
   456		}
   457	#endif
   458	#if defined(CONFIG_PPC_8xx) || defined(CONFIG_PPC64)
   459		/* On 8xx there is no need to kmap since highmem is not supported */
   460		__flush_dcache_icache(page_address(page));
   461	#else
   462		if (IS_ENABLED(CONFIG_BOOKE) || sizeof(phys_addr_t) > sizeof(void *)) {
   463			void *start = kmap_atomic(page);
   464			__flush_dcache_icache(start);
   465			kunmap_atomic(start);
   466		} else {
   467			unsigned long addr = page_to_pfn(page) << PAGE_SHIFT;
   468	
 > 469			if (flush_coherent_icache((void *)addr))
   470				return;
   471			flush_dcache_icache_phys(addr);
   472		}
   473	#endif
   474	}
   475	EXPORT_SYMBOL(flush_dcache_icache_page);
   476	
   477	/**
   478	 * __flush_dcache_icache(): Flush a particular page from the data cache to RAM.
   479	 * Note: this is necessary because the instruction cache does *not*
   480	 * snoop from the data cache.
   481	 *
   482	 * @page: the address of the page to flush
   483	 */
   484	void __flush_dcache_icache(void *page)
   485	{
 > 486		u64 addr = (u64)page;
   487	
   488		if (flush_coherent_icache(addr))
   489			return;
   490	
   491		clean_dcache_range(addr, addr + PAGE_SIZE);
   492	
   493		/*
   494		 * We don't flush the icache on 44x. Those have a virtual icache and we
   495		 * don't have access to the virtual address here (it's not the page
   496		 * vaddr but where it's mapped in user space). The flushing of the
   497		 * icache on these is handled elsewhere, when a change in the address
   498		 * space occurs, before returning to user space.
   499		 */
   500	
   501		if (cpu_has_feature(MMU_FTR_TYPE_44x))
   502			return;
   503	
   504		invalidate_icache_range(addr, addr + PAGE_SIZE);
   505	}
   506	EXPORT_SYMBOL(__flush_dcache_icache);
   507	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--a57thqrdgqyw4x4q
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
WQAA

--a57thqrdgqyw4x4q--
