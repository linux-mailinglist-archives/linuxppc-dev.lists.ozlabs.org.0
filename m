Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E7E22BC54
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 05:04:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCYvV5hWqzDqDl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 13:04:22 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCYsc2hPwzDqJW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 13:02:43 +1000 (AEST)
IronPort-SDR: ZAHcA7ATSUDmRAGiNXnd+ih4/vRAbAPDwXAYY3KHYThycqfa3JmeWyNONbVHY14VLgxifBCDNZ
 iBQxu8HJ9HDQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9691"; a="138719306"
X-IronPort-AV: E=Sophos;i="5.75,389,1589266800"; 
 d="gz'50?scan'50,208,50";a="138719306"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2020 20:02:40 -0700
IronPort-SDR: I9Bp3rJSAqjfbR0PTDt4guuqnAeMWlYZ0FZ7eetB0SQiwJaE5zPTjUthYzvoPtc3c6YpiCWrCr
 K2U4EgR06LDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,389,1589266800"; 
 d="gz'50?scan'50,208,50";a="432948728"
Received: from lkp-server01.sh.intel.com (HELO df0563f96c37) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 23 Jul 2020 20:02:37 -0700
Received: from kbuild by df0563f96c37 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1jynyn-00000S-8a; Fri, 24 Jul 2020 03:02:37 +0000
Date: Fri, 24 Jul 2020 11:02:26 +0800
From: kernel test robot <lkp@intel.com>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, mpe@ellerman.id.au
Subject: Re: [v4] powerpc/perf: Initialize power10 PMU registers in cpu setup
 routine
Message-ID: <202007241030.wtjRnkIR%lkp@intel.com>
References: <1595489557-2047-1-git-send-email-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="7JfCtLOvnd9MIVvH"
Content-Disposition: inline
In-Reply-To: <1595489557-2047-1-git-send-email-atrajeev@linux.vnet.ibm.com>
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
Cc: jniethe5@gmail.com, mikey@neuling.org, maddy@linux.vnet.ibm.com,
 kbuild-all@lists.01.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Athira,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on powerpc/next]
[also build test ERROR on v5.8-rc6 next-20200723]
[cannot apply to mpe/next scottwood/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Athira-Rajeev/powerpc-perf-Initialize-power10-PMU-registers-in-cpu-setup-routine/20200723-153537
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
config: powerpc-defconfig (attached as .config)
compiler: powerpc64-linux-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=powerpc 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/powerpc/kernel/cpu_setup_power.S: Assembler messages:
>> arch/powerpc/kernel/cpu_setup_power.S:244: Error: non-constant expression in ".if" statement
>> arch/powerpc/kernel/cpu_setup_power.S:244: Error: non-constant expression in ".if" statement
>> arch/powerpc/kernel/cpu_setup_power.S:243: Error: unsupported relocation against SPRN_MMCR3

vim +244 arch/powerpc/kernel/cpu_setup_power.S

    14	
    15	/* Entry: r3 = crap, r4 = ptr to cputable entry
    16	 *
    17	 * Note that we can be called twice for pseudo-PVRs
    18	 */
    19	_GLOBAL(__setup_cpu_power7)
    20		mflr	r11
    21		bl	__init_hvmode_206
    22		mtlr	r11
    23		beqlr
    24		li	r0,0
    25		mtspr	SPRN_LPID,r0
    26		LOAD_REG_IMMEDIATE(r0, PCR_MASK)
    27		mtspr	SPRN_PCR,r0
    28		mfspr	r3,SPRN_LPCR
    29		li	r4,(LPCR_LPES1 >> LPCR_LPES_SH)
    30		bl	__init_LPCR_ISA206
    31		mtlr	r11
    32		blr
    33	
    34	_GLOBAL(__restore_cpu_power7)
    35		mflr	r11
    36		mfmsr	r3
    37		rldicl.	r0,r3,4,63
    38		beqlr
    39		li	r0,0
    40		mtspr	SPRN_LPID,r0
    41		LOAD_REG_IMMEDIATE(r0, PCR_MASK)
    42		mtspr	SPRN_PCR,r0
    43		mfspr	r3,SPRN_LPCR
    44		li	r4,(LPCR_LPES1 >> LPCR_LPES_SH)
    45		bl	__init_LPCR_ISA206
    46		mtlr	r11
    47		blr
    48	
    49	_GLOBAL(__setup_cpu_power8)
    50		mflr	r11
    51		bl	__init_FSCR
    52		bl	__init_PMU
    53		bl	__init_PMU_ISA207
    54		bl	__init_hvmode_206
    55		mtlr	r11
    56		beqlr
    57		li	r0,0
    58		mtspr	SPRN_LPID,r0
    59		LOAD_REG_IMMEDIATE(r0, PCR_MASK)
    60		mtspr	SPRN_PCR,r0
    61		mfspr	r3,SPRN_LPCR
    62		ori	r3, r3, LPCR_PECEDH
    63		li	r4,0 /* LPES = 0 */
    64		bl	__init_LPCR_ISA206
    65		bl	__init_HFSCR
    66		bl	__init_PMU_HV
    67		bl	__init_PMU_HV_ISA207
    68		mtlr	r11
    69		blr
    70	
    71	_GLOBAL(__restore_cpu_power8)
    72		mflr	r11
    73		bl	__init_FSCR
    74		bl	__init_PMU
    75		bl	__init_PMU_ISA207
    76		mfmsr	r3
    77		rldicl.	r0,r3,4,63
    78		mtlr	r11
    79		beqlr
    80		li	r0,0
    81		mtspr	SPRN_LPID,r0
    82		LOAD_REG_IMMEDIATE(r0, PCR_MASK)
    83		mtspr	SPRN_PCR,r0
    84		mfspr   r3,SPRN_LPCR
    85		ori	r3, r3, LPCR_PECEDH
    86		li	r4,0 /* LPES = 0 */
    87		bl	__init_LPCR_ISA206
    88		bl	__init_HFSCR
    89		bl	__init_PMU_HV
    90		bl	__init_PMU_HV_ISA207
    91		mtlr	r11
    92		blr
    93	
    94	_GLOBAL(__setup_cpu_power10)
    95		mflr	r11
    96		bl	__init_FSCR_power10
    97		bl	__init_PMU
    98		bl	__init_PMU_ISA31
    99		b	1f
   100	
   101	_GLOBAL(__setup_cpu_power9)
   102		mflr	r11
   103		bl	__init_FSCR
   104		bl	__init_PMU
   105	1:	bl	__init_hvmode_206
   106		mtlr	r11
   107		beqlr
   108		li	r0,0
   109		mtspr	SPRN_PSSCR,r0
   110		mtspr	SPRN_LPID,r0
   111		mtspr	SPRN_PID,r0
   112		LOAD_REG_IMMEDIATE(r0, PCR_MASK)
   113		mtspr	SPRN_PCR,r0
   114		mfspr	r3,SPRN_LPCR
   115		LOAD_REG_IMMEDIATE(r4, LPCR_PECEDH | LPCR_PECE_HVEE | LPCR_HVICE  | LPCR_HEIC)
   116		or	r3, r3, r4
   117		LOAD_REG_IMMEDIATE(r4, LPCR_UPRT | LPCR_HR)
   118		andc	r3, r3, r4
   119		li	r4,0 /* LPES = 0 */
   120		bl	__init_LPCR_ISA300
   121		bl	__init_HFSCR
   122		bl	__init_PMU_HV
   123		mtlr	r11
   124		blr
   125	
   126	_GLOBAL(__restore_cpu_power10)
   127		mflr	r11
   128		bl	__init_FSCR_power10
   129		bl	__init_PMU
   130		bl	__init_PMU_ISA31
   131		b	1f
   132	
   133	_GLOBAL(__restore_cpu_power9)
   134		mflr	r11
   135		bl	__init_FSCR
   136		bl	__init_PMU
   137	1:	mfmsr	r3
   138		rldicl.	r0,r3,4,63
   139		mtlr	r11
   140		beqlr
   141		li	r0,0
   142		mtspr	SPRN_PSSCR,r0
   143		mtspr	SPRN_LPID,r0
   144		mtspr	SPRN_PID,r0
   145		LOAD_REG_IMMEDIATE(r0, PCR_MASK)
   146		mtspr	SPRN_PCR,r0
   147		mfspr   r3,SPRN_LPCR
   148		LOAD_REG_IMMEDIATE(r4, LPCR_PECEDH | LPCR_PECE_HVEE | LPCR_HVICE | LPCR_HEIC)
   149		or	r3, r3, r4
   150		LOAD_REG_IMMEDIATE(r4, LPCR_UPRT | LPCR_HR)
   151		andc	r3, r3, r4
   152		li	r4,0 /* LPES = 0 */
   153		bl	__init_LPCR_ISA300
   154		bl	__init_HFSCR
   155		bl	__init_PMU_HV
   156		mtlr	r11
   157		blr
   158	
   159	__init_hvmode_206:
   160		/* Disable CPU_FTR_HVMODE and exit if MSR:HV is not set */
   161		mfmsr	r3
   162		rldicl.	r0,r3,4,63
   163		bnelr
   164		ld	r5,CPU_SPEC_FEATURES(r4)
   165		LOAD_REG_IMMEDIATE(r6,CPU_FTR_HVMODE | CPU_FTR_P9_TM_HV_ASSIST)
   166		andc	r5,r5,r6
   167		std	r5,CPU_SPEC_FEATURES(r4)
   168		blr
   169	
   170	__init_LPCR_ISA206:
   171		/* Setup a sane LPCR:
   172		 *   Called with initial LPCR in R3 and desired LPES 2-bit value in R4
   173		 *
   174		 *   LPES = 0b01 (HSRR0/1 used for 0x500)
   175		 *   PECE = 0b111
   176		 *   DPFD = 4
   177		 *   HDICE = 0
   178		 *   VC = 0b100 (VPM0=1, VPM1=0, ISL=0)
   179		 *   VRMASD = 0b10000 (L=1, LP=00)
   180		 *
   181		 * Other bits untouched for now
   182		 */
   183		li	r5,0x10
   184		rldimi	r3,r5, LPCR_VRMASD_SH, 64-LPCR_VRMASD_SH-5
   185	
   186		/* POWER9 has no VRMASD */
   187	__init_LPCR_ISA300:
   188		rldimi	r3,r4, LPCR_LPES_SH, 64-LPCR_LPES_SH-2
   189		ori	r3,r3,(LPCR_PECE0|LPCR_PECE1|LPCR_PECE2)
   190		li	r5,4
   191		rldimi	r3,r5, LPCR_DPFD_SH, 64-LPCR_DPFD_SH-3
   192		clrrdi	r3,r3,1		/* clear HDICE */
   193		li	r5,4
   194		rldimi	r3,r5, LPCR_VC_SH, 0
   195		mtspr	SPRN_LPCR,r3
   196		isync
   197		blr
   198	
   199	__init_FSCR_power10:
   200		mfspr	r3, SPRN_FSCR
   201		ori	r3, r3, FSCR_PREFIX
   202		mtspr	SPRN_FSCR, r3
   203		// fall through
   204	
   205	__init_FSCR:
   206		mfspr	r3,SPRN_FSCR
   207		ori	r3,r3,FSCR_TAR|FSCR_EBB
   208		mtspr	SPRN_FSCR,r3
   209		blr
   210	
   211	__init_HFSCR:
   212		mfspr	r3,SPRN_HFSCR
   213		ori	r3,r3,HFSCR_TAR|HFSCR_TM|HFSCR_BHRB|HFSCR_PM|\
   214			      HFSCR_DSCR|HFSCR_VECVSX|HFSCR_FP|HFSCR_EBB|HFSCR_MSGP
   215		mtspr	SPRN_HFSCR,r3
   216		blr
   217	
   218	__init_PMU_HV:
   219		li	r5,0
   220		mtspr	SPRN_MMCRC,r5
   221		blr
   222	
   223	__init_PMU_HV_ISA207:
   224		li	r5,0
   225		mtspr	SPRN_MMCRH,r5
   226		blr
   227	
   228	__init_PMU:
   229		li	r5,0
   230		mtspr	SPRN_MMCRA,r5
   231		mtspr	SPRN_MMCR0,r5
   232		mtspr	SPRN_MMCR1,r5
   233		mtspr	SPRN_MMCR2,r5
   234		blr
   235	
   236	__init_PMU_ISA207:
   237		li	r5,0
   238		mtspr	SPRN_MMCRS,r5
   239		blr
   240	
   241	__init_PMU_ISA31:
   242		li	r5,0
 > 243		mtspr	SPRN_MMCR3,r5
 > 244		LOAD_REG_IMMEDIATE(r5, MMCRA_BHRB_DISABLE)

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--7JfCtLOvnd9MIVvH
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
OJav1/8Bo86fGAauAQA=

--7JfCtLOvnd9MIVvH--
