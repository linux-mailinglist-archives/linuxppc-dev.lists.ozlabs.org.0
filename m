Return-Path: <linuxppc-dev+bounces-3799-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A789E4550
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2024 21:10:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y3TCF5t9kz301f;
	Thu,  5 Dec 2024 07:10:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733343001;
	cv=none; b=J0JNm+qrDmVhSz3bRoQuE0tSvU0kPqywrs2a8T94RBj+NK2rn0CFXbRptZgUGMThcV8dwXld2i6LcdBppLkKKjrV+jgbA0OM5kE/5Iffs9UOQYeCiyvfB9GzTfawe5kFq7WHt9Ez30gTsGCWTh8NG7pRp0EY3n1n3re2w54t8evieAoy6imd9WskFjr8zgkeWdmxnXeYAqi7tsLNBm6SniePzwYpLpqRGuOsy3dfbjy75LkuVsLOkQZBUOPQ9AVWAYg8WnFo1yC+9Vn9WTsEc/o6xg6S/BGGr/IPUaaKaMgf1hgYhjRILrTFbamb2mzL0vMgVawgdJnBSq0CvS0gqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733343001; c=relaxed/relaxed;
	bh=/BwhslMYfbu9I4MdcABml5bIAoKPsGSafjmMg0Yp/eM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oDQWIhPMh3Sr05YwQxUkdoGW4204mMGPZjV57Jjr65mQOI2J9CcZmN1kOIbk0Z8OvoIB9x4nwvd4+UMb7/RCwtfdwRzQwsTyuIf5AzJgxKb4G2JZcFJBaMvTH2ecgYg+o1aF2UxAbcjkw8Acc9pA0pDpE0vcY2mxuwgA1kHvL2kFGfuHqX09HChNBe058/9+h8JZkA8RFag9DmfhwNELxAJeVHLHz6s7eby2JtDtSOFDMuOZfhx1kcECdbDcg4W8guMRHHwdQ1wp3nCwkZhSOzRTPaCjw0vrvVR/nfSygOF9mEV2pk1yRmKLgElRK60eKBiIhpFx1BjsIldX5rtcyw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ECzdEU7m; dkim-atps=neutral; spf=pass (client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ECzdEU7m;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y3TCC1TjMz2xnK
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Dec 2024 07:09:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733342999; x=1764878999;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yF6HQtLwTtRXYBnNwEC0Rc8WBNM/f0oVnV8EAkCZNuc=;
  b=ECzdEU7m1t1B6Ttrqsl2Dc/rRcXuDa2x+tS61FKa7MJ7eAdq1KCVIlEQ
   ip2xd/mVZvIuKFYSmuszLagXiYninaELTsPHmQeuDJRlx5gttpSd4dZ6J
   Q9rm4pdzQQaUi23nKKSnZLm3wr1NQ+O/2YGpRmgygB8nREAMoz7oMnAL1
   /XFlYVTqFMduTThLGVOOpoCm2Bw2Ntpvs/4gRiawMpkymU+UUNAtKoZ2F
   H0vBApnwhNVeCVw6J2v1NUPc0/iNRwmw4C8EGM/wKu14DRGd6Yg9v4jve
   7XnVZQ2VVmF7M9egvrHyQOduafkNaSwEIU5UeseQTlTgdu8+VAITmpshs
   w==;
X-CSE-ConnectionGUID: IWT9/u6SQWKaptrDNDHc6Q==
X-CSE-MsgGUID: O5KEutv7RhKaOLlpcDNoSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="45007402"
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; 
   d="scan'208";a="45007402"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 12:09:53 -0800
X-CSE-ConnectionGUID: hjKRbg0iTvuqQACuITIkjA==
X-CSE-MsgGUID: pgsX1FHaTcq981ieRnU2wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; 
   d="scan'208";a="124686798"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 04 Dec 2024 12:09:49 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIvgw-0003Rr-0U;
	Wed, 04 Dec 2024 20:09:46 +0000
Date: Thu, 5 Dec 2024 04:09:12 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Jason Baron <jbaron@akamai.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v4 4/4] powerpc/static_call: Implement inline static calls
Message-ID: <202412050317.rQGggDIb-lkp@intel.com>
References: <3dbd0b2ba577c942729235d0211d04a406653d81.1733245362.git.christophe.leroy@csgroup.eu>
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
In-Reply-To: <3dbd0b2ba577c942729235d0211d04a406653d81.1733245362.git.christophe.leroy@csgroup.eu>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Christophe,

kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/next]
[also build test WARNING on powerpc/fixes linus/master v6.13-rc1 next-20241204]
[cannot apply to tip/x86/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christophe-Leroy/static_call_inline-Provide-trampoline-address-when-updating-sites/20241204-120612
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/3dbd0b2ba577c942729235d0211d04a406653d81.1733245362.git.christophe.leroy%40csgroup.eu
patch subject: [PATCH v4 4/4] powerpc/static_call: Implement inline static calls
config: powerpc-randconfig-r062-20241204 (https://download.01.org/0day-ci/archive/20241205/202412050317.rQGggDIb-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241205/202412050317.rQGggDIb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412050317.rQGggDIb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/powerpc/platforms/powermac/bootx_init.c:18:
   In file included from arch/powerpc/include/asm/io.h:24:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   1 warning generated.
>> arch/powerpc/platforms/powermac/bootx_init.o: warning: objtool: bootx_init+0x28: unannotated intra-function call

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

