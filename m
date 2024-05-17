Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD998C805E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2024 06:27:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ig4VW+DF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VgYpf5lDPz30Tj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2024 14:27:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ig4VW+DF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VgYnt41BBz2yvm
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2024 14:26:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715920019; x=1747456019;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GWyXOoyKk2RnwYCSHy+P9Ba1M58+I9n6Er/ZRA9duHQ=;
  b=Ig4VW+DFdLh6QaeuTQ5HcQRnDIxTgHfrs/VXtyfiePvRNnP57e+ZFg8r
   490zKWFpAyRXPVLAvDyWx0Nq2Ny8ClZcEw9UJgeI2RAnNCRrfoX/eveV4
   tWqmoRS94xmoq47dPY1QMBWt6K42No9skKvaZLoWTYDdqMsz7n7WpBfPC
   Hpfik55r9bVOyh/uCQKd/Dq+iiu3g4LpkWawKOZFkynq6pkuLAGTgOaep
   gcvtS7rZ2Z5WIu82gXw7FxkyozHKS2RnUz7L61bXd7ltjnSzzKXdX7Tbl
   A+HQDNpwQj6wQLlXmgVLG1Qt7U1M5Vpt4x56vj4WV+Te93LOU0pW9xR4/
   A==;
X-CSE-ConnectionGUID: B0S/+AF6Sne9GtQjYHa3eg==
X-CSE-MsgGUID: ulxvxDOuRRC0XrOIZmK+xg==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="29593933"
X-IronPort-AV: E=Sophos;i="6.08,166,1712646000"; 
   d="scan'208";a="29593933"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 21:26:53 -0700
X-CSE-ConnectionGUID: ToWroi0yQuSi5r5w3KhFTA==
X-CSE-MsgGUID: v/KLNac5SYWSyeJHoSME5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,166,1712646000"; 
   d="scan'208";a="31485769"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 16 May 2024 21:26:51 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s7pAy-0000CZ-2g;
	Fri, 17 May 2024 04:26:39 +0000
Date: Fri, 17 May 2024 12:25:37 +0800
From: kernel test robot <lkp@intel.com>
To: Abhishek Dubey <adubey@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] PowerPC: Replace kretprobe with rethook
Message-ID: <202405171247.spWNTdJg-lkp@intel.com>
References: <20240516134646.1059114-1-adubey@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240516134646.1059114-1-adubey@linux.ibm.com>
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
Cc: naveen.n.rao@linux.vnet.ibm.com, Abhishek Dubey <adubey@linux.ibm.com>, mhiramat@kernel.org, npiggin@gmail.com, oe-kbuild-all@lists.linux.dev
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Abhishek,

kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes linus/master v6.9 next-20240516]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Abhishek-Dubey/PowerPC-Replace-kretprobe-with-rethook/20240516-214818
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20240516134646.1059114-1-adubey%40linux.ibm.com
patch subject: [PATCH] PowerPC: Replace kretprobe with rethook
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20240517/202405171247.spWNTdJg-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240517/202405171247.spWNTdJg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405171247.spWNTdJg-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: arch/powerpc/kernel/stacktrace.o: in function `arch_stack_walk_reliable':
>> stacktrace.c:(.text+0x172): undefined reference to `arch_rethook_trampoline'
>> powerpc-linux-ld: stacktrace.c:(.text+0x17e): undefined reference to `arch_rethook_trampoline'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
