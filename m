Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 880D9ED004
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Nov 2019 18:43:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4755y92V8lzF6Xv
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Nov 2019 04:43:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4755tk1xYQzF6WX
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  3 Nov 2019 04:40:23 +1100 (AEDT)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Nov 2019 10:40:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,260,1569308400"; 
 d="gz'50?scan'50,208,50";a="195018384"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga008.jf.intel.com with ESMTP; 02 Nov 2019 10:40:15 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1iQxNm-000EoQ-FL; Sun, 03 Nov 2019 01:40:14 +0800
Date: Sun, 3 Nov 2019 01:39:56 +0800
From: kbuild test robot <lkp@intel.com>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH v3 36/36] soc: fsl: qe: remove PPC32 dependency from
 CONFIG_QUICC_ENGINE
Message-ID: <201911030121.FcTBohvw%lkp@intel.com>
References: <20191101124210.14510-37-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="iyhfu7zrmyijcqfr"
Content-Disposition: inline
In-Reply-To: <20191101124210.14510-37-linux@rasmusvillemoes.dk>
X-Patchwork-Hint: ignore
User-Agent: NeoMutt/20170113 (1.7.2)
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
Cc: kbuild-all@lists.01.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>,
 Scott Wood <oss@buserror.net>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--iyhfu7zrmyijcqfr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rasmus,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.4-rc5 next-20191031]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Rasmus-Villemoes/QUICC-Engine-support-on-ARM/20191102-234436
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 1204c70d9dcba31164f78ad5d8c88c42335d51f8
config: ia64-allmodconfig (attached as .config)
compiler: ia64-linux-gcc (GCC) 7.4.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        GCC_VERSION=7.4.0 make.cross ARCH=ia64 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/linux/kernel.h:11:0,
                    from drivers/soc/fsl/qe/ucc_slow.c:11:
   drivers/soc/fsl/qe/ucc_slow.c: In function 'ucc_slow_init':
   include/linux/err.h:22:49: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
    #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >= (unsigned long)-MAX_ERRNO)
                                                    ^
   include/linux/compiler.h:78:42: note: in definition of macro 'unlikely'
    # define unlikely(x) __builtin_expect(!!(x), 0)
                                             ^
>> drivers/soc/fsl/qe/ucc_slow.c:182:6: note: in expansion of macro 'IS_ERR_VALUE'
     if (IS_ERR_VALUE(uccs->us_pram_offset)) {
         ^~~~~~~~~~~~
   include/linux/err.h:22:49: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
    #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >= (unsigned long)-MAX_ERRNO)
                                                    ^
   include/linux/compiler.h:78:42: note: in definition of macro 'unlikely'
    # define unlikely(x) __builtin_expect(!!(x), 0)
                                             ^
   drivers/soc/fsl/qe/ucc_slow.c:209:6: note: in expansion of macro 'IS_ERR_VALUE'
     if (IS_ERR_VALUE(uccs->rx_base_offset)) {
         ^~~~~~~~~~~~
   include/linux/err.h:22:49: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
    #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >= (unsigned long)-MAX_ERRNO)
                                                    ^
   include/linux/compiler.h:78:42: note: in definition of macro 'unlikely'
    # define unlikely(x) __builtin_expect(!!(x), 0)
                                             ^
   drivers/soc/fsl/qe/ucc_slow.c:220:6: note: in expansion of macro 'IS_ERR_VALUE'
     if (IS_ERR_VALUE(uccs->tx_base_offset)) {
         ^~~~~~~~~~~~

vim +/IS_ERR_VALUE +182 drivers/soc/fsl/qe/ucc_slow.c

9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  @11  #include <linux/kernel.h>
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   12  #include <linux/errno.h>
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   13  #include <linux/slab.h>
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   14  #include <linux/stddef.h>
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   15  #include <linux/interrupt.h>
4c35630ccda56e arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-05-08   16  #include <linux/err.h>
4b16f8e2d6d642 arch/powerpc/sysdev/qe_lib/ucc_slow.c Paul Gortmaker   2011-07-22   17  #include <linux/export.h>
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   18  
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   19  #include <asm/io.h>
7aa1aa6ecec2af drivers/soc/fsl/qe/ucc_slow.c         Zhao Qiang       2015-11-30   20  #include <soc/fsl/qe/immap_qe.h>
7aa1aa6ecec2af drivers/soc/fsl/qe/ucc_slow.c         Zhao Qiang       2015-11-30   21  #include <soc/fsl/qe/qe.h>
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   22  
7aa1aa6ecec2af drivers/soc/fsl/qe/ucc_slow.c         Zhao Qiang       2015-11-30   23  #include <soc/fsl/qe/ucc.h>
7aa1aa6ecec2af drivers/soc/fsl/qe/ucc_slow.c         Zhao Qiang       2015-11-30   24  #include <soc/fsl/qe/ucc_slow.h>
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   25  
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   26  u32 ucc_slow_get_qe_cr_subblock(int uccs_num)
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   27  {
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   28  	switch (uccs_num) {
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   29  	case 0: return QE_CR_SUBBLOCK_UCCSLOW1;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   30  	case 1: return QE_CR_SUBBLOCK_UCCSLOW2;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   31  	case 2: return QE_CR_SUBBLOCK_UCCSLOW3;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   32  	case 3: return QE_CR_SUBBLOCK_UCCSLOW4;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   33  	case 4: return QE_CR_SUBBLOCK_UCCSLOW5;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   34  	case 5: return QE_CR_SUBBLOCK_UCCSLOW6;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   35  	case 6: return QE_CR_SUBBLOCK_UCCSLOW7;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   36  	case 7: return QE_CR_SUBBLOCK_UCCSLOW8;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   37  	default: return QE_CR_SUBBLOCK_INVALID;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   38  	}
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   39  }
845cf505cebd15 arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2008-01-09   40  EXPORT_SYMBOL(ucc_slow_get_qe_cr_subblock);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   41  
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   42  void ucc_slow_graceful_stop_tx(struct ucc_slow_private * uccs)
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   43  {
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   44  	struct ucc_slow_info *us_info = uccs->us_info;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   45  	u32 id;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   46  
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   47  	id = ucc_slow_get_qe_cr_subblock(us_info->ucc_num);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   48  	qe_issue_cmd(QE_GRACEFUL_STOP_TX, id,
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   49  			 QE_CR_PROTOCOL_UNSPECIFIED, 0);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   50  }
845cf505cebd15 arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2008-01-09   51  EXPORT_SYMBOL(ucc_slow_graceful_stop_tx);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   52  
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   53  void ucc_slow_stop_tx(struct ucc_slow_private * uccs)
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   54  {
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   55  	struct ucc_slow_info *us_info = uccs->us_info;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   56  	u32 id;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   57  
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   58  	id = ucc_slow_get_qe_cr_subblock(us_info->ucc_num);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   59  	qe_issue_cmd(QE_STOP_TX, id, QE_CR_PROTOCOL_UNSPECIFIED, 0);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   60  }
845cf505cebd15 arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2008-01-09   61  EXPORT_SYMBOL(ucc_slow_stop_tx);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   62  
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   63  void ucc_slow_restart_tx(struct ucc_slow_private * uccs)
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   64  {
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   65  	struct ucc_slow_info *us_info = uccs->us_info;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   66  	u32 id;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   67  
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   68  	id = ucc_slow_get_qe_cr_subblock(us_info->ucc_num);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   69  	qe_issue_cmd(QE_RESTART_TX, id, QE_CR_PROTOCOL_UNSPECIFIED, 0);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   70  }
845cf505cebd15 arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2008-01-09   71  EXPORT_SYMBOL(ucc_slow_restart_tx);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   72  
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   73  void ucc_slow_enable(struct ucc_slow_private * uccs, enum comm_dir mode)
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   74  {
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   75  	struct ucc_slow *us_regs;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   76  	u32 gumr_l;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   77  
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   78  	us_regs = uccs->us_regs;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   79  
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   80  	/* Enable reception and/or transmission on this UCC. */
eb63c63b289d28 drivers/soc/fsl/qe/ucc_slow.c         Rasmus Villemoes 2019-11-01   81  	gumr_l = qe_ioread32be(&us_regs->gumr_l);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   82  	if (mode & COMM_DIR_TX) {
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   83  		gumr_l |= UCC_SLOW_GUMR_L_ENT;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   84  		uccs->enabled_tx = 1;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   85  	}
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   86  	if (mode & COMM_DIR_RX) {
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   87  		gumr_l |= UCC_SLOW_GUMR_L_ENR;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   88  		uccs->enabled_rx = 1;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   89  	}
eb63c63b289d28 drivers/soc/fsl/qe/ucc_slow.c         Rasmus Villemoes 2019-11-01   90  	qe_iowrite32be(gumr_l, &us_regs->gumr_l);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   91  }
845cf505cebd15 arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2008-01-09   92  EXPORT_SYMBOL(ucc_slow_enable);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   93  
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   94  void ucc_slow_disable(struct ucc_slow_private * uccs, enum comm_dir mode)
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   95  {
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   96  	struct ucc_slow *us_regs;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   97  	u32 gumr_l;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   98  
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03   99  	us_regs = uccs->us_regs;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  100  
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  101  	/* Disable reception and/or transmission on this UCC. */
eb63c63b289d28 drivers/soc/fsl/qe/ucc_slow.c         Rasmus Villemoes 2019-11-01  102  	gumr_l = qe_ioread32be(&us_regs->gumr_l);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  103  	if (mode & COMM_DIR_TX) {
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  104  		gumr_l &= ~UCC_SLOW_GUMR_L_ENT;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  105  		uccs->enabled_tx = 0;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  106  	}
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  107  	if (mode & COMM_DIR_RX) {
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  108  		gumr_l &= ~UCC_SLOW_GUMR_L_ENR;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  109  		uccs->enabled_rx = 0;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  110  	}
eb63c63b289d28 drivers/soc/fsl/qe/ucc_slow.c         Rasmus Villemoes 2019-11-01  111  	qe_iowrite32be(gumr_l, &us_regs->gumr_l);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  112  }
845cf505cebd15 arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2008-01-09  113  EXPORT_SYMBOL(ucc_slow_disable);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  114  
6b0b594bb81f86 arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-10-03  115  /* Initialize the UCC for Slow operations
6b0b594bb81f86 arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-10-03  116   *
6b0b594bb81f86 arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-10-03  117   * The caller should initialize the following us_info
6b0b594bb81f86 arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-10-03  118   */
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  119  int ucc_slow_init(struct ucc_slow_info * us_info, struct ucc_slow_private ** uccs_ret)
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  120  {
5af68af5bcd34e arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-02-16  121  	struct ucc_slow_private *uccs;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  122  	u32 i;
6b0b594bb81f86 arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-10-03  123  	struct ucc_slow __iomem *us_regs;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  124  	u32 gumr;
5af68af5bcd34e arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-02-16  125  	struct qe_bd *bd;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  126  	u32 id;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  127  	u32 command;
5af68af5bcd34e arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-02-16  128  	int ret = 0;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  129  
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  130  	if (!us_info)
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  131  		return -EINVAL;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  132  
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  133  	/* check if the UCC port number is in range. */
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  134  	if ((us_info->ucc_num < 0) || (us_info->ucc_num > UCC_MAX_NUM - 1)) {
e48b1b452ff630 arch/powerpc/sysdev/qe_lib/ucc_slow.c Harvey Harrison  2008-03-29  135  		printk(KERN_ERR "%s: illegal UCC number\n", __func__);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  136  		return -EINVAL;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  137  	}
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  138  
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  139  	/*
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  140  	 * Set mrblr
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  141  	 * Check that 'max_rx_buf_length' is properly aligned (4), unless
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  142  	 * rfw is 1, meaning that QE accepts one byte at a time, unlike normal
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  143  	 * case when QE accepts 32 bits at a time.
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  144  	 */
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  145  	if ((!us_info->rfw) &&
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  146  		(us_info->max_rx_buf_length & (UCC_SLOW_MRBLR_ALIGNMENT - 1))) {
6b0b594bb81f86 arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-10-03  147  		printk(KERN_ERR "max_rx_buf_length not aligned.\n");
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  148  		return -EINVAL;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  149  	}
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  150  
f8485350c22b25 arch/powerpc/sysdev/qe_lib/ucc_slow.c Yan Burman       2006-12-02  151  	uccs = kzalloc(sizeof(struct ucc_slow_private), GFP_KERNEL);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  152  	if (!uccs) {
6b0b594bb81f86 arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-10-03  153  		printk(KERN_ERR "%s: Cannot allocate private data\n",
e48b1b452ff630 arch/powerpc/sysdev/qe_lib/ucc_slow.c Harvey Harrison  2008-03-29  154  			__func__);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  155  		return -ENOMEM;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  156  	}
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  157  
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  158  	/* Fill slow UCC structure */
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  159  	uccs->us_info = us_info;
5af68af5bcd34e arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-02-16  160  	/* Set the PHY base address */
5af68af5bcd34e arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-02-16  161  	uccs->us_regs = ioremap(us_info->regs, sizeof(struct ucc_slow));
5af68af5bcd34e arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-02-16  162  	if (uccs->us_regs == NULL) {
e48b1b452ff630 arch/powerpc/sysdev/qe_lib/ucc_slow.c Harvey Harrison  2008-03-29  163  		printk(KERN_ERR "%s: Cannot map UCC registers\n", __func__);
61a4e9e91dd391 arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2008-08-20  164  		kfree(uccs);
5af68af5bcd34e arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-02-16  165  		return -ENOMEM;
5af68af5bcd34e arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-02-16  166  	}
5af68af5bcd34e arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-02-16  167  
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  168  	uccs->saved_uccm = 0;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  169  	uccs->p_rx_frame = 0;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  170  	us_regs = uccs->us_regs;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  171  	uccs->p_ucce = (u16 *) & (us_regs->ucce);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  172  	uccs->p_uccm = (u16 *) & (us_regs->uccm);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  173  #ifdef STATISTICS
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  174  	uccs->rx_frames = 0;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  175  	uccs->tx_frames = 0;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  176  	uccs->rx_discarded = 0;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  177  #endif				/* STATISTICS */
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  178  
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  179  	/* Get PRAM base */
5af68af5bcd34e arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-02-16  180  	uccs->us_pram_offset =
5af68af5bcd34e arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-02-16  181  		qe_muram_alloc(UCC_SLOW_PRAM_SIZE, ALIGNMENT_OF_UCC_SLOW_PRAM);
4c35630ccda56e arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-05-08 @182  	if (IS_ERR_VALUE(uccs->us_pram_offset)) {
e48b1b452ff630 arch/powerpc/sysdev/qe_lib/ucc_slow.c Harvey Harrison  2008-03-29  183  		printk(KERN_ERR "%s: cannot allocate MURAM for PRAM", __func__);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  184  		ucc_slow_free(uccs);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  185  		return -ENOMEM;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  186  	}
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  187  	id = ucc_slow_get_qe_cr_subblock(us_info->ucc_num);
6b0b594bb81f86 arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-10-03  188  	qe_issue_cmd(QE_ASSIGN_PAGE_TO_DEVICE, id, us_info->protocol,
5af68af5bcd34e arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-02-16  189  		     uccs->us_pram_offset);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  190  
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  191  	uccs->us_pram = qe_muram_addr(uccs->us_pram_offset);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  192  
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  193  	/* Set UCC to slow type */
6b0b594bb81f86 arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-10-03  194  	ret = ucc_set_type(us_info->ucc_num, UCC_SPEED_TYPE_SLOW);
6b0b594bb81f86 arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-10-03  195  	if (ret) {
e48b1b452ff630 arch/powerpc/sysdev/qe_lib/ucc_slow.c Harvey Harrison  2008-03-29  196  		printk(KERN_ERR "%s: cannot set UCC type", __func__);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  197  		ucc_slow_free(uccs);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  198  		return ret;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  199  	}
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  200  
eb63c63b289d28 drivers/soc/fsl/qe/ucc_slow.c         Rasmus Villemoes 2019-11-01  201  	qe_iowrite16be(us_info->max_rx_buf_length, &uccs->us_pram->mrblr);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  202  
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  203  	INIT_LIST_HEAD(&uccs->confQ);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  204  
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  205  	/* Allocate BDs. */
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  206  	uccs->rx_base_offset =
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  207  		qe_muram_alloc(us_info->rx_bd_ring_len * sizeof(struct qe_bd),
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  208  				QE_ALIGNMENT_OF_BD);
4c35630ccda56e arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-05-08  209  	if (IS_ERR_VALUE(uccs->rx_base_offset)) {
e48b1b452ff630 arch/powerpc/sysdev/qe_lib/ucc_slow.c Harvey Harrison  2008-03-29  210  		printk(KERN_ERR "%s: cannot allocate %u RX BDs\n", __func__,
6b0b594bb81f86 arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-10-03  211  			us_info->rx_bd_ring_len);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  212  		uccs->rx_base_offset = 0;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  213  		ucc_slow_free(uccs);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  214  		return -ENOMEM;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  215  	}
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  216  
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  217  	uccs->tx_base_offset =
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  218  		qe_muram_alloc(us_info->tx_bd_ring_len * sizeof(struct qe_bd),
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  219  			QE_ALIGNMENT_OF_BD);
4c35630ccda56e arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-05-08  220  	if (IS_ERR_VALUE(uccs->tx_base_offset)) {
e48b1b452ff630 arch/powerpc/sysdev/qe_lib/ucc_slow.c Harvey Harrison  2008-03-29  221  		printk(KERN_ERR "%s: cannot allocate TX BDs", __func__);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  222  		uccs->tx_base_offset = 0;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  223  		ucc_slow_free(uccs);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  224  		return -ENOMEM;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  225  	}
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  226  
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  227  	/* Init Tx bds */
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  228  	bd = uccs->confBd = uccs->tx_bd = qe_muram_addr(uccs->tx_base_offset);
5af68af5bcd34e arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-02-16  229  	for (i = 0; i < us_info->tx_bd_ring_len - 1; i++) {
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  230  		/* clear bd buffer */
eb63c63b289d28 drivers/soc/fsl/qe/ucc_slow.c         Rasmus Villemoes 2019-11-01  231  		qe_iowrite32be(0, &bd->buf);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  232  		/* set bd status and length */
eb63c63b289d28 drivers/soc/fsl/qe/ucc_slow.c         Rasmus Villemoes 2019-11-01  233  		qe_iowrite32be(0, (u32 *)bd);
5af68af5bcd34e arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-02-16  234  		bd++;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  235  	}
5af68af5bcd34e arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-02-16  236  	/* for last BD set Wrap bit */
eb63c63b289d28 drivers/soc/fsl/qe/ucc_slow.c         Rasmus Villemoes 2019-11-01  237  	qe_iowrite32be(0, &bd->buf);
eb63c63b289d28 drivers/soc/fsl/qe/ucc_slow.c         Rasmus Villemoes 2019-11-01  238  	qe_iowrite32be(cpu_to_be32(T_W), (u32 *)bd);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  239  
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  240  	/* Init Rx bds */
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  241  	bd = uccs->rx_bd = qe_muram_addr(uccs->rx_base_offset);
5af68af5bcd34e arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-02-16  242  	for (i = 0; i < us_info->rx_bd_ring_len - 1; i++) {
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  243  		/* set bd status and length */
eb63c63b289d28 drivers/soc/fsl/qe/ucc_slow.c         Rasmus Villemoes 2019-11-01  244  		qe_iowrite32be(0, (u32 *)bd);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  245  		/* clear bd buffer */
eb63c63b289d28 drivers/soc/fsl/qe/ucc_slow.c         Rasmus Villemoes 2019-11-01  246  		qe_iowrite32be(0, &bd->buf);
5af68af5bcd34e arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-02-16  247  		bd++;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  248  	}
5af68af5bcd34e arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-02-16  249  	/* for last BD set Wrap bit */
eb63c63b289d28 drivers/soc/fsl/qe/ucc_slow.c         Rasmus Villemoes 2019-11-01  250  	qe_iowrite32be(cpu_to_be32(R_W), (u32 *)bd);
eb63c63b289d28 drivers/soc/fsl/qe/ucc_slow.c         Rasmus Villemoes 2019-11-01  251  	qe_iowrite32be(0, &bd->buf);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  252  
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  253  	/* Set GUMR (For more details see the hardware spec.). */
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  254  	/* gumr_h */
5af68af5bcd34e arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-02-16  255  	gumr = us_info->tcrc;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  256  	if (us_info->cdp)
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  257  		gumr |= UCC_SLOW_GUMR_H_CDP;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  258  	if (us_info->ctsp)
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  259  		gumr |= UCC_SLOW_GUMR_H_CTSP;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  260  	if (us_info->cds)
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  261  		gumr |= UCC_SLOW_GUMR_H_CDS;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  262  	if (us_info->ctss)
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  263  		gumr |= UCC_SLOW_GUMR_H_CTSS;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  264  	if (us_info->tfl)
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  265  		gumr |= UCC_SLOW_GUMR_H_TFL;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  266  	if (us_info->rfw)
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  267  		gumr |= UCC_SLOW_GUMR_H_RFW;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  268  	if (us_info->txsy)
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  269  		gumr |= UCC_SLOW_GUMR_H_TXSY;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  270  	if (us_info->rtsm)
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  271  		gumr |= UCC_SLOW_GUMR_H_RTSM;
eb63c63b289d28 drivers/soc/fsl/qe/ucc_slow.c         Rasmus Villemoes 2019-11-01  272  	qe_iowrite32be(gumr, &us_regs->gumr_h);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  273  
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  274  	/* gumr_l */
5af68af5bcd34e arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-02-16  275  	gumr = us_info->tdcr | us_info->rdcr | us_info->tenc | us_info->renc |
5af68af5bcd34e arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-02-16  276  		us_info->diag | us_info->mode;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  277  	if (us_info->tci)
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  278  		gumr |= UCC_SLOW_GUMR_L_TCI;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  279  	if (us_info->rinv)
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  280  		gumr |= UCC_SLOW_GUMR_L_RINV;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  281  	if (us_info->tinv)
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  282  		gumr |= UCC_SLOW_GUMR_L_TINV;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  283  	if (us_info->tend)
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  284  		gumr |= UCC_SLOW_GUMR_L_TEND;
eb63c63b289d28 drivers/soc/fsl/qe/ucc_slow.c         Rasmus Villemoes 2019-11-01  285  	qe_iowrite32be(gumr, &us_regs->gumr_l);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  286  
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  287  	/* Function code registers */
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  288  
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  289  	/* if the data is in cachable memory, the 'global' */
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  290  	/* in the function code should be set. */
6b0b594bb81f86 arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-10-03  291  	uccs->us_pram->tbmr = UCC_BMR_BO_BE;
6b0b594bb81f86 arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-10-03  292  	uccs->us_pram->rbmr = UCC_BMR_BO_BE;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  293  
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  294  	/* rbase, tbase are offsets from MURAM base */
eb63c63b289d28 drivers/soc/fsl/qe/ucc_slow.c         Rasmus Villemoes 2019-11-01  295  	qe_iowrite16be(uccs->rx_base_offset, &uccs->us_pram->rbase);
eb63c63b289d28 drivers/soc/fsl/qe/ucc_slow.c         Rasmus Villemoes 2019-11-01  296  	qe_iowrite16be(uccs->tx_base_offset, &uccs->us_pram->tbase);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  297  
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  298  	/* Mux clocking */
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  299  	/* Grant Support */
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  300  	ucc_set_qe_mux_grant(us_info->ucc_num, us_info->grant_support);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  301  	/* Breakpoint Support */
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  302  	ucc_set_qe_mux_bkpt(us_info->ucc_num, us_info->brkpt_support);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  303  	/* Set Tsa or NMSI mode. */
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  304  	ucc_set_qe_mux_tsa(us_info->ucc_num, us_info->tsa);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  305  	/* If NMSI (not Tsa), set Tx and Rx clock. */
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  306  	if (!us_info->tsa) {
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  307  		/* Rx clock routing */
5af68af5bcd34e arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-02-16  308  		if (ucc_set_qe_mux_rxtx(us_info->ucc_num, us_info->rx_clock,
5af68af5bcd34e arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-02-16  309  					COMM_DIR_RX)) {
6b0b594bb81f86 arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-10-03  310  			printk(KERN_ERR "%s: illegal value for RX clock\n",
e48b1b452ff630 arch/powerpc/sysdev/qe_lib/ucc_slow.c Harvey Harrison  2008-03-29  311  			       __func__);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  312  			ucc_slow_free(uccs);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  313  			return -EINVAL;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  314  		}
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  315  		/* Tx clock routing */
5af68af5bcd34e arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-02-16  316  		if (ucc_set_qe_mux_rxtx(us_info->ucc_num, us_info->tx_clock,
5af68af5bcd34e arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-02-16  317  					COMM_DIR_TX)) {
6b0b594bb81f86 arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-10-03  318  			printk(KERN_ERR "%s: illegal value for TX clock\n",
e48b1b452ff630 arch/powerpc/sysdev/qe_lib/ucc_slow.c Harvey Harrison  2008-03-29  319  			       __func__);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  320  			ucc_slow_free(uccs);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  321  			return -EINVAL;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  322  		}
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  323  	}
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  324  
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  325  	/* Set interrupt mask register at UCC level. */
eb63c63b289d28 drivers/soc/fsl/qe/ucc_slow.c         Rasmus Villemoes 2019-11-01  326  	qe_iowrite16be(us_info->uccm_mask, &us_regs->uccm);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  327  
5af68af5bcd34e arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-02-16  328  	/* First, clear anything pending at UCC level,
5af68af5bcd34e arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-02-16  329  	 * otherwise, old garbage may come through
5af68af5bcd34e arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-02-16  330  	 * as soon as the dam is opened. */
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  331  
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  332  	/* Writing '1' clears */
eb63c63b289d28 drivers/soc/fsl/qe/ucc_slow.c         Rasmus Villemoes 2019-11-01  333  	qe_iowrite16be(0xffff, &us_regs->ucce);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  334  
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  335  	/* Issue QE Init command */
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  336  	if (us_info->init_tx && us_info->init_rx)
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  337  		command = QE_INIT_TX_RX;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  338  	else if (us_info->init_tx)
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  339  		command = QE_INIT_TX;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  340  	else
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  341  		command = QE_INIT_RX;	/* We know at least one is TRUE */
6b0b594bb81f86 arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-10-03  342  
6b0b594bb81f86 arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2007-10-03  343  	qe_issue_cmd(command, id, us_info->protocol, 0);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  344  
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  345  	*uccs_ret = uccs;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  346  	return 0;
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  347  }
845cf505cebd15 arch/powerpc/sysdev/qe_lib/ucc_slow.c Timur Tabi       2008-01-09  348  EXPORT_SYMBOL(ucc_slow_init);
9865853851313e arch/powerpc/sysdev/qe_lib/ucc_slow.c Li Yang          2006-10-03  349  

:::::: The code at line 182 was first introduced by commit
:::::: 4c35630ccda56ed494f6102d2e147fefe14b78d2 [POWERPC] Change rheap functions to use ulongs instead of pointers

:::::: TO: Timur Tabi <timur@freescale.com>
:::::: CC: Kumar Gala <galak@kernel.crashing.org>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--iyhfu7zrmyijcqfr
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
7yrusDJYhP8D4ndgT0dgAwA=

--iyhfu7zrmyijcqfr--
