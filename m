Return-Path: <linuxppc-dev+bounces-12265-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC1BB58CB4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Sep 2025 06:17:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQpXf6FxKz2yrF;
	Tue, 16 Sep 2025 14:17:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757996274;
	cv=none; b=Rfd2IvXbVhHdCaahlW0rR1FccLB6Y4G24T/Oi8SENmwXUUGMGQD737FiI6lc53+drWtEyBSYsbMXmCvxjqXJAbbhFIrEFwQXkRSOm3/zxGSwdBc10B0JhTjmj+SxvSsumQJrERUw82GfoY1aHL2tBfH4O2DWOWLF8fc9s2ClR9ORJmK8ptOGI1PmCy6/Rii+f4/9MOGp0L2T6rOf1BRe8WCiGaKdhE9jqbBWmI55JDDqnQ4qrfDLrgds98WeqsEJhHmQvC9NioI9iyllUz4MPAuEH7SC/s+P+VxDOaeeRZvFMsgviYTsewvrxwvwuHQKmv7Uhrq2n28RAUypi/Q8Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757996274; c=relaxed/relaxed;
	bh=4F6UvByT7S+F1pTQGc9GqOaJ/R92h1u5yz25FL4ll9s=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=P9BiKymVBcM0F4I8TxwXPf4YBQox6rgznFOHseDt4TsaFuREusQlGS5NapS2hM/kFfd8fVNwbjtm2Wn3Z2mjlFOmekUYrrUOGwWGJjrPBZ2lfFWBIM/30FgdathOIIDHC+RxOZnBEH+CbfAjZtqVLMa+O3xV18ZDL1b35/tjciUom6MZBzVugtWhSpPKKZ8yu7xO3Ffl994QK2SpusJYEHefP4NH4B5E4GOqKpSn9zd06o9gEiGDUdahMI1u26MEjexwms8ppIggxcB1TxTWcxxdkwReu2y1kcRLOrfE6x+Hx3RY/mTJhzKH69ZpoLR4bwcQIGMWp4CR7eO54JfNcw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nUmF0YXb; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nUmF0YXb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQpXd3dPQz2yPd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Sep 2025 14:17:53 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58FI99SN018817;
	Tue, 16 Sep 2025 04:17:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=4F6UvB
	yT7S+F1pTQGc9GqOaJ/R92h1u5yz25FL4ll9s=; b=nUmF0YXbYANEgLcyMdP+HT
	YAN8gRGqaMqsswOP8QD70DpWd/fL6x6/I4PnYg0Y4ytZzKcygaOdNpo5n0613X2I
	9iN/EQ1/MXjnq62LDKyv1COFEd8PcynF8IMTpS71S+FrCzHKEww7L6B0VOTqmOxY
	cRonnVjrVxH+zCQcMKUDdw3UayvtxQdPsBkYcYOUqBVWsqmOLeDOVg7xg0zK9csn
	qeLkYFgEcNTKbKfskyVSeRvRerzoQv03kqfvu6sXfN+z0vK9IB2i6wtfsjftdhc5
	++d+PbP9mnwEgwDv0arXf1z2N0f4dllcrXpi4+6HLtGTsWpjY8A8CIHiACDI13dA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 496gat54gn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Sep 2025 04:17:14 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58G4EN23020499;
	Tue, 16 Sep 2025 04:17:13 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 496gat54fw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Sep 2025 04:17:13 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58G3EQck027349;
	Tue, 16 Sep 2025 04:16:55 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 495men1wwq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Sep 2025 04:16:54 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58G4GpnQ13894028
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Sep 2025 04:16:51 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 02A7620040;
	Tue, 16 Sep 2025 04:16:51 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1966820043;
	Tue, 16 Sep 2025 04:16:38 +0000 (GMT)
Received: from [9.61.35.209] (unknown [9.61.35.209])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 16 Sep 2025 04:16:37 +0000 (GMT)
Message-ID: <589f259e-1db9-4ec2-accc-b27966d09a3e@linux.ibm.com>
Date: Tue, 16 Sep 2025 09:46:36 +0530
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
Subject: Re: [RFC V2 7/8] powerpc: Enable IRQ generic entry/exit path.
To: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>, maddy@linux.ibm.com,
        mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu
References: <20250908210235.137300-2-mchauras@linux.ibm.com>
 <20250908210235.137300-10-mchauras@linux.ibm.com>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
Cc: oleg@redhat.com, kees@kernel.org, luto@amacapital.net, wad@chromium.org,
        deller@gmx.de, ldv@strace.io, macro@orcam.me.uk, charlie@rivosinc.com,
        akpm@linux-foundation.org, bigeasy@linutronix.de,
        ankur.a.arora@oracle.com, naveen@kernel.org,
        thomas.weissschuh@linutronix.de, Jason@zx2c4.com, peterz@infradead.org,
        tglx@linutronix.de, namcao@linutronix.de, kan.liang@linux.intel.com,
        mingo@kernel.org, oliver.upton@linux.dev, mark.barnett@arm.com,
        atrajeev@linux.vnet.ibm.com, rppt@kernel.org, coltonlewis@google.com,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250908210235.137300-10-mchauras@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=BKWzrEQG c=1 sm=1 tr=0 ts=68c8e4ca cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=0PegofB9Ehvu-5fvZ-0A:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: cFHjTyaiwG-2xZoHkKLBrdYb5i7Ajopr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA4NiBTYWx0ZWRfX/MiUy93ScqHQ
 TK/XilKI282VEMPGrs+ZuM83QHIB6c+odFVOzaSltZDqsJIpjfryIufz1yTcRT/C4/Lr1+6iz0U
 81F7xeMJuR6MBTTaB3asQ67YMt5YJuw5O+i4mD0nAdWRysJS6tM3Lp9eyzt2HtNfxtlKsfCtuO6
 L94fTra1/pwZAvCPA7E4GkHGwHsCJ9Jn0WyzYl3pBUuwlktCzlEXIA+ar/9VzbHknBjIlkuu/vv
 /wWt8u1c51HQj41SUVP+nvAFUAJydMHyHfvqm4vuKro+Idn3j33YjfhhYbWE929DurTu3j0/Tfs
 HkN8800Q0G9a6tAkUjX4MBcOizlfy1lfrotFtOxlRQlbUCoQZKUWhbrLQrydfuWp/s0RBT5CSUY
 5L6is53O
X-Proofpoint-ORIG-GUID: huUVE0SOMz9TpgoGifUCpWb_sly1_8Hl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_01,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509150086
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 9/9/25 2:32 AM, Mukesh Kumar Chaurasiya wrote:
> Enable generic entry/exit path for ppc irq.
> 
> Signed-off-by: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
> ---
>   arch/powerpc/Kconfig                    |   1 +
>   arch/powerpc/include/asm/entry-common.h |  93 ++---
>   arch/powerpc/include/asm/interrupt.h    | 492 +++---------------------
>   arch/powerpc/kernel/interrupt.c         |   9 +-
>   arch/powerpc/kernel/interrupt_64.S      |   2 -
>   5 files changed, 92 insertions(+), 505 deletions(-)
> 
								\
> diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
> index f53d432f60870..7bb8a31b24ea7 100644
> --- a/arch/powerpc/kernel/interrupt.c
> +++ b/arch/powerpc/kernel/interrupt.c
> @@ -297,13 +297,8 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs)
>   		/* Returning to a kernel context with local irqs enabled. */
>   		WARN_ON_ONCE(!(regs->msr & MSR_EE));
>   again:
> -		if (need_irq_preemption()) {
> -			/* Return to preemptible kernel context */
> -			if (unlikely(read_thread_flags() & _TIF_NEED_RESCHED)) {
> -				if (preempt_count() == 0)
> -					preempt_schedule_irq();
> -			}
> -		}
> +		if (need_irq_preemption())
> +			irqentry_exit_cond_resched();

irqentry_exit_cond_resched is also called in irqentry_exit. It would be 
better if we can find ways to avoid calling it again.

I see a loop here. But comment says it is not enabling irq again. so the 
loop is bounded. So might be okay to remove cond_resched here. do run
preemptirq, irq tracers to ensure that is case.

Also, what is this "soft_interrupts"?

>   
>   		check_return_regs_valid(regs);
>   
> diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
> index 1ad059a9e2fef..6aa88fe91fb6a 100644
> --- a/arch/powerpc/kernel/interrupt_64.S
> +++ b/arch/powerpc/kernel/interrupt_64.S
> @@ -418,8 +418,6 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\())
>   	beq	interrupt_return_\srr\()_kernel
>   interrupt_return_\srr\()_user: /* make backtraces match the _kernel variant */
>   _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\()_user)
> -	addi	r3,r1,STACK_INT_FRAME_REGS
> -	bl	CFUNC(interrupt_exit_user_prepare)
>   #ifndef CONFIG_INTERRUPT_SANITIZE_REGISTERS
>   	cmpdi	r3,0
>   	bne-	.Lrestore_nvgprs_\srr


