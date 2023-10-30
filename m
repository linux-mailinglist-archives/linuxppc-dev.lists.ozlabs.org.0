Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F7F7DB1B9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Oct 2023 01:44:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QG+DqKzG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SJZKn15mjz3cBs
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Oct 2023 11:44:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QG+DqKzG;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SJZJt3rmwz30NN
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Oct 2023 11:43:58 +1100 (AEDT)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4SJZJt3Wwvz4wd6
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Oct 2023 11:43:58 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4SJZJt3TF2z4wdD; Mon, 30 Oct 2023 11:43:58 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QG+DqKzG;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4SJZJs1Pj8z4wd6
	for <linuxppc-dev@ozlabs.org>; Mon, 30 Oct 2023 11:43:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698626637; x=1730162637;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=g1ypwRov0tzM3HEybZ/eYo/bLezi/zNSOOpCeGQJlxc=;
  b=QG+DqKzGlDYOXTkM+z26z/NQu5B3HTN+vbmDpUjZhZEE/5eQY/JeGoo8
   6gsKmD104/nhIQMqclW/49O6A1dTA/Bc9TAEx7TccXWwU8AD0/elGNVNv
   zOhcxQiCMJTnfTT+hPQaw3Ul6RnUTCd6ZMwgKB9rtr+RPFfhFbdhNCqEe
   QuZOlIdtyeXZ8fuRrsQTdLV5cOhXdacz7l6LFnhZhTyCc/Xm+LyqL4PxA
   n3IoS7iQRt+bFQnF2KD0qz0BQbIp/Arv/8NdAOc3VNZu7adIZg/O4ZOu7
   A86kHODrrRZbVJr8+YhP+HT7wLAJFD1pnfm7DQ0xqa4ZfGlpvg5X+R3Ze
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="474225168"
X-IronPort-AV: E=Sophos;i="6.03,262,1694761200"; 
   d="scan'208";a="474225168"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2023 17:43:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="933627203"
X-IronPort-AV: E=Sophos;i="6.03,262,1694761200"; 
   d="scan'208";a="933627203"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 29 Oct 2023 17:43:45 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxGNa-000Cwh-1R;
	Mon, 30 Oct 2023 00:43:42 +0000
Date: Mon, 30 Oct 2023 08:43:22 +0800
From: kernel test robot <lkp@intel.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@ozlabs.org
Subject: Re: [PATCH v12 6/6] powerpc: add crash memory hotplug support
Message-ID: <202310300812.yN6FuPcZ-lkp@intel.com>
References: <20231029124039.6158-7-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231029124039.6158-7-sourabhjain@linux.ibm.com>
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
Cc: David Hildenbrand <david@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, Mimi Zohar <zohar@linux.ibm.com>, Linux Memory Management List <linux-mm@kvack.org>, Eric DeVolder <eric.devolder@oracle.com>, Thomas Gleixner <tglx@linutronix.de>, Valentin Schneider <vschneid@redhat.com>, Baoquan He <bhe@redhat.com>, x86@kernel.org, Laurent Dufour <laurent.dufour@fr.ibm.com>, Dave Young <dyoung@redhat.com>, Vivek Goyal <vgoyal@redhat.com>, Borislav Petkov <bp@alien8.de>, oe-kbuild-all@lists.linux.dev, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Hari Bathini <hbathini@linux.ibm.com>, Oscar Salvador <osalvador@suse.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kexec@lists.infradead.org, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Akhil Raj <lf32.dev@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Sourabh,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v6.6-rc7]
[cannot apply to powerpc/next powerpc/fixes tip/x86/core next-20231027]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sourabh-Jain/crash-forward-memory_notify-arg-to-arch-crash-hotplug-handler/20231029-213858
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20231029124039.6158-7-sourabhjain%40linux.ibm.com
patch subject: [PATCH v12 6/6] powerpc: add crash memory hotplug support
config: powerpc64-randconfig-001-20231029 (https://download.01.org/0day-ci/archive/20231030/202310300812.yN6FuPcZ-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231030/202310300812.yN6FuPcZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310300812.yN6FuPcZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc64-linux-ld: warning: discarding dynamic section .glink
   powerpc64-linux-ld: warning: discarding dynamic section .plt
   powerpc64-linux-ld: linkage table error against `add_opal_mem_range'
   powerpc64-linux-ld: stubs don't match calculated size
   powerpc64-linux-ld: can not build stubs: bad value
   powerpc64-linux-ld: arch/powerpc/kexec/core_64.o: in function `get_crash_memory_ranges':
   core_64.c:(.text+0x1010): undefined reference to `add_mem_range'
   powerpc64-linux-ld: core_64.c:(.text+0x1064): undefined reference to `sort_memory_ranges'
   powerpc64-linux-ld: core_64.c:(.text+0x1128): undefined reference to `add_rtas_mem_range'
   powerpc64-linux-ld: core_64.c:(.text+0x1140): undefined reference to `add_opal_mem_range'
   powerpc64-linux-ld: core_64.c:(.text+0x1160): undefined reference to `add_mem_range'
   powerpc64-linux-ld: core_64.c:(.text+0x1188): undefined reference to `sort_memory_ranges'
   powerpc64-linux-ld: core_64.c:(.text+0x11e0): undefined reference to `realloc_mem_ranges'
   powerpc64-linux-ld: arch/powerpc/kexec/core_64.o: in function `arch_crash_handle_hotplug_event':
>> core_64.c:(.text+0x1900): undefined reference to `remove_mem_range'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
