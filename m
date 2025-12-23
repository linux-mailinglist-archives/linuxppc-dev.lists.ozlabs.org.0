Return-Path: <linuxppc-dev+bounces-14951-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C812CD96DD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Dec 2025 14:23:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dbG1135m0z2yF1;
	Wed, 24 Dec 2025 00:23:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766496213;
	cv=none; b=COPJq64BDFolt+zrAidwg1Yl3+rcR4TihxHCPsh+E+qQV/NO5MBBqzA5mtfVV74GLYQKms65laZiSw7vdowpOvh7/UkjOngXBQudvYJ4deC4sMxwCGkvs4ZjTnydQfwAEZgis6mffRxZMFpaw9/r44zL21Xp9eS3BXAa0rId/ZTNeWhunEYRQHO5oOOOf4IHoFJXo1zjy8tnQ6zU8raWNy3k0NqOFIYLNoPaFgfR+IJE97yRk4IoddAylUNj4IL/Hthg3Z5a3HR26WbQ1d1ZagspYsk6nsXSC4M26LRg9mmnxsNM7XorGF+PThsKMYifKujGVcMwXADrGOZWxEUz5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766496213; c=relaxed/relaxed;
	bh=Ujoc4Did2a4hWKi0PVbKnoK20r76mRneQWS/N7RKfzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hU9yYGi7Jb3WiF9ql/l1F5tqpYe/nrSDS/g70eB7AOPGQBENOpYDgsbs1smLp8ZeUkTuLsI5hAxDOnFGH+PxGMYO6jqH81YDn2juJuj5iE5Rt9FIrkm5Qx0wBos7DOYwcRXLe4xPoAiq2rk/jxw4tqRZVoPZdhbeu//qu/H/d22CftrDltLd9/6PuGZsUzECZ03bT3/ay88EgAeAnQmlFXPDWp19Zq6IOcZob+z8Yx/A2zptW4Zt98fKbuZby57Rc0MF+FRVexvDteL7MxGJZLjW/NCTIQcSdywcJdjcLSkbkH4vGmGUXsOMPUxZBmLQ+OsioxKJYrieK7dIXwerjw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YubIZCg9; dkim-atps=neutral; spf=pass (client-ip=192.198.163.17; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YubIZCg9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.17; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dbG0z1vVhz2x99
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Dec 2025 00:23:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766496212; x=1798032212;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sVjyIGQrrpkyBkTFumzOYIT7xsfvu4X4mrPIwnTXsuo=;
  b=YubIZCg99NMGUJkn9boCA6dTJAcm/TonY5OlGt2rPtc4jVjlvvOI6x9L
   cdYa8BKdbKmLOySw1gH06qLAK4rWgCxmLKkviBSK6oM3SncJmTB8Aii0/
   jgSuwgj3fVQAGGxTckWdCoRGJf/kNgusmoqh3knLoYOSYiXuChaOvpRfo
   2EV0LuFvjs9sLDBtAQdda1eHO071VTo0C0ATThC5DSX/3iQzyHg/Z8fv0
   hEen6NBKPPUGteg9z4vhqmNG0DwtAbuIA2GWw1o6bcUWumTnvUHvJPW6N
   Lv3TUA0s3CFrYmSFMF4R1ia4whol3FX1hFXGPtOrSdAL5w5J6VocXjIXT
   g==;
X-CSE-ConnectionGUID: dmFJ3oLXROCeIn0+iCgyMQ==
X-CSE-MsgGUID: cdGVsbCeTdOZMTKpq509KQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="68226182"
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="68226182"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 05:23:25 -0800
X-CSE-ConnectionGUID: trY28Fj2ScOhqzvD2TJVPw==
X-CSE-MsgGUID: pablz/scS8mrJb7R/PPP9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="199691761"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 23 Dec 2025 05:23:21 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vY2MA-000000001xh-2Udu;
	Tue, 23 Dec 2025 13:23:18 +0000
Date: Tue, 23 Dec 2025 21:22:27 +0800
From: kernel test robot <lkp@intel.com>
To: Tamir Duberstein <tamird@kernel.org>, David Gow <davidgow@google.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>, Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Shuah Khan <skhan@linuxfoundation.org>, Kees Cook <kees@kernel.org>,
	Christophe Leroy <chleroy@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Muhammad Usama Anjum <usama.anjum@collabora.com>,
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org,
	Tamir Duberstein <tamird@gmail.com>
Subject: Re: [PATCH v2 3/3] bitmap: break kunit into test cases
Message-ID: <202512232124.O36Ud5C2-lkp@intel.com>
References: <20251222-bitmap-kunit-convert-v2-3-6a61a5330eff@gmail.com>
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
In-Reply-To: <20251222-bitmap-kunit-convert-v2-3-6a61a5330eff@gmail.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Tamir,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8f0b4cce4481fb22653697cced8d0d04027cb1e8]

url:    https://github.com/intel-lab-lkp/linux/commits/Tamir-Duberstein/test_bitmap-extract-benchmark-module/20251222-214306
base:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
patch link:    https://lore.kernel.org/r/20251222-bitmap-kunit-convert-v2-3-6a61a5330eff%40gmail.com
patch subject: [PATCH v2 3/3] bitmap: break kunit into test cases
config: sparc-randconfig-001-20251223 (https://download.01.org/0day-ci/archive/20251223/202512232124.O36Ud5C2-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512232124.O36Ud5C2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512232124.O36Ud5C2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/string.h:65,
                    from include/linux/bitmap.h:13,
                    from include/linux/cpumask.h:11,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/kref.h:16,
                    from include/kunit/test.h:22,
                    from lib/bitmap_kunit.c:6:
   lib/bitmap_kunit.c: In function 'test_bitmap_printlist':
>> arch/sparc/include/asm/string.h:18:29: warning: 'memset' used with length equal to number of elements without multiplication by element size [-Wmemset-elt-size]
      18 | #define memset(s, c, count) __builtin_memset(s, c, count)
         |                             ^~~~~~~~~~~~~~~~
   lib/bitmap_kunit.c:468:9: note: in expansion of macro 'memset'
     468 |         memset(bmap, -1, PAGE_SIZE);
         |         ^~~~~~


vim +/memset +18 arch/sparc/include/asm/string.h

70a6fcf3283a0a Al Viro 2016-01-17  16  
70a6fcf3283a0a Al Viro 2016-01-17  17  #define __HAVE_ARCH_MEMSET
70a6fcf3283a0a Al Viro 2016-01-17 @18  #define memset(s, c, count) __builtin_memset(s, c, count)
70a6fcf3283a0a Al Viro 2016-01-17  19  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

