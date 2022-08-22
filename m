Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2799D59B833
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Aug 2022 06:05:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M9zK40fvHz3cC1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Aug 2022 14:04:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Vssc2U1S;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Vssc2U1S;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M9yxl08WXz302d
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Aug 2022 13:48:10 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27M3fqQt018188;
	Mon, 22 Aug 2022 03:48:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : message-id :
 content-type : subject : date : in-reply-to : cc : to : references :
 mime-version; s=pp1; bh=NV4db4j0J/JbkBbZhNQyXUrEIFYm0ZCMQMyHKraXL1w=;
 b=Vssc2U1SJYaW5vXCxExI6p07pnX405jrRF22RL01HXRlDZO/3CZcEJM5C9wQk61DzPsh
 ZByMJErTcH/iU8ZFZE8M3Ef8om2KgjTKKCX6t4ocYF1onTtvdiX5cDjdGkTRmab7Xg9l
 4PnolU93BK6WM26Z+H5SKQBw8Iq+spTklfWZQYi0CeXe/6JK6GdGjc83zfv+9zHAdZ3s
 APQ7cEfAdAhbgaYYhfasBzimsmh8kBp7UbuRsdENLtVfOLf8gpih3dU/Z0qa9qyylIAw
 09icS4FRdmwbMK/aunovN2Q009mXeInj0XbBHOuMd3yh2fCJbmsVT2xZOj1LGDt6dgaF bg== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j4247g39m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Aug 2022 03:48:04 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27M3LXrI023693;
	Mon, 22 Aug 2022 03:48:02 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma04ams.nl.ibm.com with ESMTP id 3j2q88su8t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Aug 2022 03:48:01 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27M3mJ1435455468
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 22 Aug 2022 03:48:19 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A1F194C044;
	Mon, 22 Aug 2022 03:47:59 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EAC834C040;
	Mon, 22 Aug 2022 03:47:58 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 22 Aug 2022 03:47:58 +0000 (GMT)
Received: from smtpclient.apple (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id A598C60151;
	Mon, 22 Aug 2022 13:47:49 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
Message-Id: <4C3A8815-67FF-41EB-A703-981920CA1201@linux.ibm.com>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_D20663C8-8AA5-4981-A0A5-2CAC94D856AB"
Subject: Re: [PATCH v3 14/18] powerpc/64s: Clear/restore caller gprs in
 syscall interrupt/return
Date: Mon, 22 Aug 2022 13:47:49 +1000
In-Reply-To: <7672f9a3-e8e2-a6e4-cca0-730cb4d6b0f4@csgroup.eu>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
References: <20220819033806.162054-1-rmclure@linux.ibm.com>
 <20220819033806.162054-15-rmclure@linux.ibm.com>
 <7672f9a3-e8e2-a6e4-cca0-730cb4d6b0f4@csgroup.eu>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _ug97HLCXG98xbeh8Q39BeZe6KKmqcef
X-Proofpoint-ORIG-GUID: _ug97HLCXG98xbeh8Q39BeZe6KKmqcef
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-21_17,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 clxscore=1015 priorityscore=1501 mlxscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208220016
X-Mailman-Approved-At: Mon, 22 Aug 2022 14:04:19 +1000
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_D20663C8-8AA5-4981-A0A5-2CAC94D856AB
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable



> On 19 Aug 2022, at 4:52 pm, Christophe Leroy <christophe.leroy@csgroup.eu=
> wrote:
>=20
>=20
>=20
> Le 19/08/2022 =C3=A0 05:38, Rohan McLure a =C3=A9crit :
>> Clear user state in gprs (assign to zero) to reduce the influence of user
>> registers on speculation within kernel syscall handlers. Clears occur
>> at the very beginning of the sc and scv 0 interrupt handlers, with
>> restores occurring following the execution of the syscall handler.
>>=20
>> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
>> ---
>> V1 -> V2: Update summary
>> V2 -> V3: Remove erroneous summary paragraph on syscall_exit_prepare
>> ---
>>  arch/powerpc/kernel/interrupt_64.S | 22 ++++++++++++++++++----
>>  1 file changed, 18 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/in=
terrupt_64.S
>> index 0178aeba3820..d9625113c7a5 100644
>> --- a/arch/powerpc/kernel/interrupt_64.S
>> +++ b/arch/powerpc/kernel/interrupt_64.S
>> @@ -70,7 +70,7 @@ _ASM_NOKPROBE_SYMBOL(system_call_vectored_\name)
>>  	ld	r2,PACATOC(r13)
>>  	mfcr	r12
>>  	li	r11,0
>> -	/* Can we avoid saving r3-r8 in common case? */
>> +	/* Save syscall parameters in r3-r8 */
>>  	std	r3,GPR3(r1)
>>  	std	r4,GPR4(r1)
>>  	std	r5,GPR5(r1)
>> @@ -109,6 +109,13 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>>  	 * but this is the best we can do.
>>  	 */
>>=20
>> +	/*
>> +	 * Zero user registers to prevent influencing speculative execution
>> +	 * state of kernel code.
>> +	 */
>> +	NULLIFY_GPRS(5, 12)
>=20
> Macro name has changed.
>=20
>> +	NULLIFY_NVGPRS()
>=20
> Why clearing non volatile GPRs ? They are supposed to be callee saved so=
=20
> I can't see how they could be used for speculation. Do you have any=20
> exemple ?
>=20
>> +
>>  	/* Calling convention has r3 =3D orig r0, r4 =3D regs */
>>  	mr	r3,r0
>>  	bl	system_call_exception
>> @@ -139,6 +146,7 @@ BEGIN_FTR_SECTION
>>  	HMT_MEDIUM_LOW
>>  END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>>=20
>> +	REST_NVGPRS(r1)
>=20
>=20
>=20
>>  	cmpdi	r3,0
>>  	bne	.Lsyscall_vectored_\name\()_restore_regs
>>=20
>> @@ -181,7 +189,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>>  	ld	r4,_LINK(r1)
>>  	ld	r5,_XER(r1)
>>=20
>> -	REST_NVGPRS(r1)
>>  	ld	r0,GPR0(r1)
>>  	mtcr	r2
>>  	mtctr	r3
>> @@ -249,7 +256,7 @@ END_BTB_FLUSH_SECTION
>>  	ld	r2,PACATOC(r13)
>>  	mfcr	r12
>>  	li	r11,0
>> -	/* Can we avoid saving r3-r8 in common case? */
>> +	/* Save syscall parameters in r3-r8 */
>>  	std	r3,GPR3(r1)
>>  	std	r4,GPR4(r1)
>>  	std	r5,GPR5(r1)
>> @@ -300,6 +307,13 @@ END_BTB_FLUSH_SECTION
>>  	wrteei	1
>>  #endif
>>=20
>> +	/*
>> +	 * Zero user registers to prevent influencing speculative execution
>> +	 * state of kernel code.
>> +	 */
>> +	NULLIFY_GPRS(5, 12)
>> +	NULLIFY_NVGPRS()
>> +
>=20
> Name has changed.
>=20
>>  	/* Calling convention has r3 =3D orig r0, r4 =3D regs */
>>  	mr	r3,r0
>>  	bl	system_call_exception
>> @@ -342,6 +356,7 @@ BEGIN_FTR_SECTION
>>  	stdcx.	r0,0,r1			/* to clear the reservation */
>>  END_FTR_SECTION_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
>>=20
>> +	REST_NVGPRS(r1)
>=20
> Same question.
>=20
>>  	cmpdi	r3,0
>>  	bne	.Lsyscall_restore_regs
>>  	/* Zero volatile regs that may contain sensitive kernel data */
>> @@ -377,7 +392,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>>  .Lsyscall_restore_regs:
>>  	ld	r3,_CTR(r1)
>>  	ld	r4,_XER(r1)
>> -	REST_NVGPRS(r1)
>>  	mtctr	r3
>>  	mtspr	SPRN_XER,r4
>>  	ld	r0,GPR0(r1)


> Why clearing non volatile GPRs ? They are supposed to be callee saved so=
=20
> I can't see how they could be used for speculation. Do you have any=20
> exemple ?

Even though non-volatiles will be callee-saved subject to ABI in the syscal=
l handler prologue, it is still conceivable that a syscall handler will lea=
ve a register uninitialised on one branch outcome, assigning that register =
in the other.

On speculative processors, there remains the possibility for untaken branch=
es to be executed microarchitecturally (by mistraining the branch predictor=
 or otherwise),
whereby the microarchitectural effects of the execution present a side-chan=
nel.

Such a hardening measure removes the burden for developers to prove that to=
olchains
will never emit code with these properties in code reachable via a syscall.=
 For what
it=E2=80=99s worth, precedent already exists in arm64 and x86.

Links:
https://lore.kernel.org/linux-arm-kernel/20180702110415.10465-13-mark.rutla=
nd@arm.com/ <https://lore.kernel.org/linux-arm-kernel/20180702110415.10465-=
13-mark.rutland@arm.com/>
https://lore.kernel.org/lkml/20180405095307.3730-8-linux@dominikbrodowski.n=
et/ <https://lore.kernel.org/lkml/20180405095307.3730-8-linux@dominikbrodow=
ski.net/>

> What is the link between this change and the description in the commit=20
> message ?

I=E2=80=99ll include a detail on why we must restore nvgprs in both cases i=
n the commit message.
Thanks for pointing that out.=

--Apple-Mail=_D20663C8-8AA5-4981-A0A5-2CAC94D856AB
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 19 Aug 2022, at 4:52 pm, Christophe Leroy &lt;<a =
href=3D"mailto:christophe.leroy@csgroup.eu" =
class=3D"">christophe.leroy@csgroup.eu</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><meta =
charset=3D"UTF-8" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: IBMPlexMono; font-size: 16px; font-style: normal; =
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
class=3D"">Le 19/08/2022 =C3=A0 05:38, Rohan McLure a =
=C3=A9crit&nbsp;:</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: IBMPlexMono; font-size: 16px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: IBMPlexMono; font-size: 16px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D"">Clear user state in gprs (assign to =
zero) to reduce the influence of user<br class=3D"">registers on =
speculation within kernel syscall handlers. Clears occur<br class=3D"">at =
the very beginning of the sc and scv 0 interrupt handlers, with<br =
class=3D"">restores occurring following the execution of the syscall =
handler.<br class=3D""><br class=3D"">Signed-off-by: Rohan McLure &lt;<a =
href=3D"mailto:rmclure@linux.ibm.com" =
class=3D"">rmclure@linux.ibm.com</a>&gt;<br class=3D"">---<br =
class=3D"">V1 -&gt; V2: Update summary<br class=3D"">V2 -&gt; V3: Remove =
erroneous summary paragraph on syscall_exit_prepare<br class=3D"">---<br =
class=3D"">&nbsp;arch/powerpc/kernel/interrupt_64.S | 22 =
++++++++++++++++++----<br class=3D"">&nbsp;1 file changed, 18 =
insertions(+), 4 deletions(-)<br class=3D""><br class=3D"">diff --git =
a/arch/powerpc/kernel/interrupt_64.S =
b/arch/powerpc/kernel/interrupt_64.S<br class=3D"">index =
0178aeba3820..d9625113c7a5 100644<br class=3D"">--- =
a/arch/powerpc/kernel/interrupt_64.S<br class=3D"">+++ =
b/arch/powerpc/kernel/interrupt_64.S<br class=3D"">@@ -70,7 +70,7 @@ =
_ASM_NOKPROBE_SYMBOL(system_call_vectored_\name)<br class=3D"">&nbsp;<span=
 class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>ld<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>r2,PACATOC(r13)<br class=3D"">&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>mfcr<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>r12<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>li<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>r11,0<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>/* Can we avoid saving r3-r8 in common case? */<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>/* Save syscall parameters in r3-r8 */<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>std<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>r3,GPR3(r1)<br class=3D"">&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>std<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>r4,GPR4(r1)<br =
class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>std<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>r5,GPR5(r1)<br class=3D"">@@ -109,6 +109,13 @@ =
END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>* but this is the best we =
can do.<br class=3D"">&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>*/<br class=3D""><br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>/*<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>* Zero user registers to =
prevent influencing speculative execution<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>* state of kernel code.<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-converted-space">&nbsp;</span>*/<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>NULLIFY_GPRS(5, 12)<br class=3D""></blockquote><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: IBMPlexMono; font-size: =
16px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: IBMPlexMono; font-size: =
16px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">Macro name has =
changed.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
IBMPlexMono; font-size: 16px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
IBMPlexMono; font-size: 16px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><blockquote type=3D"cite" style=3D"font-family: =
IBMPlexMono; font-size: 16px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>NULLIFY_NVGPRS()<br class=3D""></blockquote><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: IBMPlexMono; font-size: =
16px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: IBMPlexMono; font-size: =
16px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">Why clearing non volatile GPRs ? =
They are supposed to be callee saved so<span =
class=3D"Apple-converted-space">&nbsp;</span></span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: IBMPlexMono; font-size: =
16px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: IBMPlexMono; font-size: =
16px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">I can't see how they could be =
used for speculation. Do you have any<span =
class=3D"Apple-converted-space">&nbsp;</span></span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: IBMPlexMono; font-size: =
16px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: IBMPlexMono; font-size: =
16px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">exemple ?</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: IBMPlexMono; font-size: =
16px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: IBMPlexMono; font-size: =
16px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" =
class=3D""><blockquote type=3D"cite" style=3D"font-family: IBMPlexMono; =
font-size: 16px; font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">+<br =
class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>/* Calling convention has r3 =3D orig r0, r4 =3D regs =
*/<br class=3D"">&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>mr<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>r3,r0<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>bl<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>system_call_exception<br class=3D"">@@ -139,6 +146,7 @@ =
BEGIN_FTR_SECTION<br class=3D"">&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>HMT_MEDIUM_LOW<br =
class=3D"">&nbsp;END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)<br class=3D""><br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>REST_NVGPRS(r1)<br class=3D""></blockquote><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: IBMPlexMono; font-size: =
16px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: IBMPlexMono; font-size: =
16px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: IBMPlexMono; font-size: =
16px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" =
class=3D""><blockquote type=3D"cite" style=3D"font-family: IBMPlexMono; =
font-size: 16px; font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" =
class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>cmpdi<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>r3,0<br class=3D"">&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>bne<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	=
</span>.Lsyscall_vectored_\name\()_restore_regs<br class=3D""><br =
class=3D"">@@ -181,7 +189,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)<br =
class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>ld<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>r4,_LINK(r1)<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>ld<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>r5,_XER(r1)<br class=3D""><br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>REST_NVGPRS(r1)<br class=3D"">&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>ld<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>r0,GPR0(r1)<br =
class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>mtcr<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>r2<br class=3D"">&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>mtctr<span class=3D"Apple-tab-span"=
 style=3D"white-space: pre;">	</span>r3<br class=3D"">@@ -249,7 +256,7 =
@@ END_BTB_FLUSH_SECTION<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>ld<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>r2,PACATOC(r13)<br class=3D"">&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>mfcr<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>r12<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>li<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>r11,0<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>/* Can we avoid saving r3-r8 in common case? */<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>/* Save syscall parameters in r3-r8 */<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>std<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>r3,GPR3(r1)<br class=3D"">&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>std<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>r4,GPR4(r1)<br =
class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>std<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>r5,GPR5(r1)<br class=3D"">@@ -300,6 +307,13 @@ =
END_BTB_FLUSH_SECTION<br class=3D"">&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>wrteei<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>1<br =
class=3D"">&nbsp;#endif<br class=3D""><br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>/*<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-converted-space">&nbsp;</span>* Zero user =
registers to prevent influencing speculative execution<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-converted-space">&nbsp;</span>* state of =
kernel code.<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>*/<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>NULLIFY_GPRS(5, 12)<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>NULLIFY_NVGPRS()<br class=3D"">+<br=
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
class=3D"">Name has changed.</span><br style=3D"caret-color: rgb(0, 0, =
0); font-family: IBMPlexMono; font-size: 16px; font-style: normal; =
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
text-decoration: none;" class=3D"">&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>/* Calling convention has r3 =3D =
orig r0, r4 =3D regs */<br class=3D"">&nbsp;<span class=3D"Apple-tab-span"=
 style=3D"white-space: pre;">	</span>mr<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>r3,r0<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>bl<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>system_call_exception<br class=3D"">@@ -342,6 +356,7 @@ =
BEGIN_FTR_SECTION<br class=3D"">&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>stdcx.<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>r0,0,r1<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>/* to clear the reservation */<br =
class=3D"">&nbsp;END_FTR_SECTION_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)<br =
class=3D""><br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>REST_NVGPRS(r1)<br =
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
class=3D"">Same question.</span><br style=3D"caret-color: rgb(0, 0, 0); =
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
text-decoration: none;" class=3D"">&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>cmpdi<span class=3D"Apple-tab-span"=
 style=3D"white-space: pre;">	</span>r3,0<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>bne<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>.Lsyscall_restore_regs<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>/* Zero =
volatile regs that may contain sensitive kernel data */<br class=3D"">@@ =
-377,7 +392,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)<br =
class=3D"">&nbsp;.Lsyscall_restore_regs:<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>ld<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>r3,_CTR(r1)<br class=3D"">&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>ld<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>r4,_XER(r1)<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>REST_NVGPRS(r1)<br class=3D"">&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>mtctr<span class=3D"Apple-tab-span"=
 style=3D"white-space: pre;">	</span>r3<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>mtspr<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>SPRN_XER,r4<br class=3D"">&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>ld<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	=
</span>r0,GPR0(r1)</blockquote></div></blockquote></div><br =
class=3D""><div class=3D""><br class=3D""></div><div class=3D""><div =
style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; line-break: =
after-white-space;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: monospace; font-size: 16px;" class=3D"">Why =
clearing non volatile GPRs ? They are supposed to be callee saved =
so&nbsp;<br class=3D"">I can't see how they could be used for =
speculation. Do you have any&nbsp;<br class=3D"">exemple ?<br =
class=3D""></blockquote><div style=3D"caret-color: rgb(0, 0, 0); color: =
rgb(0, 0, 0); font-family: monospace; font-size: 16px;" class=3D""><br =
class=3D""></div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, =
0, 0); font-family: monospace; font-size: 16px;" class=3D"">Even though =
non-volatiles will be callee-saved subject to ABI in the syscall handler =
prologue, it is still conceivable that a syscall handler will leave a =
register uninitialised on one branch outcome, assigning that register in =
the other.</div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, =
0, 0); font-family: monospace; font-size: 16px;" class=3D""><br =
class=3D""></div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, =
0, 0); font-family: monospace; font-size: 16px;" class=3D"">On =
speculative processors, there remains the possibility for untaken =
branches to be executed microarchitecturally (by mistraining the branch =
predictor or otherwise),</div><div style=3D"caret-color: rgb(0, 0, 0); =
color: rgb(0, 0, 0); font-family: monospace; font-size: 16px;" =
class=3D"">whereby the microarchitectural effects of the execution =
present a side-channel.</div><div style=3D"caret-color: rgb(0, 0, 0); =
color: rgb(0, 0, 0); font-family: monospace; font-size: 16px;" =
class=3D""><br class=3D""></div><div style=3D"caret-color: rgb(0, 0, 0); =
color: rgb(0, 0, 0); font-family: monospace; font-size: 16px;" =
class=3D"">Such a hardening measure removes the burden for developers to =
prove that toolchains</div><div style=3D"caret-color: rgb(0, 0, 0); =
color: rgb(0, 0, 0); font-family: monospace; font-size: 16px;" =
class=3D"">will never emit code with these properties in code reachable =
via a syscall. For what</div><div style=3D"caret-color: rgb(0, 0, 0); =
color: rgb(0, 0, 0); font-family: monospace; font-size: 16px;" =
class=3D"">it=E2=80=99s worth, precedent already exists in arm64 and =
x86.</div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); =
font-family: monospace; font-size: 16px;" class=3D""><br =
class=3D""></div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, =
0, 0); font-family: monospace; font-size: 16px;" =
class=3D"">Links:</div><div style=3D"caret-color: rgb(0, 0, 0); color: =
rgb(0, 0, 0); font-family: monospace; font-size: 16px;" class=3D""><a =
href=3D"https://lore.kernel.org/linux-arm-kernel/20180702110415.10465-13-m=
ark.rutland@arm.com/" =
class=3D"">https://lore.kernel.org/linux-arm-kernel/20180702110415.10465-1=
3-mark.rutland@arm.com/</a></div><div style=3D"caret-color: rgb(0, 0, =
0); color: rgb(0, 0, 0); font-family: monospace; font-size: 16px;" =
class=3D""><a =
href=3D"https://lore.kernel.org/lkml/20180405095307.3730-8-linux@dominikbr=
odowski.net/" =
class=3D"">https://lore.kernel.org/lkml/20180405095307.3730-8-linux@domini=
kbrodowski.net/</a></div><div style=3D"caret-color: rgb(0, 0, 0); color: =
rgb(0, 0, 0); font-family: monospace; font-size: 16px;" class=3D""><br =
class=3D""></div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, =
0, 0); font-family: monospace; font-size: 16px;" class=3D""><blockquote =
type=3D"cite" style=3D"font-family: Helvetica; font-size: 14px;" =
class=3D""><span class=3D"" style=3D"font-family: IBMPlexMono; =
font-size: 16px; float: none; display: inline !important;">What is the =
link between this change and the description in the =
commit&nbsp;</span><br class=3D"" style=3D"font-family: IBMPlexMono; =
font-size: 16px;"><span class=3D"" style=3D"font-family: IBMPlexMono; =
font-size: 16px; float: none; display: inline !important;">message =
?</span></blockquote><br class=3D""></div><div style=3D"caret-color: =
rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: monospace; font-size: =
16px;" class=3D"">I=E2=80=99ll include a detail on why we must restore =
nvgprs in both cases in the commit message.</div><div =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: =
monospace; font-size: 16px;" class=3D"">Thanks for pointing that =
out.</div></div></div></body></html>=

--Apple-Mail=_D20663C8-8AA5-4981-A0A5-2CAC94D856AB--

