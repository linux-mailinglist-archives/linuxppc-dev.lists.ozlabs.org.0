Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40711285350
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Oct 2020 22:44:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C5Tw61c5mzDqGS
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Oct 2020 07:44:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C5TtM3hY8zDqBg
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Oct 2020 07:42:32 +1100 (AEDT)
IronPort-SDR: NlsGJfGhCSnjZVHY8LSxVzyalGc7S937i2twHR4UQXoFcvYKBfeaW69O/XXdzsfi/89oncQ4pG
 OkPcz7tyXvhA==
X-IronPort-AV: E=McAfee;i="6000,8403,9766"; a="182139519"
X-IronPort-AV: E=Sophos;i="5.77,343,1596524400"; 
 d="gz'50?scan'50,208,50";a="182139519"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2020 13:42:28 -0700
IronPort-SDR: 09ONCdUvQ6o7N0ZMkdsaVqgfvAuQRcgTqEAEDvSb1krXaL3TgRdOP+XwtvNZxRWetmUjHfSeiw
 3WBE/jtcRoLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,343,1596524400"; 
 d="gz'50?scan'50,208,50";a="315842552"
Received: from lkp-server02.sh.intel.com (HELO b5ae2f167493) ([10.239.97.151])
 by orsmga006.jf.intel.com with ESMTP; 06 Oct 2020 13:42:26 -0700
Received: from kbuild by b5ae2f167493 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kPtmz-0001KH-HZ; Tue, 06 Oct 2020 20:42:25 +0000
Date: Wed, 7 Oct 2020 04:41:50 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test 76/183]
 arch/powerpc/kernel/vdso32/gettimeofday.S:40: Error: syntax error; found
 `@', expected `,'
Message-ID: <202010070441.K8Bb46Rt-lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="pf9I7BMVVzbSWLtt"
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
Cc: clang-built-linux@googlegroups.com, kbuild-all@lists.01.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--pf9I7BMVVzbSWLtt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Michael,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
head:   72cdd117c449896c707fc6cfe5b90978160697d0
commit: 231b232df8f67e7d37af01259c21f2a131c3911e [76/183] powerpc/64: Make VDSO32 track COMPAT on 64-bit
config: powerpc-randconfig-r033-20201005 (attached as .config)
compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project 1127662c6dc2a276839c75a42238b11a3ad00f32)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?id=231b232df8f67e7d37af01259c21f2a131c3911e
        git remote add powerpc https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
        git fetch --no-tags powerpc next-test
        git checkout 231b232df8f67e7d37af01259c21f2a131c3911e
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=powerpc 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/powerpc/kernel/vdso32/gettimeofday.S: Assembler messages:
>> arch/powerpc/kernel/vdso32/gettimeofday.S:40: Error: syntax error; found `@', expected `,'
>> arch/powerpc/kernel/vdso32/gettimeofday.S:40: Error: junk at end of line: `@local'
   arch/powerpc/kernel/vdso32/gettimeofday.S:68: Warning: invalid register expression
>> arch/powerpc/kernel/vdso32/gettimeofday.S:68: Error: operand out of range (3 is not between 0 and 1)
   arch/powerpc/kernel/vdso32/gettimeofday.S:68: Error: missing operand
   arch/powerpc/kernel/vdso32/gettimeofday.S:69: Warning: invalid register expression
   arch/powerpc/kernel/vdso32/gettimeofday.S:69: Error: operand out of range (3 is not between 0 and 1)
   arch/powerpc/kernel/vdso32/gettimeofday.S:69: Error: missing operand
   arch/powerpc/kernel/vdso32/gettimeofday.S:72: Warning: invalid register expression
   arch/powerpc/kernel/vdso32/gettimeofday.S:72: Error: operand out of range (3 is not between 0 and 1)
   arch/powerpc/kernel/vdso32/gettimeofday.S:72: Error: missing operand
   arch/powerpc/kernel/vdso32/gettimeofday.S:73: Warning: invalid register expression
   arch/powerpc/kernel/vdso32/gettimeofday.S:73: Error: operand out of range (3 is not between 0 and 1)
   arch/powerpc/kernel/vdso32/gettimeofday.S:73: Error: missing operand
   arch/powerpc/kernel/vdso32/gettimeofday.S:86: Error: syntax error; found `@', expected `,'
   arch/powerpc/kernel/vdso32/gettimeofday.S:86: Error: junk at end of line: `@local'
   arch/powerpc/kernel/vdso32/gettimeofday.S:110: Warning: invalid register expression
   arch/powerpc/kernel/vdso32/gettimeofday.S:110: Error: operand out of range (8 is not between 0 and 1)
   arch/powerpc/kernel/vdso32/gettimeofday.S:110: Error: missing operand
   arch/powerpc/kernel/vdso32/gettimeofday.S:144: Warning: invalid register expression
   arch/powerpc/kernel/vdso32/gettimeofday.S:144: Error: missing operand
   arch/powerpc/kernel/vdso32/gettimeofday.S:213: Warning: invalid register expression
   arch/powerpc/kernel/vdso32/gettimeofday.S:213: Error: operand out of range (4 is not between 0 and 1)
   arch/powerpc/kernel/vdso32/gettimeofday.S:213: Error: missing operand
   clang-12: error: assembler command failed with exit code 1 (use -v to see invocation)

vim +40 arch/powerpc/kernel/vdso32/gettimeofday.S

597bc5c00b666fe Paul Mackerras         2008-10-27   22  
a7f290dad32ee34 Benjamin Herrenschmidt 2005-11-11   23  	.text
a7f290dad32ee34 Benjamin Herrenschmidt 2005-11-11   24  /*
a7f290dad32ee34 Benjamin Herrenschmidt 2005-11-11   25   * Exact prototype of gettimeofday
a7f290dad32ee34 Benjamin Herrenschmidt 2005-11-11   26   *
a7f290dad32ee34 Benjamin Herrenschmidt 2005-11-11   27   * int __kernel_gettimeofday(struct timeval *tv, struct timezone *tz);
a7f290dad32ee34 Benjamin Herrenschmidt 2005-11-11   28   *
a7f290dad32ee34 Benjamin Herrenschmidt 2005-11-11   29   */
a7f290dad32ee34 Benjamin Herrenschmidt 2005-11-11   30  V_FUNCTION_BEGIN(__kernel_gettimeofday)
a7f290dad32ee34 Benjamin Herrenschmidt 2005-11-11   31    .cfi_startproc
a7f290dad32ee34 Benjamin Herrenschmidt 2005-11-11   32  	mflr	r12
a7f290dad32ee34 Benjamin Herrenschmidt 2005-11-11   33    .cfi_register lr,r12
a7f290dad32ee34 Benjamin Herrenschmidt 2005-11-11   34  
bfc2eae0ad72a43 Christophe Leroy       2019-12-02   35  	mr.	r10,r3			/* r10 saves tv */
a7f290dad32ee34 Benjamin Herrenschmidt 2005-11-11   36  	mr	r11,r4			/* r11 saves tz */
ec0895f08f99515 Christophe Leroy       2019-12-02   37  	get_datapage	r9, r0
74609f4536f2b8f Tony Breeds            2007-06-26   38  	beq	3f
6e2f9e9cfd560f5 Christophe Leroy       2019-12-02   39  	LOAD_REG_IMMEDIATE(r7, 1000000)	/* load up USEC_PER_SEC */
8fd63a9ea752846 Paul Mackerras         2010-06-20  @40  	bl	__do_get_tspec@local	/* get sec/usec from tb & kernel */
8fd63a9ea752846 Paul Mackerras         2010-06-20   41  	stw	r3,TVAL32_TV_SEC(r10)
8fd63a9ea752846 Paul Mackerras         2010-06-20   42  	stw	r4,TVAL32_TV_USEC(r10)
a7f290dad32ee34 Benjamin Herrenschmidt 2005-11-11   43  
74609f4536f2b8f Tony Breeds            2007-06-26   44  3:	cmplwi	r11,0			/* check if tz is NULL */
bfc2eae0ad72a43 Christophe Leroy       2019-12-02   45  	mtlr	r12
bfc2eae0ad72a43 Christophe Leroy       2019-12-02   46  	crclr	cr0*4+so
bfc2eae0ad72a43 Christophe Leroy       2019-12-02   47  	li	r3,0
bfc2eae0ad72a43 Christophe Leroy       2019-12-02   48  	beqlr
bfc2eae0ad72a43 Christophe Leroy       2019-12-02   49  
a7f290dad32ee34 Benjamin Herrenschmidt 2005-11-11   50  	lwz	r4,CFG_TZ_MINUTEWEST(r9)/* fill tz */
a7f290dad32ee34 Benjamin Herrenschmidt 2005-11-11   51  	lwz	r5,CFG_TZ_DSTTIME(r9)
a7f290dad32ee34 Benjamin Herrenschmidt 2005-11-11   52  	stw	r4,TZONE_TZ_MINWEST(r11)
a7f290dad32ee34 Benjamin Herrenschmidt 2005-11-11   53  	stw	r5,TZONE_TZ_DSTTIME(r11)
a7f290dad32ee34 Benjamin Herrenschmidt 2005-11-11   54  
a7f290dad32ee34 Benjamin Herrenschmidt 2005-11-11   55  	blr
a7f290dad32ee34 Benjamin Herrenschmidt 2005-11-11   56    .cfi_endproc
a7f290dad32ee34 Benjamin Herrenschmidt 2005-11-11   57  V_FUNCTION_END(__kernel_gettimeofday)
a7f290dad32ee34 Benjamin Herrenschmidt 2005-11-11   58  
a7f290dad32ee34 Benjamin Herrenschmidt 2005-11-11   59  /*
a7f290dad32ee34 Benjamin Herrenschmidt 2005-11-11   60   * Exact prototype of clock_gettime()
a7f290dad32ee34 Benjamin Herrenschmidt 2005-11-11   61   *
a7f290dad32ee34 Benjamin Herrenschmidt 2005-11-11   62   * int __kernel_clock_gettime(clockid_t clock_id, struct timespec *tp);
a7f290dad32ee34 Benjamin Herrenschmidt 2005-11-11   63   *
a7f290dad32ee34 Benjamin Herrenschmidt 2005-11-11   64   */
a7f290dad32ee34 Benjamin Herrenschmidt 2005-11-11   65  V_FUNCTION_BEGIN(__kernel_clock_gettime)
a7f290dad32ee34 Benjamin Herrenschmidt 2005-11-11   66    .cfi_startproc
a7f290dad32ee34 Benjamin Herrenschmidt 2005-11-11   67  	/* Check for supported clock IDs */
a7f290dad32ee34 Benjamin Herrenschmidt 2005-11-11  @68  	cmpli	cr0,r3,CLOCK_REALTIME
a7f290dad32ee34 Benjamin Herrenschmidt 2005-11-11   69  	cmpli	cr1,r3,CLOCK_MONOTONIC
0c37ec2aa88bd8a Benjamin Herrenschmidt 2005-11-14   70  	cror	cr0*4+eq,cr0*4+eq,cr1*4+eq
654abc69ef2e697 Christophe Leroy       2019-12-02   71  
654abc69ef2e697 Christophe Leroy       2019-12-02   72  	cmpli	cr5,r3,CLOCK_REALTIME_COARSE
654abc69ef2e697 Christophe Leroy       2019-12-02   73  	cmpli	cr6,r3,CLOCK_MONOTONIC_COARSE
654abc69ef2e697 Christophe Leroy       2019-12-02   74  	cror	cr5*4+eq,cr5*4+eq,cr6*4+eq
654abc69ef2e697 Christophe Leroy       2019-12-02   75  
654abc69ef2e697 Christophe Leroy       2019-12-02   76  	cror	cr0*4+eq,cr0*4+eq,cr5*4+eq
654abc69ef2e697 Christophe Leroy       2019-12-02   77  	bne	cr0, .Lgettime_fallback
a7f290dad32ee34 Benjamin Herrenschmidt 2005-11-11   78  
a7f290dad32ee34 Benjamin Herrenschmidt 2005-11-11   79  	mflr	r12			/* r12 saves lr */
a7f290dad32ee34 Benjamin Herrenschmidt 2005-11-11   80    .cfi_register lr,r12
a7f290dad32ee34 Benjamin Herrenschmidt 2005-11-11   81  	mr	r11,r4			/* r11 saves tp */
ec0895f08f99515 Christophe Leroy       2019-12-02   82  	get_datapage	r9, r0
6e2f9e9cfd560f5 Christophe Leroy       2019-12-02   83  	LOAD_REG_IMMEDIATE(r7, NSEC_PER_SEC)	/* load up NSEC_PER_SEC */
654abc69ef2e697 Christophe Leroy       2019-12-02   84  	beq	cr5, .Lcoarse_clocks
654abc69ef2e697 Christophe Leroy       2019-12-02   85  .Lprecise_clocks:
654abc69ef2e697 Christophe Leroy       2019-12-02   86  	bl	__do_get_tspec@local	/* get sec/nsec from tb & kernel */
654abc69ef2e697 Christophe Leroy       2019-12-02   87  	bne	cr1, .Lfinish		/* not monotonic -> all done */
a7f290dad32ee34 Benjamin Herrenschmidt 2005-11-11   88  
a7f290dad32ee34 Benjamin Herrenschmidt 2005-11-11   89  	/*
a7f290dad32ee34 Benjamin Herrenschmidt 2005-11-11   90  	 * CLOCK_MONOTONIC
a7f290dad32ee34 Benjamin Herrenschmidt 2005-11-11   91  	 */
a7f290dad32ee34 Benjamin Herrenschmidt 2005-11-11   92  
a7f290dad32ee34 Benjamin Herrenschmidt 2005-11-11   93  	/* now we must fixup using wall to monotonic. We need to snapshot
a7f290dad32ee34 Benjamin Herrenschmidt 2005-11-11   94  	 * that value and do the counter trick again. Fortunately, we still
a7f290dad32ee34 Benjamin Herrenschmidt 2005-11-11   95  	 * have the counter value in r8 that was returned by __do_get_xsec.
597bc5c00b666fe Paul Mackerras         2008-10-27   96  	 * At this point, r3,r4 contain our sec/nsec values, r5 and r6
597bc5c00b666fe Paul Mackerras         2008-10-27   97  	 * can be used, r7 contains NSEC_PER_SEC.
a7f290dad32ee34 Benjamin Herrenschmidt 2005-11-11   98  	 */
a7f290dad32ee34 Benjamin Herrenschmidt 2005-11-11   99  
dd9a994fc68d196 Christophe Leroy       2019-04-04  100  	lwz	r5,(WTOM_CLOCK_SEC+LOPART)(r9)
597bc5c00b666fe Paul Mackerras         2008-10-27  101  	lwz	r6,WTOM_CLOCK_NSEC(r9)
a7f290dad32ee34 Benjamin Herrenschmidt 2005-11-11  102  
597bc5c00b666fe Paul Mackerras         2008-10-27  103  	/* We now have our offset in r5,r6. We create a fake dependency
597bc5c00b666fe Paul Mackerras         2008-10-27  104  	 * on that value and re-check the counter
a7f290dad32ee34 Benjamin Herrenschmidt 2005-11-11  105  	 */
597bc5c00b666fe Paul Mackerras         2008-10-27  106  	or	r0,r6,r5
597bc5c00b666fe Paul Mackerras         2008-10-27  107  	xor	r0,r0,r0
a7f290dad32ee34 Benjamin Herrenschmidt 2005-11-11  108  	add	r9,r9,r0
597bc5c00b666fe Paul Mackerras         2008-10-27  109  	lwz	r0,(CFG_TB_UPDATE_COUNT+LOPART)(r9)
a7f290dad32ee34 Benjamin Herrenschmidt 2005-11-11  110          cmpl    cr0,r8,r0		/* check if updated */
654abc69ef2e697 Christophe Leroy       2019-12-02  111  	bne-	.Lprecise_clocks
654abc69ef2e697 Christophe Leroy       2019-12-02  112  	b	.Lfinish_monotonic
654abc69ef2e697 Christophe Leroy       2019-12-02  113  
654abc69ef2e697 Christophe Leroy       2019-12-02  114  	/*
654abc69ef2e697 Christophe Leroy       2019-12-02  115  	 * For coarse clocks we get data directly from the vdso data page, so
654abc69ef2e697 Christophe Leroy       2019-12-02  116  	 * we don't need to call __do_get_tspec, but we still need to do the
654abc69ef2e697 Christophe Leroy       2019-12-02  117  	 * counter trick.
654abc69ef2e697 Christophe Leroy       2019-12-02  118  	 */
654abc69ef2e697 Christophe Leroy       2019-12-02  119  .Lcoarse_clocks:
654abc69ef2e697 Christophe Leroy       2019-12-02  120  	lwz	r8,(CFG_TB_UPDATE_COUNT+LOPART)(r9)
654abc69ef2e697 Christophe Leroy       2019-12-02  121  	andi.	r0,r8,1                 /* pending update ? loop */
654abc69ef2e697 Christophe Leroy       2019-12-02  122  	bne-	.Lcoarse_clocks
654abc69ef2e697 Christophe Leroy       2019-12-02  123  	add	r9,r9,r0		/* r0 is already 0 */
654abc69ef2e697 Christophe Leroy       2019-12-02  124  
654abc69ef2e697 Christophe Leroy       2019-12-02  125  	/*
654abc69ef2e697 Christophe Leroy       2019-12-02  126  	 * CLOCK_REALTIME_COARSE, below values are needed for MONOTONIC_COARSE
654abc69ef2e697 Christophe Leroy       2019-12-02  127  	 * too
654abc69ef2e697 Christophe Leroy       2019-12-02  128  	 */
654abc69ef2e697 Christophe Leroy       2019-12-02  129  	lwz	r3,STAMP_XTIME_SEC+LOPART(r9)
654abc69ef2e697 Christophe Leroy       2019-12-02  130  	lwz	r4,STAMP_XTIME_NSEC+LOPART(r9)
654abc69ef2e697 Christophe Leroy       2019-12-02  131  	bne	cr6,1f
654abc69ef2e697 Christophe Leroy       2019-12-02  132  
654abc69ef2e697 Christophe Leroy       2019-12-02  133  	/* CLOCK_MONOTONIC_COARSE */
654abc69ef2e697 Christophe Leroy       2019-12-02  134  	lwz	r5,(WTOM_CLOCK_SEC+LOPART)(r9)
654abc69ef2e697 Christophe Leroy       2019-12-02  135  	lwz	r6,WTOM_CLOCK_NSEC(r9)
654abc69ef2e697 Christophe Leroy       2019-12-02  136  
654abc69ef2e697 Christophe Leroy       2019-12-02  137  	/* check if counter has updated */
654abc69ef2e697 Christophe Leroy       2019-12-02  138  	or	r0,r6,r5
654abc69ef2e697 Christophe Leroy       2019-12-02  139  1:	or	r0,r0,r3
654abc69ef2e697 Christophe Leroy       2019-12-02  140  	or	r0,r0,r4
654abc69ef2e697 Christophe Leroy       2019-12-02  141  	xor	r0,r0,r0
654abc69ef2e697 Christophe Leroy       2019-12-02  142  	add	r3,r3,r0
654abc69ef2e697 Christophe Leroy       2019-12-02  143  	lwz	r0,CFG_TB_UPDATE_COUNT+LOPART(r9)
654abc69ef2e697 Christophe Leroy       2019-12-02  144  	cmpl	cr0,r0,r8               /* check if updated */
654abc69ef2e697 Christophe Leroy       2019-12-02  145  	bne-	.Lcoarse_clocks
654abc69ef2e697 Christophe Leroy       2019-12-02  146  
654abc69ef2e697 Christophe Leroy       2019-12-02  147  	/* Counter has not updated, so continue calculating proper values for
654abc69ef2e697 Christophe Leroy       2019-12-02  148  	 * sec and nsec if monotonic coarse, or just return with the proper
654abc69ef2e697 Christophe Leroy       2019-12-02  149  	 * values for realtime.
654abc69ef2e697 Christophe Leroy       2019-12-02  150  	 */
654abc69ef2e697 Christophe Leroy       2019-12-02  151  	bne	cr6, .Lfinish
a7f290dad32ee34 Benjamin Herrenschmidt 2005-11-11  152  
597bc5c00b666fe Paul Mackerras         2008-10-27  153  	/* Calculate and store result. Note that this mimics the C code,
a7f290dad32ee34 Benjamin Herrenschmidt 2005-11-11  154  	 * which may cause funny results if nsec goes negative... is that
a7f290dad32ee34 Benjamin Herrenschmidt 2005-11-11  155  	 * possible at all ?
a7f290dad32ee34 Benjamin Herrenschmidt 2005-11-11  156  	 */
654abc69ef2e697 Christophe Leroy       2019-12-02  157  .Lfinish_monotonic:
597bc5c00b666fe Paul Mackerras         2008-10-27  158  	add	r3,r3,r5
597bc5c00b666fe Paul Mackerras         2008-10-27  159  	add	r4,r4,r6
597bc5c00b666fe Paul Mackerras         2008-10-27  160  	cmpw	cr0,r4,r7
597bc5c00b666fe Paul Mackerras         2008-10-27  161  	cmpwi	cr1,r4,0
a7f290dad32ee34 Benjamin Herrenschmidt 2005-11-11  162  	blt	1f
597bc5c00b666fe Paul Mackerras         2008-10-27  163  	subf	r4,r7,r4
a7f290dad32ee34 Benjamin Herrenschmidt 2005-11-11  164  	addi	r3,r3,1
654abc69ef2e697 Christophe Leroy       2019-12-02  165  1:	bge	cr1, .Lfinish
0c37ec2aa88bd8a Benjamin Herrenschmidt 2005-11-14  166  	addi	r3,r3,-1
597bc5c00b666fe Paul Mackerras         2008-10-27  167  	add	r4,r4,r7
597bc5c00b666fe Paul Mackerras         2008-10-27  168  

:::::: The code at line 40 was first introduced by commit
:::::: 8fd63a9ea7528463211a6c88d500c51851d960c8 powerpc: Rework VDSO gettimeofday to prevent time going backwards

:::::: TO: Paul Mackerras <paulus@samba.org>
:::::: CC: Benjamin Herrenschmidt <benh@kernel.crashing.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--pf9I7BMVVzbSWLtt
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
AQA=

--pf9I7BMVVzbSWLtt--
