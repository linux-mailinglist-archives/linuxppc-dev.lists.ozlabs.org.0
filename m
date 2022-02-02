Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E98FC4A7143
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Feb 2022 14:11:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jphyn4VPfz3cQC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Feb 2022 00:11:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IMqqRLes;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=IMqqRLes; dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jphy275lQz2yQC
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Feb 2022 00:11:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643807467; x=1675343467;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=W7Xd/SmOofESVKW25ArdGQVtat4JBdY/RG2oQKuqufc=;
 b=IMqqRLescZ3/1dNtQXLpfpLxjH1L8xUSuN4Ax9DxefxpW0XKW6lMIWWl
 yIT77AQNaUZzGFN4nf6N0FWRtt1yuy9lDZ4JZvVI37pEXP0nBJXbHUfeC
 mow5Hrayq8+JPaSd7Tzp7ygnTppLQNOV/Ghs2+/4HbmDM+kjQx2+/f1AJ
 BWN/gVJwYZ5a4WN43KI2Qz1JzDpWuSDOHgxhBqDw3GV0sVcnWsqRzuLRm
 3ay9+j+VR36DT6ZHVPaxfJLqUNSi6rCLisYDtLN0pgwa6oL9KsLrK0Tz8
 u48fvpdG1JKxg1pl1HE9IORnXduAG2GAnt4HEhh3JMwqH4cyK/e9b89Uu w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10245"; a="248130540"
X-IronPort-AV: E=Sophos;i="5.88,336,1635231600"; d="scan'208";a="248130540"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2022 05:09:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,336,1635231600"; d="scan'208";a="698889327"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 02 Feb 2022 05:09:57 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nFFOX-000UcG-60; Wed, 02 Feb 2022 13:09:57 +0000
Date: Wed, 2 Feb 2022 21:09:35 +0800
From: kernel test robot <lkp@intel.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 1/2] KVM: PPC: Book3S PR: Disable SCV when AIL could
 be disabled
Message-ID: <202202022141.phJ3zWBF-lkp@intel.com>
References: <20220129072511.105523-2-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220129072511.105523-2-npiggin@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: kbuild-all@lists.01.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Nicholas,

I love your patch! Yet something to improve:

[auto build test ERROR on powerpc/topic/ppc-kvm]
[also build test ERROR on powerpc/next v5.17-rc2 next-20220202]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Nicholas-Piggin/KVM-PPC-Book3S-PR-Fixes-for-AIL-and-SCV/20220129-152655
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git topic/ppc-kvm
config: powerpc-randconfig-r005-20220131 (https://download.01.org/0day-ci/archive/20220202/202202022141.phJ3zWBF-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/a751cf4de8f5854152b969afed947b0640ab0c33
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Nicholas-Piggin/KVM-PPC-Book3S-PR-Fixes-for-AIL-and-SCV/20220129-152655
        git checkout a751cf4de8f5854152b969afed947b0640ab0c33
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=powerpc SHELL=/bin/bash arch/powerpc/kvm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/powerpc/kvm/book3s_pr.c: In function 'kvmppc_core_vcpu_load_pr':
>> arch/powerpc/kvm/book3s_pr.c:146:74: error: 'struct thread_struct' has no member named 'fscr'
     146 |                 if (cpu_has_feature(CPU_FTR_ARCH_300) && (current->thread.fscr & FSCR_SCV))
         |                                                                          ^
   arch/powerpc/kvm/book3s_pr.c: In function 'kvmppc_core_vcpu_put_pr':
   arch/powerpc/kvm/book3s_pr.c:184:74: error: 'struct thread_struct' has no member named 'fscr'
     184 |                 if (cpu_has_feature(CPU_FTR_ARCH_300) && (current->thread.fscr & FSCR_SCV))
         |                                                                          ^


vim +146 arch/powerpc/kvm/book3s_pr.c

   141	
   142		/* Disable AIL if supported */
   143		if (cpu_has_feature(CPU_FTR_HVMODE)) {
   144			if (cpu_has_feature(CPU_FTR_ARCH_207S))
   145				mtspr(SPRN_LPCR, mfspr(SPRN_LPCR) & ~LPCR_AIL);
 > 146			if (cpu_has_feature(CPU_FTR_ARCH_300) && (current->thread.fscr & FSCR_SCV))
   147				mtspr(SPRN_FSCR, mfspr(SPRN_FSCR) & ~FSCR_SCV);
   148		}
   149	
   150		vcpu->cpu = smp_processor_id();
   151	#ifdef CONFIG_PPC_BOOK3S_32
   152		current->thread.kvm_shadow_vcpu = vcpu->arch.shadow_vcpu;
   153	#endif
   154	
   155		if (kvmppc_is_split_real(vcpu))
   156			kvmppc_fixup_split_real(vcpu);
   157	
   158		kvmppc_restore_tm_pr(vcpu);
   159	}
   160	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
