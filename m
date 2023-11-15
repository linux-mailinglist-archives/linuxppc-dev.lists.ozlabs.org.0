Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E317EC91F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Nov 2023 18:00:52 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mt7xhBNQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SVqDd2GXsz3dBw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Nov 2023 04:00:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mt7xhBNQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SVqCh0bjPz3c1C
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Nov 2023 03:59:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700067600; x=1731603600;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9uKcFY4QauvFYKvl+Sytq0IYlA4lqNfQ+9TYosW5GMY=;
  b=mt7xhBNQckuqTTdSBl2Midi/KyDz0EgMOG70dL6ggTBSnPZh1UTpMdKm
   L+3F9SoLCWqdbDBFQ5KfoDintn2zWz1Fr4wKJiO4QpSGRye3LRxngxtzy
   kxY8Ml6dn28yemJ4JqZo8DOrerPOGf3LOIeKcyDs427xxh3CTpDq9lVwq
   lriUQHGpzLRz5zu1iS3rSXsx7GmM+HC4rG26FSW9blnFPKzQD0+Vw7srG
   XjDG8ZJ+Q67jC0/cc7tXK8bOwH6bKF7w0+wxP8VoUkcOsBpKQq+aqAZ/k
   OGRHXQBMwqAILGPtCHybwjk7BVFEix1hvit3Am+ltwGawyXDzQFCm7YSf
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="375952891"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="375952891"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 08:59:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="6220123"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 15 Nov 2023 08:59:30 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3JEe-0000c8-0k;
	Wed, 15 Nov 2023 16:59:28 +0000
Date: Thu, 16 Nov 2023 00:58:29 +0800
From: kernel test robot <lkp@intel.com>
To: Baoquan He <bhe@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/7] kexec_file, arm64: print out debugging message if
 required
Message-ID: <202311160022.QM6xJYSy-lkp@intel.com>
References: <20231114153253.241262-5-bhe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231114153253.241262-5-bhe@redhat.com>
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
Cc: Baoquan He <bhe@redhat.com>, linux-parisc@vger.kernel.org, x86@kernel.org, kexec@lists.infradead.org, oe-kbuild-all@lists.linux.dev, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Baoquan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on arm64/for-next/core]
[also build test WARNING on tip/x86/core powerpc/next powerpc/fixes linus/master v6.7-rc1 next-20231115]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Baoquan-He/kexec_file-add-kexec_file-flag-to-control-debug-printing/20231114-234003
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20231114153253.241262-5-bhe%40redhat.com
patch subject: [PATCH 4/7] kexec_file, arm64: print out debugging message if required
config: arm64-randconfig-001-20231115 (https://download.01.org/0day-ci/archive/20231116/202311160022.QM6xJYSy-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231116/202311160022.QM6xJYSy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311160022.QM6xJYSy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kernel/machine_kexec.c: In function '_kexec_image_info':
>> arch/arm64/kernel/machine_kexec.c:35:23: warning: unused variable 'i' [-Wunused-variable]
      35 |         unsigned long i;
         |                       ^


vim +/i +35 arch/arm64/kernel/machine_kexec.c

d28f6df1305a86 Geoff Levand 2016-06-23  27  
221f2c770e10d3 Geoff Levand 2016-06-23  28  /**
221f2c770e10d3 Geoff Levand 2016-06-23  29   * kexec_image_info - For debugging output.
221f2c770e10d3 Geoff Levand 2016-06-23  30   */
221f2c770e10d3 Geoff Levand 2016-06-23  31  #define kexec_image_info(_i) _kexec_image_info(__func__, __LINE__, _i)
221f2c770e10d3 Geoff Levand 2016-06-23  32  static void _kexec_image_info(const char *func, int line,
221f2c770e10d3 Geoff Levand 2016-06-23  33  	const struct kimage *kimage)
221f2c770e10d3 Geoff Levand 2016-06-23  34  {
221f2c770e10d3 Geoff Levand 2016-06-23 @35  	unsigned long i;
221f2c770e10d3 Geoff Levand 2016-06-23  36  
f24d07b8c8e272 Baoquan He   2023-11-14  37  	kexec_dprintk("%s:%d:\n", func, line);
f24d07b8c8e272 Baoquan He   2023-11-14  38  	kexec_dprintk("  kexec kimage info:\n");
f24d07b8c8e272 Baoquan He   2023-11-14  39  	kexec_dprintk("    type:        %d\n", kimage->type);
f24d07b8c8e272 Baoquan He   2023-11-14  40  	kexec_dprintk("    head:        %lx\n", kimage->head);
f24d07b8c8e272 Baoquan He   2023-11-14  41  	kexec_dprintk("    kern_reloc: %pa\n", &kimage->arch.kern_reloc);
f24d07b8c8e272 Baoquan He   2023-11-14  42  	kexec_dprintk("    el2_vectors: %pa\n", &kimage->arch.el2_vectors);
221f2c770e10d3 Geoff Levand 2016-06-23  43  }
221f2c770e10d3 Geoff Levand 2016-06-23  44  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
