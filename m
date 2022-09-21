Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9295BF5EF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 07:34:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXRts55ysz3bxY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 15:34:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DLVpZJpE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DLVpZJpE;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXRt82tZpz3bcF
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 15:34:07 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28L5Kk5L009465
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 05:34:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=597D5+gE+dagLCvCBVzH5BFtAv6fSz7SI2+0/364SrU=;
 b=DLVpZJpEv2wLnq3m0sdo9x/DJy77gXecLVGYwjaYwHwgb+EAxSY4qyooH2+ucvzGE81x
 GZRkj9rJ1h9k6IqSoDjdEOt2HXrzJfGEL8JlQCxyh62d92sGrhdj1pJSt6Gc0c0+TOPO
 /hKQRWSXeUda3F/ZF+UdcOJTGw5AkO51QlT8v9jo4SBwy5RXdyKPSo0GZ4uctyjfGojK
 OBGUUFZ08PBXa8zrqVD09P7P48OmCaWHGMpUjwsIdqLqIADAZrlWdcLHl8PT5MnrR/zI
 CGS/lo9y1H+HJJF1U6jf1jJVt2lQoWo4TYlg9OrqwgWSWirrND4HamDvMdyTveXOCW71 BQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jqvctgcjb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 05:34:04 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28L5MHEl022464
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 05:34:04 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jqvctgcgq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Sep 2022 05:34:04 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28L5L3og010097;
	Wed, 21 Sep 2022 05:34:01 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma01fra.de.ibm.com with ESMTP id 3jn5v8kh1x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Sep 2022 05:34:01 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28L5XxP834079156
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Sep 2022 05:33:59 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EDF5FAE053;
	Wed, 21 Sep 2022 05:33:58 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4F8E8AE045;
	Wed, 21 Sep 2022 05:33:58 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed, 21 Sep 2022 05:33:58 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.177.29.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 6B37460060;
	Wed, 21 Sep 2022 15:33:51 +1000 (AEST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH 20/23] powerpc/64s: Clear/restore caller gprs in syscall
 interrupt/return
From: Rohan McLure <rmclure@linux.ibm.com>
In-Reply-To: <2F4E472D-A70E-470A-A9A0-2AC24FDCE9CE@linux.ibm.com>
Date: Wed, 21 Sep 2022 15:33:46 +1000
Content-Transfer-Encoding: quoted-printable
Message-Id: <CAD81242-B031-42CF-BB6B-F31FB1196A85@linux.ibm.com>
References: <20220916053300.786330-1-rmclure@linux.ibm.com>
 <20220916053300.786330-21-rmclure@linux.ibm.com>
 <CN0UYA40KPVY.V7SYHTJAP9KO@bobo>
 <2F4E472D-A70E-470A-A9A0-2AC24FDCE9CE@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ZIa5al5Y_dKX4pvOK_-7Xsw71iYgYGF2
X-Proofpoint-ORIG-GUID: Xl80O3f2Dc3evATmHtSHUKssOVLkvlHV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-21_02,2022-09-20_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 mlxscore=0 adultscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 mlxlogscore=963 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209210035
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



> On 20 Sep 2022, at 2:54 pm, Rohan McLure <rmclure@linux.ibm.com> =
wrote:=20
>=20
>> On 20 Sep 2022, at 12:03 pm, Nicholas Piggin <npiggin@gmail.com> =
wrote:
>>=20
>> On Fri Sep 16, 2022 at 3:32 PM AEST, Rohan McLure wrote:
>>> Clear user state in gprs (assign to zero) to reduce the influence of =
user
>>> registers on speculation within kernel syscall handlers. Clears =
occur
>>> at the very beginning of the sc and scv 0 interrupt handlers, with
>>> restores occurring following the execution of the syscall handler.
>>>=20
>>> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
>>> ---
>>> V1 -> V2: Update summary
>>> V2 -> V3: Remove erroneous summary paragraph on syscall_exit_prepare
>>> V3 -> V4: Use ZEROIZE instead of NULLIFY. Clear r0 also.
>>> V4 -> V5: Move to end of patch series.
>>> ---
>>=20
>> I think it looks okay. I'll have to take a better look with the =
series
>> applied.
>=20
>=20
> Your comments alerted me to the fact that general interrupt and =
syscalls
> share their exit code in interrupt_return and its derivatives. Meaning
> that disabling INTERRUPT_SANITIZE_REGISTERS also reverts restores of =
NVGPRS
> to being optional, which makes it possible to clobber NVGPRS and then =
not
> restore them. The cleanest way forward I belive is going to be to =
cause
> INTERRUPT_SANITIZE_REGISTERS to perform sanitisation on all interrupt =
sources
> rather than continuing with syscalls as their own special case. I=E2=80=99=
ll put
> this out in a v6 soon.

I think I managed to confuse myself here. Syscall handlers directly =
RFID, while
other interrupt sources share a common exit path.

>>=20
>>> arch/powerpc/kernel/interrupt_64.S | 9 ++++++---
>>> 1 file changed, 6 insertions(+), 3 deletions(-)
>>>=20
>>> diff --git a/arch/powerpc/kernel/interrupt_64.S =
b/arch/powerpc/kernel/interrupt_64.S
>>> index 16a1b44088e7..40147558e1a6 100644
>>> --- a/arch/powerpc/kernel/interrupt_64.S
>>> +++ b/arch/powerpc/kernel/interrupt_64.S
>>> @@ -70,7 +70,7 @@ _ASM_NOKPROBE_SYMBOL(system_call_vectored_\name)
>>> 	ld	r2,PACATOC(r13)
>>> 	mfcr	r12
>>> 	li	r11,0
>>> -	/* Can we avoid saving r3-r8 in common case? */
>>> +	/* Save syscall parameters in r3-r8 */
>>=20
>> These two comment changes could go in your system_call_exception API
>> change patch though.
>>=20
>> Thanks,
>> Nick
>>=20
>>> 	SAVE_GPRS(3, 8, r1)
>>> 	/* Zero r9-r12, this should only be required when restoring all =
GPRs */
>>> 	std	r11,GPR9(r1)
>>> @@ -110,6 +110,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>>> 	 * Zero user registers to prevent influencing speculative =
execution
>>> 	 * state of kernel code.
>>> 	 */
>>> +	ZEROIZE_GPR(0)
>>> 	ZEROIZE_GPRS(5, 12)
>>> 	ZEROIZE_NVGPRS()
>>> 	bl	system_call_exception
>>> @@ -140,6 +141,7 @@ BEGIN_FTR_SECTION
>>> 	HMT_MEDIUM_LOW
>>> END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>>>=20
>>> +	REST_NVGPRS(r1)
>>> 	cmpdi	r3,0
>>> 	bne	.Lsyscall_vectored_\name\()_restore_regs
>>>=20
>>> @@ -243,7 +245,7 @@ END_BTB_FLUSH_SECTION
>>> 	ld	r2,PACATOC(r13)
>>> 	mfcr	r12
>>> 	li	r11,0
>>> -	/* Can we avoid saving r3-r8 in common case? */
>>> +	/* Save syscall parameters in r3-r8 */
>>> 	SAVE_GPRS(3, 8, r1)
>>> 	/* Zero r9-r12, this should only be required when restoring all =
GPRs */
>>> 	std	r11,GPR9(r1)
>>> @@ -295,6 +297,7 @@ END_BTB_FLUSH_SECTION
>>> 	 * Zero user registers to prevent influencing speculative =
execution
>>> 	 * state of kernel code.
>>> 	 */
>>> +	ZEROIZE_GPR(0)
>>> 	ZEROIZE_GPRS(5, 12)
>>> 	ZEROIZE_NVGPRS()
>>> 	bl	system_call_exception
>>> @@ -337,6 +340,7 @@ BEGIN_FTR_SECTION
>>> 	stdcx.	r0,0,r1			/* to clear the reservation */
>>> END_FTR_SECTION_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
>>>=20
>>> +	REST_NVGPRS(r1)
>>> 	cmpdi	r3,0
>>> 	bne	.Lsyscall_restore_regs
>>> 	/* Zero volatile regs that may contain sensitive kernel data */
>>> @@ -364,7 +368,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>>> .Lsyscall_restore_regs:
>>> 	ld	r3,_CTR(r1)
>>> 	ld	r4,_XER(r1)
>>> -	REST_NVGPRS(r1)
>>> 	mtctr	r3
>>> 	mtspr	SPRN_XER,r4
>>> 	REST_GPR(0, r1)
>>> --=20
>>> 2.34.1

