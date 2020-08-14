Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 912B02445CA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Aug 2020 09:22:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BSZdw4vYYzDqk7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Aug 2020 17:22:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=iRNsBVNY; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BSZbn142lzDqk7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Aug 2020 17:20:52 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07E73Yiw134456; Fri, 14 Aug 2020 03:20:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Bo5LNQFehctokwFxGptm6/kAPok2flTjwKNOQgKO14I=;
 b=iRNsBVNYhBr44IokjV85k2vm8x6X0Azh4YrmxP8Tl18tlScSeZT1Obu0NN0wiizBwlu8
 6Fi5U+Hgb+maERpW2Zcn2Sxjt5D/PQPUxAi6msSFykfwbMdF48/kAN1iTGyyakKnX+Sn
 OrANmj2H8ldulIQtcj4gRxqbEFYEHiCzU2VbAPf4uMaGh4nlf7uAS1dqPDGmhuutOB1o
 mcs63BT1e54D8glzyCCympEpaukkoJz51t2RMeMmMZxhLSg0LZHynEkR1EB83nF9nV6l
 yQh26ti7a1mTRnU5WHuxKF5zZy+2bVZVsDh3NVFW3I9SYCd0bJkvE12KRe5hUYwH/yCT qw== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32sraujvj2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Aug 2020 03:20:39 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07E7BW8p018383;
 Fri, 14 Aug 2020 07:20:36 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 32skahebq7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Aug 2020 07:20:36 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07E7KYHo24969596
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Aug 2020 07:20:34 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1F531A4069;
 Fri, 14 Aug 2020 07:20:34 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C2B9AA4066;
 Fri, 14 Aug 2020 07:20:32 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.87.35])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 14 Aug 2020 07:20:32 +0000 (GMT)
Subject: Re: [PATCH] powerpc: Add POWER10 raw mode cputable entry
To: kernel test robot <lkp@intel.com>, mpe@ellerman.id.au
References: <20200814035903.3179314-1-maddy@linux.ibm.com>
 <202008141438.ZTQh1pcI%lkp@intel.com>
From: Madhavan Srinivasan <maddy@linux.ibm.com>
Message-ID: <0ec6954f-13a4-b5d1-7f79-9e6cd9d99c22@linux.ibm.com>
Date: Fri, 14 Aug 2020 12:50:31 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <202008141438.ZTQh1pcI%lkp@intel.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-14_02:2020-08-13,
 2020-08-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0
 malwarescore=0 spamscore=0 mlxscore=0 lowpriorityscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008140054
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



On 8/14/20 11:57 AM, kernel test robot wrote:
> Hi Madhavan,
>
> Thank you for the patch! Yet something to improve:
>
> [auto build test ERROR on powerpc/next]
> [also build test ERROR on v5.8 next-20200814]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/0day-ci/linux/commits/Madhavan-Srinivasan/powerpc-Add-POWER10-raw-mode-cputable-entry/20200814-120142
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
> config: powerpc-defconfig (attached as .config)
> compiler: powerpc64-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # save the attached .config to linux build tree
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=powerpc
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>>> arch/powerpc/kernel/cputable.c:561:26: error: '__machine_check_early_realmode_p10' undeclared here (not in a function); did you mean '__machine_check_early_realmode_p9'?
>       561 |   .machine_check_early = __machine_check_early_realmode_p10,
>           |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>           |                          __machine_check_early_realmode_p9

Yes, i did hit this in my compile check and i added the below line,

diff --git a/arch/powerpc/kernel/cputable.c b/arch/powerpc/kernel/cputable.c
index b4066354f073..b22216db5c71 100644
--- a/arch/powerpc/kernel/cputable.c
+++ b/arch/powerpc/kernel/cputable.c
@@ -75,6 +75,7 @@ extern void __restore_cpu_power10(void);
  extern long __machine_check_early_realmode_p7(struct pt_regs *regs);
  extern long __machine_check_early_realmode_p8(struct pt_regs *regs);
  extern long __machine_check_early_realmode_p9(struct pt_regs *regs);
+extern long __machine_check_early_realmode_p10(struct pt_regs *regs);
  #endif /* CONFIG_PPC64 */
  #if defined(CONFIG_E500)
  extern void __setup_cpu_e5500(unsigned long offset, struct cpu_spec* 
spec);


but my bad, i sent the one i internally reviewed which did not have it.
I will send again. Sorry

Maddy

> vim +561 arch/powerpc/kernel/cputable.c
>
>     136	
>     137	static struct cpu_spec __initdata cpu_specs[] = {
>     138	#ifdef CONFIG_PPC_BOOK3S_64
>     139		{	/* PPC970 */
>     140			.pvr_mask		= 0xffff0000,
>     141			.pvr_value		= 0x00390000,
>     142			.cpu_name		= "PPC970",
>     143			.cpu_features		= CPU_FTRS_PPC970,
>     144			.cpu_user_features	= COMMON_USER_POWER4 |
>     145				PPC_FEATURE_HAS_ALTIVEC_COMP,
>     146			.mmu_features		= MMU_FTRS_PPC970,
>     147			.icache_bsize		= 128,
>     148			.dcache_bsize		= 128,
>     149			.num_pmcs		= 8,
>     150			.pmc_type		= PPC_PMC_IBM,
>     151			.cpu_setup		= __setup_cpu_ppc970,
>     152			.cpu_restore		= __restore_cpu_ppc970,
>     153			.oprofile_cpu_type	= "ppc64/970",
>     154			.oprofile_type		= PPC_OPROFILE_POWER4,
>     155			.platform		= "ppc970",
>     156		},
>     157		{	/* PPC970FX */
>     158			.pvr_mask		= 0xffff0000,
>     159			.pvr_value		= 0x003c0000,
>     160			.cpu_name		= "PPC970FX",
>     161			.cpu_features		= CPU_FTRS_PPC970,
>     162			.cpu_user_features	= COMMON_USER_POWER4 |
>     163				PPC_FEATURE_HAS_ALTIVEC_COMP,
>     164			.mmu_features		= MMU_FTRS_PPC970,
>     165			.icache_bsize		= 128,
>     166			.dcache_bsize		= 128,
>     167			.num_pmcs		= 8,
>     168			.pmc_type		= PPC_PMC_IBM,
>     169			.cpu_setup		= __setup_cpu_ppc970,
>     170			.cpu_restore		= __restore_cpu_ppc970,
>     171			.oprofile_cpu_type	= "ppc64/970",
>     172			.oprofile_type		= PPC_OPROFILE_POWER4,
>     173			.platform		= "ppc970",
>     174		},
>     175		{	/* PPC970MP DD1.0 - no DEEPNAP, use regular 970 init */
>     176			.pvr_mask		= 0xffffffff,
>     177			.pvr_value		= 0x00440100,
>     178			.cpu_name		= "PPC970MP",
>     179			.cpu_features		= CPU_FTRS_PPC970,
>     180			.cpu_user_features	= COMMON_USER_POWER4 |
>     181				PPC_FEATURE_HAS_ALTIVEC_COMP,
>     182			.mmu_features		= MMU_FTRS_PPC970,
>     183			.icache_bsize		= 128,
>     184			.dcache_bsize		= 128,
>     185			.num_pmcs		= 8,
>     186			.pmc_type		= PPC_PMC_IBM,
>     187			.cpu_setup		= __setup_cpu_ppc970,
>     188			.cpu_restore		= __restore_cpu_ppc970,
>     189			.oprofile_cpu_type	= "ppc64/970MP",
>     190			.oprofile_type		= PPC_OPROFILE_POWER4,
>     191			.platform		= "ppc970",
>     192		},
>     193		{	/* PPC970MP */
>     194			.pvr_mask		= 0xffff0000,
>     195			.pvr_value		= 0x00440000,
>     196			.cpu_name		= "PPC970MP",
>     197			.cpu_features		= CPU_FTRS_PPC970,
>     198			.cpu_user_features	= COMMON_USER_POWER4 |
>     199				PPC_FEATURE_HAS_ALTIVEC_COMP,
>     200			.mmu_features		= MMU_FTRS_PPC970,
>     201			.icache_bsize		= 128,
>     202			.dcache_bsize		= 128,
>     203			.num_pmcs		= 8,
>     204			.pmc_type		= PPC_PMC_IBM,
>     205			.cpu_setup		= __setup_cpu_ppc970MP,
>     206			.cpu_restore		= __restore_cpu_ppc970,
>     207			.oprofile_cpu_type	= "ppc64/970MP",
>     208			.oprofile_type		= PPC_OPROFILE_POWER4,
>     209			.platform		= "ppc970",
>     210		},
>     211		{	/* PPC970GX */
>     212			.pvr_mask		= 0xffff0000,
>     213			.pvr_value		= 0x00450000,
>     214			.cpu_name		= "PPC970GX",
>     215			.cpu_features		= CPU_FTRS_PPC970,
>     216			.cpu_user_features	= COMMON_USER_POWER4 |
>     217				PPC_FEATURE_HAS_ALTIVEC_COMP,
>     218			.mmu_features		= MMU_FTRS_PPC970,
>     219			.icache_bsize		= 128,
>     220			.dcache_bsize		= 128,
>     221			.num_pmcs		= 8,
>     222			.pmc_type		= PPC_PMC_IBM,
>     223			.cpu_setup		= __setup_cpu_ppc970,
>     224			.oprofile_cpu_type	= "ppc64/970",
>     225			.oprofile_type		= PPC_OPROFILE_POWER4,
>     226			.platform		= "ppc970",
>     227		},
>     228		{	/* Power5 GR */
>     229			.pvr_mask		= 0xffff0000,
>     230			.pvr_value		= 0x003a0000,
>     231			.cpu_name		= "POWER5 (gr)",
>     232			.cpu_features		= CPU_FTRS_POWER5,
>     233			.cpu_user_features	= COMMON_USER_POWER5,
>     234			.mmu_features		= MMU_FTRS_POWER5,
>     235			.icache_bsize		= 128,
>     236			.dcache_bsize		= 128,
>     237			.num_pmcs		= 6,
>     238			.pmc_type		= PPC_PMC_IBM,
>     239			.oprofile_cpu_type	= "ppc64/power5",
>     240			.oprofile_type		= PPC_OPROFILE_POWER4,
>     241			/* SIHV / SIPR bits are implemented on POWER4+ (GQ)
>     242			 * and above but only works on POWER5 and above
>     243			 */
>     244			.oprofile_mmcra_sihv	= MMCRA_SIHV,
>     245			.oprofile_mmcra_sipr	= MMCRA_SIPR,
>     246			.platform		= "power5",
>     247		},
>     248		{	/* Power5++ */
>     249			.pvr_mask		= 0xffffff00,
>     250			.pvr_value		= 0x003b0300,
>     251			.cpu_name		= "POWER5+ (gs)",
>     252			.cpu_features		= CPU_FTRS_POWER5,
>     253			.cpu_user_features	= COMMON_USER_POWER5_PLUS,
>     254			.mmu_features		= MMU_FTRS_POWER5,
>     255			.icache_bsize		= 128,
>     256			.dcache_bsize		= 128,
>     257			.num_pmcs		= 6,
>     258			.oprofile_cpu_type	= "ppc64/power5++",
>     259			.oprofile_type		= PPC_OPROFILE_POWER4,
>     260			.oprofile_mmcra_sihv	= MMCRA_SIHV,
>     261			.oprofile_mmcra_sipr	= MMCRA_SIPR,
>     262			.platform		= "power5+",
>     263		},
>     264		{	/* Power5 GS */
>     265			.pvr_mask		= 0xffff0000,
>     266			.pvr_value		= 0x003b0000,
>     267			.cpu_name		= "POWER5+ (gs)",
>     268			.cpu_features		= CPU_FTRS_POWER5,
>     269			.cpu_user_features	= COMMON_USER_POWER5_PLUS,
>     270			.mmu_features		= MMU_FTRS_POWER5,
>     271			.icache_bsize		= 128,
>     272			.dcache_bsize		= 128,
>     273			.num_pmcs		= 6,
>     274			.pmc_type		= PPC_PMC_IBM,
>     275			.oprofile_cpu_type	= "ppc64/power5+",
>     276			.oprofile_type		= PPC_OPROFILE_POWER4,
>     277			.oprofile_mmcra_sihv	= MMCRA_SIHV,
>     278			.oprofile_mmcra_sipr	= MMCRA_SIPR,
>     279			.platform		= "power5+",
>     280		},
>     281		{	/* POWER6 in P5+ mode; 2.04-compliant processor */
>     282			.pvr_mask		= 0xffffffff,
>     283			.pvr_value		= 0x0f000001,
>     284			.cpu_name		= "POWER5+",
>     285			.cpu_features		= CPU_FTRS_POWER5,
>     286			.cpu_user_features	= COMMON_USER_POWER5_PLUS,
>     287			.mmu_features		= MMU_FTRS_POWER5,
>     288			.icache_bsize		= 128,
>     289			.dcache_bsize		= 128,
>     290			.oprofile_cpu_type	= "ppc64/ibm-compat-v1",
>     291			.oprofile_type		= PPC_OPROFILE_POWER4,
>     292			.platform		= "power5+",
>     293		},
>     294		{	/* Power6 */
>     295			.pvr_mask		= 0xffff0000,
>     296			.pvr_value		= 0x003e0000,
>     297			.cpu_name		= "POWER6 (raw)",
>     298			.cpu_features		= CPU_FTRS_POWER6,
>     299			.cpu_user_features	= COMMON_USER_POWER6 |
>     300				PPC_FEATURE_POWER6_EXT,
>     301			.mmu_features		= MMU_FTRS_POWER6,
>     302			.icache_bsize		= 128,
>     303			.dcache_bsize		= 128,
>     304			.num_pmcs		= 6,
>     305			.pmc_type		= PPC_PMC_IBM,
>     306			.oprofile_cpu_type	= "ppc64/power6",
>     307			.oprofile_type		= PPC_OPROFILE_POWER4,
>     308			.oprofile_mmcra_sihv	= POWER6_MMCRA_SIHV,
>     309			.oprofile_mmcra_sipr	= POWER6_MMCRA_SIPR,
>     310			.oprofile_mmcra_clear	= POWER6_MMCRA_THRM |
>     311				POWER6_MMCRA_OTHER,
>     312			.platform		= "power6x",
>     313		},
>     314		{	/* 2.05-compliant processor, i.e. Power6 "architected" mode */
>     315			.pvr_mask		= 0xffffffff,
>     316			.pvr_value		= 0x0f000002,
>     317			.cpu_name		= "POWER6 (architected)",
>     318			.cpu_features		= CPU_FTRS_POWER6,
>     319			.cpu_user_features	= COMMON_USER_POWER6,
>     320			.mmu_features		= MMU_FTRS_POWER6,
>     321			.icache_bsize		= 128,
>     322			.dcache_bsize		= 128,
>     323			.oprofile_cpu_type	= "ppc64/ibm-compat-v1",
>     324			.oprofile_type		= PPC_OPROFILE_POWER4,
>     325			.platform		= "power6",
>     326		},
>     327		{	/* 2.06-compliant processor, i.e. Power7 "architected" mode */
>     328			.pvr_mask		= 0xffffffff,
>     329			.pvr_value		= 0x0f000003,
>     330			.cpu_name		= "POWER7 (architected)",
>     331			.cpu_features		= CPU_FTRS_POWER7,
>     332			.cpu_user_features	= COMMON_USER_POWER7,
>     333			.cpu_user_features2	= COMMON_USER2_POWER7,
>     334			.mmu_features		= MMU_FTRS_POWER7,
>     335			.icache_bsize		= 128,
>     336			.dcache_bsize		= 128,
>     337			.oprofile_type		= PPC_OPROFILE_POWER4,
>     338			.oprofile_cpu_type	= "ppc64/ibm-compat-v1",
>     339			.cpu_setup		= __setup_cpu_power7,
>     340			.cpu_restore		= __restore_cpu_power7,
>     341			.machine_check_early	= __machine_check_early_realmode_p7,
>     342			.platform		= "power7",
>     343		},
>     344		{	/* 2.07-compliant processor, i.e. Power8 "architected" mode */
>     345			.pvr_mask		= 0xffffffff,
>     346			.pvr_value		= 0x0f000004,
>     347			.cpu_name		= "POWER8 (architected)",
>     348			.cpu_features		= CPU_FTRS_POWER8,
>     349			.cpu_user_features	= COMMON_USER_POWER8,
>     350			.cpu_user_features2	= COMMON_USER2_POWER8,
>     351			.mmu_features		= MMU_FTRS_POWER8,
>     352			.icache_bsize		= 128,
>     353			.dcache_bsize		= 128,
>     354			.oprofile_type		= PPC_OPROFILE_INVALID,
>     355			.oprofile_cpu_type	= "ppc64/ibm-compat-v1",
>     356			.cpu_setup		= __setup_cpu_power8,
>     357			.cpu_restore		= __restore_cpu_power8,
>     358			.machine_check_early	= __machine_check_early_realmode_p8,
>     359			.platform		= "power8",
>     360		},
>     361		{	/* 3.00-compliant processor, i.e. Power9 "architected" mode */
>     362			.pvr_mask		= 0xffffffff,
>     363			.pvr_value		= 0x0f000005,
>     364			.cpu_name		= "POWER9 (architected)",
>     365			.cpu_features		= CPU_FTRS_POWER9,
>     366			.cpu_user_features	= COMMON_USER_POWER9,
>     367			.cpu_user_features2	= COMMON_USER2_POWER9,
>     368			.mmu_features		= MMU_FTRS_POWER9,
>     369			.icache_bsize		= 128,
>     370			.dcache_bsize		= 128,
>     371			.oprofile_type		= PPC_OPROFILE_INVALID,
>     372			.oprofile_cpu_type	= "ppc64/ibm-compat-v1",
>     373			.cpu_setup		= __setup_cpu_power9,
>     374			.cpu_restore		= __restore_cpu_power9,
>     375			.platform		= "power9",
>     376		},
>     377		{	/* 3.1-compliant processor, i.e. Power10 "architected" mode */
>     378			.pvr_mask		= 0xffffffff,
>     379			.pvr_value		= 0x0f000006,
>     380			.cpu_name		= "POWER10 (architected)",
>     381			.cpu_features		= CPU_FTRS_POWER10,
>     382			.cpu_user_features	= COMMON_USER_POWER10,
>     383			.cpu_user_features2	= COMMON_USER2_POWER10,
>     384			.mmu_features		= MMU_FTRS_POWER10,
>     385			.icache_bsize		= 128,
>     386			.dcache_bsize		= 128,
>     387			.oprofile_type		= PPC_OPROFILE_INVALID,
>     388			.oprofile_cpu_type	= "ppc64/ibm-compat-v1",
>     389			.cpu_setup		= __setup_cpu_power10,
>     390			.cpu_restore		= __restore_cpu_power10,
>     391			.platform		= "power10",
>     392		},
>     393		{	/* Power7 */
>     394			.pvr_mask		= 0xffff0000,
>     395			.pvr_value		= 0x003f0000,
>     396			.cpu_name		= "POWER7 (raw)",
>     397			.cpu_features		= CPU_FTRS_POWER7,
>     398			.cpu_user_features	= COMMON_USER_POWER7,
>     399			.cpu_user_features2	= COMMON_USER2_POWER7,
>     400			.mmu_features		= MMU_FTRS_POWER7,
>     401			.icache_bsize		= 128,
>     402			.dcache_bsize		= 128,
>     403			.num_pmcs		= 6,
>     404			.pmc_type		= PPC_PMC_IBM,
>     405			.oprofile_cpu_type	= "ppc64/power7",
>     406			.oprofile_type		= PPC_OPROFILE_POWER4,
>     407			.cpu_setup		= __setup_cpu_power7,
>     408			.cpu_restore		= __restore_cpu_power7,
>     409			.machine_check_early	= __machine_check_early_realmode_p7,
>     410			.platform		= "power7",
>     411		},
>     412		{	/* Power7+ */
>     413			.pvr_mask		= 0xffff0000,
>     414			.pvr_value		= 0x004A0000,
>     415			.cpu_name		= "POWER7+ (raw)",
>     416			.cpu_features		= CPU_FTRS_POWER7,
>     417			.cpu_user_features	= COMMON_USER_POWER7,
>     418			.cpu_user_features2	= COMMON_USER2_POWER7,
>     419			.mmu_features		= MMU_FTRS_POWER7,
>     420			.icache_bsize		= 128,
>     421			.dcache_bsize		= 128,
>     422			.num_pmcs		= 6,
>     423			.pmc_type		= PPC_PMC_IBM,
>     424			.oprofile_cpu_type	= "ppc64/power7",
>     425			.oprofile_type		= PPC_OPROFILE_POWER4,
>     426			.cpu_setup		= __setup_cpu_power7,
>     427			.cpu_restore		= __restore_cpu_power7,
>     428			.machine_check_early	= __machine_check_early_realmode_p7,
>     429			.platform		= "power7+",
>     430		},
>     431		{	/* Power8E */
>     432			.pvr_mask		= 0xffff0000,
>     433			.pvr_value		= 0x004b0000,
>     434			.cpu_name		= "POWER8E (raw)",
>     435			.cpu_features		= CPU_FTRS_POWER8E,
>     436			.cpu_user_features	= COMMON_USER_POWER8,
>     437			.cpu_user_features2	= COMMON_USER2_POWER8,
>     438			.mmu_features		= MMU_FTRS_POWER8,
>     439			.icache_bsize		= 128,
>     440			.dcache_bsize		= 128,
>     441			.num_pmcs		= 6,
>     442			.pmc_type		= PPC_PMC_IBM,
>     443			.oprofile_cpu_type	= "ppc64/power8",
>     444			.oprofile_type		= PPC_OPROFILE_INVALID,
>     445			.cpu_setup		= __setup_cpu_power8,
>     446			.cpu_restore		= __restore_cpu_power8,
>     447			.machine_check_early	= __machine_check_early_realmode_p8,
>     448			.platform		= "power8",
>     449		},
>     450		{	/* Power8NVL */
>     451			.pvr_mask		= 0xffff0000,
>     452			.pvr_value		= 0x004c0000,
>     453			.cpu_name		= "POWER8NVL (raw)",
>     454			.cpu_features		= CPU_FTRS_POWER8,
>     455			.cpu_user_features	= COMMON_USER_POWER8,
>     456			.cpu_user_features2	= COMMON_USER2_POWER8,
>     457			.mmu_features		= MMU_FTRS_POWER8,
>     458			.icache_bsize		= 128,
>     459			.dcache_bsize		= 128,
>     460			.num_pmcs		= 6,
>     461			.pmc_type		= PPC_PMC_IBM,
>     462			.oprofile_cpu_type	= "ppc64/power8",
>     463			.oprofile_type		= PPC_OPROFILE_INVALID,
>     464			.cpu_setup		= __setup_cpu_power8,
>     465			.cpu_restore		= __restore_cpu_power8,
>     466			.machine_check_early	= __machine_check_early_realmode_p8,
>     467			.platform		= "power8",
>     468		},
>     469		{	/* Power8 */
>     470			.pvr_mask		= 0xffff0000,
>     471			.pvr_value		= 0x004d0000,
>     472			.cpu_name		= "POWER8 (raw)",
>     473			.cpu_features		= CPU_FTRS_POWER8,
>     474			.cpu_user_features	= COMMON_USER_POWER8,
>     475			.cpu_user_features2	= COMMON_USER2_POWER8,
>     476			.mmu_features		= MMU_FTRS_POWER8,
>     477			.icache_bsize		= 128,
>     478			.dcache_bsize		= 128,
>     479			.num_pmcs		= 6,
>     480			.pmc_type		= PPC_PMC_IBM,
>     481			.oprofile_cpu_type	= "ppc64/power8",
>     482			.oprofile_type		= PPC_OPROFILE_INVALID,
>     483			.cpu_setup		= __setup_cpu_power8,
>     484			.cpu_restore		= __restore_cpu_power8,
>     485			.machine_check_early	= __machine_check_early_realmode_p8,
>     486			.platform		= "power8",
>     487		},
>     488		{	/* Power9 DD2.0 */
>     489			.pvr_mask		= 0xffffefff,
>     490			.pvr_value		= 0x004e0200,
>     491			.cpu_name		= "POWER9 (raw)",
>     492			.cpu_features		= CPU_FTRS_POWER9_DD2_0,
>     493			.cpu_user_features	= COMMON_USER_POWER9,
>     494			.cpu_user_features2	= COMMON_USER2_POWER9,
>     495			.mmu_features		= MMU_FTRS_POWER9,
>     496			.icache_bsize		= 128,
>     497			.dcache_bsize		= 128,
>     498			.num_pmcs		= 6,
>     499			.pmc_type		= PPC_PMC_IBM,
>     500			.oprofile_cpu_type	= "ppc64/power9",
>     501			.oprofile_type		= PPC_OPROFILE_INVALID,
>     502			.cpu_setup		= __setup_cpu_power9,
>     503			.cpu_restore		= __restore_cpu_power9,
>     504			.machine_check_early	= __machine_check_early_realmode_p9,
>     505			.platform		= "power9",
>     506		},
>     507		{	/* Power9 DD 2.1 */
>     508			.pvr_mask		= 0xffffefff,
>     509			.pvr_value		= 0x004e0201,
>     510			.cpu_name		= "POWER9 (raw)",
>     511			.cpu_features		= CPU_FTRS_POWER9_DD2_1,
>     512			.cpu_user_features	= COMMON_USER_POWER9,
>     513			.cpu_user_features2	= COMMON_USER2_POWER9,
>     514			.mmu_features		= MMU_FTRS_POWER9,
>     515			.icache_bsize		= 128,
>     516			.dcache_bsize		= 128,
>     517			.num_pmcs		= 6,
>     518			.pmc_type		= PPC_PMC_IBM,
>     519			.oprofile_cpu_type	= "ppc64/power9",
>     520			.oprofile_type		= PPC_OPROFILE_INVALID,
>     521			.cpu_setup		= __setup_cpu_power9,
>     522			.cpu_restore		= __restore_cpu_power9,
>     523			.machine_check_early	= __machine_check_early_realmode_p9,
>     524			.platform		= "power9",
>     525		},
>     526		{	/* Power9 DD2.2 or later */
>     527			.pvr_mask		= 0xffff0000,
>     528			.pvr_value		= 0x004e0000,
>     529			.cpu_name		= "POWER9 (raw)",
>     530			.cpu_features		= CPU_FTRS_POWER9_DD2_2,
>     531			.cpu_user_features	= COMMON_USER_POWER9,
>     532			.cpu_user_features2	= COMMON_USER2_POWER9,
>     533			.mmu_features		= MMU_FTRS_POWER9,
>     534			.icache_bsize		= 128,
>     535			.dcache_bsize		= 128,
>     536			.num_pmcs		= 6,
>     537			.pmc_type		= PPC_PMC_IBM,
>     538			.oprofile_cpu_type	= "ppc64/power9",
>     539			.oprofile_type		= PPC_OPROFILE_INVALID,
>     540			.cpu_setup		= __setup_cpu_power9,
>     541			.cpu_restore		= __restore_cpu_power9,
>     542			.machine_check_early	= __machine_check_early_realmode_p9,
>     543			.platform		= "power9",
>     544		},
>     545		{	/* Power10 */
>     546			.pvr_mask		= 0xffff0000,
>     547			.pvr_value		= 0x00800000,
>     548			.cpu_name		= "POWER10 (raw)",
>     549			.cpu_features		= CPU_FTRS_POWER10,
>     550			.cpu_user_features	= COMMON_USER_POWER10,
>     551			.cpu_user_features2	= COMMON_USER2_POWER10,
>     552			.mmu_features		= MMU_FTRS_POWER10,
>     553			.icache_bsize		= 128,
>     554			.dcache_bsize		= 128,
>     555			.num_pmcs		= 6,
>     556			.pmc_type		= PPC_PMC_IBM,
>     557			.oprofile_cpu_type	= "ppc64/power10",
>     558			.oprofile_type		= PPC_OPROFILE_INVALID,
>     559			.cpu_setup		= __setup_cpu_power10,
>     560			.cpu_restore		= __restore_cpu_power10,
>   > 561			.machine_check_early	= __machine_check_early_realmode_p10,
>     562			.platform		= "power10",
>     563		},
>     564		{	/* Cell Broadband Engine */
>     565			.pvr_mask		= 0xffff0000,
>     566			.pvr_value		= 0x00700000,
>     567			.cpu_name		= "Cell Broadband Engine",
>     568			.cpu_features		= CPU_FTRS_CELL,
>     569			.cpu_user_features	= COMMON_USER_PPC64 |
>     570				PPC_FEATURE_CELL | PPC_FEATURE_HAS_ALTIVEC_COMP |
>     571				PPC_FEATURE_SMT,
>     572			.mmu_features		= MMU_FTRS_CELL,
>     573			.icache_bsize		= 128,
>     574			.dcache_bsize		= 128,
>     575			.num_pmcs		= 4,
>     576			.pmc_type		= PPC_PMC_IBM,
>     577			.oprofile_cpu_type	= "ppc64/cell-be",
>     578			.oprofile_type		= PPC_OPROFILE_CELL,
>     579			.platform		= "ppc-cell-be",
>     580		},
>     581		{	/* PA Semi PA6T */
>     582			.pvr_mask		= 0x7fff0000,
>     583			.pvr_value		= 0x00900000,
>     584			.cpu_name		= "PA6T",
>     585			.cpu_features		= CPU_FTRS_PA6T,
>     586			.cpu_user_features	= COMMON_USER_PA6T,
>     587			.mmu_features		= MMU_FTRS_PA6T,
>     588			.icache_bsize		= 64,
>     589			.dcache_bsize		= 64,
>     590			.num_pmcs		= 6,
>     591			.pmc_type		= PPC_PMC_PA6T,
>     592			.cpu_setup		= __setup_cpu_pa6t,
>     593			.cpu_restore		= __restore_cpu_pa6t,
>     594			.oprofile_cpu_type	= "ppc64/pa6t",
>     595			.oprofile_type		= PPC_OPROFILE_PA6T,
>     596			.platform		= "pa6t",
>     597		},
>     598		{	/* default match */
>     599			.pvr_mask		= 0x00000000,
>     600			.pvr_value		= 0x00000000,
>     601			.cpu_name		= "POWER5 (compatible)",
>     602			.cpu_features		= CPU_FTRS_COMPATIBLE,
>     603			.cpu_user_features	= COMMON_USER_PPC64,
>     604			.mmu_features		= MMU_FTRS_POWER,
>     605			.icache_bsize		= 128,
>     606			.dcache_bsize		= 128,
>     607			.num_pmcs		= 6,
>     608			.pmc_type		= PPC_PMC_IBM,
>     609			.platform		= "power5",
>     610		}
>     611	#endif	/* CONFIG_PPC_BOOK3S_64 */
>     612	
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

