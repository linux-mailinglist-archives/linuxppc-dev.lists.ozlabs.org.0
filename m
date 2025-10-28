Return-Path: <linuxppc-dev+bounces-13410-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E3EC125D5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Oct 2025 01:53:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwX0H0c2hz3fn7;
	Tue, 28 Oct 2025 11:52:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761612750;
	cv=none; b=OzTsc0qUxDI9O7Dy2cHI2SVy5lL/2VfqvPBb2OC41VTcAgQLpO74H/h6X6+WdTDmETrrNuXEsOULLW5bLTpFlqFDptnBSBAq7s28nc60Ui3tocO/q7fgUEtVnKfZs2Ke1G4Cjg8xbqvOpYv0FLWy90IEGNWdVgPLFzb2K5HV9UJNDxVgFSrrE1cRPxxMcgk4s96O7JpSB0rC784IFZLJj0T4VJcBmhjvfGr7A5+CfkPGww90aTwKRG5Ju8ApUrp407v5QJcs1JSJn5Qv9vgcwD99m/s0P/A+yq/SCpj+WGCHQHWdg6O/g9PH+J7XXUu00Aae/cZdYZ0TNKf+YQ99LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761612750; c=relaxed/relaxed;
	bh=xE7Ol8ZHHIYSX2HMcYRbiY4I4pOxPmZnHiEv7D3PDUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kK3w7q0RHM14YIDyLT9TFTfUNx5JBPcoo1EHXj2UZH8z/1DuCJGBDe6KaUdDJIZfCO1jZqR90UP+SAdFJGZsBsDvcP13ZzZB4mTBNCp1bebLFNKLG8AbGX1kJvHE9os33di7Gg7JSgjpGyAiHIXcuNGe87NKkwD930Wp1JiyvPR7NUefTjmkvfcNgK8Vd9BpurVbZVsLy+Ektxp8YT8txnNfnP2hORNCYimHVjVh62B0bPeNcTrVxFXunHGcyOvETF7hnX4ATbcicJBY2N9K93BPG4Aet20tS1u9hVpHlbelf4o0P4toYgyyzDa5/+5djJc+P4x89BJYfBFlKhtqow==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=G6Hvogw9; dkim-atps=neutral; spf=pass (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=G6Hvogw9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwX0D0p3lz3fn3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 11:52:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761612748; x=1793148748;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=w7zS/Rxbd2Ot04z+qhtf2Kt5+S/gx85Bie+qXzvTKLc=;
  b=G6Hvogw9yZJo7HQN3Rdqpp8ax/nDetFS1iAK8SJ7radwMNTDQWmlvNIv
   ar+yMU5CbuM45vdzG+CA9t8wjzT0UPn6e2bjvg7QakynJGYLCethmXa5g
   R9rKtfnWJE9MzeGVnVNOep8UBjws7bqHwWucDw1l8A25BRbIIwLLEO5u3
   XZz5fYJwub0L/lv1sKSdsOZnSIFxWTWNiJeo+o2qJao6XLCbtlJvu7ia+
   eOXX8REuaBcCkUiteslwFw1DJVij3dZbw3ktie76iSzM0e7KcdgnHf/Fp
   d3M5lRNMmWGgLkkmkzsI+g/XxnYTfGtInNsolBzEVHFmCU88CpkLVWY++
   Q==;
X-CSE-ConnectionGUID: +LKai9G+TmWn/wKUElNpQw==
X-CSE-MsgGUID: OlAbQ+n/R162Pim3Ds3cIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="86331337"
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; 
   d="scan'208";a="86331337"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 17:52:24 -0700
X-CSE-ConnectionGUID: iliyoV3HSiWz4WHQBxJ1yQ==
X-CSE-MsgGUID: hTZAPswWTDKoA9uQQVALaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; 
   d="scan'208";a="185103061"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 27 Oct 2025 17:52:20 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDXwb-000Ibx-1L;
	Tue, 28 Oct 2025 00:52:16 +0000
Date: Tue, 28 Oct 2025 08:51:48 +0800
From: kernel test robot <lkp@intel.com>
To: "Nysal Jan K.A." <nysal@linux.ibm.com>,
	Sourabh Jain <sourabhjain@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Nysal Jan K.A." <nysal@linux.ibm.com>,
	Sachin P Bappalige <sachinpb@linux.ibm.com>, stable@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Laurent Dufour <ldufour@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc/kexec: Enable SMT before waking offline CPUs
Message-ID: <202510280824.Fe2D1Sbw-lkp@intel.com>
References: <20251025080512.85690-1-nysal@linux.ibm.com>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251025080512.85690-1-nysal@linux.ibm.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Nysal,

kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes linus/master v6.18-rc3 next-20251027]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nysal-Jan-K-A/powerpc-kexec-Enable-SMT-before-waking-offline-CPUs/20251025-160821
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20251025080512.85690-1-nysal%40linux.ibm.com
patch subject: [PATCH] powerpc/kexec: Enable SMT before waking offline CPUs
config: powerpc64-randconfig-001-20251028 (https://download.01.org/0day-ci/archive/20251028/202510280824.Fe2D1Sbw-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project e1ae12640102fd2b05bc567243580f90acb1135f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251028/202510280824.Fe2D1Sbw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510280824.Fe2D1Sbw-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:171:
   include/linux/compiler-clang.h:37:9: warning: '__SANITIZE_THREAD__' macro redefined [-Wmacro-redefined]
      37 | #define __SANITIZE_THREAD__
         |         ^
   <built-in>:353:9: note: previous definition is here
     353 | #define __SANITIZE_THREAD__ 1
         |         ^
>> arch/powerpc/kexec/core_64.c:220:22: error: expression is not assignable
     220 |         cpu_smt_num_threads = threads_per_core;
         |         ~~~~~~~~~~~~~~~~~~~ ^
   arch/powerpc/kexec/core_64.c:221:18: error: expression is not assignable
     221 |         cpu_smt_control = CPU_SMT_ENABLED;
         |         ~~~~~~~~~~~~~~~ ^
   1 warning and 2 errors generated.


vim +220 arch/powerpc/kexec/core_64.c

   204	
   205	/*
   206	 * We need to make sure each present CPU is online.  The next kernel will scan
   207	 * the device tree and assume primary threads are online and query secondary
   208	 * threads via RTAS to online them if required.  If we don't online primary
   209	 * threads, they will be stuck.  However, we also online secondary threads as we
   210	 * may be using 'cede offline'.  In this case RTAS doesn't see the secondary
   211	 * threads as offline -- and again, these CPUs will be stuck.
   212	 *
   213	 * So, we online all CPUs that should be running, including secondary threads.
   214	 */
   215	static void wake_offline_cpus(void)
   216	{
   217		int cpu = 0;
   218	
   219		lock_device_hotplug();
 > 220		cpu_smt_num_threads = threads_per_core;
   221		cpu_smt_control = CPU_SMT_ENABLED;
   222		unlock_device_hotplug();
   223	
   224		for_each_present_cpu(cpu) {
   225			if (!cpu_online(cpu)) {
   226				printk(KERN_INFO "kexec: Waking offline cpu %d.\n",
   227				       cpu);
   228				WARN_ON(add_cpu(cpu));
   229			}
   230		}
   231	}
   232	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

