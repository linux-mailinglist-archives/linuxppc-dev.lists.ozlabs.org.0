Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA16174D51
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 Mar 2020 13:24:47 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48VjBy2fbXzDqwN
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 Mar 2020 23:24:42 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Vj793qL5zDqyB
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  1 Mar 2020 23:21:17 +1100 (AEDT)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Mar 2020 04:21:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,503,1574150400"; 
 d="gz'50?scan'50,208,50";a="239259041"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 01 Mar 2020 04:21:12 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1j8Nap-0004el-GR; Sun, 01 Mar 2020 20:21:11 +0800
Date: Sun, 1 Mar 2020 20:20:49 +0800
From: kbuild test robot <lkp@intel.com>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 32/32] powerpc/64s: system call support for scv/rfscv
 instructions
Message-ID: <202003012018.MuoFajR9%lkp@intel.com>
References: <20200225173541.1549955-33-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="0F1p//8PRICkK4MW"
Content-Disposition: inline
In-Reply-To: <20200225173541.1549955-33-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, kbuild-all@lists.01.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--0F1p//8PRICkK4MW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nicholas,

I love your patch! Yet something to improve:

[auto build test ERROR on powerpc/next]
[also build test ERROR on v5.6-rc3 next-20200228]
[cannot apply to kvm-ppc/kvm-ppc-next scottwood/next]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Nicholas-Piggin/powerpc-64-interrupts-and-syscalls-series/20200226-043224
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
config: powerpc-ppc64e_defconfig (attached as .config)
compiler: powerpc64-linux-gcc (GCC) 7.5.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        GCC_VERSION=7.5.0 make.cross ARCH=powerpc 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/powerpc/kernel/entry_64.S: Assembler messages:
>> arch/powerpc/kernel/entry_64.S:67: Error: unrecognized opcode: `interrupt_to_kernel'
>> arch/powerpc/kernel/entry_64.S:164: Error: unrecognized opcode: `rfscv_to_user'

vim +67 arch/powerpc/kernel/entry_64.S

    47	
    48	/*
    49	 * System calls.
    50	 */
    51		.section	".toc","aw"
    52	SYS_CALL_TABLE:
    53		.tc sys_call_table[TC],sys_call_table
    54	
    55	COMPAT_SYS_CALL_TABLE:
    56		.tc compat_sys_call_table[TC],compat_sys_call_table
    57	
    58	/* This value is used to mark exception frames on the stack. */
    59	exception_marker:
    60		.tc	ID_EXC_MARKER[TC],STACK_FRAME_REGS_MARKER
    61	
    62		.section	".text"
    63		.align 7
    64	
    65		.globl system_call_vectored_common
    66	system_call_vectored_common:
  > 67		INTERRUPT_TO_KERNEL
    68		mr	r10,r1
    69		ld	r1,PACAKSAVE(r13)
    70		std	r10,0(r1)
    71		std	r11,_NIP(r1)
    72		std	r12,_MSR(r1)
    73		std	r0,GPR0(r1)
    74		std	r10,GPR1(r1)
    75		std	r2,GPR2(r1)
    76		ld	r2,PACATOC(r13)
    77		mfcr	r12
    78		li	r11,0
    79		/* Can we avoid saving r3-r8 in common case? */
    80		std	r3,GPR3(r1)
    81		std	r4,GPR4(r1)
    82		std	r5,GPR5(r1)
    83		std	r6,GPR6(r1)
    84		std	r7,GPR7(r1)
    85		std	r8,GPR8(r1)
    86		/* Zero r9-r12, this should only be required when restoring all GPRs */
    87		std	r11,GPR9(r1)
    88		std	r11,GPR10(r1)
    89		std	r11,GPR11(r1)
    90		std	r11,GPR12(r1)
    91		std	r9,GPR13(r1)
    92		SAVE_NVGPRS(r1)
    93		std	r11,_XER(r1)
    94		std	r11,_LINK(r1)
    95		std	r11,_CTR(r1)
    96	
    97		li	r11,0xc00
    98		std	r11,_TRAP(r1)
    99		std	r12,_CCR(r1)
   100		std	r3,ORIG_GPR3(r1)
   101		addi	r10,r1,STACK_FRAME_OVERHEAD
   102		ld	r11,exception_marker@toc(r2)
   103		std	r11,-16(r10)		/* "regshere" marker */
   104	
   105		/*
   106		 * RECONCILE_IRQ_STATE without calling trace_hardirqs_off(), which
   107		 * would clobber syscall parameters. Also we always enter with IRQs
   108		 * enabled and nothing pending. system_call_exception() will call
   109		 * trace_hardirqs_off().
   110		 *
   111		 * scv enters with MSR[EE]=1, so don't set PACA_IRQ_HARD_DIS.
   112		 */
   113		li	r9,IRQS_ALL_DISABLED
   114		stb	r9,PACAIRQSOFTMASK(r13)
   115	
   116		/* Calling convention has r9 = orig r0, r10 = regs */
   117		mr	r9,r0
   118		bl	system_call_exception
   119	
   120	.Lsyscall_vectored_exit:
   121		addi    r4,r1,STACK_FRAME_OVERHEAD
   122		li	r5,1 /* scv */
   123		bl	syscall_exit_prepare
   124	
   125		ld	r2,_CCR(r1)
   126		ld	r4,_NIP(r1)
   127		ld	r5,_MSR(r1)
   128	
   129	BEGIN_FTR_SECTION
   130		stdcx.	r0,0,r1			/* to clear the reservation */
   131	END_FTR_SECTION_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
   132	
   133		mtlr	r4
   134		mtctr	r5
   135	
   136		cmpdi	r3,0
   137		bne	syscall_vectored_restore_regs
   138		li	r0,0
   139		li	r4,0
   140		li	r5,0
   141		li	r6,0
   142		li	r7,0
   143		li	r8,0
   144		li	r9,0
   145		li	r10,0
   146		li	r11,0
   147		li	r12,0
   148		mtspr	SPRN_XER,r0
   149	.Lsyscall_vectored_restore_regs_cont:
   150	
   151	BEGIN_FTR_SECTION
   152		HMT_MEDIUM_LOW
   153	END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
   154	
   155		/*
   156		 * We don't need to restore AMR on the way back to userspace for KUAP.
   157		 * The value of AMR only matters while we're in the kernel.
   158		 */
   159		mtcr	r2
   160		ld	r2,GPR2(r1)
   161		ld	r3,GPR3(r1)
   162		ld	r13,GPR13(r1)
   163		ld	r1,GPR1(r1)
 > 164		RFSCV_TO_USER
   165		b	.	/* prevent speculative execution */
   166	_ASM_NOKPROBE_SYMBOL(system_call_vectored_common);
   167	
   168	syscall_vectored_restore_regs:
   169		ld	r4,_XER(r1)
   170		REST_NVGPRS(r1)
   171		mtspr	SPRN_XER,r4
   172		ld	r0,GPR0(r1)
   173		REST_8GPRS(4, r1)
   174		ld	r12,GPR12(r1)
   175		b	.Lsyscall_vectored_restore_regs_cont
   176	
   177		.balign IFETCH_ALIGN_BYTES
   178		.globl system_call_common
   179	system_call_common:
   180	_ASM_NOKPROBE_SYMBOL(system_call_common)
   181		mr	r10,r1
   182		ld	r1,PACAKSAVE(r13)
   183		std	r10,0(r1)
   184		std	r11,_NIP(r1)
   185		std	r12,_MSR(r1)
   186		std	r0,GPR0(r1)
   187		std	r10,GPR1(r1)
   188		std	r2,GPR2(r1)
   189	#ifdef CONFIG_PPC_FSL_BOOK3E
   190	START_BTB_FLUSH_SECTION
   191		BTB_FLUSH(r10)
   192	END_BTB_FLUSH_SECTION
   193	#endif
   194		ld	r2,PACATOC(r13)
   195		mfcr	r12
   196		li	r11,0
   197		/* Can we avoid saving r3-r8 in common case? */
   198		std	r3,GPR3(r1)
   199		std	r4,GPR4(r1)
   200		std	r5,GPR5(r1)
   201		std	r6,GPR6(r1)
   202		std	r7,GPR7(r1)
   203		std	r8,GPR8(r1)
   204		/* Zero r9-r12, this should only be required when restoring all GPRs */
   205		std	r11,GPR9(r1)
   206		std	r11,GPR10(r1)
   207		std	r11,GPR11(r1)
   208		std	r11,GPR12(r1)
   209		std	r9,GPR13(r1)
   210		SAVE_NVGPRS(r1)
   211		std	r11,_XER(r1)
   212		std	r11,_CTR(r1)
   213		mflr	r10
   214	
   215		/*
   216		 * This clears CR0.SO (bit 28), which is the error indication on
   217		 * return from this system call.
   218		 */
   219		rldimi	r12,r11,28,(63-28)
   220		li	r11,0xc00
   221		std	r10,_LINK(r1)
   222		std	r11,_TRAP(r1)
   223		std	r12,_CCR(r1)
   224		std	r3,ORIG_GPR3(r1)
   225		addi	r10,r1,STACK_FRAME_OVERHEAD
   226		ld	r11,exception_marker@toc(r2)
   227		std	r11,-16(r10)		/* "regshere" marker */
   228	
   229		/*
   230		 * RECONCILE_IRQ_STATE without calling trace_hardirqs_off(), which
   231		 * would clobber syscall parameters. Also we always enter with IRQs
   232		 * enabled and nothing pending. system_call_exception() will call
   233		 * trace_hardirqs_off().
   234		 */
   235		li	r11,IRQS_ALL_DISABLED
   236		li	r12,PACA_IRQ_HARD_DIS
   237		stb	r11,PACAIRQSOFTMASK(r13)
   238		stb	r12,PACAIRQHAPPENED(r13)
   239	
   240		/* Calling convention has r9 = orig r0, r10 = regs */
   241		mr	r9,r0
   242		bl	system_call_exception
   243	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--0F1p//8PRICkK4MW
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
Lg4BAA==

--0F1p//8PRICkK4MW--
