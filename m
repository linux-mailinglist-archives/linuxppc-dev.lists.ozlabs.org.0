Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD64328C218
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Oct 2020 22:13:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C98xg4HvtzDqkb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Oct 2020 07:13:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C98vd5xpCzDqYS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Oct 2020 07:11:20 +1100 (AEDT)
IronPort-SDR: RkzJRgEJqcVy5Akwk3jMxcLejzTZTtoLe5C3uiKgBzazF4n4v2h9RL/7Vj4AOY+sbjkPDDprcm
 Ja4qFa9n/BNA==
X-IronPort-AV: E=McAfee;i="6000,8403,9772"; a="145662615"
X-IronPort-AV: E=Sophos;i="5.77,367,1596524400"; 
 d="gz'50?scan'50,208,50";a="145662615"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2020 13:11:14 -0700
IronPort-SDR: ZPYLsICAnnpnDujHtMNu0a19DxnvfwGq+t9j7pnRICPxiqnJMkV2rqo48v5LGuCRthb9wsr2IY
 wy8EiQVK3P/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,367,1596524400"; 
 d="gz'50?scan'50,208,50";a="390049190"
Received: from lkp-server01.sh.intel.com (HELO aa1d92d39b27) ([10.239.97.150])
 by orsmga001.jf.intel.com with ESMTP; 12 Oct 2020 13:11:11 -0700
Received: from kbuild by aa1d92d39b27 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kS4A2-00008I-Gs; Mon, 12 Oct 2020 20:11:10 +0000
Date: Tue, 13 Oct 2020 04:10:45 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/features: Remove CPU_FTR_NODSISRALIGN
Message-ID: <202010130404.VtUO3i24-lkp@intel.com>
References: <0346768708b69bdbfec82f6e5b0364962b9b6932.1602489812.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="envbJBWh7q8WU6mo"
Content-Disposition: inline
In-Reply-To: <0346768708b69bdbfec82f6e5b0364962b9b6932.1602489812.git.christophe.leroy@csgroup.eu>
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
Cc: linuxppc-dev@lists.ozlabs.org, kbuild-all@lists.01.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--envbJBWh7q8WU6mo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Christophe,

I love your patch! Yet something to improve:

[auto build test ERROR on powerpc/next]
[also build test ERROR on v5.9 next-20201012]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Christophe-Leroy/powerpc-features-Remove-CPU_FTR_NODSISRALIGN/20201012-160453
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
config: powerpc-randconfig-r024-20201012 (attached as .config)
compiler: powerpc-linux-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/9fd60382753ab51a10fb3d11ea7423491e32122e
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Christophe-Leroy/powerpc-features-Remove-CPU_FTR_NODSISRALIGN/20201012-160453
        git checkout 9fd60382753ab51a10fb3d11ea7423491e32122e
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=powerpc 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   WARNING: unmet direct dependencies detected for HOTPLUG_CPU
   Depends on SMP && (PPC_PSERIES || PPC_PMAC || PPC_POWERNV || FSL_SOC_BOOKE
   Selected by
   - PM_SLEEP_SMP && SMP && (ARCH_SUSPEND_POSSIBLE || ARCH_HIBERNATION_POSSIBLE && PM_SLEEP
   In file included from arch/powerpc/include/asm/synch.h:6,
   from arch/powerpc/include/asm/bitops.h:43,
   from include/linux/bitops.h:29,
   from include/linux/kernel.h:12,
   from include/asm-generic/bug.h:20,
   from arch/powerpc/include/asm/bug.h:109,
   from include/linux/bug.h:5,
   from include/linux/page-flags.h:10,
   from kernel/bounds.c:10:
>> arch/powerpc/include/asm/cputable.h:411:47: error: 'CPU_FTR_NODSISRALIGN' undeclared here (not in a function)
   411 | #define CPU_FTRS_GENERIC_32 (CPU_FTR_COMMON | CPU_FTR_NODSISRALIGN)
   | ^~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/cputable.h:523:6: note: in expansion of macro 'CPU_FTRS_GENERIC_32'
   523 | CPU_FTRS_GENERIC_32 |
   | ^~~~~~~~~~~~~~~~~~~
   Makefile arch block certs crypto drivers fs include init ipc kernel lib mm net scripts security sound source usr virt [scripts/Makefile.build:117: kernel/bounds.s] Error 1
   Target '__build' not remade because of errors.
   Makefile arch block certs crypto drivers fs include init ipc kernel lib mm net scripts security sound source usr virt [Makefile:1202: prepare0] Error 2
   Target 'prepare' not remade because of errors.
   make: Makefile arch block certs crypto drivers fs include init ipc kernel lib mm net scripts security sound source usr virt [Makefile:185: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

vim +/CPU_FTR_NODSISRALIGN +411 arch/powerpc/include/asm/cputable.h

10b35d9978ac35 include/asm-powerpc/cputable.h      Kumar Gala             2005-09-23  296  
c0d64cf9fefd58 arch/powerpc/include/asm/cputable.h Paul Mackerras         2018-03-20  297  #define CPU_FTRS_603	(CPU_FTR_COMMON | CPU_FTR_MAYBE_CAN_DOZE | \
385e89d5b20f5a arch/powerpc/include/asm/cputable.h Christophe Leroy       2018-11-28  298  	    CPU_FTR_MAYBE_CAN_NAP | CPU_FTR_PPC_LE | CPU_FTR_NOEXECUTE)
c0d64cf9fefd58 arch/powerpc/include/asm/cputable.h Paul Mackerras         2018-03-20  299  #define CPU_FTRS_604	(CPU_FTR_COMMON | CPU_FTR_PPC_LE)
4508dc21feb189 include/asm-powerpc/cputable.h      David Gibson           2007-06-13  300  #define CPU_FTRS_740_NOTAU	(CPU_FTR_COMMON | \
c0d64cf9fefd58 arch/powerpc/include/asm/cputable.h Paul Mackerras         2018-03-20  301  	    CPU_FTR_MAYBE_CAN_DOZE | CPU_FTR_L2CR | \
7c03d653cd2577 arch/powerpc/include/asm/cputable.h Benjamin Herrenschmidt 2008-12-18  302  	    CPU_FTR_MAYBE_CAN_NAP | CPU_FTR_PPC_LE)
4508dc21feb189 include/asm-powerpc/cputable.h      David Gibson           2007-06-13  303  #define CPU_FTRS_740	(CPU_FTR_COMMON | \
c0d64cf9fefd58 arch/powerpc/include/asm/cputable.h Paul Mackerras         2018-03-20  304  	    CPU_FTR_MAYBE_CAN_DOZE | CPU_FTR_L2CR | \
7c03d653cd2577 arch/powerpc/include/asm/cputable.h Benjamin Herrenschmidt 2008-12-18  305  	    CPU_FTR_TAU | CPU_FTR_MAYBE_CAN_NAP | \
fab5db97e44f76 include/asm-powerpc/cputable.h      Paul Mackerras         2006-06-07  306  	    CPU_FTR_PPC_LE)
4508dc21feb189 include/asm-powerpc/cputable.h      David Gibson           2007-06-13  307  #define CPU_FTRS_750	(CPU_FTR_COMMON | \
c0d64cf9fefd58 arch/powerpc/include/asm/cputable.h Paul Mackerras         2018-03-20  308  	    CPU_FTR_MAYBE_CAN_DOZE | CPU_FTR_L2CR | \
7c03d653cd2577 arch/powerpc/include/asm/cputable.h Benjamin Herrenschmidt 2008-12-18  309  	    CPU_FTR_TAU | CPU_FTR_MAYBE_CAN_NAP | \
fab5db97e44f76 include/asm-powerpc/cputable.h      Paul Mackerras         2006-06-07  310  	    CPU_FTR_PPC_LE)
7c03d653cd2577 arch/powerpc/include/asm/cputable.h Benjamin Herrenschmidt 2008-12-18  311  #define CPU_FTRS_750CL	(CPU_FTRS_750)
b6f41cc8304ce0 include/asm-powerpc/cputable.h      Josh Boyer             2007-07-03  312  #define CPU_FTRS_750FX1	(CPU_FTRS_750 | CPU_FTR_DUAL_PLL_750FX | CPU_FTR_NO_DPM)
b6f41cc8304ce0 include/asm-powerpc/cputable.h      Josh Boyer             2007-07-03  313  #define CPU_FTRS_750FX2	(CPU_FTRS_750 | CPU_FTR_NO_DPM)
7c03d653cd2577 arch/powerpc/include/asm/cputable.h Benjamin Herrenschmidt 2008-12-18  314  #define CPU_FTRS_750FX	(CPU_FTRS_750 | CPU_FTR_DUAL_PLL_750FX)
b6f41cc8304ce0 include/asm-powerpc/cputable.h      Josh Boyer             2007-07-03  315  #define CPU_FTRS_750GX	(CPU_FTRS_750FX)
4508dc21feb189 include/asm-powerpc/cputable.h      David Gibson           2007-06-13  316  #define CPU_FTRS_7400_NOTAU	(CPU_FTR_COMMON | \
c0d64cf9fefd58 arch/powerpc/include/asm/cputable.h Paul Mackerras         2018-03-20  317  	    CPU_FTR_MAYBE_CAN_DOZE | CPU_FTR_L2CR | \
7c03d653cd2577 arch/powerpc/include/asm/cputable.h Benjamin Herrenschmidt 2008-12-18  318  	    CPU_FTR_ALTIVEC_COMP | \
fab5db97e44f76 include/asm-powerpc/cputable.h      Paul Mackerras         2006-06-07  319  	    CPU_FTR_MAYBE_CAN_NAP | CPU_FTR_PPC_LE)
4508dc21feb189 include/asm-powerpc/cputable.h      David Gibson           2007-06-13  320  #define CPU_FTRS_7400	(CPU_FTR_COMMON | \
c0d64cf9fefd58 arch/powerpc/include/asm/cputable.h Paul Mackerras         2018-03-20  321  	    CPU_FTR_MAYBE_CAN_DOZE | CPU_FTR_L2CR | \
7c03d653cd2577 arch/powerpc/include/asm/cputable.h Benjamin Herrenschmidt 2008-12-18  322  	    CPU_FTR_TAU | CPU_FTR_ALTIVEC_COMP | \
fab5db97e44f76 include/asm-powerpc/cputable.h      Paul Mackerras         2006-06-07  323  	    CPU_FTR_MAYBE_CAN_NAP | CPU_FTR_PPC_LE)
4508dc21feb189 include/asm-powerpc/cputable.h      David Gibson           2007-06-13  324  #define CPU_FTRS_7450_20	(CPU_FTR_COMMON | \
c0d64cf9fefd58 arch/powerpc/include/asm/cputable.h Paul Mackerras         2018-03-20  325  	    CPU_FTR_L2CR | CPU_FTR_ALTIVEC_COMP | \
7c03d653cd2577 arch/powerpc/include/asm/cputable.h Benjamin Herrenschmidt 2008-12-18  326  	    CPU_FTR_L3CR | CPU_FTR_SPEC7450 | \
b64f87c16f3c00 include/asm-powerpc/cputable.h      Becky Bruce            2007-11-10  327  	    CPU_FTR_NEED_COHERENT | CPU_FTR_PPC_LE | CPU_FTR_NEED_PAIRED_STWCX)
4508dc21feb189 include/asm-powerpc/cputable.h      David Gibson           2007-06-13  328  #define CPU_FTRS_7450_21	(CPU_FTR_COMMON | \
7c92943c7b6c42 include/asm-powerpc/cputable.h      Stephen Rothwell       2006-03-23  329  	    CPU_FTR_MAYBE_CAN_NAP | CPU_FTR_L2CR | CPU_FTR_ALTIVEC_COMP | \
7c03d653cd2577 arch/powerpc/include/asm/cputable.h Benjamin Herrenschmidt 2008-12-18  330  	    CPU_FTR_L3CR | CPU_FTR_SPEC7450 | \
7c92943c7b6c42 include/asm-powerpc/cputable.h      Stephen Rothwell       2006-03-23  331  	    CPU_FTR_NAP_DISABLE_L2_PR | CPU_FTR_L3_DISABLE_NAP | \
b64f87c16f3c00 include/asm-powerpc/cputable.h      Becky Bruce            2007-11-10  332  	    CPU_FTR_NEED_COHERENT | CPU_FTR_PPC_LE | CPU_FTR_NEED_PAIRED_STWCX)
4508dc21feb189 include/asm-powerpc/cputable.h      David Gibson           2007-06-13  333  #define CPU_FTRS_7450_23	(CPU_FTR_COMMON | \
c0d64cf9fefd58 arch/powerpc/include/asm/cputable.h Paul Mackerras         2018-03-20  334  	    CPU_FTR_NEED_PAIRED_STWCX | \
7c92943c7b6c42 include/asm-powerpc/cputable.h      Stephen Rothwell       2006-03-23  335  	    CPU_FTR_MAYBE_CAN_NAP | CPU_FTR_L2CR | CPU_FTR_ALTIVEC_COMP | \
7c03d653cd2577 arch/powerpc/include/asm/cputable.h Benjamin Herrenschmidt 2008-12-18  336  	    CPU_FTR_L3CR | CPU_FTR_SPEC7450 | \
fab5db97e44f76 include/asm-powerpc/cputable.h      Paul Mackerras         2006-06-07  337  	    CPU_FTR_NAP_DISABLE_L2_PR | CPU_FTR_NEED_COHERENT | CPU_FTR_PPC_LE)
4508dc21feb189 include/asm-powerpc/cputable.h      David Gibson           2007-06-13  338  #define CPU_FTRS_7455_1	(CPU_FTR_COMMON | \
c0d64cf9fefd58 arch/powerpc/include/asm/cputable.h Paul Mackerras         2018-03-20  339  	    CPU_FTR_NEED_PAIRED_STWCX | \
7c92943c7b6c42 include/asm-powerpc/cputable.h      Stephen Rothwell       2006-03-23  340  	    CPU_FTR_L2CR | CPU_FTR_ALTIVEC_COMP | CPU_FTR_L3CR | \
7c03d653cd2577 arch/powerpc/include/asm/cputable.h Benjamin Herrenschmidt 2008-12-18  341  	    CPU_FTR_SPEC7450 | CPU_FTR_NEED_COHERENT | CPU_FTR_PPC_LE)
4508dc21feb189 include/asm-powerpc/cputable.h      David Gibson           2007-06-13  342  #define CPU_FTRS_7455_20	(CPU_FTR_COMMON | \
c0d64cf9fefd58 arch/powerpc/include/asm/cputable.h Paul Mackerras         2018-03-20  343  	    CPU_FTR_NEED_PAIRED_STWCX | \
7c92943c7b6c42 include/asm-powerpc/cputable.h      Stephen Rothwell       2006-03-23  344  	    CPU_FTR_MAYBE_CAN_NAP | CPU_FTR_L2CR | CPU_FTR_ALTIVEC_COMP | \
7c03d653cd2577 arch/powerpc/include/asm/cputable.h Benjamin Herrenschmidt 2008-12-18  345  	    CPU_FTR_L3CR | CPU_FTR_SPEC7450 | \
7c92943c7b6c42 include/asm-powerpc/cputable.h      Stephen Rothwell       2006-03-23  346  	    CPU_FTR_NAP_DISABLE_L2_PR | CPU_FTR_L3_DISABLE_NAP | \
7c03d653cd2577 arch/powerpc/include/asm/cputable.h Benjamin Herrenschmidt 2008-12-18  347  	    CPU_FTR_NEED_COHERENT | CPU_FTR_PPC_LE)
4508dc21feb189 include/asm-powerpc/cputable.h      David Gibson           2007-06-13  348  #define CPU_FTRS_7455	(CPU_FTR_COMMON | \
7c92943c7b6c42 include/asm-powerpc/cputable.h      Stephen Rothwell       2006-03-23  349  	    CPU_FTR_MAYBE_CAN_NAP | CPU_FTR_L2CR | CPU_FTR_ALTIVEC_COMP | \
7c03d653cd2577 arch/powerpc/include/asm/cputable.h Benjamin Herrenschmidt 2008-12-18  350  	    CPU_FTR_L3CR | CPU_FTR_SPEC7450 | CPU_FTR_NAP_DISABLE_L2_PR | \
b64f87c16f3c00 include/asm-powerpc/cputable.h      Becky Bruce            2007-11-10  351  	    CPU_FTR_NEED_COHERENT | CPU_FTR_PPC_LE | CPU_FTR_NEED_PAIRED_STWCX)
4508dc21feb189 include/asm-powerpc/cputable.h      David Gibson           2007-06-13  352  #define CPU_FTRS_7447_10	(CPU_FTR_COMMON | \
7c92943c7b6c42 include/asm-powerpc/cputable.h      Stephen Rothwell       2006-03-23  353  	    CPU_FTR_MAYBE_CAN_NAP | CPU_FTR_L2CR | CPU_FTR_ALTIVEC_COMP | \
7c03d653cd2577 arch/powerpc/include/asm/cputable.h Benjamin Herrenschmidt 2008-12-18  354  	    CPU_FTR_L3CR | CPU_FTR_SPEC7450 | CPU_FTR_NAP_DISABLE_L2_PR | \
b64f87c16f3c00 include/asm-powerpc/cputable.h      Becky Bruce            2007-11-10  355  	    CPU_FTR_NEED_COHERENT | CPU_FTR_NO_BTIC | CPU_FTR_PPC_LE | \
b64f87c16f3c00 include/asm-powerpc/cputable.h      Becky Bruce            2007-11-10  356  	    CPU_FTR_NEED_PAIRED_STWCX)
4508dc21feb189 include/asm-powerpc/cputable.h      David Gibson           2007-06-13  357  #define CPU_FTRS_7447	(CPU_FTR_COMMON | \
7c92943c7b6c42 include/asm-powerpc/cputable.h      Stephen Rothwell       2006-03-23  358  	    CPU_FTR_MAYBE_CAN_NAP | CPU_FTR_L2CR | CPU_FTR_ALTIVEC_COMP | \
7c03d653cd2577 arch/powerpc/include/asm/cputable.h Benjamin Herrenschmidt 2008-12-18  359  	    CPU_FTR_L3CR | CPU_FTR_SPEC7450 | CPU_FTR_NAP_DISABLE_L2_PR | \
b64f87c16f3c00 include/asm-powerpc/cputable.h      Becky Bruce            2007-11-10  360  	    CPU_FTR_NEED_COHERENT | CPU_FTR_PPC_LE | CPU_FTR_NEED_PAIRED_STWCX)
4508dc21feb189 include/asm-powerpc/cputable.h      David Gibson           2007-06-13  361  #define CPU_FTRS_7447A	(CPU_FTR_COMMON | \
7c92943c7b6c42 include/asm-powerpc/cputable.h      Stephen Rothwell       2006-03-23  362  	    CPU_FTR_MAYBE_CAN_NAP | CPU_FTR_L2CR | CPU_FTR_ALTIVEC_COMP | \
7c03d653cd2577 arch/powerpc/include/asm/cputable.h Benjamin Herrenschmidt 2008-12-18  363  	    CPU_FTR_SPEC7450 | CPU_FTR_NAP_DISABLE_L2_PR | \
b64f87c16f3c00 include/asm-powerpc/cputable.h      Becky Bruce            2007-11-10  364  	    CPU_FTR_NEED_COHERENT | CPU_FTR_PPC_LE | CPU_FTR_NEED_PAIRED_STWCX)
4508dc21feb189 include/asm-powerpc/cputable.h      David Gibson           2007-06-13  365  #define CPU_FTRS_7448	(CPU_FTR_COMMON | \
3d372548b4af1a include/asm-powerpc/cputable.h      James.Yang             2007-05-02  366  	    CPU_FTR_MAYBE_CAN_NAP | CPU_FTR_L2CR | CPU_FTR_ALTIVEC_COMP | \
7c03d653cd2577 arch/powerpc/include/asm/cputable.h Benjamin Herrenschmidt 2008-12-18  367  	    CPU_FTR_SPEC7450 | CPU_FTR_NAP_DISABLE_L2_PR | \
b64f87c16f3c00 include/asm-powerpc/cputable.h      Becky Bruce            2007-11-10  368  	    CPU_FTR_PPC_LE | CPU_FTR_NEED_PAIRED_STWCX)
385e89d5b20f5a arch/powerpc/include/asm/cputable.h Christophe Leroy       2018-11-28  369  #define CPU_FTRS_82XX	(CPU_FTR_COMMON | CPU_FTR_MAYBE_CAN_DOZE | CPU_FTR_NOEXECUTE)
11af1192b75307 include/asm-powerpc/cputable.h      Scott Wood             2007-09-14  370  #define CPU_FTRS_G2_LE	(CPU_FTR_COMMON | CPU_FTR_MAYBE_CAN_DOZE | \
c0d64cf9fefd58 arch/powerpc/include/asm/cputable.h Paul Mackerras         2018-03-20  371  	    CPU_FTR_MAYBE_CAN_NAP)
4508dc21feb189 include/asm-powerpc/cputable.h      David Gibson           2007-06-13  372  #define CPU_FTRS_E300	(CPU_FTR_MAYBE_CAN_DOZE | \
c0d64cf9fefd58 arch/powerpc/include/asm/cputable.h Paul Mackerras         2018-03-20  373  	    CPU_FTR_MAYBE_CAN_NAP | \
385e89d5b20f5a arch/powerpc/include/asm/cputable.h Christophe Leroy       2018-11-28  374  	    CPU_FTR_COMMON  | CPU_FTR_NOEXECUTE)
4508dc21feb189 include/asm-powerpc/cputable.h      David Gibson           2007-06-13  375  #define CPU_FTRS_E300C2	(CPU_FTR_MAYBE_CAN_DOZE | \
c0d64cf9fefd58 arch/powerpc/include/asm/cputable.h Paul Mackerras         2018-03-20  376  	    CPU_FTR_MAYBE_CAN_NAP | \
385e89d5b20f5a arch/powerpc/include/asm/cputable.h Christophe Leroy       2018-11-28  377  	    CPU_FTR_COMMON | CPU_FTR_FPU_UNAVAILABLE  | CPU_FTR_NOEXECUTE)
c0d64cf9fefd58 arch/powerpc/include/asm/cputable.h Paul Mackerras         2018-03-20  378  #define CPU_FTRS_CLASSIC32	(CPU_FTR_COMMON)
c0d64cf9fefd58 arch/powerpc/include/asm/cputable.h Paul Mackerras         2018-03-20  379  #define CPU_FTRS_8XX	(CPU_FTR_NOEXECUTE)
9fd60382753ab5 arch/powerpc/include/asm/cputable.h Christophe Leroy       2020-10-12  380  #define CPU_FTRS_40X	(CPU_FTR_NOEXECUTE)
9fd60382753ab5 arch/powerpc/include/asm/cputable.h Christophe Leroy       2020-10-12  381  #define CPU_FTRS_44X	(CPU_FTR_NOEXECUTE)
9fd60382753ab5 arch/powerpc/include/asm/cputable.h Christophe Leroy       2020-10-12  382  #define CPU_FTRS_440x6	(CPU_FTR_NOEXECUTE | \
6d2170be456129 arch/powerpc/include/asm/cputable.h Benjamin Herrenschmidt 2008-12-18  383  	    CPU_FTR_INDEXED_DCR)
e7f75ad01d5902 arch/powerpc/include/asm/cputable.h Dave Kleikamp          2010-03-05  384  #define CPU_FTRS_47X	(CPU_FTRS_440x6)
c0d64cf9fefd58 arch/powerpc/include/asm/cputable.h Paul Mackerras         2018-03-20  385  #define CPU_FTRS_E200	(CPU_FTR_SPE_COMP | \
9fd60382753ab5 arch/powerpc/include/asm/cputable.h Christophe Leroy       2020-10-12  386  	    CPU_FTR_COHERENT_ICACHE | \
e0291f1decd6e8 arch/powerpc/include/asm/cputable.h Christophe Leroy       2019-08-26  387  	    CPU_FTR_NOEXECUTE | \
52b066fa4e9cbf arch/powerpc/include/asm/cputable.h Scott Wood             2011-12-20  388  	    CPU_FTR_DEBUG_LVL_EXC)
c0d64cf9fefd58 arch/powerpc/include/asm/cputable.h Paul Mackerras         2018-03-20  389  #define CPU_FTRS_E500	(CPU_FTR_MAYBE_CAN_DOZE | \
9fd60382753ab5 arch/powerpc/include/asm/cputable.h Christophe Leroy       2020-10-12  390  	    CPU_FTR_SPE_COMP | CPU_FTR_MAYBE_CAN_NAP | \
8309ce7280536b arch/powerpc/include/asm/cputable.h Benjamin Herrenschmidt 2008-12-12  391  	    CPU_FTR_NOEXECUTE)
c0d64cf9fefd58 arch/powerpc/include/asm/cputable.h Paul Mackerras         2018-03-20  392  #define CPU_FTRS_E500_2	(CPU_FTR_MAYBE_CAN_DOZE | \
7c03d653cd2577 arch/powerpc/include/asm/cputable.h Benjamin Herrenschmidt 2008-12-18  393  	    CPU_FTR_SPE_COMP | CPU_FTR_MAYBE_CAN_NAP | \
9fd60382753ab5 arch/powerpc/include/asm/cputable.h Christophe Leroy       2020-10-12  394  	    CPU_FTR_NOEXECUTE)
9fd60382753ab5 arch/powerpc/include/asm/cputable.h Christophe Leroy       2020-10-12  395  #define CPU_FTRS_E500MC	( \
dd0efb3f11cc0a arch/powerpc/include/asm/cputable.h Paul Mackerras         2018-03-20  396  	    CPU_FTR_LWSYNC | CPU_FTR_NOEXECUTE | \
73196cd364a2d9 arch/powerpc/include/asm/cputable.h Scott Wood             2011-12-20  397  	    CPU_FTR_DBELL | CPU_FTR_DEBUG_LVL_EXC | CPU_FTR_EMB_HV)
d52459ca304743 arch/powerpc/include/asm/cputable.h Scott Wood             2013-07-23  398  /*
d52459ca304743 arch/powerpc/include/asm/cputable.h Scott Wood             2013-07-23  399   * e5500/e6500 erratum A-006958 is a timebase bug that can use the
d52459ca304743 arch/powerpc/include/asm/cputable.h Scott Wood             2013-07-23  400   * same workaround as CPU_FTR_CELL_TB_BUG.
d52459ca304743 arch/powerpc/include/asm/cputable.h Scott Wood             2013-07-23  401   */
9fd60382753ab5 arch/powerpc/include/asm/cputable.h Christophe Leroy       2020-10-12  402  #define CPU_FTRS_E5500	( \
dd0efb3f11cc0a arch/powerpc/include/asm/cputable.h Paul Mackerras         2018-03-20  403  	    CPU_FTR_LWSYNC | CPU_FTR_NOEXECUTE | \
d36b4c4f3cc6ca arch/powerpc/include/asm/cputable.h Kumar Gala             2011-04-06  404  	    CPU_FTR_DBELL | CPU_FTR_POPCNTB | CPU_FTR_POPCNTD | \
d52459ca304743 arch/powerpc/include/asm/cputable.h Scott Wood             2013-07-23  405  	    CPU_FTR_DEBUG_LVL_EXC | CPU_FTR_EMB_HV | CPU_FTR_CELL_TB_BUG)
9fd60382753ab5 arch/powerpc/include/asm/cputable.h Christophe Leroy       2020-10-12  406  #define CPU_FTRS_E6500	( \
dd0efb3f11cc0a arch/powerpc/include/asm/cputable.h Paul Mackerras         2018-03-20  407  	    CPU_FTR_LWSYNC | CPU_FTR_NOEXECUTE | \
10241842fbe900 arch/powerpc/include/asm/cputable.h Kumar Gala             2011-11-06  408  	    CPU_FTR_DBELL | CPU_FTR_POPCNTB | CPU_FTR_POPCNTD | \
d52459ca304743 arch/powerpc/include/asm/cputable.h Scott Wood             2013-07-23  409  	    CPU_FTR_DEBUG_LVL_EXC | CPU_FTR_EMB_HV | CPU_FTR_ALTIVEC_COMP | \
e16c8765533a15 arch/powerpc/include/asm/cputable.h Andy Fleming           2011-12-08  410  	    CPU_FTR_CELL_TB_BUG | CPU_FTR_SMT)
7c92943c7b6c42 include/asm-powerpc/cputable.h      Stephen Rothwell       2006-03-23 @411  #define CPU_FTRS_GENERIC_32	(CPU_FTR_COMMON | CPU_FTR_NODSISRALIGN)
0b8e2e131094d1 include/asm-powerpc/cputable.h      Michael Ellerman       2006-11-23  412  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--envbJBWh7q8WU6mo
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
I2xyWyeuibHfxZlPAv9li+Efdg4Bt8+LAQA=

--envbJBWh7q8WU6mo--
