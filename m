Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5633260E053
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Oct 2022 14:09:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4My6zh1PK9z3c78
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Oct 2022 23:09:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EMCtYkfN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EMCtYkfN;
	dkim-atps=neutral
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4My6yh0Svpz307b
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Oct 2022 23:08:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666786092; x=1698322092;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2Hs8Y9gYODAzWUi9DV4jup7TE3ZYiVJK2DtK/Y9VA9g=;
  b=EMCtYkfN1ExOMYDrGXJ1FM6Y+KR7j6EqUEtwlt1qvKBwUcQ8kYGziRXC
   7CIR8/hLA97XIoNPv1OFgzRqxwrDXMyjBkKq0cCn7sN+ngS7RgTA/g1Re
   5DJrvADMVrtGH7vX9WejRKX3SkPzV9UK3fMJZ0X6F+cloRgyhnq2jWTQw
   Gfzpu5z/FTfvU/jkME9dCFnhZur1n4Je24f/C2xEJD5diTkv9tkp20fbd
   HJrFE9zWmq9KXyo4l2sPmQc/DZNHi7hewxt8BYrdTriD0ODv0zvFpIJkD
   dKJOZoY5hpxDczq7nf2VmGOOX30iAUfIj/UdQW7autom4ucWrulNOAk85
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10511"; a="334545899"
X-IronPort-AV: E=Sophos;i="5.95,214,1661842800"; 
   d="gz'50?scan'50,208,50";a="334545899"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2022 05:07:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10511"; a="626761818"
X-IronPort-AV: E=Sophos;i="5.95,214,1661842800"; 
   d="gz'50?scan'50,208,50";a="626761818"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 26 Oct 2022 05:07:50 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1onfCI-0007O4-0U;
	Wed, 26 Oct 2022 12:07:50 +0000
Date: Wed, 26 Oct 2022 20:07:02 +0800
From: kernel test robot <lkp@intel.com>
To: KaiLong Wang <wangkailong@jari.cn>, mpe@ellerman.id.au,
	npiggin@gmail.com, christophe.leroy@csgroup.eu,
	farosas@linux.ibm.com, mirq-linux@rere.qmqm.pl,
	dmitry.osipenko@collabora.com, kda@linux-powerpc.org,
	naveen.n.rao@linux.vnet.ibm.com
Subject: Re: [PATCH] powerpc: replace ternary operator with min()
Message-ID: <202210261921.YmXQfwZR-lkp@intel.com>
References: <4ebda26c.346.18404df6852.Coremail.wangkailong@jari.cn>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="ybUThRY1btpBkMKK"
Content-Disposition: inline
In-Reply-To: <4ebda26c.346.18404df6852.Coremail.wangkailong@jari.cn>
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
Cc: llvm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--ybUThRY1btpBkMKK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi KaiLong,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on powerpc/next]
[also build test ERROR on linus/master v6.1-rc2 next-20221026]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/KaiLong-Wang/powerpc-replace-ternary-operator-with-min/20221023-204906
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/4ebda26c.346.18404df6852.Coremail.wangkailong%40jari.cn
patch subject: [PATCH] powerpc: replace ternary operator with min()
config: powerpc-ppc64e_defconfig (attached as .config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/51fa624eb9fa01ea67de462263913ab61a68cbc5
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review KaiLong-Wang/powerpc-replace-ternary-operator-with-min/20221023-204906
        git checkout 51fa624eb9fa01ea67de462263913ab61a68cbc5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/powerpc/xmon/xmon.c:2583:7: error: comparison of distinct pointer types ('typeof (n) *' (aka 'long *') and 'typeof (16) *' (aka 'int *')) [-Werror,-Wcompare-distinct-pointer-types]
                   r = min(n, 16);
                       ^~~~~~~~~~
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
           __builtin_choose_expr(__safe_cmp(x, y), \
                                 ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
                   (__typecheck(x, y) && __no_side_effects(x, y))
                    ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
           (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
                      ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
   arch/powerpc/xmon/xmon.c:2987:7: error: comparison of distinct pointer types ('typeof (n) *' (aka 'long *') and 'typeof (16) *' (aka 'int *')) [-Werror,-Wcompare-distinct-pointer-types]
                   r = min(n, 16);
                       ^~~~~~~~~~
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
           __builtin_choose_expr(__safe_cmp(x, y), \
                                 ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
                   (__typecheck(x, y) && __no_side_effects(x, y))
                    ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
           (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
                      ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
   2 errors generated.


vim +2583 arch/powerpc/xmon/xmon.c

  2576	
  2577	static void xmon_rawdump (unsigned long adrs, long ndump)
  2578	{
  2579		long n, m, r, nr;
  2580		unsigned char temp[16];
  2581	
  2582		for (n = ndump; n > 0;) {
> 2583			r = min(n, 16);
  2584			nr = mread(adrs, temp, r);
  2585			adrs += nr;
  2586			for (m = 0; m < r; ++m) {
  2587				if (m < nr)
  2588					printf("%.2x", temp[m]);
  2589				else
  2590					printf("%s", fault_chars[fault_type]);
  2591			}
  2592			n -= r;
  2593			if (nr < r)
  2594				break;
  2595		}
  2596		printf("\n");
  2597	}
  2598	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

--ybUThRY1btpBkMKK
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--ybUThRY1btpBkMKK--
