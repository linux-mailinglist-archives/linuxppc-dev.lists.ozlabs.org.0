Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4595BE458
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 13:25:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWzjh3kwsz3blf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 21:25:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=COSNHmta;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=COSNHmta;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWq2w0q3Yz303t
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 14:54:31 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28K4Vja1007888
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 04:54:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : message-id :
 content-type : mime-version : subject : date : in-reply-to : cc : to :
 references; s=pp1; bh=6t24vvLTaOAUyuE1k2zkPEdpcphq3/ENbLx+D8jXwyQ=;
 b=COSNHmtajc/z59a0ldn7yrgcoeVBW7+RkG0qiVr8xmoLc1zDUdOBxPJjUtZ9BAhhku0I
 9TvZIdJJiFjTJcnK4APvlpNFwhs8jx4Az2Kzb4wyhV6cgixQeihRuiDkgnTM7Z5Y7Vf/
 vKX19P0+GLzoqnbx1qGVRDDZ5gJTEOx4zGXubK3jA6aGExxOZx+mAiuSMEzJe6GaLd9E
 +AufS05IJ6aRqNAOBicahbX508qHaU28urouENuVwZAYfGZRwiQ2XuCSsbkCQmDCjdHG
 SL5vrZYunSS9fOiwflsK0r08L9ISTzMo8Uy5LqCOTGvYVc2fdfd18FYLZlwSmoWmLTF8 3g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jq6ju0g9x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 04:54:28 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28K4Wnfe010194
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 04:54:28 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jq6ju0g9n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Sep 2022 04:54:28 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28K4pWiB002647;
	Tue, 20 Sep 2022 04:54:26 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma06fra.de.ibm.com with ESMTP id 3jn5ghjenq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Sep 2022 04:54:26 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28K4sONK32440760
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 Sep 2022 04:54:24 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0B11A4C044;
	Tue, 20 Sep 2022 04:54:24 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 57D904C040;
	Tue, 20 Sep 2022 04:54:23 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 20 Sep 2022 04:54:23 +0000 (GMT)
Received: from smtpclient.apple (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id D2DDD600EE;
	Tue, 20 Sep 2022 14:54:19 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
Message-Id: <2F4E472D-A70E-470A-A9A0-2AC24FDCE9CE@linux.ibm.com>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_417FD6F6-2C1F-402A-BC3A-75E9B48B0F9B"
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH 20/23] powerpc/64s: Clear/restore caller gprs in syscall
 interrupt/return
Date: Tue, 20 Sep 2022 14:54:19 +1000
In-Reply-To: <CN0UYA40KPVY.V7SYHTJAP9KO@bobo>
To: Nicholas Piggin <npiggin@gmail.com>
References: <20220916053300.786330-1-rmclure@linux.ibm.com>
 <20220916053300.786330-21-rmclure@linux.ibm.com>
 <CN0UYA40KPVY.V7SYHTJAP9KO@bobo>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: dKcW0Pwovp7xzCcJ7e13XJq7nlWa1bgL
X-Proofpoint-GUID: t3FLPSayhaYaYe4t1yiJMF9-F1VI6Q7g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-19_13,2022-09-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 impostorscore=0 phishscore=0
 mlxscore=0 malwarescore=0 adultscore=0 priorityscore=1501 mlxlogscore=999
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209200026
X-Mailman-Approved-At: Tue, 20 Sep 2022 21:24:41 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_417FD6F6-2C1F-402A-BC3A-75E9B48B0F9B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On 20 Sep 2022, at 12:03 pm, Nicholas Piggin <npiggin@gmail.com> =
wrote:
>=20
> On Fri Sep 16, 2022 at 3:32 PM AEST, Rohan McLure wrote:
>> Clear user state in gprs (assign to zero) to reduce the influence of =
user
>> registers on speculation within kernel syscall handlers. Clears occur
>> at the very beginning of the sc and scv 0 interrupt handlers, with
>> restores occurring following the execution of the syscall handler.
>>=20
>> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
>> ---
>> V1 -> V2: Update summary
>> V2 -> V3: Remove erroneous summary paragraph on syscall_exit_prepare
>> V3 -> V4: Use ZEROIZE instead of NULLIFY. Clear r0 also.
>> V4 -> V5: Move to end of patch series.
>> ---
>=20
> I think it looks okay. I'll have to take a better look with the series
> applied.


Your comments alerted me to the fact that general interrupt and syscalls
share their exit code in interrupt_return and its derivatives. Meaning
that disabling INTERRUPT_SANITIZE_REGISTERS also reverts restores of =
NVGPRS
to being optional, which makes it possible to clobber NVGPRS and then =
not
restore them. The cleanest way forward I belive is going to be to cause
INTERRUPT_SANITIZE_REGISTERS to perform sanitisation on all interrupt =
sources
rather than continuing with syscalls as their own special case. I=E2=80=99=
ll put
this out in a v6 soon.

>=20
>> arch/powerpc/kernel/interrupt_64.S | 9 ++++++---
>> 1 file changed, 6 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/arch/powerpc/kernel/interrupt_64.S =
b/arch/powerpc/kernel/interrupt_64.S
>> index 16a1b44088e7..40147558e1a6 100644
>> --- a/arch/powerpc/kernel/interrupt_64.S
>> +++ b/arch/powerpc/kernel/interrupt_64.S
>> @@ -70,7 +70,7 @@ _ASM_NOKPROBE_SYMBOL(system_call_vectored_\name)
>> 	ld	r2,PACATOC(r13)
>> 	mfcr	r12
>> 	li	r11,0
>> -	/* Can we avoid saving r3-r8 in common case? */
>> +	/* Save syscall parameters in r3-r8 */
>=20
> These two comment changes could go in your system_call_exception API
> change patch though.
>=20
> Thanks,
> Nick
>=20
>> 	SAVE_GPRS(3, 8, r1)
>> 	/* Zero r9-r12, this should only be required when restoring all =
GPRs */
>> 	std	r11,GPR9(r1)
>> @@ -110,6 +110,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>> 	 * Zero user registers to prevent influencing speculative =
execution
>> 	 * state of kernel code.
>> 	 */
>> +	ZEROIZE_GPR(0)
>> 	ZEROIZE_GPRS(5, 12)
>> 	ZEROIZE_NVGPRS()
>> 	bl	system_call_exception
>> @@ -140,6 +141,7 @@ BEGIN_FTR_SECTION
>> 	HMT_MEDIUM_LOW
>> END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>>=20
>> +	REST_NVGPRS(r1)
>> 	cmpdi	r3,0
>> 	bne	.Lsyscall_vectored_\name\()_restore_regs
>>=20
>> @@ -243,7 +245,7 @@ END_BTB_FLUSH_SECTION
>> 	ld	r2,PACATOC(r13)
>> 	mfcr	r12
>> 	li	r11,0
>> -	/* Can we avoid saving r3-r8 in common case? */
>> +	/* Save syscall parameters in r3-r8 */
>> 	SAVE_GPRS(3, 8, r1)
>> 	/* Zero r9-r12, this should only be required when restoring all =
GPRs */
>> 	std	r11,GPR9(r1)
>> @@ -295,6 +297,7 @@ END_BTB_FLUSH_SECTION
>> 	 * Zero user registers to prevent influencing speculative =
execution
>> 	 * state of kernel code.
>> 	 */
>> +	ZEROIZE_GPR(0)
>> 	ZEROIZE_GPRS(5, 12)
>> 	ZEROIZE_NVGPRS()
>> 	bl	system_call_exception
>> @@ -337,6 +340,7 @@ BEGIN_FTR_SECTION
>> 	stdcx.	r0,0,r1			/* to clear the reservation */
>> END_FTR_SECTION_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
>>=20
>> +	REST_NVGPRS(r1)
>> 	cmpdi	r3,0
>> 	bne	.Lsyscall_restore_regs
>> 	/* Zero volatile regs that may contain sensitive kernel data */
>> @@ -364,7 +368,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>> .Lsyscall_restore_regs:
>> 	ld	r3,_CTR(r1)
>> 	ld	r4,_XER(r1)
>> -	REST_NVGPRS(r1)
>> 	mtctr	r3
>> 	mtspr	SPRN_XER,r4
>> 	REST_GPR(0, r1)
>> --=20
>> 2.34.1


--Apple-Mail=_417FD6F6-2C1F-402A-BC3A-75E9B48B0F9B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 20 Sep 2022, at 12:03 pm, Nicholas Piggin &lt;<a =
href=3D"mailto:npiggin@gmail.com" class=3D"">npiggin@gmail.com</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><meta =
charset=3D"UTF-8" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: IBMPlexMono; font-size: 16px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">On Fri Sep 16, 2022 at 3:32 PM AEST, Rohan McLure =
wrote:</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
IBMPlexMono; font-size: 16px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><blockquote type=3D"cite" style=3D"font-family: =
IBMPlexMono; font-size: 16px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">Clear =
user state in gprs (assign to zero) to reduce the influence of user<br =
class=3D"">registers on speculation within kernel syscall handlers. =
Clears occur<br class=3D"">at the very beginning of the sc and scv 0 =
interrupt handlers, with<br class=3D"">restores occurring following the =
execution of the syscall handler.<br class=3D""><br =
class=3D"">Signed-off-by: Rohan McLure &lt;<a =
href=3D"mailto:rmclure@linux.ibm.com" =
class=3D"">rmclure@linux.ibm.com</a>&gt;<br class=3D"">---<br =
class=3D"">V1 -&gt; V2: Update summary<br class=3D"">V2 -&gt; V3: Remove =
erroneous summary paragraph on syscall_exit_prepare<br class=3D"">V3 =
-&gt; V4: Use ZEROIZE instead of NULLIFY. Clear r0 also.<br class=3D"">V4 =
-&gt; V5: Move to end of patch series.<br class=3D"">---<br =
class=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: IBMPlexMono; font-size: 16px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: IBMPlexMono; font-size: 16px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">I think it looks okay. I'll have to take a better look with =
the series</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
IBMPlexMono; font-size: 16px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
IBMPlexMono; font-size: 16px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" =
class=3D"">applied.</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: IBMPlexMono; font-size: 16px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""></div></blockquote><div><br =
class=3D""></div><div><br class=3D""></div><div><div style=3D"caret-color:=
 rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: monospace; font-size: =
16px;" class=3D"">Your comments alerted me to the fact that general =
interrupt and syscalls</div><div style=3D"caret-color: rgb(0, 0, 0); =
color: rgb(0, 0, 0); font-family: monospace; font-size: 16px;" =
class=3D"">share their exit code in interrupt_return and its =
derivatives. Meaning</div><div style=3D"caret-color: rgb(0, 0, 0); =
color: rgb(0, 0, 0); font-family: monospace; font-size: 16px;" =
class=3D"">that disabling INTERRUPT_SANITIZE_REGISTERS also reverts =
restores of NVGPRS</div><div style=3D"caret-color: rgb(0, 0, 0); color: =
rgb(0, 0, 0); font-family: monospace; font-size: 16px;" class=3D"">to =
being optional, which makes it possible to clobber NVGPRS and then =
not</div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); =
font-family: monospace; font-size: 16px;" class=3D"">restore them. The =
cleanest way forward I belive is going to be to cause</div><div =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: =
monospace; font-size: 16px;" class=3D"">INTERRUPT_SANITIZE_REGISTERS to =
perform sanitisation on all interrupt sources</div><div =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: =
monospace; font-size: 16px;" class=3D"">rather than continuing with =
syscalls as their own special case. I=E2=80=99ll put</div><div =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: =
monospace; font-size: 16px;" class=3D"">this out in a v6 =
soon.</div></div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
IBMPlexMono; font-size: 16px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><blockquote type=3D"cite" style=3D"font-family: =
IBMPlexMono; font-size: 16px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" =
class=3D"">arch/powerpc/kernel/interrupt_64.S | 9 ++++++---<br =
class=3D"">1 file changed, 6 insertions(+), 3 deletions(-)<br =
class=3D""><br class=3D"">diff --git =
a/arch/powerpc/kernel/interrupt_64.S =
b/arch/powerpc/kernel/interrupt_64.S<br class=3D"">index =
16a1b44088e7..40147558e1a6 100644<br class=3D"">--- =
a/arch/powerpc/kernel/interrupt_64.S<br class=3D"">+++ =
b/arch/powerpc/kernel/interrupt_64.S<br class=3D"">@@ -70,7 +70,7 @@ =
_ASM_NOKPROBE_SYMBOL(system_call_vectored_\name)<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>ld<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>r2,PACATOC(r13)<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>mfcr<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>r12<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>li<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>r11,0<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>/* Can we avoid saving r3-r8 in common case? */<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>/* Save syscall parameters in r3-r8 */<br =
class=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: IBMPlexMono; font-size: 16px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: IBMPlexMono; font-size: 16px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">These two comment changes could go in your =
system_call_exception API</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: IBMPlexMono; font-size: 16px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: IBMPlexMono; font-size: 16px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">change patch though.</span><br style=3D"caret-color: rgb(0, =
0, 0); font-family: IBMPlexMono; font-size: 16px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: IBMPlexMono; font-size: 16px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: IBMPlexMono; font-size: 16px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Thanks,</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: IBMPlexMono; font-size: 16px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: IBMPlexMono; font-size: 16px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Nick</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: IBMPlexMono; font-size: 16px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: IBMPlexMono; font-size: 16px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: IBMPlexMono; font-size: 16px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>SAVE_GPRS(3, 8, r1)<br =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>/* Zero r9-r12, this should only be required when restoring all =
GPRs */<br class=3D""><span class=3D"Apple-tab-span" style=3D"white-space:=
 pre;">	</span>std<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>r11,GPR9(r1)<br class=3D"">@@ -110,6 +110,7 @@ =
END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>* Zero user registers to =
prevent influencing speculative execution<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>* state of kernel code.<br =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-converted-space">&nbsp;</span>*/<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>ZEROIZE_GPR(0)<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>ZEROIZE_GPRS(5, 12)<br =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>ZEROIZE_NVGPRS()<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>bl<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>system_call_exception<br =
class=3D"">@@ -140,6 +141,7 @@ BEGIN_FTR_SECTION<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>HMT_MEDIUM_LOW<br =
class=3D"">END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)<br class=3D""><br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>REST_NVGPRS(r1)<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>cmpdi<span class=3D"Apple-tab-span"=
 style=3D"white-space: pre;">	</span>r3,0<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>bne<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>.Lsyscall_vectored_\name\()_restore_regs<br class=3D""><br =
class=3D"">@@ -243,7 +245,7 @@ END_BTB_FLUSH_SECTION<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>ld<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>r2,PACATOC(r13)<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>mfcr<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>r12<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>li<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>r11,0<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>/* Can we avoid saving r3-r8 in common case? */<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>/* Save syscall parameters in r3-r8 */<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>SAVE_GPRS(3, 8, r1)<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>/* Zero r9-r12, this should only =
be required when restoring all GPRs */<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>std<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>r11,GPR9(r1)<br class=3D"">@@ -295,6 +297,7 @@ =
END_BTB_FLUSH_SECTION<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>* Zero user registers to =
prevent influencing speculative execution<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>* state of kernel code.<br =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-converted-space">&nbsp;</span>*/<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>ZEROIZE_GPR(0)<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>ZEROIZE_GPRS(5, 12)<br =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>ZEROIZE_NVGPRS()<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>bl<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>system_call_exception<br =
class=3D"">@@ -337,6 +340,7 @@ BEGIN_FTR_SECTION<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>stdcx.<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>r0,0,r1<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>/* to clear the reservation */<br =
class=3D"">END_FTR_SECTION_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)<br =
class=3D""><br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>REST_NVGPRS(r1)<br class=3D""><span=
 class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>cmpdi<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>r3,0<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>bne<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>.Lsyscall_restore_regs<br =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>/* Zero volatile regs that may contain sensitive kernel data =
*/<br class=3D"">@@ -364,7 +368,6 @@ =
END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)<br =
class=3D"">.Lsyscall_restore_regs:<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>ld<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>r3,_CTR(r1)<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>ld<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>r4,_XER(r1)<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>REST_NVGPRS(r1)<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>mtctr<span class=3D"Apple-tab-span"=
 style=3D"white-space: pre;">	</span>r3<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>mtspr<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>SPRN_XER,r4<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>REST_GPR(0, r1)<br =
class=3D"">--<span class=3D"Apple-converted-space">&nbsp;</span><br =
class=3D"">2.34.1</blockquote></div></blockquote></div><br =
class=3D""></body></html>=

--Apple-Mail=_417FD6F6-2C1F-402A-BC3A-75E9B48B0F9B--

