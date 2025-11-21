Return-Path: <linuxppc-dev+bounces-14413-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B21C786C0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Nov 2025 11:15:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dCWMH5xl3z2yFq;
	Fri, 21 Nov 2025 21:15:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763720155;
	cv=none; b=a9gEA0gHxsq1pGAlJQXR69tu/6KXNsg9klJabjIsJrCz83qor7iGwSFbi1gdy3moHclcLfIOYfUx1S1X40A/IVx4advUaQCXX8fvDS+Omn4lY8xAaGTG5Sbb3xWeWnujoCb0swSba208O8zbJCrE+6s/RcWlzCBbTbZuG/Qmj/TCPqzDWHHxUsymkK8DYHR1MHfSuKMcCxULXyh5s27HGkZIu9Nq6MfTcPMn70YvgnRc9rfRJWoVhoJm2UKfUJSImiSoX+Kt2H2ttZakel6BCKVEWIfyttiUtKqzf8fUjsviuoAVpf+ZO4zAPEcjRKr1J6HV8Q25oYsXVXxUEpGRPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763720155; c=relaxed/relaxed;
	bh=wNgNWMG3pf+M5kUWfVTiOTY1L3lzWLC8gMYD22Y/u74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o0NtyxSGc8xqsBmq1N3DC0oLMUPwIDGbfOyBS9oVrOGx+qRQNB9Vfzz7vTTHB0Bq91NXg5+ysIscy4g/NUqgu5WisGcnZ63jTUR18TzvqBKH6Kvu9YbRZASh4/SbCCTTvROHQS8qt5i6Z3b7CxAjDuE0vINIO9wZ+kxvZsFiVBA8TYtOLwGLuf8RUP/V7u2rkdSGCUsmVGmW5YmcwifYhr0Ftjgyadi+xupbKBVa5ZAtCmQAhiAK1aotiz3VtEWOwO7cDCSJmbsf0S9YCDchn8/On8f4TlSiGfFK+5y+zofquD5KFixNG7Z4VpBLzvBwtspsbz/2KYhuv5H/fyzqxg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PGof7/LS; dkim-atps=neutral; spf=pass (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PGof7/LS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dCWMD6myTz2xqh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Nov 2025 21:15:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763720153; x=1795256153;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VLkkzZbVSObgfRsPhSAAPnVORGcWgp2Cjevvl63/aWw=;
  b=PGof7/LSM/SrxOSkcSG9vlFg57wOs0ED16cIOr5FzQ62XVPST2S0TsaM
   2Dj1IOSsZOjyUIfUZKPZ2h/6cja8WoMNFsoWBPVGg2jNs4clGpTp1lAQV
   AENbe53/lPKZeaIf3/SxD/mazQ/VeMXDmosgHvku1PtlVW0xOEI+XY6zY
   QNQ2jWyPEvTSJK0TbPox9tJdRfHJ20swRZmLSQM88RzNQUcEbaJykDKcs
   W7zkEk8Tqz3TdM6BMzAqk/TkpdB2FQaOE654jTX0DJMRykXA7Mu8mPj8/
   y7QJYiEsBkD8Dxpes5Q9EF8bttyBnM6FFV1fLuW5GQQAZc8gpIeZQ7ndF
   A==;
X-CSE-ConnectionGUID: YHuZKM8uRSCYg45p6Abt3g==
X-CSE-MsgGUID: o8S/R/ibSze0qsZiqvIXeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65848590"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="65848590"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 02:15:47 -0800
X-CSE-ConnectionGUID: ZWawT6pIRMuaivjbwwPtkg==
X-CSE-MsgGUID: E6hxrEk/Rnmhzy0e8i47xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="191904417"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 21 Nov 2025 02:15:42 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMOB2-0005D1-0B;
	Fri, 21 Nov 2025 10:15:40 +0000
Date: Fri, 21 Nov 2025 18:14:50 +0800
From: kernel test robot <lkp@intel.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	sshegde@linux.ibm.com, mingo@redhat.com, peterz@infradead.org,
	juri.lelli@redhat.com, vincent.guittot@linaro.org,
	tglx@linutronix.de, yury.norov@gmail.com, maddy@linux.ibm.com,
	srikar@linux.ibm.com, gregkh@linuxfoundation.org,
	pbonzini@redhat.com, seanjc@google.com, kprateek.nayak@amd.com,
	vschneid@redhat.com, iii@linux.ibm.com, huschle@linux.ibm.com,
	rostedt@goodmis.org, dietmar.eggemann@arm.com,
	christophe.leroy@csgroup.eu
Subject: Re: [PATCH 12/17] powerpc: method to initialize ec and vp cores
Message-ID: <202511211747.WJdFJoRB-lkp@intel.com>
References: <20251119124449.1149616-13-sshegde@linux.ibm.com>
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
In-Reply-To: <20251119124449.1149616-13-sshegde@linux.ibm.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Shrikanth,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/sched/core]
[also build test ERROR on next-20251121]
[cannot apply to powerpc/next powerpc/fixes driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus linus/master v6.18-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shrikanth-Hegde/sched-docs-Document-cpu_paravirt_mask-and-Paravirt-CPU-concept/20251119-204931
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20251119124449.1149616-13-sshegde%40linux.ibm.com
patch subject: [PATCH 12/17] powerpc: method to initialize ec and vp cores
config: powerpc-pasemi_defconfig (https://download.01.org/0day-ci/archive/20251121/202511211747.WJdFJoRB-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251121/202511211747.WJdFJoRB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511211747.WJdFJoRB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: pseries_init_ec_vp_cores
   >>> referenced by smp.c
   >>>               arch/powerpc/kernel/smp.o:(smp_cpus_done) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

