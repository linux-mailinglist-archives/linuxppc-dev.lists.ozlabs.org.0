Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 045F82185F3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 13:20:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1xgk33HRzDr7x
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 21:20:50 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1rpk16l9zDr44
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jul 2020 17:41:33 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0687WLu3134390; Wed, 8 Jul 2020 03:41:27 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3255kde7ud-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jul 2020 03:41:26 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0687agrY029792;
 Wed, 8 Jul 2020 07:41:24 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma02fra.de.ibm.com with ESMTP id 322hd84ceq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jul 2020 07:41:23 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0687fLwn49545470
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Jul 2020 07:41:21 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 94EBAA4055;
 Wed,  8 Jul 2020 07:41:21 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EE236A4053;
 Wed,  8 Jul 2020 07:41:18 +0000 (GMT)
Received: from [9.77.192.15] (unknown [9.77.192.15])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed,  8 Jul 2020 07:41:18 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Message-Id: <65124045-CE85-43EA-858A-D58B1372F28A@linux.vnet.ibm.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_D1AAD4BB-FC82-4291-96DA-DEEC364D839F"
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v2 07/10] powerpc/perf: support BHRB disable bit and new
 filtering modes
Date: Wed, 8 Jul 2020 13:11:16 +0530
In-Reply-To: <0cf26e42a3b190d5ea69d1ba61ae71bcaeee1973.camel@neuling.org>
To: Michael Neuling <mikey@neuling.org>
References: <1593595262-1433-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1593595262-1433-8-git-send-email-atrajeev@linux.vnet.ibm.com>
 <0cf26e42a3b190d5ea69d1ba61ae71bcaeee1973.camel@neuling.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-08_04:2020-07-08,
 2020-07-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 mlxscore=0 suspectscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 cotscore=-2147483648 spamscore=0
 mlxlogscore=999 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2007080049
X-Mailman-Approved-At: Wed, 08 Jul 2020 21:17:29 +1000
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
Cc: Vaidyanathan Srinivasan <svaidyan@in.ibm.com>, maddy@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, ego <ego@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_D1AAD4BB-FC82-4291-96DA-DEEC364D839F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> On 07-Jul-2020, at 12:47 PM, Michael Neuling <mikey@neuling.org> =
wrote:
>=20
> On Wed, 2020-07-01 at 05:20 -0400, Athira Rajeev wrote:
>> PowerISA v3.1 has few updates for the Branch History Rolling =
Buffer(BHRB).
>> First is the addition of BHRB disable bit and second new filtering
>> modes for BHRB.
>>=20
>> BHRB disable is controlled via Monitor Mode Control Register A =
(MMCRA)
>> bit 26, namely "BHRB Recording Disable (BHRBRD)". This field controls
>> whether BHRB entries are written when BHRB recording is enabled by =
other
>> bits. Patch implements support for this BHRB disable bit.
>=20
> Probably good to note here that this is backwards compatible. So if =
you have a
> kernel that doesn't know about this bit, it'll clear it and hence you =
still get
> BHRB.=20
>=20
> You should also note why you'd want to do disable this (ie. the core =
will run
> faster).
>=20


Sure Mikey, will add these information in commit message=20

Thanks
Athira


>> Secondly PowerISA v3.1 introduce filtering support for
>> PERF_SAMPLE_BRANCH_IND_CALL/COND. The patch adds BHRB filter support
>> for "ind_call" and "cond" in power10_bhrb_filter_map().
>>=20
>> 'commit bb19af816025 ("powerpc/perf: Prevent kernel address leak to =
userspace
>> via BHRB buffer")'
>> added a check in bhrb_read() to filter the kernel address from BHRB =
buffer.
>> Patch here modified
>> it to avoid that check for PowerISA v3.1 based processors, since =
PowerISA v3.1
>> allows
>> only MSR[PR]=3D1 address to be written to BHRB buffer.
>>=20
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>> ---
>> arch/powerpc/perf/core-book3s.c       | 27 =
+++++++++++++++++++++------
>> arch/powerpc/perf/isa207-common.c     | 13 +++++++++++++
>> arch/powerpc/perf/power10-pmu.c       | 13 +++++++++++--
>> arch/powerpc/platforms/powernv/idle.c | 14 ++++++++++++++
>=20
> This touches the idle code so we should get those guys on CC (adding =
Vaidy and
> Ego).
>=20
>> 4 files changed, 59 insertions(+), 8 deletions(-)
>>=20
>> diff --git a/arch/powerpc/perf/core-book3s.c =
b/arch/powerpc/perf/core-book3s.c
>> index fad5159..9709606 100644
>> --- a/arch/powerpc/perf/core-book3s.c
>> +++ b/arch/powerpc/perf/core-book3s.c
>> @@ -466,9 +466,13 @@ static void power_pmu_bhrb_read(struct =
perf_event *event,
>> struct cpu_hw_events *
>> 			 * addresses at this point. Check the privileges =
before
>> 			 * exporting it to userspace (avoid exposure of =
regions
>> 			 * where we could have speculative execution)
>> +			 * Incase of ISA 310, BHRB will capture only =
user-space
>> +			 * address,hence include a check before =
filtering code
>> 			 */
>> -			if (is_kernel_addr(addr) && =
perf_allow_kernel(&event-
>>> attr) !=3D 0)
>> -				continue;
>> +			if (!(ppmu->flags & PPMU_ARCH_310S))
>> +				if (is_kernel_addr(addr) &&
>> +				perf_allow_kernel(&event->attr) !=3D 0)
>> +					continue;
>>=20
>> 			/* Branches are read most recent first (ie. =
mfbhrb 0 is
>> 			 * the most recent branch).
>> @@ -1212,7 +1216,7 @@ static void write_mmcr0(struct cpu_hw_events =
*cpuhw,
>> unsigned long mmcr0)
>> static void power_pmu_disable(struct pmu *pmu)
>> {
>> 	struct cpu_hw_events *cpuhw;
>> -	unsigned long flags, mmcr0, val;
>> +	unsigned long flags, mmcr0, val, mmcra =3D 0;
>>=20
>> 	if (!ppmu)
>> 		return;
>> @@ -1245,12 +1249,23 @@ static void power_pmu_disable(struct pmu =
*pmu)
>> 		mb();
>> 		isync();
>>=20
>> +		val =3D mmcra =3D cpuhw->mmcr[2];
>> +
>> 		/*
>> 		 * Disable instruction sampling if it was enabled
>> 		 */
>> -		if (cpuhw->mmcr[2] & MMCRA_SAMPLE_ENABLE) {
>> -			mtspr(SPRN_MMCRA,
>> -			      cpuhw->mmcr[2] & ~MMCRA_SAMPLE_ENABLE);
>> +		if (cpuhw->mmcr[2] & MMCRA_SAMPLE_ENABLE)
>> +			mmcra =3D cpuhw->mmcr[2] & ~MMCRA_SAMPLE_ENABLE;
>> +
>> +		/* Disable BHRB via mmcra [:26] for p10 if needed */
>> +		if (!(cpuhw->mmcr[2] & MMCRA_BHRB_DISABLE))
>> +			mmcra |=3D MMCRA_BHRB_DISABLE;
>> +
>> +		/* Write SPRN_MMCRA if mmcra has either disabled
>> +		 * instruction sampling or BHRB
>> +		 */
>> +		if (val !=3D mmcra) {
>> +			mtspr(SPRN_MMCRA, mmcra);
>> 			mb();
>> 			isync();
>> 		}
>> diff --git a/arch/powerpc/perf/isa207-common.c =
b/arch/powerpc/perf/isa207-
>> common.c
>> index 7d4839e..463d925 100644
>> --- a/arch/powerpc/perf/isa207-common.c
>> +++ b/arch/powerpc/perf/isa207-common.c
>> @@ -404,6 +404,12 @@ int isa207_compute_mmcr(u64 event[], int n_ev,
>>=20
>> 	mmcra =3D mmcr1 =3D mmcr2 =3D mmcr3 =3D 0;
>>=20
>> +	/* Disable bhrb unless explicitly requested
>> +	 * by setting MMCRA [:26] bit.
>> +	 */
>> +	if (cpu_has_feature(CPU_FTR_ARCH_31))
>> +		mmcra |=3D MMCRA_BHRB_DISABLE;
>> +
>> 	/* Second pass: assign PMCs, set all MMCR1 fields */
>> 	for (i =3D 0; i < n_ev; ++i) {
>> 		pmc     =3D (event[i] >> EVENT_PMC_SHIFT) & =
EVENT_PMC_MASK;
>> @@ -475,10 +481,17 @@ int isa207_compute_mmcr(u64 event[], int n_ev,
>> 		}
>>=20
>> 		if (event[i] & EVENT_WANTS_BHRB) {
>> +			/* set MMCRA[:26] to 0 for Power10 to enable =
BHRB */
>> +			if (cpu_has_feature(CPU_FTR_ARCH_31))
>> +				mmcra &=3D ~MMCRA_BHRB_DISABLE;
>> 			val =3D (event[i] >> EVENT_IFM_SHIFT) & =
EVENT_IFM_MASK;
>> 			mmcra |=3D val << MMCRA_IFM_SHIFT;
>> 		}
>>=20
>> +		/* set MMCRA[:26] to 0 if there is user request for BHRB =
*/
>> +		if (cpu_has_feature(CPU_FTR_ARCH_31) &&
>> has_branch_stack(pevents[i]))
>> +			mmcra &=3D ~MMCRA_BHRB_DISABLE;
>> +
>> 		if (pevents[i]->attr.exclude_user)
>> 			mmcr2 |=3D MMCR2_FCP(pmc);
>>=20
>> diff --git a/arch/powerpc/perf/power10-pmu.c =
b/arch/powerpc/perf/power10-pmu.c
>> index d64d69d..07fb919 100644
>> --- a/arch/powerpc/perf/power10-pmu.c
>> +++ b/arch/powerpc/perf/power10-pmu.c
>> @@ -82,6 +82,8 @@
>>=20
>> /* MMCRA IFM bits - POWER10 */
>> #define POWER10_MMCRA_IFM1		0x0000000040000000UL
>> +#define POWER10_MMCRA_IFM2		0x0000000080000000UL
>> +#define POWER10_MMCRA_IFM3		0x00000000C0000000UL
>> #define POWER10_MMCRA_BHRB_MASK		0x00000000C0000000UL
>>=20
>> /* Table of alternatives, sorted by column 0 */
>> @@ -233,8 +235,15 @@ static u64 power10_bhrb_filter_map(u64
>> branch_sample_type)
>> 	if (branch_sample_type & PERF_SAMPLE_BRANCH_ANY_RETURN)
>> 		return -1;
>>=20
>> -	if (branch_sample_type & PERF_SAMPLE_BRANCH_IND_CALL)
>> -		return -1;
>> +	if (branch_sample_type & PERF_SAMPLE_BRANCH_IND_CALL) {
>> +		pmu_bhrb_filter |=3D POWER10_MMCRA_IFM2;
>> +		return pmu_bhrb_filter;
>> +	}
>> +
>> +	if (branch_sample_type & PERF_SAMPLE_BRANCH_COND) {
>> +		pmu_bhrb_filter |=3D POWER10_MMCRA_IFM3;
>> +		return pmu_bhrb_filter;
>> +	}
>>=20
>> 	if (branch_sample_type & PERF_SAMPLE_BRANCH_CALL)
>> 		return -1;
>> diff --git a/arch/powerpc/platforms/powernv/idle.c
>> b/arch/powerpc/platforms/powernv/idle.c
>> index 2dd4673..7db99c7 100644
>> --- a/arch/powerpc/platforms/powernv/idle.c
>> +++ b/arch/powerpc/platforms/powernv/idle.c
>> @@ -611,6 +611,7 @@ static unsigned long power9_idle_stop(unsigned =
long psscr,
>> bool mmu_on)
>> 	unsigned long srr1;
>> 	unsigned long pls;
>> 	unsigned long mmcr0 =3D 0;
>> +	unsigned long mmcra_bhrb =3D 0;
>> 	struct p9_sprs sprs =3D {}; /* avoid false used-uninitialised */
>> 	bool sprs_saved =3D false;
>>=20
>> @@ -657,6 +658,15 @@ static unsigned long power9_idle_stop(unsigned =
long
>> psscr, bool mmu_on)
>> 		  */
>> 		mmcr0		=3D mfspr(SPRN_MMCR0);
>> 	}
>> +
>> +	if (cpu_has_feature(CPU_FTR_ARCH_31)) {
>> +		/* POWER10 uses MMCRA[:26] as BHRB disable bit
>> +		 * to disable BHRB logic when not used. Hence Save and
>> +		 * restore MMCRA after a state-loss idle.
>> +		 */
>> +		mmcra_bhrb		=3D mfspr(SPRN_MMCRA);
>=20
>=20
> Why is the bhrb bit of mmcra special here?

This to save/restore BHRB disable bit in state-loss idle state to make =
sure
we keep BHRB disabled if it was not enabled on request at runtime.
>=20
>> +	}
>> +
>> 	if ((psscr & PSSCR_RL_MASK) >=3D pnv_first_spr_loss_level) {
>> 		sprs.lpcr	=3D mfspr(SPRN_LPCR);
>> 		sprs.hfscr	=3D mfspr(SPRN_HFSCR);
>> @@ -721,6 +731,10 @@ static unsigned long power9_idle_stop(unsigned =
long
>> psscr, bool mmu_on)
>> 			mtspr(SPRN_MMCR0, mmcr0);
>> 		}
>>=20
>> +		/* Reload MMCRA to restore BHRB disable bit for POWER10 =
*/
>> +		if (cpu_has_feature(CPU_FTR_ARCH_31))
>> +			mtspr(SPRN_MMCRA, mmcra_bhrb);
>> +
>> 		/*
>> 		 * DD2.2 and earlier need to set then clear bit 60 in =
MMCRA
>> 		 * to ensure the PMU starts running.


--Apple-Mail=_D1AAD4BB-FC82-4291-96DA-DEEC364D839F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 07-Jul-2020, at 12:47 PM, Michael Neuling &lt;<a =
href=3D"mailto:mikey@neuling.org" class=3D"">mikey@neuling.org</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">On Wed, 2020-07-01 at 05:20 =
-0400, Athira Rajeev wrote:</span><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D"">PowerISA v3.1 has few updates for the =
Branch History Rolling Buffer(BHRB).<br class=3D"">First is the addition =
of BHRB disable bit and second new filtering<br class=3D"">modes for =
BHRB.<br class=3D""><br class=3D"">BHRB disable is controlled via =
Monitor Mode Control Register A (MMCRA)<br class=3D"">bit 26, namely =
"BHRB Recording Disable (BHRBRD)". This field controls<br =
class=3D"">whether BHRB entries are written when BHRB recording is =
enabled by other<br class=3D"">bits. Patch implements support for this =
BHRB disable bit.<br class=3D""></blockquote><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Probably good to note here that this is backwards compatible. =
So if you have a</span><br style=3D"caret-color: rgb(0, 0, 0); =
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
class=3D"">kernel that doesn't know about this bit, it'll clear it and =
hence you still get</span><br style=3D"caret-color: rgb(0, 0, 0); =
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
class=3D"">BHRB.<span =
class=3D"Apple-converted-space">&nbsp;</span></span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">You should also note why you'd =
want to do disable this (ie. the core will run</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">faster).</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" =
class=3D""></div></blockquote><div><br class=3D""></div><div><br =
class=3D""></div>Sure Mikey, will add these information in commit =
message&nbsp;</div><div><br =
class=3D""></div><div>Thanks</div><div>Athira</div><div><br =
class=3D""></div><div><br class=3D""><blockquote type=3D"cite" =
class=3D""><div class=3D""><blockquote type=3D"cite" style=3D"font-family:=
 Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" =
class=3D"">Secondly PowerISA v3.1 introduce filtering support for<br =
class=3D"">PERF_SAMPLE_BRANCH_IND_CALL/COND. The patch adds BHRB filter =
support<br class=3D"">for "ind_call" and "cond" in =
power10_bhrb_filter_map().<br class=3D""><br class=3D"">'commit =
bb19af816025 ("powerpc/perf: Prevent kernel address leak to userspace<br =
class=3D"">via BHRB buffer")'<br class=3D"">added a check in bhrb_read() =
to filter the kernel address from BHRB buffer.<br class=3D"">Patch here =
modified<br class=3D"">it to avoid that check for PowerISA v3.1 based =
processors, since PowerISA v3.1<br class=3D"">allows<br class=3D"">only =
MSR[PR]=3D1 address to be written to BHRB buffer.<br class=3D""><br =
class=3D"">Signed-off-by: Athira Rajeev &lt;<a =
href=3D"mailto:atrajeev@linux.vnet.ibm.com" =
class=3D"">atrajeev@linux.vnet.ibm.com</a>&gt;<br class=3D"">---<br =
class=3D"">arch/powerpc/perf/core-book3s.c =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 27 +++++++++++++++++++++------<br =
class=3D"">arch/powerpc/perf/isa207-common.c &nbsp;&nbsp;&nbsp;&nbsp;| =
13 +++++++++++++<br class=3D"">arch/powerpc/perf/power10-pmu.c =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 13 +++++++++++--<br =
class=3D"">arch/powerpc/platforms/powernv/idle.c | 14 ++++++++++++++<br =
class=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, 0); =
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
class=3D"">This touches the idle code so we should get those guys on CC =
(adding Vaidy and</span><br style=3D"caret-color: rgb(0, 0, 0); =
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
class=3D"">Ego).</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D"">4 files changed, 59 insertions(+), 8 =
deletions(-)<br class=3D""><br class=3D"">diff --git =
a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c<br =
class=3D"">index fad5159..9709606 100644<br class=3D"">--- =
a/arch/powerpc/perf/core-book3s.c<br class=3D"">+++ =
b/arch/powerpc/perf/core-book3s.c<br class=3D"">@@ -466,9 +466,13 @@ =
static void power_pmu_bhrb_read(struct perf_event *event,<br =
class=3D"">struct cpu_hw_events *<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>* addresses at this point. =
Check the privileges before<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>* exporting it to userspace =
(avoid exposure of regions<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>* where we could have =
speculative execution)<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>* Incase of ISA 310, BHRB =
will capture only user-space<br class=3D"">+<span class=3D"Apple-tab-span"=
 style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>* address,hence include a =
check before filtering code<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>*/<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>if =
(is_kernel_addr(addr) &amp;&amp; perf_allow_kernel(&amp;event-<br =
class=3D""><blockquote type=3D"cite" class=3D"">attr) !=3D 0)<br =
class=3D""></blockquote>-<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>continue;<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>if =
(!(ppmu-&gt;flags &amp; PPMU_ARCH_310S))<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>if =
(is_kernel_addr(addr) &amp;&amp;<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>perf_allow_kernel(&amp;event-&gt;attr) !=3D 0)<br class=3D"">+<span=
 class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>continue;<br class=3D""><br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>/* =
Branches are read most recent first (ie. mfbhrb 0 is<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>* the most recent =
branch).<br class=3D"">@@ -1212,7 +1216,7 @@ static void =
write_mmcr0(struct cpu_hw_events *cpuhw,<br class=3D"">unsigned long =
mmcr0)<br class=3D"">static void power_pmu_disable(struct pmu *pmu)<br =
class=3D"">{<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>struct cpu_hw_events *cpuhw;<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>unsigned long flags, mmcr0, val;<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>unsigned =
long flags, mmcr0, val, mmcra =3D 0;<br class=3D""><br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>if =
(!ppmu)<br class=3D""><span class=3D"Apple-tab-span" style=3D"white-space:=
 pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>return;<br class=3D"">@@ -1245,12 +1249,23 @@ static void =
power_pmu_disable(struct pmu *pmu)<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>mb();<br =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>isync();<br class=3D""><br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>val =3D =
mmcra =3D cpuhw-&gt;mmcr[2];<br class=3D"">+<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>/*<br =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-converted-space">&nbsp;</span>* Disable =
instruction sampling if it was enabled<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>*/<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>if =
(cpuhw-&gt;mmcr[2] &amp; MMCRA_SAMPLE_ENABLE) {<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>mtspr(SPRN_MMCRA,<br class=3D"">-<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;cpuhw-&gt;mmcr[2] &amp; ~MMCRA_SAMPLE_ENABLE);<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>if =
(cpuhw-&gt;mmcr[2] &amp; MMCRA_SAMPLE_ENABLE)<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>mmcra =3D =
cpuhw-&gt;mmcr[2] &amp; ~MMCRA_SAMPLE_ENABLE;<br class=3D"">+<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>/* Disable BHRB via mmcra [:26] for p10 if needed */<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>if (!(cpuhw-&gt;mmcr[2] &amp; MMCRA_BHRB_DISABLE))<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>mmcra |=3D MMCRA_BHRB_DISABLE;<br class=3D"">+<br class=3D"">+<span=
 class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>/* Write =
SPRN_MMCRA if mmcra has either disabled<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>* instruction sampling or =
BHRB<br class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-converted-space">&nbsp;</span>*/<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>if (val !=3D mmcra) {<br class=3D"">+<span class=3D"Apple-tab-span"=
 style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>mtspr(SPRN_MMCRA, mmcra);<br =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>mb();<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>isync();<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>}<br =
class=3D"">diff --git a/arch/powerpc/perf/isa207-common.c =
b/arch/powerpc/perf/isa207-<br class=3D"">common.c<br class=3D"">index =
7d4839e..463d925 100644<br class=3D"">--- =
a/arch/powerpc/perf/isa207-common.c<br class=3D"">+++ =
b/arch/powerpc/perf/isa207-common.c<br class=3D"">@@ -404,6 +404,12 @@ =
int isa207_compute_mmcr(u64 event[], int n_ev,<br class=3D""><br =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>mmcra =3D mmcr1 =3D mmcr2 =3D mmcr3 =3D 0;<br class=3D""><br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>/* Disable bhrb unless explicitly requested<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>* by setting MMCRA [:26] =
bit.<br class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-converted-space">&nbsp;</span>*/<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>if (cpu_has_feature(CPU_FTR_ARCH_31))<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>mmcra |=3D =
MMCRA_BHRB_DISABLE;<br class=3D"">+<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>/* Second =
pass: assign PMCs, set all MMCR1 fields */<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>for (i =3D =
0; i &lt; n_ev; ++i) {<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>pmc &nbsp;&nbsp;&nbsp;&nbsp;=3D =
(event[i] &gt;&gt; EVENT_PMC_SHIFT) &amp; EVENT_PMC_MASK;<br class=3D"">@@=
 -475,10 +481,17 @@ int isa207_compute_mmcr(u64 event[], int n_ev,<br =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>}<br class=3D""><br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>if (event[i] &amp; =
EVENT_WANTS_BHRB) {<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>/* set MMCRA[:26] to 0 for =
Power10 to enable BHRB */<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>if =
(cpu_has_feature(CPU_FTR_ARCH_31))<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>mmcra =
&amp;=3D ~MMCRA_BHRB_DISABLE;<br class=3D""><span class=3D"Apple-tab-span"=
 style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>val =3D (event[i] &gt;&gt; =
EVENT_IFM_SHIFT) &amp; EVENT_IFM_MASK;<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>mmcra |=3D =
val &lt;&lt; MMCRA_IFM_SHIFT;<br class=3D""><span class=3D"Apple-tab-span"=
 style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>}<br class=3D""><br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>/* set MMCRA[:26] to 0 if there is user request for BHRB */<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>if (cpu_has_feature(CPU_FTR_ARCH_31) &amp;&amp;<br =
class=3D"">has_branch_stack(pevents[i]))<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>mmcra =
&amp;=3D ~MMCRA_BHRB_DISABLE;<br class=3D"">+<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>if =
(pevents[i]-&gt;attr.exclude_user)<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>mmcr2 |=3D =
MMCR2_FCP(pmc);<br class=3D""><br class=3D"">diff --git =
a/arch/powerpc/perf/power10-pmu.c b/arch/powerpc/perf/power10-pmu.c<br =
class=3D"">index d64d69d..07fb919 100644<br class=3D"">--- =
a/arch/powerpc/perf/power10-pmu.c<br class=3D"">+++ =
b/arch/powerpc/perf/power10-pmu.c<br class=3D"">@@ -82,6 +82,8 @@<br =
class=3D""><br class=3D"">/* MMCRA IFM bits - POWER10 */<br =
class=3D"">#define POWER10_MMCRA_IFM1<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>0x0000000040000000UL<br =
class=3D"">+#define POWER10_MMCRA_IFM2<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>0x0000000080000000UL<br =
class=3D"">+#define POWER10_MMCRA_IFM3<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>0x00000000C0000000UL<br =
class=3D"">#define POWER10_MMCRA_BHRB_MASK<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>0x00000000C0000000UL<br =
class=3D""><br class=3D"">/* Table of alternatives, sorted by column 0 =
*/<br class=3D"">@@ -233,8 +235,15 @@ static u64 =
power10_bhrb_filter_map(u64<br class=3D"">branch_sample_type)<br =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>if (branch_sample_type &amp; PERF_SAMPLE_BRANCH_ANY_RETURN)<br =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>return -1;<br class=3D""><br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>if =
(branch_sample_type &amp; PERF_SAMPLE_BRANCH_IND_CALL)<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>return -1;<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>if (branch_sample_type &amp; =
PERF_SAMPLE_BRANCH_IND_CALL) {<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>pmu_bhrb_filter |=3D POWER10_MMCRA_IFM2;<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>return =
pmu_bhrb_filter;<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>}<br class=3D"">+<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>if (branch_sample_type &amp; PERF_SAMPLE_BRANCH_COND) {<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>pmu_bhrb_filter |=3D POWER10_MMCRA_IFM3;<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>return =
pmu_bhrb_filter;<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>}<br class=3D""><br =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>if (branch_sample_type &amp; PERF_SAMPLE_BRANCH_CALL)<br =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>return -1;<br class=3D"">diff --git =
a/arch/powerpc/platforms/powernv/idle.c<br =
class=3D"">b/arch/powerpc/platforms/powernv/idle.c<br class=3D"">index =
2dd4673..7db99c7 100644<br class=3D"">--- =
a/arch/powerpc/platforms/powernv/idle.c<br class=3D"">+++ =
b/arch/powerpc/platforms/powernv/idle.c<br class=3D"">@@ -611,6 +611,7 =
@@ static unsigned long power9_idle_stop(unsigned long psscr,<br =
class=3D"">bool mmu_on)<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>unsigned long srr1;<br =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>unsigned long pls;<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>unsigned long mmcr0 =3D 0;<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>unsigned long mmcra_bhrb =3D 0;<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>struct =
p9_sprs sprs =3D {}; /* avoid false used-uninitialised */<br =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>bool sprs_saved =3D false;<br class=3D""><br class=3D"">@@ -657,6 =
+658,15 @@ static unsigned long power9_idle_stop(unsigned long<br =
class=3D"">psscr, bool mmu_on)<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;*/<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>mmcr0<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>=3D mfspr(SPRN_MMCR0);<br class=3D""><span class=3D"Apple-tab-span"=
 style=3D"white-space: pre;">	</span>}<br class=3D"">+<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>if (cpu_has_feature(CPU_FTR_ARCH_31)) {<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>/* =
POWER10 uses MMCRA[:26] as BHRB disable bit<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>* to disable BHRB logic =
when not used. Hence Save and<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>* restore MMCRA after a =
state-loss idle.<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>*/<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>mmcra_bhrb<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>=3D mfspr(SPRN_MMCRA);<br class=3D""></blockquote><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">Why is the bhrb bit of mmcra =
special here?</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""></div></blockquote><div><br class=3D""></div>This to =
save/restore BHRB disable bit in state-loss idle state to make =
sure</div><div>we keep BHRB disabled if it was not enabled on request at =
runtime.</div><div><blockquote type=3D"cite" class=3D""><div =
class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><blockquote type=3D"cite" style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>}<br =
class=3D"">+<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>if ((psscr &amp; PSSCR_RL_MASK) =
&gt;=3D pnv_first_spr_loss_level) {<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>sprs.lpcr<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>=3D mfspr(SPRN_LPCR);<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>sprs.hfscr<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>=3D mfspr(SPRN_HFSCR);<br class=3D"">@@ -721,6 +731,10 @@ =
static unsigned long power9_idle_stop(unsigned long<br class=3D"">psscr, =
bool mmu_on)<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>mtspr(SPRN_MMCR0, mmcr0);<br =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>}<br class=3D""><br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>/* Reload MMCRA to restore BHRB =
disable bit for POWER10 */<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>if =
(cpu_has_feature(CPU_FTR_ARCH_31))<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>mtspr(SPRN_MMCRA, mmcra_bhrb);<br class=3D"">+<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>/*<br =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-converted-space">&nbsp;</span>* DD2.2 and =
earlier need to set then clear bit 60 in MMCRA<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>* to ensure the PMU starts =
running.</blockquote></div></blockquote></div><br =
class=3D""></body></html>=

--Apple-Mail=_D1AAD4BB-FC82-4291-96DA-DEEC364D839F--

