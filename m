Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D2986072A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Feb 2024 00:55:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JRfJ0Z6W;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tgqlq06GMz3dX3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Feb 2024 10:55:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JRfJ0Z6W;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tgql05x1qz3cb5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Feb 2024 10:55:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708646109; x=1740182109;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JAWPRH05PCaJ/qhm7l++x2p8cgx/eVbDSM0nYdWb/ZY=;
  b=JRfJ0Z6W6rZgXghgzzsJLpNXfvUqxUONsZrqUvE5chE7pPObL2HLtiBl
   l3qh3CIgJ614zGGZQFrXkeQQndQULaAomXlZPvjyF+2k+j6KRcRTI35EY
   ZIscT4MO9NEmPbcBSurnbmQksgaIFEBYB+elgSzZNTGZs3vp2opcbD8Y2
   HhatEh+To59m+SSCSJ8Btf4t0Xy0ZOWHm7Vs/5PSSSEFDWq0NSmnFMSMO
   7etkeGwC65wfbTHJhBZL9bnHcZ5AAE+jV/r1YB2UXQBGHiIowLi9W5jzL
   6IggMcP/BFBKSOjO7Q3NNFGVmQcfWia2NLGsh0YdeiHTVnWagvpAOeUHh
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="25387151"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="25387151"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 15:53:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="28809352"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 22 Feb 2024 15:52:39 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdIrl-0006o6-0y;
	Thu, 22 Feb 2024 23:52:37 +0000
Date: Fri, 23 Feb 2024 07:52:13 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, arnd@arndb.de,
	javierm@redhat.com, deller@gmx.de, suijingfeng@loongson.cn
Subject: Re: [PATCH 3/3] arch: Rename fbdev header and source files
Message-ID: <202402230737.e7gWpGUp-lkp@intel.com>
References: <20240221161431.8245-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240221161431.8245-4-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, llvm@lists.linux.dev, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, sparclinux@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Huacai Chen <chenhuacai@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org, Nicholas Piggin <npiggin@gmail.com>, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/x86/core]
[also build test ERROR on deller-parisc/for-next arnd-asm-generic/master linus/master v6.8-rc5]
[cannot apply to next-20240222]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/arch-Select-fbdev-helpers-with-CONFIG_VIDEO/20240222-001622
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20240221161431.8245-4-tzimmermann%40suse.de
patch subject: [PATCH 3/3] arch: Rename fbdev header and source files
config: um-randconfig-002-20240222 (https://download.01.org/0day-ci/archive/20240223/202402230737.e7gWpGUp-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project edd4aee4dd9b5b98b2576a6f783e4086173d902a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240223/202402230737.e7gWpGUp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402230737.e7gWpGUp-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
   /usr/bin/ld: drivers/video/fbdev/core/fb_io_fops.o: in function `fb_io_mmap':
>> drivers/video/fbdev/core/fb_io_fops.c:164: undefined reference to `pgprot_framebuffer'
   clang: error: linker command failed with exit code 1 (use -v to see invocation)


vim +164 drivers/video/fbdev/core/fb_io_fops.c

6b180f66c0dd62 Thomas Zimmermann 2023-09-27  140  
33253d9e01d405 Thomas Zimmermann 2023-11-27  141  int fb_io_mmap(struct fb_info *info, struct vm_area_struct *vma)
33253d9e01d405 Thomas Zimmermann 2023-11-27  142  {
33253d9e01d405 Thomas Zimmermann 2023-11-27  143  	unsigned long start = info->fix.smem_start;
33253d9e01d405 Thomas Zimmermann 2023-11-27  144  	u32 len = info->fix.smem_len;
33253d9e01d405 Thomas Zimmermann 2023-11-27  145  	unsigned long mmio_pgoff = PAGE_ALIGN((start & ~PAGE_MASK) + len) >> PAGE_SHIFT;
33253d9e01d405 Thomas Zimmermann 2023-11-27  146  
b3e8813773c568 Thomas Zimmermann 2023-11-27  147  	if (info->flags & FBINFO_VIRTFB)
b3e8813773c568 Thomas Zimmermann 2023-11-27  148  		fb_warn_once(info, "Framebuffer is not in I/O address space.");
b3e8813773c568 Thomas Zimmermann 2023-11-27  149  
33253d9e01d405 Thomas Zimmermann 2023-11-27  150  	/*
33253d9e01d405 Thomas Zimmermann 2023-11-27  151  	 * This can be either the framebuffer mapping, or if pgoff points
33253d9e01d405 Thomas Zimmermann 2023-11-27  152  	 * past it, the mmio mapping.
33253d9e01d405 Thomas Zimmermann 2023-11-27  153  	 */
33253d9e01d405 Thomas Zimmermann 2023-11-27  154  	if (vma->vm_pgoff >= mmio_pgoff) {
33253d9e01d405 Thomas Zimmermann 2023-11-27  155  		if (info->var.accel_flags)
33253d9e01d405 Thomas Zimmermann 2023-11-27  156  			return -EINVAL;
33253d9e01d405 Thomas Zimmermann 2023-11-27  157  
33253d9e01d405 Thomas Zimmermann 2023-11-27  158  		vma->vm_pgoff -= mmio_pgoff;
33253d9e01d405 Thomas Zimmermann 2023-11-27  159  		start = info->fix.mmio_start;
33253d9e01d405 Thomas Zimmermann 2023-11-27  160  		len = info->fix.mmio_len;
33253d9e01d405 Thomas Zimmermann 2023-11-27  161  	}
33253d9e01d405 Thomas Zimmermann 2023-11-27  162  
33253d9e01d405 Thomas Zimmermann 2023-11-27  163  	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
33253d9e01d405 Thomas Zimmermann 2023-11-27 @164  	vma->vm_page_prot = pgprot_framebuffer(vma->vm_page_prot, vma->vm_start,
33253d9e01d405 Thomas Zimmermann 2023-11-27  165  					       vma->vm_end, start);
33253d9e01d405 Thomas Zimmermann 2023-11-27  166  
33253d9e01d405 Thomas Zimmermann 2023-11-27  167  	return vm_iomap_memory(vma, start, len);
33253d9e01d405 Thomas Zimmermann 2023-11-27  168  }
33253d9e01d405 Thomas Zimmermann 2023-11-27  169  EXPORT_SYMBOL(fb_io_mmap);
33253d9e01d405 Thomas Zimmermann 2023-11-27  170  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
