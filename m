Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 558137D0B2B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Oct 2023 11:10:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZBABQ047;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SBf1s1wCDz3cby
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Oct 2023 20:10:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZBABQ047;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SBf0x0W1zz3cBH
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Oct 2023 20:09:36 +1100 (AEDT)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39K8v1AQ025398;
	Fri, 20 Oct 2023 09:09:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=D+NE40gOh2DuvRChiQQ7Qq3zNSpSGT5N3yNtGQBBPSI=;
 b=ZBABQ047mQjZ32PTV+Foyyhu8UYi2ZKP3v6J+baEcRLxcdrDySvJrApOa7N9lTvNKaMO
 RtcmMj+O1x+nplRpuVZf8zuUHbIdaVD2try/pcONWtMzAfeIUa4expJw6vWEVwyGCMM2
 KaF99zWk2P4Fp9aVo3Qe+nmTOlLlH5A0Hhaw8wnXcJKHB+LyYXvhe0uO2fsMrlGOBdo3
 Q7l9nBrhzL2rET9+XlVx7ozgEVirPJLXbhcVRQ+wQt8L9wlZKj7eADkOTqFN3ntXX2sL
 hRA9SVrjPJhyYXmGb6Y4s1nc83uwx/cTj21+YNijNWT2k3MLH9E1WXz8PQnloQPCQq5D rw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tupg3re4t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Oct 2023 09:09:15 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39K8vRhD026304;
	Fri, 20 Oct 2023 09:09:14 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tupg3re41-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Oct 2023 09:09:14 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39K65GoL019458;
	Fri, 20 Oct 2023 09:09:13 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tuc453gtw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Oct 2023 09:09:13 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39K99BRS14877236
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Oct 2023 09:09:11 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 99C6620049;
	Fri, 20 Oct 2023 09:09:11 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ED5C02004D;
	Fri, 20 Oct 2023 09:09:08 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with SMTP;
	Fri, 20 Oct 2023 09:09:08 +0000 (GMT)
Date: Fri, 20 Oct 2023 14:39:08 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 1/6] powerpc/smp: Cache CPU has Asymmetric SMP
Message-ID: <20231020090908.GM2194132@linux.vnet.ibm.com>
References: <20231018163751.2423181-1-srikar@linux.vnet.ibm.com>
 <20231018163751.2423181-2-srikar@linux.vnet.ibm.com>
 <87y1fz5j03.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <87y1fz5j03.fsf@mail.lhotse>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: YsFhDcWNgZFTZf0FTJb0czB0ARw65-_U
X-Proofpoint-GUID: mKTOFAxlWre9NeI5dww9Szq3x3oyhAHq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-20_07,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 clxscore=1015 spamscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310170001 definitions=main-2310200075
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
Reply-To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Valentin Schneider <vschneid@redhat.com>, Peter Zijlstra <peterz@infradead.org>, "ndesaulniers@google.com" <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Rohan McLure <rmclure@linux.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Josh Poimboeuf <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Michael Ellerman <mpe@ellerman.id.au> [2023-10-19 15:33:16]:

> Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
> > Currently cpu feature flag is checked whenever powerpc_smt_flags gets
> > called. This is an unnecessary overhead. CPU_FTR_ASYM_SMT is set based
> > on the processor and all processors will either have this set or will
> > have it unset.
> 
> The cpu_has_feature() test is implemented with a static key.
> 
> So AFAICS this is just replacing one static key with another?
> 

> I see that you use the new static key in subsequent patches. But
> couldn't those just use the existing cpu feature test?
> 

Yes, we can use the existing cpu feature test itself.

> Anyway I'd be interested to see how the generated code differs
> before/after this.
> 
---------------------------->8----------------------------------------------8<------------
Before this change
0000000000000500 <powerpc_smt_flags>:
{
     500:	00 00 4c 3c 	addis   r2,r12,0
     504:	00 00 42 38 	addi    r2,r2,0
     508:	a6 02 08 7c 	mflr    r0
     50c:	01 00 00 48 	bl      50c <powerpc_smt_flags+0xc>
     510:	f8 ff e1 fb 	std     r31,-8(r1)
     514:	91 ff 21 f8 	stdu    r1,-112(r1)
#define JUMP_ENTRY_TYPE		stringify_in_c(FTR_ENTRY_LONG)
#define JUMP_LABEL_NOP_SIZE	4

static __always_inline bool arch_static_branch(struct static_key *key, bool branch)
{
	asm_volatile_goto("1:\n\t"
     518:	00 00 00 60 	nop
		printk_once(KERN_INFO "Enabling Asymmetric SMT scheduling\n");
     51c:	00 00 22 3d 	addis   r9,r2,0
		flags |= SD_ASYM_PACKING;
     520:	80 05 e0 3b 	li      r31,1408
		printk_once(KERN_INFO "Enabling Asymmetric SMT scheduling\n");
     524:	00 00 29 89 	lbz     r9,0(r9)
     528:	00 00 09 2c 	cmpwi   r9,0
     52c:	28 00 82 41 	beq     554 <powerpc_smt_flags+0x54>
}
     530:	70 00 21 38 	addi    r1,r1,112
     534:	b4 07 e3 7f 	extsw   r3,r31
     538:	f8 ff e1 eb 	ld      r31,-8(r1)
     53c:	20 00 80 4e 	blr
	int flags = SD_SHARE_CPUCAPACITY | SD_SHARE_PKG_RESOURCES;
     540:	80 01 e0 3b 	li      r31,384
}
     544:	70 00 21 38 	addi    r1,r1,112
     548:	b4 07 e3 7f 	extsw   r3,r31
     54c:	f8 ff e1 eb 	ld      r31,-8(r1)
     550:	20 00 80 4e 	blr
		printk_once(KERN_INFO "Enabling Asymmetric SMT scheduling\n");
     554:	a6 02 08 7c 	mflr    r0
     558:	00 00 62 3c 	addis   r3,r2,0
     55c:	01 00 20 39 	li      r9,1
     560:	00 00 42 3d 	addis   r10,r2,0
     564:	00 00 63 38 	addi    r3,r3,0
     568:	00 00 2a 99 	stb     r9,0(r10)
     56c:	80 00 01 f8 	std     r0,128(r1)
     570:	01 00 00 48 	bl      570 <powerpc_smt_flags+0x70>
     574:	00 00 00 60 	nop
     578:	80 00 01 e8 	ld      r0,128(r1)
     57c:	a6 03 08 7c 	mtlr    r0
     580:	b0 ff ff 4b 	b       530 <powerpc_smt_flags+0x30>
     584:	00 00 00 60 	nop
     588:	00 00 00 60 	nop
     58c:	00 00 00 60 	nop


post this change.
0000000000000340 <powerpc_smt_flags>:
{
     340:	a6 02 08 7c 	mflr    r0
     344:	01 00 00 48 	bl      344 <powerpc_smt_flags+0x4>
#define JUMP_ENTRY_TYPE		stringify_in_c(FTR_ENTRY_LONG)
#define JUMP_LABEL_NOP_SIZE	4

static __always_inline bool arch_static_branch(struct static_key *key, bool branch)
{
	asm_volatile_goto("1:\n\t"
     348:	00 00 00 60 	nop
	return SD_SHARE_CPUCAPACITY | SD_SHARE_PKG_RESOURCES;
     34c:	80 01 60 38 	li      r3,384
}
     350:	b4 07 63 7c 	extsw   r3,r3
     354:	20 00 80 4e 	blr
     358:	00 00 00 60 	nop
     35c:	00 00 00 60 	nop
		return SD_SHARE_CPUCAPACITY | SD_SHARE_PKG_RESOURCES | SD_ASYM_PACKING;
     360:	80 05 60 38 	li      r3,1408
}
     364:	b4 07 63 7c 	extsw   r3,r3
     368:	20 00 80 4e 	blr
     36c:	00 00 00 60 	nop

---------------------------->8----------------------------------------------8<------------

I think the most of the difference is due to moving pr_info_once to
fixup_topology. Does it make sense to move the pr_info_once to
fixup_topology (which is called less often) from powerpc_smt_flags?

Even though the pr_info_once would probably translate to load + cmp + branch
we could avoid that for each smt_flag call.

So something like

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 5826f5108a12..bc22f775425b 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -993,13 +993,10 @@ static bool shared_caches;
 /* cpumask of CPUs with asymmetric SMT dependency */
 static int powerpc_smt_flags(void)
 {
-	int flags = SD_SHARE_CPUCAPACITY | SD_SHARE_PKG_RESOURCES;
+	if (cpu_has_feature(CPU_FTR_ASYM_SMT)) {
+		return SD_SHARE_CPUCAPACITY | SD_SHARE_PKG_RESOURCES | SD_ASYM_PACKING;
 
-	if (cpu_has_feature(CPU_FTR_ASYM_SMT)) {
-		printk_once(KERN_INFO "Enabling Asymmetric SMT scheduling\n");
-		flags |= SD_ASYM_PACKING;
-	}
-	return flags;
+	return SD_SHARE_CPUCAPACITY | SD_SHARE_PKG_RESOURCES;
 }
 #endif
 
@@ -1687,6 +1684,9 @@ static void __init fixup_topology(void)
 	int i;
 
 #ifdef CONFIG_SCHED_SMT
+	if (cpu_has_feature(CPU_FTR_ASYM_SMT))
+		pr_info_once("Enabling Asymmetric SMT scheduling\n");
+
 	if (has_big_cores) {
 		pr_info("Big cores detected but using small core scheduling\n");
 		powerpc_topology[smt_idx].mask = smallcore_smt_mask;
-- 
Thanks and Regards
Srikar Dronamraju
