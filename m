Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A93CB73827D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jun 2023 13:59:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AHDRmqVo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QmMVj4K7cz3bZD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jun 2023 21:59:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AHDRmqVo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QmMTm4Rm4z30hG
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jun 2023 21:58:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687348716; x=1718884716;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/UaZYJmBVZXLtrLONhqjC70JFtiBLSaQl6d55pahEGM=;
  b=AHDRmqVoL8ars7JTc4KhyZAfiK5YW/naXo9w0NU8W0MrbaMeizWLVqKl
   jlFxrEB61JcrNrU9wAkrbk4gSHsLLOtkHiZZEyhEADUDjBD50Ehmjroed
   p0gF9fdK44dJqJiMJ4BP2sJ7vEkoLB2Vag0W49T6Qv+PbYtqAuk6Jy2Tb
   rMp5RjXj2yoKE5JLtpsKfudh7bgBfBRjkeD7kE0tdOhv/vD3jI0/SH+I9
   rYjTlDcWrmbMpx0nXOu3QvqzhU9VRceIslsB1gomaOMcOEw6R0zDRyNwt
   xS/Rhl3Alz0RVzhTSTOdW2XpOmvkD/UjycrDAnjeviPGCTrUaLAv/3lz7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="340493096"
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; 
   d="scan'208";a="340493096"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2023 04:58:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="838591996"
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; 
   d="scan'208";a="838591996"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 21 Jun 2023 04:58:07 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBwTO-0006op-0a;
	Wed, 21 Jun 2023 11:58:06 +0000
Date: Wed, 21 Jun 2023 19:57:46 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/ptrace: Split gpr32_set_common
Message-ID: <202306211940.y4kIhSei-lkp@intel.com>
References: <3086d189fa629e6c7bf800832921669450cc09bf.1687343697.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3086d189fa629e6c7bf800832921669450cc09bf.1687343697.git.christophe.leroy@csgroup.eu>
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

kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes linus/master v6.4-rc7 next-20230621]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christophe-Leroy/powerpc-ptrace-Split-gpr32_set_common/20230621-183932
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/3086d189fa629e6c7bf800832921669450cc09bf.1687343697.git.christophe.leroy%40csgroup.eu
patch subject: [PATCH] powerpc/ptrace: Split gpr32_set_common
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20230621/202306211940.y4kIhSei-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230621/202306211940.y4kIhSei-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306211940.y4kIhSei-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/powerpc/kernel/ptrace/ptrace-view.c:719:5: error: no previous prototype for 'gpr32_set_common_kernel' [-Werror=missing-prototypes]
     719 | int gpr32_set_common_kernel(struct task_struct *target,
         |     ^~~~~~~~~~~~~~~~~~~~~~~
>> arch/powerpc/kernel/ptrace/ptrace-view.c:757:5: error: no previous prototype for 'gpr32_set_common_user' [-Werror=missing-prototypes]
     757 | int gpr32_set_common_user(struct task_struct *target,
         |     ^~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/gpr32_set_common_kernel +719 arch/powerpc/kernel/ptrace/ptrace-view.c

   718	
 > 719	int gpr32_set_common_kernel(struct task_struct *target,
   720				    const struct user_regset *regset,
   721				    unsigned int pos, unsigned int count,
   722				    const void *kbuf, unsigned long *regs)
   723	{
   724		const compat_ulong_t *k = kbuf;
   725	
   726		pos /= sizeof(compat_ulong_t);
   727		count /= sizeof(compat_ulong_t);
   728	
   729		for (; count > 0 && pos < PT_MSR; --count)
   730			regs[pos++] = *k++;
   731	
   732		if (count > 0 && pos == PT_MSR) {
   733			set_user_msr(target, *k++);
   734			++pos;
   735			--count;
   736		}
   737	
   738		for (; count > 0 && pos <= PT_MAX_PUT_REG; --count)
   739			regs[pos++] = *k++;
   740		for (; count > 0 && pos < PT_TRAP; --count, ++pos)
   741			++k;
   742	
   743		if (count > 0 && pos == PT_TRAP) {
   744			set_user_trap(target, *k++);
   745			++pos;
   746			--count;
   747		}
   748	
   749		kbuf = k;
   750		pos *= sizeof(compat_ulong_t);
   751		count *= sizeof(compat_ulong_t);
   752		user_regset_copyin_ignore(&pos, &count, &kbuf, NULL,
   753					  (PT_TRAP + 1) * sizeof(compat_ulong_t), -1);
   754		return 0;
   755	}
   756	
 > 757	int gpr32_set_common_user(struct task_struct *target,
   758				  const struct user_regset *regset,
   759				  unsigned int pos, unsigned int count,
   760				  const void __user *ubuf, unsigned long *regs)
   761	{
   762		const compat_ulong_t __user *u = ubuf;
   763		compat_ulong_t reg;
   764	
   765		if (!user_read_access_begin(u, count))
   766			return -EFAULT;
   767	
   768		pos /= sizeof(reg);
   769		count /= sizeof(reg);
   770	
   771		for (; count > 0 && pos < PT_MSR; --count) {
   772			unsafe_get_user(reg, u++, Efault);
   773			regs[pos++] = reg;
   774		}
   775	
   776		if (count > 0 && pos == PT_MSR) {
   777			unsafe_get_user(reg, u++, Efault);
   778			set_user_msr(target, reg);
   779			++pos;
   780			--count;
   781		}
   782	
   783		for (; count > 0 && pos <= PT_MAX_PUT_REG; --count) {
   784			unsafe_get_user(reg, u++, Efault);
   785			regs[pos++] = reg;
   786		}
   787		for (; count > 0 && pos < PT_TRAP; --count, ++pos)
   788			unsafe_get_user(reg, u++, Efault);
   789	
   790		if (count > 0 && pos == PT_TRAP) {
   791			unsafe_get_user(reg, u++, Efault);
   792			set_user_trap(target, reg);
   793			++pos;
   794			--count;
   795		}
   796		user_read_access_end();
   797	
   798		ubuf = u;
   799		pos *= sizeof(reg);
   800		count *= sizeof(reg);
   801		user_regset_copyin_ignore(&pos, &count, NULL, &ubuf,
   802					  (PT_TRAP + 1) * sizeof(reg), -1);
   803		return 0;
   804	
   805	Efault:
   806		user_read_access_end();
   807		return -EFAULT;
   808	}
   809	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
