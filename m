Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F6B3EED0A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Aug 2021 15:07:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GprsJ1zb0z309w
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Aug 2021 23:07:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VKogKsNP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=VKogKsNP; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GprrX14sJz2yhd
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Aug 2021 23:06:19 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17HD3jCW079080
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Aug 2021 09:06:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=2Rx4WIs0V3ylC4IFhK53hrlINt1aqtNkKFc1w2SJ8R4=;
 b=VKogKsNPbE2PqZd/cwwP3qmfzsPVuNWcmMPs+E9bncBm55FQ6nBKiq8g25P+Vfq0UHsm
 gLMCXLDHMJYXYlQOKV6apdacB1JZI+Zr3bUk+Mr8Jr/dhCkSSwY49EtUBy0rBJ2b9hvW
 d/uPIAh/7DE59QzSqcEoAvMJZXMqGQ96+eWl1GloImAiTz0HNCd8HPgmXdOx0yTURQ18
 r11YEUybdwj0Hx4UUcfxL1FcoRYfdsAsrsjX7yxMooku1UDYqBsFRIzzJ1NZbZ5TQ49n
 nfn6uCt7ucEWkAjM//xha/AAin6y2xJFr572P94zazPJpo/maqvfDD0eW9M7pCrztsCl 2w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3aeuf6814j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Aug 2021 09:06:14 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17HD49hN082195
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Aug 2021 09:06:13 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3aeuf6813j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Aug 2021 09:06:13 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17HD2HOj013819;
 Tue, 17 Aug 2021 13:06:11 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06fra.de.ibm.com with ESMTP id 3ae53hc9u9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Aug 2021 13:06:11 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17HD69fC55443754
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Aug 2021 13:06:09 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EC1B711C04A;
 Tue, 17 Aug 2021 13:06:08 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1937D11C073;
 Tue, 17 Aug 2021 13:06:08 +0000 (GMT)
Received: from Madhavan.PrimaryTP (unknown [9.85.82.99])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 17 Aug 2021 13:06:07 +0000 (GMT)
Subject: Re: [PATCH v1 2/4] powerpc/64s/perf: add power_pmu_running to query
 whether perf is being used
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20210816072953.1165964-1-npiggin@gmail.com>
 <20210816072953.1165964-3-npiggin@gmail.com>
From: Madhavan Srinivasan <maddy@linux.ibm.com>
Message-ID: <2e3108d7-8d11-d204-c605-fe51cd361586@linux.ibm.com>
Date: Tue, 17 Aug 2021 18:36:07 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210816072953.1165964-3-npiggin@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9UvfSxtfflRpUADeowSIifoaEOJ6jCn9
X-Proofpoint-ORIG-GUID: bbjTgLb7PkvWRVD_5WAPdwSF9mQ_jr77
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-17_04:2021-08-17,
 2021-08-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015
 mlxscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108170078
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 8/16/21 12:59 PM, Nicholas Piggin wrote:
> Interrupt handling code would like to know whether perf is enabled, to
> know whether it should enable MSR[EE] to improve PMI coverage.
>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/include/asm/hw_irq.h |  2 ++
>   arch/powerpc/perf/core-book3s.c   | 13 +++++++++++++
>   2 files changed, 15 insertions(+)
>
> diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm/hw_irq.h
> index 21cc571ea9c2..2d5c0d3ccbb6 100644
> --- a/arch/powerpc/include/asm/hw_irq.h
> +++ b/arch/powerpc/include/asm/hw_irq.h
> @@ -306,6 +306,8 @@ static inline bool lazy_irq_pending_nocheck(void)
>   	return __lazy_irq_pending(local_paca->irq_happened);
>   }
>   
> +bool power_pmu_running(void);
> +
>   /*
>    * This is called by asynchronous interrupts to conditionally
>    * re-enable hard interrupts after having cleared the source
> diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
> index bb0ee716de91..76114a9afb2b 100644
> --- a/arch/powerpc/perf/core-book3s.c
> +++ b/arch/powerpc/perf/core-book3s.c
> @@ -2380,6 +2380,19 @@ static void perf_event_interrupt(struct pt_regs *regs)
>   	perf_sample_event_took(sched_clock() - start_clock);
>   }
>   
> +bool power_pmu_running(void)
> +{
> +	struct cpu_hw_events *cpuhw;
> +
> +	/* Could this simply test local_paca->pmcregs_in_use? */
> +
> +	if (!ppmu)
> +		return false;


This covers only when perf platform driver is not registered,
but we should also check for MMCR0[32], since pmu sprs can be
accessed via sysfs.

Maddy


> +
> +	cpuhw = this_cpu_ptr(&cpu_hw_events);
> +	return cpuhw->n_events;
> +}
> +
>   static int power_pmu_prepare_cpu(unsigned int cpu)
>   {
>   	struct cpu_hw_events *cpuhw = &per_cpu(cpu_hw_events, cpu);
