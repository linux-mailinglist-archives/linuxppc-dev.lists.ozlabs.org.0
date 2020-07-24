Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A9522BE1B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 08:34:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCfYX3lstzDrPR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 16:34:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCfWh6JydzDsFw
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 16:32:32 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06O6WNft042057; Fri, 24 Jul 2020 02:32:23 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32fb8y5p3v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jul 2020 02:32:22 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06O5XDnD103837;
 Fri, 24 Jul 2020 02:32:13 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32fb8y5p37-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jul 2020 02:32:13 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06O6GDgG014678;
 Fri, 24 Jul 2020 06:32:11 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 32brq7pyc7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jul 2020 06:32:11 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06O6W9bs60227836
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Jul 2020 06:32:09 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 63A0411C05E;
 Fri, 24 Jul 2020 06:32:09 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DB6CF11C04A;
 Fri, 24 Jul 2020 06:32:06 +0000 (GMT)
Received: from [9.85.89.111] (unknown [9.85.89.111])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri, 24 Jul 2020 06:32:06 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [v4] powerpc/perf: Initialize power10 PMU registers in cpu setup
 routine
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <202007241030.wtjRnkIR%lkp@intel.com>
Date: Fri, 24 Jul 2020 12:02:04 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <BEA83D64-E172-40E8-A572-C2708A808FCE@linux.vnet.ibm.com>
References: <1595489557-2047-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <202007241030.wtjRnkIR%lkp@intel.com>
To: kernel test robot <lkp@intel.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-24_01:2020-07-24,
 2020-07-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0
 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007240044
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
Cc: Michael Neuling <mikey@neuling.org>, maddy@linux.vnet.ibm.com,
 kbuild-all@lists.01.org, Jordan Niethe <jniethe5@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 24-Jul-2020, at 8:32 AM, kernel test robot <lkp@intel.com> wrote:
>=20
> Hi Athira,
>=20
> Thank you for the patch! Yet something to improve:
>=20
> [auto build test ERROR on powerpc/next]
> [also build test ERROR on v5.8-rc6 next-20200723]
> [cannot apply to mpe/next scottwood/next]
> [If your patch is applied to the wrong git tree, kindly drop us a =
note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>=20
> url:    =
https://github.com/0day-ci/linux/commits/Athira-Rajeev/powerpc-perf-Initia=
lize-power10-PMU-registers-in-cpu-setup-routine/20200723-153537
> base:   =
https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
> config: powerpc-defconfig (attached as .config)
> compiler: powerpc64-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>        wget =
https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross =
-O ~/bin/make.cross
>        chmod +x ~/bin/make.cross
>        # save the attached .config to linux build tree
>        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 =
make.cross ARCH=3Dpowerpc=20
>=20
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>=20
> All errors (new ones prefixed by >>):
>=20
>   arch/powerpc/kernel/cpu_setup_power.S: Assembler messages:
>>> arch/powerpc/kernel/cpu_setup_power.S:244: Error: non-constant =
expression in ".if" statement
>>> arch/powerpc/kernel/cpu_setup_power.S:244: Error: non-constant =
expression in ".if" statement
>>> arch/powerpc/kernel/cpu_setup_power.S:243: Error: unsupported =
relocation against SPRN_MMCR3

Hi,

As mentioned in changelog:

This patch was initially part of Power10 PMU base enablement
 series ( =
https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=3D190462 =
).
 Moving this as separate patch as suggested by Michael
 Ellerman. Hence there is a dependency on initial series ( Patch 7 ) =
which defines
 MMCRA_BHRB_DISABLE and new SPR=E2=80=99s. And the build error is =
because of that.

Thanks
Athira

>=20
> vim +244 arch/powerpc/kernel/cpu_setup_power.S
>=20
>    14=09
>    15	/* Entry: r3 =3D crap, r4 =3D ptr to cputable entry
>    16	 *
>    17	 * Note that we can be called twice for pseudo-PVRs
>    18	 */
>    19	_GLOBAL(__setup_cpu_power7)
>    20		mflr	r11
>    21		bl	__init_hvmode_206
>    22		mtlr	r11
>    23		beqlr
>    24		li	r0,0
>    25		mtspr	SPRN_LPID,r0
>    26		LOAD_REG_IMMEDIATE(r0, PCR_MASK)
>    27		mtspr	SPRN_PCR,r0
>    28		mfspr	r3,SPRN_LPCR
>    29		li	r4,(LPCR_LPES1 >> LPCR_LPES_SH)
>    30		bl	__init_LPCR_ISA206
>    31		mtlr	r11
>    32		blr
>    33=09
>    34	_GLOBAL(__restore_cpu_power7)
>    35		mflr	r11
>    36		mfmsr	r3
>    37		rldicl.	r0,r3,4,63
>    38		beqlr
>    39		li	r0,0
>    40		mtspr	SPRN_LPID,r0
>    41		LOAD_REG_IMMEDIATE(r0, PCR_MASK)
>    42		mtspr	SPRN_PCR,r0
>    43		mfspr	r3,SPRN_LPCR
>    44		li	r4,(LPCR_LPES1 >> LPCR_LPES_SH)
>    45		bl	__init_LPCR_ISA206
>    46		mtlr	r11
>    47		blr
>    48=09
>    49	_GLOBAL(__setup_cpu_power8)
>    50		mflr	r11
>    51		bl	__init_FSCR
>    52		bl	__init_PMU
>    53		bl	__init_PMU_ISA207
>    54		bl	__init_hvmode_206
>    55		mtlr	r11
>    56		beqlr
>    57		li	r0,0
>    58		mtspr	SPRN_LPID,r0
>    59		LOAD_REG_IMMEDIATE(r0, PCR_MASK)
>    60		mtspr	SPRN_PCR,r0
>    61		mfspr	r3,SPRN_LPCR
>    62		ori	r3, r3, LPCR_PECEDH
>    63		li	r4,0 /* LPES =3D 0 */
>    64		bl	__init_LPCR_ISA206
>    65		bl	__init_HFSCR
>    66		bl	__init_PMU_HV
>    67		bl	__init_PMU_HV_ISA207
>    68		mtlr	r11
>    69		blr
>    70=09
>    71	_GLOBAL(__restore_cpu_power8)
>    72		mflr	r11
>    73		bl	__init_FSCR
>    74		bl	__init_PMU
>    75		bl	__init_PMU_ISA207
>    76		mfmsr	r3
>    77		rldicl.	r0,r3,4,63
>    78		mtlr	r11
>    79		beqlr
>    80		li	r0,0
>    81		mtspr	SPRN_LPID,r0
>    82		LOAD_REG_IMMEDIATE(r0, PCR_MASK)
>    83		mtspr	SPRN_PCR,r0
>    84		mfspr   r3,SPRN_LPCR
>    85		ori	r3, r3, LPCR_PECEDH
>    86		li	r4,0 /* LPES =3D 0 */
>    87		bl	__init_LPCR_ISA206
>    88		bl	__init_HFSCR
>    89		bl	__init_PMU_HV
>    90		bl	__init_PMU_HV_ISA207
>    91		mtlr	r11
>    92		blr
>    93=09
>    94	_GLOBAL(__setup_cpu_power10)
>    95		mflr	r11
>    96		bl	__init_FSCR_power10
>    97		bl	__init_PMU
>    98		bl	__init_PMU_ISA31
>    99		b	1f
>   100=09
>   101	_GLOBAL(__setup_cpu_power9)
>   102		mflr	r11
>   103		bl	__init_FSCR
>   104		bl	__init_PMU
>   105	1:	bl	__init_hvmode_206
>   106		mtlr	r11
>   107		beqlr
>   108		li	r0,0
>   109		mtspr	SPRN_PSSCR,r0
>   110		mtspr	SPRN_LPID,r0
>   111		mtspr	SPRN_PID,r0
>   112		LOAD_REG_IMMEDIATE(r0, PCR_MASK)
>   113		mtspr	SPRN_PCR,r0
>   114		mfspr	r3,SPRN_LPCR
>   115		LOAD_REG_IMMEDIATE(r4, LPCR_PECEDH | LPCR_PECE_HVEE | =
LPCR_HVICE  | LPCR_HEIC)
>   116		or	r3, r3, r4
>   117		LOAD_REG_IMMEDIATE(r4, LPCR_UPRT | LPCR_HR)
>   118		andc	r3, r3, r4
>   119		li	r4,0 /* LPES =3D 0 */
>   120		bl	__init_LPCR_ISA300
>   121		bl	__init_HFSCR
>   122		bl	__init_PMU_HV
>   123		mtlr	r11
>   124		blr
>   125=09
>   126	_GLOBAL(__restore_cpu_power10)
>   127		mflr	r11
>   128		bl	__init_FSCR_power10
>   129		bl	__init_PMU
>   130		bl	__init_PMU_ISA31
>   131		b	1f
>   132=09
>   133	_GLOBAL(__restore_cpu_power9)
>   134		mflr	r11
>   135		bl	__init_FSCR
>   136		bl	__init_PMU
>   137	1:	mfmsr	r3
>   138		rldicl.	r0,r3,4,63
>   139		mtlr	r11
>   140		beqlr
>   141		li	r0,0
>   142		mtspr	SPRN_PSSCR,r0
>   143		mtspr	SPRN_LPID,r0
>   144		mtspr	SPRN_PID,r0
>   145		LOAD_REG_IMMEDIATE(r0, PCR_MASK)
>   146		mtspr	SPRN_PCR,r0
>   147		mfspr   r3,SPRN_LPCR
>   148		LOAD_REG_IMMEDIATE(r4, LPCR_PECEDH | LPCR_PECE_HVEE | =
LPCR_HVICE | LPCR_HEIC)
>   149		or	r3, r3, r4
>   150		LOAD_REG_IMMEDIATE(r4, LPCR_UPRT | LPCR_HR)
>   151		andc	r3, r3, r4
>   152		li	r4,0 /* LPES =3D 0 */
>   153		bl	__init_LPCR_ISA300
>   154		bl	__init_HFSCR
>   155		bl	__init_PMU_HV
>   156		mtlr	r11
>   157		blr
>   158=09
>   159	__init_hvmode_206:
>   160		/* Disable CPU_FTR_HVMODE and exit if MSR:HV is not set =
*/
>   161		mfmsr	r3
>   162		rldicl.	r0,r3,4,63
>   163		bnelr
>   164		ld	r5,CPU_SPEC_FEATURES(r4)
>   165		LOAD_REG_IMMEDIATE(r6,CPU_FTR_HVMODE | =
CPU_FTR_P9_TM_HV_ASSIST)
>   166		andc	r5,r5,r6
>   167		std	r5,CPU_SPEC_FEATURES(r4)
>   168		blr
>   169=09
>   170	__init_LPCR_ISA206:
>   171		/* Setup a sane LPCR:
>   172		 *   Called with initial LPCR in R3 and desired LPES =
2-bit value in R4
>   173		 *
>   174		 *   LPES =3D 0b01 (HSRR0/1 used for 0x500)
>   175		 *   PECE =3D 0b111
>   176		 *   DPFD =3D 4
>   177		 *   HDICE =3D 0
>   178		 *   VC =3D 0b100 (VPM0=3D1, VPM1=3D0, ISL=3D0)
>   179		 *   VRMASD =3D 0b10000 (L=3D1, LP=3D00)
>   180		 *
>   181		 * Other bits untouched for now
>   182		 */
>   183		li	r5,0x10
>   184		rldimi	r3,r5, LPCR_VRMASD_SH, 64-LPCR_VRMASD_SH-5
>   185=09
>   186		/* POWER9 has no VRMASD */
>   187	__init_LPCR_ISA300:
>   188		rldimi	r3,r4, LPCR_LPES_SH, 64-LPCR_LPES_SH-2
>   189		ori	r3,r3,(LPCR_PECE0|LPCR_PECE1|LPCR_PECE2)
>   190		li	r5,4
>   191		rldimi	r3,r5, LPCR_DPFD_SH, 64-LPCR_DPFD_SH-3
>   192		clrrdi	r3,r3,1		/* clear HDICE */
>   193		li	r5,4
>   194		rldimi	r3,r5, LPCR_VC_SH, 0
>   195		mtspr	SPRN_LPCR,r3
>   196		isync
>   197		blr
>   198=09
>   199	__init_FSCR_power10:
>   200		mfspr	r3, SPRN_FSCR
>   201		ori	r3, r3, FSCR_PREFIX
>   202		mtspr	SPRN_FSCR, r3
>   203		// fall through
>   204=09
>   205	__init_FSCR:
>   206		mfspr	r3,SPRN_FSCR
>   207		ori	r3,r3,FSCR_TAR|FSCR_EBB
>   208		mtspr	SPRN_FSCR,r3
>   209		blr
>   210=09
>   211	__init_HFSCR:
>   212		mfspr	r3,SPRN_HFSCR
>   213		ori	r3,r3,HFSCR_TAR|HFSCR_TM|HFSCR_BHRB|HFSCR_PM|\
>   214			      =
HFSCR_DSCR|HFSCR_VECVSX|HFSCR_FP|HFSCR_EBB|HFSCR_MSGP
>   215		mtspr	SPRN_HFSCR,r3
>   216		blr
>   217=09
>   218	__init_PMU_HV:
>   219		li	r5,0
>   220		mtspr	SPRN_MMCRC,r5
>   221		blr
>   222=09
>   223	__init_PMU_HV_ISA207:
>   224		li	r5,0
>   225		mtspr	SPRN_MMCRH,r5
>   226		blr
>   227=09
>   228	__init_PMU:
>   229		li	r5,0
>   230		mtspr	SPRN_MMCRA,r5
>   231		mtspr	SPRN_MMCR0,r5
>   232		mtspr	SPRN_MMCR1,r5
>   233		mtspr	SPRN_MMCR2,r5
>   234		blr
>   235=09
>   236	__init_PMU_ISA207:
>   237		li	r5,0
>   238		mtspr	SPRN_MMCRS,r5
>   239		blr
>   240=09
>   241	__init_PMU_ISA31:
>   242		li	r5,0
>> 243		mtspr	SPRN_MMCR3,r5
>> 244		LOAD_REG_IMMEDIATE(r5, MMCRA_BHRB_DISABLE)
>=20
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> <.config.gz>

