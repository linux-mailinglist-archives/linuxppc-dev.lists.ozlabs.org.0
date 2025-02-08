Return-Path: <linuxppc-dev+bounces-5983-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D970A2D480
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Feb 2025 08:36:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YqjMY6yLkz2yGM;
	Sat,  8 Feb 2025 18:36:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739000201;
	cv=none; b=RcFGZSiz4IAuyK9srUIStmzNyucxrsvLJzupbkf1VnSEC2aoBKXe18qre2z8nB3HbFIDISNuzn+DfC0sfhIhImpQB6KLJ7EjsxCGBzi0EWVuVK0RlLScPJ1O1Hfna0Hplbep3oea8JJmwsM2dF0O+ZE7tGkGpp801fSP4zXUmpq0pKyY+NYcIzHCd47rinsgoHLNO2iuyXZDjcw/X1D2h8KIDvoBEfY/wwxMcCg3182uXqSdDvWgrp1qzRBwektEQMFv4yDh+0yhJjmHl01FOKGKD4mD9pL/vi7wZKN5cAqa4ZBuqW+bV+w4dfHbDQCxMSq8nIbDYDQ0C3kUYMOk/A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739000201; c=relaxed/relaxed;
	bh=ThbqPUVYfl1tA58Btsg9qQ4QSjuqFi+dzpNMkNcl6Q4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hMXXvBFDJYzjAcl2W7t8FwFrTIIl00JHwetvz/v1IPXtqEq/Uk3qeNGEAcyerJpm7N1NbaCb4gZGoVg0kyaW5QeyJ4VxwdYDccPuDiUXDttOi/i7EwNCR2tV6nBl4UZFBOo6lRb+vxKD3U4e39tgVgX/28e6qJuSkRZ5/o3bBRUgpN+IBRNfAmhnKIcr0NwLu2yYlSxZ4Tla4eZQPCRUnOtD2tW09TcbzEZTg7Yw1Ya4nSDZumXnA+cGS6hH1jje6DUuxnVC2bv6KLRQprmfKTTf60Rc7DkIuBIR3036mbWglzftsor1eTB4vnCNo+UybXjE7Go4RfidHZWEz+pCeg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=J7x8sy3I; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=J7x8sy3I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YqjMY08KPz2yGC
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Feb 2025 18:36:40 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5185Klf7021897;
	Sat, 8 Feb 2025 07:36:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=ThbqPU
	VYfl1tA58Btsg9qQ4QSjuqFi+dzpNMkNcl6Q4=; b=J7x8sy3I29ecI6mZtNOMmx
	3+zP/xeIn58oLELUx+lHFdI/aRK6oMxZhYmkGp8OBvjf/p4wgWHNlMXZqwDt+CNW
	fWjv91WU+I5oQZJjE+DacsBkmAl0MKpyik/8BSD7qgDGv224E3PpWpOltqxbmyw4
	m/pDs5TwusqVDFX/fTTrMyHlXUt8GQyfYmYJMALzys6czRVbkV/wZySvwSN4pysO
	J8RmYZwe+Pz9Ij9bnPwIcEkK0e83//qZnW3F2QEfhsQ/xjhvPTtsi5ZoFFVssBSo
	DR264fKjUuG9KG4uhNvng7U2BEgBqltn+F9p7FqWSb/e01vQ1V3+0A3gRK/DAoVg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44p11c0b83-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Feb 2025 07:36:12 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5187aBTT010237;
	Sat, 8 Feb 2025 07:36:11 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44p11c0b80-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Feb 2025 07:36:11 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5185nGhX006525;
	Sat, 8 Feb 2025 07:36:10 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44hyeky5ur-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Feb 2025 07:36:10 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5187a8p230147296
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 8 Feb 2025 07:36:08 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 99A5520040;
	Sat,  8 Feb 2025 07:36:08 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 95E362004D;
	Sat,  8 Feb 2025 07:36:04 +0000 (GMT)
Received: from [9.39.23.47] (unknown [9.39.23.47])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat,  8 Feb 2025 07:36:04 +0000 (GMT)
Message-ID: <7b51f7de-8e4b-4766-85ca-dee24832c693@linux.ibm.com>
Date: Sat, 8 Feb 2025 13:05:57 +0530
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/9] powerpc: Use preempt_model_str().
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev,
        Ben Segall <bsegall@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
        Mel Gorman <mgorman@suse.de>, Peter Zijlstra <peterz@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Valentin Schneider <vschneid@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Will Deacon <will@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>,
        linuxppc-dev@lists.ozlabs.org
References: <20250203141632.440554-1-bigeasy@linutronix.de>
 <20250203141632.440554-6-bigeasy@linutronix.de>
 <65c6f60d-bb52-48bd-a02c-87ffd2a915d4@csgroup.eu>
 <20250203160103.9DikC9FJ@linutronix.de>
 <51999b8e-61c0-48b7-b744-c83d39e7f311@csgroup.eu>
 <20250204082223.6iNyq_KR@linutronix.de>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20250204082223.6iNyq_KR@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: pi0gybTkFafi5HjxwKL0ShjNjr9t0ZtV
X-Proofpoint-ORIG-GUID: 0aeLtRwpyV5lMlEGvg-TQFK2eCUfh7vs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-08_03,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1011
 adultscore=0 malwarescore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502080059
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 2/4/25 13:52, Sebastian Andrzej Siewior wrote:
> Use preempt_model_str() instead of manually conducting the preemption
> model. Use pr_emerg() instead of printk() to pass a loglevel.

even on powerpc, i see __die ends up calling show_regs_print_info().
Why print it twice?

> 
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Naveen N Rao <naveen@kernel.org>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
> v2…v3:
>    - Use printk() instead of pr_emerg() to remain consistent with the
>      other invocations in terms of printing context.
> 
>   arch/powerpc/kernel/traps.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
> index edf5cabe5dfdb..d6d77d92b3358 100644
> --- a/arch/powerpc/kernel/traps.c
> +++ b/arch/powerpc/kernel/traps.c
> @@ -263,10 +263,10 @@ static int __die(const char *str, struct pt_regs *regs, long err)
>   {
>   	printk("Oops: %s, sig: %ld [#%d]\n", str, err, ++die_counter);
>   
> -	printk("%s PAGE_SIZE=%luK%s%s%s%s%s%s %s\n",
> +	printk("%s PAGE_SIZE=%luK%s %s %s%s%s%s %s\n",
>   	       IS_ENABLED(CONFIG_CPU_LITTLE_ENDIAN) ? "LE" : "BE",
>   	       PAGE_SIZE / 1024, get_mmu_str(),
> -	       IS_ENABLED(CONFIG_PREEMPT) ? " PREEMPT" : "",
> +	       preempt_model_str(),
>   	       IS_ENABLED(CONFIG_SMP) ? " SMP" : "",
>   	       IS_ENABLED(CONFIG_SMP) ? (" NR_CPUS=" __stringify(NR_CPUS)) : "",
>   	       debug_pagealloc_enabled() ? " DEBUG_PAGEALLOC" : "",


