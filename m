Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CECC0244505
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Aug 2020 08:29:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BSYSw482TzDqjQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Aug 2020 16:29:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BSYQp5Nk8zDqfP
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Aug 2020 16:28:01 +1000 (AEST)
IronPort-SDR: Wa1cANeSAMHzQdJaDN/sFi0vvecKJBvA0m61mtGGKpO1KKhqgDpA48Z8aPVVrAXFvr/DDZfAVx
 RFmg9CRYDYOg==
X-IronPort-AV: E=McAfee;i="6000,8403,9712"; a="153592613"
X-IronPort-AV: E=Sophos;i="5.76,311,1592895600"; 
 d="gz'50?scan'50,208,50";a="153592613"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2020 23:27:57 -0700
IronPort-SDR: VU5HwOLPSSiG9H42FPX8flM4oZtIM7l3WqMRvbQYkg4hqTw5uwJTBnehPplX9HfOYFc/Iij8G5
 feH98Yyad+WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,311,1592895600"; 
 d="gz'50?scan'50,208,50";a="333332617"
Received: from lkp-server01.sh.intel.com (HELO 7f1ebb311643) ([10.239.97.150])
 by FMSMGA003.fm.intel.com with ESMTP; 13 Aug 2020 23:27:55 -0700
Received: from kbuild by 7f1ebb311643 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1k6TBz-00011t-1c; Fri, 14 Aug 2020 06:27:55 +0000
Date: Fri, 14 Aug 2020 14:27:48 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, mpe@ellerman.id.au
Subject: Re: [PATCH] powerpc: Add POWER10 raw mode cputable entry
Message-ID: <202008141438.ZTQh1pcI%lkp@intel.com>
References: <20200814035903.3179314-1-maddy@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="4Ckj6UjgE2iN1+kY"
Content-Disposition: inline
In-Reply-To: <20200814035903.3179314-1-maddy@linux.ibm.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
 kbuild-all@lists.01.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--4Ckj6UjgE2iN1+kY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Madhavan,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on powerpc/next]
[also build test ERROR on v5.8 next-20200814]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Madhavan-Srinivasan/powerpc-Add-POWER10-raw-mode-cputable-entry/20200814-120142
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

>> arch/powerpc/kernel/cputable.c:561:26: error: '__machine_check_early_realmode_p10' undeclared here (not in a function); did you mean '__machine_check_early_realmode_p9'?
     561 |   .machine_check_early = __machine_check_early_realmode_p10,
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                          __machine_check_early_realmode_p9

vim +561 arch/powerpc/kernel/cputable.c

   136	
   137	static struct cpu_spec __initdata cpu_specs[] = {
   138	#ifdef CONFIG_PPC_BOOK3S_64
   139		{	/* PPC970 */
   140			.pvr_mask		= 0xffff0000,
   141			.pvr_value		= 0x00390000,
   142			.cpu_name		= "PPC970",
   143			.cpu_features		= CPU_FTRS_PPC970,
   144			.cpu_user_features	= COMMON_USER_POWER4 |
   145				PPC_FEATURE_HAS_ALTIVEC_COMP,
   146			.mmu_features		= MMU_FTRS_PPC970,
   147			.icache_bsize		= 128,
   148			.dcache_bsize		= 128,
   149			.num_pmcs		= 8,
   150			.pmc_type		= PPC_PMC_IBM,
   151			.cpu_setup		= __setup_cpu_ppc970,
   152			.cpu_restore		= __restore_cpu_ppc970,
   153			.oprofile_cpu_type	= "ppc64/970",
   154			.oprofile_type		= PPC_OPROFILE_POWER4,
   155			.platform		= "ppc970",
   156		},
   157		{	/* PPC970FX */
   158			.pvr_mask		= 0xffff0000,
   159			.pvr_value		= 0x003c0000,
   160			.cpu_name		= "PPC970FX",
   161			.cpu_features		= CPU_FTRS_PPC970,
   162			.cpu_user_features	= COMMON_USER_POWER4 |
   163				PPC_FEATURE_HAS_ALTIVEC_COMP,
   164			.mmu_features		= MMU_FTRS_PPC970,
   165			.icache_bsize		= 128,
   166			.dcache_bsize		= 128,
   167			.num_pmcs		= 8,
   168			.pmc_type		= PPC_PMC_IBM,
   169			.cpu_setup		= __setup_cpu_ppc970,
   170			.cpu_restore		= __restore_cpu_ppc970,
   171			.oprofile_cpu_type	= "ppc64/970",
   172			.oprofile_type		= PPC_OPROFILE_POWER4,
   173			.platform		= "ppc970",
   174		},
   175		{	/* PPC970MP DD1.0 - no DEEPNAP, use regular 970 init */
   176			.pvr_mask		= 0xffffffff,
   177			.pvr_value		= 0x00440100,
   178			.cpu_name		= "PPC970MP",
   179			.cpu_features		= CPU_FTRS_PPC970,
   180			.cpu_user_features	= COMMON_USER_POWER4 |
   181				PPC_FEATURE_HAS_ALTIVEC_COMP,
   182			.mmu_features		= MMU_FTRS_PPC970,
   183			.icache_bsize		= 128,
   184			.dcache_bsize		= 128,
   185			.num_pmcs		= 8,
   186			.pmc_type		= PPC_PMC_IBM,
   187			.cpu_setup		= __setup_cpu_ppc970,
   188			.cpu_restore		= __restore_cpu_ppc970,
   189			.oprofile_cpu_type	= "ppc64/970MP",
   190			.oprofile_type		= PPC_OPROFILE_POWER4,
   191			.platform		= "ppc970",
   192		},
   193		{	/* PPC970MP */
   194			.pvr_mask		= 0xffff0000,
   195			.pvr_value		= 0x00440000,
   196			.cpu_name		= "PPC970MP",
   197			.cpu_features		= CPU_FTRS_PPC970,
   198			.cpu_user_features	= COMMON_USER_POWER4 |
   199				PPC_FEATURE_HAS_ALTIVEC_COMP,
   200			.mmu_features		= MMU_FTRS_PPC970,
   201			.icache_bsize		= 128,
   202			.dcache_bsize		= 128,
   203			.num_pmcs		= 8,
   204			.pmc_type		= PPC_PMC_IBM,
   205			.cpu_setup		= __setup_cpu_ppc970MP,
   206			.cpu_restore		= __restore_cpu_ppc970,
   207			.oprofile_cpu_type	= "ppc64/970MP",
   208			.oprofile_type		= PPC_OPROFILE_POWER4,
   209			.platform		= "ppc970",
   210		},
   211		{	/* PPC970GX */
   212			.pvr_mask		= 0xffff0000,
   213			.pvr_value		= 0x00450000,
   214			.cpu_name		= "PPC970GX",
   215			.cpu_features		= CPU_FTRS_PPC970,
   216			.cpu_user_features	= COMMON_USER_POWER4 |
   217				PPC_FEATURE_HAS_ALTIVEC_COMP,
   218			.mmu_features		= MMU_FTRS_PPC970,
   219			.icache_bsize		= 128,
   220			.dcache_bsize		= 128,
   221			.num_pmcs		= 8,
   222			.pmc_type		= PPC_PMC_IBM,
   223			.cpu_setup		= __setup_cpu_ppc970,
   224			.oprofile_cpu_type	= "ppc64/970",
   225			.oprofile_type		= PPC_OPROFILE_POWER4,
   226			.platform		= "ppc970",
   227		},
   228		{	/* Power5 GR */
   229			.pvr_mask		= 0xffff0000,
   230			.pvr_value		= 0x003a0000,
   231			.cpu_name		= "POWER5 (gr)",
   232			.cpu_features		= CPU_FTRS_POWER5,
   233			.cpu_user_features	= COMMON_USER_POWER5,
   234			.mmu_features		= MMU_FTRS_POWER5,
   235			.icache_bsize		= 128,
   236			.dcache_bsize		= 128,
   237			.num_pmcs		= 6,
   238			.pmc_type		= PPC_PMC_IBM,
   239			.oprofile_cpu_type	= "ppc64/power5",
   240			.oprofile_type		= PPC_OPROFILE_POWER4,
   241			/* SIHV / SIPR bits are implemented on POWER4+ (GQ)
   242			 * and above but only works on POWER5 and above
   243			 */
   244			.oprofile_mmcra_sihv	= MMCRA_SIHV,
   245			.oprofile_mmcra_sipr	= MMCRA_SIPR,
   246			.platform		= "power5",
   247		},
   248		{	/* Power5++ */
   249			.pvr_mask		= 0xffffff00,
   250			.pvr_value		= 0x003b0300,
   251			.cpu_name		= "POWER5+ (gs)",
   252			.cpu_features		= CPU_FTRS_POWER5,
   253			.cpu_user_features	= COMMON_USER_POWER5_PLUS,
   254			.mmu_features		= MMU_FTRS_POWER5,
   255			.icache_bsize		= 128,
   256			.dcache_bsize		= 128,
   257			.num_pmcs		= 6,
   258			.oprofile_cpu_type	= "ppc64/power5++",
   259			.oprofile_type		= PPC_OPROFILE_POWER4,
   260			.oprofile_mmcra_sihv	= MMCRA_SIHV,
   261			.oprofile_mmcra_sipr	= MMCRA_SIPR,
   262			.platform		= "power5+",
   263		},
   264		{	/* Power5 GS */
   265			.pvr_mask		= 0xffff0000,
   266			.pvr_value		= 0x003b0000,
   267			.cpu_name		= "POWER5+ (gs)",
   268			.cpu_features		= CPU_FTRS_POWER5,
   269			.cpu_user_features	= COMMON_USER_POWER5_PLUS,
   270			.mmu_features		= MMU_FTRS_POWER5,
   271			.icache_bsize		= 128,
   272			.dcache_bsize		= 128,
   273			.num_pmcs		= 6,
   274			.pmc_type		= PPC_PMC_IBM,
   275			.oprofile_cpu_type	= "ppc64/power5+",
   276			.oprofile_type		= PPC_OPROFILE_POWER4,
   277			.oprofile_mmcra_sihv	= MMCRA_SIHV,
   278			.oprofile_mmcra_sipr	= MMCRA_SIPR,
   279			.platform		= "power5+",
   280		},
   281		{	/* POWER6 in P5+ mode; 2.04-compliant processor */
   282			.pvr_mask		= 0xffffffff,
   283			.pvr_value		= 0x0f000001,
   284			.cpu_name		= "POWER5+",
   285			.cpu_features		= CPU_FTRS_POWER5,
   286			.cpu_user_features	= COMMON_USER_POWER5_PLUS,
   287			.mmu_features		= MMU_FTRS_POWER5,
   288			.icache_bsize		= 128,
   289			.dcache_bsize		= 128,
   290			.oprofile_cpu_type	= "ppc64/ibm-compat-v1",
   291			.oprofile_type		= PPC_OPROFILE_POWER4,
   292			.platform		= "power5+",
   293		},
   294		{	/* Power6 */
   295			.pvr_mask		= 0xffff0000,
   296			.pvr_value		= 0x003e0000,
   297			.cpu_name		= "POWER6 (raw)",
   298			.cpu_features		= CPU_FTRS_POWER6,
   299			.cpu_user_features	= COMMON_USER_POWER6 |
   300				PPC_FEATURE_POWER6_EXT,
   301			.mmu_features		= MMU_FTRS_POWER6,
   302			.icache_bsize		= 128,
   303			.dcache_bsize		= 128,
   304			.num_pmcs		= 6,
   305			.pmc_type		= PPC_PMC_IBM,
   306			.oprofile_cpu_type	= "ppc64/power6",
   307			.oprofile_type		= PPC_OPROFILE_POWER4,
   308			.oprofile_mmcra_sihv	= POWER6_MMCRA_SIHV,
   309			.oprofile_mmcra_sipr	= POWER6_MMCRA_SIPR,
   310			.oprofile_mmcra_clear	= POWER6_MMCRA_THRM |
   311				POWER6_MMCRA_OTHER,
   312			.platform		= "power6x",
   313		},
   314		{	/* 2.05-compliant processor, i.e. Power6 "architected" mode */
   315			.pvr_mask		= 0xffffffff,
   316			.pvr_value		= 0x0f000002,
   317			.cpu_name		= "POWER6 (architected)",
   318			.cpu_features		= CPU_FTRS_POWER6,
   319			.cpu_user_features	= COMMON_USER_POWER6,
   320			.mmu_features		= MMU_FTRS_POWER6,
   321			.icache_bsize		= 128,
   322			.dcache_bsize		= 128,
   323			.oprofile_cpu_type	= "ppc64/ibm-compat-v1",
   324			.oprofile_type		= PPC_OPROFILE_POWER4,
   325			.platform		= "power6",
   326		},
   327		{	/* 2.06-compliant processor, i.e. Power7 "architected" mode */
   328			.pvr_mask		= 0xffffffff,
   329			.pvr_value		= 0x0f000003,
   330			.cpu_name		= "POWER7 (architected)",
   331			.cpu_features		= CPU_FTRS_POWER7,
   332			.cpu_user_features	= COMMON_USER_POWER7,
   333			.cpu_user_features2	= COMMON_USER2_POWER7,
   334			.mmu_features		= MMU_FTRS_POWER7,
   335			.icache_bsize		= 128,
   336			.dcache_bsize		= 128,
   337			.oprofile_type		= PPC_OPROFILE_POWER4,
   338			.oprofile_cpu_type	= "ppc64/ibm-compat-v1",
   339			.cpu_setup		= __setup_cpu_power7,
   340			.cpu_restore		= __restore_cpu_power7,
   341			.machine_check_early	= __machine_check_early_realmode_p7,
   342			.platform		= "power7",
   343		},
   344		{	/* 2.07-compliant processor, i.e. Power8 "architected" mode */
   345			.pvr_mask		= 0xffffffff,
   346			.pvr_value		= 0x0f000004,
   347			.cpu_name		= "POWER8 (architected)",
   348			.cpu_features		= CPU_FTRS_POWER8,
   349			.cpu_user_features	= COMMON_USER_POWER8,
   350			.cpu_user_features2	= COMMON_USER2_POWER8,
   351			.mmu_features		= MMU_FTRS_POWER8,
   352			.icache_bsize		= 128,
   353			.dcache_bsize		= 128,
   354			.oprofile_type		= PPC_OPROFILE_INVALID,
   355			.oprofile_cpu_type	= "ppc64/ibm-compat-v1",
   356			.cpu_setup		= __setup_cpu_power8,
   357			.cpu_restore		= __restore_cpu_power8,
   358			.machine_check_early	= __machine_check_early_realmode_p8,
   359			.platform		= "power8",
   360		},
   361		{	/* 3.00-compliant processor, i.e. Power9 "architected" mode */
   362			.pvr_mask		= 0xffffffff,
   363			.pvr_value		= 0x0f000005,
   364			.cpu_name		= "POWER9 (architected)",
   365			.cpu_features		= CPU_FTRS_POWER9,
   366			.cpu_user_features	= COMMON_USER_POWER9,
   367			.cpu_user_features2	= COMMON_USER2_POWER9,
   368			.mmu_features		= MMU_FTRS_POWER9,
   369			.icache_bsize		= 128,
   370			.dcache_bsize		= 128,
   371			.oprofile_type		= PPC_OPROFILE_INVALID,
   372			.oprofile_cpu_type	= "ppc64/ibm-compat-v1",
   373			.cpu_setup		= __setup_cpu_power9,
   374			.cpu_restore		= __restore_cpu_power9,
   375			.platform		= "power9",
   376		},
   377		{	/* 3.1-compliant processor, i.e. Power10 "architected" mode */
   378			.pvr_mask		= 0xffffffff,
   379			.pvr_value		= 0x0f000006,
   380			.cpu_name		= "POWER10 (architected)",
   381			.cpu_features		= CPU_FTRS_POWER10,
   382			.cpu_user_features	= COMMON_USER_POWER10,
   383			.cpu_user_features2	= COMMON_USER2_POWER10,
   384			.mmu_features		= MMU_FTRS_POWER10,
   385			.icache_bsize		= 128,
   386			.dcache_bsize		= 128,
   387			.oprofile_type		= PPC_OPROFILE_INVALID,
   388			.oprofile_cpu_type	= "ppc64/ibm-compat-v1",
   389			.cpu_setup		= __setup_cpu_power10,
   390			.cpu_restore		= __restore_cpu_power10,
   391			.platform		= "power10",
   392		},
   393		{	/* Power7 */
   394			.pvr_mask		= 0xffff0000,
   395			.pvr_value		= 0x003f0000,
   396			.cpu_name		= "POWER7 (raw)",
   397			.cpu_features		= CPU_FTRS_POWER7,
   398			.cpu_user_features	= COMMON_USER_POWER7,
   399			.cpu_user_features2	= COMMON_USER2_POWER7,
   400			.mmu_features		= MMU_FTRS_POWER7,
   401			.icache_bsize		= 128,
   402			.dcache_bsize		= 128,
   403			.num_pmcs		= 6,
   404			.pmc_type		= PPC_PMC_IBM,
   405			.oprofile_cpu_type	= "ppc64/power7",
   406			.oprofile_type		= PPC_OPROFILE_POWER4,
   407			.cpu_setup		= __setup_cpu_power7,
   408			.cpu_restore		= __restore_cpu_power7,
   409			.machine_check_early	= __machine_check_early_realmode_p7,
   410			.platform		= "power7",
   411		},
   412		{	/* Power7+ */
   413			.pvr_mask		= 0xffff0000,
   414			.pvr_value		= 0x004A0000,
   415			.cpu_name		= "POWER7+ (raw)",
   416			.cpu_features		= CPU_FTRS_POWER7,
   417			.cpu_user_features	= COMMON_USER_POWER7,
   418			.cpu_user_features2	= COMMON_USER2_POWER7,
   419			.mmu_features		= MMU_FTRS_POWER7,
   420			.icache_bsize		= 128,
   421			.dcache_bsize		= 128,
   422			.num_pmcs		= 6,
   423			.pmc_type		= PPC_PMC_IBM,
   424			.oprofile_cpu_type	= "ppc64/power7",
   425			.oprofile_type		= PPC_OPROFILE_POWER4,
   426			.cpu_setup		= __setup_cpu_power7,
   427			.cpu_restore		= __restore_cpu_power7,
   428			.machine_check_early	= __machine_check_early_realmode_p7,
   429			.platform		= "power7+",
   430		},
   431		{	/* Power8E */
   432			.pvr_mask		= 0xffff0000,
   433			.pvr_value		= 0x004b0000,
   434			.cpu_name		= "POWER8E (raw)",
   435			.cpu_features		= CPU_FTRS_POWER8E,
   436			.cpu_user_features	= COMMON_USER_POWER8,
   437			.cpu_user_features2	= COMMON_USER2_POWER8,
   438			.mmu_features		= MMU_FTRS_POWER8,
   439			.icache_bsize		= 128,
   440			.dcache_bsize		= 128,
   441			.num_pmcs		= 6,
   442			.pmc_type		= PPC_PMC_IBM,
   443			.oprofile_cpu_type	= "ppc64/power8",
   444			.oprofile_type		= PPC_OPROFILE_INVALID,
   445			.cpu_setup		= __setup_cpu_power8,
   446			.cpu_restore		= __restore_cpu_power8,
   447			.machine_check_early	= __machine_check_early_realmode_p8,
   448			.platform		= "power8",
   449		},
   450		{	/* Power8NVL */
   451			.pvr_mask		= 0xffff0000,
   452			.pvr_value		= 0x004c0000,
   453			.cpu_name		= "POWER8NVL (raw)",
   454			.cpu_features		= CPU_FTRS_POWER8,
   455			.cpu_user_features	= COMMON_USER_POWER8,
   456			.cpu_user_features2	= COMMON_USER2_POWER8,
   457			.mmu_features		= MMU_FTRS_POWER8,
   458			.icache_bsize		= 128,
   459			.dcache_bsize		= 128,
   460			.num_pmcs		= 6,
   461			.pmc_type		= PPC_PMC_IBM,
   462			.oprofile_cpu_type	= "ppc64/power8",
   463			.oprofile_type		= PPC_OPROFILE_INVALID,
   464			.cpu_setup		= __setup_cpu_power8,
   465			.cpu_restore		= __restore_cpu_power8,
   466			.machine_check_early	= __machine_check_early_realmode_p8,
   467			.platform		= "power8",
   468		},
   469		{	/* Power8 */
   470			.pvr_mask		= 0xffff0000,
   471			.pvr_value		= 0x004d0000,
   472			.cpu_name		= "POWER8 (raw)",
   473			.cpu_features		= CPU_FTRS_POWER8,
   474			.cpu_user_features	= COMMON_USER_POWER8,
   475			.cpu_user_features2	= COMMON_USER2_POWER8,
   476			.mmu_features		= MMU_FTRS_POWER8,
   477			.icache_bsize		= 128,
   478			.dcache_bsize		= 128,
   479			.num_pmcs		= 6,
   480			.pmc_type		= PPC_PMC_IBM,
   481			.oprofile_cpu_type	= "ppc64/power8",
   482			.oprofile_type		= PPC_OPROFILE_INVALID,
   483			.cpu_setup		= __setup_cpu_power8,
   484			.cpu_restore		= __restore_cpu_power8,
   485			.machine_check_early	= __machine_check_early_realmode_p8,
   486			.platform		= "power8",
   487		},
   488		{	/* Power9 DD2.0 */
   489			.pvr_mask		= 0xffffefff,
   490			.pvr_value		= 0x004e0200,
   491			.cpu_name		= "POWER9 (raw)",
   492			.cpu_features		= CPU_FTRS_POWER9_DD2_0,
   493			.cpu_user_features	= COMMON_USER_POWER9,
   494			.cpu_user_features2	= COMMON_USER2_POWER9,
   495			.mmu_features		= MMU_FTRS_POWER9,
   496			.icache_bsize		= 128,
   497			.dcache_bsize		= 128,
   498			.num_pmcs		= 6,
   499			.pmc_type		= PPC_PMC_IBM,
   500			.oprofile_cpu_type	= "ppc64/power9",
   501			.oprofile_type		= PPC_OPROFILE_INVALID,
   502			.cpu_setup		= __setup_cpu_power9,
   503			.cpu_restore		= __restore_cpu_power9,
   504			.machine_check_early	= __machine_check_early_realmode_p9,
   505			.platform		= "power9",
   506		},
   507		{	/* Power9 DD 2.1 */
   508			.pvr_mask		= 0xffffefff,
   509			.pvr_value		= 0x004e0201,
   510			.cpu_name		= "POWER9 (raw)",
   511			.cpu_features		= CPU_FTRS_POWER9_DD2_1,
   512			.cpu_user_features	= COMMON_USER_POWER9,
   513			.cpu_user_features2	= COMMON_USER2_POWER9,
   514			.mmu_features		= MMU_FTRS_POWER9,
   515			.icache_bsize		= 128,
   516			.dcache_bsize		= 128,
   517			.num_pmcs		= 6,
   518			.pmc_type		= PPC_PMC_IBM,
   519			.oprofile_cpu_type	= "ppc64/power9",
   520			.oprofile_type		= PPC_OPROFILE_INVALID,
   521			.cpu_setup		= __setup_cpu_power9,
   522			.cpu_restore		= __restore_cpu_power9,
   523			.machine_check_early	= __machine_check_early_realmode_p9,
   524			.platform		= "power9",
   525		},
   526		{	/* Power9 DD2.2 or later */
   527			.pvr_mask		= 0xffff0000,
   528			.pvr_value		= 0x004e0000,
   529			.cpu_name		= "POWER9 (raw)",
   530			.cpu_features		= CPU_FTRS_POWER9_DD2_2,
   531			.cpu_user_features	= COMMON_USER_POWER9,
   532			.cpu_user_features2	= COMMON_USER2_POWER9,
   533			.mmu_features		= MMU_FTRS_POWER9,
   534			.icache_bsize		= 128,
   535			.dcache_bsize		= 128,
   536			.num_pmcs		= 6,
   537			.pmc_type		= PPC_PMC_IBM,
   538			.oprofile_cpu_type	= "ppc64/power9",
   539			.oprofile_type		= PPC_OPROFILE_INVALID,
   540			.cpu_setup		= __setup_cpu_power9,
   541			.cpu_restore		= __restore_cpu_power9,
   542			.machine_check_early	= __machine_check_early_realmode_p9,
   543			.platform		= "power9",
   544		},
   545		{	/* Power10 */
   546			.pvr_mask		= 0xffff0000,
   547			.pvr_value		= 0x00800000,
   548			.cpu_name		= "POWER10 (raw)",
   549			.cpu_features		= CPU_FTRS_POWER10,
   550			.cpu_user_features	= COMMON_USER_POWER10,
   551			.cpu_user_features2	= COMMON_USER2_POWER10,
   552			.mmu_features		= MMU_FTRS_POWER10,
   553			.icache_bsize		= 128,
   554			.dcache_bsize		= 128,
   555			.num_pmcs		= 6,
   556			.pmc_type		= PPC_PMC_IBM,
   557			.oprofile_cpu_type	= "ppc64/power10",
   558			.oprofile_type		= PPC_OPROFILE_INVALID,
   559			.cpu_setup		= __setup_cpu_power10,
   560			.cpu_restore		= __restore_cpu_power10,
 > 561			.machine_check_early	= __machine_check_early_realmode_p10,
   562			.platform		= "power10",
   563		},
   564		{	/* Cell Broadband Engine */
   565			.pvr_mask		= 0xffff0000,
   566			.pvr_value		= 0x00700000,
   567			.cpu_name		= "Cell Broadband Engine",
   568			.cpu_features		= CPU_FTRS_CELL,
   569			.cpu_user_features	= COMMON_USER_PPC64 |
   570				PPC_FEATURE_CELL | PPC_FEATURE_HAS_ALTIVEC_COMP |
   571				PPC_FEATURE_SMT,
   572			.mmu_features		= MMU_FTRS_CELL,
   573			.icache_bsize		= 128,
   574			.dcache_bsize		= 128,
   575			.num_pmcs		= 4,
   576			.pmc_type		= PPC_PMC_IBM,
   577			.oprofile_cpu_type	= "ppc64/cell-be",
   578			.oprofile_type		= PPC_OPROFILE_CELL,
   579			.platform		= "ppc-cell-be",
   580		},
   581		{	/* PA Semi PA6T */
   582			.pvr_mask		= 0x7fff0000,
   583			.pvr_value		= 0x00900000,
   584			.cpu_name		= "PA6T",
   585			.cpu_features		= CPU_FTRS_PA6T,
   586			.cpu_user_features	= COMMON_USER_PA6T,
   587			.mmu_features		= MMU_FTRS_PA6T,
   588			.icache_bsize		= 64,
   589			.dcache_bsize		= 64,
   590			.num_pmcs		= 6,
   591			.pmc_type		= PPC_PMC_PA6T,
   592			.cpu_setup		= __setup_cpu_pa6t,
   593			.cpu_restore		= __restore_cpu_pa6t,
   594			.oprofile_cpu_type	= "ppc64/pa6t",
   595			.oprofile_type		= PPC_OPROFILE_PA6T,
   596			.platform		= "pa6t",
   597		},
   598		{	/* default match */
   599			.pvr_mask		= 0x00000000,
   600			.pvr_value		= 0x00000000,
   601			.cpu_name		= "POWER5 (compatible)",
   602			.cpu_features		= CPU_FTRS_COMPATIBLE,
   603			.cpu_user_features	= COMMON_USER_PPC64,
   604			.mmu_features		= MMU_FTRS_POWER,
   605			.icache_bsize		= 128,
   606			.dcache_bsize		= 128,
   607			.num_pmcs		= 6,
   608			.pmc_type		= PPC_PMC_IBM,
   609			.platform		= "power5",
   610		}
   611	#endif	/* CONFIG_PPC_BOOK3S_64 */
   612	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--4Ckj6UjgE2iN1+kY
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--4Ckj6UjgE2iN1+kY--
