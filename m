Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9295B0E35
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 22:35:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MNDXZ0ljlz3bqn
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Sep 2022 06:35:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gw3CGoKM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Two or more type TXT spf records found.) smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gw3CGoKM;
	dkim-atps=neutral
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MNDWw3n4Tz2xGS
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Sep 2022 06:34:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662582892; x=1694118892;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Cw9qHjrbFi0ue63wP/ltwLxVD8Su1rTnrhU0Yg3OhPc=;
  b=gw3CGoKMKbF7wFqEqwToiKoufcxDIEuzGcc9KeIyqeTNh3WWoAKF2Jzh
   MU313BPCioK3+NjeafhVwtVtbrRzAsZkMC40bU/Eh5f/IPzrXGzVGrMG7
   tedzX+bz5lJORyTx0TfQvdS01Ge+rK8pbc7JdR1cSX7be5r67VYWmLVam
   cU04/YwPGOCHHc0nQMZz1UVhlm7ry7PWTiNu3/2EGTu2jkMX0plyZ3TLu
   Q/Ufo0YJUqc/n1Q+LDshgR6lUWxYQjpAXbxWDW4qS5XbcVkP6FBliO+f+
   FtKA412AfML+tIzY5RwMZ1PnU6gpDvHkcSEV99zYMMeWySytOeNMh0YPr
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10463"; a="323178533"
X-IronPort-AV: E=Sophos;i="5.93,297,1654585200"; 
   d="scan'208";a="323178533"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2022 13:34:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,297,1654585200"; 
   d="scan'208";a="943053839"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 07 Sep 2022 13:34:29 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oW1ki-0006vp-1M;
	Wed, 07 Sep 2022 20:34:28 +0000
Date: Thu, 8 Sep 2022 04:33:32 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [powerpc:next 26/63] arch/powerpc/math-emu/math_efp.c:177:5: error:
 no previous prototype for function 'do_spe_mathemu'
Message-ID: <202209080432.fArx6r6a-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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
Cc: Nathan Chancellor <nathan@kernel.org>, linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev, kbuild-all@lists.01.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
head:   c28c2d4abdf95655001992c4f52dc243ba00cac3
commit: 7245fc5bb7a966852d5bd7779d1f5855530b461a [26/63] powerpc/math-emu: Remove -w build flag and fix warnings
config: powerpc-tqm8540_defconfig (https://download.01.org/0day-ci/archive/20220908/202209080432.fArx6r6a-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project c55b41d5199d2394dd6cdb8f52180d8b81d809d4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?id=7245fc5bb7a966852d5bd7779d1f5855530b461a
        git remote add powerpc https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
        git fetch --no-tags powerpc next
        git checkout 7245fc5bb7a966852d5bd7779d1f5855530b461a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash arch/powerpc/math-emu/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/powerpc/math-emu/fre.c:6:5: error: no previous prototype for function 'fre' [-Werror,-Wmissing-prototypes]
   int fre(void *frD, void *frB)
       ^
   arch/powerpc/math-emu/fre.c:6:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int fre(void *frD, void *frB)
   ^
   static 
   1 error generated.
--
>> arch/powerpc/math-emu/fsqrt.c:11:1: error: no previous prototype for function 'fsqrt' [-Werror,-Wmissing-prototypes]
   fsqrt(void *frD, void *frB)
   ^
   arch/powerpc/math-emu/fsqrt.c:10:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int
   ^
   static 
   1 error generated.
--
>> arch/powerpc/math-emu/fsqrts.c:12:1: error: no previous prototype for function 'fsqrts' [-Werror,-Wmissing-prototypes]
   fsqrts(void *frD, void *frB)
   ^
   arch/powerpc/math-emu/fsqrts.c:11:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int
   ^
   static 
   1 error generated.
--
>> arch/powerpc/math-emu/frsqrtes.c:6:5: error: no previous prototype for function 'frsqrtes' [-Werror,-Wmissing-prototypes]
   int frsqrtes(void *frD, void *frB)
       ^
   arch/powerpc/math-emu/frsqrtes.c:6:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int frsqrtes(void *frD, void *frB)
   ^
   static 
   1 error generated.
--
>> arch/powerpc/math-emu/mtfsf.c:10:1: error: no previous prototype for function 'mtfsf' [-Werror,-Wmissing-prototypes]
   mtfsf(unsigned int FM, u32 *frB)
   ^
   arch/powerpc/math-emu/mtfsf.c:9:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int
   ^
   static 
   1 error generated.
--
>> arch/powerpc/math-emu/mtfsfi.c:10:1: error: no previous prototype for function 'mtfsfi' [-Werror,-Wmissing-prototypes]
   mtfsfi(unsigned int crfD, unsigned int IMM)
   ^
   arch/powerpc/math-emu/mtfsfi.c:9:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int
   ^
   static 
   1 error generated.
--
>> arch/powerpc/math-emu/fabs.c:7:1: error: no previous prototype for function 'fabs' [-Werror,-Wmissing-prototypes]
   fabs(u32 *frD, u32 *frB)
   ^
   arch/powerpc/math-emu/fabs.c:6:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int
   ^
   static 
   1 error generated.
--
>> arch/powerpc/math-emu/fadd.c:11:1: error: no previous prototype for function 'fadd' [-Werror,-Wmissing-prototypes]
   fadd(void *frD, void *frA, void *frB)
   ^
   arch/powerpc/math-emu/fadd.c:10:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int
   ^
   static 
   1 error generated.
--
>> arch/powerpc/math-emu/fadds.c:12:1: error: no previous prototype for function 'fadds' [-Werror,-Wmissing-prototypes]
   fadds(void *frD, void *frA, void *frB)
   ^
   arch/powerpc/math-emu/fadds.c:11:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int
   ^
   static 
   1 error generated.
--
>> arch/powerpc/math-emu/fcmpo.c:11:1: error: no previous prototype for function 'fcmpo' [-Werror,-Wmissing-prototypes]
   fcmpo(u32 *ccr, int crfD, void *frA, void *frB)
   ^
   arch/powerpc/math-emu/fcmpo.c:10:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int
   ^
   static 
   1 error generated.
--
>> arch/powerpc/math-emu/fcmpu.c:13:2: error: variable 'A_c' set but not used [-Werror,-Wunused-but-set-variable]
           FP_DECL_D(A);
           ^
   include/math-emu/double.h:73:23: note: expanded from macro 'FP_DECL_D'
   #define FP_DECL_D(X)            _FP_DECL(2,X)
                                   ^
   include/math-emu/op-common.h:28:14: note: expanded from macro '_FP_DECL'
     _FP_I_TYPE X##_c=0, X##_s=0, X##_e=0; \
                ^
   <scratch space>:139:1: note: expanded from here
   A_c
   ^
>> arch/powerpc/math-emu/fcmpu.c:14:2: error: variable 'B_c' set but not used [-Werror,-Wunused-but-set-variable]
           FP_DECL_D(B);
           ^
   include/math-emu/double.h:73:23: note: expanded from macro 'FP_DECL_D'
   #define FP_DECL_D(X)            _FP_DECL(2,X)
                                   ^
   include/math-emu/op-common.h:28:14: note: expanded from macro '_FP_DECL'
     _FP_I_TYPE X##_c=0, X##_s=0, X##_e=0; \
                ^
   <scratch space>:145:1: note: expanded from here
   B_c
   ^
>> arch/powerpc/math-emu/fcmpu.c:15:2: error: variable '_fex' set but not used [-Werror,-Wunused-but-set-variable]
           FP_DECL_EX;
           ^
   include/math-emu/soft-fp.h:94:24: note: expanded from macro 'FP_DECL_EX'
   #define FP_DECL_EX int _fex = 0
                          ^
>> arch/powerpc/math-emu/fcmpu.c:11:1: error: no previous prototype for function 'fcmpu' [-Werror,-Wmissing-prototypes]
   fcmpu(u32 *ccr, int crfD, void *frA, void *frB)
   ^
   arch/powerpc/math-emu/fcmpu.c:10:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int
   ^
   static 
   4 errors generated.
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
