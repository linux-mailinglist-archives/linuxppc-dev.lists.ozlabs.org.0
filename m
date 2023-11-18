Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8F57F0262
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Nov 2023 20:28:01 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eR2bCyuW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SXkM20GtQz3d8Z
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Nov 2023 06:27:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eR2bCyuW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SXkL84p2Pz3cCv
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Nov 2023 06:27:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700335633; x=1731871633;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7oM0Oe15GY24uVXAs/p2DnzhDDjC2fzvA/A3qyVQxc4=;
  b=eR2bCyuWO59rupCPe3xDzi5+61ZUa7BHablm04sBM/Gle3DMjh3n7e3C
   eIVWRAD6Vi0mYFutzxGwIPGunq/iL2Cii/q3FTxN1BF+FmYFhG6DlSbYQ
   kXuBWi5KCPAFOnoW5cvH8nDK6GEcALelDq6+LBrP+nIHucr5LgZmLjqi4
   22BLZ0AyM47BZVwAzAvtdNvNlvDX0EG9f/M6IyK7yVtUKm6A9EdFBCLAL
   ejiRWbI+8Twa30IOQbRA5Wb+KQd1IqkrLdGuGbSTfqbz8YLCsgg5V6aWr
   R45fSrTDEj/958OnCjwgCpeCDCHB/wWH1NLhKJUHVSRwl6yuO9zGW9D5/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10898"; a="4554063"
X-IronPort-AV: E=Sophos;i="6.04,209,1695711600"; 
   d="scan'208";a="4554063"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2023 11:27:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,209,1695711600"; 
   d="scan'208";a="13795239"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 18 Nov 2023 11:26:59 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4Qxz-0004Cf-3C;
	Sat, 18 Nov 2023 19:26:55 +0000
Date: Sun, 19 Nov 2023 03:26:17 +0800
From: kernel test robot <lkp@intel.com>
To: Kefeng Wang <wangkefeng.wang@huawei.com>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] asm/io: remove unnecessary xlate_dev_mem_ptr() and
 unxlate_dev_mem_ptr()
Message-ID: <202311190352.yqCpBjIn-lkp@intel.com>
References: <20231118100827.1599422-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231118100827.1599422-1-wangkefeng.wang@huawei.com>
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
Cc: linux-arch@vger.kernel.org, Brian Cain <bcain@quicinc.com>, Kefeng Wang <wangkefeng.wang@huawei.com>, Rich Felker <dalias@libc.org>, linux-parisc@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-alpha@vger.kernel.org, Richard Henderson <richard.henderson@linaro.org>, Russell King <linux@armlinux.org.uk>, Nicholas Piggin <npiggin@gmail.com>, Stanislav Kinsburskii <stanislav.kinsburskii@gmail.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, linux-m68k@lists.linux-m68k.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, oe-kbuild-all@lists.linux.dev, sparclinux@vger.kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Kefeng,

kernel test robot noticed the following build errors:

[auto build test ERROR on soc/for-next]
[also build test ERROR on geert-m68k/for-next geert-m68k/for-linus deller-parisc/for-next powerpc/next powerpc/fixes linus/master v6.7-rc1 next-20231117]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kefeng-Wang/asm-io-remove-unnecessary-xlate_dev_mem_ptr-and-unxlate_dev_mem_ptr/20231118-183038
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/20231118100827.1599422-1-wangkefeng.wang%40huawei.com
patch subject: [PATCH] asm/io: remove unnecessary xlate_dev_mem_ptr() and unxlate_dev_mem_ptr()
config: mips-db1xxx_defconfig (https://download.01.org/0day-ci/archive/20231119/202311190352.yqCpBjIn-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231119/202311190352.yqCpBjIn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311190352.yqCpBjIn-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/char/mem.c: In function 'read_mem':
>> drivers/char/mem.c:159:31: error: implicit declaration of function 'xlate_dev_mem_ptr' [-Werror=implicit-function-declaration]
     159 |                         ptr = xlate_dev_mem_ptr(p);
         |                               ^~~~~~~~~~~~~~~~~
>> drivers/char/mem.c:159:29: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     159 |                         ptr = xlate_dev_mem_ptr(p);
         |                             ^
>> drivers/char/mem.c:164:25: error: implicit declaration of function 'unxlate_dev_mem_ptr' [-Werror=implicit-function-declaration]
     164 |                         unxlate_dev_mem_ptr(p, ptr);
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/char/mem.c: In function 'write_mem':
   drivers/char/mem.c:235:29: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     235 |                         ptr = xlate_dev_mem_ptr(p);
         |                             ^
   cc1: some warnings being treated as errors


vim +/xlate_dev_mem_ptr +159 drivers/char/mem.c

^1da177e4c3f41 Linus Torvalds                2005-04-16  133  
22ec1a2aea73b9 Kees Cook                     2017-12-01  134  	bounce = kmalloc(PAGE_SIZE, GFP_KERNEL);
22ec1a2aea73b9 Kees Cook                     2017-12-01  135  	if (!bounce)
22ec1a2aea73b9 Kees Cook                     2017-12-01  136  		return -ENOMEM;
22ec1a2aea73b9 Kees Cook                     2017-12-01  137  
^1da177e4c3f41 Linus Torvalds                2005-04-16  138  	while (count > 0) {
fa29e97bb8c70f Wu Fengguang                  2009-12-14  139  		unsigned long remaining;
b5b38200ebe548 Kees Cook                     2018-03-27  140  		int allowed, probe;
fa29e97bb8c70f Wu Fengguang                  2009-12-14  141  
f222318e9c3a31 Wu Fengguang                  2009-12-14  142  		sz = size_inside_page(p, count);
^1da177e4c3f41 Linus Torvalds                2005-04-16  143  
22ec1a2aea73b9 Kees Cook                     2017-12-01  144  		err = -EPERM;
a4866aa812518e Kees Cook                     2017-04-05  145  		allowed = page_is_allowed(p >> PAGE_SHIFT);
a4866aa812518e Kees Cook                     2017-04-05  146  		if (!allowed)
22ec1a2aea73b9 Kees Cook                     2017-12-01  147  			goto failed;
22ec1a2aea73b9 Kees Cook                     2017-12-01  148  
22ec1a2aea73b9 Kees Cook                     2017-12-01  149  		err = -EFAULT;
a4866aa812518e Kees Cook                     2017-04-05  150  		if (allowed == 2) {
a4866aa812518e Kees Cook                     2017-04-05  151  			/* Show zeros for restricted memory. */
a4866aa812518e Kees Cook                     2017-04-05  152  			remaining = clear_user(buf, sz);
a4866aa812518e Kees Cook                     2017-04-05  153  		} else {
^1da177e4c3f41 Linus Torvalds                2005-04-16  154  			/*
a4866aa812518e Kees Cook                     2017-04-05  155  			 * On ia64 if a page has been mapped somewhere as
a4866aa812518e Kees Cook                     2017-04-05  156  			 * uncached, then it must also be accessed uncached
a4866aa812518e Kees Cook                     2017-04-05  157  			 * by the kernel or data corruption may occur.
^1da177e4c3f41 Linus Torvalds                2005-04-16  158  			 */
^1da177e4c3f41 Linus Torvalds                2005-04-16 @159  			ptr = xlate_dev_mem_ptr(p);
e045fb2a988a9a venkatesh.pallipadi@intel.com 2008-03-18  160  			if (!ptr)
22ec1a2aea73b9 Kees Cook                     2017-12-01  161  				goto failed;
a4866aa812518e Kees Cook                     2017-04-05  162  
fe557319aa06c2 Christoph Hellwig             2020-06-17  163  			probe = copy_from_kernel_nofault(bounce, ptr, sz);
e045fb2a988a9a venkatesh.pallipadi@intel.com 2008-03-18 @164  			unxlate_dev_mem_ptr(p, ptr);
b5b38200ebe548 Kees Cook                     2018-03-27  165  			if (probe)
22ec1a2aea73b9 Kees Cook                     2017-12-01  166  				goto failed;
22ec1a2aea73b9 Kees Cook                     2017-12-01  167  
22ec1a2aea73b9 Kees Cook                     2017-12-01  168  			remaining = copy_to_user(buf, bounce, sz);
a4866aa812518e Kees Cook                     2017-04-05  169  		}
a4866aa812518e Kees Cook                     2017-04-05  170  
fa29e97bb8c70f Wu Fengguang                  2009-12-14  171  		if (remaining)
22ec1a2aea73b9 Kees Cook                     2017-12-01  172  			goto failed;
e045fb2a988a9a venkatesh.pallipadi@intel.com 2008-03-18  173  
^1da177e4c3f41 Linus Torvalds                2005-04-16  174  		buf += sz;
^1da177e4c3f41 Linus Torvalds                2005-04-16  175  		p += sz;
^1da177e4c3f41 Linus Torvalds                2005-04-16  176  		count -= sz;
^1da177e4c3f41 Linus Torvalds                2005-04-16  177  		read += sz;
8619e5bdeee8b2 Tetsuo Handa                  2019-08-26  178  		if (should_stop_iteration())
8619e5bdeee8b2 Tetsuo Handa                  2019-08-26  179  			break;
^1da177e4c3f41 Linus Torvalds                2005-04-16  180  	}
22ec1a2aea73b9 Kees Cook                     2017-12-01  181  	kfree(bounce);
^1da177e4c3f41 Linus Torvalds                2005-04-16  182  
^1da177e4c3f41 Linus Torvalds                2005-04-16  183  	*ppos += read;
^1da177e4c3f41 Linus Torvalds                2005-04-16  184  	return read;
22ec1a2aea73b9 Kees Cook                     2017-12-01  185  
22ec1a2aea73b9 Kees Cook                     2017-12-01  186  failed:
22ec1a2aea73b9 Kees Cook                     2017-12-01  187  	kfree(bounce);
22ec1a2aea73b9 Kees Cook                     2017-12-01  188  	return err;
^1da177e4c3f41 Linus Torvalds                2005-04-16  189  }
^1da177e4c3f41 Linus Torvalds                2005-04-16  190  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
