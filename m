Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE0061419E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Nov 2022 00:23:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N1Tjl1StZz3cLm
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Nov 2022 10:23:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=n2BdUI0r;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=n2BdUI0r;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N1Thk0PSwz3bj0
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Nov 2022 10:22:44 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29VMMkGv026733
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Oct 2022 23:22:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=P9oU05zSe57AtBIpg4Ur9WzGBy+oMLwfbsIPoj+lFOI=;
 b=n2BdUI0r2qMCrqkaoz1llgfIHDimLNCzduTeC9mCbfqUnoKfu12p4OMpt86E6Oo+c80j
 dUEdxbLeM8e8uIAXFS5YH7oa1attw+swxnHmsHO5+zYpnmvZyiSWp/JAam7pWD8deW3a
 glvgF9MXId5xzMHHAA19dOT5X+5I8M/T/qWVZ/QkK40/7vKiosfwLoU5u/qhnBvjJtxH
 FQS5wB8HDm4b26UFSDTsl0EzwMroPdeDOL7FXfp93ZOTebhElD8H9bVkPT6WBGUGlvtl
 iffXr/IzS2UQDDjMskkZOn9MxoeiVoAWHRpzGG8UqjSFDOgsUDLc2Qu3MMOj7gWm9R8A vw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kjkmu087f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Oct 2022 23:22:41 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29VN3EXp003329
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Oct 2022 23:22:41 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kjkmu086x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Oct 2022 23:22:41 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29VNLbLF001353;
	Mon, 31 Oct 2022 23:22:38 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma06ams.nl.ibm.com with ESMTP id 3kguehunm2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Oct 2022 23:22:38 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29VNMatP48366030
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 31 Oct 2022 23:22:36 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 71B335204F;
	Mon, 31 Oct 2022 23:22:36 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id C75635204E;
	Mon, 31 Oct 2022 23:22:35 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.177.0.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id F1E666010C;
	Tue,  1 Nov 2022 10:22:25 +1100 (AEDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.200.110.1.12\))
Subject: Re: [PATCH v6 22/25] powerpc/64s: Clear user GPRs in syscall
 interrupt entry
From: Rohan McLure <rmclure@linux.ibm.com>
In-Reply-To: <CN3MGF4GO42K.22AHRCY1C91N2@bobo>
Date: Tue, 1 Nov 2022 10:22:10 +1100
Content-Transfer-Encoding: quoted-printable
Message-Id: <D680B180-C8FB-4099-B75C-EE44B345723E@linux.ibm.com>
References: <20220921065605.1051927-1-rmclure@linux.ibm.com>
 <20220921065605.1051927-23-rmclure@linux.ibm.com>
 <CN3MGF4GO42K.22AHRCY1C91N2@bobo>
To: Nicholas Piggin <npiggin@gmail.com>
X-Mailer: Apple Mail (2.3731.200.110.1.12)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: tvTLPKGTvi8TB3A6GgTBRSAGRQGbc_OX
X-Proofpoint-GUID: UFhRMtO8wOY52Ld1s4jIXjyQuw2519cj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-31_21,2022-10-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 suspectscore=0 adultscore=0 impostorscore=0 spamscore=0
 bulkscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015
 mlxlogscore=881 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210310144
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

> On 23 Sep 2022, at 6:02 pm, Nicholas Piggin <npiggin@gmail.com> wrote:
>=20
> On Wed Sep 21, 2022 at 4:56 PM AEST, Rohan McLure wrote:
>> Clear user state in gprs (assign to zero) to reduce the influence of =
user
>> registers on speculation within kernel syscall handlers. Clears occur
>> at the very beginning of the sc and scv 0 interrupt handlers, with
>> restores occurring following the execution of the syscall handler.
>>=20
>> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
>> ---
>> V2: Update summary
>> V3: Remove erroneous summary paragraph on syscall_exit_prepare
>> V4: Use ZEROIZE instead of NULLIFY. Clear r0 also.
>> V5: Move to end of patch series.
>> V6: Include clears which were previously in the syscall wrapper =
patch.
>> Move comment on r3-r8 register save to when we alter the calling
>> convention for system_call_exception.
>=20
> The series looks good to here, I just need to find a bit more time to
> look at the code and do some tests with the next few patches. I don't
> see much problem with them, looks a lot better now with fewer ifdefs
> so that's good. Possibly you could share some of those new sanitize
> macros in a header file but that's a minor nit.
>=20
> Coud we have this zeroize also under the same config option as the
> next? I figure if we care about speculative security we want both,
> and if we don't we need neither.

Thanks for this. I=E2=80=99ll resubmit the last four patches with a =
common
configuration option for register clearing. Just pinging to hear your
thoughts on whether we are willing to wear the small performance
regression in general interrupts, and whether this mitigation should
be a default on pseries.

Rohan

>=20
> Thanks,
> Nick
>=20
>> ---
>> arch/powerpc/kernel/interrupt_64.S | 17 ++++++++++++++++-
>> 1 file changed, 16 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/arch/powerpc/kernel/interrupt_64.S =
b/arch/powerpc/kernel/interrupt_64.S
>> index a5dd78bdbe6d..40147558e1a6 100644
>> --- a/arch/powerpc/kernel/interrupt_64.S
>> +++ b/arch/powerpc/kernel/interrupt_64.S
>> @@ -106,6 +106,13 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>>  * but this is the best we can do.
>>  */
>>=20
>> + /*
>> +  * Zero user registers to prevent influencing speculative execution
>> +  * state of kernel code.
>> +  */
>> + ZEROIZE_GPR(0)
>> + ZEROIZE_GPRS(5, 12)
>> + ZEROIZE_NVGPRS()
>> bl system_call_exception
>>=20
>> .Lsyscall_vectored_\name\()_exit:
>> @@ -134,6 +141,7 @@ BEGIN_FTR_SECTION
>> HMT_MEDIUM_LOW
>> END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>>=20
>> + REST_NVGPRS(r1)
>> cmpdi r3,0
>> bne .Lsyscall_vectored_\name\()_restore_regs
>>=20
>> @@ -285,6 +293,13 @@ END_BTB_FLUSH_SECTION
>> wrteei 1
>> #endif
>>=20
>> + /*
>> +  * Zero user registers to prevent influencing speculative execution
>> +  * state of kernel code.
>> +  */
>> + ZEROIZE_GPR(0)
>> + ZEROIZE_GPRS(5, 12)
>> + ZEROIZE_NVGPRS()
>> bl system_call_exception
>>=20
>> .Lsyscall_exit:
>> @@ -325,6 +340,7 @@ BEGIN_FTR_SECTION
>> stdcx. r0,0,r1 /* to clear the reservation */
>> END_FTR_SECTION_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
>>=20
>> + REST_NVGPRS(r1)
>> cmpdi r3,0
>> bne .Lsyscall_restore_regs
>> /* Zero volatile regs that may contain sensitive kernel data */
>> @@ -352,7 +368,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>> .Lsyscall_restore_regs:
>> ld r3,_CTR(r1)
>> ld r4,_XER(r1)
>> - REST_NVGPRS(r1)
>> mtctr r3
>> mtspr SPRN_XER,r4
>> REST_GPR(0, r1)
>> --=20
>> 2.34.1


