Return-Path: <linuxppc-dev+bounces-155-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E17F9557E7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Aug 2024 14:48:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=127.0.0.1
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gXBPyWMT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WmJZV0jqXz2xT9;
	Sat, 17 Aug 2024 22:48:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.12
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gXBPyWMT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WmJZS3D84z2xFq
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Aug 2024 22:48:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723898929; x=1755434929;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3AlbDRi86u9EhNaNflWrcwKVKeWeCwuXaFv/Oj7Z604=;
  b=gXBPyWMT4rRA9IUyNy4LhjhFn5UZHN5qo51R/2UGDlX2lHmRCjEMTuRE
   qfo+9ZhpWLgiXA+boSaFAG9WVi+98MMGynGNQpU3G4TNX3Cnyh6e5LmgC
   DAWM8KgTpwiX7PK76K+wzetlc0WhlmOuSIruzRpxf0lGNGgXekuExC1XD
   CZOBg68EqRSJ3pXURA7X3JXoRCpeLnCsV8eIaY63tA2qJCtsKZK89GzdK
   zl7EDRuqCnidemDWQD+HWuJcGprz1+WN29HilRpp89pShnepkyD59veBC
   ek5krPV584ZuMWcIljI0yHjAzFbuSZuprLuAMb3D+/+Ks0dbFknyoSMVp
   A==;
X-CSE-ConnectionGUID: jukJWzkNQ7WbnLyFCjObOQ==
X-CSE-MsgGUID: aHjGvuzVTQKIlGI5BsC9mQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11167"; a="33568586"
X-IronPort-AV: E=Sophos;i="6.10,154,1719903600"; 
   d="scan'208";a="33568586"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2024 05:48:42 -0700
X-CSE-ConnectionGUID: M2214yHERHSVfojmdFc6jw==
X-CSE-MsgGUID: ra6VrFjoQ+6mTaOAaVmbEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,154,1719903600"; 
   d="scan'208";a="90672395"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 17 Aug 2024 05:48:37 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sfIrC-0007Sg-1D;
	Sat, 17 Aug 2024 12:48:34 +0000
Date: Sat, 17 Aug 2024 20:48:27 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Theodore Ts'o <tytso@mit.edu>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Andy Lutomirski <luto@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-arch@vger.kernel.org
Subject: Re: [PATCH 3/9] vdso: Add __arch_get_k_vdso_rng_data()
Message-ID: <202408172056.OAokF1z5-lkp@intel.com>
References: <a7bdbbb14d8635c1e33ada7982cf2cd1a8321e5c.1723817900.git.christophe.leroy@csgroup.eu>
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
In-Reply-To: <a7bdbbb14d8635c1e33ada7982cf2cd1a8321e5c.1723817900.git.christophe.leroy@csgroup.eu>

Hi Christophe,

kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes crng-random/master shuah-kselftest/next shuah-kselftest/fixes linus/master v6.11-rc3 next-20240816]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christophe-Leroy/powerpc-vdso-Don-t-discard-rela-sections/20240816-223917
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/a7bdbbb14d8635c1e33ada7982cf2cd1a8321e5c.1723817900.git.christophe.leroy%40csgroup.eu
patch subject: [PATCH 3/9] vdso: Add __arch_get_k_vdso_rng_data()
config: x86_64-randconfig-003-20240817 (https://download.01.org/0day-ci/archive/20240817/202408172056.OAokF1z5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240817/202408172056.OAokF1z5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408172056.OAokF1z5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld: drivers/char/random.o:arch/x86/include/asm/vdso/vsyscall.h:13: multiple definition of `_vdso_rng_data'; kernel/time/vsyscall.o:arch/x86/include/asm/vdso/vsyscall.h:13: first defined here
>> ld: drivers/char/random.o:arch/x86/include/asm/vdso/vsyscall.h:12: multiple definition of `_vdso_data'; kernel/time/vsyscall.o:arch/x86/include/asm/vdso/vsyscall.h:12: first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

