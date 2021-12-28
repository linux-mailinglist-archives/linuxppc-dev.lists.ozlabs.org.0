Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37972480B99
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Dec 2021 17:55:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JNgf40NYNz3c7n
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Dec 2021 03:55:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RaMKlPW+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=RaMKlPW+; dkim-atps=neutral
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JNgdP2Tp0z2yRf
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Dec 2021 03:55:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640710521; x=1672246521;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=2qpknpf69D+xnfUiUqwCUJxwxuGQjpZk/0GruwiH748=;
 b=RaMKlPW+dqgAM4wlJrkh3FMKooWhpDAtHVNFf//BB57KcjZkwsEQoUnq
 GDEWy9Dyf3gVwcjfouEMmKi20hJ/pYFXsKA630IXeymeBC1Dv94q/HvR+
 novd6/d+7hSLq9/eQlJN2aiPk1JgbqemGOGjuxDC5g+aeH5glnRLpt0hZ
 JTg+GfeHJTI1wP6q1zJtA8QzxJsuli29sjheCX/qvzWeW7hBPiwyhIqmT
 gLVhuYrXTLyKacOtsT6I7N+6yUVofUbj5hXuqhNv2pVX+JJKmCyZJE7ji
 Lxyw2fdldREst2OMvv2N6EZqlBe3neqONk3lfhflZjy1R8wU0thACh0Jd w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10211"; a="228696424"
X-IronPort-AV: E=Sophos;i="5.88,242,1635231600"; d="scan'208";a="228696424"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Dec 2021 08:54:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,242,1635231600"; d="scan'208";a="486342808"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 28 Dec 2021 08:54:10 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1n2Fjl-0007kc-Fc; Tue, 28 Dec 2021 16:54:09 +0000
Date: Wed, 29 Dec 2021 00:53:35 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test 46/179] arch/powerpc/mm/nohash/fsl_book3e.c:61:3:
 sparse: sparse: symbol 'tlbcam_addrs' was not declared. Should it be
 static?
Message-ID: <202112290015.xhdzgVU5-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: linuxppc-dev@lists.ozlabs.org, kbuild-all@lists.01.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
head:   beeac538c366cd2828092adecd1edab28326c55b
commit: ff47a95d1a67477e9bc2049a840d93b68508e079 [46/179] powerpc/mm: Move tlbcam_sz() and make it static
config: powerpc64-randconfig-s031-20211228 (https://download.01.org/0day-ci/archive/20211229/202112290015.xhdzgVU5-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?id=ff47a95d1a67477e9bc2049a840d93b68508e079
        git remote add powerpc https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
        git fetch --no-tags powerpc next-test
        git checkout ff47a95d1a67477e9bc2049a840d93b68508e079
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=powerpc SHELL=/bin/bash arch/powerpc/mm/nohash/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> arch/powerpc/mm/nohash/fsl_book3e.c:61:3: sparse: sparse: symbol 'tlbcam_addrs' was not declared. Should it be static?

vim +/tlbcam_addrs +61 arch/powerpc/mm/nohash/fsl_book3e.c

14cf11af6cf608 arch/powerpc/mm/fsl_booke_mmu.c Paul Mackerras 2005-09-26  53  
78f622377f7d31 arch/powerpc/mm/fsl_booke_mmu.c Kumar Gala     2010-05-13  54  #define NUM_TLBCAMS	(64)
78f622377f7d31 arch/powerpc/mm/fsl_booke_mmu.c Kumar Gala     2010-05-13 @55  struct tlbcam TLBCAM[NUM_TLBCAMS];
14cf11af6cf608 arch/powerpc/mm/fsl_booke_mmu.c Paul Mackerras 2005-09-26  56  
14cf11af6cf608 arch/powerpc/mm/fsl_booke_mmu.c Paul Mackerras 2005-09-26  57  struct tlbcamrange {
14cf11af6cf608 arch/powerpc/mm/fsl_booke_mmu.c Paul Mackerras 2005-09-26  58  	unsigned long start;
14cf11af6cf608 arch/powerpc/mm/fsl_booke_mmu.c Paul Mackerras 2005-09-26  59  	unsigned long limit;
14cf11af6cf608 arch/powerpc/mm/fsl_booke_mmu.c Paul Mackerras 2005-09-26  60  	phys_addr_t phys;
14cf11af6cf608 arch/powerpc/mm/fsl_booke_mmu.c Paul Mackerras 2005-09-26 @61  } tlbcam_addrs[NUM_TLBCAMS];
14cf11af6cf608 arch/powerpc/mm/fsl_booke_mmu.c Paul Mackerras 2005-09-26  62  

:::::: The code at line 61 was first introduced by commit
:::::: 14cf11af6cf608eb8c23e989ddb17a715ddce109 powerpc: Merge enough to start building in arch/powerpc.

:::::: TO: Paul Mackerras <paulus@samba.org>
:::::: CC: Paul Mackerras <paulus@samba.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
