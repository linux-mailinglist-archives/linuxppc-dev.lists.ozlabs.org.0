Return-Path: <linuxppc-dev+bounces-5078-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 80059A0A3C2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jan 2025 14:08:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YVf371ZmRz3c8Q;
	Sun, 12 Jan 2025 00:08:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736600899;
	cv=none; b=ahnoRgFs1/jCCIgZ8kONivHJRmRffTP11Y44aFXhK/L+jzHEfzpINPC4RvgnY1X2Uyx/ZLrScCmTPt5ZRknUUulghPezjpWtWliYf3yUtsuvVcm9ErXWghyObPpOc2eZ1LiWKmNPookTXy9Z8MAwS4LayTpQ5WV+b8Q1PKTbDLoiThuCacoiWbcbf1SAFgcCU2limZWKUxkxnvHuuXg/TaHCq3IAnKpAv1Ogs1MOf9LQkfarUQ9mxIAs8bNnL3wQuNvmuR2PXkrqOqCPHMjap6RdLMr+xQhJXMRtxX6S5sNyOTqqRX7AycQ7Z351i+85IAhauQdW61laTHZWCLHO+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736600899; c=relaxed/relaxed;
	bh=vhV53Az3xWQYguj1iDxFerMwVQLBwWduSnCH/IURp80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lCpH9XuxdQT9bbAVZopYQ4ITpRQ/hN9Fb4UR87+RUxymF7Z+249NZqeqhFNkDLdNVSUh3z6qC/jjLaTj4inps3Uq4hJHOx2I78oA+L0SLyBuTGNpdqu6UtpdIFF7okrAtcMU5kPDi5jXJoBRoBYKYcBl/GvE+E57Y3lV027iE8UyVYOxEAtrFMu/iiPdcN6Pl3ipcV4L5jPHDMnfeCC9c1mIgsFVKTNcczznLPkxwS+n4Ug5FFCeg2+DImC9zL1RQ4mgkOhfa2Zukxd0V5BQd7zioylWRshLWj3xd8gXeJIb7SCnjs3wskC5vtZgpIdXPZsp8gWlggJi5h6XhgEyIw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W9vkh8pJ; dkim-atps=neutral; spf=pass (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W9vkh8pJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YVf331Nswz30NY
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Jan 2025 00:08:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736600896; x=1768136896;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wdSwZqiGhYyZAx+e2IQorQXp43S0F5s8LS6LS3NEPn0=;
  b=W9vkh8pJJydPU7uG5Sw09LWF1pCktO5PjNUvArHQKRDUfj1ziYQYVRZ1
   Zc1xN/HSQ4IPUsjjOR2Vj/3Am8t5agKr3zvMVRssZm0JFMIV4XbuhAP/R
   lZYlP767v8y/4CWa+g0buq/zaew5611Dnk1ZdHSWaUBkwLIxz8GPjyd0q
   id4/nlyKB3mjfkjjrl/qS/L+cRmTSqPJ3eCuMMot9ivyNRXqebitKm5ds
   iQjpZwcX2FqdK+yQxUoDpVi2QDluCKXh8B7B3ZsPkEbCUf1ziiEGpTwyN
   Y5i2PG0coIAKCjmnJCRbhICWjNsLs48idJzmXZ5wd9wxhlf8RRwt492EL
   Q==;
X-CSE-ConnectionGUID: +Ya107KQQgydWh+5rq5pNw==
X-CSE-MsgGUID: uFHpSXL4Tgy/HW8R3SxIRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="59370305"
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; 
   d="scan'208";a="59370305"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 05:08:09 -0800
X-CSE-ConnectionGUID: 3/wqF2ZURhC4WRstUhiavQ==
X-CSE-MsgGUID: 6Lir+QKzQ4WRshUr7vMXAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; 
   d="scan'208";a="104040539"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 11 Jan 2025 05:08:01 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWbDa-000KfP-2E;
	Sat, 11 Jan 2025 13:07:58 +0000
Date: Sat, 11 Jan 2025 21:07:51 +0800
From: kernel test robot <lkp@intel.com>
To: Andrey Albershteyn <aalbersh@redhat.com>, linux-fsdevel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrey Albershteyn <aalbersh@redhat.com>, linux-api@vger.kernel.org,
	monstr@monstr.eu, mpe@ellerman.id.au, npiggin@gmail.com,
	christophe.leroy@csgroup.eu, naveen@kernel.org, maddy@linux.ibm.com,
	luto@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	chris@zankel.net, jcmvbkbc@gmail.com, viro@zeniv.linux.org.uk,
	brauner@kernel.org, jack@suse.cz, arnd@arndb.de,
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org
Subject: Re: [PATCH] fs: introduce getfsxattrat and setfsxattrat syscalls
Message-ID: <202501112052.ZJEvfjhd-lkp@intel.com>
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
[cannot apply to geert-m68k/for-linus deller-parisc/for-next jcmvbkbc-xtensa/xtensa-for-next arnd-asm-generic/master tip/x86/asm]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrey-Albershteyn/fs-introduce-getfsxattrat-and-setfsxattrat-syscalls/20250110-014739
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20250109174540.893098-1-aalbersh%40kernel.org
patch subject: [PATCH] fs: introduce getfsxattrat and setfsxattrat syscalls
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20250111/202501112052.ZJEvfjhd-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501112052.ZJEvfjhd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501112052.ZJEvfjhd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> <stdin>:1615:2: warning: syscall getfsxattrat not implemented [-W#warnings]
    1615 | #warning syscall getfsxattrat not implemented
         |  ^
>> <stdin>:1618:2: warning: syscall setfsxattrat not implemented [-W#warnings]
    1618 | #warning syscall setfsxattrat not implemented
         |  ^
   2 warnings generated.
--
>> <stdin>:1615:2: warning: syscall getfsxattrat not implemented [-W#warnings]
    1615 | #warning syscall getfsxattrat not implemented
         |  ^
>> <stdin>:1618:2: warning: syscall setfsxattrat not implemented [-W#warnings]
    1618 | #warning syscall setfsxattrat not implemented
         |  ^
   2 warnings generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

