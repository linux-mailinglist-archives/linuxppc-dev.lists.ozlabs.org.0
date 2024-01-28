Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 382C883F8F0
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Jan 2024 18:59:30 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LJEU9Qb4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TNK276Jcxz3cTt
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jan 2024 04:59:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LJEU9Qb4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TNK1P0TF8z3bmH
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jan 2024 04:58:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706464729; x=1738000729;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5cEP+zWFr/nlAcAv00WyKAUSHk9AI618LLTjG1LtvxI=;
  b=LJEU9Qb4ea//NM9/6Q4nyLKZecKBQXYoCqNEZ5ODM5jZRdFebSla7ij8
   ZGCJHgCL5YyfukX4eEl/XH80qGc7H7D9gnSKjbCJyeqTqG8pdW4qmQ+uf
   zT4fq3aNWSTcawqtHH7oD/1BRMPfLK0ec0nxBjaE3bUgYP7bIuO4Dlh0B
   wbqjpYqyupwewrfWCA5WF1Th+VJmPgWg9tNKZKrjmWzxC9MxvdGJx/v5b
   IcpgxTy7amoBJaZqMosMc2R9082uPVAELgVMj2W0TQxW4VzGudIoqGncm
   1xUeZKAUIQgOHhJRzXKsUiLBVje0ncuHnnIgLmU3MYq6uwCeLbCslAk51
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="2683772"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="2683772"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2024 09:58:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="737165941"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="737165941"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 28 Jan 2024 09:58:35 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rU9QP-0003cs-1f;
	Sun, 28 Jan 2024 17:58:33 +0000
Date: Mon, 29 Jan 2024 01:58:09 +0800
From: kernel test robot <lkp@intel.com>
To: Huang Shijie <shijie@os.amperecomputing.com>,
	gregkh@linuxfoundation.org
Subject: Re: [PATCH] init: refactor the generic cpu_to_node for NUMA
Message-ID: <202401290116.GpUOCzGd-lkp@intel.com>
References: <20240118031412.3300-1-shijie@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240118031412.3300-1-shijie@os.amperecomputing.com>
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
Cc: mark.rutland@arm.com, rafael@kernel.org, catalin.marinas@arm.com, llvm@lists.linux.dev, jiaxun.yang@flygoat.com, mikelley@microsoft.com, linux-riscv@lists.infradead.org, will@kernel.org, mingo@kernel.org, vschneid@redhat.com, arnd@arndb.de, chenhuacai@kernel.org, linux-arm-kernel@lists.infradead.org, kuba@kernel.org, patches@amperecomputing.com, linux-mips@vger.kernel.org, aou@eecs.berkeley.edu, yury.norov@gmail.com, paul.walmsley@sifive.com, oe-kbuild-all@lists.linux.dev, tglx@linutronix.de, jpoimboe@kernel.org, vbabka@suse.cz, ndesaulniers@google.com, linux-kernel@vger.kernel.org, palmer@dabbelt.com, mhiramat@kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Huang,

kernel test robot noticed the following build errors:

[auto build test ERROR on driver-core/driver-core-testing]
[also build test ERROR on driver-core/driver-core-next driver-core/driver-core-linus linus/master v6.8-rc1 next-20240125]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Huang-Shijie/init-refactor-the-generic-cpu_to_node-for-NUMA/20240118-111802
base:   driver-core/driver-core-testing
patch link:    https://lore.kernel.org/r/20240118031412.3300-1-shijie%40os.amperecomputing.com
patch subject: [PATCH] init: refactor the generic cpu_to_node for NUMA
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240129/202401290116.GpUOCzGd-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240129/202401290116.GpUOCzGd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401290116.GpUOCzGd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: cpu_to_node
   >>> referenced by main.c:880 (init/main.c:880)
   >>>               init/main.o:(start_kernel) in archive vmlinux.a
   >>> referenced by main.c:1542 (init/main.c:1542)
   >>>               init/main.o:(kernel_init_freeable) in archive vmlinux.a
   >>> referenced by core.c:550 (arch/x86/events/amd/core.c:550)
   >>>               arch/x86/events/amd/core.o:(amd_pmu_cpu_prepare) in archive vmlinux.a
   >>> referenced 179 more times
--
>> ld.lld: error: undefined symbol: _cpu_to_node
   >>> referenced by main.c:1542 (init/main.c:1542)
   >>>               init/main.o:(kernel_init_freeable) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
