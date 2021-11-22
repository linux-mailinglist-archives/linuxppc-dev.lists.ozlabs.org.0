Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 385C0459092
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Nov 2021 15:51:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HyVb70VXwz3c7L
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 01:51:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HyVZc02trz2xt5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 01:51:02 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10175"; a="234744289"
X-IronPort-AV: E=Sophos;i="5.87,255,1631602800"; 
 d="gz'50?scan'50,208,50";a="234744289"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2021 06:49:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,255,1631602800"; 
 d="gz'50?scan'50,208,50";a="589363811"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
 by FMSMGA003.fm.intel.com with ESMTP; 22 Nov 2021 06:49:53 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mpAdk-0000Ju-7M; Mon, 22 Nov 2021 14:49:52 +0000
Date: Mon, 22 Nov 2021 22:48:58 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Michael Ellerman <mpe@ellerman.id.au>, alex@ghiti.fr
Subject: Re: [PATCH 1/8] powerpc/mm: Make slice specific to book3s/64
Message-ID: <202111222218.RhruLp7S-lkp@intel.com>
References: <14e2c0b0d4fff49c1cb30166f54ce8e445e17b16.1637570556.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="X1bOJ3K7DJ5YkBrT"
Content-Disposition: inline
In-Reply-To: <14e2c0b0d4fff49c1cb30166f54ce8e445e17b16.1637570556.git.christophe.leroy@csgroup.eu>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-mm@kvack.org, kbuild-all@lists.01.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--X1bOJ3K7DJ5YkBrT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Christophe,

I love your patch! Perhaps something to improve:

[auto build test WARNING on powerpc/next]
[also build test WARNING on hnaz-mm/master linus/master v5.16-rc2 next-20211118]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Christophe-Leroy/Convert-powerpc-to-default-topdown-mmap-layout/20211122-165115
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
config: powerpc64-randconfig-s031-20211122 (attached as .config)
compiler: powerpc64-linux-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/0day-ci/linux/commit/1d0b7cc86d08f25f595b52d8c39ba9ca1d29a30a
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Christophe-Leroy/Convert-powerpc-to-default-topdown-mmap-layout/20211122-165115
        git checkout 1d0b7cc86d08f25f595b52d8c39ba9ca1d29a30a
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=powerpc64 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   arch/powerpc/mm/book3s64/slice.c: In function 'slice_get_unmapped_area':
>> arch/powerpc/mm/book3s64/slice.c:639:1: warning: the frame size of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     639 | }
         | ^


vim +639 arch/powerpc/mm/book3s64/slice.c

3a8247cc2c8569 arch/powerpc/mm/slice.c Paul Mackerras         2008-06-18  428  
d0f13e3c20b6fb arch/powerpc/mm/slice.c Benjamin Herrenschmidt 2007-05-08  429  unsigned long slice_get_unmapped_area(unsigned long addr, unsigned long len,
d0f13e3c20b6fb arch/powerpc/mm/slice.c Benjamin Herrenschmidt 2007-05-08  430  				      unsigned long flags, unsigned int psize,
34d07177b802e9 arch/powerpc/mm/slice.c Michel Lespinasse      2013-04-29  431  				      int topdown)
d0f13e3c20b6fb arch/powerpc/mm/slice.c Benjamin Herrenschmidt 2007-05-08  432  {
d0f13e3c20b6fb arch/powerpc/mm/slice.c Benjamin Herrenschmidt 2007-05-08  433  	struct slice_mask good_mask;
f3207c124e7aa8 arch/powerpc/mm/slice.c Aneesh Kumar K.V       2017-03-22  434  	struct slice_mask potential_mask;
d262bd5a739982 arch/powerpc/mm/slice.c Nicholas Piggin        2018-03-07  435  	const struct slice_mask *maskp;
d262bd5a739982 arch/powerpc/mm/slice.c Nicholas Piggin        2018-03-07  436  	const struct slice_mask *compat_maskp = NULL;
d0f13e3c20b6fb arch/powerpc/mm/slice.c Benjamin Herrenschmidt 2007-05-08  437  	int fixed = (flags & MAP_FIXED);
d0f13e3c20b6fb arch/powerpc/mm/slice.c Benjamin Herrenschmidt 2007-05-08  438  	int pshift = max_t(int, mmu_psize_defs[psize].shift, PAGE_SHIFT);
6a72dc038b6152 arch/powerpc/mm/slice.c Nicholas Piggin        2017-11-10  439  	unsigned long page_size = 1UL << pshift;
d0f13e3c20b6fb arch/powerpc/mm/slice.c Benjamin Herrenschmidt 2007-05-08  440  	struct mm_struct *mm = current->mm;
3a8247cc2c8569 arch/powerpc/mm/slice.c Paul Mackerras         2008-06-18  441  	unsigned long newaddr;
f4ea6dcb08ea2c arch/powerpc/mm/slice.c Aneesh Kumar K.V       2017-03-30  442  	unsigned long high_limit;
d0f13e3c20b6fb arch/powerpc/mm/slice.c Benjamin Herrenschmidt 2007-05-08  443  
6a72dc038b6152 arch/powerpc/mm/slice.c Nicholas Piggin        2017-11-10  444  	high_limit = DEFAULT_MAP_WINDOW;
35602f82d0c765 arch/powerpc/mm/slice.c Nicholas Piggin        2017-11-10  445  	if (addr >= high_limit || (fixed && (addr + len > high_limit)))
6a72dc038b6152 arch/powerpc/mm/slice.c Nicholas Piggin        2017-11-10  446  		high_limit = TASK_SIZE;
6a72dc038b6152 arch/powerpc/mm/slice.c Nicholas Piggin        2017-11-10  447  
6a72dc038b6152 arch/powerpc/mm/slice.c Nicholas Piggin        2017-11-10  448  	if (len > high_limit)
6a72dc038b6152 arch/powerpc/mm/slice.c Nicholas Piggin        2017-11-10  449  		return -ENOMEM;
6a72dc038b6152 arch/powerpc/mm/slice.c Nicholas Piggin        2017-11-10  450  	if (len & (page_size - 1))
6a72dc038b6152 arch/powerpc/mm/slice.c Nicholas Piggin        2017-11-10  451  		return -EINVAL;
6a72dc038b6152 arch/powerpc/mm/slice.c Nicholas Piggin        2017-11-10  452  	if (fixed) {
6a72dc038b6152 arch/powerpc/mm/slice.c Nicholas Piggin        2017-11-10  453  		if (addr & (page_size - 1))
6a72dc038b6152 arch/powerpc/mm/slice.c Nicholas Piggin        2017-11-10  454  			return -EINVAL;
6a72dc038b6152 arch/powerpc/mm/slice.c Nicholas Piggin        2017-11-10  455  		if (addr > high_limit - len)
6a72dc038b6152 arch/powerpc/mm/slice.c Nicholas Piggin        2017-11-10  456  			return -ENOMEM;
6a72dc038b6152 arch/powerpc/mm/slice.c Nicholas Piggin        2017-11-10  457  	}
6a72dc038b6152 arch/powerpc/mm/slice.c Nicholas Piggin        2017-11-10  458  
60458fba469a69 arch/powerpc/mm/slice.c Aneesh Kumar K.V       2019-04-17  459  	if (high_limit > mm_ctx_slb_addr_limit(&mm->context)) {
5709f7cfd83052 arch/powerpc/mm/slice.c Nicholas Piggin        2018-03-07  460  		/*
5709f7cfd83052 arch/powerpc/mm/slice.c Nicholas Piggin        2018-03-07  461  		 * Increasing the slb_addr_limit does not require
5709f7cfd83052 arch/powerpc/mm/slice.c Nicholas Piggin        2018-03-07  462  		 * slice mask cache to be recalculated because it should
5709f7cfd83052 arch/powerpc/mm/slice.c Nicholas Piggin        2018-03-07  463  		 * be already initialised beyond the old address limit.
5709f7cfd83052 arch/powerpc/mm/slice.c Nicholas Piggin        2018-03-07  464  		 */
60458fba469a69 arch/powerpc/mm/slice.c Aneesh Kumar K.V       2019-04-17  465  		mm_ctx_set_slb_addr_limit(&mm->context, high_limit);
54be0b9c7c9888 arch/powerpc/mm/slice.c Michael Ellerman       2018-10-02  466  
54be0b9c7c9888 arch/powerpc/mm/slice.c Michael Ellerman       2018-10-02  467  		on_each_cpu(slice_flush_segments, mm, 1);
f4ea6dcb08ea2c arch/powerpc/mm/slice.c Aneesh Kumar K.V       2017-03-30  468  	}
6a72dc038b6152 arch/powerpc/mm/slice.c Nicholas Piggin        2017-11-10  469  
d0f13e3c20b6fb arch/powerpc/mm/slice.c Benjamin Herrenschmidt 2007-05-08  470  	/* Sanity checks */
d0f13e3c20b6fb arch/powerpc/mm/slice.c Benjamin Herrenschmidt 2007-05-08  471  	BUG_ON(mm->task_size == 0);
60458fba469a69 arch/powerpc/mm/slice.c Aneesh Kumar K.V       2019-04-17  472  	BUG_ON(mm_ctx_slb_addr_limit(&mm->context) == 0);
764041e0f43cc7 arch/powerpc/mm/slice.c Aneesh Kumar K.V       2016-04-29  473  	VM_BUG_ON(radix_enabled());
d0f13e3c20b6fb arch/powerpc/mm/slice.c Benjamin Herrenschmidt 2007-05-08  474  
d0f13e3c20b6fb arch/powerpc/mm/slice.c Benjamin Herrenschmidt 2007-05-08  475  	slice_dbg("slice_get_unmapped_area(mm=%p, psize=%d...\n", mm, psize);
34d07177b802e9 arch/powerpc/mm/slice.c Michel Lespinasse      2013-04-29  476  	slice_dbg(" addr=%lx, len=%lx, flags=%lx, topdown=%d\n",
34d07177b802e9 arch/powerpc/mm/slice.c Michel Lespinasse      2013-04-29  477  		  addr, len, flags, topdown);
d0f13e3c20b6fb arch/powerpc/mm/slice.c Benjamin Herrenschmidt 2007-05-08  478  
d0f13e3c20b6fb arch/powerpc/mm/slice.c Benjamin Herrenschmidt 2007-05-08  479  	/* If hint, make sure it matches our alignment restrictions */
d0f13e3c20b6fb arch/powerpc/mm/slice.c Benjamin Herrenschmidt 2007-05-08  480  	if (!fixed && addr) {
b711531641038f arch/powerpc/mm/slice.c Christophe Leroy       2020-04-20  481  		addr = ALIGN(addr, page_size);
d0f13e3c20b6fb arch/powerpc/mm/slice.c Benjamin Herrenschmidt 2007-05-08  482  		slice_dbg(" aligned addr=%lx\n", addr);
3a8247cc2c8569 arch/powerpc/mm/slice.c Paul Mackerras         2008-06-18  483  		/* Ignore hint if it's too large or overlaps a VMA */
3b4d07d2674f6b arch/powerpc/mm/slice.c Aneesh Kumar K.V       2019-02-26  484  		if (addr > high_limit - len || addr < mmap_min_addr ||
3a8247cc2c8569 arch/powerpc/mm/slice.c Paul Mackerras         2008-06-18  485  		    !slice_area_is_free(mm, addr, len))
3a8247cc2c8569 arch/powerpc/mm/slice.c Paul Mackerras         2008-06-18  486  			addr = 0;
d0f13e3c20b6fb arch/powerpc/mm/slice.c Benjamin Herrenschmidt 2007-05-08  487  	}
d0f13e3c20b6fb arch/powerpc/mm/slice.c Benjamin Herrenschmidt 2007-05-08  488  
d0f13e3c20b6fb arch/powerpc/mm/slice.c Benjamin Herrenschmidt 2007-05-08  489  	/* First make up a "good" mask of slices that have the right size
d0f13e3c20b6fb arch/powerpc/mm/slice.c Benjamin Herrenschmidt 2007-05-08  490  	 * already
d0f13e3c20b6fb arch/powerpc/mm/slice.c Benjamin Herrenschmidt 2007-05-08  491  	 */
6f60cc98df2be7 arch/powerpc/mm/slice.c Christophe Leroy       2019-04-25  492  	maskp = slice_mask_for_size(&mm->context, psize);
d0f13e3c20b6fb arch/powerpc/mm/slice.c Benjamin Herrenschmidt 2007-05-08  493  
3a8247cc2c8569 arch/powerpc/mm/slice.c Paul Mackerras         2008-06-18  494  	/*
3a8247cc2c8569 arch/powerpc/mm/slice.c Paul Mackerras         2008-06-18  495  	 * Here "good" means slices that are already the right page size,
3a8247cc2c8569 arch/powerpc/mm/slice.c Paul Mackerras         2008-06-18  496  	 * "compat" means slices that have a compatible page size (i.e.
3a8247cc2c8569 arch/powerpc/mm/slice.c Paul Mackerras         2008-06-18  497  	 * 4k in a 64k pagesize kernel), and "free" means slices without
3a8247cc2c8569 arch/powerpc/mm/slice.c Paul Mackerras         2008-06-18  498  	 * any VMAs.
3a8247cc2c8569 arch/powerpc/mm/slice.c Paul Mackerras         2008-06-18  499  	 *
3a8247cc2c8569 arch/powerpc/mm/slice.c Paul Mackerras         2008-06-18  500  	 * If MAP_FIXED:
3a8247cc2c8569 arch/powerpc/mm/slice.c Paul Mackerras         2008-06-18  501  	 *	check if fits in good | compat => OK
3a8247cc2c8569 arch/powerpc/mm/slice.c Paul Mackerras         2008-06-18  502  	 *	check if fits in good | compat | free => convert free
3a8247cc2c8569 arch/powerpc/mm/slice.c Paul Mackerras         2008-06-18  503  	 *	else bad
3a8247cc2c8569 arch/powerpc/mm/slice.c Paul Mackerras         2008-06-18  504  	 * If have hint:
3a8247cc2c8569 arch/powerpc/mm/slice.c Paul Mackerras         2008-06-18  505  	 *	check if hint fits in good => OK
3a8247cc2c8569 arch/powerpc/mm/slice.c Paul Mackerras         2008-06-18  506  	 *	check if hint fits in good | free => convert free
3a8247cc2c8569 arch/powerpc/mm/slice.c Paul Mackerras         2008-06-18  507  	 * Otherwise:
3a8247cc2c8569 arch/powerpc/mm/slice.c Paul Mackerras         2008-06-18  508  	 *	search in good, found => OK
3a8247cc2c8569 arch/powerpc/mm/slice.c Paul Mackerras         2008-06-18  509  	 *	search in good | free, found => convert free
3a8247cc2c8569 arch/powerpc/mm/slice.c Paul Mackerras         2008-06-18  510  	 *	search in good | compat | free, found => convert free.
3a8247cc2c8569 arch/powerpc/mm/slice.c Paul Mackerras         2008-06-18  511  	 */
d0f13e3c20b6fb arch/powerpc/mm/slice.c Benjamin Herrenschmidt 2007-05-08  512  
d262bd5a739982 arch/powerpc/mm/slice.c Nicholas Piggin        2018-03-07  513  	/*
d262bd5a739982 arch/powerpc/mm/slice.c Nicholas Piggin        2018-03-07  514  	 * If we support combo pages, we can allow 64k pages in 4k slices
d262bd5a739982 arch/powerpc/mm/slice.c Nicholas Piggin        2018-03-07  515  	 * The mask copies could be avoided in most cases here if we had
d262bd5a739982 arch/powerpc/mm/slice.c Nicholas Piggin        2018-03-07  516  	 * a pointer to good mask for the next code to use.
d262bd5a739982 arch/powerpc/mm/slice.c Nicholas Piggin        2018-03-07  517  	 */
d262bd5a739982 arch/powerpc/mm/slice.c Nicholas Piggin        2018-03-07  518  	if (IS_ENABLED(CONFIG_PPC_64K_PAGES) && psize == MMU_PAGE_64K) {
6f60cc98df2be7 arch/powerpc/mm/slice.c Christophe Leroy       2019-04-25  519  		compat_maskp = slice_mask_for_size(&mm->context, MMU_PAGE_4K);
3a8247cc2c8569 arch/powerpc/mm/slice.c Paul Mackerras         2008-06-18  520  		if (fixed)
d262bd5a739982 arch/powerpc/mm/slice.c Nicholas Piggin        2018-03-07  521  			slice_or_mask(&good_mask, maskp, compat_maskp);
d262bd5a739982 arch/powerpc/mm/slice.c Nicholas Piggin        2018-03-07  522  		else
d262bd5a739982 arch/powerpc/mm/slice.c Nicholas Piggin        2018-03-07  523  			slice_copy_mask(&good_mask, maskp);
d262bd5a739982 arch/powerpc/mm/slice.c Nicholas Piggin        2018-03-07  524  	} else {
d262bd5a739982 arch/powerpc/mm/slice.c Nicholas Piggin        2018-03-07  525  		slice_copy_mask(&good_mask, maskp);
3a8247cc2c8569 arch/powerpc/mm/slice.c Paul Mackerras         2008-06-18  526  	}
d262bd5a739982 arch/powerpc/mm/slice.c Nicholas Piggin        2018-03-07  527  
d262bd5a739982 arch/powerpc/mm/slice.c Nicholas Piggin        2018-03-07  528  	slice_print_mask(" good_mask", &good_mask);
d262bd5a739982 arch/powerpc/mm/slice.c Nicholas Piggin        2018-03-07  529  	if (compat_maskp)
d262bd5a739982 arch/powerpc/mm/slice.c Nicholas Piggin        2018-03-07  530  		slice_print_mask(" compat_mask", compat_maskp);
d0f13e3c20b6fb arch/powerpc/mm/slice.c Benjamin Herrenschmidt 2007-05-08  531  
3a8247cc2c8569 arch/powerpc/mm/slice.c Paul Mackerras         2008-06-18  532  	/* First check hint if it's valid or if we have MAP_FIXED */
3a8247cc2c8569 arch/powerpc/mm/slice.c Paul Mackerras         2008-06-18  533  	if (addr != 0 || fixed) {
d0f13e3c20b6fb arch/powerpc/mm/slice.c Benjamin Herrenschmidt 2007-05-08  534  		/* Check if we fit in the good mask. If we do, we just return,
d0f13e3c20b6fb arch/powerpc/mm/slice.c Benjamin Herrenschmidt 2007-05-08  535  		 * nothing else to do
d0f13e3c20b6fb arch/powerpc/mm/slice.c Benjamin Herrenschmidt 2007-05-08  536  		 */
ae3066bd1cbe58 arch/powerpc/mm/slice.c Nicholas Piggin        2018-03-07  537  		if (slice_check_range_fits(mm, &good_mask, addr, len)) {
d0f13e3c20b6fb arch/powerpc/mm/slice.c Benjamin Herrenschmidt 2007-05-08  538  			slice_dbg(" fits good !\n");
0dea04b288c066 arch/powerpc/mm/slice.c Aneesh Kumar K.V       2018-03-26  539  			newaddr = addr;
0dea04b288c066 arch/powerpc/mm/slice.c Aneesh Kumar K.V       2018-03-26  540  			goto return_addr;
d0f13e3c20b6fb arch/powerpc/mm/slice.c Benjamin Herrenschmidt 2007-05-08  541  		}
3a8247cc2c8569 arch/powerpc/mm/slice.c Paul Mackerras         2008-06-18  542  	} else {
3a8247cc2c8569 arch/powerpc/mm/slice.c Paul Mackerras         2008-06-18  543  		/* Now let's see if we can find something in the existing
3a8247cc2c8569 arch/powerpc/mm/slice.c Paul Mackerras         2008-06-18  544  		 * slices for that size
3a8247cc2c8569 arch/powerpc/mm/slice.c Paul Mackerras         2008-06-18  545  		 */
830fd2d45aa116 arch/powerpc/mm/slice.c Nicholas Piggin        2018-03-07  546  		newaddr = slice_find_area(mm, len, &good_mask,
f4ea6dcb08ea2c arch/powerpc/mm/slice.c Aneesh Kumar K.V       2017-03-30  547  					  psize, topdown, high_limit);
3a8247cc2c8569 arch/powerpc/mm/slice.c Paul Mackerras         2008-06-18  548  		if (newaddr != -ENOMEM) {
3a8247cc2c8569 arch/powerpc/mm/slice.c Paul Mackerras         2008-06-18  549  			/* Found within the good mask, we don't have to setup,
3a8247cc2c8569 arch/powerpc/mm/slice.c Paul Mackerras         2008-06-18  550  			 * we thus return directly
3a8247cc2c8569 arch/powerpc/mm/slice.c Paul Mackerras         2008-06-18  551  			 */
3a8247cc2c8569 arch/powerpc/mm/slice.c Paul Mackerras         2008-06-18  552  			slice_dbg(" found area at 0x%lx\n", newaddr);
0dea04b288c066 arch/powerpc/mm/slice.c Aneesh Kumar K.V       2018-03-26  553  			goto return_addr;
3a8247cc2c8569 arch/powerpc/mm/slice.c Paul Mackerras         2008-06-18  554  		}
3a8247cc2c8569 arch/powerpc/mm/slice.c Paul Mackerras         2008-06-18  555  	}
7a06c66835f75f arch/powerpc/mm/slice.c Aneesh Kumar K.V       2017-11-10  556  	/*
7a06c66835f75f arch/powerpc/mm/slice.c Aneesh Kumar K.V       2017-11-10  557  	 * We don't fit in the good mask, check what other slices are
d0f13e3c20b6fb arch/powerpc/mm/slice.c Benjamin Herrenschmidt 2007-05-08  558  	 * empty and thus can be converted
d0f13e3c20b6fb arch/powerpc/mm/slice.c Benjamin Herrenschmidt 2007-05-08  559  	 */
7a06c66835f75f arch/powerpc/mm/slice.c Aneesh Kumar K.V       2017-11-10  560  	slice_mask_for_free(mm, &potential_mask, high_limit);
b8c93549142077 arch/powerpc/mm/slice.c Nicholas Piggin        2018-03-07  561  	slice_or_mask(&potential_mask, &potential_mask, &good_mask);
830fd2d45aa116 arch/powerpc/mm/slice.c Nicholas Piggin        2018-03-07  562  	slice_print_mask(" potential", &potential_mask);
3a8247cc2c8569 arch/powerpc/mm/slice.c Paul Mackerras         2008-06-18  563  
ae3066bd1cbe58 arch/powerpc/mm/slice.c Nicholas Piggin        2018-03-07  564  	if (addr != 0 || fixed) {
ae3066bd1cbe58 arch/powerpc/mm/slice.c Nicholas Piggin        2018-03-07  565  		if (slice_check_range_fits(mm, &potential_mask, addr, len)) {
d0f13e3c20b6fb arch/powerpc/mm/slice.c Benjamin Herrenschmidt 2007-05-08  566  			slice_dbg(" fits potential !\n");
0dea04b288c066 arch/powerpc/mm/slice.c Aneesh Kumar K.V       2018-03-26  567  			newaddr = addr;
d0f13e3c20b6fb arch/powerpc/mm/slice.c Benjamin Herrenschmidt 2007-05-08  568  			goto convert;
d0f13e3c20b6fb arch/powerpc/mm/slice.c Benjamin Herrenschmidt 2007-05-08  569  		}
ae3066bd1cbe58 arch/powerpc/mm/slice.c Nicholas Piggin        2018-03-07  570  	}
d0f13e3c20b6fb arch/powerpc/mm/slice.c Benjamin Herrenschmidt 2007-05-08  571  
3a8247cc2c8569 arch/powerpc/mm/slice.c Paul Mackerras         2008-06-18  572  	/* If we have MAP_FIXED and failed the above steps, then error out */
d0f13e3c20b6fb arch/powerpc/mm/slice.c Benjamin Herrenschmidt 2007-05-08  573  	if (fixed)
d0f13e3c20b6fb arch/powerpc/mm/slice.c Benjamin Herrenschmidt 2007-05-08  574  		return -EBUSY;
d0f13e3c20b6fb arch/powerpc/mm/slice.c Benjamin Herrenschmidt 2007-05-08  575  
d0f13e3c20b6fb arch/powerpc/mm/slice.c Benjamin Herrenschmidt 2007-05-08  576  	slice_dbg(" search...\n");
d0f13e3c20b6fb arch/powerpc/mm/slice.c Benjamin Herrenschmidt 2007-05-08  577  
3a8247cc2c8569 arch/powerpc/mm/slice.c Paul Mackerras         2008-06-18  578  	/* If we had a hint that didn't work out, see if we can fit
3a8247cc2c8569 arch/powerpc/mm/slice.c Paul Mackerras         2008-06-18  579  	 * anywhere in the good area.
d0f13e3c20b6fb arch/powerpc/mm/slice.c Benjamin Herrenschmidt 2007-05-08  580  	 */
3a8247cc2c8569 arch/powerpc/mm/slice.c Paul Mackerras         2008-06-18  581  	if (addr) {
0dea04b288c066 arch/powerpc/mm/slice.c Aneesh Kumar K.V       2018-03-26  582  		newaddr = slice_find_area(mm, len, &good_mask,
f4ea6dcb08ea2c arch/powerpc/mm/slice.c Aneesh Kumar K.V       2017-03-30  583  					  psize, topdown, high_limit);
0dea04b288c066 arch/powerpc/mm/slice.c Aneesh Kumar K.V       2018-03-26  584  		if (newaddr != -ENOMEM) {
0dea04b288c066 arch/powerpc/mm/slice.c Aneesh Kumar K.V       2018-03-26  585  			slice_dbg(" found area at 0x%lx\n", newaddr);
0dea04b288c066 arch/powerpc/mm/slice.c Aneesh Kumar K.V       2018-03-26  586  			goto return_addr;
d0f13e3c20b6fb arch/powerpc/mm/slice.c Benjamin Herrenschmidt 2007-05-08  587  		}
d0f13e3c20b6fb arch/powerpc/mm/slice.c Benjamin Herrenschmidt 2007-05-08  588  	}
d0f13e3c20b6fb arch/powerpc/mm/slice.c Benjamin Herrenschmidt 2007-05-08  589  
d0f13e3c20b6fb arch/powerpc/mm/slice.c Benjamin Herrenschmidt 2007-05-08  590  	/* Now let's see if we can find something in the existing slices
3a8247cc2c8569 arch/powerpc/mm/slice.c Paul Mackerras         2008-06-18  591  	 * for that size plus free slices
d0f13e3c20b6fb arch/powerpc/mm/slice.c Benjamin Herrenschmidt 2007-05-08  592  	 */
0dea04b288c066 arch/powerpc/mm/slice.c Aneesh Kumar K.V       2018-03-26  593  	newaddr = slice_find_area(mm, len, &potential_mask,
f4ea6dcb08ea2c arch/powerpc/mm/slice.c Aneesh Kumar K.V       2017-03-30  594  				  psize, topdown, high_limit);
3a8247cc2c8569 arch/powerpc/mm/slice.c Paul Mackerras         2008-06-18  595  
203a1fa6286671 arch/powerpc/mm/slice.c Christophe Leroy       2019-04-25  596  	if (IS_ENABLED(CONFIG_PPC_64K_PAGES) && newaddr == -ENOMEM &&
203a1fa6286671 arch/powerpc/mm/slice.c Christophe Leroy       2019-04-25  597  	    psize == MMU_PAGE_64K) {
3a8247cc2c8569 arch/powerpc/mm/slice.c Paul Mackerras         2008-06-18  598  		/* retry the search with 4k-page slices included */
d262bd5a739982 arch/powerpc/mm/slice.c Nicholas Piggin        2018-03-07  599  		slice_or_mask(&potential_mask, &potential_mask, compat_maskp);
0dea04b288c066 arch/powerpc/mm/slice.c Aneesh Kumar K.V       2018-03-26  600  		newaddr = slice_find_area(mm, len, &potential_mask,
f4ea6dcb08ea2c arch/powerpc/mm/slice.c Aneesh Kumar K.V       2017-03-30  601  					  psize, topdown, high_limit);
3a8247cc2c8569 arch/powerpc/mm/slice.c Paul Mackerras         2008-06-18  602  	}
3a8247cc2c8569 arch/powerpc/mm/slice.c Paul Mackerras         2008-06-18  603  
0dea04b288c066 arch/powerpc/mm/slice.c Aneesh Kumar K.V       2018-03-26  604  	if (newaddr == -ENOMEM)
d0f13e3c20b6fb arch/powerpc/mm/slice.c Benjamin Herrenschmidt 2007-05-08  605  		return -ENOMEM;
d0f13e3c20b6fb arch/powerpc/mm/slice.c Benjamin Herrenschmidt 2007-05-08  606  
0dea04b288c066 arch/powerpc/mm/slice.c Aneesh Kumar K.V       2018-03-26  607  	slice_range_to_mask(newaddr, len, &potential_mask);
0dea04b288c066 arch/powerpc/mm/slice.c Aneesh Kumar K.V       2018-03-26  608  	slice_dbg(" found potential area at 0x%lx\n", newaddr);
d262bd5a739982 arch/powerpc/mm/slice.c Nicholas Piggin        2018-03-07  609  	slice_print_mask(" mask", &potential_mask);
d0f13e3c20b6fb arch/powerpc/mm/slice.c Benjamin Herrenschmidt 2007-05-08  610  
d0f13e3c20b6fb arch/powerpc/mm/slice.c Benjamin Herrenschmidt 2007-05-08  611   convert:
f384796c40dc55 arch/powerpc/mm/slice.c Aneesh Kumar K.V       2018-03-26  612  	/*
f384796c40dc55 arch/powerpc/mm/slice.c Aneesh Kumar K.V       2018-03-26  613  	 * Try to allocate the context before we do slice convert
f384796c40dc55 arch/powerpc/mm/slice.c Aneesh Kumar K.V       2018-03-26  614  	 * so that we handle the context allocation failure gracefully.
f384796c40dc55 arch/powerpc/mm/slice.c Aneesh Kumar K.V       2018-03-26  615  	 */
f384796c40dc55 arch/powerpc/mm/slice.c Aneesh Kumar K.V       2018-03-26  616  	if (need_extra_context(mm, newaddr)) {
f384796c40dc55 arch/powerpc/mm/slice.c Aneesh Kumar K.V       2018-03-26  617  		if (alloc_extended_context(mm, newaddr) < 0)
f384796c40dc55 arch/powerpc/mm/slice.c Aneesh Kumar K.V       2018-03-26  618  			return -ENOMEM;
f384796c40dc55 arch/powerpc/mm/slice.c Aneesh Kumar K.V       2018-03-26  619  	}
f384796c40dc55 arch/powerpc/mm/slice.c Aneesh Kumar K.V       2018-03-26  620  
d262bd5a739982 arch/powerpc/mm/slice.c Nicholas Piggin        2018-03-07  621  	slice_andnot_mask(&potential_mask, &potential_mask, &good_mask);
d262bd5a739982 arch/powerpc/mm/slice.c Nicholas Piggin        2018-03-07  622  	if (compat_maskp && !fixed)
d262bd5a739982 arch/powerpc/mm/slice.c Nicholas Piggin        2018-03-07  623  		slice_andnot_mask(&potential_mask, &potential_mask, compat_maskp);
d262bd5a739982 arch/powerpc/mm/slice.c Nicholas Piggin        2018-03-07  624  	if (potential_mask.low_slices ||
db3a528db41caa arch/powerpc/mm/slice.c Christophe Leroy       2018-02-22  625  		(SLICE_NUM_HIGH &&
d262bd5a739982 arch/powerpc/mm/slice.c Nicholas Piggin        2018-03-07  626  		 !bitmap_empty(potential_mask.high_slices, SLICE_NUM_HIGH))) {
d262bd5a739982 arch/powerpc/mm/slice.c Nicholas Piggin        2018-03-07  627  		slice_convert(mm, &potential_mask, psize);
3a8247cc2c8569 arch/powerpc/mm/slice.c Paul Mackerras         2008-06-18  628  		if (psize > MMU_PAGE_BASE)
54be0b9c7c9888 arch/powerpc/mm/slice.c Michael Ellerman       2018-10-02  629  			on_each_cpu(slice_flush_segments, mm, 1);
3a8247cc2c8569 arch/powerpc/mm/slice.c Paul Mackerras         2008-06-18  630  	}
f384796c40dc55 arch/powerpc/mm/slice.c Aneesh Kumar K.V       2018-03-26  631  	return newaddr;
0dea04b288c066 arch/powerpc/mm/slice.c Aneesh Kumar K.V       2018-03-26  632  
0dea04b288c066 arch/powerpc/mm/slice.c Aneesh Kumar K.V       2018-03-26  633  return_addr:
f384796c40dc55 arch/powerpc/mm/slice.c Aneesh Kumar K.V       2018-03-26  634  	if (need_extra_context(mm, newaddr)) {
f384796c40dc55 arch/powerpc/mm/slice.c Aneesh Kumar K.V       2018-03-26  635  		if (alloc_extended_context(mm, newaddr) < 0)
f384796c40dc55 arch/powerpc/mm/slice.c Aneesh Kumar K.V       2018-03-26  636  			return -ENOMEM;
f384796c40dc55 arch/powerpc/mm/slice.c Aneesh Kumar K.V       2018-03-26  637  	}
0dea04b288c066 arch/powerpc/mm/slice.c Aneesh Kumar K.V       2018-03-26  638  	return newaddr;
d0f13e3c20b6fb arch/powerpc/mm/slice.c Benjamin Herrenschmidt 2007-05-08 @639  }
d0f13e3c20b6fb arch/powerpc/mm/slice.c Benjamin Herrenschmidt 2007-05-08  640  EXPORT_SYMBOL_GPL(slice_get_unmapped_area);
d0f13e3c20b6fb arch/powerpc/mm/slice.c Benjamin Herrenschmidt 2007-05-08  641  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--X1bOJ3K7DJ5YkBrT
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--X1bOJ3K7DJ5YkBrT--
