Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4347BD356
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Oct 2023 08:26:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I5UPzp8X;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S3pw45pQjz3dvs
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Oct 2023 17:26:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I5UPzp8X;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S3pv91jZJz2xpm
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Oct 2023 17:25:57 +1100 (AEDT)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4S3pv63JQ4z4xWK
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Oct 2023 17:25:54 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4S3pv63FX5z4xWN; Mon,  9 Oct 2023 17:25:54 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I5UPzp8X;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at gandalf; Mon, 09 Oct 2023 17:25:53 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4S3pv56JXQz4xWK
	for <linuxppc-dev@ozlabs.org>; Mon,  9 Oct 2023 17:25:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696832754; x=1728368754;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sJXqXOIfAPxLhgqSJ8AdIy6V6w61PyA3IJTubSBppkY=;
  b=I5UPzp8X6tCTxTySZedRyeT7h3YsDBmwOl3UFGpoUQ0qmt5nGMw9iEtl
   jBjZBN7TEHuINydewO87u63sm8Qu2U7KDu1BMjwMDN61OBfUho8l5dX10
   BJI+vXhk9Hanbmrfv0k54mC9BA4RKn4fF1OwFeZMvofSxLGzlxi6zs8Uq
   CJkqju0lKb9QRchWXksMcQCDG68dHZKxw67VCWCooG1IUfqpVekyeFwO/
   rSl42j1yknjKk8TxY2Wg0k+gHtzZAaTuuu1suq/mTsb7TbcHv/7fVTaMA
   BxGD1nlUwuDjUXQ7+KBT9ON2sLQBr76gaGC3r1P4YdvNDiQPCbPpOraSi
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="450575353"
X-IronPort-AV: E=Sophos;i="6.03,209,1694761200"; 
   d="scan'208";a="450575353"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2023 23:24:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="1000076450"
X-IronPort-AV: E=Sophos;i="6.03,209,1694761200"; 
   d="scan'208";a="1000076450"
Received: from lkp-server01.sh.intel.com (HELO 8a3a91ad4240) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 08 Oct 2023 23:24:41 -0700
Received: from kbuild by 8a3a91ad4240 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qpjh1-000672-0T;
	Mon, 09 Oct 2023 06:24:39 +0000
Date: Mon, 9 Oct 2023 14:24:08 +0800
From: kernel test robot <lkp@intel.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@ozlabs.org,
	mpe@ellerman.id.au
Subject: Re: [PATCH v3 1/3] powerpc: make fadump resilient with memory
 add/remove events
Message-ID: <202310091444.dryLmXy1-lkp@intel.com>
References: <20231009041953.36139-2-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231009041953.36139-2-sourabhjain@linux.ibm.com>
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
Cc: mahesh@linux.vnet.ibm.com, adityag@linux.ibm.com, hbathini@linux.ibm.com, oe-kbuild-all@lists.linux.dev
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Sourabh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/next]
[also build test WARNING on powerpc/fixes linus/master v6.6-rc5 next-20231006]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sourabh-Jain/powerpc-make-fadump-resilient-with-memory-add-remove-events/20231009-122519
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20231009041953.36139-2-sourabhjain%40linux.ibm.com
patch subject: [PATCH v3 1/3] powerpc: make fadump resilient with memory add/remove events
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20231009/202310091444.dryLmXy1-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231009/202310091444.dryLmXy1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310091444.dryLmXy1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/powerpc/include/asm/mmu.h:143,
                    from arch/powerpc/include/asm/paca.h:18,
                    from arch/powerpc/include/asm/current.h:13,
                    from include/linux/thread_info.h:23,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/powerpc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from include/linux/memblock.h:12,
                    from arch/powerpc/kernel/fadump.c:18:
   arch/powerpc/kernel/fadump.c: In function 'fadump_free_elfcorehdr_buf':
>> arch/powerpc/include/asm/page.h:210:2: warning: passing argument 1 of 'fadump_free_buffer' makes integer from pointer without a cast [-Wint-conversion]
     210 | ({                                                                      \
         | ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |  |
         |  void *
     211 |         VIRTUAL_WARN_ON((unsigned long)(x) >= PAGE_OFFSET);             \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     212 |         (void *)(unsigned long)((phys_addr_t)(x) | PAGE_OFFSET);        \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     213 | })
         | ~~
   arch/powerpc/kernel/fadump.c:1401:28: note: in expansion of macro '__va'
    1401 |         fadump_free_buffer(__va(fdh->elfcorehdr_addr), fdh->elfcorehdr_size);
         |                            ^~~~
   arch/powerpc/kernel/fadump.c:795:46: note: expected 'long unsigned int' but argument is of type 'void *'
     795 | static void fadump_free_buffer(unsigned long vaddr, unsigned long size)
         |                                ~~~~~~~~~~~~~~^~~~~


vim +/fadump_free_buffer +210 arch/powerpc/include/asm/page.h

c4bce84d0bd3f3 Michael Ellerman 2022-04-07  203  
bdbc29c19b2633 Paul Mackerras   2013-08-27  204  /*
bdbc29c19b2633 Paul Mackerras   2013-08-27  205   * gcc miscompiles (unsigned long)(&static_var) - PAGE_OFFSET
bdbc29c19b2633 Paul Mackerras   2013-08-27  206   * with -mcmodel=medium, so we use & and | instead of - and + on 64-bit.
4dd7554a6456d1 Nicholas Piggin  2019-07-24  207   * This also results in better code generation.
bdbc29c19b2633 Paul Mackerras   2013-08-27  208   */
4dd7554a6456d1 Nicholas Piggin  2019-07-24  209  #define __va(x)								\
4dd7554a6456d1 Nicholas Piggin  2019-07-24 @210  ({									\
c4bce84d0bd3f3 Michael Ellerman 2022-04-07  211  	VIRTUAL_WARN_ON((unsigned long)(x) >= PAGE_OFFSET);		\
4dd7554a6456d1 Nicholas Piggin  2019-07-24  212  	(void *)(unsigned long)((phys_addr_t)(x) | PAGE_OFFSET);	\
4dd7554a6456d1 Nicholas Piggin  2019-07-24  213  })
4dd7554a6456d1 Nicholas Piggin  2019-07-24  214  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
