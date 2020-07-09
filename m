Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97262219726
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 06:19:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2NHH4j3dzDqxh
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 14:19:39 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2K7r37MVzDqQr
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jul 2020 11:58:00 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0691VkIV048682; Wed, 8 Jul 2020 21:57:55 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 325p3hd64p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jul 2020 21:57:54 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0691pSdQ032184;
 Thu, 9 Jul 2020 01:57:52 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03fra.de.ibm.com with ESMTP id 325k2c05hp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jul 2020 01:57:52 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0691voit34013324
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 Jul 2020 01:57:50 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5676D4C040;
 Thu,  9 Jul 2020 01:57:50 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C77EE4C050;
 Thu,  9 Jul 2020 01:57:48 +0000 (GMT)
Received: from [9.79.221.246] (unknown [9.79.221.246])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu,  9 Jul 2020 01:57:48 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Message-Id: <A468034D-B752-4E17-BA10-2C097E913969@linux.vnet.ibm.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_1EA5615B-8587-46E7-BA9C-59BA83958178"
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v2 03/10] powerpc/xmon: Add PowerISA v3.1 PMU SPRs
Date: Thu, 9 Jul 2020 07:27:46 +0530
In-Reply-To: <871rlm469d.fsf@mpe.ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>
References: <1593595262-1433-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1593595262-1433-4-git-send-email-atrajeev@linux.vnet.ibm.com>
 <871rlm469d.fsf@mpe.ellerman.id.au>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-08_19:2020-07-08,
 2020-07-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0
 spamscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015 mlxlogscore=999
 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007090005
X-Mailman-Approved-At: Thu, 09 Jul 2020 14:05:25 +1000
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


--Apple-Mail=_1EA5615B-8587-46E7-BA9C-59BA83958178
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> On 08-Jul-2020, at 4:34 PM, Michael Ellerman <mpe@ellerman.id.au> =
wrote:
>=20
> Athira Rajeev <atrajeev@linux.vnet.ibm.com =
<mailto:atrajeev@linux.vnet.ibm.com>> writes:
>> From: Madhavan Srinivasan <maddy@linux.ibm.com>
>>=20
>> PowerISA v3.1 added three new perfromance
>> monitoring unit (PMU) speical purpose register (SPR).
>> They are Monitor Mode Control Register 3 (MMCR3),
>> Sampled Instruction Event Register 2 (SIER2),
>> Sampled Instruction Event Register 3 (SIER3).
>>=20
>> Patch here adds a new dump function dump_310_sprs
>> to print these SPR values.
>>=20
>> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
>> ---
>> arch/powerpc/xmon/xmon.c | 15 +++++++++++++++
>> 1 file changed, 15 insertions(+)
>>=20
>> diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
>> index 7efe4bc..8917fe8 100644
>> --- a/arch/powerpc/xmon/xmon.c
>> +++ b/arch/powerpc/xmon/xmon.c
>> @@ -2022,6 +2022,20 @@ static void dump_300_sprs(void)
>> #endif
>> }
>>=20
>> +static void dump_310_sprs(void)
>> +{
>> +#ifdef CONFIG_PPC64
>> +	if (!cpu_has_feature(CPU_FTR_ARCH_31))
>> +		return;
>> +
>> +	printf("mmcr3  =3D %.16lx\n",
>> +		mfspr(SPRN_MMCR3));
>> +
>> +	printf("sier2  =3D %.16lx  sier3  =3D %.16lx\n",
>> +		mfspr(SPRN_SIER2), mfspr(SPRN_SIER3));
>=20
> Why not all on one line like many of the others?

Sure, will change this to one line

Thanks
Athira
>=20
> cheers


--Apple-Mail=_1EA5615B-8587-46E7-BA9C-59BA83958178
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 08-Jul-2020, at 4:34 PM, Michael Ellerman &lt;<a =
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
class=3D"">maddy@linux.ibm.com</a>&gt;<br class=3D""><br =
class=3D"">PowerISA v3.1 added three new perfromance<br =
class=3D"">monitoring unit (PMU) speical purpose register (SPR).<br =
class=3D"">They are Monitor Mode Control Register 3 (MMCR3),<br =
class=3D"">Sampled Instruction Event Register 2 (SIER2),<br =
class=3D"">Sampled Instruction Event Register 3 (SIER3).<br class=3D""><br=
 class=3D"">Patch here adds a new dump function dump_310_sprs<br =
class=3D"">to print these SPR values.<br class=3D""><br =
class=3D"">Signed-off-by: Madhavan Srinivasan &lt;<a =
href=3D"mailto:maddy@linux.ibm.com" =
class=3D"">maddy@linux.ibm.com</a>&gt;<br class=3D"">---<br =
class=3D"">arch/powerpc/xmon/xmon.c | 15 +++++++++++++++<br class=3D"">1 =
file changed, 15 insertions(+)<br class=3D""><br class=3D"">diff --git =
a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c<br class=3D"">index =
7efe4bc..8917fe8 100644<br class=3D"">--- a/arch/powerpc/xmon/xmon.c<br =
class=3D"">+++ b/arch/powerpc/xmon/xmon.c<br class=3D"">@@ -2022,6 =
+2022,20 @@ static void dump_300_sprs(void)<br class=3D"">#endif<br =
class=3D"">}<br class=3D""><br class=3D"">+static void =
dump_310_sprs(void)<br class=3D"">+{<br class=3D"">+#ifdef =
CONFIG_PPC64<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>if =
(!cpu_has_feature(CPU_FTR_ARCH_31))<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>return;<br class=3D"">+<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>printf("mmcr3 &nbsp;=3D %.16lx\n",<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>mfspr(SPRN_MMCR3));<br class=3D"">+<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>printf("sier2 &nbsp;=3D %.16lx &nbsp;sier3 &nbsp;=3D =
%.16lx\n",<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>mfspr(SPRN_SIER2), =
mfspr(SPRN_SIER3));<br class=3D""></blockquote><br style=3D"caret-color: =
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
class=3D"">Why not all on one line like many of the others?</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" =
class=3D""></div></blockquote><div><br class=3D""></div>Sure, will =
change this to one line</div><div><br =
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

--Apple-Mail=_1EA5615B-8587-46E7-BA9C-59BA83958178--

