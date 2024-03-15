Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE02E87CDAB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Mar 2024 14:04:11 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kSenvBM+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tx4Fh49n9z3vbJ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Mar 2024 00:04:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kSenvBM+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.19; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tx4Dz445vz3d2x
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Mar 2024 00:03:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710507812; x=1742043812;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ara5mPb1l4pRKoFUqGzmnoTbO47MBQwiFpYzhwnLMXo=;
  b=kSenvBM+Q2D2uw1XkM+L03i8AJgWmCsctA2M0kx+pT7+TWilguP7SO4U
   /Gj5ml5bB0GBjOi9fYnN3Y67fDbW3QNbOQOPrTsXZC2uhIGmCrDIOkyyH
   zzvf0hBe23g9iC9ibuZeWzs4O/DrXRCF9E8uMfPdmMvpi89m4OVcovbc9
   ZqSlsOojGDtKjwbzoyngLTiHYf68h/uUyRzxStO15X74Q+V63lMSyXRM1
   uR+d/yr5DyD6dOIh/DCTyIsCg+7n2tvqnkGHJq+NOb1s7sHwZwO9pdZna
   pF5J5Z2OM4GQNBplJkjkLfqZ77hb5EIF6qouXB6Wu5aJ4FQyb4AWvYEEV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5240232"
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; 
   d="scan'208";a="5240232"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2024 06:00:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; 
   d="scan'208";a="35791084"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 15 Mar 2024 06:00:08 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rl7AM-000ERh-0w;
	Fri, 15 Mar 2024 13:00:06 +0000
Date: Fri, 15 Mar 2024 20:59:16 +0800
From: kernel test robot <lkp@intel.com>
To: Vignesh Balasubramanian <vigbalas@amd.com>,
	linux-kernel@vger.kernel.org, linux-toolchains@vger.kernel.org
Subject: Re: [PATCH 1/1] x86/elf: Add a new .note section containing
 Xfeatures information to x86 core files
Message-ID: <202403152037.J6Fn7uiP-lkp@intel.com>
References: <20240314112359.50713-2-vigbalas@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240314112359.50713-2-vigbalas@amd.com>
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
Cc: felix.willgerodt@intel.com, matz@suse.de, keescook@chromium.org, jhb@freebsd.org, bpetkov@amd.com, binutils@sourceware.org, x86@kernel.org, aneesh.kumar@kernel.org, linux-mm@kvack.org, Vignesh Balasubramanian <vigbalas@amd.com>, npiggin@gmail.com, oe-kbuild-all@lists.linux.dev, naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, jinisusan.george@amd.com, ebiederm@xmission.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Vignesh,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.8 next-20240315]
[cannot apply to kees/for-next/execve tip/x86/core powerpc/next powerpc/fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vignesh-Balasubramanian/x86-elf-Add-a-new-note-section-containing-Xfeatures-information-to-x86-core-files/20240314-192650
base:   linus/master
patch link:    https://lore.kernel.org/r/20240314112359.50713-2-vigbalas%40amd.com
patch subject: [PATCH 1/1] x86/elf: Add a new .note section containing Xfeatures information to x86 core files
config: x86_64-randconfig-122-20240315 (https://download.01.org/0day-ci/archive/20240315/202403152037.J6Fn7uiP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240315/202403152037.J6Fn7uiP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403152037.J6Fn7uiP-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/fpu/xstate.c: In function 'dump_xsave_layout_desc':
>> arch/x86/kernel/fpu/xstate.c:1858:22: error: implicit declaration of function 'dump_emit'; did you mean 'dir_emit'? [-Werror=implicit-function-declaration]
    1858 |                 if (!dump_emit(cprm, &xc, sizeof(struct xfeat_component)))
         |                      ^~~~~~~~~
         |                      dir_emit
   arch/x86/kernel/fpu/xstate.c: In function 'elf_coredump_extra_notes_write':
>> arch/x86/kernel/fpu/xstate.c:1903:14: error: implicit declaration of function 'dump_align'; did you mean 'dump_mapping'? [-Werror=implicit-function-declaration]
    1903 |         if (!dump_align(cprm, 4))
         |              ^~~~~~~~~~
         |              dump_mapping
   cc1: some warnings being treated as errors


vim +1858 arch/x86/kernel/fpu/xstate.c

  1846	
  1847		struct xfeat_component xc;
  1848		int num_records = 0;
  1849		int i;
  1850	
  1851		/* XFEATURE_FPU and XFEATURE_SSE, both are fixed legacy states. */
  1852		for (i = 0; i < FIRST_EXTENDED_XFEATURE; i++) {
  1853			xc.xfeat_type = i;
  1854			xc.xfeat_sz = xstate_sizes[i];
  1855			xc.xfeat_off = xstate_offsets[i];
  1856			xc.xfeat_flags = xstate_flags[i];
  1857	
> 1858			if (!dump_emit(cprm, &xc, sizeof(struct xfeat_component)))
  1859				return 0;
  1860			num_records++;
  1861		}
  1862	
  1863		for_each_extended_xfeature(i, fpu_user_cfg.max_features) {
  1864			xc.xfeat_type = i;
  1865			xc.xfeat_sz = xstate_sizes[i];
  1866			xc.xfeat_off = xstate_offsets[i];
  1867			xc.xfeat_flags = xstate_flags[i];
  1868	
  1869			if (!dump_emit(cprm, &xc, sizeof(struct xfeat_component)))
  1870				return 0;
  1871			num_records++;
  1872		}
  1873	
  1874		return num_records;
  1875	}
  1876	
  1877	static int get_xsave_desc_size(void)
  1878	{
  1879		/* XFEATURE_FP and XFEATURE_SSE, both are fixed legacy states */
  1880		int xfeatures_count = 2;
  1881		int i;
  1882	
  1883		for_each_extended_xfeature(i, fpu_user_cfg.max_features)
  1884			xfeatures_count++;
  1885	
  1886		return xfeatures_count * (sizeof(struct xfeat_component));
  1887	}
  1888	
  1889	int elf_coredump_extra_notes_write(struct coredump_params *cprm)
  1890	{
  1891		const char *owner_name = "LINUX";
  1892		int num_records = 0;
  1893		struct elf_note en;
  1894	
  1895		en.n_namesz = strlen(owner_name) + 1;
  1896		en.n_descsz = get_xsave_desc_size();
  1897		en.n_type = NT_X86_XSAVE_LAYOUT;
  1898	
  1899		if (!dump_emit(cprm, &en, sizeof(en)))
  1900			return 1;
  1901		if (!dump_emit(cprm, owner_name, en.n_namesz))
  1902			return 1;
> 1903		if (!dump_align(cprm, 4))
  1904			return 1;
  1905	
  1906		num_records = dump_xsave_layout_desc(cprm);
  1907		if (!num_records) {
  1908			pr_warn("Error adding XSTATE layout ELF note. XSTATE buffer in the core file will be unparseable.");
  1909			return 1;
  1910		}
  1911	
  1912		/* Total size should be equal to the number of records */
  1913		if ((sizeof(struct xfeat_component) * num_records) != en.n_descsz) {
  1914			pr_warn("Error adding XSTATE layout ELF note. The size of the .note section does not match with the total size of the records.");
  1915			return 1;
  1916		}
  1917	
  1918		if (!dump_align(cprm, 4))
  1919			return 1;
  1920	
  1921		return 0;
  1922	}
  1923	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
