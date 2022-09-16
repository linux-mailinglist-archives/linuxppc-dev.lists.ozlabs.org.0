Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F74C5BAC29
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 13:17:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MTWkm4hpsz3bqj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 21:17:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NWlpXSvH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mga05.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NWlpXSvH;
	dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MTWk61xN7z2yxZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Sep 2022 21:16:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663327022; x=1694863022;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pC4HNphyXavU9L8VcHEWd0xe/n/o16jCaw0zVw/oAbE=;
  b=NWlpXSvHSJ7IdQcrjwo4M+yLSTmmUU/zojuxje5M8FDQak8Y8FaKtAOq
   SD5qctnGtXVFhFSxIf6v12UOd2JbwkU9NVcB2K4x7p+F0uYncuOUjMpMj
   p+ad188PlALeQLZMcUwCIe1rJDcoNuo/lHMpYXVP47lxZTN01ylDNMasB
   mcUP2kWD3dV6ft/xI8l/NXsLyWyksJWOILWDvLSAEbAh/XhfKS7cPaJ5g
   Nl57NOijpifHuCG7JeRo8UCEieJ/usOlV9uVGjtQEnj4aE0OdzUyqXkWw
   KU5UNEq/+Ob0H5H8nf14W6vgFleDIulyVIeRFwKjlor8LMv4Zg8kN7FC2
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10471"; a="385261513"
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; 
   d="scan'208";a="385261513"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2022 04:16:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; 
   d="scan'208";a="686100701"
Received: from lkp-server02.sh.intel.com (HELO 41300c7200ea) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 16 Sep 2022 04:16:51 -0700
Received: from kbuild by 41300c7200ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oZ9L0-0001jO-2c;
	Fri, 16 Sep 2022 11:16:50 +0000
Date: Fri, 16 Sep 2022 19:16:03 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Gray <bgray@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 1/6] powerpc/code-patching: Implement generic text
 patching function
Message-ID: <202209161957.R4ivN9mo-lkp@intel.com>
References: <20220916062330.430468-2-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220916062330.430468-2-bgray@linux.ibm.com>
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
Cc: christophe.leroy@c-s.fr, kbuild-all@lists.01.org, ajd@linux.ibm.com, npiggin@gmail.com, jpoimboe@kernel.org, jbaron@akamai.com, rostedt@goodmis.org, Benjamin Gray <bgray@linux.ibm.com>, ardb@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Benjamin,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on powerpc/next]
[also build test WARNING on next-20220916]
[cannot apply to linus/master v6.0-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Gray/Out-of-line-static-calls-for-powerpc64-ELF-V2/20220916-142951
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20220916/202209161957.R4ivN9mo-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/31a9d4d694a3a20129f20390f3d7af2c154c8ed1
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Benjamin-Gray/Out-of-line-static-calls-for-powerpc64-ELF-V2/20220916-142951
        git checkout 31a9d4d694a3a20129f20390f3d7af2c154c8ed1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash arch/powerpc/lib/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/powerpc/lib/code-patching.c:235:7: warning: no previous prototype for 'patch_memory' [-Wmissing-prototypes]
     235 | void *patch_memory(void *dest, const void *src, size_t size)
         |       ^~~~~~~~~~~~
   arch/powerpc/lib/code-patching.c: In function 'patch_instruction':
   arch/powerpc/lib/code-patching.c:248:24: error: implicit declaration of function 'patch_text'; did you mean 'path_get'? [-Werror=implicit-function-declaration]
     248 |                 return patch_text(addr, &val, sizeof(val), true);
         |                        ^~~~~~~~~~
         |                        path_get
   arch/powerpc/lib/code-patching.c: At top level:
   arch/powerpc/lib/code-patching.c:230:12: warning: 'do_patch_instruction' defined but not used [-Wunused-function]
     230 | static int do_patch_instruction(u32 *addr, ppc_inst_t instr)
         |            ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/patch_memory +235 arch/powerpc/lib/code-patching.c

   234	
 > 235	void *patch_memory(void *dest, const void *src, size_t size)
   236	{
   237		return memcpy(dest, src, size);
   238	}
   239	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
