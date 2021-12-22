Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 648DA47CF39
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Dec 2021 10:28:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JJp0Q0HQBz30BM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Dec 2021 20:28:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kYT8bDsr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=kYT8bDsr; dkim-atps=neutral
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JJnzk1LdKz2xDY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Dec 2021 20:27:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640165266; x=1671701266;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=BWSCNL8E8hvaZ2ldO5d2vDPYWr3g9rssV1h09w5DYN8=;
 b=kYT8bDsrq4qXm5WX2il3yztoY7kZqfzV4H+2VBQnXLpMZ9cH7jwiSK+Z
 xHpaPV7ALnEj74SE5awuQbv75vApabnW7GVfNvU+LDqOKq7VMlxOatiWm
 ecGUrPW6+SWKHB1fz0L3uhInUMabhOxIGty35LkFgW4rF0G/dNDfeEzPf
 WREHvcZFGhcJwAtpQvJdWPtKyeq4qcOcgaytgsJe4s5BsxpPv3CICFV2+
 dzyhp8ZxIKHC2nClVb/2jz8VYvZTIJwZabkSWhAg1PlE9M0d/cmetsLF6
 jcx4oeWJutzeaB8f2xTxoqC4UNQotjjDdoOACy0ercYjIJVs0SCAJZDSm w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10205"; a="227880866"
X-IronPort-AV: E=Sophos;i="5.88,226,1635231600"; d="scan'208";a="227880866"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2021 01:26:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,226,1635231600"; d="scan'208";a="466610892"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 22 Dec 2021 01:26:39 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mzxtO-0000Jb-J9; Wed, 22 Dec 2021 09:26:38 +0000
Date: Wed, 22 Dec 2021 17:25:50 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 "masahiroy@kernel.org" <masahiroy@kernel.org>
Subject: Re: [PATCH 3/3] powerpc/vdso: Merge vdso64 and vdso32 into a single
 directory
Message-ID: <202112221723.qyvrCJHe-lkp@intel.com>
References: <c4ff129869fa6b0c936ff7e388eee42bb5f46778.1640108961.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4ff129869fa6b0c936ff7e388eee42bb5f46778.1640108961.git.christophe.leroy@csgroup.eu>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 llvm@lists.linux.dev, kbuild-all@lists.01.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

I love your patch! Yet something to improve:

[auto build test ERROR on powerpc/next]
[also build test ERROR on v5.16-rc6 next-20211221]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Christophe-Leroy/powerpc-vdso-augment-VDSO32-functions-to-support-64-bits-build/20211222-021033
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
config: powerpc-randconfig-r023-20211222 (https://download.01.org/0day-ci/archive/20211222/202112221723.qyvrCJHe-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project de4e0195ae1c39f1c3b07834b8e32c113f4f20eb)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://github.com/0day-ci/linux/commit/16137812dbb55d25ebe3962d5fb7486cb5b43311
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Christophe-Leroy/powerpc-vdso-augment-VDSO32-functions-to-support-64-bits-build/20211222-021033
        git checkout 16137812dbb55d25ebe3962d5fb7486cb5b43311
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc prepare

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   <stdin>:1559:2: warning: syscall futex_waitv not implemented [-W#warnings]
   #warning syscall futex_waitv not implemented
    ^
   1 warning generated.
>> arch/powerpc/kernel/vdso/gettimeofday.S:75:8: error: unsupported directive '.stabs'
   .stabs "_restgpr_31_x:F-1",36,0,0,_restgpr_31_x; .globl _restgpr_31_x; _restgpr_31_x:
          ^
   arch/powerpc/kernel/vdso/gettimeofday.S:76:8: error: unsupported directive '.stabs'
   .stabs "_rest32gpr_31_x:F-1",36,0,0,_rest32gpr_31_x; .globl _rest32gpr_31_x; _rest32gpr_31_x:
          ^
   make[2]: *** [arch/powerpc/kernel/vdso/Makefile:71: arch/powerpc/kernel/vdso/gettimeofday-32.o] Error 1
   make[2]: Target 'include/generated/vdso32-offsets.h' not remade because of errors.
   make[1]: *** [arch/powerpc/Makefile:421: vdso_prepare] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:219: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +75 arch/powerpc/kernel/vdso/gettimeofday.S

08c18b63d9656e arch/powerpc/kernel/vdso32/gettimeofday.S Christophe Leroy 2021-03-09  70  
08c18b63d9656e arch/powerpc/kernel/vdso32/gettimeofday.S Christophe Leroy 2021-03-09  71  /* Routines for restoring integer registers, called by the compiler.  */
08c18b63d9656e arch/powerpc/kernel/vdso32/gettimeofday.S Christophe Leroy 2021-03-09  72  /* Called with r11 pointing to the stack header word of the caller of the */
08c18b63d9656e arch/powerpc/kernel/vdso32/gettimeofday.S Christophe Leroy 2021-03-09  73  /* function, just beyond the end of the integer restore area.  */
11f0a078a8b6be arch/powerpc/kernel/vdso32/gettimeofday.S Christophe Leroy 2021-12-21  74  #ifndef __powerpc64__
08c18b63d9656e arch/powerpc/kernel/vdso32/gettimeofday.S Christophe Leroy 2021-03-09 @75  _GLOBAL(_restgpr_31_x)

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
