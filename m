Return-Path: <linuxppc-dev+bounces-5109-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BF8A0ADE2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 04:25:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWd261nrZz3c5Y;
	Mon, 13 Jan 2025 14:25:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736738750;
	cv=none; b=D6XBKChU24t9UslIGreyB7yvbW3FahU/K0g+xXF7Q6IJvP0jYd/umQpSHppU0ygg+rPrMuZ17YugEMqhbVY1BW8GGxFI6i+n7bkYmf6iDtnmSq5cyDVXYN1Z8NlYaOkFAaFvjqpCWDU8xpDqGBTdzA+pSVtDbFNYOV24x2di8AHv+aZrwSFEybjw9R8jyRJ/k/M1ea4EjeuKeZkd6NB/GMHfhkuosevx9HtlLRD/4AkRRTMs0LPhOSgAqkgzk+EKl3RSh7NDSS8S2QuyYybzaj/LczKeT9qcHFFNVEBA2ojCzNXoomcyO24S6YkllRRaRnWoZIcPTOSQjL0PpblhXg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736738750; c=relaxed/relaxed;
	bh=pPwbBr7P7vbdC/cSSQnbY6j7P0VG7jE5YLKAlDcCZQk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J902wFdPpx6eVJEV78k9bg517UzwrRL31Hktka5ikv/KP6lLQ8ge7C162O4X4GCrd/GazhaZgMV4jWpC4LGoOu3W68lmHAa1/wPowcCDDDn120NtQmtyPmXKxPYvRH4+Ow7V4KylcTqUVhpl5WIKI1rhcPSaxJUXxJeQnI1cjzYccwoJJq2VS3mUC1bzcdBdlZdZlEV78RhFhAuUuFnM47ApP5Jl4jKi1YQJoBZbUdiDc3Fx0p4vaxTqU82qXNbx7SkhdK5tRZxuOTkhtrQPMRhA9Ym6MoO7S+33bjd3zJ9tXrcjFG5rWBFCPIV47sMa07S8LXUs8wT1BLPVyXN4oQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=moYtNPSm; dkim-atps=neutral; spf=pass (client-ip=192.198.163.10; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=moYtNPSm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.10; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YWd234qK3z3c5X
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 14:25:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736738748; x=1768274748;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kDvnC74Lo6EZ1n3L3aZwXkWsD4GwjpMEPT/wHL2YzN4=;
  b=moYtNPSmEmhCiXIi9FsGhXk7gXUc1YaKg6dLc4dGp90ytl+F/0F3kWFy
   pl8jVlKbLl2a9m5MtgvfuugoXyVJqyOmlVtZKr+RpLTq2re8iLK5G0xqC
   Qqpkm42sp7rglDEifILzXkw+hLgGcvdMpAehH3kyoiwvx2BCwhbCOtpWB
   YWBbysCXSF9uhIAF3/cm3Jh2JEateQzRbjjS4RcoqicvWqMZFtR2OIEVP
   LzDzEunJ9LzqWVatIX9WknI0L3Fo8PAbI9osivWsK6ozlF4OG+rVD8xla
   YQ77ayfxOodFuvSMbk3wWnwc5TpOcd+8Ma8oBt+EyasKvMFFhUNVBl/7O
   Q==;
X-CSE-ConnectionGUID: w8Q1MfOHTm+/S4AgKmDzTQ==
X-CSE-MsgGUID: KdpFWN0sS66jDySMZ7AfpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11313"; a="48399185"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="48399185"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2025 19:25:42 -0800
X-CSE-ConnectionGUID: pGeiW06QRgC2unHlctenaQ==
X-CSE-MsgGUID: cNe1mltgTL6TwFBhawgDIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="104496936"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 12 Jan 2025 19:25:35 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tXB53-000Mfv-1I;
	Mon, 13 Jan 2025 03:25:33 +0000
Date: Mon, 13 Jan 2025 11:25:27 +0800
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
Message-ID: <202501131033.KKMmoHBV-lkp@intel.com>
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
config: m68k-randconfig-r122-20250111 (https://download.01.org/0day-ci/archive/20250113/202501131033.KKMmoHBV-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250113/202501131033.KKMmoHBV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501131033.KKMmoHBV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/inode.c:957:24: sparse: sparse: context imbalance in 'inode_lru_isolate' - wrong count at exit
   fs/inode.c:1058:9: sparse: sparse: context imbalance in 'find_inode' - different lock contexts for basic block
   fs/inode.c:1099:9: sparse: sparse: context imbalance in 'find_inode_fast' - different lock contexts for basic block
   fs/inode.c:1829:5: sparse: sparse: context imbalance in 'insert_inode_locked' - wrong count at exit
   fs/inode.c:1947:20: sparse: sparse: context imbalance in 'iput_final' - unexpected unlock
   fs/inode.c:1961:6: sparse: sparse: context imbalance in 'iput' - wrong count at exit
   fs/inode.c:2494:17: sparse: sparse: context imbalance in '__wait_on_freeing_inode' - unexpected unlock
>> fs/inode.c:2998:39: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct fsxattr [noderef] __user *ufa @@     got struct fsxattr *fsx @@
   fs/inode.c:2998:39: sparse:     expected struct fsxattr [noderef] __user *ufa
   fs/inode.c:2998:39: sparse:     got struct fsxattr *fsx
   fs/inode.c:3032:41: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct fsxattr [noderef] __user *ufa @@     got struct fsxattr *fsx @@
   fs/inode.c:3032:41: sparse:     expected struct fsxattr [noderef] __user *ufa
   fs/inode.c:3032:41: sparse:     got struct fsxattr *fsx

vim +2998 fs/inode.c

  2959	
  2960	SYSCALL_DEFINE4(getfsxattrat, int, dfd, const char __user *, filename,
  2961			struct fsxattr *, fsx, int, at_flags)
  2962	{
  2963		struct fd dir;
  2964		struct fileattr fa;
  2965		struct path filepath;
  2966		struct inode *inode;
  2967		int error;
  2968	
  2969		if (at_flags)
  2970			return -EINVAL;
  2971	
  2972		if (!capable(CAP_FOWNER))
  2973			return -EPERM;
  2974	
  2975		dir = fdget(dfd);
  2976		if (!fd_file(dir))
  2977			return -EBADF;
  2978	
  2979		if (!S_ISDIR(file_inode(fd_file(dir))->i_mode)) {
  2980			error = -EBADF;
  2981			goto out;
  2982		}
  2983	
  2984		error = user_path_at(dfd, filename, at_flags, &filepath);
  2985		if (error)
  2986			goto out;
  2987	
  2988		inode = filepath.dentry->d_inode;
  2989		if (file_inode(fd_file(dir))->i_sb->s_magic != inode->i_sb->s_magic) {
  2990			error = -EBADF;
  2991			goto out_path;
  2992		}
  2993	
  2994		error = vfs_fileattr_get(filepath.dentry, &fa);
  2995		if (error)
  2996			goto out_path;
  2997	
> 2998		if (copy_fsxattr_to_user(&fa, fsx))
  2999			error = -EFAULT;
  3000	
  3001	out_path:
  3002		path_put(&filepath);
  3003	out:
  3004		fdput(dir);
  3005		return error;
  3006	}
  3007	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

