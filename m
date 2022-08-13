Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C458591AC6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Aug 2022 15:49:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M4hjL2y9Pz3bqY
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Aug 2022 23:49:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MqN/FUif;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mga11.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MqN/FUif;
	dkim-atps=neutral
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M4hhh4DNBz2xGD
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Aug 2022 23:48:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660398516; x=1691934516;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IaNOV5ULcqrPGIPFKhOxGOt/yH1/fsN9Oo9GiVQq6HQ=;
  b=MqN/FUifsrfOVSm1+edDbYjuqVliqRUr+Fonm3Ze/G3xlQr3Yk4GyBvK
   2UCw8BZ73EHPD/eJgraqL9HUOXrwXw94XL1VVbHHN5tA2XLBNglLiqNmN
   43DWwOTtGOlXS639sDqVI2oZr4/lgugMC8+YWHmaH1R4At4/wG1F7GooR
   qnoYryTer24z5VBbf2zDwcMZ++OyAVa70Ml2vOT3cCmI6Xy97lZ32eRSC
   iEmCNJ85VkDo0kSyxR1P587uHqFqFEJMDtyObkximEBDaAMXl9/ynBrLx
   bdE06HTiOyN5nFw6V31zfSUWz0mDMqgqMzdbMJwWRqM3AziuPyX2TpAYx
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10437"; a="289322800"
X-IronPort-AV: E=Sophos;i="5.93,235,1654585200"; 
   d="scan'208";a="289322800"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2022 06:48:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,235,1654585200"; 
   d="scan'208";a="634974321"
Received: from lkp-server02.sh.intel.com (HELO 8745164cafc7) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 13 Aug 2022 06:48:19 -0700
Received: from kbuild by 8745164cafc7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oMrUx-0001j4-0B;
	Sat, 13 Aug 2022 13:48:19 +0000
Date: Sat, 13 Aug 2022 21:48:17 +0800
From: kernel test robot <lkp@intel.com>
To: Sathvika Vasireddy <sv@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 14/16] objtool: Add arch specific function
 arch_ftrace_match()
Message-ID: <202208132139.WhghhLpC-lkp@intel.com>
References: <20220808114908.240813-15-sv@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220808114908.240813-15-sv@linux.ibm.com>
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
Cc: kbuild-all@lists.01.org, peterz@infradead.org, llvm@lists.linux.dev, npiggin@gmail.com, linux-kernel@vger.kernel.org, aik@ozlabs.ru, mingo@redhat.com, sv@linux.ibm.com, rostedt@goodmis.org, jpoimboe@redhat.com, naveen.n.rao@linux.vnet.ibm.com, mbenes@suse.cz, chenzhongjin@huawei.com, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Sathvika,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v5.19 next-20220812]
[cannot apply to powerpc/next powerpc/topic/ppc-kvm masahiroy-kbuild/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sathvika-Vasireddy/objtool-Enable-and-implement-mcount-option-on-powerpc/20220808-200702
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 4e23eeebb2e57f5a28b36221aa776b5a1122dde5
config: x86_64-randconfig-a005 (https://download.01.org/0day-ci/archive/20220813/202208132139.WhghhLpC-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 5f1c7e2cc5a3c07cbc2412e851a7283c1841f520)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/2b03c8be7104e834933d2f5928e69828190e935c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Sathvika-Vasireddy/objtool-Enable-and-implement-mcount-option-on-powerpc/20220808-200702
        git checkout 2b03c8be7104e834933d2f5928e69828190e935c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 prepare

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   error: write on a pipe with no reader
   error: write on a pipe with no reader
   error: write on a pipe with no reader
>> arch/x86/decode.c:28:14: error: use of undeclared identifier 'func'
           if (!strcmp(func->name, "__fentry__"))
                       ^
   1 error generated.
   make[5]: *** [tools/build/Makefile.build:96: tools/objtool/arch/x86/decode.o] Error 1
   make[4]: *** [tools/build/Makefile.build:139: arch/x86] Error 2
   make[4]: *** Waiting for unfinished jobs....
   make[3]: *** [Makefile:54: tools/objtool/objtool-in.o] Error 2
   make[2]: *** [Makefile:73: objtool] Error 2
   make[1]: *** [Makefile:1347: tools/objtool] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:219: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
