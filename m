Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2408BF223
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2024 01:42:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n28LN7mQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VYvw66ByVz3cXC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2024 09:42:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n28LN7mQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VYvvL2jWDz3cXN
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 May 2024 09:42:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715125326; x=1746661326;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DOOMxtEONE1StSq2FtWYdjIVYayHInKfiOQ2VQA8DqI=;
  b=n28LN7mQeF17eovkkq1w9HeZP7BWPQ4xnXNOo++t9ZxweAR1D0N3DnIb
   8tJFgMbZUaABtyMBlvlcfc/UJdqNYD60Lx1hr39VnHPmbXtHDjzkumb2s
   ARAp0n4gH7CbMGeAhglJDjsxIW+UxyTcKCw6oz1ZtFxXJBKR3Z3TsREss
   9Jq3Y2rSXRvhkp4R8LMene6xSpUGNKNutLguXgMBVBP3KbbFvwjUicqar
   I+NC2BAxARTsFe2VytCFIKVzb/v9PZF3A/8aqz10N4/ro+PaDtruOapWe
   /40nbUtqHyE0XhqgkuC0lbXlWS/y14+Q9EMzcWK9ok+zcEIgfU5OhQAzA
   g==;
X-CSE-ConnectionGUID: 28gqkxV5T3SXLniTg3klNQ==
X-CSE-MsgGUID: 7J7m+IAhTdSzuWsQERBQ9w==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="33468074"
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; 
   d="scan'208";a="33468074"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2024 16:42:00 -0700
X-CSE-ConnectionGUID: yPv5lb/DRsK/JtKV/zB6FA==
X-CSE-MsgGUID: bkpKzxQHSzu23mvdV7jzUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; 
   d="scan'208";a="28647216"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 07 May 2024 16:41:55 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4URV-0002km-0v;
	Tue, 07 May 2024 23:41:53 +0000
Date: Wed, 8 May 2024 07:40:57 +0800
From: kernel test robot <lkp@intel.com>
To: Vignesh Balasubramanian <vigbalas@amd.com>,
	linux-kernel@vger.kernel.org, linux-toolchains@vger.kernel.org
Subject: Re: [PATCH v2 1/1] x86/elf: Add a new .note section containing
 Xfeatures information to x86 core files
Message-ID: <202405080715.hYQ1ae9v-lkp@intel.com>
References: <20240507095330.2674-2-vigbalas@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240507095330.2674-2-vigbalas@amd.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on kees/for-next/execve]
[also build test WARNING on tip/x86/core kees/for-next/pstore kees/for-next/kspp linus/master v6.9-rc7 next-20240507]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vignesh-Balasubramanian/x86-elf-Add-a-new-note-section-containing-Xfeatures-information-to-x86-core-files/20240507-175615
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/execve
patch link:    https://lore.kernel.org/r/20240507095330.2674-2-vigbalas%40amd.com
patch subject: [PATCH v2 1/1] x86/elf: Add a new .note section containing Xfeatures information to x86 core files
config: i386-buildonly-randconfig-006-20240508 (https://download.01.org/0day-ci/archive/20240508/202405080715.hYQ1ae9v-lkp@intel.com/config)
compiler: gcc-8 (Ubuntu 8.4.0-3ubuntu2) 8.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240508/202405080715.hYQ1ae9v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405080715.hYQ1ae9v-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/fpu/xstate.c:91:19: warning: 'owner_name' defined but not used [-Wunused-const-variable=]
    static const char owner_name[] = "LINUX";
                      ^~~~~~~~~~
   In file included from include/linux/string.h:369,
                    from arch/x86/include/asm/page_32.h:18,
                    from arch/x86/include/asm/page.h:14,
                    from arch/x86/include/asm/processor.h:20,
                    from arch/x86/include/asm/timex.h:5,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/compat.h:10,
                    from arch/x86/kernel/fpu/xstate.c:8:
   In function 'fortify_memcpy_chk',
       inlined from 'membuf_write.isra.6' at include/linux/regset.h:42:3,
       inlined from '__copy_xstate_to_uabi_buf' at arch/x86/kernel/fpu/xstate.c:1049:2:
   include/linux/fortify-string.h:562:4: warning: call to '__read_overflow2_field' declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()?
       __read_overflow2_field(q_size_field, size);
       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/owner_name +91 arch/x86/kernel/fpu/xstate.c

    90	
  > 91	static const char owner_name[] = "LINUX";
    92	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
