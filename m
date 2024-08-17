Return-Path: <linuxppc-dev+bounces-157-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E733895593D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Aug 2024 20:08:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=127.0.0.1
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HVuyCezx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WmRfq174Tz2xf2;
	Sun, 18 Aug 2024 04:08:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.9
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HVuyCezx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WmRfn156sz2xch
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Aug 2024 04:07:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723918082; x=1755454082;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Zh55/aHTFzFdC9YDeM4w2rjg1Nsri0R2Wv/Y3M/FWQ4=;
  b=HVuyCezxL12n18BgU7LjE6Ih1ttw2Jg2vdcjJbd7javFuG4Ka7XIeOVp
   phZlVUwlcD9BscRyJM8qzRkXJ9jFA5STKtZiBDxZedZ/nOZxOIgfXG/UZ
   bmQMZb/IMryp15Z8P5ByjUiKcW+FpHyMuyIffmX2Flp+uyYHDUCCIJYnm
   /c+gLez3LeHN3aoQOSlijCOpgxqOS0fbJ2YNWkeX/00jUBW9oPQ9XaM5J
   xKHCUKbfbd2fOwww2Ru+Os9WbuE3YWaRpLhr1P1fpXvkVIZ56cSkwN4iH
   nnZV3fWavDxcGmhW2bzaoSGzgswtb2iXXjUv6HuyiwJwJuFoK4Tgiy35d
   Q==;
X-CSE-ConnectionGUID: FC66ZoVdRROMwASfPx8T+g==
X-CSE-MsgGUID: dkr1MxFKQTa11BcQxQ74Lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11167"; a="44717723"
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; 
   d="scan'208";a="44717723"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2024 11:07:53 -0700
X-CSE-ConnectionGUID: oJQxy6IfT9GuFe5nH9Mf+Q==
X-CSE-MsgGUID: 6Q5k/NVOQ4i19saRocygOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; 
   d="scan'208";a="83176055"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 17 Aug 2024 11:07:49 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sfNq6-0007iU-2F;
	Sat, 17 Aug 2024 18:07:46 +0000
Date: Sun, 18 Aug 2024 02:07:08 +0800
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
Subject: Re: [PATCH 9/9] selftests: [NOT TO BE MERGED] Modifications for
 testing VDSO getrandom implementation on PPC32
Message-ID: <202408180121.HB9iN2PQ-lkp@intel.com>
References: <376843e024ffa73793e8ed99b72d299c6b239799.1723817900.git.christophe.leroy@csgroup.eu>
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
In-Reply-To: <376843e024ffa73793e8ed99b72d299c6b239799.1723817900.git.christophe.leroy@csgroup.eu>

Hi Christophe,

kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/next]
[also build test WARNING on powerpc/fixes shuah-kselftest/next shuah-kselftest/fixes linus/master v6.11-rc3]
[cannot apply to crng-random/master next-20240816]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christophe-Leroy/powerpc-vdso-Don-t-discard-rela-sections/20240816-223917
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/376843e024ffa73793e8ed99b72d299c6b239799.1723817900.git.christophe.leroy%40csgroup.eu
patch subject: [PATCH 9/9] selftests: [NOT TO BE MERGED] Modifications for testing VDSO getrandom implementation on PPC32
config: x86_64-randconfig-161-20240817 (https://download.01.org/0day-ci/archive/20240818/202408180121.HB9iN2PQ-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408180121.HB9iN2PQ-lkp@intel.com/

smatch warnings:
kernel/time/time.c:622 timespec64_to_jiffies() warn: always true condition '(sec >= ((((((((2147483647 >> 1) - 1) >> (32 - 10)) * ((1000000000 + 1000 / 2) / 1000)) / (1000000000)) << (1)) + (((((((2147483647 >> 1) - 1) >> (32 - 10)) * ((1000000000 + 1000 / 2) / 1000)) % (1000000000)) << (1)) + (1000000000) / 2) / (1000000000)) - 1)) => (0-u64max >= 0)'

vim +622 kernel/time/time.c

8b9365d753d9870 kernel/time.c      Ingo Molnar   2007-02-16  595  
67b3f564cb1e769 kernel/time/time.c Randy Dunlap  2023-07-03  596  /**
67b3f564cb1e769 kernel/time/time.c Randy Dunlap  2023-07-03  597   * timespec64_to_jiffies - convert a timespec64 value to jiffies
67b3f564cb1e769 kernel/time/time.c Randy Dunlap  2023-07-03  598   * @value: pointer to &struct timespec64
67b3f564cb1e769 kernel/time/time.c Randy Dunlap  2023-07-03  599   *
8b9365d753d9870 kernel/time.c      Ingo Molnar   2007-02-16  600   * The TICK_NSEC - 1 rounds up the value to the next resolution.  Note
8b9365d753d9870 kernel/time.c      Ingo Molnar   2007-02-16  601   * that a remainder subtract here would not do the right thing as the
4bf07f6562a01a4 kernel/time/time.c Ingo Molnar   2021-03-22  602   * resolution values don't fall on second boundaries.  I.e. the line:
8b9365d753d9870 kernel/time.c      Ingo Molnar   2007-02-16  603   * nsec -= nsec % TICK_NSEC; is NOT a correct resolution rounding.
d78c9300c51d6ce kernel/time/time.c Andrew Hunter 2014-09-04  604   * Note that due to the small error in the multiplier here, this
d78c9300c51d6ce kernel/time/time.c Andrew Hunter 2014-09-04  605   * rounding is incorrect for sufficiently large values of tv_nsec, but
d78c9300c51d6ce kernel/time/time.c Andrew Hunter 2014-09-04  606   * well formed timespecs should have tv_nsec < NSEC_PER_SEC, so we're
d78c9300c51d6ce kernel/time/time.c Andrew Hunter 2014-09-04  607   * OK.
8b9365d753d9870 kernel/time.c      Ingo Molnar   2007-02-16  608   *
8b9365d753d9870 kernel/time.c      Ingo Molnar   2007-02-16  609   * Rather, we just shift the bits off the right.
8b9365d753d9870 kernel/time.c      Ingo Molnar   2007-02-16  610   *
8b9365d753d9870 kernel/time.c      Ingo Molnar   2007-02-16  611   * The >> (NSEC_JIFFIE_SC - SEC_JIFFIE_SC) converts the scaled nsec
8b9365d753d9870 kernel/time.c      Ingo Molnar   2007-02-16  612   * value to a scaled second value.
67b3f564cb1e769 kernel/time/time.c Randy Dunlap  2023-07-03  613   *
67b3f564cb1e769 kernel/time/time.c Randy Dunlap  2023-07-03  614   * Return: jiffies value
8b9365d753d9870 kernel/time.c      Ingo Molnar   2007-02-16  615   */
751addac78b6f20 kernel/time/time.c Arnd Bergmann 2019-10-24  616  unsigned long
751addac78b6f20 kernel/time/time.c Arnd Bergmann 2019-10-24  617  timespec64_to_jiffies(const struct timespec64 *value)
8b9365d753d9870 kernel/time.c      Ingo Molnar   2007-02-16  618  {
751addac78b6f20 kernel/time/time.c Arnd Bergmann 2019-10-24  619  	u64 sec = value->tv_sec;
751addac78b6f20 kernel/time/time.c Arnd Bergmann 2019-10-24  620  	long nsec = value->tv_nsec + TICK_NSEC - 1;
8b9365d753d9870 kernel/time.c      Ingo Molnar   2007-02-16  621  
8b9365d753d9870 kernel/time.c      Ingo Molnar   2007-02-16 @622  	if (sec >= MAX_SEC_IN_JIFFIES){
8b9365d753d9870 kernel/time.c      Ingo Molnar   2007-02-16  623  		sec = MAX_SEC_IN_JIFFIES;
8b9365d753d9870 kernel/time.c      Ingo Molnar   2007-02-16  624  		nsec = 0;
8b9365d753d9870 kernel/time.c      Ingo Molnar   2007-02-16  625  	}
9ca308506062fc4 kernel/time/time.c Baolin Wang   2015-07-29  626  	return ((sec * SEC_CONVERSION) +
8b9365d753d9870 kernel/time.c      Ingo Molnar   2007-02-16  627  		(((u64)nsec * NSEC_CONVERSION) >>
8b9365d753d9870 kernel/time.c      Ingo Molnar   2007-02-16  628  		 (NSEC_JIFFIE_SC - SEC_JIFFIE_SC))) >> SEC_JIFFIE_SC;
8b9365d753d9870 kernel/time.c      Ingo Molnar   2007-02-16  629  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

