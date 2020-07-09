Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9B5219FF0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 14:25:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2b3Y3HFdzDr6S
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 22:25:13 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2YLX2lcxzDqTm
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jul 2020 21:08:04 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 069B1bDU182473; Thu, 9 Jul 2020 07:07:58 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 325s3jp7re-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jul 2020 07:07:58 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 069B193K018552;
 Thu, 9 Jul 2020 11:07:57 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 325u410faa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jul 2020 11:07:56 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 069B7sgp6488516
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 Jul 2020 11:07:54 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AA293A4062;
 Thu,  9 Jul 2020 11:07:54 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 44040A4054;
 Thu,  9 Jul 2020 11:07:53 +0000 (GMT)
Received: from [9.85.108.151] (unknown [9.85.108.151])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu,  9 Jul 2020 11:07:53 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Message-Id: <8686D3D2-6AE6-479D-BD7F-36EBFBA0BEEA@linux.vnet.ibm.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_74D9808A-91F2-4E58-9A98-12BDA6ED9102"
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v2 04/10] powerpc/perf: Add power10_feat to dt_cpu_ftrs
Date: Thu, 9 Jul 2020 16:37:50 +0530
In-Reply-To: <87y2nu2r7f.fsf@mpe.ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>
References: <1593595262-1433-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1593595262-1433-5-git-send-email-atrajeev@linux.vnet.ibm.com>
 <87y2nu2r7f.fsf@mpe.ellerman.id.au>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-09_05:2020-07-09,
 2020-07-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 suspectscore=0 malwarescore=0 mlxscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007090084
X-Mailman-Approved-At: Thu, 09 Jul 2020 22:23:07 +1000
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


--Apple-Mail=_74D9808A-91F2-4E58-9A98-12BDA6ED9102
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On 08-Jul-2020, at 4:45 PM, Michael Ellerman <mpe@ellerman.id.au> =
wrote:
>=20
> Athira Rajeev <atrajeev@linux.vnet.ibm.com =
<mailto:atrajeev@linux.vnet.ibm.com>> writes:
>> From: Madhavan Srinivasan <maddy@linux.ibm.com>
>>=20
>> Add power10 feature function to dt_cpu_ftrs.c along
>> with a power10 specific init() to initialize pmu sprs.
>>=20
>> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
>> ---
>> arch/powerpc/include/asm/reg.h        |  3 +++
>> arch/powerpc/kernel/cpu_setup_power.S |  7 +++++++
>> arch/powerpc/kernel/dt_cpu_ftrs.c     | 26 ++++++++++++++++++++++++++
>> 3 files changed, 36 insertions(+)
>>=20
>> diff --git a/arch/powerpc/include/asm/reg.h =
b/arch/powerpc/include/asm/reg.h
>> index 21a1b2d..900ada1 100644
>> --- a/arch/powerpc/include/asm/reg.h
>> +++ b/arch/powerpc/include/asm/reg.h
>> @@ -1068,6 +1068,9 @@
>> #define MMCR0_PMC2_LOADMISSTIME	0x5
>> #endif
>>=20
>> +/* BHRB disable bit for PowerISA v3.10 */
>> +#define MMCRA_BHRB_DISABLE	0x0000002000000000
>> +
>> /*
>>  * SPRG usage:
>>  *
>> diff --git a/arch/powerpc/kernel/cpu_setup_power.S =
b/arch/powerpc/kernel/cpu_setup_power.S
>> index efdcfa7..e8b3370c 100644
>> --- a/arch/powerpc/kernel/cpu_setup_power.S
>> +++ b/arch/powerpc/kernel/cpu_setup_power.S
>> @@ -233,3 +233,10 @@ __init_PMU_ISA207:
>> 	li	r5,0
>> 	mtspr	SPRN_MMCRS,r5
>> 	blr
>> +
>> +__init_PMU_ISA31:
>> +	li	r5,0
>> +	mtspr	SPRN_MMCR3,r5
>> +	LOAD_REG_IMMEDIATE(r5, MMCRA_BHRB_DISABLE)
>> +	mtspr	SPRN_MMCRA,r5
>> +	blr
>=20
> This doesn't seem like it belongs in this patch. It's not called?

Yes, you are right, this needs to be called from `__setup_cpu_power10`.
Since we didn=E2=80=99t had setup part for power10 in the tree =
initially, missed it.
I will include this update in V3=20

Thanks
Athira
>=20
> cheers


--Apple-Mail=_74D9808A-91F2-4E58-9A98-12BDA6ED9102
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 08-Jul-2020, at 4:45 PM, Michael Ellerman &lt;<a =
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
text-decoration: none;" class=3D"">From: Madhavan Srinivasan &lt;<a =
href=3D"mailto:maddy@linux.ibm.com" =
class=3D"">maddy@linux.ibm.com</a>&gt;<br class=3D""><br class=3D"">Add =
power10 feature function to dt_cpu_ftrs.c along<br class=3D"">with a =
power10 specific init() to initialize pmu sprs.<br class=3D""><br =
class=3D"">Signed-off-by: Madhavan Srinivasan &lt;<a =
href=3D"mailto:maddy@linux.ibm.com" =
class=3D"">maddy@linux.ibm.com</a>&gt;<br class=3D"">---<br =
class=3D"">arch/powerpc/include/asm/reg.h =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;3 +++<br =
class=3D"">arch/powerpc/kernel/cpu_setup_power.S | &nbsp;7 +++++++<br =
class=3D"">arch/powerpc/kernel/dt_cpu_ftrs.c &nbsp;&nbsp;&nbsp;&nbsp;| =
26 ++++++++++++++++++++++++++<br class=3D"">3 files changed, 36 =
insertions(+)<br class=3D""><br class=3D"">diff --git =
a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h<br =
class=3D"">index 21a1b2d..900ada1 100644<br class=3D"">--- =
a/arch/powerpc/include/asm/reg.h<br class=3D"">+++ =
b/arch/powerpc/include/asm/reg.h<br class=3D"">@@ -1068,6 +1068,9 @@<br =
class=3D"">#define MMCR0_PMC2_LOADMISSTIME<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>0x5<br class=3D"">#endif<br =
class=3D""><br class=3D"">+/* BHRB disable bit for PowerISA v3.10 */<br =
class=3D"">+#define MMCRA_BHRB_DISABLE<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>0x0000002000000000<br =
class=3D"">+<br class=3D"">/*<br class=3D"">&nbsp;* SPRG usage:<br =
class=3D"">&nbsp;*<br class=3D"">diff --git =
a/arch/powerpc/kernel/cpu_setup_power.S =
b/arch/powerpc/kernel/cpu_setup_power.S<br class=3D"">index =
efdcfa7..e8b3370c 100644<br class=3D"">--- =
a/arch/powerpc/kernel/cpu_setup_power.S<br class=3D"">+++ =
b/arch/powerpc/kernel/cpu_setup_power.S<br class=3D"">@@ -233,3 +233,10 =
@@ __init_PMU_ISA207:<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>li<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>r5,0<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>mtspr<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>SPRN_MMCRS,r5<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>blr<br class=3D"">+<br =
class=3D"">+__init_PMU_ISA31:<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>li<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>r5,0<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>mtspr<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>SPRN_MMCR3,r5<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>LOAD_REG_IMMEDIATE(r5, =
MMCRA_BHRB_DISABLE)<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>mtspr<span class=3D"Apple-tab-span"=
 style=3D"white-space: pre;">	</span>SPRN_MMCRA,r5<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>blr<br =
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
class=3D"">This doesn't seem like it belongs in this patch. It's not =
called?</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""></div></blockquote><div><br class=3D""></div>Yes, you =
are right, this needs to be called from =
`__setup_cpu_power10`.</div><div>Since we didn=E2=80=99t had setup part =
for power10 in the tree initially, missed it.</div><div>I will include =
this update in V3&nbsp;</div><div><br =
class=3D""></div><div>Thanks</div><div>Athira<br class=3D""><blockquote =
type=3D"cite" class=3D""><div class=3D""><br style=3D"caret-color: =
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
class=3D"">cheers</span></div></blockquote></div><br =
class=3D""></body></html>=

--Apple-Mail=_74D9808A-91F2-4E58-9A98-12BDA6ED9102--

