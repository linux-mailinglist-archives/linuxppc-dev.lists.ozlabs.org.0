Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFCB21999E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 09:20:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2SHc046yzDr6X
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 17:20:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2R9w6mw4zDqkP
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jul 2020 16:30:12 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06960iDK123248; Thu, 9 Jul 2020 02:30:02 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 325ktsen5m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jul 2020 02:30:02 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0696KjHV015415;
 Thu, 9 Jul 2020 06:29:57 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 325k1vggfs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jul 2020 06:29:56 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0696TsQY61734946
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 Jul 2020 06:29:54 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A290AAE05A;
 Thu,  9 Jul 2020 06:29:54 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A7C21AE045;
 Thu,  9 Jul 2020 06:29:52 +0000 (GMT)
Received: from [9.85.87.102] (unknown [9.85.87.102])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu,  9 Jul 2020 06:29:52 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Message-Id: <3F67D5E9-D4AE-41B0-95AC-7231DC91A058@linux.vnet.ibm.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_E1CE319B-073D-42C4-ABFB-1FE9ADFF87D9"
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v2 10/10] powerpc/perf: Add extended regs support for
 power10 platform
Date: Thu, 9 Jul 2020 11:59:49 +0530
In-Reply-To: <87r1tm2owu.fsf@mpe.ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>
References: <1593595262-1433-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1593595262-1433-11-git-send-email-atrajeev@linux.vnet.ibm.com>
 <87r1tm2owu.fsf@mpe.ellerman.id.au>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-09_01:2020-07-08,
 2020-07-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 clxscore=1015 bulkscore=0 mlxlogscore=999 phishscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007090043
X-Mailman-Approved-At: Thu, 09 Jul 2020 17:18:34 +1000
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
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_E1CE319B-073D-42C4-ABFB-1FE9ADFF87D9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On 08-Jul-2020, at 5:34 PM, Michael Ellerman <mpe@ellerman.id.au> =
wrote:
>=20
> Athira Rajeev <atrajeev@linux.vnet.ibm.com =
<mailto:atrajeev@linux.vnet.ibm.com>> writes:
>> Include capability flag `PERF_PMU_CAP_EXTENDED_REGS` for power10
>> and expose MMCR3, SIER2, SIER3 registers as part of extended regs.
>> Also introduce `PERF_REG_PMU_MASK_31` to define extended mask
>> value at runtime for power10
>>=20
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>> ---
>> arch/powerpc/include/uapi/asm/perf_regs.h       |  6 ++++++
>> arch/powerpc/perf/perf_regs.c                   | 10 +++++++++-
>> arch/powerpc/perf/power10-pmu.c                 |  6 ++++++
>> tools/arch/powerpc/include/uapi/asm/perf_regs.h |  6 ++++++
>> tools/perf/arch/powerpc/include/perf_regs.h     |  3 +++
>> tools/perf/arch/powerpc/util/perf_regs.c        |  6 ++++++
>=20
> Please split into a kernel patch and a tools patch. And cc the tools =
people.

Ok sure
>=20
>> 6 files changed, 36 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/arch/powerpc/include/uapi/asm/perf_regs.h =
b/arch/powerpc/include/uapi/asm/perf_regs.h
>> index 485b1d5..020b51c 100644
>> --- a/arch/powerpc/include/uapi/asm/perf_regs.h
>> +++ b/arch/powerpc/include/uapi/asm/perf_regs.h
>> @@ -52,6 +52,9 @@ enum perf_event_powerpc_regs {
>> 	PERF_REG_POWERPC_MMCR0,
>> 	PERF_REG_POWERPC_MMCR1,
>> 	PERF_REG_POWERPC_MMCR2,
>> +	PERF_REG_POWERPC_MMCR3,
>> +	PERF_REG_POWERPC_SIER2,
>> +	PERF_REG_POWERPC_SIER3,
>> 	/* Max regs without the extended regs */
>> 	PERF_REG_POWERPC_MAX =3D PERF_REG_POWERPC_MMCRA + 1,
>> };
>> @@ -62,4 +65,7 @@ enum perf_event_powerpc_regs {
>> #define PERF_REG_PMU_MASK_300   (((1ULL << (PERF_REG_POWERPC_MMCR2 + =
1)) - 1) \
>> 				- PERF_REG_PMU_MASK)
>>=20
>> +/* PERF_REG_EXTENDED_MASK value for CPU_FTR_ARCH_31 */
>> +#define PERF_REG_PMU_MASK_31	(((1ULL << =
(PERF_REG_POWERPC_SIER3 + 1)) - 1) \
>> +				- PERF_REG_PMU_MASK)
>=20
> Wrapping that provides no benefit, just let it be long.
>=20

Ok,

>> #endif /* _UAPI_ASM_POWERPC_PERF_REGS_H */
>> diff --git a/arch/powerpc/perf/perf_regs.c =
b/arch/powerpc/perf/perf_regs.c
>> index c8a7e8c..c969935 100644
>> --- a/arch/powerpc/perf/perf_regs.c
>> +++ b/arch/powerpc/perf/perf_regs.c
>> @@ -81,6 +81,12 @@ static u64 get_ext_regs_value(int idx)
>> 		return mfspr(SPRN_MMCR1);
>> 	case PERF_REG_POWERPC_MMCR2:
>> 		return mfspr(SPRN_MMCR2);
>> +	case PERF_REG_POWERPC_MMCR3:
>> +			return mfspr(SPRN_MMCR3);
>> +	case PERF_REG_POWERPC_SIER2:
>> +			return mfspr(SPRN_SIER2);
>> +	case PERF_REG_POWERPC_SIER3:
>> +			return mfspr(SPRN_SIER3);
>=20
> Indentation is wrong.
>=20
>> 	default: return 0;
>> 	}
>> }
>> @@ -89,7 +95,9 @@ u64 perf_reg_value(struct pt_regs *regs, int idx)
>> {
>> 	u64 PERF_REG_EXTENDED_MAX;
>>=20
>> -	if (cpu_has_feature(CPU_FTR_ARCH_300))
>> +	if (cpu_has_feature(CPU_FTR_ARCH_31))
>> +		PERF_REG_EXTENDED_MAX =3D PERF_REG_POWERPC_SIER3 + 1;
>=20
> There's no way to know if that's correct other than going back to the
> header to look at the list of values.
>=20
> So instead you should define it in the header, next to the other =
values,
> with a meaningful name, like PERF_REG_MAX_ISA_31 or something.
>=20
>> +	else if (cpu_has_feature(CPU_FTR_ARCH_300))
>> 		PERF_REG_EXTENDED_MAX =3D PERF_REG_POWERPC_MMCR2 + 1;
>=20
> Same.
>=20

Ok, will make this change

>> 	if (idx =3D=3D PERF_REG_POWERPC_SIER &&
>> diff --git a/arch/powerpc/perf/power10-pmu.c =
b/arch/powerpc/perf/power10-pmu.c
>> index 07fb919..51082d6 100644
>> --- a/arch/powerpc/perf/power10-pmu.c
>> +++ b/arch/powerpc/perf/power10-pmu.c
>> @@ -86,6 +86,8 @@
>> #define POWER10_MMCRA_IFM3		0x00000000C0000000UL
>> #define POWER10_MMCRA_BHRB_MASK		0x00000000C0000000UL
>>=20
>> +extern u64 mask_var;
>=20
> Why is it extern? Also not a good name for a global.
>=20
> Hang on, it's not even used? Is there some macro magic somewhere?

This is defined in patch 8 "powerpc/perf: Add support for outputting =
extended regs in perf intr_regs=E2=80=9D,=20
which adds the base support for extended regs in powerpc. Current patch =
covers changes to support
It for power10.=20

`mask_var` is used to define `PERF_REG_EXTENDED_MASK` at run time.=20
`PERF_REG_EXTENDED_MASK` basically contains mask value of supported =
extended registers.
And since supported registers may differ between processor versions, we =
are defining this mask at runtime.

The #define is done in arch/powerpc/include/asm/perf_event_server.h ( in =
patch 8 ).
In the PMU driver init, we will set the respective mask value ( in the =
below code ). Hence it is extern

Sorry for the confusion here.=20

Thanks
Athira

>=20
>> /* Table of alternatives, sorted by column 0 */
>> static const unsigned int power10_event_alternatives[][MAX_ALT] =3D {
>> 	{ PM_RUN_CYC_ALT,		PM_RUN_CYC },
>> @@ -397,6 +399,7 @@ static void power10_config_bhrb(u64 =
pmu_bhrb_filter)
>> 	.cache_events		=3D &power10_cache_events,
>> 	.attr_groups		=3D power10_pmu_attr_groups,
>> 	.bhrb_nr		=3D 32,
>> +	.capabilities           =3D PERF_PMU_CAP_EXTENDED_REGS,
>> };
>>=20
>> int init_power10_pmu(void)
>> @@ -408,6 +411,9 @@ int init_power10_pmu(void)
>> 	    strcmp(cur_cpu_spec->oprofile_cpu_type, "ppc64/power10"))
>> 		return -ENODEV;
>>=20
>> +	/* Set the PERF_REG_EXTENDED_MASK here */
>> +	mask_var =3D PERF_REG_PMU_MASK_31;
>> +
>> 	rc =3D register_power_pmu(&power10_pmu);
>> 	if (rc)
>> 		return rc;
>=20
>=20
> cheers


--Apple-Mail=_E1CE319B-073D-42C4-ABFB-1FE9ADFF87D9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 08-Jul-2020, at 5:34 PM, Michael Ellerman &lt;<a =
href=3D"mailto:mpe@ellerman.id.au" class=3D"">mpe@ellerman.id.au</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">Athira Rajeev &lt;</span><a =
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
class=3D"">&gt; writes:</span><br style=3D"caret-color: rgb(0, 0, 0); =
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
text-decoration: none;" class=3D"">Include capability flag =
`PERF_PMU_CAP_EXTENDED_REGS` for power10<br class=3D"">and expose MMCR3, =
SIER2, SIER3 registers as part of extended regs.<br class=3D"">Also =
introduce `PERF_REG_PMU_MASK_31` to define extended mask<br =
class=3D"">value at runtime for power10<br class=3D""><br =
class=3D"">Signed-off-by: Athira Rajeev &lt;<a =
href=3D"mailto:atrajeev@linux.vnet.ibm.com" =
class=3D"">atrajeev@linux.vnet.ibm.com</a>&gt;<br class=3D"">---<br =
class=3D"">arch/powerpc/include/uapi/asm/perf_regs.h =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;6 ++++++<br =
class=3D"">arch/powerpc/perf/perf_regs.c =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 10 +++++++++-<br =
class=3D"">arch/powerpc/perf/power10-pmu.c =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;| &nbsp;6 ++++++<br =
class=3D"">tools/arch/powerpc/include/uapi/asm/perf_regs.h | &nbsp;6 =
++++++<br class=3D"">tools/perf/arch/powerpc/include/perf_regs.h =
&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;3 +++<br =
class=3D"">tools/perf/arch/powerpc/util/perf_regs.c =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;6 ++++++<br =
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
class=3D"">Please split into a kernel patch and a tools patch. And cc =
the tools people.</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""></div></blockquote><div><br =
class=3D""></div>Ok sure<br class=3D""><blockquote type=3D"cite" =
class=3D""><div class=3D""><br style=3D"caret-color: rgb(0, 0, 0); =
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
text-decoration: none;" class=3D"">6 files changed, 36 insertions(+), 1 =
deletion(-)<br class=3D""><br class=3D"">diff --git =
a/arch/powerpc/include/uapi/asm/perf_regs.h =
b/arch/powerpc/include/uapi/asm/perf_regs.h<br class=3D"">index =
485b1d5..020b51c 100644<br class=3D"">--- =
a/arch/powerpc/include/uapi/asm/perf_regs.h<br class=3D"">+++ =
b/arch/powerpc/include/uapi/asm/perf_regs.h<br class=3D"">@@ -52,6 +52,9 =
@@ enum perf_event_powerpc_regs {<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>PERF_REG_POWERPC_MMCR0,<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>PERF_REG_POWERPC_MMCR1,<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>PERF_REG_POWERPC_MMCR2,<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>PERF_REG_POWERPC_MMCR3,<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>PERF_REG_POWERPC_SIER2,<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>PERF_REG_POWERPC_SIER3,<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>/* Max =
regs without the extended regs */<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>PERF_REG_POWERPC_MAX =3D PERF_REG_POWERPC_MMCRA + 1,<br =
class=3D"">};<br class=3D"">@@ -62,4 +65,7 @@ enum =
perf_event_powerpc_regs {<br class=3D"">#define PERF_REG_PMU_MASK_300 =
&nbsp;&nbsp;(((1ULL &lt;&lt; (PERF_REG_POWERPC_MMCR2 + 1)) - 1) \<br =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>- PERF_REG_PMU_MASK)<br class=3D""><br class=3D"">+/* =
PERF_REG_EXTENDED_MASK value for CPU_FTR_ARCH_31 */<br class=3D"">+#define=
 PERF_REG_PMU_MASK_31<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>(((1ULL &lt;&lt; (PERF_REG_POWERPC_SIER3 + 1)) - 1) \<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>- PERF_REG_PMU_MASK)<br class=3D""></blockquote><br =
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
display: inline !important;" class=3D"">Wrapping that provides no =
benefit, just let it be long.</span><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""></div></blockquote><div><br =
class=3D""></div>Ok,</div><div><br class=3D""><blockquote type=3D"cite" =
class=3D""><div class=3D""><blockquote type=3D"cite" style=3D"font-family:=
 Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">#endif =
/* _UAPI_ASM_POWERPC_PERF_REGS_H */<br class=3D"">diff --git =
a/arch/powerpc/perf/perf_regs.c b/arch/powerpc/perf/perf_regs.c<br =
class=3D"">index c8a7e8c..c969935 100644<br class=3D"">--- =
a/arch/powerpc/perf/perf_regs.c<br class=3D"">+++ =
b/arch/powerpc/perf/perf_regs.c<br class=3D"">@@ -81,6 +81,12 @@ static =
u64 get_ext_regs_value(int idx)<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>return =
mfspr(SPRN_MMCR1);<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>case PERF_REG_POWERPC_MMCR2:<br =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>return mfspr(SPRN_MMCR2);<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>case =
PERF_REG_POWERPC_MMCR3:<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>return mfspr(SPRN_MMCR3);<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>case PERF_REG_POWERPC_SIER2:<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>return =
mfspr(SPRN_SIER2);<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>case PERF_REG_POWERPC_SIER3:<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>return mfspr(SPRN_SIER3);<br class=3D""></blockquote><br =
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
display: inline !important;" class=3D"">Indentation is wrong.</span><br =
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
class=3D""><blockquote type=3D"cite" style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>default: =
return 0;<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>}<br class=3D"">}<br class=3D"">@@ =
-89,7 +95,9 @@ u64 perf_reg_value(struct pt_regs *regs, int idx)<br =
class=3D"">{<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>u64 PERF_REG_EXTENDED_MAX;<br =
class=3D""><br class=3D"">-<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>if =
(cpu_has_feature(CPU_FTR_ARCH_300))<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>if =
(cpu_has_feature(CPU_FTR_ARCH_31))<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>PERF_REG_EXTENDED_MAX =3D PERF_REG_POWERPC_SIER3 + 1;<br =
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
class=3D"">There's no way to know if that's correct other than going =
back to the</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">header to =
look at the list of values.</span><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">So instead you should define it in the header, next to the =
other values,</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">with a =
meaningful name, like PERF_REG_MAX_ISA_31 or something.</span><br =
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
class=3D""><blockquote type=3D"cite" style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>else if =
(cpu_has_feature(CPU_FTR_ARCH_300))<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>PERF_REG_EXTENDED_MAX =3D PERF_REG_POWERPC_MMCR2 + 1;<br =
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
class=3D"">Same.</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""></div></blockquote><div><br =
class=3D""></div>Ok, will make this change</div><div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D""><blockquote type=3D"cite" style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>if (idx =
=3D=3D PERF_REG_POWERPC_SIER &amp;&amp;<br class=3D"">diff --git =
a/arch/powerpc/perf/power10-pmu.c b/arch/powerpc/perf/power10-pmu.c<br =
class=3D"">index 07fb919..51082d6 100644<br class=3D"">--- =
a/arch/powerpc/perf/power10-pmu.c<br class=3D"">+++ =
b/arch/powerpc/perf/power10-pmu.c<br class=3D"">@@ -86,6 +86,8 @@<br =
class=3D"">#define POWER10_MMCRA_IFM3<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>0x00000000C0000000UL<br =
class=3D"">#define POWER10_MMCRA_BHRB_MASK<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>0x00000000C0000000UL<br =
class=3D""><br class=3D"">+extern u64 mask_var;<br =
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
class=3D"">Why is it extern? Also not a good name for a =
global.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">Hang on, it's =
not even used? Is there some macro magic somewhere?</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" =
class=3D""></div></blockquote><div><br class=3D""></div>This is defined =
in patch 8 "powerpc/perf: Add support for outputting extended regs in =
perf intr_regs=E2=80=9D,&nbsp;</div><div>which adds the base support for =
extended regs in powerpc. Current patch covers changes to =
support</div><div>It for power10.&nbsp;</div><div><br =
class=3D""></div><div>`mask_var` is used to define =
`PERF_REG_EXTENDED_MASK` at run =
time.&nbsp;</div><div>`PERF_REG_EXTENDED_MASK` basically contains mask =
value of supported extended registers.</div><div>And since supported =
registers may differ between processor versions, we are defining this =
mask at runtime.</div><div><br class=3D""></div><div>The #define is done =
in&nbsp;arch/powerpc/include/asm/perf_event_server.h ( in patch 8 =
).</div><div>In the PMU driver init, we will set the respective mask =
value ( in the below code ). Hence it is extern</div><div><br =
class=3D""></div><div>Sorry for the confusion here.&nbsp;</div><div><br =
class=3D""></div><div>Thanks</div><div>Athira</div><div><div =
class=3D""><br class=3D""></div><blockquote type=3D"cite" class=3D""><div =
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
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">/* =
Table of alternatives, sorted by column 0 */<br class=3D"">static const =
unsigned int power10_event_alternatives[][MAX_ALT] =3D {<br =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>{ PM_RUN_CYC_ALT,<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>PM_RUN_CYC },<br class=3D"">@@ =
-397,6 +399,7 @@ static void power10_config_bhrb(u64 pmu_bhrb_filter)<br =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>.cache_events<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>=3D &amp;power10_cache_events,<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>.attr_groups<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>=3D power10_pmu_attr_groups,<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>.bhrb_nr<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>=3D 32,<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>.capabilities =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=3D =
PERF_PMU_CAP_EXTENDED_REGS,<br class=3D"">};<br class=3D""><br =
class=3D"">int init_power10_pmu(void)<br class=3D"">@@ -408,6 +411,9 @@ =
int init_power10_pmu(void)<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;strcmp(cur_=
cpu_spec-&gt;oprofile_cpu_type, "ppc64/power10"))<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>return =
-ENODEV;<br class=3D""><br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>/* Set the PERF_REG_EXTENDED_MASK =
here */<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>mask_var =3D =
PERF_REG_PMU_MASK_31;<br class=3D"">+<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>rc =3D =
register_power_pmu(&amp;power10_pmu);<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>if =
(rc)<br class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>return rc;<br class=3D""></blockquote><br =
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
display: inline !important;" =
class=3D"">cheers</span></div></blockquote></div><br =
class=3D""></body></html>=

--Apple-Mail=_E1CE319B-073D-42C4-ABFB-1FE9ADFF87D9--

