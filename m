Return-Path: <linuxppc-dev+bounces-12650-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 614FEBB6875
	for <lists+linuxppc-dev@lfdr.de>; Fri, 03 Oct 2025 13:22:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cdR8P3qFYz3cyb;
	Fri,  3 Oct 2025 21:22:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759490533;
	cv=none; b=R9GAXF41nfQAETmKHoaLAgMrCFmoqQlQyYLPnx1ZbGkQwHmYGKi1yWPJjE5k5TMAN+I4kmBDPLPYGG3gbTiYghBONV49rooP7Ug3+R3pPKEJnwQfCdz+tpI0E44DRdp/SUaYl5IEe1H06TU1wqjCVkiLdbooSfHPyhak0XiFMINjrhOM5Q92VulhdgtzqD0dzgP3yw05DzzNXpfX8/g+GiptiX/XJNWb7V/bPgHvxV4DxBBiM+aQsV1n9lLTStkgIMO0bIAUFdxgUwdCU54u352OlO+5gzjxD3e4F8+nGgIAg6Vu+CHLpe6ltbgiaeaS336jJcvStu3ESXtfIRm1wg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759490533; c=relaxed/relaxed;
	bh=hcui1xd+byDXAsf0teQBqYMxtSoFz5qp9UMeqkQMaEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JSmwlOvRRyAKH1oaz+VUXKITwINSxkUhBHasyb8/piJaQwQbXGwWv+9vyB6HykKDIPOHAJrX9PZ18Fi38T9jFMyoP6IY5l4C+3OPBY3MVPiixPlLE+thXJETc/OV6zKURbeEllr9HxlC6HZELkYI8Mv0TvhFEouod9ZkclK6j+4bcSuii0QIkBGVWPcyv5b4XWmDXl9cDvxoQZWMeZ5PCYmjA9CU5fZh+eiQ7nYrdtHimJ+fBBN/F3nBIHpoWUbA9eJfburW0NX1/1weBIJtpXKV0uMa4t2ehhbgPjWDOkvbIBeHGyTbCjowtSlzonrVt8fluk8XZBut5o+QUtU0NQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZD7gv0XB; dkim-atps=neutral; spf=pass (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZD7gv0XB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cdR8L6DTFz2xnh
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Oct 2025 21:22:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759490531; x=1791026531;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SQ0wWE5s+n+etYy51keKtH5RFeBQ0HfzRhF5vbYQQLs=;
  b=ZD7gv0XB7FFVbEh1KFJsBAruT1D370NW+hMHFOOqLuVjEJUr6fGxT8vX
   qHjKyDQCNHNTyw3aglYyohvWtSQ7TtGAL0Tjlj0Wej3h5YBOjGEfIYL78
   SZl86L7lAsIK6jZu2+Fsmvt+gJdJ1RezOeDgBo0cC2bMwHRVZPsxyAkhr
   mDCjfWmZenYT7cASJfjc91D2K1bLOk4O6swMlIDp0Xi0zQO35oFerxcHR
   SCIPiXLercawovJj9gxZgpGdE36UF0CUAOwG16lzcUt6Q0k3OcIyxVmht
   nCX5iUFvzfYQjDfPBwfCLGdVneARn7RLxRucwhoYAF06NHANWAllyguCt
   A==;
X-CSE-ConnectionGUID: pxD42/LjTt6qekiMIBcCnw==
X-CSE-MsgGUID: vQrQlUpXRs+0T3sQK00iWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65598996"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="65598996"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2025 04:22:07 -0700
X-CSE-ConnectionGUID: A2+NWnNvTceCQPXkBdgigg==
X-CSE-MsgGUID: yuKJlNbaQEGhIEug+NUPYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; 
   d="scan'208";a="179080867"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 03 Oct 2025 04:22:02 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v4drK-0004Vj-2C;
	Fri, 03 Oct 2025 11:21:58 +0000
Date: Fri, 3 Oct 2025 19:21:53 +0800
From: kernel test robot <lkp@intel.com>
To: Hari Bathini <hbathini@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Naveen N. Rao" <naveen@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>, bpf@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Song Liu <songliubraving@fb.com>, Jiri Olsa <jolsa@kernel.org>,
	Viktor Malik <vmalik@redhat.com>, live-patching@vger.kernel.org,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	Jiri Kosina <jikos@kernel.org>, linux-trace-kernel@vger.kernel.org,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Shung-Hsi Yu <shung-hsi.yu@suse.com>
Subject: Re: [PATCH] powerpc64/bpf: support direct_call on livepatch function
Message-ID: <202510031817.t50YvoeN-lkp@intel.com>
References: <20251002192755.86441-1-hbathini@linux.ibm.com>
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
In-Reply-To: <20251002192755.86441-1-hbathini@linux.ibm.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Hari,

kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes trace/for-next bpf-next/net bpf-next/master bpf/master linus/master v6.17 next-20251002]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hari-Bathini/powerpc64-bpf-support-direct_call-on-livepatch-function/20251003-033243
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20251002192755.86441-1-hbathini%40linux.ibm.com
patch subject: [PATCH] powerpc64/bpf: support direct_call on livepatch function
config: powerpc64-randconfig-001-20251003 (https://download.01.org/0day-ci/archive/20251003/202510031817.t50YvoeN-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251003/202510031817.t50YvoeN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510031817.t50YvoeN-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/net/bpf_jit_comp.c:24:
   arch/powerpc/net/bpf_jit_comp.c: In function '__arch_prepare_bpf_trampoline':
>> include/linux/stddef.h:16:33: error: 'struct thread_info' has no member named 'livepatch_sp'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   arch/powerpc/net/bpf_jit.h:29:34: note: in definition of macro 'PLANT_INSTR'
      29 |         do { if (d) { (d)[idx] = instr; } idx++; } while (0)
         |                                  ^~~~~
   arch/powerpc/net/bpf_jit_comp.c:857:17: note: in expansion of macro 'EMIT'
     857 |                 EMIT(PPC_RAW_ADDI(_R12, _R12, offsetof(struct thread_info, livepatch_sp)));
         |                 ^~~~
   arch/powerpc/include/asm/ppc-opcode.h:501:85: note: in expansion of macro 'IMM_L'
     501 | #define PPC_RAW_ADDI(d, a, i)           (0x38000000 | ___PPC_RT(d) | ___PPC_RA(a) | IMM_L(i))
         |                                                                                     ^~~~~
   arch/powerpc/net/bpf_jit_comp.c:857:22: note: in expansion of macro 'PPC_RAW_ADDI'
     857 |                 EMIT(PPC_RAW_ADDI(_R12, _R12, offsetof(struct thread_info, livepatch_sp)));
         |                      ^~~~~~~~~~~~
   arch/powerpc/net/bpf_jit_comp.c:857:47: note: in expansion of macro 'offsetof'
     857 |                 EMIT(PPC_RAW_ADDI(_R12, _R12, offsetof(struct thread_info, livepatch_sp)));
         |                                               ^~~~~~~~
>> arch/powerpc/net/bpf_jit_comp.c:860:48: error: 'LIVEPATCH_STACK_FRAME_SIZE' undeclared (first use in this function)
     860 |                 EMIT(PPC_RAW_ADDI(_R12, _R12, -LIVEPATCH_STACK_FRAME_SIZE));
         |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/net/bpf_jit.h:29:34: note: in definition of macro 'PLANT_INSTR'
      29 |         do { if (d) { (d)[idx] = instr; } idx++; } while (0)
         |                                  ^~~~~
   arch/powerpc/net/bpf_jit_comp.c:860:17: note: in expansion of macro 'EMIT'
     860 |                 EMIT(PPC_RAW_ADDI(_R12, _R12, -LIVEPATCH_STACK_FRAME_SIZE));
         |                 ^~~~
   arch/powerpc/include/asm/ppc-opcode.h:501:85: note: in expansion of macro 'IMM_L'
     501 | #define PPC_RAW_ADDI(d, a, i)           (0x38000000 | ___PPC_RT(d) | ___PPC_RA(a) | IMM_L(i))
         |                                                                                     ^~~~~
   arch/powerpc/net/bpf_jit_comp.c:860:22: note: in expansion of macro 'PPC_RAW_ADDI'
     860 |                 EMIT(PPC_RAW_ADDI(_R12, _R12, -LIVEPATCH_STACK_FRAME_SIZE));
         |                      ^~~~~~~~~~~~
   arch/powerpc/net/bpf_jit_comp.c:860:48: note: each undeclared identifier is reported only once for each function it appears in
     860 |                 EMIT(PPC_RAW_ADDI(_R12, _R12, -LIVEPATCH_STACK_FRAME_SIZE));
         |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/net/bpf_jit.h:29:34: note: in definition of macro 'PLANT_INSTR'
      29 |         do { if (d) { (d)[idx] = instr; } idx++; } while (0)
         |                                  ^~~~~
   arch/powerpc/net/bpf_jit_comp.c:860:17: note: in expansion of macro 'EMIT'
     860 |                 EMIT(PPC_RAW_ADDI(_R12, _R12, -LIVEPATCH_STACK_FRAME_SIZE));
         |                 ^~~~
   arch/powerpc/include/asm/ppc-opcode.h:501:85: note: in expansion of macro 'IMM_L'
     501 | #define PPC_RAW_ADDI(d, a, i)           (0x38000000 | ___PPC_RT(d) | ___PPC_RA(a) | IMM_L(i))
         |                                                                                     ^~~~~
   arch/powerpc/net/bpf_jit_comp.c:860:22: note: in expansion of macro 'PPC_RAW_ADDI'
     860 |                 EMIT(PPC_RAW_ADDI(_R12, _R12, -LIVEPATCH_STACK_FRAME_SIZE));
         |                      ^~~~~~~~~~~~


vim +16 include/linux/stddef.h

6e218287432472 Richard Knutsson 2006-09-30  14  
^1da177e4c3f41 Linus Torvalds   2005-04-16  15  #undef offsetof
14e83077d55ff4 Rasmus Villemoes 2022-03-23 @16  #define offsetof(TYPE, MEMBER)	__builtin_offsetof(TYPE, MEMBER)
3876488444e712 Denys Vlasenko   2015-03-09  17  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

