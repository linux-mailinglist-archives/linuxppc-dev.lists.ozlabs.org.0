Return-Path: <linuxppc-dev+bounces-5081-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08673A0A476
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jan 2025 16:47:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YVjb44LjMz2yP8;
	Sun, 12 Jan 2025 02:47:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736610464;
	cv=none; b=Cj3NFljXD682Khr9iMG7OxU4CUcv+tskHCoPdQuuSncsm5VYo3vtHo9vwY5aPnE8fVSSYTRds+mhXqyDBfEohd6EywulucynS/FvzEYKpAwlIwPZYT2dRamHsjx/Yk+qq15YGJx7THBUcGYbfyd13DGPebGIBZBwJ6vvOA4CwRWye3RZSrOoJG7O7dLJlQMqnCqDM/OocW28vhQbWAPdrjb+kxNhqTKJbCOYQ/gOLOsyj95gWwQgzXyh7iyzpSSIMjj0HLyo18+l74AmbCzoyPx03uwNi4gGZv5P7p4CZQJS4c9D3FNk6/c9lC9JPLkREz3EVbDCWp4Wh6mltMWV0A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736610464; c=relaxed/relaxed;
	bh=dW0Y3OLXirtF2KtBYrYbIBJYUKU/g9TObXwbTI3O2Ac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SmJWAeE6pWLVGrNghCtksfSaRXlQ4xQw367ArEAxZNdXtMcF3kJURc/0APgdPW+lqv5oFIa40y+1nh3x+jGPGS3gsK6uFUdymJ4ThqhzBnulol+aimQs4X9i15VHFz3oqOaO+wiGjKP6kjr50ZDkLkJoct4l7s3tTwi7xVc5bhJoZBIG3AHrFQyyiKxk6gqhafglg6VBCFmgHku4m9CMXc0FtU/AuWTMgIvWcR8ySPXCxzHdIpLxAwQhHi18k+ybNyGDJ7X96WwgNn4zfBi0akMyjBX8Akue7gCw1ZS3pTln+FdJ9/JUps7m60sBb7YlGXCN7MA1kdulVpbwyrYxCg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ufoe67jH; dkim-atps=neutral; spf=pass (client-ip=192.198.163.19; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ufoe67jH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.19; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YVjb11Bsrz2y8X
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Jan 2025 02:47:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736610461; x=1768146461;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=b3P6KNSNfX8VCZ+6tJgRB2tHLM4xz/W71xYZ7MASfBg=;
  b=Ufoe67jHsUZysr74ImEX5yOm3uCdseyajbPjn60sqmDSp1jsXHINtUl0
   fWvbSuRa9Bu3y/xYoarsD5+uJewPeRqVwaXkCD9fvGLMDQfdlCIA8lJlb
   R/+h0bOV9eDecL0dKVsAdSRrDzpUdK1wgWUN5a/DD4MeUn9nSsSm7VbJe
   xq0MoUAFcBCjoDbg+CU6UmFr03Tc4AZne2QwDg9xosU0k92D6gydCG+Vu
   gDTaZJX0uxPs+1XP/JQNXXPZmuuabYDPr8phpQyEUDlk5wUp1y/KeFFEG
   9INq4yipigxCWrNXgnxgdA8GcqGx3i0OVl9O1PinJmKkkE+qQDvVKLub1
   Q==;
X-CSE-ConnectionGUID: paoM6AKuS02wtOUo1v4xHw==
X-CSE-MsgGUID: Ku2np7zESCaN7sWIqPgW/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="36105398"
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; 
   d="scan'208";a="36105398"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 07:47:33 -0800
X-CSE-ConnectionGUID: TrK7FUPAQ9a6FiuyaSBJlA==
X-CSE-MsgGUID: H2dRrx1jSreuGV87yZ9ZVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="127290445"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 11 Jan 2025 07:47:27 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWdhs-000Kqd-2f;
	Sat, 11 Jan 2025 15:47:24 +0000
Date: Sat, 11 Jan 2025 23:47:21 +0800
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
Message-ID: <202501112305.EPQr5jnx-lkp@intel.com>
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
config: s390-randconfig-r133-20250111 (https://download.01.org/0day-ci/archive/20250111/202501112305.EPQr5jnx-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250111/202501112305.EPQr5jnx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501112305.EPQr5jnx-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/inode.c:605:28: sparse: sparse: context imbalance in 'inode_wait_for_lru_isolating' - unexpected unlock
   fs/inode.c: note: in included file (through include/linux/wait.h, include/linux/wait_bit.h, include/linux/fs.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   fs/inode.c:999:28: sparse: sparse: context imbalance in 'inode_lru_isolate' - unexpected unlock
   fs/inode.c:1058:9: sparse: sparse: context imbalance in 'find_inode' - different lock contexts for basic block
   fs/inode.c:1099:9: sparse: sparse: context imbalance in 'find_inode_fast' - different lock contexts for basic block
   fs/inode.c:1829:5: sparse: sparse: context imbalance in 'insert_inode_locked' - wrong count at exit
   fs/inode.c:1947:20: sparse: sparse: context imbalance in 'iput_final' - unexpected unlock
   fs/inode.c:1961:6: sparse: sparse: context imbalance in 'iput' - wrong count at exit
   fs/inode.c:2494:17: sparse: sparse: context imbalance in '__wait_on_freeing_inode' - unexpected unlock
>> fs/inode.c:2960:1: sparse: sparse: Using plain integer as NULL pointer
>> fs/inode.c:2960:1: sparse: sparse: Using plain integer as NULL pointer
>> fs/inode.c:2960:1: sparse: sparse: Using plain integer as NULL pointer
>> fs/inode.c:2960:1: sparse: sparse: Using plain integer as NULL pointer
   fs/inode.c:2998:39: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct fsxattr [noderef] __user *ufa @@     got struct fsxattr *fsx @@
   fs/inode.c:2998:39: sparse:     expected struct fsxattr [noderef] __user *ufa
   fs/inode.c:2998:39: sparse:     got struct fsxattr *fsx
   fs/inode.c:2998:39: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct fsxattr [noderef] __user *ufa @@     got struct fsxattr *fsx @@
   fs/inode.c:2998:39: sparse:     expected struct fsxattr [noderef] __user *ufa
   fs/inode.c:2998:39: sparse:     got struct fsxattr *fsx
   fs/inode.c:3008:1: sparse: sparse: Using plain integer as NULL pointer
   fs/inode.c:3008:1: sparse: sparse: Using plain integer as NULL pointer
   fs/inode.c:3008:1: sparse: sparse: Using plain integer as NULL pointer
   fs/inode.c:3008:1: sparse: sparse: Using plain integer as NULL pointer
   fs/inode.c:3032:41: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct fsxattr [noderef] __user *ufa @@     got struct fsxattr *fsx @@
   fs/inode.c:3032:41: sparse:     expected struct fsxattr [noderef] __user *ufa
   fs/inode.c:3032:41: sparse:     got struct fsxattr *fsx
   fs/inode.c:3032:41: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct fsxattr [noderef] __user *ufa @@     got struct fsxattr *fsx @@
   fs/inode.c:3032:41: sparse:     expected struct fsxattr [noderef] __user *ufa
   fs/inode.c:3032:41: sparse:     got struct fsxattr *fsx

vim +2960 fs/inode.c

  2959	
> 2960	SYSCALL_DEFINE4(getfsxattrat, int, dfd, const char __user *, filename,
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
  2998		if (copy_fsxattr_to_user(&fa, fsx))
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

