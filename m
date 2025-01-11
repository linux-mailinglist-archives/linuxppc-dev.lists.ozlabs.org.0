Return-Path: <linuxppc-dev+bounces-5084-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C61A0A610
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jan 2025 22:06:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YVrff15Hgz2yQL;
	Sun, 12 Jan 2025 08:06:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736629578;
	cv=none; b=IiSbiND/28DiQKQqIjr94uotaN3otg3YuhKhfzJJHmVCgOg3VbyChUGO2v1rLv8B2+zYQzgVtM2FU3XolWpmEP6rUzln5S2bIsnItsuDrEM7mUPgT2xYDfV/rsnuR+cTijYzJlZxsVCsJIuITzH0OHwA08Dy5txP10aqZJezsdhGCbcyj68YAorbbgyRrBsw09z5s6GU6EQ7+RaQhmpmWm/AlK2j6e9bA0s/nhQCsSaawV0eQQDlmBBRrU7n0hVwL/iYQG3ThM3dSp/GYahK21FOO23D6KdmEWxxQYiJrt7vhV/27LRmuGcBWDefURRQL0E+cU1SJszAuxCiAL8RqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736629578; c=relaxed/relaxed;
	bh=mvkdXy9lLysaT8QhM/d6vPcUTkE3PRgD0ZABECxyWp8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mScNOoHR/4YxWvB4ZyXW7A4ZDt61joL1sgwopszkmPNVlKYFeo12CxVNz/NjSsGEorghtY0pmYpwBTyz8gU2YissikCa78gMzohaRWOwolWYEReL+YZiafITJdiubCE3Ntt7mlvLzDwjK11gIdGRLR/0K1R2a8nOdY/zqUPzMWycyLy2r1b1OuLM+kTwu7s09UQRn5VS8amYf7Fan6sRnaF3xhnCyTyY223LYgR1WqGnHcoNAUZbXc1iPBwbtcxE7ypzE3zRimGG+6dfjLGeEHC8/iqJRLuJoP0n6yW8vNDxJbT5sFiICYuJUkvQqJY7IeqNYip0O7QfkRbm5ZSAbg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CidCj/v3; dkim-atps=neutral; spf=pass (client-ip=198.175.65.11; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CidCj/v3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.11; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YVrfZ3mQZz2yGN
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Jan 2025 08:06:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736629575; x=1768165575;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KIyVo7rhDv5U9a2m9uUPF1sHWPaMkt6MToDHXgzY2SQ=;
  b=CidCj/v3A14UWX7LylaMzu8BGqo7dSyITbAnYt/y44vM40mym+V1VC7y
   q9zNPzHgNv/eWPmKwEfm6DptRSFNRVdFgMwCp7m3ojVjq8FmJ41c16bpR
   PRj5QmxIj+LmvD1JOJP4/Vye33a40cC7Pfgq4JD9DWuxwerZu2wCISs77
   rjkTsG94Q72ti0/xcEkvm4Stc8Ei1kUWyoF0UVpHp8xmMW4cJ5xmx3EJB
   cD00K0EdnaboGte+VM8Eegm7r7Nmxo2hqJutCxveDD+ITzNDvFN7qo2z8
   9vcJxbAZthAezANr90zmknIm1I6C0y3rX9jmbVqXXWDQK39o4hYoKZmrC
   w==;
X-CSE-ConnectionGUID: wRJujcj7QveBRcWuPgtDkw==
X-CSE-MsgGUID: dF0Deo8JTk6Jjp/9InwEDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="47391052"
X-IronPort-AV: E=Sophos;i="6.12,308,1728975600"; 
   d="scan'208";a="47391052"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 13:06:05 -0800
X-CSE-ConnectionGUID: USUZh5MxQrKqMrvcO7TRsQ==
X-CSE-MsgGUID: v47+EjcAR0GF9DNRbLx7iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,308,1728975600"; 
   d="scan'208";a="109054185"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Jan 2025 13:05:58 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWig7-000LCn-2U;
	Sat, 11 Jan 2025 21:05:55 +0000
Date: Sun, 12 Jan 2025 05:05:19 +0800
From: kernel test robot <lkp@intel.com>
To: Andrey Albershteyn <aalbersh@redhat.com>, linux-fsdevel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Andrey Albershteyn <aalbersh@redhat.com>,
	linux-api@vger.kernel.org, monstr@monstr.eu, mpe@ellerman.id.au,
	npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org,
	maddy@linux.ibm.com, luto@kernel.org, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, hpa@zytor.com, chris@zankel.net, jcmvbkbc@gmail.com,
	viro@zeniv.linux.org.uk, brauner@kernel.org, jack@suse.cz,
	arnd@arndb.de, linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org
Subject: Re: [PATCH] fs: introduce getfsxattrat and setfsxattrat syscalls
Message-ID: <202501120410.3ZwwYXqY-lkp@intel.com>
References: <20250109174540.893098-1-aalbersh@kernel.org>
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
In-Reply-To: <20250109174540.893098-1-aalbersh@kernel.org>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Andrey,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brauner-vfs/vfs.all]
[also build test WARNING on geert-m68k/for-next powerpc/next powerpc/fixes s390/features linus/master v6.13-rc6 next-20250110]
[cannot apply to geert-m68k/for-linus deller-parisc/for-next jcmvbkbc-xtensa/xtensa-for-next tip/x86/asm]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrey-Albershteyn/fs-introduce-getfsxattrat-and-setfsxattrat-syscalls/20250110-014739
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20250109174540.893098-1-aalbersh%40kernel.org
patch subject: [PATCH] fs: introduce getfsxattrat and setfsxattrat syscalls
config: riscv-randconfig-002-20250111 (https://download.01.org/0day-ci/archive/20250112/202501120410.3ZwwYXqY-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250112/202501120410.3ZwwYXqY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501120410.3ZwwYXqY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> <stdin>:1615:2: warning: #warning syscall getfsxattrat not implemented [-Wcpp]
>> <stdin>:1618:2: warning: #warning syscall setfsxattrat not implemented [-Wcpp]
--
>> <stdin>:1615:2: warning: #warning syscall getfsxattrat not implemented [-Wcpp]
>> <stdin>:1618:2: warning: #warning syscall setfsxattrat not implemented [-Wcpp]
--
>> <stdin>:1615:2: warning: #warning syscall getfsxattrat not implemented [-Wcpp]
>> <stdin>:1618:2: warning: #warning syscall setfsxattrat not implemented [-Wcpp]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

