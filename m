Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7425AF10B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Sep 2022 18:49:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMWZ82sypz3c4S
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 02:49:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eADxrDAG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Two or more type TXT spf records found.) smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eADxrDAG;
	dkim-atps=neutral
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMWYP06Tqz301m
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Sep 2022 02:48:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662482921; x=1694018921;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ckPhtAUaquOXLkJGREk0cVNbALj7k2Gs2kO1j4BCBi0=;
  b=eADxrDAGtMCeoAvprBEBuPnf/y9ReehLIo6KvWkiy1Nxdn8GIexir3cK
   i60bmvcgQez2CeCwRXwu0pulV3Cry334wr1P/6NgAbl0GxzRwFsggNwUQ
   C3KTzoNpTP3uj17VBxaQyCUmL+PjimOnDElqABskOsOQDnQeva88DWcef
   PK+uhdYftkouUpZePGfOSYYOAXWzDfTLPyNzyyV1QafxkJV2BdRH8/c7U
   b32n5av9HFs4n4mgG1UpEuOyVZwAaDDXfz8EEXMRaxOBQbsmDfOXcUuy6
   cI8oOwYR5C0RL/hVYBgWi+hdpAuqIwx/R3+yGdQLiM3FZJAMKVgmR8LzS
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10462"; a="276384418"
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; 
   d="scan'208";a="276384418"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2022 09:48:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; 
   d="scan'208";a="942530387"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 06 Sep 2022 09:48:34 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oVbkX-0005LW-2i;
	Tue, 06 Sep 2022 16:48:33 +0000
Date: Wed, 7 Sep 2022 00:47:45 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [powerpc:next-test 26/64] arch/powerpc/math-emu/math_efp.c:177:5:
 error: no previous prototype for 'do_spe_mathemu'
Message-ID: <202209070030.PX7JcwtO-lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="B6JoZz8cuqdu495G"
Content-Disposition: inline
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
Cc: Nathan Chancellor <nathan@kernel.org>, linuxppc-dev@lists.ozlabs.org, kbuild-all@lists.01.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--B6JoZz8cuqdu495G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
head:   7611de9cd7806a9c41426d12b98cf8867263a05f
commit: 7245fc5bb7a966852d5bd7779d1f5855530b461a [26/64] powerpc/math-emu: Remove -w build flag and fix warnings
config: powerpc-tqm8541_defconfig
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?id=7245fc5bb7a966852d5bd7779d1f5855530b461a
        git remote add powerpc https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
        git fetch --no-tags powerpc next-test
        git checkout 7245fc5bb7a966852d5bd7779d1f5855530b461a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash arch/powerpc/math-emu/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/powerpc/math-emu/fre.c:6:5: error: no previous prototype for 'fre' [-Werror=missing-prototypes]
       6 | int fre(void *frD, void *frB)
         |     ^~~
   cc1: all warnings being treated as errors
--
>> arch/powerpc/math-emu/fsqrt.c:11:1: error: no previous prototype for 'fsqrt' [-Werror=missing-prototypes]
      11 | fsqrt(void *frD, void *frB)
         | ^~~~~
   cc1: all warnings being treated as errors
--
>> arch/powerpc/math-emu/fsqrts.c:12:1: error: no previous prototype for 'fsqrts' [-Werror=missing-prototypes]
      12 | fsqrts(void *frD, void *frB)
         | ^~~~~~
   cc1: all warnings being treated as errors
--
>> arch/powerpc/math-emu/frsqrtes.c:6:5: error: no previous prototype for 'frsqrtes' [-Werror=missing-prototypes]
       6 | int frsqrtes(void *frD, void *frB)
         |     ^~~~~~~~
   cc1: all warnings being treated as errors
--
>> arch/powerpc/math-emu/mtfsf.c:10:1: error: no previous prototype for 'mtfsf' [-Werror=missing-prototypes]
      10 | mtfsf(unsigned int FM, u32 *frB)
         | ^~~~~
   cc1: all warnings being treated as errors
--
>> arch/powerpc/math-emu/mtfsfi.c:10:1: error: no previous prototype for 'mtfsfi' [-Werror=missing-prototypes]
      10 | mtfsfi(unsigned int crfD, unsigned int IMM)
         | ^~~~~~
   cc1: all warnings being treated as errors
--
>> arch/powerpc/math-emu/fabs.c:7:1: error: no previous prototype for 'fabs' [-Werror=missing-prototypes]
       7 | fabs(u32 *frD, u32 *frB)
         | ^~~~
   cc1: all warnings being treated as errors
--
>> arch/powerpc/math-emu/fadd.c:11:1: error: no previous prototype for 'fadd' [-Werror=missing-prototypes]
      11 | fadd(void *frD, void *frA, void *frB)
         | ^~~~
   cc1: all warnings being treated as errors
--
>> arch/powerpc/math-emu/fadds.c:12:1: error: no previous prototype for 'fadds' [-Werror=missing-prototypes]
      12 | fadds(void *frD, void *frA, void *frB)
         | ^~~~~
   cc1: all warnings being treated as errors
--
>> arch/powerpc/math-emu/fcmpo.c:11:1: error: no previous prototype for 'fcmpo' [-Werror=missing-prototypes]
      11 | fcmpo(u32 *ccr, int crfD, void *frA, void *frB)
         | ^~~~~
   cc1: all warnings being treated as errors
--
>> arch/powerpc/math-emu/fcmpu.c:11:1: error: no previous prototype for 'fcmpu' [-Werror=missing-prototypes]
      11 | fcmpu(u32 *ccr, int crfD, void *frA, void *frB)
         | ^~~~~
   In file included from include/math-emu/soft-fp.h:187,
                    from arch/powerpc/math-emu/fcmpu.c:7:
   arch/powerpc/math-emu/fcmpu.c: In function 'fcmpu':
>> arch/powerpc/math-emu/fcmpu.c:14:19: error: variable 'B_c' set but not used [-Werror=unused-but-set-variable]
      14 |         FP_DECL_D(B);
         |                   ^
   include/math-emu/op-common.h:28:14: note: in definition of macro '_FP_DECL'
      28 |   _FP_I_TYPE X##_c=0, X##_s=0, X##_e=0; \
         |              ^
   arch/powerpc/math-emu/fcmpu.c:14:9: note: in expansion of macro 'FP_DECL_D'
      14 |         FP_DECL_D(B);
         |         ^~~~~~~~~
>> arch/powerpc/math-emu/fcmpu.c:13:19: error: variable 'A_c' set but not used [-Werror=unused-but-set-variable]
      13 |         FP_DECL_D(A);
         |                   ^
   include/math-emu/op-common.h:28:14: note: in definition of macro '_FP_DECL'
      28 |   _FP_I_TYPE X##_c=0, X##_s=0, X##_e=0; \
         |              ^
   arch/powerpc/math-emu/fcmpu.c:13:9: note: in expansion of macro 'FP_DECL_D'
      13 |         FP_DECL_D(A);
         |         ^~~~~~~~~
   cc1: all warnings being treated as errors
..


vim +/do_spe_mathemu +177 arch/powerpc/math-emu/math_efp.c

6a800f36acd5bf Liu Yu           2008-10-28  176  
6a800f36acd5bf Liu Yu           2008-10-28 @177  int do_spe_mathemu(struct pt_regs *regs)
6a800f36acd5bf Liu Yu           2008-10-28  178  {
6a800f36acd5bf Liu Yu           2008-10-28  179  	FP_DECL_EX;
6a800f36acd5bf Liu Yu           2008-10-28  180  	int IR, cmp;
6a800f36acd5bf Liu Yu           2008-10-28  181  
6a800f36acd5bf Liu Yu           2008-10-28  182  	unsigned long type, func, fc, fa, fb, src, speinsn;
6a800f36acd5bf Liu Yu           2008-10-28  183  	union dw_union vc, va, vb;
6a800f36acd5bf Liu Yu           2008-10-28  184  
6a800f36acd5bf Liu Yu           2008-10-28  185  	if (get_user(speinsn, (unsigned int __user *) regs->nip))
6a800f36acd5bf Liu Yu           2008-10-28  186  		return -EFAULT;
6a800f36acd5bf Liu Yu           2008-10-28  187  	if ((speinsn >> 26) != EFAPU)
6a800f36acd5bf Liu Yu           2008-10-28  188  		return -EINVAL;         /* not an spe instruction */
6a800f36acd5bf Liu Yu           2008-10-28  189  
6a800f36acd5bf Liu Yu           2008-10-28  190  	type = insn_type(speinsn);
6a800f36acd5bf Liu Yu           2008-10-28  191  	if (type == NOTYPE)
09af52f78e58d9 Liu Yu           2011-09-05  192  		goto illegal;
6a800f36acd5bf Liu Yu           2008-10-28  193  
6a800f36acd5bf Liu Yu           2008-10-28  194  	func = speinsn & 0x7ff;
6a800f36acd5bf Liu Yu           2008-10-28  195  	fc = (speinsn >> 21) & 0x1f;
6a800f36acd5bf Liu Yu           2008-10-28  196  	fa = (speinsn >> 16) & 0x1f;
6a800f36acd5bf Liu Yu           2008-10-28  197  	fb = (speinsn >> 11) & 0x1f;
6a800f36acd5bf Liu Yu           2008-10-28  198  	src = (speinsn >> 5) & 0x7;
6a800f36acd5bf Liu Yu           2008-10-28  199  
6a800f36acd5bf Liu Yu           2008-10-28  200  	vc.wp[0] = current->thread.evr[fc];
6a800f36acd5bf Liu Yu           2008-10-28  201  	vc.wp[1] = regs->gpr[fc];
6a800f36acd5bf Liu Yu           2008-10-28  202  	va.wp[0] = current->thread.evr[fa];
6a800f36acd5bf Liu Yu           2008-10-28  203  	va.wp[1] = regs->gpr[fa];
6a800f36acd5bf Liu Yu           2008-10-28  204  	vb.wp[0] = current->thread.evr[fb];
6a800f36acd5bf Liu Yu           2008-10-28  205  	vb.wp[1] = regs->gpr[fb];
6a800f36acd5bf Liu Yu           2008-10-28  206  
6a800f36acd5bf Liu Yu           2008-10-28  207  	__FPU_FPSCR = mfspr(SPRN_SPEFSCR);
6a800f36acd5bf Liu Yu           2008-10-28  208  
b430abc4d10537 Liu Yu           2011-09-05  209  	pr_debug("speinsn:%08lx spefscr:%08lx\n", speinsn, __FPU_FPSCR);
b430abc4d10537 Liu Yu           2011-09-05  210  	pr_debug("vc: %08x  %08x\n", vc.wp[0], vc.wp[1]);
b430abc4d10537 Liu Yu           2011-09-05  211  	pr_debug("va: %08x  %08x\n", va.wp[0], va.wp[1]);
b430abc4d10537 Liu Yu           2011-09-05  212  	pr_debug("vb: %08x  %08x\n", vb.wp[0], vb.wp[1]);
6a800f36acd5bf Liu Yu           2008-10-28  213  
6a800f36acd5bf Liu Yu           2008-10-28  214  	switch (src) {
6a800f36acd5bf Liu Yu           2008-10-28  215  	case SPFP: {
6a800f36acd5bf Liu Yu           2008-10-28  216  		FP_DECL_S(SA); FP_DECL_S(SB); FP_DECL_S(SR);
6a800f36acd5bf Liu Yu           2008-10-28  217  
6a800f36acd5bf Liu Yu           2008-10-28  218  		switch (type) {
6a800f36acd5bf Liu Yu           2008-10-28  219  		case AB:
6a800f36acd5bf Liu Yu           2008-10-28  220  		case XCR:
6a800f36acd5bf Liu Yu           2008-10-28  221  			FP_UNPACK_SP(SA, va.wp + 1);
7245fc5bb7a966 Christophe Leroy 2022-09-02  222  			fallthrough;
6a800f36acd5bf Liu Yu           2008-10-28  223  		case XB:
6a800f36acd5bf Liu Yu           2008-10-28  224  			FP_UNPACK_SP(SB, vb.wp + 1);
6a800f36acd5bf Liu Yu           2008-10-28  225  			break;
6a800f36acd5bf Liu Yu           2008-10-28  226  		case XA:
6a800f36acd5bf Liu Yu           2008-10-28  227  			FP_UNPACK_SP(SA, va.wp + 1);
6a800f36acd5bf Liu Yu           2008-10-28  228  			break;
6a800f36acd5bf Liu Yu           2008-10-28  229  		}
6a800f36acd5bf Liu Yu           2008-10-28  230  
7245fc5bb7a966 Christophe Leroy 2022-09-02  231  		pr_debug("SA: %d %08x %d (%d)\n", SA_s, SA_f, SA_e, SA_c);
7245fc5bb7a966 Christophe Leroy 2022-09-02  232  		pr_debug("SB: %d %08x %d (%d)\n", SB_s, SB_f, SB_e, SB_c);
6a800f36acd5bf Liu Yu           2008-10-28  233  
6a800f36acd5bf Liu Yu           2008-10-28  234  		switch (func) {
6a800f36acd5bf Liu Yu           2008-10-28  235  		case EFSABS:
6a800f36acd5bf Liu Yu           2008-10-28  236  			vc.wp[1] = va.wp[1] & ~SIGN_BIT_S;
6a800f36acd5bf Liu Yu           2008-10-28  237  			goto update_regs;
6a800f36acd5bf Liu Yu           2008-10-28  238  
6a800f36acd5bf Liu Yu           2008-10-28  239  		case EFSNABS:
6a800f36acd5bf Liu Yu           2008-10-28  240  			vc.wp[1] = va.wp[1] | SIGN_BIT_S;
6a800f36acd5bf Liu Yu           2008-10-28  241  			goto update_regs;
6a800f36acd5bf Liu Yu           2008-10-28  242  
6a800f36acd5bf Liu Yu           2008-10-28  243  		case EFSNEG:
6a800f36acd5bf Liu Yu           2008-10-28  244  			vc.wp[1] = va.wp[1] ^ SIGN_BIT_S;
6a800f36acd5bf Liu Yu           2008-10-28  245  			goto update_regs;
6a800f36acd5bf Liu Yu           2008-10-28  246  
6a800f36acd5bf Liu Yu           2008-10-28  247  		case EFSADD:
6a800f36acd5bf Liu Yu           2008-10-28  248  			FP_ADD_S(SR, SA, SB);
6a800f36acd5bf Liu Yu           2008-10-28  249  			goto pack_s;
6a800f36acd5bf Liu Yu           2008-10-28  250  
6a800f36acd5bf Liu Yu           2008-10-28  251  		case EFSSUB:
6a800f36acd5bf Liu Yu           2008-10-28  252  			FP_SUB_S(SR, SA, SB);
6a800f36acd5bf Liu Yu           2008-10-28  253  			goto pack_s;
6a800f36acd5bf Liu Yu           2008-10-28  254  
6a800f36acd5bf Liu Yu           2008-10-28  255  		case EFSMUL:
6a800f36acd5bf Liu Yu           2008-10-28  256  			FP_MUL_S(SR, SA, SB);
6a800f36acd5bf Liu Yu           2008-10-28  257  			goto pack_s;
6a800f36acd5bf Liu Yu           2008-10-28  258  
6a800f36acd5bf Liu Yu           2008-10-28  259  		case EFSDIV:
6a800f36acd5bf Liu Yu           2008-10-28  260  			FP_DIV_S(SR, SA, SB);
6a800f36acd5bf Liu Yu           2008-10-28  261  			goto pack_s;
6a800f36acd5bf Liu Yu           2008-10-28  262  
6a800f36acd5bf Liu Yu           2008-10-28  263  		case EFSCMPEQ:
6a800f36acd5bf Liu Yu           2008-10-28  264  			cmp = 0;
6a800f36acd5bf Liu Yu           2008-10-28  265  			goto cmp_s;
6a800f36acd5bf Liu Yu           2008-10-28  266  
6a800f36acd5bf Liu Yu           2008-10-28  267  		case EFSCMPGT:
6a800f36acd5bf Liu Yu           2008-10-28  268  			cmp = 1;
6a800f36acd5bf Liu Yu           2008-10-28  269  			goto cmp_s;
6a800f36acd5bf Liu Yu           2008-10-28  270  
6a800f36acd5bf Liu Yu           2008-10-28  271  		case EFSCMPLT:
6a800f36acd5bf Liu Yu           2008-10-28  272  			cmp = -1;
6a800f36acd5bf Liu Yu           2008-10-28  273  			goto cmp_s;
6a800f36acd5bf Liu Yu           2008-10-28  274  
6a800f36acd5bf Liu Yu           2008-10-28  275  		case EFSCTSF:
6a800f36acd5bf Liu Yu           2008-10-28  276  		case EFSCTUF:
28fbf1d540920a Joseph Myers     2013-11-04  277  			if (SB_c == FP_CLS_NAN) {
28fbf1d540920a Joseph Myers     2013-11-04  278  				vc.wp[1] = 0;
28fbf1d540920a Joseph Myers     2013-11-04  279  				FP_SET_EXCEPTION(FP_EX_INVALID);
28fbf1d540920a Joseph Myers     2013-11-04  280  			} else {
28fbf1d540920a Joseph Myers     2013-11-04  281  				SB_e += (func == EFSCTSF ? 31 : 32);
28fbf1d540920a Joseph Myers     2013-11-04  282  				FP_TO_INT_ROUND_S(vc.wp[1], SB, 32,
7245fc5bb7a966 Christophe Leroy 2022-09-02  283  						(func == EFSCTSF) ? 1 : 0);
6a800f36acd5bf Liu Yu           2008-10-28  284  			}
6a800f36acd5bf Liu Yu           2008-10-28  285  			goto update_regs;
6a800f36acd5bf Liu Yu           2008-10-28  286  
6a800f36acd5bf Liu Yu           2008-10-28  287  		case EFSCFD: {
6a800f36acd5bf Liu Yu           2008-10-28  288  			FP_DECL_D(DB);
6a800f36acd5bf Liu Yu           2008-10-28  289  			FP_CLEAR_EXCEPTIONS;
6a800f36acd5bf Liu Yu           2008-10-28  290  			FP_UNPACK_DP(DB, vb.dp);
b430abc4d10537 Liu Yu           2011-09-05  291  
7245fc5bb7a966 Christophe Leroy 2022-09-02  292  			pr_debug("DB: %d %08x %08x %d (%d)\n",
6a800f36acd5bf Liu Yu           2008-10-28  293  					DB_s, DB_f1, DB_f0, DB_e, DB_c);
b430abc4d10537 Liu Yu           2011-09-05  294  
6a800f36acd5bf Liu Yu           2008-10-28  295  			FP_CONV(S, D, 1, 2, SR, DB);
6a800f36acd5bf Liu Yu           2008-10-28  296  			goto pack_s;
6a800f36acd5bf Liu Yu           2008-10-28  297  		}
6a800f36acd5bf Liu Yu           2008-10-28  298  
6a800f36acd5bf Liu Yu           2008-10-28  299  		case EFSCTSI:
6a800f36acd5bf Liu Yu           2008-10-28  300  		case EFSCTUI:
28fbf1d540920a Joseph Myers     2013-11-04  301  			if (SB_c == FP_CLS_NAN) {
28fbf1d540920a Joseph Myers     2013-11-04  302  				vc.wp[1] = 0;
28fbf1d540920a Joseph Myers     2013-11-04  303  				FP_SET_EXCEPTION(FP_EX_INVALID);
6a800f36acd5bf Liu Yu           2008-10-28  304  			} else {
28fbf1d540920a Joseph Myers     2013-11-04  305  				FP_TO_INT_ROUND_S(vc.wp[1], SB, 32,
7245fc5bb7a966 Christophe Leroy 2022-09-02  306  						((func & 0x3) != 0) ? 1 : 0);
6a800f36acd5bf Liu Yu           2008-10-28  307  			}
28fbf1d540920a Joseph Myers     2013-11-04  308  			goto update_regs;
28fbf1d540920a Joseph Myers     2013-11-04  309  
28fbf1d540920a Joseph Myers     2013-11-04  310  		case EFSCTSIZ:
28fbf1d540920a Joseph Myers     2013-11-04  311  		case EFSCTUIZ:
28fbf1d540920a Joseph Myers     2013-11-04  312  			if (SB_c == FP_CLS_NAN) {
28fbf1d540920a Joseph Myers     2013-11-04  313  				vc.wp[1] = 0;
28fbf1d540920a Joseph Myers     2013-11-04  314  				FP_SET_EXCEPTION(FP_EX_INVALID);
28fbf1d540920a Joseph Myers     2013-11-04  315  			} else {
afc0a07d4a2835 Shan Hai         2010-11-17  316  				FP_TO_INT_S(vc.wp[1], SB, 32,
7245fc5bb7a966 Christophe Leroy 2022-09-02  317  						((func & 0x3) != 0) ? 1 : 0);
28fbf1d540920a Joseph Myers     2013-11-04  318  			}
6a800f36acd5bf Liu Yu           2008-10-28  319  			goto update_regs;
6a800f36acd5bf Liu Yu           2008-10-28  320  
6a800f36acd5bf Liu Yu           2008-10-28  321  		default:
6a800f36acd5bf Liu Yu           2008-10-28  322  			goto illegal;
6a800f36acd5bf Liu Yu           2008-10-28  323  		}
6a800f36acd5bf Liu Yu           2008-10-28  324  		break;
6a800f36acd5bf Liu Yu           2008-10-28  325  
6a800f36acd5bf Liu Yu           2008-10-28  326  pack_s:
7245fc5bb7a966 Christophe Leroy 2022-09-02  327  		pr_debug("SR: %d %08x %d (%d)\n", SR_s, SR_f, SR_e, SR_c);
b430abc4d10537 Liu Yu           2011-09-05  328  
6a800f36acd5bf Liu Yu           2008-10-28  329  		FP_PACK_SP(vc.wp + 1, SR);
6a800f36acd5bf Liu Yu           2008-10-28  330  		goto update_regs;
6a800f36acd5bf Liu Yu           2008-10-28  331  
6a800f36acd5bf Liu Yu           2008-10-28  332  cmp_s:
6a800f36acd5bf Liu Yu           2008-10-28  333  		FP_CMP_S(IR, SA, SB, 3);
6a800f36acd5bf Liu Yu           2008-10-28  334  		if (IR == 3 && (FP_ISSIGNAN_S(SA) || FP_ISSIGNAN_S(SB)))
6a800f36acd5bf Liu Yu           2008-10-28  335  			FP_SET_EXCEPTION(FP_EX_INVALID);
6a800f36acd5bf Liu Yu           2008-10-28  336  		if (IR == cmp) {
6a800f36acd5bf Liu Yu           2008-10-28  337  			IR = 0x4;
6a800f36acd5bf Liu Yu           2008-10-28  338  		} else {
6a800f36acd5bf Liu Yu           2008-10-28  339  			IR = 0;
6a800f36acd5bf Liu Yu           2008-10-28  340  		}
6a800f36acd5bf Liu Yu           2008-10-28  341  		goto update_ccr;
6a800f36acd5bf Liu Yu           2008-10-28  342  	}
6a800f36acd5bf Liu Yu           2008-10-28  343  
6a800f36acd5bf Liu Yu           2008-10-28  344  	case DPFP: {
6a800f36acd5bf Liu Yu           2008-10-28  345  		FP_DECL_D(DA); FP_DECL_D(DB); FP_DECL_D(DR);
6a800f36acd5bf Liu Yu           2008-10-28  346  
6a800f36acd5bf Liu Yu           2008-10-28  347  		switch (type) {
6a800f36acd5bf Liu Yu           2008-10-28  348  		case AB:
6a800f36acd5bf Liu Yu           2008-10-28  349  		case XCR:
6a800f36acd5bf Liu Yu           2008-10-28  350  			FP_UNPACK_DP(DA, va.dp);
7245fc5bb7a966 Christophe Leroy 2022-09-02  351  			fallthrough;
6a800f36acd5bf Liu Yu           2008-10-28  352  		case XB:
6a800f36acd5bf Liu Yu           2008-10-28  353  			FP_UNPACK_DP(DB, vb.dp);
6a800f36acd5bf Liu Yu           2008-10-28  354  			break;
6a800f36acd5bf Liu Yu           2008-10-28  355  		case XA:
6a800f36acd5bf Liu Yu           2008-10-28  356  			FP_UNPACK_DP(DA, va.dp);
6a800f36acd5bf Liu Yu           2008-10-28  357  			break;
6a800f36acd5bf Liu Yu           2008-10-28  358  		}
6a800f36acd5bf Liu Yu           2008-10-28  359  
7245fc5bb7a966 Christophe Leroy 2022-09-02  360  		pr_debug("DA: %d %08x %08x %d (%d)\n",
6a800f36acd5bf Liu Yu           2008-10-28  361  				DA_s, DA_f1, DA_f0, DA_e, DA_c);
7245fc5bb7a966 Christophe Leroy 2022-09-02  362  		pr_debug("DB: %d %08x %08x %d (%d)\n",
6a800f36acd5bf Liu Yu           2008-10-28  363  				DB_s, DB_f1, DB_f0, DB_e, DB_c);
6a800f36acd5bf Liu Yu           2008-10-28  364  
6a800f36acd5bf Liu Yu           2008-10-28  365  		switch (func) {
6a800f36acd5bf Liu Yu           2008-10-28  366  		case EFDABS:
6a800f36acd5bf Liu Yu           2008-10-28  367  			vc.dp[0] = va.dp[0] & ~SIGN_BIT_D;
6a800f36acd5bf Liu Yu           2008-10-28  368  			goto update_regs;
6a800f36acd5bf Liu Yu           2008-10-28  369  
6a800f36acd5bf Liu Yu           2008-10-28  370  		case EFDNABS:
6a800f36acd5bf Liu Yu           2008-10-28  371  			vc.dp[0] = va.dp[0] | SIGN_BIT_D;
6a800f36acd5bf Liu Yu           2008-10-28  372  			goto update_regs;
6a800f36acd5bf Liu Yu           2008-10-28  373  
6a800f36acd5bf Liu Yu           2008-10-28  374  		case EFDNEG:
6a800f36acd5bf Liu Yu           2008-10-28  375  			vc.dp[0] = va.dp[0] ^ SIGN_BIT_D;
6a800f36acd5bf Liu Yu           2008-10-28  376  			goto update_regs;
6a800f36acd5bf Liu Yu           2008-10-28  377  
6a800f36acd5bf Liu Yu           2008-10-28  378  		case EFDADD:
6a800f36acd5bf Liu Yu           2008-10-28  379  			FP_ADD_D(DR, DA, DB);
6a800f36acd5bf Liu Yu           2008-10-28  380  			goto pack_d;
6a800f36acd5bf Liu Yu           2008-10-28  381  
6a800f36acd5bf Liu Yu           2008-10-28  382  		case EFDSUB:
6a800f36acd5bf Liu Yu           2008-10-28  383  			FP_SUB_D(DR, DA, DB);
6a800f36acd5bf Liu Yu           2008-10-28  384  			goto pack_d;
6a800f36acd5bf Liu Yu           2008-10-28  385  
6a800f36acd5bf Liu Yu           2008-10-28  386  		case EFDMUL:
6a800f36acd5bf Liu Yu           2008-10-28  387  			FP_MUL_D(DR, DA, DB);
6a800f36acd5bf Liu Yu           2008-10-28  388  			goto pack_d;
6a800f36acd5bf Liu Yu           2008-10-28  389  
6a800f36acd5bf Liu Yu           2008-10-28  390  		case EFDDIV:
6a800f36acd5bf Liu Yu           2008-10-28  391  			FP_DIV_D(DR, DA, DB);
6a800f36acd5bf Liu Yu           2008-10-28  392  			goto pack_d;
6a800f36acd5bf Liu Yu           2008-10-28  393  
6a800f36acd5bf Liu Yu           2008-10-28  394  		case EFDCMPEQ:
6a800f36acd5bf Liu Yu           2008-10-28  395  			cmp = 0;
6a800f36acd5bf Liu Yu           2008-10-28  396  			goto cmp_d;
6a800f36acd5bf Liu Yu           2008-10-28  397  
6a800f36acd5bf Liu Yu           2008-10-28  398  		case EFDCMPGT:
6a800f36acd5bf Liu Yu           2008-10-28  399  			cmp = 1;
6a800f36acd5bf Liu Yu           2008-10-28  400  			goto cmp_d;
6a800f36acd5bf Liu Yu           2008-10-28  401  
6a800f36acd5bf Liu Yu           2008-10-28  402  		case EFDCMPLT:
6a800f36acd5bf Liu Yu           2008-10-28  403  			cmp = -1;
6a800f36acd5bf Liu Yu           2008-10-28  404  			goto cmp_d;
6a800f36acd5bf Liu Yu           2008-10-28  405  
6a800f36acd5bf Liu Yu           2008-10-28  406  		case EFDCTSF:
6a800f36acd5bf Liu Yu           2008-10-28  407  		case EFDCTUF:
28fbf1d540920a Joseph Myers     2013-11-04  408  			if (DB_c == FP_CLS_NAN) {
28fbf1d540920a Joseph Myers     2013-11-04  409  				vc.wp[1] = 0;
28fbf1d540920a Joseph Myers     2013-11-04  410  				FP_SET_EXCEPTION(FP_EX_INVALID);
28fbf1d540920a Joseph Myers     2013-11-04  411  			} else {
28fbf1d540920a Joseph Myers     2013-11-04  412  				DB_e += (func == EFDCTSF ? 31 : 32);
28fbf1d540920a Joseph Myers     2013-11-04  413  				FP_TO_INT_ROUND_D(vc.wp[1], DB, 32,
7245fc5bb7a966 Christophe Leroy 2022-09-02  414  						(func == EFDCTSF) ? 1 : 0);
6a800f36acd5bf Liu Yu           2008-10-28  415  			}
6a800f36acd5bf Liu Yu           2008-10-28  416  			goto update_regs;
6a800f36acd5bf Liu Yu           2008-10-28  417  
6a800f36acd5bf Liu Yu           2008-10-28  418  		case EFDCFS: {
6a800f36acd5bf Liu Yu           2008-10-28  419  			FP_DECL_S(SB);
6a800f36acd5bf Liu Yu           2008-10-28  420  			FP_CLEAR_EXCEPTIONS;
6a800f36acd5bf Liu Yu           2008-10-28  421  			FP_UNPACK_SP(SB, vb.wp + 1);
b430abc4d10537 Liu Yu           2011-09-05  422  
7245fc5bb7a966 Christophe Leroy 2022-09-02  423  			pr_debug("SB: %d %08x %d (%d)\n",
6a800f36acd5bf Liu Yu           2008-10-28  424  					SB_s, SB_f, SB_e, SB_c);
b430abc4d10537 Liu Yu           2011-09-05  425  
6a800f36acd5bf Liu Yu           2008-10-28  426  			FP_CONV(D, S, 2, 1, DR, SB);
6a800f36acd5bf Liu Yu           2008-10-28  427  			goto pack_d;
6a800f36acd5bf Liu Yu           2008-10-28  428  		}
6a800f36acd5bf Liu Yu           2008-10-28  429  
6a800f36acd5bf Liu Yu           2008-10-28  430  		case EFDCTUIDZ:
6a800f36acd5bf Liu Yu           2008-10-28  431  		case EFDCTSIDZ:
28fbf1d540920a Joseph Myers     2013-11-04  432  			if (DB_c == FP_CLS_NAN) {
28fbf1d540920a Joseph Myers     2013-11-04  433  				vc.dp[0] = 0;
28fbf1d540920a Joseph Myers     2013-11-04  434  				FP_SET_EXCEPTION(FP_EX_INVALID);
28fbf1d540920a Joseph Myers     2013-11-04  435  			} else {
28fbf1d540920a Joseph Myers     2013-11-04  436  				FP_TO_INT_D(vc.dp[0], DB, 64,
7245fc5bb7a966 Christophe Leroy 2022-09-02  437  						((func & 0x1) == 0) ? 1 : 0);
28fbf1d540920a Joseph Myers     2013-11-04  438  			}
6a800f36acd5bf Liu Yu           2008-10-28  439  			goto update_regs;
6a800f36acd5bf Liu Yu           2008-10-28  440  
6a800f36acd5bf Liu Yu           2008-10-28  441  		case EFDCTUI:
6a800f36acd5bf Liu Yu           2008-10-28  442  		case EFDCTSI:
28fbf1d540920a Joseph Myers     2013-11-04  443  			if (DB_c == FP_CLS_NAN) {
28fbf1d540920a Joseph Myers     2013-11-04  444  				vc.wp[1] = 0;
28fbf1d540920a Joseph Myers     2013-11-04  445  				FP_SET_EXCEPTION(FP_EX_INVALID);
28fbf1d540920a Joseph Myers     2013-11-04  446  			} else {
28fbf1d540920a Joseph Myers     2013-11-04  447  				FP_TO_INT_ROUND_D(vc.wp[1], DB, 32,
7245fc5bb7a966 Christophe Leroy 2022-09-02  448  						((func & 0x3) != 0) ? 1 : 0);
28fbf1d540920a Joseph Myers     2013-11-04  449  			}
28fbf1d540920a Joseph Myers     2013-11-04  450  			goto update_regs;
28fbf1d540920a Joseph Myers     2013-11-04  451  
6a800f36acd5bf Liu Yu           2008-10-28  452  		case EFDCTUIZ:
6a800f36acd5bf Liu Yu           2008-10-28  453  		case EFDCTSIZ:
28fbf1d540920a Joseph Myers     2013-11-04  454  			if (DB_c == FP_CLS_NAN) {
28fbf1d540920a Joseph Myers     2013-11-04  455  				vc.wp[1] = 0;
28fbf1d540920a Joseph Myers     2013-11-04  456  				FP_SET_EXCEPTION(FP_EX_INVALID);
6a800f36acd5bf Liu Yu           2008-10-28  457  			} else {
afc0a07d4a2835 Shan Hai         2010-11-17  458  				FP_TO_INT_D(vc.wp[1], DB, 32,
7245fc5bb7a966 Christophe Leroy 2022-09-02  459  						((func & 0x3) != 0) ? 1 : 0);
28fbf1d540920a Joseph Myers     2013-11-04  460  			}
6a800f36acd5bf Liu Yu           2008-10-28  461  			goto update_regs;
6a800f36acd5bf Liu Yu           2008-10-28  462  
6a800f36acd5bf Liu Yu           2008-10-28  463  		default:
6a800f36acd5bf Liu Yu           2008-10-28  464  			goto illegal;
6a800f36acd5bf Liu Yu           2008-10-28  465  		}
6a800f36acd5bf Liu Yu           2008-10-28  466  		break;
6a800f36acd5bf Liu Yu           2008-10-28  467  
6a800f36acd5bf Liu Yu           2008-10-28  468  pack_d:
7245fc5bb7a966 Christophe Leroy 2022-09-02  469  		pr_debug("DR: %d %08x %08x %d (%d)\n",
6a800f36acd5bf Liu Yu           2008-10-28  470  				DR_s, DR_f1, DR_f0, DR_e, DR_c);
b430abc4d10537 Liu Yu           2011-09-05  471  
6a800f36acd5bf Liu Yu           2008-10-28  472  		FP_PACK_DP(vc.dp, DR);
6a800f36acd5bf Liu Yu           2008-10-28  473  		goto update_regs;
6a800f36acd5bf Liu Yu           2008-10-28  474  
6a800f36acd5bf Liu Yu           2008-10-28  475  cmp_d:
6a800f36acd5bf Liu Yu           2008-10-28  476  		FP_CMP_D(IR, DA, DB, 3);
6a800f36acd5bf Liu Yu           2008-10-28  477  		if (IR == 3 && (FP_ISSIGNAN_D(DA) || FP_ISSIGNAN_D(DB)))
6a800f36acd5bf Liu Yu           2008-10-28  478  			FP_SET_EXCEPTION(FP_EX_INVALID);
6a800f36acd5bf Liu Yu           2008-10-28  479  		if (IR == cmp) {
6a800f36acd5bf Liu Yu           2008-10-28  480  			IR = 0x4;
6a800f36acd5bf Liu Yu           2008-10-28  481  		} else {
6a800f36acd5bf Liu Yu           2008-10-28  482  			IR = 0;
6a800f36acd5bf Liu Yu           2008-10-28  483  		}
6a800f36acd5bf Liu Yu           2008-10-28  484  		goto update_ccr;
6a800f36acd5bf Liu Yu           2008-10-28  485  
6a800f36acd5bf Liu Yu           2008-10-28  486  	}
6a800f36acd5bf Liu Yu           2008-10-28  487  
6a800f36acd5bf Liu Yu           2008-10-28  488  	case VCT: {
6a800f36acd5bf Liu Yu           2008-10-28  489  		FP_DECL_S(SA0); FP_DECL_S(SB0); FP_DECL_S(SR0);
6a800f36acd5bf Liu Yu           2008-10-28  490  		FP_DECL_S(SA1); FP_DECL_S(SB1); FP_DECL_S(SR1);
6a800f36acd5bf Liu Yu           2008-10-28  491  		int IR0, IR1;
6a800f36acd5bf Liu Yu           2008-10-28  492  
6a800f36acd5bf Liu Yu           2008-10-28  493  		switch (type) {
6a800f36acd5bf Liu Yu           2008-10-28  494  		case AB:
6a800f36acd5bf Liu Yu           2008-10-28  495  		case XCR:
6a800f36acd5bf Liu Yu           2008-10-28  496  			FP_UNPACK_SP(SA0, va.wp);
6a800f36acd5bf Liu Yu           2008-10-28  497  			FP_UNPACK_SP(SA1, va.wp + 1);
7245fc5bb7a966 Christophe Leroy 2022-09-02  498  			fallthrough;
6a800f36acd5bf Liu Yu           2008-10-28  499  		case XB:
6a800f36acd5bf Liu Yu           2008-10-28  500  			FP_UNPACK_SP(SB0, vb.wp);
6a800f36acd5bf Liu Yu           2008-10-28  501  			FP_UNPACK_SP(SB1, vb.wp + 1);
6a800f36acd5bf Liu Yu           2008-10-28  502  			break;
6a800f36acd5bf Liu Yu           2008-10-28  503  		case XA:
6a800f36acd5bf Liu Yu           2008-10-28  504  			FP_UNPACK_SP(SA0, va.wp);
6a800f36acd5bf Liu Yu           2008-10-28  505  			FP_UNPACK_SP(SA1, va.wp + 1);
6a800f36acd5bf Liu Yu           2008-10-28  506  			break;
6a800f36acd5bf Liu Yu           2008-10-28  507  		}
6a800f36acd5bf Liu Yu           2008-10-28  508  
7245fc5bb7a966 Christophe Leroy 2022-09-02  509  		pr_debug("SA0: %d %08x %d (%d)\n",
b430abc4d10537 Liu Yu           2011-09-05  510  				SA0_s, SA0_f, SA0_e, SA0_c);
7245fc5bb7a966 Christophe Leroy 2022-09-02  511  		pr_debug("SA1: %d %08x %d (%d)\n",
b430abc4d10537 Liu Yu           2011-09-05  512  				SA1_s, SA1_f, SA1_e, SA1_c);
7245fc5bb7a966 Christophe Leroy 2022-09-02  513  		pr_debug("SB0: %d %08x %d (%d)\n",
b430abc4d10537 Liu Yu           2011-09-05  514  				SB0_s, SB0_f, SB0_e, SB0_c);
7245fc5bb7a966 Christophe Leroy 2022-09-02  515  		pr_debug("SB1: %d %08x %d (%d)\n",
b430abc4d10537 Liu Yu           2011-09-05  516  				SB1_s, SB1_f, SB1_e, SB1_c);
6a800f36acd5bf Liu Yu           2008-10-28  517  
6a800f36acd5bf Liu Yu           2008-10-28  518  		switch (func) {
6a800f36acd5bf Liu Yu           2008-10-28  519  		case EVFSABS:
6a800f36acd5bf Liu Yu           2008-10-28  520  			vc.wp[0] = va.wp[0] & ~SIGN_BIT_S;
6a800f36acd5bf Liu Yu           2008-10-28  521  			vc.wp[1] = va.wp[1] & ~SIGN_BIT_S;
6a800f36acd5bf Liu Yu           2008-10-28  522  			goto update_regs;
6a800f36acd5bf Liu Yu           2008-10-28  523  
6a800f36acd5bf Liu Yu           2008-10-28  524  		case EVFSNABS:
6a800f36acd5bf Liu Yu           2008-10-28  525  			vc.wp[0] = va.wp[0] | SIGN_BIT_S;
6a800f36acd5bf Liu Yu           2008-10-28  526  			vc.wp[1] = va.wp[1] | SIGN_BIT_S;
6a800f36acd5bf Liu Yu           2008-10-28  527  			goto update_regs;
6a800f36acd5bf Liu Yu           2008-10-28  528  
6a800f36acd5bf Liu Yu           2008-10-28  529  		case EVFSNEG:
6a800f36acd5bf Liu Yu           2008-10-28  530  			vc.wp[0] = va.wp[0] ^ SIGN_BIT_S;
6a800f36acd5bf Liu Yu           2008-10-28  531  			vc.wp[1] = va.wp[1] ^ SIGN_BIT_S;
6a800f36acd5bf Liu Yu           2008-10-28  532  			goto update_regs;
6a800f36acd5bf Liu Yu           2008-10-28  533  
6a800f36acd5bf Liu Yu           2008-10-28  534  		case EVFSADD:
6a800f36acd5bf Liu Yu           2008-10-28  535  			FP_ADD_S(SR0, SA0, SB0);
6a800f36acd5bf Liu Yu           2008-10-28  536  			FP_ADD_S(SR1, SA1, SB1);
6a800f36acd5bf Liu Yu           2008-10-28  537  			goto pack_vs;
6a800f36acd5bf Liu Yu           2008-10-28  538  
6a800f36acd5bf Liu Yu           2008-10-28  539  		case EVFSSUB:
6a800f36acd5bf Liu Yu           2008-10-28  540  			FP_SUB_S(SR0, SA0, SB0);
6a800f36acd5bf Liu Yu           2008-10-28  541  			FP_SUB_S(SR1, SA1, SB1);
6a800f36acd5bf Liu Yu           2008-10-28  542  			goto pack_vs;
6a800f36acd5bf Liu Yu           2008-10-28  543  
6a800f36acd5bf Liu Yu           2008-10-28  544  		case EVFSMUL:
6a800f36acd5bf Liu Yu           2008-10-28  545  			FP_MUL_S(SR0, SA0, SB0);
6a800f36acd5bf Liu Yu           2008-10-28  546  			FP_MUL_S(SR1, SA1, SB1);
6a800f36acd5bf Liu Yu           2008-10-28  547  			goto pack_vs;
6a800f36acd5bf Liu Yu           2008-10-28  548  
6a800f36acd5bf Liu Yu           2008-10-28  549  		case EVFSDIV:
6a800f36acd5bf Liu Yu           2008-10-28  550  			FP_DIV_S(SR0, SA0, SB0);
6a800f36acd5bf Liu Yu           2008-10-28  551  			FP_DIV_S(SR1, SA1, SB1);
6a800f36acd5bf Liu Yu           2008-10-28  552  			goto pack_vs;
6a800f36acd5bf Liu Yu           2008-10-28  553  
6a800f36acd5bf Liu Yu           2008-10-28  554  		case EVFSCMPEQ:
6a800f36acd5bf Liu Yu           2008-10-28  555  			cmp = 0;
6a800f36acd5bf Liu Yu           2008-10-28  556  			goto cmp_vs;
6a800f36acd5bf Liu Yu           2008-10-28  557  
6a800f36acd5bf Liu Yu           2008-10-28  558  		case EVFSCMPGT:
6a800f36acd5bf Liu Yu           2008-10-28  559  			cmp = 1;
6a800f36acd5bf Liu Yu           2008-10-28  560  			goto cmp_vs;
6a800f36acd5bf Liu Yu           2008-10-28  561  
6a800f36acd5bf Liu Yu           2008-10-28  562  		case EVFSCMPLT:
6a800f36acd5bf Liu Yu           2008-10-28  563  			cmp = -1;
6a800f36acd5bf Liu Yu           2008-10-28  564  			goto cmp_vs;
6a800f36acd5bf Liu Yu           2008-10-28  565  
6a800f36acd5bf Liu Yu           2008-10-28  566  		case EVFSCTUF:
28fbf1d540920a Joseph Myers     2013-11-04  567  		case EVFSCTSF:
28fbf1d540920a Joseph Myers     2013-11-04  568  			if (SB0_c == FP_CLS_NAN) {
28fbf1d540920a Joseph Myers     2013-11-04  569  				vc.wp[0] = 0;
28fbf1d540920a Joseph Myers     2013-11-04  570  				FP_SET_EXCEPTION(FP_EX_INVALID);
28fbf1d540920a Joseph Myers     2013-11-04  571  			} else {
28fbf1d540920a Joseph Myers     2013-11-04  572  				SB0_e += (func == EVFSCTSF ? 31 : 32);
28fbf1d540920a Joseph Myers     2013-11-04  573  				FP_TO_INT_ROUND_S(vc.wp[0], SB0, 32,
7245fc5bb7a966 Christophe Leroy 2022-09-02  574  						(func == EVFSCTSF) ? 1 : 0);
28fbf1d540920a Joseph Myers     2013-11-04  575  			}
28fbf1d540920a Joseph Myers     2013-11-04  576  			if (SB1_c == FP_CLS_NAN) {
28fbf1d540920a Joseph Myers     2013-11-04  577  				vc.wp[1] = 0;
28fbf1d540920a Joseph Myers     2013-11-04  578  				FP_SET_EXCEPTION(FP_EX_INVALID);
28fbf1d540920a Joseph Myers     2013-11-04  579  			} else {
28fbf1d540920a Joseph Myers     2013-11-04  580  				SB1_e += (func == EVFSCTSF ? 31 : 32);
28fbf1d540920a Joseph Myers     2013-11-04  581  				FP_TO_INT_ROUND_S(vc.wp[1], SB1, 32,
7245fc5bb7a966 Christophe Leroy 2022-09-02  582  						(func == EVFSCTSF) ? 1 : 0);
28fbf1d540920a Joseph Myers     2013-11-04  583  			}
6a800f36acd5bf Liu Yu           2008-10-28  584  			goto update_regs;
6a800f36acd5bf Liu Yu           2008-10-28  585  
6a800f36acd5bf Liu Yu           2008-10-28  586  		case EVFSCTUI:
6a800f36acd5bf Liu Yu           2008-10-28  587  		case EVFSCTSI:
28fbf1d540920a Joseph Myers     2013-11-04  588  			if (SB0_c == FP_CLS_NAN) {
28fbf1d540920a Joseph Myers     2013-11-04  589  				vc.wp[0] = 0;
28fbf1d540920a Joseph Myers     2013-11-04  590  				FP_SET_EXCEPTION(FP_EX_INVALID);
28fbf1d540920a Joseph Myers     2013-11-04  591  			} else {
28fbf1d540920a Joseph Myers     2013-11-04  592  				FP_TO_INT_ROUND_S(vc.wp[0], SB0, 32,
7245fc5bb7a966 Christophe Leroy 2022-09-02  593  						((func & 0x3) != 0) ? 1 : 0);
28fbf1d540920a Joseph Myers     2013-11-04  594  			}
28fbf1d540920a Joseph Myers     2013-11-04  595  			if (SB1_c == FP_CLS_NAN) {
28fbf1d540920a Joseph Myers     2013-11-04  596  				vc.wp[1] = 0;
28fbf1d540920a Joseph Myers     2013-11-04  597  				FP_SET_EXCEPTION(FP_EX_INVALID);
28fbf1d540920a Joseph Myers     2013-11-04  598  			} else {
28fbf1d540920a Joseph Myers     2013-11-04  599  				FP_TO_INT_ROUND_S(vc.wp[1], SB1, 32,
7245fc5bb7a966 Christophe Leroy 2022-09-02  600  						((func & 0x3) != 0) ? 1 : 0);
28fbf1d540920a Joseph Myers     2013-11-04  601  			}
28fbf1d540920a Joseph Myers     2013-11-04  602  			goto update_regs;
28fbf1d540920a Joseph Myers     2013-11-04  603  
6a800f36acd5bf Liu Yu           2008-10-28  604  		case EVFSCTUIZ:
6a800f36acd5bf Liu Yu           2008-10-28  605  		case EVFSCTSIZ:
28fbf1d540920a Joseph Myers     2013-11-04  606  			if (SB0_c == FP_CLS_NAN) {
28fbf1d540920a Joseph Myers     2013-11-04  607  				vc.wp[0] = 0;
28fbf1d540920a Joseph Myers     2013-11-04  608  				FP_SET_EXCEPTION(FP_EX_INVALID);
6a800f36acd5bf Liu Yu           2008-10-28  609  			} else {
afc0a07d4a2835 Shan Hai         2010-11-17  610  				FP_TO_INT_S(vc.wp[0], SB0, 32,
7245fc5bb7a966 Christophe Leroy 2022-09-02  611  						((func & 0x3) != 0) ? 1 : 0);
28fbf1d540920a Joseph Myers     2013-11-04  612  			}
28fbf1d540920a Joseph Myers     2013-11-04  613  			if (SB1_c == FP_CLS_NAN) {
28fbf1d540920a Joseph Myers     2013-11-04  614  				vc.wp[1] = 0;
28fbf1d540920a Joseph Myers     2013-11-04  615  				FP_SET_EXCEPTION(FP_EX_INVALID);
28fbf1d540920a Joseph Myers     2013-11-04  616  			} else {
afc0a07d4a2835 Shan Hai         2010-11-17  617  				FP_TO_INT_S(vc.wp[1], SB1, 32,
7245fc5bb7a966 Christophe Leroy 2022-09-02  618  						((func & 0x3) != 0) ? 1 : 0);
28fbf1d540920a Joseph Myers     2013-11-04  619  			}
6a800f36acd5bf Liu Yu           2008-10-28  620  			goto update_regs;
6a800f36acd5bf Liu Yu           2008-10-28  621  
6a800f36acd5bf Liu Yu           2008-10-28  622  		default:
6a800f36acd5bf Liu Yu           2008-10-28  623  			goto illegal;
6a800f36acd5bf Liu Yu           2008-10-28  624  		}
6a800f36acd5bf Liu Yu           2008-10-28  625  		break;
6a800f36acd5bf Liu Yu           2008-10-28  626  
6a800f36acd5bf Liu Yu           2008-10-28  627  pack_vs:
7245fc5bb7a966 Christophe Leroy 2022-09-02  628  		pr_debug("SR0: %d %08x %d (%d)\n",
b430abc4d10537 Liu Yu           2011-09-05  629  				SR0_s, SR0_f, SR0_e, SR0_c);
7245fc5bb7a966 Christophe Leroy 2022-09-02  630  		pr_debug("SR1: %d %08x %d (%d)\n",
b430abc4d10537 Liu Yu           2011-09-05  631  				SR1_s, SR1_f, SR1_e, SR1_c);
b430abc4d10537 Liu Yu           2011-09-05  632  
6a800f36acd5bf Liu Yu           2008-10-28  633  		FP_PACK_SP(vc.wp, SR0);
6a800f36acd5bf Liu Yu           2008-10-28  634  		FP_PACK_SP(vc.wp + 1, SR1);
6a800f36acd5bf Liu Yu           2008-10-28  635  		goto update_regs;
6a800f36acd5bf Liu Yu           2008-10-28  636  
6a800f36acd5bf Liu Yu           2008-10-28  637  cmp_vs:
6a800f36acd5bf Liu Yu           2008-10-28  638  		{
6a800f36acd5bf Liu Yu           2008-10-28  639  			int ch, cl;
6a800f36acd5bf Liu Yu           2008-10-28  640  
6a800f36acd5bf Liu Yu           2008-10-28  641  			FP_CMP_S(IR0, SA0, SB0, 3);
6a800f36acd5bf Liu Yu           2008-10-28  642  			FP_CMP_S(IR1, SA1, SB1, 3);
6a800f36acd5bf Liu Yu           2008-10-28  643  			if (IR0 == 3 && (FP_ISSIGNAN_S(SA0) || FP_ISSIGNAN_S(SB0)))
6a800f36acd5bf Liu Yu           2008-10-28  644  				FP_SET_EXCEPTION(FP_EX_INVALID);
6a800f36acd5bf Liu Yu           2008-10-28  645  			if (IR1 == 3 && (FP_ISSIGNAN_S(SA1) || FP_ISSIGNAN_S(SB1)))
6a800f36acd5bf Liu Yu           2008-10-28  646  				FP_SET_EXCEPTION(FP_EX_INVALID);
6a800f36acd5bf Liu Yu           2008-10-28  647  			ch = (IR0 == cmp) ? 1 : 0;
6a800f36acd5bf Liu Yu           2008-10-28  648  			cl = (IR1 == cmp) ? 1 : 0;
6a800f36acd5bf Liu Yu           2008-10-28  649  			IR = (ch << 3) | (cl << 2) | ((ch | cl) << 1) |
6a800f36acd5bf Liu Yu           2008-10-28  650  				((ch & cl) << 0);
6a800f36acd5bf Liu Yu           2008-10-28  651  			goto update_ccr;
6a800f36acd5bf Liu Yu           2008-10-28  652  		}
6a800f36acd5bf Liu Yu           2008-10-28  653  	}
6a800f36acd5bf Liu Yu           2008-10-28  654  	default:
6a800f36acd5bf Liu Yu           2008-10-28  655  		return -EINVAL;
6a800f36acd5bf Liu Yu           2008-10-28  656  	}
6a800f36acd5bf Liu Yu           2008-10-28  657  
6a800f36acd5bf Liu Yu           2008-10-28  658  update_ccr:
6a800f36acd5bf Liu Yu           2008-10-28  659  	regs->ccr &= ~(15 << ((7 - ((speinsn >> 23) & 0x7)) << 2));
6a800f36acd5bf Liu Yu           2008-10-28  660  	regs->ccr |= (IR << ((7 - ((speinsn >> 23) & 0x7)) << 2));
6a800f36acd5bf Liu Yu           2008-10-28  661  
6a800f36acd5bf Liu Yu           2008-10-28  662  update_regs:
640e922501103a Joseph Myers     2013-12-10  663  	/*
640e922501103a Joseph Myers     2013-12-10  664  	 * If the "invalid" exception sticky bit was set by the
640e922501103a Joseph Myers     2013-12-10  665  	 * processor for non-finite input, but was not set before the
640e922501103a Joseph Myers     2013-12-10  666  	 * instruction being emulated, clear it.  Likewise for the
640e922501103a Joseph Myers     2013-12-10  667  	 * "underflow" bit, which may have been set by the processor
640e922501103a Joseph Myers     2013-12-10  668  	 * for exact underflow, not just inexact underflow when the
640e922501103a Joseph Myers     2013-12-10  669  	 * flag should be set for IEEE 754 semantics.  Other sticky
640e922501103a Joseph Myers     2013-12-10  670  	 * exceptions will only be set by the processor when they are
640e922501103a Joseph Myers     2013-12-10  671  	 * correct according to IEEE 754 semantics, and we must not
640e922501103a Joseph Myers     2013-12-10  672  	 * clear sticky bits that were already set before the emulated
640e922501103a Joseph Myers     2013-12-10  673  	 * instruction as they represent the user-visible sticky
640e922501103a Joseph Myers     2013-12-10  674  	 * exception status.  "inexact" traps to kernel are not
640e922501103a Joseph Myers     2013-12-10  675  	 * required for IEEE semantics and are not enabled by default,
640e922501103a Joseph Myers     2013-12-10  676  	 * so the "inexact" sticky bit may have been set by a previous
640e922501103a Joseph Myers     2013-12-10  677  	 * instruction without the kernel being aware of it.
640e922501103a Joseph Myers     2013-12-10  678  	 */
640e922501103a Joseph Myers     2013-12-10  679  	__FPU_FPSCR
640e922501103a Joseph Myers     2013-12-10  680  	  &= ~(FP_EX_INVALID | FP_EX_UNDERFLOW) | current->thread.spefscr_last;
6a800f36acd5bf Liu Yu           2008-10-28  681  	__FPU_FPSCR |= (FP_CUR_EXCEPTIONS & FP_EX_MASK);
6a800f36acd5bf Liu Yu           2008-10-28  682  	mtspr(SPRN_SPEFSCR, __FPU_FPSCR);
640e922501103a Joseph Myers     2013-12-10  683  	current->thread.spefscr_last = __FPU_FPSCR;
6a800f36acd5bf Liu Yu           2008-10-28  684  
6a800f36acd5bf Liu Yu           2008-10-28  685  	current->thread.evr[fc] = vc.wp[0];
6a800f36acd5bf Liu Yu           2008-10-28  686  	regs->gpr[fc] = vc.wp[1];
6a800f36acd5bf Liu Yu           2008-10-28  687  
b430abc4d10537 Liu Yu           2011-09-05  688  	pr_debug("ccr = %08lx\n", regs->ccr);
b430abc4d10537 Liu Yu           2011-09-05  689  	pr_debug("cur exceptions = %08x spefscr = %08lx\n",
6a800f36acd5bf Liu Yu           2008-10-28  690  			FP_CUR_EXCEPTIONS, __FPU_FPSCR);
b430abc4d10537 Liu Yu           2011-09-05  691  	pr_debug("vc: %08x  %08x\n", vc.wp[0], vc.wp[1]);
b430abc4d10537 Liu Yu           2011-09-05  692  	pr_debug("va: %08x  %08x\n", va.wp[0], va.wp[1]);
b430abc4d10537 Liu Yu           2011-09-05  693  	pr_debug("vb: %08x  %08x\n", vb.wp[0], vb.wp[1]);
6a800f36acd5bf Liu Yu           2008-10-28  694  
01c9ccee3c3051 Joseph Myers     2013-11-04  695  	if (current->thread.fpexc_mode & PR_FP_EXC_SW_ENABLE) {
01c9ccee3c3051 Joseph Myers     2013-11-04  696  		if ((FP_CUR_EXCEPTIONS & FP_EX_DIVZERO)
01c9ccee3c3051 Joseph Myers     2013-11-04  697  		    && (current->thread.fpexc_mode & PR_FP_EXC_DIV))
01c9ccee3c3051 Joseph Myers     2013-11-04  698  			return 1;
01c9ccee3c3051 Joseph Myers     2013-11-04  699  		if ((FP_CUR_EXCEPTIONS & FP_EX_OVERFLOW)
01c9ccee3c3051 Joseph Myers     2013-11-04  700  		    && (current->thread.fpexc_mode & PR_FP_EXC_OVF))
01c9ccee3c3051 Joseph Myers     2013-11-04  701  			return 1;
01c9ccee3c3051 Joseph Myers     2013-11-04  702  		if ((FP_CUR_EXCEPTIONS & FP_EX_UNDERFLOW)
01c9ccee3c3051 Joseph Myers     2013-11-04  703  		    && (current->thread.fpexc_mode & PR_FP_EXC_UND))
01c9ccee3c3051 Joseph Myers     2013-11-04  704  			return 1;
01c9ccee3c3051 Joseph Myers     2013-11-04  705  		if ((FP_CUR_EXCEPTIONS & FP_EX_INEXACT)
01c9ccee3c3051 Joseph Myers     2013-11-04  706  		    && (current->thread.fpexc_mode & PR_FP_EXC_RES))
01c9ccee3c3051 Joseph Myers     2013-11-04  707  			return 1;
01c9ccee3c3051 Joseph Myers     2013-11-04  708  		if ((FP_CUR_EXCEPTIONS & FP_EX_INVALID)
01c9ccee3c3051 Joseph Myers     2013-11-04  709  		    && (current->thread.fpexc_mode & PR_FP_EXC_INV))
01c9ccee3c3051 Joseph Myers     2013-11-04  710  			return 1;
01c9ccee3c3051 Joseph Myers     2013-11-04  711  	}
6a800f36acd5bf Liu Yu           2008-10-28  712  	return 0;
6a800f36acd5bf Liu Yu           2008-10-28  713  
6a800f36acd5bf Liu Yu           2008-10-28  714  illegal:
ac6f120369ffe6 Liu Yu           2011-01-25  715  	if (have_e500_cpu_a005_erratum) {
ac6f120369ffe6 Liu Yu           2011-01-25  716  		/* according to e500 cpu a005 erratum, reissue efp inst */
59dc5bfca0cb6a Nicholas Piggin  2021-06-18  717  		regs_add_return_ip(regs, -4);
b430abc4d10537 Liu Yu           2011-09-05  718  		pr_debug("re-issue efp inst: %08lx\n", speinsn);
ac6f120369ffe6 Liu Yu           2011-01-25  719  		return 0;
ac6f120369ffe6 Liu Yu           2011-01-25  720  	}
ac6f120369ffe6 Liu Yu           2011-01-25  721  
6a800f36acd5bf Liu Yu           2008-10-28  722  	printk(KERN_ERR "\nOoops! IEEE-754 compliance handler encountered un-supported instruction.\ninst code: %08lx\n", speinsn);
6a800f36acd5bf Liu Yu           2008-10-28  723  	return -ENOSYS;
6a800f36acd5bf Liu Yu           2008-10-28  724  }
6a800f36acd5bf Liu Yu           2008-10-28  725  

:::::: The code at line 177 was first introduced by commit
:::::: 6a800f36acd5bf06b5fe2cb27c4d0524d60c3df5 powerpc: Add SPE/EFP math emulation for E500v1/v2 processors.

:::::: TO: Liu Yu <yu.liu@freescale.com>
:::::: CC: Kumar Gala <galak@kernel.crashing.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

--B6JoZz8cuqdu495G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=config

#
# Automatically generated file; DO NOT EDIT.
# Linux/powerpc 6.0.0-rc2 Kernel Configuration
#
CONFIG_CC_VERSION_TEXT="powerpc-linux-gcc (GCC) 12.1.0"
CONFIG_CC_IS_GCC=y
CONFIG_GCC_VERSION=120100
CONFIG_CLANG_VERSION=0
CONFIG_AS_IS_GNU=y
CONFIG_AS_VERSION=23800
CONFIG_LD_IS_BFD=y
CONFIG_LD_VERSION=23800
CONFIG_LLD_VERSION=0
CONFIG_CC_HAS_ASM_GOTO_OUTPUT=y
CONFIG_CC_HAS_ASM_INLINE=y
CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=y
CONFIG_PAHOLE_VERSION=123
CONFIG_IRQ_WORK=y
CONFIG_BUILDTIME_TABLE_SORT=y
CONFIG_THREAD_INFO_IN_TASK=y

#
# General setup
#
CONFIG_BROKEN_ON_SMP=y
CONFIG_INIT_ENV_ARG_LIMIT=32
# CONFIG_COMPILE_TEST is not set
# CONFIG_WERROR is not set
CONFIG_LOCALVERSION=""
CONFIG_LOCALVERSION_AUTO=y
CONFIG_BUILD_SALT=""
CONFIG_HAVE_KERNEL_GZIP=y
CONFIG_HAVE_KERNEL_LZMA=y
CONFIG_HAVE_KERNEL_LZO=y
CONFIG_KERNEL_GZIP=y
# CONFIG_KERNEL_LZMA is not set
# CONFIG_KERNEL_LZO is not set
CONFIG_DEFAULT_INIT=""
CONFIG_DEFAULT_HOSTNAME="(none)"
CONFIG_SYSVIPC=y
CONFIG_SYSVIPC_SYSCTL=y
# CONFIG_POSIX_MQUEUE is not set
# CONFIG_WATCH_QUEUE is not set
CONFIG_CROSS_MEMORY_ATTACH=y
# CONFIG_USELIB is not set
# CONFIG_AUDIT is not set
CONFIG_HAVE_ARCH_AUDITSYSCALL=y

#
# IRQ subsystem
#
CONFIG_GENERIC_IRQ_SHOW=y
CONFIG_GENERIC_IRQ_SHOW_LEVEL=y
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_FORCED_THREADING=y
CONFIG_SPARSE_IRQ=y
# end of IRQ subsystem

CONFIG_GENERIC_TIME_VSYSCALL=y
CONFIG_GENERIC_CLOCKEVENTS=y
CONFIG_GENERIC_CMOS_UPDATE=y

#
# Timers subsystem
#
CONFIG_HZ_PERIODIC=y
# CONFIG_NO_HZ_IDLE is not set
# CONFIG_NO_HZ is not set
# CONFIG_HIGH_RES_TIMERS is not set
# end of Timers subsystem

CONFIG_BPF=y
CONFIG_HAVE_EBPF_JIT=y

#
# BPF subsystem
#
# CONFIG_BPF_SYSCALL is not set
# end of BPF subsystem

CONFIG_PREEMPT_NONE_BUILD=y
CONFIG_PREEMPT_NONE=y
# CONFIG_PREEMPT_VOLUNTARY is not set
# CONFIG_PREEMPT is not set

#
# CPU/Task time and stats accounting
#
CONFIG_TICK_CPU_ACCOUNTING=y
# CONFIG_VIRT_CPU_ACCOUNTING_NATIVE is not set
# CONFIG_IRQ_TIME_ACCOUNTING is not set
# CONFIG_BSD_PROCESS_ACCT is not set
# CONFIG_TASKSTATS is not set
# CONFIG_PSI is not set
# end of CPU/Task time and stats accounting

#
# RCU Subsystem
#
CONFIG_TINY_RCU=y
# CONFIG_RCU_EXPERT is not set
CONFIG_SRCU=y
CONFIG_TINY_SRCU=y
# end of RCU Subsystem

# CONFIG_IKCONFIG is not set
# CONFIG_IKHEADERS is not set
CONFIG_LOG_BUF_SHIFT=14
CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=13

#
# Scheduler features
#
# end of Scheduler features

CONFIG_CC_IMPLICIT_FALLTHROUGH="-Wimplicit-fallthrough=5"
CONFIG_GCC12_NO_ARRAY_BOUNDS=y
CONFIG_CC_NO_ARRAY_BOUNDS=y
# CONFIG_CGROUPS is not set
# CONFIG_NAMESPACES is not set
# CONFIG_CHECKPOINT_RESTORE is not set
# CONFIG_SCHED_AUTOGROUP is not set
# CONFIG_SYSFS_DEPRECATED is not set
# CONFIG_RELAY is not set
CONFIG_BLK_DEV_INITRD=y
CONFIG_INITRAMFS_SOURCE=""
CONFIG_RD_GZIP=y
CONFIG_RD_BZIP2=y
CONFIG_RD_LZMA=y
CONFIG_RD_XZ=y
CONFIG_RD_LZO=y
CONFIG_RD_LZ4=y
CONFIG_RD_ZSTD=y
# CONFIG_BOOT_CONFIG is not set
CONFIG_INITRAMFS_PRESERVE_MTIME=y
CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=y
# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
CONFIG_HAVE_LD_DEAD_CODE_DATA_ELIMINATION=y
# CONFIG_LD_DEAD_CODE_DATA_ELIMINATION is not set
CONFIG_LD_ORPHAN_WARN=y
CONFIG_SYSCTL=y
CONFIG_SYSCTL_EXCEPTION_TRACE=y
CONFIG_EXPERT=y
CONFIG_MULTIUSER=y
CONFIG_SGETMASK_SYSCALL=y
CONFIG_SYSFS_SYSCALL=y
CONFIG_FHANDLE=y
CONFIG_POSIX_TIMERS=y
CONFIG_PRINTK=y
CONFIG_BUG=y
CONFIG_ELF_CORE=y
CONFIG_BASE_FULL=y
CONFIG_FUTEX=y
CONFIG_FUTEX_PI=y
# CONFIG_EPOLL is not set
CONFIG_SIGNALFD=y
CONFIG_TIMERFD=y
CONFIG_EVENTFD=y
CONFIG_SHMEM=y
CONFIG_AIO=y
CONFIG_IO_URING=y
CONFIG_ADVISE_SYSCALLS=y
CONFIG_MEMBARRIER=y
# CONFIG_KALLSYMS is not set
CONFIG_ARCH_HAS_MEMBARRIER_CALLBACKS=y
CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=y
# CONFIG_KCMP is not set
CONFIG_RSEQ=y
# CONFIG_DEBUG_RSEQ is not set
# CONFIG_EMBEDDED is not set
CONFIG_HAVE_PERF_EVENTS=y
# CONFIG_PC104 is not set

#
# Kernel Performance Events And Counters
#
# CONFIG_PERF_EVENTS is not set
# end of Kernel Performance Events And Counters

# CONFIG_PROFILING is not set
# end of General setup

CONFIG_PPC32=y
# CONFIG_PPC64 is not set

#
# Processor support
#
# CONFIG_PPC_BOOK3S_32 is not set
CONFIG_PPC_85xx=y
# CONFIG_PPC_8xx is not set
# CONFIG_40x is not set
# CONFIG_44x is not set
CONFIG_E500_CPU=y
# CONFIG_TOOLCHAIN_DEFAULT_CPU is not set
CONFIG_TARGET_CPU_BOOL=y
CONFIG_TARGET_CPU="8540"
CONFIG_E500=y
# CONFIG_PPC_E500MC is not set
CONFIG_PPC_FPU_REGS=y
CONFIG_FSL_EMB_PERFMON=y
CONFIG_BOOKE=y
CONFIG_BOOKE_OR_40x=y
CONFIG_FSL_BOOKE=y
CONFIG_PPC_FSL_BOOK3E=y
# CONFIG_PHYS_64BIT is not set
CONFIG_SPE_POSSIBLE=y
CONFIG_SPE=y
CONFIG_PPC_KUEP=y
CONFIG_PPC_KUAP=y
# CONFIG_PPC_KUAP_DEBUG is not set
CONFIG_PPC_MMU_NOHASH=y
CONFIG_PPC_BOOK3E_MMU=y
# CONFIG_PMU_SYSFS is not set
# CONFIG_SMP is not set
CONFIG_NR_CPUS=1
CONFIG_PPC_DOORBELL=y
# end of Processor support

CONFIG_VDSO32=y
CONFIG_CPU_BIG_ENDIAN=y
CONFIG_32BIT=y
CONFIG_MMU=y
CONFIG_ARCH_MMAP_RND_BITS_MAX=17
CONFIG_ARCH_MMAP_RND_BITS_MIN=11
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=17
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=11
CONFIG_NR_IRQS=512
CONFIG_STACKTRACE_SUPPORT=y
CONFIG_LOCKDEP_SUPPORT=y
CONFIG_GENERIC_HWEIGHT=y
CONFIG_PPC=y
CONFIG_PPC_BARRIER_NOSPEC=y
CONFIG_EARLY_PRINTK=y
CONFIG_PANIC_TIMEOUT=180
CONFIG_SCHED_OMIT_FRAME_POINTER=y
CONFIG_ARCH_MAY_HAVE_PC_FDC=y
CONFIG_PPC_UDBG_16550=y
CONFIG_AUDIT_ARCH=y
CONFIG_GENERIC_BUG=y
CONFIG_GENERIC_BUG_RELATIVE_POINTERS=y
CONFIG_DEFAULT_UIMAGE=y
CONFIG_ARCH_HIBERNATION_POSSIBLE=y
CONFIG_ARCH_SUSPEND_POSSIBLE=y
CONFIG_ARCH_HAS_ADD_PAGES=y
# CONFIG_PPC_PCI_BUS_NUM_DOMAIN_DEPENDENT is not set
CONFIG_ARCH_SUPPORTS_UPROBES=y
CONFIG_PPC_ADV_DEBUG_REGS=y
CONFIG_PPC_ADV_DEBUG_IACS=2
CONFIG_PPC_ADV_DEBUG_DACS=2
CONFIG_PPC_ADV_DEBUG_DVCS=0
CONFIG_PGTABLE_LEVELS=2

#
# Platform support
#
CONFIG_FSL_SOC_BOOKE=y
# CONFIG_BSC9131_RDB is not set
# CONFIG_C293_PCIE is not set
# CONFIG_BSC9132_QDS is not set
# CONFIG_MPC8540_ADS is not set
# CONFIG_MPC8560_ADS is not set
# CONFIG_MPC85xx_CDS is not set
# CONFIG_MPC85xx_MDS is not set
# CONFIG_MPC8536_DS is not set
# CONFIG_MPC85xx_DS is not set
# CONFIG_MPC85xx_RDB is not set
# CONFIG_P1010_RDB is not set
# CONFIG_P1022_DS is not set
# CONFIG_P1022_RDK is not set
# CONFIG_P1023_RDB is not set
# CONFIG_TWR_P102x is not set
# CONFIG_SOCRATES is not set
# CONFIG_KSI8560 is not set
# CONFIG_XES_MPC85xx is not set
# CONFIG_STX_GP3 is not set
# CONFIG_TQM8540 is not set
CONFIG_TQM8541=y
# CONFIG_TQM8548 is not set
# CONFIG_TQM8555 is not set
# CONFIG_TQM8560 is not set
# CONFIG_PPA8548 is not set
# CONFIG_GE_IMP3A is not set
# CONFIG_MVME2500 is not set
# CONFIG_PPC_QEMU_E500 is not set
# CONFIG_CORENET_GENERIC is not set
CONFIG_TQM85xx=y
# CONFIG_KVM_GUEST is not set
# CONFIG_EPAPR_PARAVIRT is not set
CONFIG_PPC_SMP_MUXED_IPI=y
CONFIG_MPIC=y
# CONFIG_MPIC_TIMER is not set
# CONFIG_MPIC_MSGR is not set

#
# CPU Frequency scaling
#
# CONFIG_CPU_FREQ is not set
# end of CPU Frequency scaling

#
# CPUIdle driver
#

#
# CPU Idle
#
# CONFIG_CPU_IDLE is not set
# end of CPU Idle
# end of CPUIdle driver

CONFIG_CPM2=y
CONFIG_CPM=y
CONFIG_GEN_RTC=y
# end of Platform support

#
# Kernel options
#
# CONFIG_HIGHMEM is not set
# CONFIG_HZ_100 is not set
CONFIG_HZ_250=y
# CONFIG_HZ_300 is not set
# CONFIG_HZ_1000 is not set
CONFIG_HZ=250
CONFIG_MATH_EMULATION=y
CONFIG_MATH_EMULATION_FULL=y
# CONFIG_MATH_EMULATION_HW_UNIMPLEMENTED is not set
# CONFIG_KEXEC is not set
# CONFIG_RELOCATABLE is not set
# CONFIG_CRASH_DUMP is not set
CONFIG_ARCH_FLATMEM_ENABLE=y
CONFIG_ILLEGAL_POINTER_VALUE=0
CONFIG_PPC_4K_PAGES=y
CONFIG_PAGE_SIZE_4KB=y
CONFIG_PPC_PAGE_SHIFT=12
CONFIG_THREAD_SHIFT=13
CONFIG_DATA_SHIFT=24
CONFIG_FORCE_MAX_ZONEORDER=11
CONFIG_CMDLINE=""
CONFIG_EXTRA_TARGETS=""
CONFIG_SUSPEND=y
CONFIG_SUSPEND_FREEZER=y
# CONFIG_SUSPEND_SKIP_SYNC is not set
# CONFIG_HIBERNATION is not set
CONFIG_PM_SLEEP=y
# CONFIG_PM_AUTOSLEEP is not set
# CONFIG_PM_USERSPACE_AUTOSLEEP is not set
# CONFIG_PM_WAKELOCKS is not set
CONFIG_PM=y
# CONFIG_PM_DEBUG is not set
# CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
# end of Kernel options

CONFIG_ISA_DMA_API=y

#
# Bus options
#
CONFIG_GENERIC_ISA_DMA=y
CONFIG_PPC_INDIRECT_PCI=y
CONFIG_FSL_SOC=y
CONFIG_FSL_PCI=y
CONFIG_FSL_PMC=y
# CONFIG_FSL_LBC is not set
# end of Bus options

#
# Advanced setup
#
# CONFIG_ADVANCED_OPTIONS is not set

#
# Default settings for advanced configuration options are used
#
CONFIG_LOWMEM_SIZE=0x30000000
CONFIG_LOWMEM_CAM_NUM=9
CONFIG_PAGE_OFFSET=0xc0000000
CONFIG_KERNEL_START=0xc0000000
CONFIG_PHYSICAL_START=0x00000000
CONFIG_PHYSICAL_ALIGN=0x04000000
CONFIG_TASK_SIZE=0xc0000000
# end of Advanced setup

# CONFIG_VIRTUALIZATION is not set
CONFIG_HAVE_LIVEPATCH=y

#
# General architecture-dependent options
#
CONFIG_CRASH_CORE=y
# CONFIG_JUMP_LABEL is not set
# CONFIG_STATIC_CALL_SELFTEST is not set
CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y
CONFIG_ARCH_USE_BUILTIN_BSWAP=y
CONFIG_HAVE_IOREMAP_PROT=y
CONFIG_HAVE_KPROBES=y
CONFIG_HAVE_KRETPROBES=y
CONFIG_HAVE_OPTPROBES=y
CONFIG_HAVE_KPROBES_ON_FTRACE=y
CONFIG_HAVE_FUNCTION_ERROR_INJECTION=y
CONFIG_TRACE_IRQFLAGS_SUPPORT=y
CONFIG_HAVE_ARCH_TRACEHOOK=y
CONFIG_GENERIC_SMP_IDLE_THREAD=y
CONFIG_ARCH_HAS_FORTIFY_SOURCE=y
CONFIG_ARCH_HAS_SET_MEMORY=y
CONFIG_ARCH_WANTS_NO_INSTR=y
CONFIG_ARCH_32BIT_OFF_T=y
CONFIG_HAVE_ASM_MODVERSIONS=y
CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
CONFIG_HAVE_RSEQ=y
CONFIG_HAVE_PERF_REGS=y
CONFIG_HAVE_PERF_USER_STACK_DUMP=y
CONFIG_HAVE_ARCH_JUMP_LABEL=y
CONFIG_HAVE_ARCH_JUMP_LABEL_RELATIVE=y
CONFIG_MMU_GATHER_TABLE_FREE=y
CONFIG_MMU_GATHER_RCU_TABLE_FREE=y
CONFIG_MMU_GATHER_PAGE_SIZE=y
CONFIG_MMU_GATHER_MERGE_VMAS=y
CONFIG_ARCH_WANT_IRQS_OFF_ACTIVATE_MM=y
CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y
CONFIG_ARCH_WEAK_RELEASE_ACQUIRE=y
CONFIG_ARCH_WANT_IPC_PARSE_VERSION=y
CONFIG_HAVE_ARCH_SECCOMP=y
CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
CONFIG_SECCOMP=y
CONFIG_SECCOMP_FILTER=y
# CONFIG_SECCOMP_CACHE_DEBUG is not set
CONFIG_HAVE_STACKPROTECTOR=y
CONFIG_STACKPROTECTOR=y
CONFIG_STACKPROTECTOR_STRONG=y
CONFIG_LTO_NONE=y
CONFIG_HAVE_VIRT_CPU_ACCOUNTING=y
CONFIG_HAVE_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
CONFIG_MODULES_USE_ELF_RELA=y
CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK=y
CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
CONFIG_HAVE_ARCH_MMAP_RND_BITS=y
CONFIG_ARCH_MMAP_RND_BITS=11
CONFIG_PAGE_SIZE_LESS_THAN_64KB=y
CONFIG_PAGE_SIZE_LESS_THAN_256KB=y
CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT=y
CONFIG_HAVE_RELIABLE_STACKTRACE=y
CONFIG_HAVE_ARCH_NVRAM_OPS=y
CONFIG_CLONE_BACKWARDS=y
CONFIG_OLD_SIGSUSPEND=y
CONFIG_OLD_SIGACTION=y
CONFIG_COMPAT_32BIT_TIME=y
CONFIG_HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET=y
CONFIG_RANDOMIZE_KSTACK_OFFSET=y
# CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT is not set
CONFIG_ARCH_OPTIONAL_KERNEL_RWX=y
CONFIG_ARCH_OPTIONAL_KERNEL_RWX_DEFAULT=y
CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=y
CONFIG_STRICT_KERNEL_RWX=y
CONFIG_ARCH_HAS_STRICT_MODULE_RWX=y
CONFIG_ARCH_HAS_PHYS_TO_DMA=y
CONFIG_HAVE_STATIC_CALL=y
CONFIG_ARCH_WANT_LD_ORPHAN_WARN=y

#
# GCOV-based kernel profiling
#
CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y
# end of GCOV-based kernel profiling

CONFIG_HAVE_GCC_PLUGINS=y
CONFIG_GCC_PLUGINS=y
# CONFIG_GCC_PLUGIN_LATENT_ENTROPY is not set
# end of General architecture-dependent options

CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=0
# CONFIG_MODULES is not set
CONFIG_BLOCK=y
CONFIG_BLOCK_LEGACY_AUTOLOAD=y
# CONFIG_BLK_DEV_BSGLIB is not set
# CONFIG_BLK_DEV_INTEGRITY is not set
# CONFIG_BLK_DEV_ZONED is not set
# CONFIG_BLK_WBT is not set
# CONFIG_BLK_SED_OPAL is not set
# CONFIG_BLK_INLINE_ENCRYPTION is not set

#
# Partition Types
#
CONFIG_PARTITION_ADVANCED=y
# CONFIG_ACORN_PARTITION is not set
# CONFIG_AIX_PARTITION is not set
# CONFIG_OSF_PARTITION is not set
# CONFIG_AMIGA_PARTITION is not set
# CONFIG_ATARI_PARTITION is not set
# CONFIG_MAC_PARTITION is not set
# CONFIG_MSDOS_PARTITION is not set
# CONFIG_LDM_PARTITION is not set
# CONFIG_SGI_PARTITION is not set
# CONFIG_ULTRIX_PARTITION is not set
# CONFIG_SUN_PARTITION is not set
# CONFIG_KARMA_PARTITION is not set
CONFIG_EFI_PARTITION=y
# CONFIG_SYSV68_PARTITION is not set
# CONFIG_CMDLINE_PARTITION is not set
# end of Partition Types

CONFIG_BLK_MQ_PCI=y
CONFIG_BLK_PM=y

#
# IO Schedulers
#
CONFIG_MQ_IOSCHED_DEADLINE=y
CONFIG_MQ_IOSCHED_KYBER=y
# CONFIG_IOSCHED_BFQ is not set
# end of IO Schedulers

CONFIG_INLINE_SPIN_UNLOCK_IRQ=y
CONFIG_INLINE_READ_UNLOCK=y
CONFIG_INLINE_READ_UNLOCK_IRQ=y
CONFIG_INLINE_WRITE_UNLOCK=y
CONFIG_INLINE_WRITE_UNLOCK_IRQ=y
CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=y
CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE=y
CONFIG_FREEZER=y

#
# Executable file formats
#
CONFIG_BINFMT_ELF=y
CONFIG_ELFCORE=y
CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=y
CONFIG_BINFMT_SCRIPT=y
# CONFIG_BINFMT_MISC is not set
CONFIG_COREDUMP=y
# end of Executable file formats

#
# Memory Management options
#
CONFIG_SWAP=y
# CONFIG_ZSWAP is not set

#
# SLAB allocator options
#
# CONFIG_SLAB is not set
CONFIG_SLUB=y
# CONFIG_SLOB is not set
CONFIG_SLAB_MERGE_DEFAULT=y
# CONFIG_SLAB_FREELIST_RANDOM is not set
# CONFIG_SLAB_FREELIST_HARDENED is not set
# CONFIG_SLUB_STATS is not set
# end of SLAB allocator options

# CONFIG_SHUFFLE_PAGE_ALLOCATOR is not set
CONFIG_COMPAT_BRK=y
CONFIG_FLATMEM=y
CONFIG_HAVE_FAST_GUP=y
CONFIG_ARCH_KEEP_MEMBLOCK=y
CONFIG_EXCLUSIVE_SYSTEM_RAM=y
CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=y
CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE=y
CONFIG_SPLIT_PTLOCK_CPUS=4
CONFIG_COMPACTION=y
# CONFIG_PAGE_REPORTING is not set
CONFIG_MIGRATION=y
# CONFIG_KSM is not set
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
CONFIG_NEED_PER_CPU_KM=y
# CONFIG_CMA is not set
CONFIG_GENERIC_EARLY_IOREMAP=y
# CONFIG_IDLE_PAGE_TRACKING is not set
CONFIG_ARCH_HAS_CURRENT_STACK_POINTER=y
CONFIG_VM_EVENT_COUNTERS=y
# CONFIG_PERCPU_STATS is not set

#
# GUP_TEST needs to have DEBUG_FS enabled
#
CONFIG_ARCH_HAS_PTE_SPECIAL=y
# CONFIG_ANON_VMA_NAME is not set
# CONFIG_USERFAULTFD is not set

#
# Data Access Monitoring
#
# CONFIG_DAMON is not set
# end of Data Access Monitoring
# end of Memory Management options

CONFIG_NET=y
CONFIG_SKB_EXTENSIONS=y

#
# Networking options
#
CONFIG_PACKET=y
# CONFIG_PACKET_DIAG is not set
CONFIG_UNIX=y
CONFIG_UNIX_SCM=y
CONFIG_AF_UNIX_OOB=y
# CONFIG_UNIX_DIAG is not set
# CONFIG_TLS is not set
# CONFIG_XFRM_USER is not set
# CONFIG_NET_KEY is not set
CONFIG_INET=y
CONFIG_IP_MULTICAST=y
# CONFIG_IP_ADVANCED_ROUTER is not set
CONFIG_IP_PNP=y
CONFIG_IP_PNP_DHCP=y
CONFIG_IP_PNP_BOOTP=y
# CONFIG_IP_PNP_RARP is not set
# CONFIG_NET_IPIP is not set
# CONFIG_NET_IPGRE_DEMUX is not set
# CONFIG_IP_MROUTE is not set
CONFIG_SYN_COOKIES=y
# CONFIG_NET_IPVTI is not set
# CONFIG_NET_FOU is not set
# CONFIG_INET_AH is not set
# CONFIG_INET_ESP is not set
# CONFIG_INET_IPCOMP is not set
CONFIG_INET_DIAG=y
CONFIG_INET_TCP_DIAG=y
# CONFIG_INET_UDP_DIAG is not set
# CONFIG_INET_RAW_DIAG is not set
# CONFIG_INET_DIAG_DESTROY is not set
# CONFIG_TCP_CONG_ADVANCED is not set
CONFIG_TCP_CONG_CUBIC=y
CONFIG_DEFAULT_TCP_CONG="cubic"
# CONFIG_TCP_MD5SIG is not set
# CONFIG_IPV6 is not set
CONFIG_MPTCP=y
CONFIG_INET_MPTCP_DIAG=y
# CONFIG_NETWORK_SECMARK is not set
CONFIG_NET_PTP_CLASSIFY=y
# CONFIG_NETWORK_PHY_TIMESTAMPING is not set
# CONFIG_NETFILTER is not set
# CONFIG_BPFILTER is not set
# CONFIG_IP_DCCP is not set
# CONFIG_IP_SCTP is not set
# CONFIG_RDS is not set
# CONFIG_TIPC is not set
# CONFIG_ATM is not set
# CONFIG_L2TP is not set
# CONFIG_BRIDGE is not set
# CONFIG_NET_DSA is not set
# CONFIG_VLAN_8021Q is not set
# CONFIG_DECNET is not set
# CONFIG_LLC2 is not set
# CONFIG_ATALK is not set
# CONFIG_X25 is not set
# CONFIG_LAPB is not set
# CONFIG_PHONET is not set
# CONFIG_IEEE802154 is not set
# CONFIG_NET_SCHED is not set
# CONFIG_DCB is not set
# CONFIG_BATMAN_ADV is not set
# CONFIG_OPENVSWITCH is not set
# CONFIG_VSOCKETS is not set
# CONFIG_NETLINK_DIAG is not set
# CONFIG_MPLS is not set
# CONFIG_NET_NSH is not set
# CONFIG_HSR is not set
# CONFIG_NET_SWITCHDEV is not set
# CONFIG_NET_L3_MASTER_DEV is not set
# CONFIG_QRTR is not set
# CONFIG_NET_NCSI is not set
CONFIG_NET_RX_BUSY_POLL=y
CONFIG_BQL=y

#
# Network testing
#
# CONFIG_NET_PKTGEN is not set
# end of Network testing
# end of Networking options

# CONFIG_HAMRADIO is not set
# CONFIG_CAN is not set
# CONFIG_BT is not set
# CONFIG_AF_RXRPC is not set
# CONFIG_AF_KCM is not set
# CONFIG_MCTP is not set
CONFIG_WIRELESS=y
# CONFIG_CFG80211 is not set

#
# CFG80211 needs to be enabled for MAC80211
#
CONFIG_MAC80211_STA_HASH_MAX_SIZE=0
# CONFIG_RFKILL is not set
# CONFIG_NET_9P is not set
# CONFIG_CAIF is not set
# CONFIG_CEPH_LIB is not set
# CONFIG_NFC is not set
# CONFIG_PSAMPLE is not set
# CONFIG_NET_IFE is not set
# CONFIG_LWTUNNEL is not set
CONFIG_NET_SELFTESTS=y
# CONFIG_FAILOVER is not set
CONFIG_ETHTOOL_NETLINK=y

#
# Device Drivers
#
CONFIG_HAVE_PCI=y
CONFIG_PCI=y
CONFIG_PCI_DOMAINS=y
CONFIG_PCI_SYSCALL=y
# CONFIG_PCIEPORTBUS is not set
CONFIG_PCIEASPM=y
CONFIG_PCIEASPM_DEFAULT=y
# CONFIG_PCIEASPM_POWERSAVE is not set
# CONFIG_PCIEASPM_POWER_SUPERSAVE is not set
# CONFIG_PCIEASPM_PERFORMANCE is not set
# CONFIG_PCIE_PTM is not set
# CONFIG_PCI_MSI is not set
CONFIG_PCI_QUIRKS=y
# CONFIG_PCI_DEBUG is not set
# CONFIG_PCI_STUB is not set
# CONFIG_PCI_IOV is not set
# CONFIG_PCI_PRI is not set
# CONFIG_PCI_PASID is not set
# CONFIG_PCIE_BUS_TUNE_OFF is not set
CONFIG_PCIE_BUS_DEFAULT=y
# CONFIG_PCIE_BUS_SAFE is not set
# CONFIG_PCIE_BUS_PERFORMANCE is not set
# CONFIG_PCIE_BUS_PEER2PEER is not set
CONFIG_VGA_ARB=y
CONFIG_VGA_ARB_MAX_GPUS=16
# CONFIG_HOTPLUG_PCI is not set

#
# PCI controller drivers
#
# CONFIG_PCI_FTPCI100 is not set
# CONFIG_PCI_HOST_GENERIC is not set

#
# DesignWare PCI Core Support
#
# end of DesignWare PCI Core Support

#
# Mobiveil PCIe Core Support
#
# end of Mobiveil PCIe Core Support

#
# Cadence PCIe controllers support
#
# CONFIG_PCIE_CADENCE_PLAT_HOST is not set
# CONFIG_PCI_J721E_HOST is not set
# end of Cadence PCIe controllers support
# end of PCI controller drivers

#
# PCI Endpoint
#
# CONFIG_PCI_ENDPOINT is not set
# end of PCI Endpoint

#
# PCI switch controller drivers
#
# CONFIG_PCI_SW_SWITCHTEC is not set
# end of PCI switch controller drivers

# CONFIG_CXL_BUS is not set
# CONFIG_PCCARD is not set
# CONFIG_RAPIDIO is not set

#
# Generic Driver Options
#
# CONFIG_UEVENT_HELPER is not set
# CONFIG_DEVTMPFS is not set
CONFIG_STANDALONE=y
CONFIG_PREVENT_FIRMWARE_BUILD=y

#
# Firmware loader
#
CONFIG_FW_LOADER=y
CONFIG_EXTRA_FIRMWARE=""
# CONFIG_FW_LOADER_USER_HELPER is not set
# CONFIG_FW_LOADER_COMPRESS is not set
CONFIG_FW_CACHE=y
# CONFIG_FW_UPLOAD is not set
# end of Firmware loader

CONFIG_ALLOW_DEV_COREDUMP=y
# CONFIG_DEBUG_DRIVER is not set
# CONFIG_DEBUG_DEVRES is not set
# CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
CONFIG_GENERIC_CPU_AUTOPROBE=y
CONFIG_GENERIC_CPU_VULNERABILITIES=y
CONFIG_REGMAP=y
CONFIG_REGMAP_I2C=y
# end of Generic Driver Options

#
# Bus devices
#
# CONFIG_MHI_BUS is not set
# CONFIG_MHI_BUS_EP is not set
# end of Bus devices

# CONFIG_CONNECTOR is not set

#
# Firmware Drivers
#

#
# ARM System Control and Management Interface Protocol
#
# end of ARM System Control and Management Interface Protocol

# CONFIG_FIRMWARE_MEMMAP is not set
# CONFIG_GOOGLE_FIRMWARE is not set

#
# Tegra firmware driver
#
# end of Tegra firmware driver
# end of Firmware Drivers

# CONFIG_GNSS is not set
CONFIG_MTD=y

#
# Partition parsers
#
# CONFIG_MTD_AR7_PARTS is not set
CONFIG_MTD_CMDLINE_PARTS=y
CONFIG_MTD_OF_PARTS=y
# CONFIG_MTD_REDBOOT_PARTS is not set
# end of Partition parsers

#
# User Modules And Translation Layers
#
CONFIG_MTD_BLKDEVS=y
CONFIG_MTD_BLOCK=y

#
# Note that in some cases UBI block is preferred. See MTD_UBI_BLOCK.
#
# CONFIG_FTL is not set
# CONFIG_NFTL is not set
# CONFIG_INFTL is not set
# CONFIG_RFD_FTL is not set
# CONFIG_SSFDC is not set
# CONFIG_SM_FTL is not set
# CONFIG_MTD_OOPS is not set
# CONFIG_MTD_SWAP is not set
# CONFIG_MTD_PARTITIONED_MASTER is not set

#
# RAM/ROM/Flash chip drivers
#
CONFIG_MTD_CFI=y
# CONFIG_MTD_JEDECPROBE is not set
CONFIG_MTD_GEN_PROBE=y
# CONFIG_MTD_CFI_ADV_OPTIONS is not set
CONFIG_MTD_MAP_BANK_WIDTH_1=y
CONFIG_MTD_MAP_BANK_WIDTH_2=y
CONFIG_MTD_MAP_BANK_WIDTH_4=y
CONFIG_MTD_CFI_I1=y
CONFIG_MTD_CFI_I2=y
# CONFIG_MTD_CFI_INTELEXT is not set
CONFIG_MTD_CFI_AMDSTD=y
# CONFIG_MTD_CFI_STAA is not set
CONFIG_MTD_CFI_UTIL=y
# CONFIG_MTD_RAM is not set
# CONFIG_MTD_ROM is not set
# CONFIG_MTD_ABSENT is not set
# end of RAM/ROM/Flash chip drivers

#
# Mapping drivers for chip access
#
# CONFIG_MTD_COMPLEX_MAPPINGS is not set
# CONFIG_MTD_PHYSMAP is not set
# CONFIG_MTD_INTEL_VR_NOR is not set
# CONFIG_MTD_PLATRAM is not set
# end of Mapping drivers for chip access

#
# Self-contained MTD device drivers
#
# CONFIG_MTD_PMC551 is not set
# CONFIG_MTD_SLRAM is not set
# CONFIG_MTD_PHRAM is not set
# CONFIG_MTD_MTDRAM is not set
# CONFIG_MTD_BLOCK2MTD is not set

#
# Disk-On-Chip Device Drivers
#
# CONFIG_MTD_DOCG3 is not set
# end of Self-contained MTD device drivers

#
# NAND
#
# CONFIG_MTD_ONENAND is not set
# CONFIG_MTD_RAW_NAND is not set

#
# ECC engine support
#
# CONFIG_MTD_NAND_ECC_SW_HAMMING is not set
# CONFIG_MTD_NAND_ECC_SW_BCH is not set
# CONFIG_MTD_NAND_ECC_MXIC is not set
# end of ECC engine support
# end of NAND

#
# LPDDR & LPDDR2 PCM memory drivers
#
# CONFIG_MTD_LPDDR is not set
# end of LPDDR & LPDDR2 PCM memory drivers

# CONFIG_MTD_UBI is not set
# CONFIG_MTD_HYPERBUS is not set
CONFIG_DTC=y
CONFIG_OF=y
# CONFIG_OF_UNITTEST is not set
CONFIG_OF_FLATTREE=y
CONFIG_OF_EARLY_FLATTREE=y
CONFIG_OF_KOBJ=y
CONFIG_OF_ADDRESS=y
CONFIG_OF_IRQ=y
CONFIG_OF_RESERVED_MEM=y
# CONFIG_OF_OVERLAY is not set
CONFIG_OF_DMA_DEFAULT_COHERENT=y
CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=y
# CONFIG_PARPORT is not set
CONFIG_BLK_DEV=y
# CONFIG_BLK_DEV_NULL_BLK is not set
# CONFIG_BLK_DEV_FD is not set
# CONFIG_BLK_DEV_PCIESSD_MTIP32XX is not set
CONFIG_BLK_DEV_LOOP=y
CONFIG_BLK_DEV_LOOP_MIN_COUNT=8
# CONFIG_BLK_DEV_DRBD is not set
# CONFIG_BLK_DEV_NBD is not set
CONFIG_BLK_DEV_RAM=y
CONFIG_BLK_DEV_RAM_COUNT=16
CONFIG_BLK_DEV_RAM_SIZE=32768
# CONFIG_CDROM_PKTCDVD is not set
# CONFIG_ATA_OVER_ETH is not set
# CONFIG_BLK_DEV_RBD is not set
# CONFIG_BLK_DEV_UBLK is not set

#
# NVME Support
#
# CONFIG_BLK_DEV_NVME is not set
# CONFIG_NVME_FC is not set
# CONFIG_NVME_TCP is not set
# end of NVME Support

#
# Misc devices
#
# CONFIG_AD525X_DPOT is not set
# CONFIG_DUMMY_IRQ is not set
# CONFIG_PHANTOM is not set
# CONFIG_TIFM_CORE is not set
# CONFIG_ICS932S401 is not set
# CONFIG_ENCLOSURE_SERVICES is not set
# CONFIG_HP_ILO is not set
# CONFIG_APDS9802ALS is not set
# CONFIG_ISL29003 is not set
# CONFIG_ISL29020 is not set
# CONFIG_SENSORS_TSL2550 is not set
# CONFIG_SENSORS_BH1770 is not set
# CONFIG_SENSORS_APDS990X is not set
# CONFIG_HMC6352 is not set
# CONFIG_DS1682 is not set
# CONFIG_SRAM is not set
# CONFIG_DW_XDATA_PCIE is not set
# CONFIG_PCI_ENDPOINT_TEST is not set
# CONFIG_XILINX_SDFEC is not set
# CONFIG_OPEN_DICE is not set
# CONFIG_VCPU_STALL_DETECTOR is not set
# CONFIG_C2PORT is not set

#
# EEPROM support
#
# CONFIG_EEPROM_AT24 is not set
# CONFIG_EEPROM_LEGACY is not set
# CONFIG_EEPROM_MAX6875 is not set
# CONFIG_EEPROM_93CX6 is not set
# CONFIG_EEPROM_IDT_89HPESX is not set
# CONFIG_EEPROM_EE1004 is not set
# end of EEPROM support

# CONFIG_CB710_CORE is not set

#
# Texas Instruments shared transport line discipline
#
# CONFIG_TI_ST is not set
# end of Texas Instruments shared transport line discipline

# CONFIG_SENSORS_LIS3_I2C is not set
# CONFIG_ALTERA_STAPL is not set
# CONFIG_ECHO is not set
# CONFIG_MISC_ALCOR_PCI is not set
# CONFIG_MISC_RTSX_PCI is not set
# CONFIG_HABANA_AI is not set
# CONFIG_PVPANIC is not set
# end of Misc devices

#
# SCSI device support
#
CONFIG_SCSI_MOD=y
# CONFIG_RAID_ATTRS is not set
CONFIG_SCSI_COMMON=y
CONFIG_SCSI=y
CONFIG_SCSI_DMA=y
CONFIG_SCSI_PROC_FS=y

#
# SCSI support type (disk, tape, CD-ROM)
#
# CONFIG_BLK_DEV_SD is not set
# CONFIG_CHR_DEV_ST is not set
# CONFIG_BLK_DEV_SR is not set
# CONFIG_CHR_DEV_SG is not set
# CONFIG_BLK_DEV_BSG is not set
# CONFIG_CHR_DEV_SCH is not set
# CONFIG_SCSI_CONSTANTS is not set
# CONFIG_SCSI_LOGGING is not set
# CONFIG_SCSI_SCAN_ASYNC is not set

#
# SCSI Transports
#
# CONFIG_SCSI_SPI_ATTRS is not set
# CONFIG_SCSI_FC_ATTRS is not set
# CONFIG_SCSI_ISCSI_ATTRS is not set
# CONFIG_SCSI_SAS_ATTRS is not set
# CONFIG_SCSI_SAS_LIBSAS is not set
# CONFIG_SCSI_SRP_ATTRS is not set
# end of SCSI Transports

CONFIG_SCSI_LOWLEVEL=y
# CONFIG_ISCSI_TCP is not set
# CONFIG_ISCSI_BOOT_SYSFS is not set
# CONFIG_SCSI_CXGB3_ISCSI is not set
# CONFIG_SCSI_CXGB4_ISCSI is not set
# CONFIG_SCSI_BNX2_ISCSI is not set
# CONFIG_BE2ISCSI is not set
# CONFIG_BLK_DEV_3W_XXXX_RAID is not set
# CONFIG_SCSI_HPSA is not set
# CONFIG_SCSI_3W_9XXX is not set
# CONFIG_SCSI_3W_SAS is not set
# CONFIG_SCSI_ACARD is not set
# CONFIG_SCSI_AACRAID is not set
# CONFIG_SCSI_AIC7XXX is not set
# CONFIG_SCSI_AIC79XX is not set
# CONFIG_SCSI_AIC94XX is not set
# CONFIG_SCSI_MVSAS is not set
# CONFIG_SCSI_MVUMI is not set
# CONFIG_SCSI_ADVANSYS is not set
# CONFIG_SCSI_ARCMSR is not set
# CONFIG_SCSI_ESAS2R is not set
# CONFIG_MEGARAID_NEWGEN is not set
# CONFIG_MEGARAID_LEGACY is not set
# CONFIG_MEGARAID_SAS is not set
# CONFIG_SCSI_MPT3SAS is not set
# CONFIG_SCSI_MPT2SAS is not set
# CONFIG_SCSI_MPI3MR is not set
# CONFIG_SCSI_SMARTPQI is not set
# CONFIG_SCSI_HPTIOP is not set
# CONFIG_SCSI_BUSLOGIC is not set
# CONFIG_SCSI_MYRB is not set
# CONFIG_SCSI_SNIC is not set
# CONFIG_SCSI_DMX3191D is not set
# CONFIG_SCSI_FDOMAIN_PCI is not set
# CONFIG_SCSI_IPS is not set
# CONFIG_SCSI_INITIO is not set
# CONFIG_SCSI_INIA100 is not set
# CONFIG_SCSI_STEX is not set
# CONFIG_SCSI_SYM53C8XX_2 is not set
# CONFIG_SCSI_IPR is not set
# CONFIG_SCSI_QLOGIC_1280 is not set
# CONFIG_SCSI_QLA_ISCSI is not set
# CONFIG_SCSI_DC395x is not set
# CONFIG_SCSI_AM53C974 is not set
# CONFIG_SCSI_NSP32 is not set
# CONFIG_SCSI_WD719X is not set
# CONFIG_SCSI_DEBUG is not set
# CONFIG_SCSI_PMCRAID is not set
# CONFIG_SCSI_PM8001 is not set
# CONFIG_SCSI_DH is not set
# end of SCSI device support

CONFIG_ATA=y
CONFIG_SATA_HOST=y
CONFIG_PATA_TIMINGS=y
CONFIG_ATA_VERBOSE_ERROR=y
CONFIG_ATA_FORCE=y
CONFIG_SATA_PMP=y

#
# Controllers with non-SFF native interface
#
# CONFIG_SATA_AHCI is not set
# CONFIG_SATA_AHCI_PLATFORM is not set
# CONFIG_AHCI_CEVA is not set
# CONFIG_AHCI_QORIQ is not set
# CONFIG_SATA_FSL is not set
# CONFIG_SATA_INIC162X is not set
# CONFIG_SATA_ACARD_AHCI is not set
# CONFIG_SATA_SIL24 is not set
CONFIG_ATA_SFF=y

#
# SFF controllers with custom DMA interface
#
# CONFIG_PDC_ADMA is not set
# CONFIG_SATA_QSTOR is not set
# CONFIG_SATA_SX4 is not set
CONFIG_ATA_BMDMA=y

#
# SATA SFF controllers with BMDMA
#
# CONFIG_ATA_PIIX is not set
# CONFIG_SATA_MV is not set
# CONFIG_SATA_NV is not set
# CONFIG_SATA_PROMISE is not set
# CONFIG_SATA_SIL is not set
# CONFIG_SATA_SIS is not set
# CONFIG_SATA_SVW is not set
# CONFIG_SATA_ULI is not set
# CONFIG_SATA_VIA is not set
# CONFIG_SATA_VITESSE is not set

#
# PATA SFF controllers with BMDMA
#
# CONFIG_PATA_ALI is not set
# CONFIG_PATA_AMD is not set
# CONFIG_PATA_ARTOP is not set
# CONFIG_PATA_ATIIXP is not set
# CONFIG_PATA_ATP867X is not set
# CONFIG_PATA_CMD64X is not set
# CONFIG_PATA_CYPRESS is not set
# CONFIG_PATA_EFAR is not set
# CONFIG_PATA_HPT366 is not set
# CONFIG_PATA_HPT37X is not set
# CONFIG_PATA_HPT3X2N is not set
# CONFIG_PATA_HPT3X3 is not set
# CONFIG_PATA_IT8213 is not set
# CONFIG_PATA_IT821X is not set
# CONFIG_PATA_JMICRON is not set
# CONFIG_PATA_MARVELL is not set
# CONFIG_PATA_NETCELL is not set
# CONFIG_PATA_NINJA32 is not set
# CONFIG_PATA_NS87415 is not set
# CONFIG_PATA_OLDPIIX is not set
# CONFIG_PATA_OPTIDMA is not set
# CONFIG_PATA_PDC2027X is not set
# CONFIG_PATA_PDC_OLD is not set
# CONFIG_PATA_RADISYS is not set
# CONFIG_PATA_RDC is not set
# CONFIG_PATA_SCH is not set
# CONFIG_PATA_SERVERWORKS is not set
# CONFIG_PATA_SIL680 is not set
# CONFIG_PATA_SIS is not set
# CONFIG_PATA_TOSHIBA is not set
# CONFIG_PATA_TRIFLEX is not set
CONFIG_PATA_VIA=y
# CONFIG_PATA_WINBOND is not set

#
# PIO-only SFF controllers
#
# CONFIG_PATA_CMD640_PCI is not set
# CONFIG_PATA_MPIIX is not set
# CONFIG_PATA_NS87410 is not set
# CONFIG_PATA_OPTI is not set
# CONFIG_PATA_PLATFORM is not set
# CONFIG_PATA_RZ1000 is not set

#
# Generic fallback / legacy drivers
#
CONFIG_ATA_GENERIC=y
# CONFIG_PATA_LEGACY is not set
# CONFIG_MD is not set
# CONFIG_TARGET_CORE is not set
# CONFIG_FUSION is not set

#
# IEEE 1394 (FireWire) support
#
# CONFIG_FIREWIRE is not set
# CONFIG_FIREWIRE_NOSY is not set
# end of IEEE 1394 (FireWire) support

# CONFIG_MACINTOSH_DRIVERS is not set
CONFIG_NETDEVICES=y
CONFIG_MII=y
CONFIG_NET_CORE=y
# CONFIG_BONDING is not set
# CONFIG_DUMMY is not set
# CONFIG_WIREGUARD is not set
# CONFIG_EQUALIZER is not set
# CONFIG_NET_FC is not set
# CONFIG_NET_TEAM is not set
# CONFIG_MACVLAN is not set
# CONFIG_IPVLAN is not set
# CONFIG_VXLAN is not set
# CONFIG_GENEVE is not set
# CONFIG_BAREUDP is not set
# CONFIG_GTP is not set
# CONFIG_AMT is not set
# CONFIG_MACSEC is not set
# CONFIG_NETCONSOLE is not set
# CONFIG_TUN is not set
# CONFIG_TUN_VNET_CROSS_LE is not set
# CONFIG_VETH is not set
# CONFIG_NLMON is not set
# CONFIG_ARCNET is not set
CONFIG_ETHERNET=y
CONFIG_NET_VENDOR_3COM=y
# CONFIG_VORTEX is not set
# CONFIG_TYPHOON is not set
CONFIG_NET_VENDOR_ADAPTEC=y
# CONFIG_ADAPTEC_STARFIRE is not set
CONFIG_NET_VENDOR_AGERE=y
# CONFIG_ET131X is not set
CONFIG_NET_VENDOR_ALACRITECH=y
# CONFIG_SLICOSS is not set
CONFIG_NET_VENDOR_ALTEON=y
# CONFIG_ACENIC is not set
# CONFIG_ALTERA_TSE is not set
CONFIG_NET_VENDOR_AMAZON=y
CONFIG_NET_VENDOR_AMD=y
# CONFIG_AMD8111_ETH is not set
# CONFIG_PCNET32 is not set
CONFIG_NET_VENDOR_AQUANTIA=y
# CONFIG_AQTION is not set
CONFIG_NET_VENDOR_ARC=y
CONFIG_NET_VENDOR_ASIX=y
CONFIG_NET_VENDOR_ATHEROS=y
# CONFIG_ATL2 is not set
# CONFIG_ATL1 is not set
# CONFIG_ATL1E is not set
# CONFIG_ATL1C is not set
# CONFIG_ALX is not set
CONFIG_NET_VENDOR_BROADCOM=y
# CONFIG_B44 is not set
# CONFIG_BCMGENET is not set
# CONFIG_BNX2 is not set
# CONFIG_CNIC is not set
# CONFIG_TIGON3 is not set
# CONFIG_BNX2X is not set
# CONFIG_SYSTEMPORT is not set
# CONFIG_BNXT is not set
CONFIG_NET_VENDOR_CADENCE=y
CONFIG_NET_VENDOR_CAVIUM=y
CONFIG_NET_VENDOR_CHELSIO=y
# CONFIG_CHELSIO_T1 is not set
# CONFIG_CHELSIO_T3 is not set
# CONFIG_CHELSIO_T4 is not set
# CONFIG_CHELSIO_T4VF is not set
CONFIG_NET_VENDOR_CISCO=y
# CONFIG_ENIC is not set
CONFIG_NET_VENDOR_CORTINA=y
# CONFIG_GEMINI_ETHERNET is not set
CONFIG_NET_VENDOR_DAVICOM=y
# CONFIG_DNET is not set
CONFIG_NET_VENDOR_DEC=y
# CONFIG_NET_TULIP is not set
CONFIG_NET_VENDOR_DLINK=y
# CONFIG_DL2K is not set
# CONFIG_SUNDANCE is not set
CONFIG_NET_VENDOR_EMULEX=y
# CONFIG_BE2NET is not set
CONFIG_NET_VENDOR_ENGLEDER=y
# CONFIG_TSNEP is not set
CONFIG_NET_VENDOR_EZCHIP=y
# CONFIG_EZCHIP_NPS_MANAGEMENT_ENET is not set
CONFIG_NET_VENDOR_FREESCALE=y
# CONFIG_FS_ENET is not set
# CONFIG_FSL_FMAN is not set
CONFIG_FSL_PQ_MDIO=y
# CONFIG_FSL_XGMAC_MDIO is not set
CONFIG_GIANFAR=y
# CONFIG_FSL_ENETC_IERB is not set
# CONFIG_FSL_ENETC_MDIO is not set
CONFIG_NET_VENDOR_FUNGIBLE=y
CONFIG_NET_VENDOR_GOOGLE=y
CONFIG_NET_VENDOR_HUAWEI=y
CONFIG_NET_VENDOR_I825XX=y
CONFIG_NET_VENDOR_INTEL=y
CONFIG_E100=y
# CONFIG_E1000 is not set
# CONFIG_E1000E is not set
# CONFIG_IGB is not set
# CONFIG_IGBVF is not set
# CONFIG_IXGB is not set
# CONFIG_IXGBE is not set
# CONFIG_I40E is not set
# CONFIG_IGC is not set
CONFIG_NET_VENDOR_WANGXUN=y
# CONFIG_TXGBE is not set
# CONFIG_JME is not set
CONFIG_NET_VENDOR_LITEX=y
# CONFIG_LITEX_LITEETH is not set
CONFIG_NET_VENDOR_MARVELL=y
# CONFIG_MV643XX_ETH is not set
# CONFIG_MVMDIO is not set
# CONFIG_SKGE is not set
# CONFIG_SKY2 is not set
CONFIG_NET_VENDOR_MELLANOX=y
# CONFIG_MLX4_EN is not set
# CONFIG_MLX5_CORE is not set
# CONFIG_MLXSW_CORE is not set
# CONFIG_MLXFW is not set
CONFIG_NET_VENDOR_MICREL=y
# CONFIG_KS8851_MLL is not set
# CONFIG_KSZ884X_PCI is not set
CONFIG_NET_VENDOR_MICROCHIP=y
# CONFIG_LAN743X is not set
CONFIG_NET_VENDOR_MICROSEMI=y
CONFIG_NET_VENDOR_MICROSOFT=y
CONFIG_NET_VENDOR_MYRI=y
# CONFIG_MYRI10GE is not set
# CONFIG_FEALNX is not set
CONFIG_NET_VENDOR_NI=y
# CONFIG_NI_XGE_MANAGEMENT_ENET is not set
CONFIG_NET_VENDOR_NATSEMI=y
# CONFIG_NATSEMI is not set
# CONFIG_NS83820 is not set
CONFIG_NET_VENDOR_NETERION=y
# CONFIG_S2IO is not set
CONFIG_NET_VENDOR_NETRONOME=y
CONFIG_NET_VENDOR_8390=y
# CONFIG_NE2K_PCI is not set
CONFIG_NET_VENDOR_NVIDIA=y
# CONFIG_FORCEDETH is not set
CONFIG_NET_VENDOR_OKI=y
# CONFIG_ETHOC is not set
CONFIG_NET_VENDOR_PACKET_ENGINES=y
# CONFIG_HAMACHI is not set
# CONFIG_YELLOWFIN is not set
CONFIG_NET_VENDOR_PENSANDO=y
CONFIG_NET_VENDOR_QLOGIC=y
# CONFIG_QLA3XXX is not set
# CONFIG_QLCNIC is not set
# CONFIG_NETXEN_NIC is not set
# CONFIG_QED is not set
CONFIG_NET_VENDOR_BROCADE=y
# CONFIG_BNA is not set
CONFIG_NET_VENDOR_QUALCOMM=y
# CONFIG_QCOM_EMAC is not set
# CONFIG_RMNET is not set
CONFIG_NET_VENDOR_RDC=y
# CONFIG_R6040 is not set
CONFIG_NET_VENDOR_REALTEK=y
# CONFIG_8139CP is not set
# CONFIG_8139TOO is not set
# CONFIG_R8169 is not set
CONFIG_NET_VENDOR_RENESAS=y
CONFIG_NET_VENDOR_ROCKER=y
CONFIG_NET_VENDOR_SAMSUNG=y
# CONFIG_SXGBE_ETH is not set
CONFIG_NET_VENDOR_SEEQ=y
CONFIG_NET_VENDOR_SILAN=y
# CONFIG_SC92031 is not set
CONFIG_NET_VENDOR_SIS=y
# CONFIG_SIS900 is not set
# CONFIG_SIS190 is not set
CONFIG_NET_VENDOR_SOLARFLARE=y
# CONFIG_SFC is not set
# CONFIG_SFC_FALCON is not set
# CONFIG_SFC_SIENA is not set
CONFIG_NET_VENDOR_SMSC=y
# CONFIG_EPIC100 is not set
# CONFIG_SMSC911X is not set
# CONFIG_SMSC9420 is not set
CONFIG_NET_VENDOR_SOCIONEXT=y
CONFIG_NET_VENDOR_STMICRO=y
# CONFIG_STMMAC_ETH is not set
CONFIG_NET_VENDOR_SUN=y
# CONFIG_HAPPYMEAL is not set
# CONFIG_SUNGEM is not set
# CONFIG_CASSINI is not set
# CONFIG_NIU is not set
CONFIG_NET_VENDOR_SYNOPSYS=y
# CONFIG_DWC_XLGMAC is not set
CONFIG_NET_VENDOR_TEHUTI=y
# CONFIG_TEHUTI is not set
CONFIG_NET_VENDOR_TI=y
# CONFIG_TI_CPSW_PHY_SEL is not set
# CONFIG_TLAN is not set
CONFIG_NET_VENDOR_VERTEXCOM=y
CONFIG_NET_VENDOR_VIA=y
# CONFIG_VIA_RHINE is not set
# CONFIG_VIA_VELOCITY is not set
CONFIG_NET_VENDOR_WIZNET=y
# CONFIG_WIZNET_W5100 is not set
# CONFIG_WIZNET_W5300 is not set
CONFIG_NET_VENDOR_XILINX=y
# CONFIG_XILINX_EMACLITE is not set
# CONFIG_XILINX_AXI_EMAC is not set
# CONFIG_XILINX_LL_TEMAC is not set
# CONFIG_FDDI is not set
# CONFIG_HIPPI is not set
CONFIG_PHYLIB=y
CONFIG_SWPHY=y
CONFIG_FIXED_PHY=y

#
# MII PHY device drivers
#
# CONFIG_AMD_PHY is not set
# CONFIG_ADIN_PHY is not set
# CONFIG_ADIN1100_PHY is not set
# CONFIG_AQUANTIA_PHY is not set
# CONFIG_AX88796B_PHY is not set
# CONFIG_BROADCOM_PHY is not set
# CONFIG_BCM54140_PHY is not set
# CONFIG_BCM7XXX_PHY is not set
# CONFIG_BCM84881_PHY is not set
# CONFIG_BCM87XX_PHY is not set
# CONFIG_CICADA_PHY is not set
# CONFIG_CORTINA_PHY is not set
# CONFIG_DAVICOM_PHY is not set
# CONFIG_ICPLUS_PHY is not set
# CONFIG_LXT_PHY is not set
# CONFIG_INTEL_XWAY_PHY is not set
# CONFIG_LSI_ET1011C_PHY is not set
# CONFIG_MARVELL_PHY is not set
# CONFIG_MARVELL_10G_PHY is not set
# CONFIG_MARVELL_88X2222_PHY is not set
# CONFIG_MAXLINEAR_GPHY is not set
# CONFIG_MEDIATEK_GE_PHY is not set
# CONFIG_MICREL_PHY is not set
# CONFIG_MICROCHIP_PHY is not set
# CONFIG_MICROCHIP_T1_PHY is not set
# CONFIG_MICROSEMI_PHY is not set
# CONFIG_MOTORCOMM_PHY is not set
# CONFIG_NATIONAL_PHY is not set
# CONFIG_NXP_C45_TJA11XX_PHY is not set
# CONFIG_NXP_TJA11XX_PHY is not set
# CONFIG_QSEMI_PHY is not set
# CONFIG_REALTEK_PHY is not set
# CONFIG_RENESAS_PHY is not set
# CONFIG_ROCKCHIP_PHY is not set
# CONFIG_SMSC_PHY is not set
# CONFIG_STE10XP is not set
# CONFIG_TERANETICS_PHY is not set
# CONFIG_DP83822_PHY is not set
# CONFIG_DP83TC811_PHY is not set
# CONFIG_DP83848_PHY is not set
# CONFIG_DP83867_PHY is not set
# CONFIG_DP83869_PHY is not set
# CONFIG_DP83TD510_PHY is not set
# CONFIG_VITESSE_PHY is not set
# CONFIG_XILINX_GMII2RGMII is not set
CONFIG_MDIO_DEVICE=y
CONFIG_MDIO_BUS=y
CONFIG_FWNODE_MDIO=y
CONFIG_OF_MDIO=y
CONFIG_MDIO_DEVRES=y
# CONFIG_MDIO_BITBANG is not set
# CONFIG_MDIO_BCM_UNIMAC is not set
# CONFIG_MDIO_HISI_FEMAC is not set

#
# MDIO Multiplexers
#
# CONFIG_MDIO_BUS_MUX_GPIO is not set
# CONFIG_MDIO_BUS_MUX_MULTIPLEXER is not set
# CONFIG_MDIO_BUS_MUX_MMIOREG is not set

#
# PCS device drivers
#
# end of PCS device drivers

# CONFIG_PPP is not set
# CONFIG_SLIP is not set

#
# Host-side USB support is needed for USB Network Adapter support
#
CONFIG_WLAN=y
CONFIG_WLAN_VENDOR_ADMTEK=y
CONFIG_WLAN_VENDOR_ATH=y
# CONFIG_ATH_DEBUG is not set
# CONFIG_ATH5K_PCI is not set
CONFIG_WLAN_VENDOR_ATMEL=y
CONFIG_WLAN_VENDOR_BROADCOM=y
CONFIG_WLAN_VENDOR_CISCO=y
CONFIG_WLAN_VENDOR_INTEL=y
CONFIG_WLAN_VENDOR_INTERSIL=y
# CONFIG_HOSTAP is not set
CONFIG_WLAN_VENDOR_MARVELL=y
CONFIG_WLAN_VENDOR_MEDIATEK=y
CONFIG_WLAN_VENDOR_MICROCHIP=y
CONFIG_WLAN_VENDOR_PURELIFI=y
CONFIG_WLAN_VENDOR_RALINK=y
CONFIG_WLAN_VENDOR_REALTEK=y
CONFIG_WLAN_VENDOR_RSI=y
CONFIG_WLAN_VENDOR_SILABS=y
CONFIG_WLAN_VENDOR_ST=y
CONFIG_WLAN_VENDOR_TI=y
CONFIG_WLAN_VENDOR_ZYDAS=y
CONFIG_WLAN_VENDOR_QUANTENNA=y
# CONFIG_WAN is not set

#
# Wireless WAN
#
# CONFIG_WWAN is not set
# end of Wireless WAN

# CONFIG_VMXNET3 is not set
# CONFIG_NET_FAILOVER is not set
# CONFIG_ISDN is not set

#
# Input device support
#
CONFIG_INPUT=y
# CONFIG_INPUT_FF_MEMLESS is not set
# CONFIG_INPUT_SPARSEKMAP is not set
# CONFIG_INPUT_MATRIXKMAP is not set

#
# Userland interfaces
#
# CONFIG_INPUT_MOUSEDEV is not set
# CONFIG_INPUT_JOYDEV is not set
# CONFIG_INPUT_EVDEV is not set
# CONFIG_INPUT_EVBUG is not set

#
# Input Device Drivers
#
# CONFIG_INPUT_KEYBOARD is not set
# CONFIG_INPUT_MOUSE is not set
# CONFIG_INPUT_JOYSTICK is not set
# CONFIG_INPUT_TABLET is not set
# CONFIG_INPUT_TOUCHSCREEN is not set
# CONFIG_INPUT_MISC is not set
# CONFIG_RMI4_CORE is not set

#
# Hardware I/O ports
#
# CONFIG_SERIO is not set
CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=y
# CONFIG_GAMEPORT is not set
# end of Hardware I/O ports
# end of Input device support

#
# Character devices
#
CONFIG_TTY=y
# CONFIG_VT is not set
CONFIG_UNIX98_PTYS=y
CONFIG_LEGACY_PTYS=y
CONFIG_LEGACY_PTY_COUNT=256
CONFIG_LDISC_AUTOLOAD=y

#
# Serial drivers
#
CONFIG_SERIAL_EARLYCON=y
CONFIG_SERIAL_8250=y
CONFIG_SERIAL_8250_DEPRECATED_OPTIONS=y
CONFIG_SERIAL_8250_16550A_VARIANTS=y
# CONFIG_SERIAL_8250_FINTEK is not set
CONFIG_SERIAL_8250_CONSOLE=y
CONFIG_SERIAL_8250_PCI=y
CONFIG_SERIAL_8250_EXAR=y
CONFIG_SERIAL_8250_NR_UARTS=4
CONFIG_SERIAL_8250_RUNTIME_UARTS=4
CONFIG_SERIAL_8250_EXTENDED=y
# CONFIG_SERIAL_8250_MANY_PORTS is not set
CONFIG_SERIAL_8250_SHARE_IRQ=y
# CONFIG_SERIAL_8250_DETECT_IRQ is not set
# CONFIG_SERIAL_8250_RSA is not set
CONFIG_SERIAL_8250_FSL=y
# CONFIG_SERIAL_8250_DW is not set
# CONFIG_SERIAL_8250_RT288X is not set
CONFIG_SERIAL_8250_PERICOM=y
# CONFIG_SERIAL_OF_PLATFORM is not set

#
# Non-8250 serial port support
#
# CONFIG_SERIAL_UARTLITE is not set
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
CONFIG_SERIAL_CPM=y
CONFIG_SERIAL_CPM_CONSOLE=y
# CONFIG_SERIAL_JSM is not set
# CONFIG_SERIAL_SIFIVE is not set
# CONFIG_SERIAL_SCCNXP is not set
# CONFIG_SERIAL_SC16IS7XX is not set
# CONFIG_SERIAL_ALTERA_JTAGUART is not set
# CONFIG_SERIAL_ALTERA_UART is not set
# CONFIG_SERIAL_XILINX_PS_UART is not set
# CONFIG_SERIAL_ARC is not set
# CONFIG_SERIAL_RP2 is not set
# CONFIG_SERIAL_FSL_LPUART is not set
# CONFIG_SERIAL_FSL_LINFLEXUART is not set
# CONFIG_SERIAL_CONEXANT_DIGICOLOR is not set
# end of Serial drivers

CONFIG_SERIAL_MCTRL_GPIO=y
# CONFIG_SERIAL_NONSTANDARD is not set
# CONFIG_PPC_EPAPR_HV_BYTECHAN is not set
# CONFIG_N_GSM is not set
# CONFIG_NOZOMI is not set
# CONFIG_NULL_TTY is not set
# CONFIG_HVC_UDBG is not set
# CONFIG_SERIAL_DEV_BUS is not set
# CONFIG_TTY_PRINTK is not set
# CONFIG_VIRTIO_CONSOLE is not set
# CONFIG_IPMI_HANDLER is not set
CONFIG_HW_RANDOM=y
# CONFIG_HW_RANDOM_TIMERIOMEM is not set
# CONFIG_HW_RANDOM_BA431 is not set
# CONFIG_HW_RANDOM_CCTRNG is not set
# CONFIG_HW_RANDOM_XIPHERA is not set
# CONFIG_APPLICOM is not set
CONFIG_DEVMEM=y
CONFIG_NVRAM=y
CONFIG_DEVPORT=y
# CONFIG_TCG_TPM is not set
# CONFIG_XILLYBUS is not set
CONFIG_RANDOM_TRUST_CPU=y
CONFIG_RANDOM_TRUST_BOOTLOADER=y
# end of Character devices

#
# I2C support
#
CONFIG_I2C=y
CONFIG_I2C_BOARDINFO=y
CONFIG_I2C_COMPAT=y
CONFIG_I2C_CHARDEV=y
# CONFIG_I2C_MUX is not set
CONFIG_I2C_HELPER_AUTO=y

#
# I2C Hardware Bus support
#

#
# PC SMBus host controller drivers
#
# CONFIG_I2C_ALI1535 is not set
# CONFIG_I2C_ALI1563 is not set
# CONFIG_I2C_ALI15X3 is not set
# CONFIG_I2C_AMD756 is not set
# CONFIG_I2C_AMD8111 is not set
# CONFIG_I2C_I801 is not set
# CONFIG_I2C_ISCH is not set
# CONFIG_I2C_PIIX4 is not set
# CONFIG_I2C_NFORCE2 is not set
# CONFIG_I2C_NVIDIA_GPU is not set
# CONFIG_I2C_SIS5595 is not set
# CONFIG_I2C_SIS630 is not set
# CONFIG_I2C_SIS96X is not set
# CONFIG_I2C_VIA is not set
# CONFIG_I2C_VIAPRO is not set

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
# CONFIG_I2C_CBUS_GPIO is not set
# CONFIG_I2C_CPM is not set
# CONFIG_I2C_DESIGNWARE_PLATFORM is not set
# CONFIG_I2C_DESIGNWARE_PCI is not set
# CONFIG_I2C_GPIO is not set
CONFIG_I2C_MPC=y
# CONFIG_I2C_OCORES is not set
# CONFIG_I2C_PCA_PLATFORM is not set
# CONFIG_I2C_SIMTEC is not set
# CONFIG_I2C_XILINX is not set

#
# External I2C/SMBus adapter drivers
#
# CONFIG_I2C_TAOS_EVM is not set

#
# Other I2C/SMBus bus drivers
#
# CONFIG_I2C_VIRTIO is not set
# end of I2C Hardware Bus support

# CONFIG_I2C_SLAVE is not set
# CONFIG_I2C_DEBUG_CORE is not set
# CONFIG_I2C_DEBUG_ALGO is not set
# CONFIG_I2C_DEBUG_BUS is not set
# end of I2C support

# CONFIG_I3C is not set
# CONFIG_SPI is not set
# CONFIG_SPMI is not set
# CONFIG_HSI is not set
CONFIG_PPS=y
# CONFIG_PPS_DEBUG is not set
# CONFIG_NTP_PPS is not set

#
# PPS clients support
#
# CONFIG_PPS_CLIENT_KTIMER is not set
# CONFIG_PPS_CLIENT_LDISC is not set
# CONFIG_PPS_CLIENT_GPIO is not set

#
# PPS generators support
#

#
# PTP clock support
#
CONFIG_PTP_1588_CLOCK=y
CONFIG_PTP_1588_CLOCK_OPTIONAL=y
CONFIG_PTP_1588_CLOCK_QORIQ=y

#
# Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
#
# CONFIG_PTP_1588_CLOCK_IDT82P33 is not set
# CONFIG_PTP_1588_CLOCK_IDTCM is not set
# end of PTP clock support

# CONFIG_PINCTRL is not set
CONFIG_GPIOLIB=y
CONFIG_GPIOLIB_FASTPATH_LIMIT=512
CONFIG_OF_GPIO=y
# CONFIG_DEBUG_GPIO is not set
# CONFIG_GPIO_SYSFS is not set
CONFIG_GPIO_CDEV=y
CONFIG_GPIO_CDEV_V1=y

#
# Memory mapped GPIO drivers
#
# CONFIG_GPIO_74XX_MMIO is not set
# CONFIG_GPIO_ALTERA is not set
# CONFIG_GPIO_CADENCE is not set
# CONFIG_GPIO_DWAPB is not set
# CONFIG_GPIO_EXAR is not set
# CONFIG_GPIO_FTGPIO010 is not set
# CONFIG_GPIO_GENERIC_PLATFORM is not set
# CONFIG_GPIO_GRGPIO is not set
# CONFIG_GPIO_HLWD is not set
# CONFIG_GPIO_MB86S7X is not set
# CONFIG_GPIO_MPC8XXX is not set
# CONFIG_GPIO_SIFIVE is not set
# CONFIG_GPIO_XILINX is not set
# CONFIG_GPIO_AMD_FCH is not set
# end of Memory mapped GPIO drivers

#
# I2C GPIO expanders
#
# CONFIG_GPIO_ADP5588 is not set
# CONFIG_GPIO_ADNP is not set
# CONFIG_GPIO_GW_PLD is not set
# CONFIG_GPIO_MAX7300 is not set
# CONFIG_GPIO_MAX732X is not set
# CONFIG_GPIO_PCA953X is not set
# CONFIG_GPIO_PCA9570 is not set
# CONFIG_GPIO_PCF857X is not set
# CONFIG_GPIO_TPIC2810 is not set
# end of I2C GPIO expanders

#
# MFD GPIO expanders
#
# end of MFD GPIO expanders

#
# PCI GPIO expanders
#
# CONFIG_GPIO_BT8XX is not set
# CONFIG_GPIO_PCI_IDIO_16 is not set
# CONFIG_GPIO_PCIE_IDIO_24 is not set
# CONFIG_GPIO_RDC321X is not set
# end of PCI GPIO expanders

#
# Virtual GPIO drivers
#
# CONFIG_GPIO_AGGREGATOR is not set
# CONFIG_GPIO_MOCKUP is not set
# CONFIG_GPIO_SIM is not set
# end of Virtual GPIO drivers

# CONFIG_W1 is not set
# CONFIG_POWER_RESET is not set
# CONFIG_POWER_SUPPLY is not set
CONFIG_HWMON=y
CONFIG_HWMON_DEBUG_CHIP=y

#
# Native drivers
#
# CONFIG_SENSORS_AD7414 is not set
# CONFIG_SENSORS_AD7418 is not set
# CONFIG_SENSORS_ADM1021 is not set
# CONFIG_SENSORS_ADM1025 is not set
# CONFIG_SENSORS_ADM1026 is not set
# CONFIG_SENSORS_ADM1029 is not set
# CONFIG_SENSORS_ADM1031 is not set
# CONFIG_SENSORS_ADM1177 is not set
# CONFIG_SENSORS_ADM9240 is not set
# CONFIG_SENSORS_ADT7410 is not set
# CONFIG_SENSORS_ADT7411 is not set
# CONFIG_SENSORS_ADT7462 is not set
# CONFIG_SENSORS_ADT7470 is not set
# CONFIG_SENSORS_ADT7475 is not set
# CONFIG_SENSORS_AHT10 is not set
# CONFIG_SENSORS_AS370 is not set
# CONFIG_SENSORS_ASC7621 is not set
# CONFIG_SENSORS_AXI_FAN_CONTROL is not set
# CONFIG_SENSORS_ASPEED is not set
# CONFIG_SENSORS_ATXP1 is not set
# CONFIG_SENSORS_CORSAIR_CPRO is not set
# CONFIG_SENSORS_CORSAIR_PSU is not set
# CONFIG_SENSORS_DRIVETEMP is not set
# CONFIG_SENSORS_DS620 is not set
# CONFIG_SENSORS_DS1621 is not set
# CONFIG_SENSORS_I5K_AMB is not set
# CONFIG_SENSORS_F75375S is not set
# CONFIG_SENSORS_GL518SM is not set
# CONFIG_SENSORS_GL520SM is not set
# CONFIG_SENSORS_G760A is not set
# CONFIG_SENSORS_G762 is not set
# CONFIG_SENSORS_GPIO_FAN is not set
# CONFIG_SENSORS_HIH6130 is not set
# CONFIG_SENSORS_JC42 is not set
# CONFIG_SENSORS_POWR1220 is not set
# CONFIG_SENSORS_LINEAGE is not set
# CONFIG_SENSORS_LTC2945 is not set
# CONFIG_SENSORS_LTC2947_I2C is not set
# CONFIG_SENSORS_LTC2990 is not set
# CONFIG_SENSORS_LTC2992 is not set
# CONFIG_SENSORS_LTC4151 is not set
# CONFIG_SENSORS_LTC4215 is not set
# CONFIG_SENSORS_LTC4222 is not set
# CONFIG_SENSORS_LTC4245 is not set
# CONFIG_SENSORS_LTC4260 is not set
# CONFIG_SENSORS_LTC4261 is not set
# CONFIG_SENSORS_MAX127 is not set
# CONFIG_SENSORS_MAX16065 is not set
# CONFIG_SENSORS_MAX1619 is not set
# CONFIG_SENSORS_MAX1668 is not set
# CONFIG_SENSORS_MAX197 is not set
# CONFIG_SENSORS_MAX31730 is not set
# CONFIG_SENSORS_MAX6620 is not set
# CONFIG_SENSORS_MAX6621 is not set
# CONFIG_SENSORS_MAX6639 is not set
# CONFIG_SENSORS_MAX6642 is not set
# CONFIG_SENSORS_MAX6650 is not set
# CONFIG_SENSORS_MAX6697 is not set
# CONFIG_SENSORS_MAX31790 is not set
# CONFIG_SENSORS_MCP3021 is not set
# CONFIG_SENSORS_TC654 is not set
# CONFIG_SENSORS_TPS23861 is not set
# CONFIG_SENSORS_MR75203 is not set
# CONFIG_SENSORS_LM63 is not set
# CONFIG_SENSORS_LM73 is not set
CONFIG_SENSORS_LM75=y
# CONFIG_SENSORS_LM77 is not set
# CONFIG_SENSORS_LM78 is not set
# CONFIG_SENSORS_LM80 is not set
# CONFIG_SENSORS_LM83 is not set
# CONFIG_SENSORS_LM85 is not set
# CONFIG_SENSORS_LM87 is not set
# CONFIG_SENSORS_LM90 is not set
# CONFIG_SENSORS_LM92 is not set
# CONFIG_SENSORS_LM93 is not set
# CONFIG_SENSORS_LM95234 is not set
# CONFIG_SENSORS_LM95241 is not set
# CONFIG_SENSORS_LM95245 is not set
# CONFIG_SENSORS_NCT6775_I2C is not set
# CONFIG_SENSORS_NCT7802 is not set
# CONFIG_SENSORS_NPCM7XX is not set
# CONFIG_SENSORS_PCF8591 is not set
# CONFIG_PMBUS is not set
# CONFIG_SENSORS_SBTSI is not set
# CONFIG_SENSORS_SBRMI is not set
# CONFIG_SENSORS_SHT15 is not set
# CONFIG_SENSORS_SHT21 is not set
# CONFIG_SENSORS_SHT3x is not set
# CONFIG_SENSORS_SHT4x is not set
# CONFIG_SENSORS_SHTC1 is not set
# CONFIG_SENSORS_SIS5595 is not set
# CONFIG_SENSORS_SY7636A is not set
# CONFIG_SENSORS_EMC1403 is not set
# CONFIG_SENSORS_EMC2103 is not set
# CONFIG_SENSORS_EMC6W201 is not set
# CONFIG_SENSORS_SMSC47M192 is not set
# CONFIG_SENSORS_STTS751 is not set
# CONFIG_SENSORS_SMM665 is not set
# CONFIG_SENSORS_ADC128D818 is not set
# CONFIG_SENSORS_ADS7828 is not set
# CONFIG_SENSORS_AMC6821 is not set
# CONFIG_SENSORS_INA209 is not set
# CONFIG_SENSORS_INA2XX is not set
# CONFIG_SENSORS_INA238 is not set
# CONFIG_SENSORS_INA3221 is not set
# CONFIG_SENSORS_TC74 is not set
# CONFIG_SENSORS_THMC50 is not set
# CONFIG_SENSORS_TMP102 is not set
# CONFIG_SENSORS_TMP103 is not set
# CONFIG_SENSORS_TMP108 is not set
# CONFIG_SENSORS_TMP401 is not set
# CONFIG_SENSORS_TMP421 is not set
# CONFIG_SENSORS_TMP464 is not set
# CONFIG_SENSORS_TMP513 is not set
# CONFIG_SENSORS_VIA686A is not set
# CONFIG_SENSORS_VT8231 is not set
# CONFIG_SENSORS_W83773G is not set
# CONFIG_SENSORS_W83781D is not set
# CONFIG_SENSORS_W83791D is not set
# CONFIG_SENSORS_W83792D is not set
# CONFIG_SENSORS_W83793 is not set
# CONFIG_SENSORS_W83795 is not set
# CONFIG_SENSORS_W83L785TS is not set
# CONFIG_SENSORS_W83L786NG is not set
# CONFIG_THERMAL is not set
# CONFIG_WATCHDOG is not set
CONFIG_SSB_POSSIBLE=y
# CONFIG_SSB is not set
CONFIG_BCMA_POSSIBLE=y
# CONFIG_BCMA is not set

#
# Multifunction device drivers
#
# CONFIG_MFD_ACT8945A is not set
# CONFIG_MFD_AS3711 is not set
# CONFIG_MFD_AS3722 is not set
# CONFIG_PMIC_ADP5520 is not set
# CONFIG_MFD_AAT2870_CORE is not set
# CONFIG_MFD_ATMEL_FLEXCOM is not set
# CONFIG_MFD_ATMEL_HLCDC is not set
# CONFIG_MFD_BCM590XX is not set
# CONFIG_MFD_BD9571MWV is not set
# CONFIG_MFD_AXP20X_I2C is not set
# CONFIG_MFD_MADERA is not set
# CONFIG_PMIC_DA903X is not set
# CONFIG_MFD_DA9052_I2C is not set
# CONFIG_MFD_DA9055 is not set
# CONFIG_MFD_DA9062 is not set
# CONFIG_MFD_DA9063 is not set
# CONFIG_MFD_DA9150 is not set
# CONFIG_MFD_GATEWORKS_GSC is not set
# CONFIG_MFD_MC13XXX_I2C is not set
# CONFIG_MFD_MP2629 is not set
# CONFIG_MFD_HI6421_PMIC is not set
# CONFIG_HTC_PASIC3 is not set
# CONFIG_HTC_I2CPLD is not set
# CONFIG_LPC_ICH is not set
# CONFIG_LPC_SCH is not set
# CONFIG_MFD_IQS62X is not set
# CONFIG_MFD_JANZ_CMODIO is not set
# CONFIG_MFD_KEMPLD is not set
# CONFIG_MFD_88PM800 is not set
# CONFIG_MFD_88PM805 is not set
# CONFIG_MFD_88PM860X is not set
# CONFIG_MFD_MAX14577 is not set
# CONFIG_MFD_MAX77620 is not set
# CONFIG_MFD_MAX77650 is not set
# CONFIG_MFD_MAX77686 is not set
# CONFIG_MFD_MAX77693 is not set
# CONFIG_MFD_MAX77714 is not set
# CONFIG_MFD_MAX77843 is not set
# CONFIG_MFD_MAX8907 is not set
# CONFIG_MFD_MAX8925 is not set
# CONFIG_MFD_MAX8997 is not set
# CONFIG_MFD_MAX8998 is not set
# CONFIG_MFD_MT6360 is not set
# CONFIG_MFD_MT6397 is not set
# CONFIG_MFD_MENF21BMC is not set
# CONFIG_MFD_NTXEC is not set
# CONFIG_MFD_RETU is not set
# CONFIG_MFD_PCF50633 is not set
# CONFIG_MFD_RDC321X is not set
# CONFIG_MFD_RT4831 is not set
# CONFIG_MFD_RT5033 is not set
# CONFIG_MFD_RC5T583 is not set
# CONFIG_MFD_RK808 is not set
# CONFIG_MFD_RN5T618 is not set
# CONFIG_MFD_SEC_CORE is not set
# CONFIG_MFD_SI476X_CORE is not set
# CONFIG_MFD_SIMPLE_MFD_I2C is not set
# CONFIG_MFD_SM501 is not set
# CONFIG_MFD_SKY81452 is not set
# CONFIG_MFD_STMPE is not set
# CONFIG_MFD_SYSCON is not set
# CONFIG_MFD_TI_AM335X_TSCADC is not set
# CONFIG_MFD_LP3943 is not set
# CONFIG_MFD_LP8788 is not set
# CONFIG_MFD_TI_LMU is not set
# CONFIG_MFD_PALMAS is not set
# CONFIG_TPS6105X is not set
# CONFIG_TPS65010 is not set
# CONFIG_TPS6507X is not set
# CONFIG_MFD_TPS65086 is not set
# CONFIG_MFD_TPS65090 is not set
# CONFIG_MFD_TPS65217 is not set
# CONFIG_MFD_TI_LP873X is not set
# CONFIG_MFD_TI_LP87565 is not set
# CONFIG_MFD_TPS65218 is not set
# CONFIG_MFD_TPS6586X is not set
# CONFIG_MFD_TPS65910 is not set
# CONFIG_MFD_TPS65912_I2C is not set
# CONFIG_TWL4030_CORE is not set
# CONFIG_TWL6040_CORE is not set
# CONFIG_MFD_WL1273_CORE is not set
# CONFIG_MFD_LM3533 is not set
# CONFIG_MFD_TC3589X is not set
# CONFIG_MFD_TQMX86 is not set
# CONFIG_MFD_VX855 is not set
# CONFIG_MFD_LOCHNAGAR is not set
# CONFIG_MFD_ARIZONA_I2C is not set
# CONFIG_MFD_WM8400 is not set
# CONFIG_MFD_WM831X_I2C is not set
# CONFIG_MFD_WM8350_I2C is not set
# CONFIG_MFD_WM8994 is not set
# CONFIG_MFD_ROHM_BD718XX is not set
# CONFIG_MFD_ROHM_BD71828 is not set
# CONFIG_MFD_ROHM_BD957XMUF is not set
# CONFIG_MFD_STPMIC1 is not set
# CONFIG_MFD_STMFX is not set
# CONFIG_MFD_ATC260X_I2C is not set
# CONFIG_MFD_QCOM_PM8008 is not set
# CONFIG_MFD_RSMU_I2C is not set
# end of Multifunction device drivers

# CONFIG_REGULATOR is not set
# CONFIG_RC_CORE is not set

#
# CEC support
#
# CONFIG_MEDIA_CEC_SUPPORT is not set
# end of CEC support

# CONFIG_MEDIA_SUPPORT is not set

#
# Graphics support
#
# CONFIG_AGP is not set
# CONFIG_DRM is not set
# CONFIG_DRM_DEBUG_MODESET_LOCK is not set

#
# ARM devices
#
# end of ARM devices

#
# Frame buffer Devices
#
# CONFIG_FB is not set
# end of Frame buffer Devices

#
# Backlight & LCD device support
#
# CONFIG_LCD_CLASS_DEVICE is not set
# CONFIG_BACKLIGHT_CLASS_DEVICE is not set
# end of Backlight & LCD device support
# end of Graphics support

# CONFIG_SOUND is not set

#
# HID support
#
CONFIG_HID=y
# CONFIG_HID_BATTERY_STRENGTH is not set
# CONFIG_HIDRAW is not set
# CONFIG_UHID is not set
CONFIG_HID_GENERIC=y

#
# Special HID drivers
#
# CONFIG_HID_A4TECH is not set
# CONFIG_HID_ACRUX is not set
# CONFIG_HID_AUREAL is not set
# CONFIG_HID_BELKIN is not set
# CONFIG_HID_CHERRY is not set
# CONFIG_HID_COUGAR is not set
# CONFIG_HID_MACALLY is not set
# CONFIG_HID_CMEDIA is not set
# CONFIG_HID_CYPRESS is not set
# CONFIG_HID_DRAGONRISE is not set
# CONFIG_HID_EMS_FF is not set
# CONFIG_HID_ELECOM is not set
# CONFIG_HID_EZKEY is not set
# CONFIG_HID_GEMBIRD is not set
# CONFIG_HID_GFRM is not set
# CONFIG_HID_GLORIOUS is not set
# CONFIG_HID_VIVALDI is not set
# CONFIG_HID_KEYTOUCH is not set
# CONFIG_HID_KYE is not set
# CONFIG_HID_WALTOP is not set
# CONFIG_HID_VIEWSONIC is not set
# CONFIG_HID_XIAOMI is not set
# CONFIG_HID_GYRATION is not set
# CONFIG_HID_ICADE is not set
# CONFIG_HID_ITE is not set
# CONFIG_HID_JABRA is not set
# CONFIG_HID_TWINHAN is not set
# CONFIG_HID_KENSINGTON is not set
# CONFIG_HID_LCPOWER is not set
# CONFIG_HID_LENOVO is not set
# CONFIG_HID_MAGICMOUSE is not set
# CONFIG_HID_MALTRON is not set
# CONFIG_HID_MAYFLASH is not set
# CONFIG_HID_REDRAGON is not set
# CONFIG_HID_MICROSOFT is not set
# CONFIG_HID_MONTEREY is not set
# CONFIG_HID_MULTITOUCH is not set
# CONFIG_HID_NTI is not set
# CONFIG_HID_ORTEK is not set
# CONFIG_HID_PANTHERLORD is not set
# CONFIG_HID_PETALYNX is not set
# CONFIG_HID_PICOLCD is not set
# CONFIG_HID_PLANTRONICS is not set
# CONFIG_HID_RAZER is not set
# CONFIG_HID_PRIMAX is not set
# CONFIG_HID_SAITEK is not set
# CONFIG_HID_SEMITEK is not set
# CONFIG_HID_SPEEDLINK is not set
# CONFIG_HID_STEAM is not set
# CONFIG_HID_STEELSERIES is not set
# CONFIG_HID_SUNPLUS is not set
# CONFIG_HID_RMI is not set
# CONFIG_HID_GREENASIA is not set
# CONFIG_HID_SMARTJOYPLUS is not set
# CONFIG_HID_TIVO is not set
# CONFIG_HID_TOPSEED is not set
# CONFIG_HID_UDRAW_PS3 is not set
# CONFIG_HID_XINMO is not set
# CONFIG_HID_ZEROPLUS is not set
# CONFIG_HID_ZYDACRON is not set
# CONFIG_HID_SENSOR_HUB is not set
# CONFIG_HID_ALPS is not set
# end of Special HID drivers

#
# I2C HID support
#
# CONFIG_I2C_HID_OF is not set
# CONFIG_I2C_HID_OF_ELAN is not set
# CONFIG_I2C_HID_OF_GOODIX is not set
# end of I2C HID support
# end of HID support

CONFIG_USB_OHCI_LITTLE_ENDIAN=y
CONFIG_USB_SUPPORT=y
# CONFIG_USB_ULPI_BUS is not set
# CONFIG_USB_CONN_GPIO is not set
CONFIG_USB_ARCH_HAS_HCD=y
# CONFIG_USB is not set
CONFIG_USB_PCI=y

#
# USB port drivers
#

#
# USB Physical Layer drivers
#
# CONFIG_NOP_USB_XCEIV is not set
# CONFIG_USB_GPIO_VBUS is not set
# end of USB Physical Layer drivers

# CONFIG_USB_GADGET is not set
# CONFIG_TYPEC is not set
# CONFIG_USB_ROLE_SWITCH is not set
# CONFIG_MMC is not set
# CONFIG_SCSI_UFSHCD is not set
# CONFIG_MEMSTICK is not set
# CONFIG_NEW_LEDS is not set
# CONFIG_ACCESSIBILITY is not set
# CONFIG_INFINIBAND is not set
CONFIG_EDAC_ATOMIC_SCRUB=y
CONFIG_EDAC_SUPPORT=y
CONFIG_RTC_LIB=y
CONFIG_RTC_CLASS=y
CONFIG_RTC_HCTOSYS=y
CONFIG_RTC_HCTOSYS_DEVICE="rtc0"
CONFIG_RTC_SYSTOHC=y
CONFIG_RTC_SYSTOHC_DEVICE="rtc0"
# CONFIG_RTC_DEBUG is not set
CONFIG_RTC_NVMEM=y

#
# RTC interfaces
#
CONFIG_RTC_INTF_SYSFS=y
CONFIG_RTC_INTF_PROC=y
CONFIG_RTC_INTF_DEV=y
# CONFIG_RTC_INTF_DEV_UIE_EMUL is not set
# CONFIG_RTC_DRV_TEST is not set

#
# I2C RTC drivers
#
# CONFIG_RTC_DRV_ABB5ZES3 is not set
# CONFIG_RTC_DRV_ABEOZ9 is not set
# CONFIG_RTC_DRV_ABX80X is not set
# CONFIG_RTC_DRV_DS1307 is not set
# CONFIG_RTC_DRV_DS1374 is not set
# CONFIG_RTC_DRV_DS1672 is not set
# CONFIG_RTC_DRV_HYM8563 is not set
# CONFIG_RTC_DRV_MAX6900 is not set
# CONFIG_RTC_DRV_NCT3018Y is not set
# CONFIG_RTC_DRV_RS5C372 is not set
# CONFIG_RTC_DRV_ISL1208 is not set
# CONFIG_RTC_DRV_ISL12022 is not set
# CONFIG_RTC_DRV_ISL12026 is not set
# CONFIG_RTC_DRV_X1205 is not set
# CONFIG_RTC_DRV_PCF8523 is not set
# CONFIG_RTC_DRV_PCF85063 is not set
# CONFIG_RTC_DRV_PCF85363 is not set
# CONFIG_RTC_DRV_PCF8563 is not set
# CONFIG_RTC_DRV_PCF8583 is not set
# CONFIG_RTC_DRV_M41T80 is not set
# CONFIG_RTC_DRV_BQ32K is not set
# CONFIG_RTC_DRV_S35390A is not set
# CONFIG_RTC_DRV_FM3130 is not set
# CONFIG_RTC_DRV_RX8010 is not set
# CONFIG_RTC_DRV_RX8581 is not set
# CONFIG_RTC_DRV_RX8025 is not set
# CONFIG_RTC_DRV_EM3027 is not set
# CONFIG_RTC_DRV_RV3028 is not set
# CONFIG_RTC_DRV_RV3032 is not set
# CONFIG_RTC_DRV_RV8803 is not set
# CONFIG_RTC_DRV_SD3078 is not set

#
# SPI RTC drivers
#
CONFIG_RTC_I2C_AND_SPI=y

#
# SPI and I2C RTC drivers
#
# CONFIG_RTC_DRV_DS3232 is not set
# CONFIG_RTC_DRV_PCF2127 is not set
# CONFIG_RTC_DRV_RV3029C2 is not set
# CONFIG_RTC_DRV_RX6110 is not set

#
# Platform RTC drivers
#
# CONFIG_RTC_DRV_CMOS is not set
# CONFIG_RTC_DRV_DS1286 is not set
# CONFIG_RTC_DRV_DS1511 is not set
# CONFIG_RTC_DRV_DS1553 is not set
# CONFIG_RTC_DRV_DS1685_FAMILY is not set
# CONFIG_RTC_DRV_DS1742 is not set
# CONFIG_RTC_DRV_DS2404 is not set
# CONFIG_RTC_DRV_STK17TA8 is not set
# CONFIG_RTC_DRV_M48T86 is not set
# CONFIG_RTC_DRV_M48T35 is not set
# CONFIG_RTC_DRV_M48T59 is not set
# CONFIG_RTC_DRV_MSM6242 is not set
# CONFIG_RTC_DRV_BQ4802 is not set
# CONFIG_RTC_DRV_RP5C01 is not set
# CONFIG_RTC_DRV_V3020 is not set
# CONFIG_RTC_DRV_ZYNQMP is not set

#
# on-CPU RTC drivers
#
CONFIG_RTC_DRV_GENERIC=y
# CONFIG_RTC_DRV_CADENCE is not set
# CONFIG_RTC_DRV_FTRTC010 is not set
# CONFIG_RTC_DRV_R7301 is not set

#
# HID Sensor RTC drivers
#
# CONFIG_RTC_DRV_GOLDFISH is not set
# CONFIG_DMADEVICES is not set

#
# DMABUF options
#
# CONFIG_SYNC_FILE is not set
# CONFIG_DMABUF_HEAPS is not set
# end of DMABUF options

# CONFIG_AUXDISPLAY is not set
# CONFIG_UIO is not set
# CONFIG_VFIO is not set
# CONFIG_VIRT_DRIVERS is not set
CONFIG_VIRTIO_MENU=y
# CONFIG_VIRTIO_PCI is not set
# CONFIG_VIRTIO_MMIO is not set
# CONFIG_VDPA is not set
CONFIG_VHOST_MENU=y
# CONFIG_VHOST_NET is not set
# CONFIG_VHOST_CROSS_ENDIAN_LEGACY is not set

#
# Microsoft Hyper-V guest support
#
# end of Microsoft Hyper-V guest support

# CONFIG_GREYBUS is not set
# CONFIG_COMEDI is not set
# CONFIG_STAGING is not set
# CONFIG_GOLDFISH is not set
# CONFIG_COMMON_CLK is not set
# CONFIG_HWSPINLOCK is not set

#
# Clock Source drivers
#
# CONFIG_MICROCHIP_PIT64B is not set
# end of Clock Source drivers

# CONFIG_MAILBOX is not set
CONFIG_IOMMU_SUPPORT=y

#
# Generic IOMMU Pagetable Support
#
# end of Generic IOMMU Pagetable Support

#
# Remoteproc drivers
#
# CONFIG_REMOTEPROC is not set
# end of Remoteproc drivers

#
# Rpmsg drivers
#
# CONFIG_RPMSG_VIRTIO is not set
# end of Rpmsg drivers

# CONFIG_SOUNDWIRE is not set

#
# SOC (System On Chip) specific Drivers
#

#
# Amlogic SoC drivers
#
# end of Amlogic SoC drivers

#
# Broadcom SoC drivers
#
# end of Broadcom SoC drivers

#
# NXP/Freescale QorIQ SoC drivers
#
# CONFIG_QUICC_ENGINE is not set
# end of NXP/Freescale QorIQ SoC drivers

#
# fujitsu SoC drivers
#
# end of fujitsu SoC drivers

#
# i.MX SoC drivers
#
# end of i.MX SoC drivers

#
# Enable LiteX SoC Builder specific drivers
#
# CONFIG_LITEX_SOC_CONTROLLER is not set
# end of Enable LiteX SoC Builder specific drivers

#
# Qualcomm SoC drivers
#
# end of Qualcomm SoC drivers

# CONFIG_SOC_TI is not set

#
# Xilinx SoC drivers
#
# end of Xilinx SoC drivers
# end of SOC (System On Chip) specific Drivers

# CONFIG_PM_DEVFREQ is not set
# CONFIG_EXTCON is not set
# CONFIG_MEMORY is not set
# CONFIG_IIO is not set
# CONFIG_NTB is not set
# CONFIG_PWM is not set

#
# IRQ chip support
#
CONFIG_IRQCHIP=y
# CONFIG_AL_FIC is not set
# CONFIG_XILINX_INTC is not set
# end of IRQ chip support

# CONFIG_IPACK_BUS is not set
# CONFIG_RESET_CONTROLLER is not set

#
# PHY Subsystem
#
# CONFIG_GENERIC_PHY is not set
# CONFIG_PHY_CAN_TRANSCEIVER is not set

#
# PHY drivers for Broadcom platforms
#
# CONFIG_BCM_KONA_USB2_PHY is not set
# end of PHY drivers for Broadcom platforms

# CONFIG_PHY_CADENCE_DPHY is not set
# CONFIG_PHY_CADENCE_DPHY_RX is not set
# CONFIG_PHY_CADENCE_SALVO is not set
# CONFIG_PHY_PXA_28NM_HSIC is not set
# CONFIG_PHY_PXA_28NM_USB2 is not set
# CONFIG_PHY_MAPPHONE_MDM6600 is not set
# end of PHY Subsystem

# CONFIG_POWERCAP is not set
# CONFIG_MCB is not set
# CONFIG_RAS is not set
# CONFIG_USB4 is not set

#
# Android
#
# CONFIG_ANDROID_BINDER_IPC is not set
# end of Android

# CONFIG_DAX is not set
CONFIG_NVMEM=y
CONFIG_NVMEM_SYSFS=y
# CONFIG_NVMEM_RMEM is not set

#
# HW tracing support
#
# CONFIG_STM is not set
# CONFIG_INTEL_TH is not set
# end of HW tracing support

# CONFIG_FPGA is not set
# CONFIG_FSI is not set
# CONFIG_SIOX is not set
# CONFIG_SLIMBUS is not set
# CONFIG_INTERCONNECT is not set
# CONFIG_COUNTER is not set
# CONFIG_PECI is not set
# CONFIG_HTE is not set
# end of Device Drivers

#
# File systems
#
# CONFIG_VALIDATE_FS_PARSER is not set
CONFIG_FS_IOMAP=y
CONFIG_EXT2_FS=y
# CONFIG_EXT2_FS_XATTR is not set
# CONFIG_EXT3_FS is not set
CONFIG_EXT4_FS=y
# CONFIG_EXT4_FS_POSIX_ACL is not set
# CONFIG_EXT4_FS_SECURITY is not set
# CONFIG_EXT4_DEBUG is not set
CONFIG_JBD2=y
# CONFIG_JBD2_DEBUG is not set
CONFIG_FS_MBCACHE=y
# CONFIG_REISERFS_FS is not set
# CONFIG_JFS_FS is not set
# CONFIG_XFS_FS is not set
# CONFIG_GFS2_FS is not set
# CONFIG_BTRFS_FS is not set
# CONFIG_NILFS2_FS is not set
# CONFIG_F2FS_FS is not set
CONFIG_EXPORTFS=y
# CONFIG_EXPORTFS_BLOCK_OPS is not set
CONFIG_FILE_LOCKING=y
# CONFIG_FS_ENCRYPTION is not set
# CONFIG_FS_VERITY is not set
CONFIG_FSNOTIFY=y
CONFIG_DNOTIFY=y
CONFIG_INOTIFY_USER=y
# CONFIG_FANOTIFY is not set
# CONFIG_QUOTA is not set
# CONFIG_AUTOFS4_FS is not set
# CONFIG_AUTOFS_FS is not set
# CONFIG_FUSE_FS is not set
# CONFIG_OVERLAY_FS is not set

#
# Caches
#
# CONFIG_FSCACHE is not set
# end of Caches

#
# CD-ROM/DVD Filesystems
#
# CONFIG_ISO9660_FS is not set
# CONFIG_UDF_FS is not set
# end of CD-ROM/DVD Filesystems

#
# DOS/FAT/EXFAT/NT Filesystems
#
# CONFIG_MSDOS_FS is not set
# CONFIG_VFAT_FS is not set
# CONFIG_EXFAT_FS is not set
# CONFIG_NTFS_FS is not set
# CONFIG_NTFS3_FS is not set
# end of DOS/FAT/EXFAT/NT Filesystems

#
# Pseudo filesystems
#
CONFIG_PROC_FS=y
CONFIG_PROC_KCORE=y
CONFIG_PROC_SYSCTL=y
CONFIG_PROC_PAGE_MONITOR=y
# CONFIG_PROC_CHILDREN is not set
CONFIG_KERNFS=y
CONFIG_SYSFS=y
CONFIG_TMPFS=y
# CONFIG_TMPFS_POSIX_ACL is not set
# CONFIG_TMPFS_XATTR is not set
CONFIG_MEMFD_CREATE=y
# CONFIG_CONFIGFS_FS is not set
# end of Pseudo filesystems

CONFIG_MISC_FILESYSTEMS=y
# CONFIG_ORANGEFS_FS is not set
# CONFIG_ADFS_FS is not set
# CONFIG_AFFS_FS is not set
# CONFIG_HFS_FS is not set
# CONFIG_HFSPLUS_FS is not set
# CONFIG_BEFS_FS is not set
# CONFIG_BFS_FS is not set
# CONFIG_EFS_FS is not set
CONFIG_JFFS2_FS=y
CONFIG_JFFS2_FS_DEBUG=0
CONFIG_JFFS2_FS_WRITEBUFFER=y
# CONFIG_JFFS2_FS_WBUF_VERIFY is not set
# CONFIG_JFFS2_SUMMARY is not set
# CONFIG_JFFS2_FS_XATTR is not set
# CONFIG_JFFS2_COMPRESSION_OPTIONS is not set
CONFIG_JFFS2_ZLIB=y
CONFIG_JFFS2_RTIME=y
CONFIG_CRAMFS=y
CONFIG_CRAMFS_BLOCKDEV=y
# CONFIG_CRAMFS_MTD is not set
# CONFIG_SQUASHFS is not set
# CONFIG_VXFS_FS is not set
# CONFIG_MINIX_FS is not set
# CONFIG_OMFS_FS is not set
# CONFIG_HPFS_FS is not set
# CONFIG_QNX4FS_FS is not set
# CONFIG_QNX6FS_FS is not set
# CONFIG_ROMFS_FS is not set
# CONFIG_PSTORE is not set
# CONFIG_SYSV_FS is not set
# CONFIG_UFS_FS is not set
# CONFIG_EROFS_FS is not set
CONFIG_NETWORK_FILESYSTEMS=y
CONFIG_NFS_FS=y
CONFIG_NFS_V2=y
CONFIG_NFS_V3=y
# CONFIG_NFS_V3_ACL is not set
# CONFIG_NFS_V4 is not set
# CONFIG_NFS_SWAP is not set
CONFIG_ROOT_NFS=y
CONFIG_NFS_DISABLE_UDP_SUPPORT=y
# CONFIG_NFSD is not set
CONFIG_GRACE_PERIOD=y
CONFIG_LOCKD=y
CONFIG_LOCKD_V4=y
CONFIG_NFS_COMMON=y
CONFIG_SUNRPC=y
# CONFIG_SUNRPC_DEBUG is not set
# CONFIG_CEPH_FS is not set
# CONFIG_CIFS is not set
# CONFIG_SMB_SERVER is not set
# CONFIG_CODA_FS is not set
# CONFIG_AFS_FS is not set
# CONFIG_NLS is not set
# CONFIG_UNICODE is not set
CONFIG_IO_WQ=y
# end of File systems

#
# Security options
#
# CONFIG_KEYS is not set
# CONFIG_SECURITY_DMESG_RESTRICT is not set
# CONFIG_SECURITY is not set
# CONFIG_SECURITYFS is not set
CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
# CONFIG_HARDENED_USERCOPY is not set
# CONFIG_FORTIFY_SOURCE is not set
# CONFIG_STATIC_USERMODEHELPER is not set
CONFIG_DEFAULT_SECURITY_DAC=y
CONFIG_LSM="landlock,lockdown,yama,loadpin,safesetid,integrity,bpf"

#
# Kernel hardening options
#

#
# Memory initialization
#
CONFIG_CC_HAS_AUTO_VAR_INIT_PATTERN=y
CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO=y
# CONFIG_INIT_STACK_NONE is not set
# CONFIG_INIT_STACK_ALL_PATTERN is not set
CONFIG_INIT_STACK_ALL_ZERO=y
# CONFIG_INIT_ON_ALLOC_DEFAULT_ON is not set
# CONFIG_INIT_ON_FREE_DEFAULT_ON is not set
CONFIG_CC_HAS_ZERO_CALL_USED_REGS=y
# CONFIG_ZERO_CALL_USED_REGS is not set
# end of Memory initialization

CONFIG_RANDSTRUCT_NONE=y
# CONFIG_RANDSTRUCT_FULL is not set
# CONFIG_RANDSTRUCT_PERFORMANCE is not set
# end of Kernel hardening options
# end of Security options

CONFIG_CRYPTO=y

#
# Crypto core or helper
#
CONFIG_CRYPTO_ALGAPI=y
CONFIG_CRYPTO_ALGAPI2=y
CONFIG_CRYPTO_HASH=y
CONFIG_CRYPTO_HASH2=y
# CONFIG_CRYPTO_MANAGER is not set
# CONFIG_CRYPTO_USER is not set
CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
# CONFIG_CRYPTO_NULL is not set
# CONFIG_CRYPTO_CRYPTD is not set
# CONFIG_CRYPTO_AUTHENC is not set
# CONFIG_CRYPTO_TEST is not set

#
# Public-key cryptography
#
# CONFIG_CRYPTO_RSA is not set
# CONFIG_CRYPTO_DH is not set
# CONFIG_CRYPTO_ECDH is not set
# CONFIG_CRYPTO_ECDSA is not set
# CONFIG_CRYPTO_ECRDSA is not set
# CONFIG_CRYPTO_SM2 is not set
# CONFIG_CRYPTO_CURVE25519 is not set

#
# Authenticated Encryption with Associated Data
#
# CONFIG_CRYPTO_CCM is not set
# CONFIG_CRYPTO_GCM is not set
# CONFIG_CRYPTO_CHACHA20POLY1305 is not set
# CONFIG_CRYPTO_AEGIS128 is not set
# CONFIG_CRYPTO_SEQIV is not set
# CONFIG_CRYPTO_ECHAINIV is not set

#
# Block modes
#
# CONFIG_CRYPTO_CBC is not set
# CONFIG_CRYPTO_CFB is not set
# CONFIG_CRYPTO_CTR is not set
# CONFIG_CRYPTO_CTS is not set
# CONFIG_CRYPTO_ECB is not set
# CONFIG_CRYPTO_LRW is not set
# CONFIG_CRYPTO_OFB is not set
# CONFIG_CRYPTO_PCBC is not set
# CONFIG_CRYPTO_XTS is not set
# CONFIG_CRYPTO_KEYWRAP is not set
# CONFIG_CRYPTO_ADIANTUM is not set
# CONFIG_CRYPTO_HCTR2 is not set
# CONFIG_CRYPTO_ESSIV is not set

#
# Hash modes
#
# CONFIG_CRYPTO_CMAC is not set
# CONFIG_CRYPTO_HMAC is not set
# CONFIG_CRYPTO_XCBC is not set
# CONFIG_CRYPTO_VMAC is not set

#
# Digest
#
CONFIG_CRYPTO_CRC32C=y
# CONFIG_CRYPTO_CRC32 is not set
# CONFIG_CRYPTO_XXHASH is not set
# CONFIG_CRYPTO_BLAKE2B is not set
# CONFIG_CRYPTO_CRCT10DIF is not set
# CONFIG_CRYPTO_GHASH is not set
# CONFIG_CRYPTO_POLY1305 is not set
# CONFIG_CRYPTO_MD4 is not set
# CONFIG_CRYPTO_MD5 is not set
# CONFIG_CRYPTO_MD5_PPC is not set
# CONFIG_CRYPTO_MICHAEL_MIC is not set
# CONFIG_CRYPTO_RMD160 is not set
# CONFIG_CRYPTO_SHA1 is not set
# CONFIG_CRYPTO_SHA1_PPC is not set
# CONFIG_CRYPTO_SHA1_PPC_SPE is not set
# CONFIG_CRYPTO_SHA256 is not set
# CONFIG_CRYPTO_SHA256_PPC_SPE is not set
# CONFIG_CRYPTO_SHA512 is not set
# CONFIG_CRYPTO_SHA3 is not set
# CONFIG_CRYPTO_SM3_GENERIC is not set
# CONFIG_CRYPTO_STREEBOG is not set
# CONFIG_CRYPTO_WP512 is not set

#
# Ciphers
#
# CONFIG_CRYPTO_AES is not set
# CONFIG_CRYPTO_AES_TI is not set
# CONFIG_CRYPTO_AES_PPC_SPE is not set
# CONFIG_CRYPTO_BLOWFISH is not set
# CONFIG_CRYPTO_CAMELLIA is not set
# CONFIG_CRYPTO_CAST5 is not set
# CONFIG_CRYPTO_CAST6 is not set
# CONFIG_CRYPTO_DES is not set
# CONFIG_CRYPTO_FCRYPT is not set
# CONFIG_CRYPTO_CHACHA20 is not set
# CONFIG_CRYPTO_ARIA is not set
# CONFIG_CRYPTO_SERPENT is not set
# CONFIG_CRYPTO_SM4_GENERIC is not set
# CONFIG_CRYPTO_TWOFISH is not set

#
# Compression
#
# CONFIG_CRYPTO_DEFLATE is not set
# CONFIG_CRYPTO_LZO is not set
# CONFIG_CRYPTO_842 is not set
# CONFIG_CRYPTO_LZ4 is not set
# CONFIG_CRYPTO_LZ4HC is not set
# CONFIG_CRYPTO_ZSTD is not set

#
# Random Number Generation
#
# CONFIG_CRYPTO_ANSI_CPRNG is not set
# CONFIG_CRYPTO_DRBG_MENU is not set
# CONFIG_CRYPTO_JITTERENTROPY is not set
# CONFIG_CRYPTO_USER_API_HASH is not set
# CONFIG_CRYPTO_USER_API_SKCIPHER is not set
# CONFIG_CRYPTO_USER_API_RNG is not set
# CONFIG_CRYPTO_USER_API_AEAD is not set
CONFIG_CRYPTO_HW=y
# CONFIG_CRYPTO_DEV_HIFN_795X is not set
# CONFIG_CRYPTO_DEV_FSL_CAAM is not set
# CONFIG_CRYPTO_DEV_TALITOS is not set
# CONFIG_CRYPTO_DEV_ATMEL_ECC is not set
# CONFIG_CRYPTO_DEV_ATMEL_SHA204A is not set
# CONFIG_CRYPTO_DEV_SAFEXCEL is not set
# CONFIG_CRYPTO_DEV_CCREE is not set
# CONFIG_CRYPTO_DEV_AMLOGIC_GXL is not set

#
# Certificates for signature checking
#
# end of Certificates for signature checking

#
# Library routines
#
# CONFIG_PACKING is not set
CONFIG_BITREVERSE=y
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_STRNLEN_USER=y
CONFIG_GENERIC_NET_UTILS=y
# CONFIG_CORDIC is not set
# CONFIG_PRIME_NUMBERS is not set
CONFIG_GENERIC_PCI_IOMAP=y

#
# Crypto library routines
#
CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC=y
# CONFIG_CRYPTO_LIB_CHACHA is not set
# CONFIG_CRYPTO_LIB_CURVE25519 is not set
CONFIG_CRYPTO_LIB_POLY1305_RSIZE=1
# CONFIG_CRYPTO_LIB_POLY1305 is not set
# CONFIG_CRYPTO_LIB_CHACHA20POLY1305 is not set
CONFIG_CRYPTO_LIB_SHA1=y
CONFIG_CRYPTO_LIB_SHA256=y
# end of Crypto library routines

CONFIG_LIB_MEMNEQ=y
# CONFIG_CRC_CCITT is not set
CONFIG_CRC16=y
# CONFIG_CRC_T10DIF is not set
# CONFIG_CRC64_ROCKSOFT is not set
# CONFIG_CRC_ITU_T is not set
CONFIG_CRC32=y
# CONFIG_CRC32_SELFTEST is not set
CONFIG_CRC32_SLICEBY8=y
# CONFIG_CRC32_SLICEBY4 is not set
# CONFIG_CRC32_SARWATE is not set
# CONFIG_CRC32_BIT is not set
# CONFIG_CRC64 is not set
# CONFIG_CRC4 is not set
# CONFIG_CRC7 is not set
# CONFIG_LIBCRC32C is not set
# CONFIG_CRC8 is not set
CONFIG_XXHASH=y
# CONFIG_RANDOM32_SELFTEST is not set
CONFIG_ZLIB_INFLATE=y
CONFIG_ZLIB_DEFLATE=y
CONFIG_LZO_DECOMPRESS=y
CONFIG_LZ4_DECOMPRESS=y
CONFIG_ZSTD_DECOMPRESS=y
CONFIG_XZ_DEC=y
CONFIG_XZ_DEC_X86=y
CONFIG_XZ_DEC_POWERPC=y
CONFIG_XZ_DEC_IA64=y
CONFIG_XZ_DEC_ARM=y
CONFIG_XZ_DEC_ARMTHUMB=y
CONFIG_XZ_DEC_SPARC=y
# CONFIG_XZ_DEC_MICROLZMA is not set
CONFIG_XZ_DEC_BCJ=y
# CONFIG_XZ_DEC_TEST is not set
CONFIG_DECOMPRESS_GZIP=y
CONFIG_DECOMPRESS_BZIP2=y
CONFIG_DECOMPRESS_LZMA=y
CONFIG_DECOMPRESS_XZ=y
CONFIG_DECOMPRESS_LZO=y
CONFIG_DECOMPRESS_LZ4=y
CONFIG_DECOMPRESS_ZSTD=y
CONFIG_GENERIC_ALLOCATOR=y
CONFIG_HAS_IOMEM=y
CONFIG_HAS_IOPORT_MAP=y
CONFIG_HAS_DMA=y
CONFIG_NEED_SG_DMA_LENGTH=y
CONFIG_ARCH_HAS_DMA_SET_MASK=y
CONFIG_DMA_DECLARE_COHERENT=y
# CONFIG_DMA_API_DEBUG is not set
CONFIG_DQL=y
CONFIG_GLOB=y
# CONFIG_GLOB_SELFTEST is not set
CONFIG_NLATTR=y
CONFIG_GENERIC_ATOMIC64=y
# CONFIG_IRQ_POLL is not set
CONFIG_LIBFDT=y
CONFIG_HAVE_GENERIC_VDSO=y
CONFIG_GENERIC_GETTIMEOFDAY=y
CONFIG_GENERIC_VDSO_TIME_NS=y
CONFIG_SG_POOL=y
CONFIG_ARCH_HAS_PMEM_API=y
CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE=y
CONFIG_ARCH_STACKWALK=y
CONFIG_STACKDEPOT=y
CONFIG_SBITMAP=y
# end of Library routines

#
# Kernel hacking
#

#
# printk and dmesg options
#
# CONFIG_PRINTK_TIME is not set
# CONFIG_PRINTK_CALLER is not set
# CONFIG_STACKTRACE_BUILD_ID is not set
CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
CONFIG_CONSOLE_LOGLEVEL_QUIET=4
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
# CONFIG_DYNAMIC_DEBUG is not set
# CONFIG_DYNAMIC_DEBUG_CORE is not set
CONFIG_SYMBOLIC_ERRNAME=y
CONFIG_DEBUG_BUGVERBOSE=y
# end of printk and dmesg options

CONFIG_DEBUG_KERNEL=y
CONFIG_DEBUG_MISC=y

#
# Compile-time checks and compiler options
#
CONFIG_DEBUG_INFO_NONE=y
# CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT is not set
# CONFIG_DEBUG_INFO_DWARF4 is not set
# CONFIG_DEBUG_INFO_DWARF5 is not set
CONFIG_FRAME_WARN=1024
# CONFIG_STRIP_ASM_SYMS is not set
# CONFIG_READABLE_ASM is not set
# CONFIG_HEADERS_INSTALL is not set
CONFIG_DEBUG_SECTION_MISMATCH=y
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
# CONFIG_DEBUG_FORCE_FUNCTION_ALIGN_64B is not set
# CONFIG_VMLINUX_MAP is not set
# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
# end of Compile-time checks and compiler options

#
# Generic Kernel Debugging Instruments
#
# CONFIG_MAGIC_SYSRQ is not set
# CONFIG_DEBUG_FS is not set
CONFIG_HAVE_ARCH_KGDB=y
# CONFIG_KGDB is not set
CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=y
# CONFIG_UBSAN is not set
CONFIG_HAVE_KCSAN_COMPILER=y
# end of Generic Kernel Debugging Instruments

#
# Networking Debugging
#
# CONFIG_NET_DEV_REFCNT_TRACKER is not set
# CONFIG_NET_NS_REFCNT_TRACKER is not set
# CONFIG_DEBUG_NET is not set
# end of Networking Debugging

#
# Memory Debugging
#
# CONFIG_PAGE_EXTENSION is not set
# CONFIG_DEBUG_PAGEALLOC is not set
CONFIG_SLUB_DEBUG=y
# CONFIG_SLUB_DEBUG_ON is not set
# CONFIG_PAGE_OWNER is not set
# CONFIG_PAGE_POISONING is not set
# CONFIG_DEBUG_RODATA_TEST is not set
CONFIG_ARCH_HAS_DEBUG_WX=y
# CONFIG_DEBUG_WX is not set
CONFIG_GENERIC_PTDUMP=y
# CONFIG_DEBUG_OBJECTS is not set
CONFIG_HAVE_DEBUG_KMEMLEAK=y
# CONFIG_DEBUG_KMEMLEAK is not set
# CONFIG_DEBUG_STACK_USAGE is not set
# CONFIG_SCHED_STACK_END_CHECK is not set
CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE=y
# CONFIG_DEBUG_VM is not set
# CONFIG_DEBUG_VM_PGTABLE is not set
CONFIG_ARCH_HAS_DEBUG_VIRTUAL=y
# CONFIG_DEBUG_VIRTUAL is not set
# CONFIG_DEBUG_MEMORY_INIT is not set
CONFIG_HAVE_DEBUG_STACKOVERFLOW=y
# CONFIG_DEBUG_STACKOVERFLOW is not set
CONFIG_HAVE_ARCH_KASAN=y
CONFIG_HAVE_ARCH_KASAN_VMALLOC=y
CONFIG_CC_HAS_KASAN_GENERIC=y
CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
# CONFIG_KASAN is not set
# end of Memory Debugging

# CONFIG_DEBUG_SHIRQ is not set

#
# Debug Oops, Lockups and Hangs
#
# CONFIG_PANIC_ON_OOPS is not set
CONFIG_PANIC_ON_OOPS_VALUE=0
# CONFIG_SOFTLOCKUP_DETECTOR is not set
# CONFIG_DETECT_HUNG_TASK is not set
# CONFIG_WQ_WATCHDOG is not set
# end of Debug Oops, Lockups and Hangs

#
# Scheduler Debugging
#
CONFIG_SCHED_DEBUG=y
# CONFIG_SCHEDSTATS is not set
# end of Scheduler Debugging

# CONFIG_DEBUG_TIMEKEEPING is not set

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
CONFIG_LOCK_DEBUGGING_SUPPORT=y
# CONFIG_PROVE_LOCKING is not set
# CONFIG_LOCK_STAT is not set
# CONFIG_DEBUG_RT_MUTEXES is not set
# CONFIG_DEBUG_SPINLOCK is not set
# CONFIG_DEBUG_MUTEXES is not set
# CONFIG_DEBUG_WW_MUTEX_SLOWPATH is not set
# CONFIG_DEBUG_RWSEMS is not set
# CONFIG_DEBUG_LOCK_ALLOC is not set
# CONFIG_DEBUG_ATOMIC_SLEEP is not set
# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
# CONFIG_LOCK_TORTURE_TEST is not set
# CONFIG_WW_MUTEX_SELFTEST is not set
# CONFIG_SCF_TORTURE_TEST is not set
# end of Lock Debugging (spinlocks, mutexes, etc...)

# CONFIG_DEBUG_IRQFLAGS is not set
CONFIG_STACKTRACE=y
# CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
# CONFIG_DEBUG_KOBJECT is not set

#
# Debug kernel data structures
#
# CONFIG_DEBUG_LIST is not set
# CONFIG_DEBUG_PLIST is not set
# CONFIG_DEBUG_SG is not set
# CONFIG_DEBUG_NOTIFIERS is not set
# CONFIG_BUG_ON_DATA_CORRUPTION is not set
# end of Debug kernel data structures

# CONFIG_DEBUG_CREDENTIALS is not set

#
# RCU Debugging
#
# CONFIG_RCU_SCALE_TEST is not set
# CONFIG_RCU_TORTURE_TEST is not set
# CONFIG_RCU_REF_SCALE_TEST is not set
# CONFIG_RCU_TRACE is not set
# CONFIG_RCU_EQS_DEBUG is not set
# end of RCU Debugging

# CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
# CONFIG_LATENCYTOP is not set
CONFIG_HAVE_FUNCTION_TRACER=y
CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
CONFIG_HAVE_DYNAMIC_FTRACE=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS=y
CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
CONFIG_HAVE_C_RECORDMCOUNT=y
CONFIG_TRACING_SUPPORT=y
CONFIG_FTRACE=y
# CONFIG_FUNCTION_TRACER is not set
# CONFIG_STACK_TRACER is not set
# CONFIG_IRQSOFF_TRACER is not set
# CONFIG_SCHED_TRACER is not set
# CONFIG_HWLAT_TRACER is not set
# CONFIG_OSNOISE_TRACER is not set
# CONFIG_TIMERLAT_TRACER is not set
# CONFIG_ENABLE_DEFAULT_TRACERS is not set
# CONFIG_FTRACE_SYSCALLS is not set
# CONFIG_TRACER_SNAPSHOT is not set
CONFIG_BRANCH_PROFILE_NONE=y
# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
# CONFIG_PROFILE_ALL_BRANCHES is not set
# CONFIG_BLK_DEV_IO_TRACE is not set
# CONFIG_SYNTH_EVENTS is not set
# CONFIG_HIST_TRIGGERS is not set
# CONFIG_TRACEPOINT_BENCHMARK is not set
# CONFIG_SAMPLES is not set
CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=y
CONFIG_STRICT_DEVMEM=y
# CONFIG_IO_STRICT_DEVMEM is not set

#
# powerpc Debugging
#
# CONFIG_PPC_DISABLE_WERROR is not set
CONFIG_PPC_WERROR=y
CONFIG_PRINT_STACK_DEPTH=64
# CONFIG_CODE_PATCHING_SELFTEST is not set
# CONFIG_FTR_FIXUP_SELFTEST is not set
# CONFIG_MSI_BITMAP_SELFTEST is not set
# CONFIG_XMON is not set
# CONFIG_BDI_SWITCH is not set
# CONFIG_PPC_EARLY_DEBUG is not set
# end of powerpc Debugging

#
# Kernel Testing and Coverage
#
# CONFIG_KUNIT is not set
# CONFIG_NOTIFIER_ERROR_INJECTION is not set
# CONFIG_FAULT_INJECTION is not set
CONFIG_ARCH_HAS_KCOV=y
CONFIG_CC_HAS_SANCOV_TRACE_PC=y
# CONFIG_KCOV is not set
CONFIG_RUNTIME_TESTING_MENU=y
# CONFIG_TEST_MIN_HEAP is not set
# CONFIG_TEST_DIV64 is not set
# CONFIG_BACKTRACE_SELF_TEST is not set
# CONFIG_TEST_REF_TRACKER is not set
# CONFIG_RBTREE_TEST is not set
# CONFIG_REED_SOLOMON_TEST is not set
# CONFIG_INTERVAL_TREE_TEST is not set
# CONFIG_ATOMIC64_SELFTEST is not set
# CONFIG_TEST_HEXDUMP is not set
# CONFIG_STRING_SELFTEST is not set
# CONFIG_TEST_STRING_HELPERS is not set
# CONFIG_TEST_STRSCPY is not set
# CONFIG_TEST_KSTRTOX is not set
# CONFIG_TEST_PRINTF is not set
# CONFIG_TEST_SCANF is not set
# CONFIG_TEST_BITMAP is not set
# CONFIG_TEST_UUID is not set
# CONFIG_TEST_XARRAY is not set
# CONFIG_TEST_RHASHTABLE is not set
# CONFIG_TEST_SIPHASH is not set
# CONFIG_TEST_IDA is not set
# CONFIG_FIND_BIT_BENCHMARK is not set
# CONFIG_TEST_FIRMWARE is not set
# CONFIG_TEST_SYSCTL is not set
# CONFIG_TEST_UDELAY is not set
# CONFIG_TEST_MEMCAT_P is not set
# CONFIG_TEST_MEMINIT is not set
# CONFIG_TEST_FREE_PAGES is not set
CONFIG_ARCH_USE_MEMTEST=y
# CONFIG_MEMTEST is not set
# end of Kernel Testing and Coverage
# end of Kernel hacking

--B6JoZz8cuqdu495G--
