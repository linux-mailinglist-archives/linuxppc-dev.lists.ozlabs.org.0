Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 898AE5B94C7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Sep 2022 08:55:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MSnzJ44FKz3c2L
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Sep 2022 16:55:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fsd/6ipZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fsd/6ipZ;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MSnyZ1cZRz2y8L
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 16:55:17 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28F6FUs5018576
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 06:55:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=6JDkWHW/ElvYKZKL7uRTr0FTJ2bt8vmkYGBicTM/UFY=;
 b=fsd/6ipZEIy2UWwKnS6cNWcMuqyD2u06aYzRg4fCjbIvFQm5O3I8QPMr7wIFLpGCfz1x
 Q0hoexwVBbbd//hFXS+XesAtjNlrxJmM1EKGuXuOxYNaXBAbhXvYFe00pgDL2JYmkd84
 D9JwdPqTWQYn3amepwmU9hXyhyiz2/Bk6AODNV6Kfz3cu5p/9SjdWoUIvS7wvw4KHzmv
 x6RU2QgiZe0wKYZFzsLoX8PvMPRt/ZNMXF/259JU8prfMZHVFgS2DsMuO/nbjRbMlN5v
 B2YjxBPHDPyDAmkemJIe3Ac53rXJZC8IE9j5V7iFF3+UjnQXVrSz3WDk59rS9k5C8mTz kg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jkxmfs278-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 06:55:13 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28F6cK67020659
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 06:55:13 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jkxmfs264-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Sep 2022 06:55:13 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28F6qZFs032389;
	Thu, 15 Sep 2022 06:55:11 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma06ams.nl.ibm.com with ESMTP id 3jjyfra00j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Sep 2022 06:55:11 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28F6pMLJ17433056
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Sep 2022 06:51:22 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 690B4A404D;
	Thu, 15 Sep 2022 06:55:09 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C031AA4055;
	Thu, 15 Sep 2022 06:55:08 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu, 15 Sep 2022 06:55:08 +0000 (GMT)
Received: from smtpclient.apple (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 416F46016C;
	Thu, 15 Sep 2022 16:55:02 +1000 (AEST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH v4 19/20] powerpc/64s: Clear gprs on interrupt routine
 entry in Book3S
From: Rohan McLure <rmclure@linux.ibm.com>
In-Reply-To: <CMUEYJLOTRVG.2T3T0T50LQZTS@bobo>
Date: Thu, 15 Sep 2022 16:55:01 +1000
Content-Transfer-Encoding: quoted-printable
Message-Id: <5359A37E-5094-4EBC-999A-C5CD5110D1F5@linux.ibm.com>
References: <20220824020548.62625-1-rmclure@linux.ibm.com>
 <20220824020548.62625-20-rmclure@linux.ibm.com>
 <CMUEYJLOTRVG.2T3T0T50LQZTS@bobo>
To: Nicholas Piggin <npiggin@gmail.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: dgu03c6Erm4LasTa-GfHPjcnZC-D3oME
X-Proofpoint-GUID: GO62whPr_vI2sKUCfya2eYutuwoGPp5K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-15_02,2022-09-14_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0
 mlxscore=0 adultscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2208220000 definitions=main-2209150034
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



> On 12 Sep 2022, at 10:15 pm, Nicholas Piggin <npiggin@gmail.com> =
wrote:
>=20
> On Wed Aug 24, 2022 at 12:05 PM AEST, Rohan McLure wrote:
>> Zero GPRS r0, r2-r11, r14-r31, on entry into the kernel for all
>> other interrupt sources to limit influence of user-space values
>> in potential speculation gadgets. The remaining gprs are overwritten =
by
>> entry macros to interrupt handlers, irrespective of whether or not a
>> given handler consumes these register values.
>>=20
>> Prior to this commit, r14-r31 are restored on a per-interrupt basis =
at
>> exit, but now they are always restored. Remove explicit REST_NVGPRS
>> invocations as non-volatiles must now always be restored. 32-bit =
systems
>> do not clear user registers on interrupt, and continue to depend on =
the
>> return value of interrupt_exit_user_prepare to determine whether or =
not
>> to restore non-volatiles.
>>=20
>> The mmap_bench benchmark in selftests should rapidly invoke =
pagefaults.
>> See ~0.8% performance regression with this mitigation, but this
>> indicates the worst-case performance due to heavier-weight interrupt
>> handlers.
>=20
> Ow, my heart :(
>=20
> Are we not keeping a CONFIG option to rid ourselves of this vile
> performance robbing thing? Are we getting rid of the whole
> _TIF_RESTOREALL thing too, or does PPC32 want to keep it?

I see no reason not to include a CONFIG option for this=20
mitigation here other than simplicity. Any suggestions for a name?
I=E2=80=99m thinking PPC64_SANITIZE_INTERRUPTS. Defaults on Book3E_64, =
optional
on Book3S_64.

>>=20
>> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
>> ---
>> V1 -> V2: Add benchmark data
>> V2 -> V3: Use ZEROIZE_GPR{,S} macro renames, clarify
>> interrupt_exit_user_prepare changes in summary.
>> ---
>> arch/powerpc/kernel/exceptions-64s.S | 21 ++++++++-------------
>> arch/powerpc/kernel/interrupt_64.S   |  9 ++-------
>> 2 files changed, 10 insertions(+), 20 deletions(-)
>>=20
>> diff --git a/arch/powerpc/kernel/exceptions-64s.S =
b/arch/powerpc/kernel/exceptions-64s.S
>> index a3b51441b039..038e42fb2182 100644
>> --- a/arch/powerpc/kernel/exceptions-64s.S
>> +++ b/arch/powerpc/kernel/exceptions-64s.S
>> @@ -502,6 +502,7 @@ DEFINE_FIXED_SYMBOL(\name\()_common_real, text)
>> 	std	r10,0(r1)		/* make stack chain pointer	=
*/
>> 	std	r0,GPR0(r1)		/* save r0 in stackframe	=
*/
>> 	std	r10,GPR1(r1)		/* save r1 in stackframe	=
*/
>> +	ZEROIZE_GPR(0)
>>=20
>> 	/* Mark our [H]SRRs valid for return */
>> 	li	r10,1
>> @@ -538,14 +539,18 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>> 	ld	r10,IAREA+EX_R10(r13)
>> 	std	r9,GPR9(r1)
>> 	std	r10,GPR10(r1)
>> +	ZEROIZE_GPRS(9, 10)
>=20
> You use 9/10 right afterwards, this'd have to move down to where
> you zero r11 at least.
>=20
>> 	ld	r9,IAREA+EX_R11(r13)	/* move r11 - r13 to stackframe	=
*/
>> 	ld	r10,IAREA+EX_R12(r13)
>> 	ld	r11,IAREA+EX_R13(r13)
>> 	std	r9,GPR11(r1)
>> 	std	r10,GPR12(r1)
>> 	std	r11,GPR13(r1)
>> +	/* keep r12 ([H]SRR1/MSR), r13 (PACA) for interrupt routine */
>> +	ZEROIZE_GPR(11)
>=20
> Kernel always has to keep r13 so no need to comment that. Keeping r11,
> is that for those annoying fp_unavailable etc handlers?
>=20
> There's probably not much a user can do with this, given they're set
> from the MSR. Use can influence some bits of its MSR though. So long
> as we're being paranoid, you could add an IOPTION to retain r11 only =
for
> the handlers that need it, or have them load it from MSR and zero it
> here.

Good suggestion. Presume you=E2=80=99re referring to r12 here. I might =
go the
IOPTION route.

>=20
> Thanks,
> Nick
>=20
>>=20
>> 	SAVE_NVGPRS(r1)
>> +	ZEROIZE_NVGPRS()
>>=20
>> 	.if IDAR
>> 	.if IISIDE
>> @@ -577,8 +582,8 @@ BEGIN_FTR_SECTION
>> END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
>> 	ld	r10,IAREA+EX_CTR(r13)
>> 	std	r10,_CTR(r1)
>> -	std	r2,GPR2(r1)		/* save r2 in stackframe	=
*/
>> -	SAVE_GPRS(3, 8, r1)		/* save r3 - r8 in stackframe   =
*/
>> +	SAVE_GPRS(2, 8, r1)		/* save r2 - r8 in stackframe   =
*/
>> +	ZEROIZE_GPRS(2, 8)
>> 	mflr	r9			/* Get LR, later save to stack	=
*/
>> 	ld	r2,PACATOC(r13)		/* get kernel TOC into r2	=
*/
>> 	std	r9,_LINK(r1)
>> @@ -696,6 +701,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
>> 	mtlr	r9
>> 	ld	r9,_CCR(r1)
>> 	mtcr	r9
>> +	REST_NVGPRS(r1)
>> 	REST_GPRS(2, 13, r1)
>> 	REST_GPR(0, r1)
>> 	/* restore original r1. */
>> @@ -1368,11 +1374,6 @@ =
ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
>> 	b	interrupt_return_srr
>>=20
>> 1:	bl	do_break
>> -	/*
>> -	 * do_break() may have changed the NV GPRS while handling a =
breakpoint.
>> -	 * If so, we need to restore them with their updated values.
>> -	 */
>> -	REST_NVGPRS(r1)
>> 	b	interrupt_return_srr
>>=20
>>=20
>> @@ -1598,7 +1599,6 @@ EXC_COMMON_BEGIN(alignment_common)
>> 	GEN_COMMON alignment
>> 	addi	r3,r1,STACK_FRAME_OVERHEAD
>> 	bl	alignment_exception
>> -	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
>> 	b	interrupt_return_srr
>>=20
>>=20
>> @@ -1708,7 +1708,6 @@ EXC_COMMON_BEGIN(program_check_common)
>> .Ldo_program_check:
>> 	addi	r3,r1,STACK_FRAME_OVERHEAD
>> 	bl	program_check_exception
>> -	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
>> 	b	interrupt_return_srr
>>=20
>>=20
>> @@ -2139,7 +2138,6 @@ EXC_COMMON_BEGIN(emulation_assist_common)
>> 	GEN_COMMON emulation_assist
>> 	addi	r3,r1,STACK_FRAME_OVERHEAD
>> 	bl	emulation_assist_interrupt
>> -	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
>> 	b	interrupt_return_hsrr
>>=20
>>=20
>> @@ -2457,7 +2455,6 @@ EXC_COMMON_BEGIN(facility_unavailable_common)
>> 	GEN_COMMON facility_unavailable
>> 	addi	r3,r1,STACK_FRAME_OVERHEAD
>> 	bl	facility_unavailable_exception
>> -	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
>> 	b	interrupt_return_srr
>>=20
>>=20
>> @@ -2485,7 +2482,6 @@ EXC_COMMON_BEGIN(h_facility_unavailable_common)
>> 	GEN_COMMON h_facility_unavailable
>> 	addi	r3,r1,STACK_FRAME_OVERHEAD
>> 	bl	facility_unavailable_exception
>> -	REST_NVGPRS(r1) /* XXX Shouldn't be necessary in practice */
>> 	b	interrupt_return_hsrr
>>=20
>>=20
>> @@ -2711,7 +2707,6 @@ EXC_COMMON_BEGIN(altivec_assist_common)
>> 	addi	r3,r1,STACK_FRAME_OVERHEAD
>> #ifdef CONFIG_ALTIVEC
>> 	bl	altivec_assist_exception
>> -	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
>> #else
>> 	bl	unknown_exception
>> #endif
>> diff --git a/arch/powerpc/kernel/interrupt_64.S =
b/arch/powerpc/kernel/interrupt_64.S
>> index ad302ad93433..f9ee93e3a0d3 100644
>> --- a/arch/powerpc/kernel/interrupt_64.S
>> +++ b/arch/powerpc/kernel/interrupt_64.S
>> @@ -432,9 +432,6 @@ interrupt_return_\srr\()_user: /* make backtraces =
match the _kernel variant */
>> _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\()_user)
>> 	addi	r3,r1,STACK_FRAME_OVERHEAD
>> 	bl	interrupt_exit_user_prepare
>> -	cmpdi	r3,0
>> -	bne-	.Lrestore_nvgprs_\srr
>> -.Lrestore_nvgprs_\srr\()_cont:
>> 	std	r1,PACA_EXIT_SAVE_R1(r13) /* save r1 for restart */
>> #ifdef CONFIG_PPC_BOOK3S
>> .Linterrupt_return_\srr\()_user_rst_start:
>> @@ -448,6 +445,7 @@ =
_ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\()_user)
>> 	stb	r11,PACAIRQHAPPENED(r13) # clear out possible HARD_DIS
>>=20
>> .Lfast_user_interrupt_return_\srr\():
>> +	REST_NVGPRS(r1)
>> #ifdef CONFIG_PPC_BOOK3S
>> 	.ifc \srr,srr
>> 	lbz	r4,PACASRR_VALID(r13)
>> @@ -517,10 +515,6 @@ =
ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
>> 	b	.	/* prevent speculative execution */
>> .Linterrupt_return_\srr\()_user_rst_end:
>>=20
>> -.Lrestore_nvgprs_\srr\():
>> -	REST_NVGPRS(r1)
>> -	b	.Lrestore_nvgprs_\srr\()_cont
>> -
>> #ifdef CONFIG_PPC_BOOK3S
>> interrupt_return_\srr\()_user_restart:
>> _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\()_user_restart)
>> @@ -561,6 +555,7 @@ =
_ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\()_kernel)
>> 1:
>>=20
>> .Lfast_kernel_interrupt_return_\srr\():
>> +	REST_NVGPRS(r1)
>> 	cmpdi	cr1,r3,0
>> #ifdef CONFIG_PPC_BOOK3S
>> 	.ifc \srr,srr
>> --=20
>> 2.34.1

