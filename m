Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0D922986F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 14:46:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBZwb37CVzDr4q
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 22:46:55 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBSSF0l7hzDqS2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 17:55:24 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06M7avCs051944; Wed, 22 Jul 2020 03:55:17 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32e1vrhab5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jul 2020 03:55:17 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06M7awd3052143;
 Wed, 22 Jul 2020 03:55:16 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32e1vrhaae-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jul 2020 03:55:16 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06M7kEml032219;
 Wed, 22 Jul 2020 07:55:14 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03fra.de.ibm.com with ESMTP id 32brq82fks-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jul 2020 07:55:14 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06M7tCJ044499166
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Jul 2020 07:55:12 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F099D11C04A;
 Wed, 22 Jul 2020 07:55:11 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DE16911C058;
 Wed, 22 Jul 2020 07:55:08 +0000 (GMT)
Received: from [9.85.103.169] (unknown [9.85.103.169])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 22 Jul 2020 07:55:08 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Message-Id: <9A4E06A2-5686-4C85-B2F7-0904F195B58A@linux.vnet.ibm.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_28D83C0F-1F3F-49AA-95FF-7F8F48673511"
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [v3 07/15] powerpc/perf: Add power10_feat to dt_cpu_ftrs
Date: Wed, 22 Jul 2020 13:25:06 +0530
In-Reply-To: <CACzsE9oBw1ZrJLqOAg1QqPrQgSoVbEdPh_ax7mU_kcWNyfyAcg@mail.gmail.com>
To: Jordan Niethe <jniethe5@gmail.com>
References: <1594996707-3727-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1594996707-3727-8-git-send-email-atrajeev@linux.vnet.ibm.com>
 <CACzsE9oBw1ZrJLqOAg1QqPrQgSoVbEdPh_ax7mU_kcWNyfyAcg@mail.gmail.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-22_03:2020-07-22,
 2020-07-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 priorityscore=1501 adultscore=0 mlxscore=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007220052
X-Mailman-Approved-At: Wed, 22 Jul 2020 22:44:44 +1000
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
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>,
 Michael Neuling <mikey@neuling.org>, maddy@linux.vnet.ibm.com,
 kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, svaidyan@in.ibm.com,
 acme@kernel.org, jolsa@kernel.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_28D83C0F-1F3F-49AA-95FF-7F8F48673511
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On 22-Jul-2020, at 10:11 AM, Jordan Niethe <jniethe5@gmail.com> wrote:
>=20
> On Sat, Jul 18, 2020 at 1:13 AM Athira Rajeev
> <atrajeev@linux.vnet.ibm.com <mailto:atrajeev@linux.vnet.ibm.com>> =
wrote:
>>=20
>> From: Madhavan Srinivasan <maddy@linux.ibm.com>
>>=20
>> Add power10 feature function to dt_cpu_ftrs.c along
>> with a power10 specific init() to initialize pmu sprs,
>> sets the oprofile_cpu_type and cpu_features. This will
>> enable performance monitoring unit(PMU) for Power10
>> in CPU features with "performance-monitor-power10".
>>=20
>> For PowerISA v3.1, BHRB disable is controlled via Monitor Mode
>> Control Register A (MMCRA) bit, namely "BHRB Recording Disable
>> (BHRBRD)". This patch initializes MMCRA BHRBRD to disable BHRB
>> feature at boot for power10.
>>=20
>> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
>> ---
>> arch/powerpc/include/asm/reg.h        |  3 +++
>> arch/powerpc/kernel/cpu_setup_power.S |  8 ++++++++
>> arch/powerpc/kernel/dt_cpu_ftrs.c     | 26 ++++++++++++++++++++++++++
>> 3 files changed, 37 insertions(+)
>>=20
>> diff --git a/arch/powerpc/include/asm/reg.h =
b/arch/powerpc/include/asm/reg.h
>> index 21a1b2d..900ada1 100644
>> --- a/arch/powerpc/include/asm/reg.h
>> +++ b/arch/powerpc/include/asm/reg.h
>> @@ -1068,6 +1068,9 @@
>> #define MMCR0_PMC2_LOADMISSTIME        0x5
>> #endif
>>=20
>> +/* BHRB disable bit for PowerISA v3.10 */
>> +#define MMCRA_BHRB_DISABLE     0x0000002000000000
> Shouldn't this go under SPRN_MMCRA with the other MMCRA_*.


Hi Jordan

Ok, the definition of MMCRA is under #ifdef for 64 bit .  if I move =
definition of MMCRA_BHRB_DISABLE along with other SPR's, I also
need to define this for 32-bit to satisfy core-book3s to compile as =
below:

diff --git a/arch/powerpc/include/asm/reg.h =
b/arch/powerpc/include/asm/reg.h
index 900ada10762c..7e271657b412 100644
--- a/arch/powerpc/include/asm/reg.h
+++ b/arch/powerpc/include/asm/reg.h
@@ -888,6 +888,8 @@
 #define   MMCRA_SLOT   0x07000000UL /* SLOT bits (37-39) */
 #define   MMCRA_SLOT_SHIFT     24
 #define   MMCRA_SAMPLE_ENABLE 0x00000001UL /* enable sampling */
+/* BHRB disable bit for PowerISA v3.10 */
+#define   MMCRA_BHRB_DISABLE  0x0000002000000000
 #define   POWER6_MMCRA_SDSYNC 0x0000080000000000ULL    /* SDAR/SIAR =
synced */
 #define   POWER6_MMCRA_SIHV   0x0000040000000000ULL
 #define   POWER6_MMCRA_SIPR   0x0000020000000000ULL
@@ -1068,9 +1070,6 @@
 #define MMCR0_PMC2_LOADMISSTIME        0x5
 #endif
=20
-/* BHRB disable bit for PowerISA v3.10 */
-#define MMCRA_BHRB_DISABLE     0x0000002000000000
-
 /*
  * SPRG usage:
  *
diff --git a/arch/powerpc/perf/core-book3s.c =
b/arch/powerpc/perf/core-book3s.c
index 36baae666387..88068f20827c 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -94,6 +94,7 @@ static unsigned int freeze_events_kernel =3D =
MMCR0_FCS;
 #define SPRN_SIER2             0
 #define SPRN_SIER3             0
 #define MMCRA_SAMPLE_ENABLE    0
+#define MMCRA_BHRB_DISABLE     0
=20
 static inline unsigned long perf_ip_adjust(struct pt_regs *regs)
 {



>> +
>> /*
>>  * SPRG usage:
>>  *
>> diff --git a/arch/powerpc/kernel/cpu_setup_power.S =
b/arch/powerpc/kernel/cpu_setup_power.S
>> index efdcfa7..b8e0d1e 100644
>> --- a/arch/powerpc/kernel/cpu_setup_power.S
>> +++ b/arch/powerpc/kernel/cpu_setup_power.S
>> @@ -94,6 +94,7 @@ _GLOBAL(__restore_cpu_power8)
>> _GLOBAL(__setup_cpu_power10)
>>        mflr    r11
>>        bl      __init_FSCR_power10
>> +       bl      __init_PMU_ISA31
> So we set MMCRA here but then aren't we still going to call __init_PMU
> which will overwrite that?
> Would this setting MMCRA also need to be handled in =
__restore_cpu_power10?

Thanks for this nice catch !  When I rebased code initial phase, we =
didn=E2=80=99t had power10 part filled in.
It was a miss from my side in adding PMu init functions and thanks for =
pointing this out.=20
Below patch will call __init_PMU functions in setup and restore. Please =
check if this looks good

--
diff --git a/arch/powerpc/kernel/cpu_setup_power.S =
b/arch/powerpc/kernel/cpu_setup_power.S
index efdcfa714106..e672a6c5fd7c 100644
--- a/arch/powerpc/kernel/cpu_setup_power.S
+++ b/arch/powerpc/kernel/cpu_setup_power.S
@@ -94,6 +94,9 @@ _GLOBAL(__restore_cpu_power8)
 _GLOBAL(__setup_cpu_power10)
 	mflr	r11
 	bl	__init_FSCR_power10
+	bl	__init_PMU
+	bl	__init_PMU_ISA31
+	bl	__init_PMU_HV
 	b	1f
=20
 _GLOBAL(__setup_cpu_power9)
@@ -124,6 +127,9 @@ _GLOBAL(__setup_cpu_power9)
 _GLOBAL(__restore_cpu_power10)
 	mflr	r11
 	bl	__init_FSCR_power10
+	bl	__init_PMU
+	bl	__init_PMU_ISA31
+	bl	__init_PMU_HV
 	b	1f
=20
 _GLOBAL(__restore_cpu_power9)
@@ -233,3 +239,10 @@ __init_PMU_ISA207:
 	li	r5,0
 	mtspr	SPRN_MMCRS,r5
 	blr
+
+__init_PMU_ISA31:
+	li	r5,0
+	mtspr	SPRN_MMCR3,r5
+	LOAD_REG_IMMEDIATE(r5, MMCRA_BHRB_DISABLE)
+	mtspr	SPRN_MMCRA,r5
+	blr

=E2=80=94

>>        b       1f
>>=20
>> _GLOBAL(__setup_cpu_power9)
>> @@ -233,3 +234,10 @@ __init_PMU_ISA207:
>>        li      r5,0
>>        mtspr   SPRN_MMCRS,r5
>>        blr
>> +
>> +__init_PMU_ISA31:
>> +       li      r5,0
>> +       mtspr   SPRN_MMCR3,r5
>> +       LOAD_REG_IMMEDIATE(r5, MMCRA_BHRB_DISABLE)
>> +       mtspr   SPRN_MMCRA,r5
>> +       blr
>> diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c =
b/arch/powerpc/kernel/dt_cpu_ftrs.c
>> index 3a40951..f482286 100644
>> --- a/arch/powerpc/kernel/dt_cpu_ftrs.c
>> +++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
>> @@ -450,6 +450,31 @@ static int __init feat_enable_pmu_power9(struct =
dt_cpu_feature *f)
>>        return 1;
>> }
>>=20
>> +static void init_pmu_power10(void)
>> +{
>> +       init_pmu_power9();
>> +
>> +       mtspr(SPRN_MMCR3, 0);
>> +       mtspr(SPRN_MMCRA, MMCRA_BHRB_DISABLE);
>> +}
>> +
>> +static int __init feat_enable_pmu_power10(struct dt_cpu_feature *f)
>> +{
>> +       hfscr_pmu_enable();
>> +
>> +       init_pmu_power10();
>> +       init_pmu_registers =3D init_pmu_power10;
>> +
>> +       cur_cpu_spec->cpu_features |=3D CPU_FTR_MMCRA;
>> +       cur_cpu_spec->cpu_user_features |=3D =
PPC_FEATURE_PSERIES_PERFMON_COMPAT;
>> +
>> +       cur_cpu_spec->num_pmcs          =3D 6;
>> +       cur_cpu_spec->pmc_type          =3D PPC_PMC_IBM;
>> +       cur_cpu_spec->oprofile_cpu_type =3D "ppc64/power10";
>> +
>> +       return 1;
>> +}
>> +
>> static int __init feat_enable_tm(struct dt_cpu_feature *f)
>> {
>> #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
>> @@ -639,6 +664,7 @@ struct dt_cpu_feature_match {
>>        {"pc-relative-addressing", feat_enable, 0},
>>        {"machine-check-power9", feat_enable_mce_power9, 0},
>>        {"performance-monitor-power9", feat_enable_pmu_power9, 0},
>> +       {"performance-monitor-power10", feat_enable_pmu_power10, 0},
>>        {"event-based-branch-v3", feat_enable, 0},
>>        {"random-number-generator", feat_enable, 0},
>>        {"system-call-vectored", feat_disable, 0},
>> --
>> 1.8.3.1


--Apple-Mail=_28D83C0F-1F3F-49AA-95FF-7F8F48673511
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 22-Jul-2020, at 10:11 AM, Jordan Niethe &lt;<a =
href=3D"mailto:jniethe5@gmail.com" class=3D"">jniethe5@gmail.com</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">On Sat, Jul 18, 2020 at 1:13 AM =
Athira Rajeev</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">&lt;</span><a =
href=3D"mailto:atrajeev@linux.vnet.ibm.com" style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px;" =
class=3D"">atrajeev@linux.vnet.ibm.com</a><span style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">&gt; wrote:</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br class=3D"">From: Madhavan =
Srinivasan &lt;<a href=3D"mailto:maddy@linux.ibm.com" =
class=3D"">maddy@linux.ibm.com</a>&gt;<br class=3D""><br class=3D"">Add =
power10 feature function to dt_cpu_ftrs.c along<br class=3D"">with a =
power10 specific init() to initialize pmu sprs,<br class=3D"">sets the =
oprofile_cpu_type and cpu_features. This will<br class=3D"">enable =
performance monitoring unit(PMU) for Power10<br class=3D"">in CPU =
features with "performance-monitor-power10".<br class=3D""><br =
class=3D"">For PowerISA v3.1, BHRB disable is controlled via Monitor =
Mode<br class=3D"">Control Register A (MMCRA) bit, namely "BHRB =
Recording Disable<br class=3D"">(BHRBRD)". This patch initializes MMCRA =
BHRBRD to disable BHRB<br class=3D"">feature at boot for power10.<br =
class=3D""><br class=3D"">Signed-off-by: Madhavan Srinivasan &lt;<a =
href=3D"mailto:maddy@linux.ibm.com" =
class=3D"">maddy@linux.ibm.com</a>&gt;<br class=3D"">---<br =
class=3D"">arch/powerpc/include/asm/reg.h =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;3 +++<br =
class=3D"">arch/powerpc/kernel/cpu_setup_power.S | &nbsp;8 ++++++++<br =
class=3D"">arch/powerpc/kernel/dt_cpu_ftrs.c &nbsp;&nbsp;&nbsp;&nbsp;| =
26 ++++++++++++++++++++++++++<br class=3D"">3 files changed, 37 =
insertions(+)<br class=3D""><br class=3D"">diff --git =
a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h<br =
class=3D"">index 21a1b2d..900ada1 100644<br class=3D"">--- =
a/arch/powerpc/include/asm/reg.h<br class=3D"">+++ =
b/arch/powerpc/include/asm/reg.h<br class=3D"">@@ -1068,6 +1068,9 @@<br =
class=3D"">#define MMCR0_PMC2_LOADMISSTIME =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0x5<br class=3D"">#endif<br =
class=3D""><br class=3D"">+/* BHRB disable bit for PowerISA v3.10 */<br =
class=3D"">+#define MMCRA_BHRB_DISABLE =
&nbsp;&nbsp;&nbsp;&nbsp;0x0000002000000000<br =
class=3D""></blockquote><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Shouldn't this go under SPRN_MMCRA with the other =
MMCRA_*.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""></div></blockquote><div><br class=3D""></div><div><br =
class=3D""></div>Hi Jordan</div><div><br class=3D""></div><div>Ok, the =
definition of MMCRA is under #ifdef for 64 bit . &nbsp;if I move =
definition of MMCRA_BHRB_DISABLE along with other SPR's, I =
also</div><div>need to define this for 32-bit to satisfy core-book3s to =
compile as below:</div><div><br class=3D""></div><div><div =
style=3D"margin: 0px; font-stretch: normal; line-height: normal; =
font-family: &quot;Helvetica Neue&quot;;" class=3D"">diff --git =
a/arch/powerpc/include/asm/reg.h =
b/arch/powerpc/include/asm/reg.h</div><div style=3D"margin: 0px; =
font-stretch: normal; line-height: normal; font-family: &quot;Helvetica =
Neue&quot;;" class=3D"">index 900ada10762c..7e271657b412 =
100644</div><div style=3D"margin: 0px; font-stretch: normal; =
line-height: normal; font-family: &quot;Helvetica Neue&quot;;" =
class=3D"">--- a/arch/powerpc/include/asm/reg.h</div><div style=3D"margin:=
 0px; font-stretch: normal; line-height: normal; font-family: =
&quot;Helvetica Neue&quot;;" class=3D"">+++ =
b/arch/powerpc/include/asm/reg.h</div><div style=3D"margin: 0px; =
font-stretch: normal; line-height: normal; font-family: &quot;Helvetica =
Neue&quot;;" class=3D"">@@ -888,6 +888,8 @@</div><div style=3D"margin: =
0px; font-stretch: normal; line-height: normal; font-family: =
&quot;Helvetica Neue&quot;;" class=3D"">&nbsp;#define &nbsp; MMCRA_SLOT =
&nbsp; 0x07000000UL /* SLOT bits (37-39) */</div><div style=3D"margin: =
0px; font-stretch: normal; line-height: normal; font-family: =
&quot;Helvetica Neue&quot;;" class=3D"">&nbsp;#define &nbsp; =
MMCRA_SLOT_SHIFT &nbsp; &nbsp; 24</div><div style=3D"margin: 0px; =
font-stretch: normal; line-height: normal; font-family: &quot;Helvetica =
Neue&quot;;" class=3D"">&nbsp;#define &nbsp; MMCRA_SAMPLE_ENABLE =
0x00000001UL /* enable sampling */</div><div style=3D"margin: 0px; =
font-stretch: normal; line-height: normal; font-family: &quot;Helvetica =
Neue&quot;;" class=3D"">+/* BHRB disable bit for PowerISA v3.10 =
*/</div><div style=3D"margin: 0px; font-stretch: normal; line-height: =
normal; font-family: &quot;Helvetica Neue&quot;;" class=3D"">+#define =
&nbsp; MMCRA_BHRB_DISABLE&nbsp; 0x0000002000000000</div><div =
style=3D"margin: 0px; font-stretch: normal; line-height: normal; =
font-family: &quot;Helvetica Neue&quot;;" class=3D"">&nbsp;#define =
&nbsp; POWER6_MMCRA_SDSYNC 0x0000080000000000ULL&nbsp; &nbsp; /* =
SDAR/SIAR synced */</div><div style=3D"margin: 0px; font-stretch: =
normal; line-height: normal; font-family: &quot;Helvetica Neue&quot;;" =
class=3D"">&nbsp;#define &nbsp; POWER6_MMCRA_SIHV &nbsp; =
0x0000040000000000ULL</div><div style=3D"margin: 0px; font-stretch: =
normal; line-height: normal; font-family: &quot;Helvetica Neue&quot;;" =
class=3D"">&nbsp;#define &nbsp; POWER6_MMCRA_SIPR &nbsp; =
0x0000020000000000ULL</div><div style=3D"margin: 0px; font-stretch: =
normal; line-height: normal; font-family: &quot;Helvetica Neue&quot;;" =
class=3D"">@@ -1068,9 +1070,6 @@</div><div style=3D"margin: 0px; =
font-stretch: normal; line-height: normal; font-family: &quot;Helvetica =
Neue&quot;;" class=3D"">&nbsp;#define MMCR0_PMC2_LOADMISSTIME&nbsp; =
&nbsp; &nbsp; &nbsp; 0x5</div><div style=3D"margin: 0px; font-stretch: =
normal; line-height: normal; font-family: &quot;Helvetica Neue&quot;;" =
class=3D"">&nbsp;#endif</div><p style=3D"margin: 0px; font-stretch: =
normal; line-height: normal; font-family: &quot;Helvetica Neue&quot;; =
min-height: 14px;" class=3D"">&nbsp;<br =
class=3D"webkit-block-placeholder"></p><div style=3D"margin: 0px; =
font-stretch: normal; line-height: normal; font-family: &quot;Helvetica =
Neue&quot;;" class=3D"">-/* BHRB disable bit for PowerISA v3.10 =
*/</div><div style=3D"margin: 0px; font-stretch: normal; line-height: =
normal; font-family: &quot;Helvetica Neue&quot;;" class=3D"">-#define =
MMCRA_BHRB_DISABLE &nbsp; &nbsp; 0x0000002000000000</div><div =
style=3D"margin: 0px; font-stretch: normal; line-height: normal; =
font-family: &quot;Helvetica Neue&quot;;" class=3D"">-</div><div =
style=3D"margin: 0px; font-stretch: normal; line-height: normal; =
font-family: &quot;Helvetica Neue&quot;;" class=3D"">&nbsp;/*</div><div =
style=3D"margin: 0px; font-stretch: normal; line-height: normal; =
font-family: &quot;Helvetica Neue&quot;;" class=3D"">&nbsp; * SPRG =
usage:</div><div style=3D"margin: 0px; font-stretch: normal; =
line-height: normal; font-family: &quot;Helvetica Neue&quot;;" =
class=3D"">&nbsp; *</div><div style=3D"margin: 0px; font-stretch: =
normal; line-height: normal; font-family: &quot;Helvetica Neue&quot;;" =
class=3D"">diff --git a/arch/powerpc/perf/core-book3s.c =
b/arch/powerpc/perf/core-book3s.c</div><div style=3D"margin: 0px; =
font-stretch: normal; line-height: normal; font-family: &quot;Helvetica =
Neue&quot;;" class=3D"">index 36baae666387..88068f20827c =
100644</div><div style=3D"margin: 0px; font-stretch: normal; =
line-height: normal; font-family: &quot;Helvetica Neue&quot;;" =
class=3D"">--- a/arch/powerpc/perf/core-book3s.c</div><div =
style=3D"margin: 0px; font-stretch: normal; line-height: normal; =
font-family: &quot;Helvetica Neue&quot;;" class=3D"">+++ =
b/arch/powerpc/perf/core-book3s.c</div><div style=3D"margin: 0px; =
font-stretch: normal; line-height: normal; font-family: &quot;Helvetica =
Neue&quot;;" class=3D"">@@ -94,6 +94,7 @@ static unsigned int =
freeze_events_kernel =3D MMCR0_FCS;</div><div style=3D"margin: 0px; =
font-stretch: normal; line-height: normal; font-family: &quot;Helvetica =
Neue&quot;;" class=3D"">&nbsp;#define SPRN_SIER2 &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; 0</div><div style=3D"margin: 0px; font-stretch: =
normal; line-height: normal; font-family: &quot;Helvetica Neue&quot;;" =
class=3D"">&nbsp;#define SPRN_SIER3 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; 0</div><div style=3D"margin: 0px; font-stretch: normal; =
line-height: normal; font-family: &quot;Helvetica Neue&quot;;" =
class=3D"">&nbsp;#define MMCRA_SAMPLE_ENABLE&nbsp; &nbsp; 0</div><div =
style=3D"margin: 0px; font-stretch: normal; line-height: normal; =
font-family: &quot;Helvetica Neue&quot;;" class=3D"">+#define =
MMCRA_BHRB_DISABLE &nbsp; &nbsp; 0</div><p style=3D"margin: 0px; =
font-stretch: normal; line-height: normal; font-family: &quot;Helvetica =
Neue&quot;; min-height: 14px;" class=3D"">&nbsp;<br =
class=3D"webkit-block-placeholder"></p><div style=3D"margin: 0px; =
font-stretch: normal; line-height: normal; font-family: &quot;Helvetica =
Neue&quot;;" class=3D"">&nbsp;static inline unsigned long =
perf_ip_adjust(struct pt_regs *regs)</div><div style=3D"margin: 0px; =
font-stretch: normal; line-height: normal; font-family: &quot;Helvetica =
Neue&quot;;" class=3D"">&nbsp;{</div><div class=3D""><br =
class=3D""></div><div class=3D""><br class=3D""></div><div class=3D""><br =
class=3D""></div></div><div><blockquote type=3D"cite" class=3D""><div =
class=3D""><blockquote type=3D"cite" style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">+<br =
class=3D"">/*<br class=3D"">&nbsp;* SPRG usage:<br class=3D"">&nbsp;*<br =
class=3D"">diff --git a/arch/powerpc/kernel/cpu_setup_power.S =
b/arch/powerpc/kernel/cpu_setup_power.S<br class=3D"">index =
efdcfa7..b8e0d1e 100644<br class=3D"">--- =
a/arch/powerpc/kernel/cpu_setup_power.S<br class=3D"">+++ =
b/arch/powerpc/kernel/cpu_setup_power.S<br class=3D"">@@ -94,6 +94,7 @@ =
_GLOBAL(__restore_cpu_power8)<br =
class=3D"">_GLOBAL(__setup_cpu_power10)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mflr =
&nbsp;&nbsp;&nbsp;r11<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bl =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;__init_FSCR_power10<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bl =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;__init_PMU_ISA31<br =
class=3D""></blockquote><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">So we set MMCRA here but then aren't we still going to call =
__init_PMU</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">which will =
overwrite that?</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Would this setting MMCRA also need to be handled in =
__restore_cpu_power10?</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""></div></blockquote><div><br =
class=3D""></div>Thanks for this nice catch ! &nbsp;When I rebased code =
initial phase, we didn=E2=80=99t had power10 part filled =
in.</div><div>It was a miss from my side in adding PMu init functions =
and thanks for pointing this out.&nbsp;</div><div>Below patch will call =
__init_PMU functions in setup and restore. Please check if this looks =
good</div><div><br class=3D""></div><div>--</div><div><div>diff --git =
a/arch/powerpc/kernel/cpu_setup_power.S =
b/arch/powerpc/kernel/cpu_setup_power.S</div><div>index =
efdcfa714106..e672a6c5fd7c 100644</div><div>--- =
a/arch/powerpc/kernel/cpu_setup_power.S</div><div>+++ =
b/arch/powerpc/kernel/cpu_setup_power.S</div><div>@@ -94,6 +94,9 @@ =
_GLOBAL(__restore_cpu_power8)</div><div>&nbsp;_GLOBAL(__setup_cpu_power10)=
</div><div>&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space:pre">=
	</span>mflr<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>r11</div><div>&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>bl<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>__init_FSCR_power10</div><div>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>bl<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>__init_PMU</div><div>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>bl<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>__init_PMU_ISA31</div><div>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>bl<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	=
</span>__init_PMU_HV</div><div>&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>b<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	=
</span>1f</div><div>&nbsp;</div><div>&nbsp;_GLOBAL(__setup_cpu_power9)</di=
v><div>@@ -124,6 +127,9 @@ =
_GLOBAL(__setup_cpu_power9)</div><div>&nbsp;_GLOBAL(__restore_cpu_power10)=
</div><div>&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space:pre">=
	</span>mflr<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>r11</div><div>&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>bl<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>__init_FSCR_power10</div><div>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>bl<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>__init_PMU</div><div>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>bl<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>__init_PMU_ISA31</div><div>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>bl<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	=
</span>__init_PMU_HV</div><div>&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>b<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	=
</span>1f</div><div>&nbsp;</div><div>&nbsp;_GLOBAL(__restore_cpu_power9)</=
div><div>@@ -233,3 +239,10 @@ __init_PMU_ISA207:</div><div>&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>li<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>r5,0</div><div>&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>mtspr<span class=3D"Apple-tab-span"=
 style=3D"white-space:pre">	=
</span>SPRN_MMCRS,r5</div><div>&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	=
</span>blr</div><div>+</div><div>+__init_PMU_ISA31:</div><div>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>li<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>r5,0</div><div>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>mtspr<span class=3D"Apple-tab-span"=
 style=3D"white-space:pre">	</span>SPRN_MMCR3,r5</div><div>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>LOAD_REG_IMMEDIATE(r5, MMCRA_BHRB_DISABLE)</div><div>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>mtspr<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>SPRN_MMCRA,r5</div><div>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>blr</div><div><br =
class=3D""></div><div>=E2=80=94</div><div><br class=3D""></div><blockquote=
 type=3D"cite" class=3D""><div class=3D""><blockquote type=3D"cite" =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1f<br class=3D""><br =
class=3D"">_GLOBAL(__setup_cpu_power9)<br class=3D"">@@ -233,3 +234,10 =
@@ __init_PMU_ISA207:<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;li =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;r5,0<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mtspr =
&nbsp;&nbsp;SPRN_MMCRS,r5<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;blr<br =
class=3D"">+<br class=3D"">+__init_PMU_ISA31:<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;li =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;r5,0<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mtspr &nbsp;&nbsp;SPRN_MMCR3,r5<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;LOAD_REG_IMMEDIATE(r5, =
MMCRA_BHRB_DISABLE)<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mtspr &nbsp;&nbsp;SPRN_MMCRA,r5<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;blr<br class=3D"">diff =
--git a/arch/powerpc/kernel/dt_cpu_ftrs.c =
b/arch/powerpc/kernel/dt_cpu_ftrs.c<br class=3D"">index 3a40951..f482286 =
100644<br class=3D"">--- a/arch/powerpc/kernel/dt_cpu_ftrs.c<br =
class=3D"">+++ b/arch/powerpc/kernel/dt_cpu_ftrs.c<br class=3D"">@@ =
-450,6 +450,31 @@ static int __init feat_enable_pmu_power9(struct =
dt_cpu_feature *f)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return 1;<br =
class=3D"">}<br class=3D""><br class=3D"">+static void =
init_pmu_power10(void)<br class=3D"">+{<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;init_pmu_power9();<br class=3D"">+<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mtspr(SPRN_MMCR3, =
0);<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mtspr(SPRN_MMCRA, =
MMCRA_BHRB_DISABLE);<br class=3D"">+}<br class=3D"">+<br =
class=3D"">+static int __init feat_enable_pmu_power10(struct =
dt_cpu_feature *f)<br class=3D"">+{<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;hfscr_pmu_enable();<br class=3D"">+<br=
 class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;init_pmu_power10();<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;init_pmu_registers =3D =
init_pmu_power10;<br class=3D"">+<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cur_cpu_spec-&gt;cpu_features |=3D =
CPU_FTR_MMCRA;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cur_cpu_spec-&gt;cpu_user_features =
|=3D PPC_FEATURE_PSERIES_PERFMON_COMPAT;<br class=3D"">+<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cur_cpu_spec-&gt;num_pmcs =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=3D 6;<br =
class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cur_cpu_spec-&gt;pmc_type =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=3D =
PPC_PMC_IBM;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cur_cpu_spec-&gt;oprofile_cpu_type =3D=
 "ppc64/power10";<br class=3D"">+<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return 1;<br class=3D"">+}<br =
class=3D"">+<br class=3D"">static int __init feat_enable_tm(struct =
dt_cpu_feature *f)<br class=3D"">{<br class=3D"">#ifdef =
CONFIG_PPC_TRANSACTIONAL_MEM<br class=3D"">@@ -639,6 +664,7 @@ struct =
dt_cpu_feature_match {<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{"pc-relative-address=
ing", feat_enable, 0},<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{"machine-check-power=
9", feat_enable_mce_power9, 0},<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{"performance-monitor=
-power9", feat_enable_pmu_power9, 0},<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{"performance-monitor-power10", =
feat_enable_pmu_power10, 0},<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{"event-based-branch-=
v3", feat_enable, 0},<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{"random-number-gener=
ator", feat_enable, 0},<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{"system-call-vectore=
d", feat_disable, 0},<br class=3D"">--<br =
class=3D"">1.8.3.1</blockquote></div></blockquote></div><br =
class=3D""></body></html>=

--Apple-Mail=_28D83C0F-1F3F-49AA-95FF-7F8F48673511--

