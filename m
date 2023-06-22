Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEEF73A95A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 22:10:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KqGoa/9F;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QnBMD4cKKz3bYF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jun 2023 06:10:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KqGoa/9F;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mga02.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QnBLK0GGlz30QD
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jun 2023 06:09:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687464601; x=1719000601;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rMYEm8dbaQOauXtEW2aM8kbljQdU8H0asFUgdMQJAw4=;
  b=KqGoa/9FAid76k4vPVoV3SA8CSjkOcnWmAtjCIaVVuM8tS4CAu2Tldn8
   mEz0mzNTp1mePyFBCtLLfNQ927PSAOOrlB943PG2V0Flz/0C9tOl1Mnmk
   M1KMexbuYHBcY38VQlcIfXq5fzUJzdzv7vw2DqTVSnfPeegMIN/TM8FIC
   mVrBTKPKZ/JzMgSavwuf1GKUJ9Hb+aFpOxyItC+ows/hgXSalC5q167U8
   3fp31ENL2MeY4DgS6QL9uREPOOGbzZ/4i8jLmzFQVPwtM5dUeJui89SjC
   LTp2geQpZtYuQW9lEdY6fUQqBjEMY/gd5q0AbyCv3c/lmC1P1X8MydAPn
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="350359343"
X-IronPort-AV: E=Sophos;i="6.01,149,1684825200"; 
   d="scan'208";a="350359343"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 13:08:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="780372167"
X-IronPort-AV: E=Sophos;i="6.01,149,1684825200"; 
   d="scan'208";a="780372167"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 22 Jun 2023 13:08:47 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCQbm-0007lR-0Q;
	Thu, 22 Jun 2023 20:08:46 +0000
Date: Fri, 23 Jun 2023 04:07:59 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Sathvika Vasireddy <sv@linux.ibm.com>,
	Naveen N Rao <naveen@kernel.org>
Subject: Re: [PATCH v2 14/14] powerpc: Implement UACCESS validation on PPC32
Message-ID: <202306230351.SpwvWyz3-lkp@intel.com>
References: <be282f27ad808418c7475b51a00b4cb035f89a95.1687430631.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be282f27ad808418c7475b51a00b4cb035f89a95.1687430631.git.christophe.leroy@csgroup.eu>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/next]
[also build test WARNING on powerpc/fixes masahiroy-kbuild/for-next masahiroy-kbuild/fixes linus/master v6.4-rc7]
[cannot apply to next-20230622]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christophe-Leroy/powerpc-kuap-Avoid-unnecessary-reads-of-MD_AP/20230622-185950
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/be282f27ad808418c7475b51a00b4cb035f89a95.1687430631.git.christophe.leroy%40csgroup.eu
patch subject: [PATCH v2 14/14] powerpc: Implement UACCESS validation on PPC32
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230623/202306230351.SpwvWyz3-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230623/202306230351.SpwvWyz3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306230351.SpwvWyz3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/powerpc/platforms/powermac/smp.c:416:13: warning: no previous prototype for 'smp_psurge_take_timebase' [-Wmissing-prototypes]
     416 | void __init smp_psurge_take_timebase(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/platforms/powermac/smp.c:432:13: warning: no previous prototype for 'smp_psurge_give_timebase' [-Wmissing-prototypes]
     432 | void __init smp_psurge_give_timebase(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
>> arch/powerpc/platforms/powermac/smp.o: warning: objtool: .text.pmac_cpu_offline_self: unexpected end of section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
