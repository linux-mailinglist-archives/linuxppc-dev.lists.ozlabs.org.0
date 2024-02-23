Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C603086083A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Feb 2024 02:28:05 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jAuDn0tp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TgspC5MzLz3dXL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Feb 2024 12:28:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jAuDn0tp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TgsnQ52HGz3c0H
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Feb 2024 12:27:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708651642; x=1740187642;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VJfzL6GLEaZMoUqazrxisfj34PLQuSNA02WLHhDPT4k=;
  b=jAuDn0tpQ4DD0V/UiiSlk8TksOcZWYRfGUYoehBZqUoT3+vfMuJ14+5R
   z0aEiTNvjEFiC/U8gN+/udReKqz+zcF1dix3O2crm2TisESlNYejcUNBt
   LSUpwmp7GfhQ7voSVRzSIYErbyCutlv8kITLtOTE2GSIPdi6EBVBiSwAR
   BoUPuN/JclmuADsCswsx8o3n2PsugNysZf5whJs1bB1nUYILVR/MsS39l
   /UT0xqSQMDpXwVZ5yx6VBmK2PYbX0zlQ5SggPNOVXKR8G30+0YmS9+0ON
   gZlhBzQSipRabzizAdpm+K1eyzXs1F59V8Obg+2MB8IeNJOjdUVti+avw
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="14072593"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="14072593"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 17:27:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="6192032"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 22 Feb 2024 17:27:11 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdKL6-0006vK-2c;
	Fri, 23 Feb 2024 01:27:02 +0000
Date: Fri, 23 Feb 2024 09:26:10 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, arnd@arndb.de,
	javierm@redhat.com, deller@gmx.de, suijingfeng@loongson.cn
Subject: Re: [PATCH 2/3] arch: Remove struct fb_info from video helpers
Message-ID: <202402230941.JZdvHHEX-lkp@intel.com>
References: <20240221161431.8245-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240221161431.8245-3-tzimmermann@suse.de>
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
Cc: Andreas Larsson <andreas@gaisler.com>, linux-fbdev@vger.kernel.org, linux-sh@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, linux-arch@vger.kernel.org, x86@kernel.org, Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org, linux-m68k@lists.linux-m68k.org, Borislav Petkov <bp@alien8.de>, loongarch@lists.linux.dev, oe-kbuild-all@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, linuxppc-dev@lists.ozlabs.org
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
patch link:    https://lore.kernel.org/r/20240221161431.8245-3-tzimmermann%40suse.de
patch subject: [PATCH 2/3] arch: Remove struct fb_info from video helpers
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20240223/202402230941.JZdvHHEX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240223/202402230941.JZdvHHEX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402230941.JZdvHHEX-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `fbcon_select_primary':
>> drivers/video/fbdev/core/fbcon.c:2944: undefined reference to `video_is_primary_device'
   ld: vmlinux.o: in function `fb_io_mmap':
   drivers/video/fbdev/core/fb_io_fops.c:164: undefined reference to `pgprot_framebuffer'


vim +2944 drivers/video/fbdev/core/fbcon.c

  2939	
  2940	#ifdef CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY
  2941	static void fbcon_select_primary(struct fb_info *info)
  2942	{
  2943		if (!map_override && primary_device == -1 &&
> 2944		    video_is_primary_device(info->device)) {
  2945			int i;
  2946	
  2947			printk(KERN_INFO "fbcon: %s (fb%i) is primary device\n",
  2948			       info->fix.id, info->node);
  2949			primary_device = info->node;
  2950	
  2951			for (i = first_fb_vc; i <= last_fb_vc; i++)
  2952				con2fb_map_boot[i] = primary_device;
  2953	
  2954			if (con_is_bound(&fb_con)) {
  2955				printk(KERN_INFO "fbcon: Remapping primary device, "
  2956				       "fb%i, to tty %i-%i\n", info->node,
  2957				       first_fb_vc + 1, last_fb_vc + 1);
  2958				info_idx = primary_device;
  2959			}
  2960		}
  2961	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
