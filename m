Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B0622050A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 08:34:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B670L10TVzDqhl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 16:34:42 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B66XV3rskzDqB4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 16:14:02 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06F62Xlx180960; Wed, 15 Jul 2020 02:13:58 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32792vur54-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Jul 2020 02:13:57 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06F5tLDc013959;
 Wed, 15 Jul 2020 06:13:55 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 3274pguyr0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Jul 2020 06:13:55 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 06F6CUNX45416752
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jul 2020 06:12:30 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 33C1BA4062;
 Wed, 15 Jul 2020 06:13:53 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5685CA4060;
 Wed, 15 Jul 2020 06:13:51 +0000 (GMT)
Received: from [9.199.43.127] (unknown [9.199.43.127])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 15 Jul 2020 06:13:51 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Message-Id: <6532DAAD-A7FE-4896-BE7E-EA6EFF55C03B@linux.vnet.ibm.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_432859EF-2D0F-4633-A837-AD559A6E46AD"
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v3] powerpc/perf: Use SIER_USER_MASK while updating
 SPRN_SIER for EBB events
Date: Wed, 15 Jul 2020 11:43:48 +0530
In-Reply-To: <87ft9uvdad.fsf@mpe.ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>
References: <1584533181-4331-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <87r1xod3c3.fsf@mpe.ellerman.id.au>
 <8C50DF8B-1CBB-4365-B068-C8DA5B7D1148@linux.vnet.ibm.com>
 <87ft9uvdad.fsf@mpe.ellerman.id.au>
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
X-Mailman-Approved-At: Wed, 15 Jul 2020 16:33:01 +1000
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
Cc: maddy@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_432859EF-2D0F-4633-A837-AD559A6E46AD
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> On 14-Jul-2020, at 11:38 AM, Michael Ellerman <mpe@ellerman.id.au> =
wrote:
>=20
> Athira Rajeev <atrajeev@linux.vnet.ibm.com =
<mailto:atrajeev@linux.vnet.ibm.com>> writes:
>>> On 19-Mar-2020, at 4:22 PM, Michael Ellerman <mpe@ellerman.id.au> =
wrote:
>>>=20
>>> Hi Athira,
>>>=20
>>> Athira Rajeev <atrajeev@linux.vnet.ibm.com> writes:
>>>> Sampled Instruction Event Register (SIER), is a PMU register,
>>>                                                              ^
>>>                                                              that
>>>> captures architecture state for a given sample. And sier_user_mask
>>>          ^                                          ^
>>>          don't think we need "architecture"         SIER_USER_MASK
>>>=20
>>>> defined in commit 330a1eb7775b ("powerpc/perf: Core EBB support for =
64-bit
>>>> book3s") defines the architected bits that needs to be saved from =
the SPR.
>>>=20
>>> Not quite, it defines the bits that are visible to userspace.
>>>=20
>>> And I think it's true that for EBB events the bits we need/want to =
save
>>> are only the user visible bits.
>>>=20
>>>> Currently all of the bits from SIER are saved for EBB events. Patch =
fixes
>>>> this by ANDing the "sier_user_mask" to data from SIER in =
ebb_switch_out().
>>>> This will force save only architected bits from the SIER.
>>>=20
>>> s/architected/user visible/
>>>=20
>>>=20
>>> But, why does it matter? The kernel saves the user visible bits, as =
well
>>> as the kernel-only bits into the thread struct. And then later the
>>> kernel restores that value into the hardware before returning to
>>> userspace.
>>>=20
>>> But the hardware enforces the visibility of the bits, so userspace =
can't
>>> observe any bits that it shouldn't.
>>>=20
>>> Or is there some other mechanism whereby userspace can see those =
bits? ;)
>>>=20
>>> If there was, what would the security implications of that be?
>>=20
>> Hi Michael,
>>=20
>> Thanks for your comments.=20
>>=20
>> In ebb_switch_in, we set PMCC bit [MMCR0 44:45 ] to 10 which means
>> SIER ( Group B ) register is readable in problem state. Hence the
>> intention of the patch was to make sure we are not exposing the bits
>> which the userspace shouldn't be reading.
>>=20
>> But following your comment about "hardware enforcing the visibility =
of
>> bits", I did try an "ebb" experiment which showed that reading
>> SPRN_SIER didn't expose any bits other than the user visible bits.
>> Sorry for the confusion here.
>=20
> That's OK. Thanks for following my trail of clues :)
>=20

Sure, Thanks for your inputs. I will come back on this after checking on =
information exposed via Ptrace

>> In that case, Can we drop the existing definition of SIER_USER_MASK =
if
>> it is no more needed ?
>=20
> I think it is still needed, and I think this change to use it is good, =
because
> SIER is visible via ptrace.
>=20
> What we need to do, is look at what information in SIER we are =
currently
> exposing to userspace via ptrace, and what the security implications =
(if
> any) of that are.
>=20
> cheers


--Apple-Mail=_432859EF-2D0F-4633-A837-AD559A6E46AD
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 14-Jul-2020, at 11:38 AM, Michael Ellerman &lt;<a =
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
 19-Mar-2020, at 4:22 PM, Michael Ellerman &lt;<a =
href=3D"mailto:mpe@ellerman.id.au" class=3D"">mpe@ellerman.id.au</a>&gt; =
wrote:<br class=3D""><br class=3D"">Hi Athira,<br class=3D""><br =
class=3D"">Athira Rajeev &lt;<a =
href=3D"mailto:atrajeev@linux.vnet.ibm.com" =
class=3D"">atrajeev@linux.vnet.ibm.com</a>&gt; writes:<br =
class=3D""><blockquote type=3D"cite" class=3D"">Sampled Instruction =
Event Register (SIER), is a PMU register,<br =
class=3D""></blockquote>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;^<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;that<br class=3D""><blockquote type=3D"cite" class=3D"">captures =
architecture state for a given sample. And sier_user_mask<br =
class=3D""></blockquote>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;^ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;^<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;don't =
think we need "architecture" =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SIER_USER_MASK<br =
class=3D""><br class=3D""><blockquote type=3D"cite" class=3D"">defined =
in commit 330a1eb7775b ("powerpc/perf: Core EBB support for 64-bit<br =
class=3D"">book3s") defines the architected bits that needs to be saved =
from the SPR.<br class=3D""></blockquote><br class=3D"">Not quite, it =
defines the bits that are visible to userspace.<br class=3D""><br =
class=3D"">And I think it's true that for EBB events the bits we =
need/want to save<br class=3D"">are only the user visible bits.<br =
class=3D""><br class=3D""><blockquote type=3D"cite" class=3D"">Currently =
all of the bits from SIER are saved for EBB events. Patch fixes<br =
class=3D"">this by ANDing the "sier_user_mask" to data from SIER in =
ebb_switch_out().<br class=3D"">This will force save only architected =
bits from the SIER.<br class=3D""></blockquote><br =
class=3D"">s/architected/user visible/<br class=3D""><br class=3D""><br =
class=3D"">But, why does it matter? The kernel saves the user visible =
bits, as well<br class=3D"">as the kernel-only bits into the thread =
struct. And then later the<br class=3D"">kernel restores that value into =
the hardware before returning to<br class=3D"">userspace.<br =
class=3D""><br class=3D"">But the hardware enforces the visibility of =
the bits, so userspace can't<br class=3D"">observe any bits that it =
shouldn't.<br class=3D""><br class=3D"">Or is there some other mechanism =
whereby userspace can see those bits? ;)<br class=3D""><br class=3D"">If =
there was, what would the security implications of that be?<br =
class=3D""></blockquote><br class=3D"">Hi Michael,<br class=3D""><br =
class=3D"">Thanks for your comments.<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D""><br =
class=3D"">In ebb_switch_in, we set PMCC bit [MMCR0 44:45 ] to 10 which =
means<br class=3D"">SIER ( Group B ) register is readable in problem =
state. Hence the<br class=3D"">intention of the patch was to make sure =
we are not exposing the bits<br class=3D"">which the userspace shouldn't =
be reading.<br class=3D""><br class=3D"">But following your comment =
about "hardware enforcing the visibility of<br class=3D"">bits", I did =
try an "ebb" experiment which showed that reading<br class=3D"">SPRN_SIER =
didn't expose any bits other than the user visible bits.<br =
class=3D"">Sorry for the confusion here.<br class=3D""></blockquote><br =
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
display: inline !important;" class=3D"">That's OK. Thanks for following =
my trail of clues :)</span><br style=3D"caret-color: rgb(0, 0, 0); =
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
class=3D""></div>Sure, Thanks for your inputs. I will come back on this =
after checking on information exposed via Ptrace</div><div><br =
class=3D""></div><div><blockquote type=3D"cite" class=3D""><div =
class=3D""><blockquote type=3D"cite" style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">In =
that case, Can we drop the existing definition of SIER_USER_MASK if<br =
class=3D"">it is no more needed ?<br class=3D""></blockquote><br =
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
display: inline !important;" class=3D"">I think it is still needed, and =
I think this change to use it is good, because</span><br =
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
display: inline !important;" class=3D"">SIER is visible via =
ptrace.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
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
none; float: none; display: inline !important;" class=3D"">What we need =
to do, is look at what information in SIER we are currently</span><br =
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
display: inline !important;" class=3D"">exposing to userspace via =
ptrace, and what the security implications (if</span><br =
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
display: inline !important;" class=3D"">any) of that are.</span><br =
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

--Apple-Mail=_432859EF-2D0F-4633-A837-AD559A6E46AD--

