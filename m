Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCE393A973
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2024 00:47:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=J8rfQTYk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WTC344JWjz3cZ4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2024 08:47:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=J8rfQTYk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.18; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WTC2L4zrbz2y8p
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2024 08:47:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721774827; x=1753310827;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dl09buGlXJxjd9vfVzfVMrAdCdvLXfX2AOHwdw+scUQ=;
  b=J8rfQTYk5DEZaQXgEZQTq0ApT8ZG+Xwcbs4C739IgaJEz3ff9JTDeq5A
   Wb0XE5X+4ccfAt9+KgoUweEi/MYdW9UAVlmvKFCQhmgCRu4sa/6nk4zwG
   AWCmm2muHKzniGuXkPGosYds92Cu9oYTsM4yH6TEmsalz1Meu1VFx9HlQ
   4OIfSj10dWqRybGQpWz/mwGKBp2VQMFNiD2Eew9wGntBI3yKnfvMiqYnp
   0F3MFwZBkU0qOzebfvqBq7cMnSbnd20El7CVRF0u40Gg0LZxX/uNarxSr
   V0u7jO61YraJBr17/FPJneCdjF/0ERAhmS4RvVQ+u0StVPu5xFX2kqb0f
   Q==;
X-CSE-ConnectionGUID: uuDqIb7hTl6WBQYg5Ulf5w==
X-CSE-MsgGUID: ORWfRk8XTaOHxJgSY2p5mg==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="19555283"
X-IronPort-AV: E=Sophos;i="6.09,231,1716274800"; 
   d="scan'208";a="19555283"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2024 15:46:59 -0700
X-CSE-ConnectionGUID: C9dni4CPQI+dq/xQ9efZvw==
X-CSE-MsgGUID: gu2NC/fGTvivYgAzJI8ALg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,231,1716274800"; 
   d="scan'208";a="52613766"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 23 Jul 2024 15:46:55 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWOHU-000mQS-0g;
	Tue, 23 Jul 2024 22:46:52 +0000
Date: Wed, 24 Jul 2024 06:46:19 +0800
From: kernel test robot <lkp@intel.com>
To: Vignesh Balasubramanian <vigbalas@amd.com>,
	linux-kernel@vger.kernel.org, linux-toolchains@vger.kernel.org
Subject: Re: [PATCH v4 1/1] x86/elf: Add a new .note section containing
 xfeatures buffer layout info to x86 core files
Message-ID: <202407240659.eRyEDmG1-lkp@intel.com>
References: <20240723090454.8241-2-vigbalas@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240723090454.8241-2-vigbalas@amd.com>
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
Cc: felix.willgerodt@intel.com, x86@kernel.org, keescook@chromium.org, jhb@freebsd.org, bpetkov@amd.com, binutils@sourceware.org, llvm@lists.linux.dev, christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org, linux-mm@kvack.org, Vignesh Balasubramanian <vigbalas@amd.com>, npiggin@gmail.com, oe-kbuild-all@lists.linux.dev, naveen.n.rao@linux.ibm.com, Borislav Petkov <bp@alien8.de>, tglx@linutronix.de, linuxppc-dev@lists.ozlabs.org, jinisusan.george@amd.com, matz@suse.de, ebiederm@xmission.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Vignesh,

kernel test robot noticed the following build errors:

[auto build test ERROR on kees/for-next/execve]
[also build test ERROR on tip/x86/core kees/for-next/pstore kees/for-next/kspp linus/master v6.10 next-20240723]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vignesh-Balasubramanian/x86-elf-Add-a-new-note-section-containing-xfeatures-buffer-layout-info-to-x86-core-files/20240723-170946
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/execve
patch link:    https://lore.kernel.org/r/20240723090454.8241-2-vigbalas%40amd.com
patch subject: [PATCH v4 1/1] x86/elf: Add a new .note section containing xfeatures buffer layout info to x86 core files
config: x86_64-buildonly-randconfig-005-20240724 (https://download.01.org/0day-ci/archive/20240724/202407240659.eRyEDmG1-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240724/202407240659.eRyEDmG1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407240659.eRyEDmG1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
   ./usr/include/asm/elf.h:6:2: error: unknown type name 'u32'
       6 |         u32 type;
         |         ^
   ./usr/include/asm/elf.h:7:2: error: unknown type name 'u32'
       7 |         u32 size;
         |         ^
   ./usr/include/asm/elf.h:8:2: error: unknown type name 'u32'
       8 |         u32 offset;
         |         ^
   ./usr/include/asm/elf.h:9:2: error: unknown type name 'u32'
       9 |         u32 flags;
         |         ^
>> ./usr/include/asm/elf.h:12:16: error: static assertion failed due to requirement 'sizeof(struct x86_xfeat_component) % 4 == 0': x86_xfeat_component is not aligned
      12 | _Static_assert(sizeof(struct x86_xfeat_component)%4 == 0, "x86_xfeat_component is not aligned");
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ./usr/include/asm/elf.h:12:53: note: expression evaluates to '1 == 0'
      12 | _Static_assert(sizeof(struct x86_xfeat_component)%4 == 0, "x86_xfeat_component is not aligned");
         |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   5 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
