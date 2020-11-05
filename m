Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8314D2A8847
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 21:45:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRwWn1JMGzDr9L
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Nov 2020 07:45:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRwTc41wpzDr72
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Nov 2020 07:43:31 +1100 (AEDT)
IronPort-SDR: oKw85mB+YeYHLzYnk2NzyE2wEIvoZIEj6MPEBSknObU8+DLdJPntmNl//1TJ16bcAmyt7Vc3bK
 bgjOYA7PKhjQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9796"; a="148737524"
X-IronPort-AV: E=Sophos;i="5.77,454,1596524400"; 
 d="gz'50?scan'50,208,50";a="148737524"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2020 12:43:23 -0800
IronPort-SDR: iHUCGQAxMNdwPIuRtMwxiMfjBTt09IeCLHChCbEoB7JqdnBrgsDz76+AkTZ8IploZj5QPu1rMx
 0F152cfBC+5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,454,1596524400"; 
 d="gz'50?scan'50,208,50";a="326161080"
Received: from lkp-server01.sh.intel.com (HELO a340e641b702) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 05 Nov 2020 12:43:21 -0800
Received: from kbuild by a340e641b702 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kam6L-000064-7X; Thu, 05 Nov 2020 20:43:21 +0000
Date: Fri, 6 Nov 2020 04:43:19 +0800
From: kernel test robot <lkp@intel.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 03/18] powerpc: bad_page_fault, do_break get registers
 from regs
Message-ID: <202011060448.OUP03qqv-lkp@intel.com>
References: <20201105143431.1874789-4-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="bg08WKrSYDhXBjb5"
Content-Disposition: inline
In-Reply-To: <20201105143431.1874789-4-npiggin@gmail.com>
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


--bg08WKrSYDhXBjb5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nicholas,

I love your patch! Yet something to improve:

[auto build test ERROR on powerpc/next]
[also build test ERROR on v5.10-rc2 next-20201105]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Nicholas-Piggin/powerpc-interrupt-wrappers/20201105-231909
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
config: powerpc-allnoconfig (attached as .config)
compiler: powerpc-linux-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/4232a616cd2a8f7ef6b3f19cd656690dc5ec4c9e
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Nicholas-Piggin/powerpc-interrupt-wrappers/20201105-231909
        git checkout 4232a616cd2a8f7ef6b3f19cd656690dc5ec4c9e
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=powerpc 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:5,
                    from arch/powerpc/include/asm/bug.h:109,
                    from include/linux/bug.h:5,
                    from include/linux/signal.h:5,
                    from arch/powerpc/mm/fault.c:14:
   arch/powerpc/mm/fault.c: In function '__do_page_fault':
>> arch/powerpc/mm/fault.c:378:43: error: suggest parentheses around arithmetic in operand of '|' [-Werror=parentheses]
     378 | #define page_fault_is_bad(__err) ((__err) & DSISR_BAD_FAULT_32S | DSISR_DABRMATCH)
   include/linux/compiler.h:78:42: note: in definition of macro 'unlikely'
      78 | # define unlikely(x) __builtin_expect(!!(x), 0)
         |                                          ^
   arch/powerpc/mm/fault.c:410:15: note: in expansion of macro 'page_fault_is_bad'
     410 |  if (unlikely(page_fault_is_bad(error_code))) {
         |               ^~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors

vim +378 arch/powerpc/mm/fault.c

   361	
   362	/*
   363	 * Define the correct "is_write" bit in error_code based
   364	 * on the processor family
   365	 */
   366	#if (defined(CONFIG_4xx) || defined(CONFIG_BOOKE))
   367	#define page_fault_is_write(__err)	((__err) & ESR_DST)
   368	#define page_fault_is_bad(__err)	(0)
   369	#else
   370	#define page_fault_is_write(__err)	((__err) & DSISR_ISSTORE)
   371	#if defined(CONFIG_PPC_8xx)
   372	#define page_fault_is_bad(__err)	((__err) & DSISR_NOEXEC_OR_G)
   373	#elif defined(CONFIG_PPC_BOOK3S_64)
   374	#define page_fault_is_bad(__err)	((__err) & (DSISR_BAD_FAULT_64S | DSISR_DABRMATCH))
   375	#elif defined(CONFIG_PPC_BOOK3E_64)
   376	#define page_fault_is_bad(__err)	((__err) & DSISR_BAD_FAULT_64S)
   377	#else
 > 378	#define page_fault_is_bad(__err)	((__err) & DSISR_BAD_FAULT_32S | DSISR_DABRMATCH)
   379	#endif
   380	#endif
   381	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--bg08WKrSYDhXBjb5
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
A91Q+4RImVVPljymoFArNZJPDE9o8kZbAAA=

--bg08WKrSYDhXBjb5--
