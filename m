Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7FD2204CF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 08:13:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B66WN3J7XzDqgF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 16:13:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B66Np69dxzDqH5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 16:07:22 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06F62YHc180970; Wed, 15 Jul 2020 02:07:16 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32792vujsn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Jul 2020 02:07:16 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06F66OZ5016838;
 Wed, 15 Jul 2020 06:07:13 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06fra.de.ibm.com with ESMTP id 328rbqrvnu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Jul 2020 06:07:13 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06F67BWr47120394
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jul 2020 06:07:11 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 26E9AA4054;
 Wed, 15 Jul 2020 06:07:11 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 88A65A4064;
 Wed, 15 Jul 2020 06:07:09 +0000 (GMT)
Received: from [9.199.43.127] (unknown [9.199.43.127])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 15 Jul 2020 06:07:09 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Message-Id: <4E0264F0-CB51-4225-827C-6732C301DB62@linux.vnet.ibm.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_98EE7963-E375-4EA7-B6B6-6B25CD6432E5"
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v2 01/10] powerpc/perf: Add support for ISA3.1 PMU SPRs
Date: Wed, 15 Jul 2020 11:37:07 +0530
In-Reply-To: <87mu43vate.fsf@mpe.ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>
References: <1593595262-1433-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1593595262-1433-2-git-send-email-atrajeev@linux.vnet.ibm.com>
 <874kqi46cg.fsf@mpe.ellerman.id.au>
 <DF000FF6-EF09-4299-A4AD-EF76277A6EF4@linux.vnet.ibm.com>
 <87mu43vate.fsf@mpe.ellerman.id.au>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-15_02:2020-07-15,
 2020-07-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007150047
X-Mailman-Approved-At: Wed, 15 Jul 2020 16:11:41 +1000
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


--Apple-Mail=_98EE7963-E375-4EA7-B6B6-6B25CD6432E5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> On 13-Jul-2020, at 6:20 PM, Michael Ellerman <mpe@ellerman.id.au> =
wrote:
>=20
> Athira Rajeev <atrajeev@linux.vnet.ibm.com =
<mailto:atrajeev@linux.vnet.ibm.com>> writes:
>>> On 08-Jul-2020, at 4:32 PM, Michael Ellerman <mpe@ellerman.id.au> =
wrote:
>>>=20
>>> Athira Rajeev <atrajeev@linux.vnet.ibm.com> writes:
>>> ...
>>>> diff --git a/arch/powerpc/perf/core-book3s.c =
b/arch/powerpc/perf/core-book3s.c
>>>> index cd6a742..5c64bd3 100644
>>>> --- a/arch/powerpc/perf/core-book3s.c
>>>> +++ b/arch/powerpc/perf/core-book3s.c
>>>> @@ -39,10 +39,10 @@ struct cpu_hw_events {
>>>> 	unsigned int flags[MAX_HWEVENTS];
>>>> 	/*
>>>> 	 * The order of the MMCR array is:
>>>> -	 *  - 64-bit, MMCR0, MMCR1, MMCRA, MMCR2
>>>> +	 *  - 64-bit, MMCR0, MMCR1, MMCRA, MMCR2, MMCR3
>>>> 	 *  - 32-bit, MMCR0, MMCR1, MMCR2
>>>> 	 */
>>>> -	unsigned long mmcr[4];
>>>> +	unsigned long mmcr[5];
>>>> 	struct perf_event *limited_counter[MAX_LIMITED_HWCOUNTERS];
>>>> 	u8  limited_hwidx[MAX_LIMITED_HWCOUNTERS];
>>>> 	u64 alternatives[MAX_HWEVENTS][MAX_EVENT_ALTERNATIVES];
>>> ...
>>>> @@ -1310,6 +1326,10 @@ static void power_pmu_enable(struct pmu =
*pmu)
>>>> 	if (!cpuhw->n_added) {
>>>> 		mtspr(SPRN_MMCRA, cpuhw->mmcr[2] & =
~MMCRA_SAMPLE_ENABLE);
>>>> 		mtspr(SPRN_MMCR1, cpuhw->mmcr[1]);
>>>> +#ifdef CONFIG_PPC64
>>>> +		if (ppmu->flags & PPMU_ARCH_310S)
>>>> +			mtspr(SPRN_MMCR3, cpuhw->mmcr[4]);
>>>> +#endif /* CONFIG_PPC64 */
>>>> 		goto out_enable;
>>>> 	}
>>>>=20
>>>> @@ -1353,6 +1373,11 @@ static void power_pmu_enable(struct pmu =
*pmu)
>>>> 	if (ppmu->flags & PPMU_ARCH_207S)
>>>> 		mtspr(SPRN_MMCR2, cpuhw->mmcr[3]);
>>>>=20
>>>> +#ifdef CONFIG_PPC64
>>>> +	if (ppmu->flags & PPMU_ARCH_310S)
>>>> +		mtspr(SPRN_MMCR3, cpuhw->mmcr[4]);
>>>> +#endif /* CONFIG_PPC64 */
>>>=20
>>> I don't think you need the #ifdef CONFIG_PPC64?
>>=20
>> Hi Michael
>>=20
>> Thanks for reviewing this series.
>>=20
>> SPRN_MMCR3 is not defined for PPC32 and we hit build failure for =
pmac32_defconfig.
>> The #ifdef CONFIG_PPC64 is to address this.
>=20
> We like to avoid #ifdefs in the body of the code like that.
>=20
> There's a bunch of existing #defines near the top of the file to make
> 32-bit work, I think you should just add another for this, so eg:
>=20
> #ifdef CONFIG_PPC32
> ...
> #define SPRN_MMCR3	0

Ok Ok. Found that currently we do same way as you mentioned for MMCRA =
which is not supported for 32-bit
I will work on this change

Thanks
Athira=20
>=20
> cheers


--Apple-Mail=_98EE7963-E375-4EA7-B6B6-6B25CD6432E5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 13-Jul-2020, at 6:20 PM, Michael Ellerman &lt;<a =
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
text-decoration: none;" class=3D""><blockquote type=3D"cite" class=3D"">On=
 08-Jul-2020, at 4:32 PM, Michael Ellerman &lt;<a =
href=3D"mailto:mpe@ellerman.id.au" class=3D"">mpe@ellerman.id.au</a>&gt; =
wrote:<br class=3D""><br class=3D"">Athira Rajeev &lt;<a =
href=3D"mailto:atrajeev@linux.vnet.ibm.com" =
class=3D"">atrajeev@linux.vnet.ibm.com</a>&gt; writes:<br =
class=3D"">...<br class=3D""><blockquote type=3D"cite" class=3D"">diff =
--git a/arch/powerpc/perf/core-book3s.c =
b/arch/powerpc/perf/core-book3s.c<br class=3D"">index cd6a742..5c64bd3 =
100644<br class=3D"">--- a/arch/powerpc/perf/core-book3s.c<br =
class=3D"">+++ b/arch/powerpc/perf/core-book3s.c<br class=3D"">@@ -39,10 =
+39,10 @@ struct cpu_hw_events {<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>unsigned =
int flags[MAX_HWEVENTS];<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>/*<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>* The order of the MMCR =
array is:<br class=3D"">-<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>* &nbsp;- 64-bit, MMCR0, =
MMCR1, MMCRA, MMCR2<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>* &nbsp;- 64-bit, MMCR0, =
MMCR1, MMCRA, MMCR2, MMCR3<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>* &nbsp;- 32-bit, MMCR0, =
MMCR1, MMCR2<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>*/<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>unsigned =
long mmcr[4];<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>unsigned long mmcr[5];<br =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>struct perf_event *limited_counter[MAX_LIMITED_HWCOUNTERS];<br =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>u8 &nbsp;limited_hwidx[MAX_LIMITED_HWCOUNTERS];<br class=3D""><span=
 class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>u64 =
alternatives[MAX_HWEVENTS][MAX_EVENT_ALTERNATIVES];<br =
class=3D""></blockquote>...<br class=3D""><blockquote type=3D"cite" =
class=3D"">@@ -1310,6 +1326,10 @@ static void power_pmu_enable(struct =
pmu *pmu)<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>if (!cpuhw-&gt;n_added) {<br =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>mtspr(SPRN_MMCRA, cpuhw-&gt;mmcr[2] &amp; =
~MMCRA_SAMPLE_ENABLE);<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>mtspr(SPRN_MMCR1, =
cpuhw-&gt;mmcr[1]);<br class=3D"">+#ifdef CONFIG_PPC64<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>if (ppmu-&gt;flags &amp; PPMU_ARCH_310S)<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>mtspr(SPRN_MMCR3, cpuhw-&gt;mmcr[4]);<br class=3D"">+#endif /* =
CONFIG_PPC64 */<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>goto out_enable;<br =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>}<br class=3D""><br class=3D"">@@ -1353,6 +1373,11 @@ static void =
power_pmu_enable(struct pmu *pmu)<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>if =
(ppmu-&gt;flags &amp; PPMU_ARCH_207S)<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>mtspr(SPRN_MMCR2, cpuhw-&gt;mmcr[3]);<br class=3D""><br =
class=3D"">+#ifdef CONFIG_PPC64<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>if =
(ppmu-&gt;flags &amp; PPMU_ARCH_310S)<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>mtspr(SPRN_MMCR3, cpuhw-&gt;mmcr[4]);<br class=3D"">+#endif /* =
CONFIG_PPC64 */<br class=3D""></blockquote><br class=3D"">I don't think =
you need the #ifdef CONFIG_PPC64?<br class=3D""></blockquote><br =
class=3D"">Hi Michael<br class=3D""><br class=3D"">Thanks for reviewing =
this series.<br class=3D""><br class=3D"">SPRN_MMCR3 is not defined for =
PPC32 and we hit build failure for pmac32_defconfig.<br class=3D"">The =
#ifdef CONFIG_PPC64 is to address this.<br class=3D""></blockquote><br =
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
display: inline !important;" class=3D"">We like to avoid #ifdefs in the =
body of the code like that.</span><br style=3D"caret-color: rgb(0, 0, =
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
class=3D"">There's a bunch of existing #defines near the top of the file =
to make</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">32-bit work, =
I think you should just add another for this, so eg:</span><br =
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
display: inline !important;" class=3D"">#ifdef CONFIG_PPC32</span><br =
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
display: inline !important;" class=3D"">...</span><br =
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
display: inline !important;" class=3D"">#define SPRN_MMCR3</span><span =
class=3D"Apple-tab-span" style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
pre; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;">	</span><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">0</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" =
class=3D""></div></blockquote><div><br class=3D""></div>Ok Ok. Found =
that currently we do same way as you mentioned for MMCRA which is not =
supported for 32-bit</div><div>I will work on this change</div><div><br =
class=3D""></div><div>Thanks</div><div>Athira&nbsp;<br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D""><br =
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

--Apple-Mail=_98EE7963-E375-4EA7-B6B6-6B25CD6432E5--

