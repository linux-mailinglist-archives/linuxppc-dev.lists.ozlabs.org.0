Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA98805A4B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Dec 2023 17:51:14 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AMwB8fC8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sl64J14drz3dH1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Dec 2023 03:51:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AMwB8fC8;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sl63Q6QCjz3cRp
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Dec 2023 03:50:26 +1100 (AEDT)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4Sl63L2LW1z4wx7
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Dec 2023 03:50:22 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4Sl63L23YYz4wxY; Wed,  6 Dec 2023 03:50:22 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AMwB8fC8;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at gandalf; Wed, 06 Dec 2023 03:50:21 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4Sl63K5L1jz4wx7
	for <linuxppc-dev@ozlabs.org>; Wed,  6 Dec 2023 03:50:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701795021; x=1733331021;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7vZuH5HdSCPRNmPWg/voqIUI80Iu2AQu2Qzt7cwlHqI=;
  b=AMwB8fC85E+qKihImutHWLuUWHKYaROXYmleIRZvF6X85QZ496VZUOm+
   Z3IIYram4AqrgjojduxXMqPzTYy8ZdFxvhUNiYQW9/M5HnC/rC8qKTF+F
   YegNp/SlP073Zt+nc1BRcSb979sWkab9cnXmXeOLA+x2On7hKJD+BKrbn
   JnBNcBUX1SGQl8gIZm/n81ZcX2oUQ0RnRoNe54EPal5VcAdDR72NWsR/5
   rEXNqsSYiN4U1hF2kqZqFYWPzVqxzl7kWo2UrtlXYvb6mFy5ao25A8xoI
   6f/zHd4hLvKv+y46XIghNlK+Jv8f4pUKKnmxpE1HKKytZ/9EKoFXYgWuS
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="396714332"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="396714332"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 08:49:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="944328444"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="944328444"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 05 Dec 2023 08:49:05 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAYbU-0009OE-1c;
	Tue, 05 Dec 2023 16:49:00 +0000
Date: Wed, 6 Dec 2023 00:48:40 +0800
From: kernel test robot <lkp@intel.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@ozlabs.org
Subject: Re: [PATCH v13 6/6] powerpc: add crash memory hotplug support
Message-ID: <202312060059.JITEJl8B-lkp@intel.com>
References: <20231204053253.25305-7-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231204053253.25305-7-sourabhjain@linux.ibm.com>
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
Cc: David Hildenbrand <david@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, Mimi Zohar <zohar@linux.ibm.com>, Linux Memory Management List <linux-mm@kvack.org>, Eric DeVolder <eric.devolder@oracle.com>, Thomas Gleixner <tglx@linutronix.de>, Valentin Schneider <vschneid@redhat.com>, Baoquan He <bhe@redhat.com>, x86@kernel.org, Laurent Dufour <laurent.dufour@fr.ibm.com>, Dave Young <dyoung@redhat.com>, Vivek Goyal <vgoyal@redhat.com>, Borislav Petkov <bp@alien8.de>, oe-kbuild-all@lists.linux.dev, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Hari Bathini <hbathini@linux.ibm.com>, Oscar Salvador <osalvador@suse.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kexec@lists.infradead.org, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, Akhil Raj <lf32.dev@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Sourabh,

kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes tip/x86/core akpm-mm/mm-everything linus/master v6.7-rc4 next-20231205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sourabh-Jain/crash-make-CPU-and-Memory-hotplug-support-reporting-flexible/20231204-143305
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20231204053253.25305-7-sourabhjain%40linux.ibm.com
patch subject: [PATCH v13 6/6] powerpc: add crash memory hotplug support
config: powerpc64-randconfig-001-20231205 (https://download.01.org/0day-ci/archive/20231206/202312060059.JITEJl8B-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312060059.JITEJl8B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312060059.JITEJl8B-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/powerpc/kexec/core_64.c: In function 'arch_crash_get_elfcorehdr_size':
>> arch/powerpc/kexec/core_64.c:595:33: error: implicit declaration of function 'memory_hotplug_max' [-Werror=implicit-function-declaration]
     595 |                 elf_phdr_cnt += memory_hotplug_max() / (2 * drmem_lmb_size());
         |                                 ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/memory_hotplug_max +595 arch/powerpc/kexec/core_64.c

   579	
   580	/*
   581	 * Advertise preferred elfcorehdr size to userspace via
   582	 * /sys/kernel/crash_elfcorehdr_size sysfs interface.
   583	 */
   584	unsigned int arch_crash_get_elfcorehdr_size(void)
   585	{
   586		unsigned int sz;
   587		unsigned long elf_phdr_cnt;
   588	
   589		/* Program header for CPU notes and vmcoreinfo */
   590		elf_phdr_cnt = 2;
   591		if (IS_ENABLED(CONFIG_MEMORY_HOTPLUG))
   592			/* In the worst case, a Phdr is needed for every other LMB to be
   593			 * represented as an individual crash range.
   594			 */
 > 595			elf_phdr_cnt += memory_hotplug_max() / (2 * drmem_lmb_size());
   596	
   597		/* Do not cross the max limit */
   598		if (elf_phdr_cnt > PN_XNUM)
   599			elf_phdr_cnt = PN_XNUM;
   600	
   601		sz = sizeof(struct elfhdr) + (elf_phdr_cnt * sizeof(Elf64_Phdr));
   602		return sz;
   603	}
   604	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
