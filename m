Return-Path: <linuxppc-dev+bounces-8494-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AC1AB284A
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 May 2025 15:02:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZwNFP5Bjdz2ySN;
	Sun, 11 May 2025 23:02:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746968569;
	cv=none; b=P2uaCqlZkokkQXS8YWnQhtvW1wYWk+1rC0E12mTwNhDY2Qmr2oPWZYPtpKIfXS8i4/Llc6LnJpfH8AvXs6KzQOmFOU23zqeQDzpIcEqKriyFt9vd2tvpuYSIyelWJdD4zaCncKVeELqLoDQ1LhVzaRo+RQokSCiHrctePKfvJY47b4mWtTz7/kSVyUMYpapiQu72ERjzQB7kID/6USymzVa62NLXGlTslCoLXb4zCuKScjhqeEG9l4bn+pbWB3K5oOq6TpqCwetYfZ5QP8ha+4mKqQRrOKDUbcFcXicR/DtocKzVC2DUJwFbdSc2In514zC3tynVd5wGp1RGutNzRg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746968569; c=relaxed/relaxed;
	bh=lRsMGBGgliqtsMbsbCmUZI8xqPuMQkcLLdVBdd/kjrU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HTfYXpj3hSQYXKEP9JE84FdYCyvbQwGFGp+od5qpe/H9btzngFhNUsrOy8Jhmecwhs1OoOaKpJg76QutInAFbtXcCdUX2eLRY7gMvVYGU2uhYT11RyTTQT9uu2CbQLSoHYdT4rUTjLHY0GpaclelI1iC7YvZ3AEkoPuAa2jOMSNTyEGwdAgn3xa1PHM3PR+NJpSEQffdALU0Bdyv4Hb+WJSHHXokWTVpBkochoFR6b2+/hlVzaUf5b2QGSn8ec5KH50/TOWgL9/aoPjEaCbygn536n5u55CDixP8kNOOyDm3caPeuC4AdvaJwBupsYh7bNZOzetbeo+FQoF9U9SPhw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Hz3IzBnX; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Hz3IzBnX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZwNFN441Qz2ySJ
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 May 2025 23:02:48 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54BBtDHs026348;
	Sun, 11 May 2025 13:02:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=lRsMGB
	GgliqtsMbsbCmUZI8xqPuMQkcLLdVBdd/kjrU=; b=Hz3IzBnXt6Mqe/fkyN6cTj
	8JmAeHuSqENubxJXxpV67IQBOJCkn9+J1Frad81TCbKZgNU0YVx7HsB3LXygm6AI
	Z69+FRyh/5gz79lGEOaiGA9GGs+ipUZA5dck4CqOz5ZknLaAHefLpuS1GhdvxUv1
	eIJO10D84xl7gNCR+lbNZ6pkSNu/7818JX7OSJhh2ipuH2jiSYmXWBrzUE0srAtN
	IdSEE1Bwapgmdsu6FbA5IyrMJ5hKab6r1EAhvI1ZYy9E3+bPvajQbR4MdDDZZm+n
	ivCGUQhL0mLT/Sy7Elz+qXS/ZhjHWPD4iNkCfTe31340MgKDImnKjP6v9cSm+VAw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46jue683pk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 11 May 2025 13:02:38 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54BD2bEI016674;
	Sun, 11 May 2025 13:02:37 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46jue683ph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 11 May 2025 13:02:37 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54B7GUXf026017;
	Sun, 11 May 2025 13:02:37 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46jj4nhr8h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 11 May 2025 13:02:36 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54BD2abG31982290
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 11 May 2025 13:02:36 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ED7EB5804B;
	Sun, 11 May 2025 13:02:35 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E987B58059;
	Sun, 11 May 2025 13:02:29 +0000 (GMT)
Received: from [9.43.84.40] (unknown [9.43.84.40])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 11 May 2025 13:02:28 +0000 (GMT)
Message-ID: <4a2c63a7-4ed2-47c5-b5f7-19e323c267f5@linux.ibm.com>
Date: Sun, 11 May 2025 18:32:25 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Crash in __do_IRQ with gcc 15
To: Paul Mackerras <paulus@ozlabs.org>, linuxppc-dev@lists.ozlabs.org
Cc: Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>
References: <aB6teOoVLWkdvyBu@bruin>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <aB6teOoVLWkdvyBu@bruin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Y1ydlve7tOmbO1lCGCxMJy-hbSXiQqTi
X-Authority-Analysis: v=2.4 cv=TbmWtQQh c=1 sm=1 tr=0 ts=68209fee cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=eGFXJs5vjfo80MZ2b2QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: AGuYN5GFdoa2eJ8u0A0IBC7a-sxxPaqb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTExMDEzMCBTYWx0ZWRfX60/ijruZV/Je kKzIIqkYfjoKtFLvF/CSftw2UpbItdBwEBqpvO+s/vUdYvMRYbd0S3ioGsQ8j3qGhTJRqnRreuF oZ/jbxJ2MvOE36095MWg51BGnznVDWAnconcHYi5MhdxBZp+jhEdu5kBbDJeWY9NzJ0l1OHBhwq
 caL5IPCJjntCKY+GgQIXivbTOsoUihuKwEfPLRFdY1L0axDe1DDMJpRdpddjno/ZR6Ho1HfluJV zw92WLvXolg/h2ymoGD3sVN+mhShlFqvjHWPYXXhqZfu2m9ZUKt1G2quAFgplF7FnYEhW+TdF4e 9LaaEE7nCsRtP8kGPPGxAIubLOYWBgMdxqZvjcYT+PHFIHOclvlaNEe+nh/qTOZTHK2Zj0+seKk
 /9NNtdXzz5EuSC69ZYLz50+vF5wNQtt0xNVw6yowL6iLe3sXOw/uIyiPldkbya6FyAKHFcDV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-11_05,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 spamscore=0 mlxlogscore=486 bulkscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505110130
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 5/10/25 7:05 AM, Paul Mackerras wrote:
> Running Linux on Microwatt with a kernel compiled on an x86-64 system
> running Fedora 42 (using the packaged cross-compiler, i.e. the
> gcc-powerpcle64-linux-gnu package), I'm seeing a crash like this:
> 
> [    0.141591] smp: Bringing up secondary CPUs ...
> [    0.167628] BUG: Unable to handle kernel data access on write at 0xc00a0000be8d6004
> [    0.175409] Faulting instruction address: 0xc00000000000fcb4
> cpu 0x0: Vector: 300 (Data Access) at [c0000000012f78d0]
>     pc: c00000000000fcb4: __do_IRQ+0x64/0x84
>     lr: c00000000000fccc: __do_IRQ+0x7c/0x84
>     sp: c0000000012f7b70
>    msr: 9000000000001033
>    dar: c00a0000be8d6004
>  dsisr: 42000000
>   current = 0xc0000000012de000
>   paca    = 0xc00000000135d000   irqmask: 0x03   irq_happened: 0x01
>     pid   = 0, comm = swapper/0
> Linux version 6.15.0-rc1-00001-g72b73737d483-dirty (paulus@thinks) (powerpc64le-linux-gnu-gcc (GCC) 15.0.1 20250329 (Red Hat Cross 15.0.1-0), GNU ld version 2.44-1.fc42) #5 SMP Thu May  8 22:20:34 AEST 2025
> enter ? for help
> [c0000000012f7b70] c00000000000fd50 do_IRQ+0x7c/0x90 (unreliable)
> [c0000000012f7ba0] c000000000007db4 hardware_interrupt_common_virt+0x1c4/0x1d0
> --- Exception: 500 (Hardware Interrupt) at c00000000001c2ec arch_local_irq_restore+0x60/0xc4
> [c0000000012f7ea0] c000000000083c68 do_idle+0xd4/0xf4
> [c0000000012f7ee0] c000000000083e08 cpu_startup_entry+0x34/0x38
> [c0000000012f7f10] c00000000000cc7c kernel_init+0x0/0x144
> [c0000000012f7f40] c000000001000ecc do_one_initcall+0x0/0x160
> [c0000000012f7fe0] c00000000000ba6c start_here_common+0x1c/0x20
> 0:mon>
> 

Thanks for the debug.

> What's happening is that gcc 15 seems to be using r2 as an ordinary
> register, and r2 has a live value in it at the point where __do_IRQ()
> calls call_do_irq().  Since r2 is not in the clobber list for the
> inline asm in call_do_irq(), it doesn't get saved and restored around
> the call to __do_irq(), and when we come back to __do_IRQ(), it has
> been modified.  Then when __do_IRQ() subsequently does a store using
> r2, it blows up like the above.
> 
> Adding r2 to the clobber list in call_do_irq() fixes it.  Does this
> seem like the right fix?  Does it need to be conditional on the gcc
> version?  Or is there a better way to fix the problem?

I guess if we plan to go with adding r2 to clobber, it has to be gcc 
specific, since my FC41 (gcc 14.1) complains of PIC registers usage
in the clobber list.

inlined from ‘__do_IRQ’ at arch/powerpc/kernel/irq.c:297:3:                              
arch/powerpc/kernel/irq.c:262:9: error: PIC register clobbered by ‘r2’ in ‘asm’              
 262 |         asm volatile (                                                               
     |         ^~~                      

Can you try with this patch, I am testing this in my setup.

Maddy


diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index a0e8b998c9b5..2ce7a4f2b2fb 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -276,7 +276,11 @@ static __always_inline void call_do_irq(struct pt_regs *regs, void *sp)
                   [callee] "i" (__do_irq)
                 : // Clobbers
                   "lr", "xer", "ctr", "memory", "cr0", "cr1", "cr5", "cr6",
+#if __GNUC__ >= 15
+                  "cr7", "r0", "r2", "r4", "r5", "r6", "r7", "r8", "r9", "r10",
+#else
                   "cr7", "r0", "r4", "r5", "r6", "r7", "r8", "r9", "r10",
+#endif
                   "r11", "r12"
        );
 }



> 
> Thanks,
> Paul.
> 


