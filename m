Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 856974466D9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 17:18:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hm5Jz35Whz3c4p
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Nov 2021 03:18:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iP88iPRS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=iP88iPRS; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hm5JF6jNyz2ync
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Nov 2021 03:17:33 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A5G7lS5004616
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 5 Nov 2021 16:17:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=6Gh8iDrLZvLI7qFoN9vMuQnOEQJZE93/S5lJvvLWQHc=;
 b=iP88iPRSwZ3ChWqPL5Ns6l3PDGHF0IGJ3yrtfE5rCpaD1aNCL/ofVSE+Dj2jSUuaoCM/
 6Nug9UMRGSGTiQ2rcmRijNFU2Y2wVt40JlHH2kz9WKdN8yG28Sa9Awr4nQEBK7yaevrs
 S8mAnafdRrIC2Fpbgvvs/c7bnXY/ERykUHF1xDjiu2/+yQAsiM5vqNI5XBe56ajJBQ2b
 8paXH3HWO7VG/RrfRj5HT67X8BTA3zi406zchBmY4no1B8xqUZv8QP6WXp2luaYT5P7G
 Ad+d6f3pPaEGWZw0+R+V63FapUUpqNdMzE9SGwr2sx0GGK4ne2F6m1ym6kM/sM3sc9kT XA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3c55cb3tu0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Nov 2021 16:17:30 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1A5G2xov019193
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 5 Nov 2021 16:17:30 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3c55cb3tth-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Nov 2021 16:17:30 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1A5GDkUj003002;
 Fri, 5 Nov 2021 16:17:28 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 3c4t4kxefd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Nov 2021 16:17:28 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1A5GAwPB56099136
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 5 Nov 2021 16:10:58 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EAD3C4C059;
 Fri,  5 Nov 2021 16:17:25 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C81EF4C058;
 Fri,  5 Nov 2021 16:17:25 +0000 (GMT)
Received: from pomme.local (unknown [9.145.172.6])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  5 Nov 2021 16:17:25 +0000 (GMT)
Subject: Re: [PATCH v2 2/5] powerpc/watchdog: Tighten non-atomic
 read-modify-write access
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20211104161057.1255659-1-npiggin@gmail.com>
 <20211104161057.1255659-3-npiggin@gmail.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
Message-ID: <9ec54cd9-37fc-3f09-212b-42fee6664a2e@linux.ibm.com>
Date: Fri, 5 Nov 2021 17:17:25 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211104161057.1255659-3-npiggin@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: CdQPdueN3sSFiekufnPWQL26COwQzF7c
X-Proofpoint-ORIG-GUID: pc0slpwuysNNqGziLfxfZ3ivmAlRxuL_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-05_02,2021-11-03_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111050091
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 04/11/2021 à 17:10, Nicholas Piggin a écrit :
> Most updates to wd_smp_cpus_pending are under lock except the watchdog
> interrupt bit clear.
> 
> This can race with non-atomic RMW updates to the mask under lock, which
> can happen in two instances:
> 
> Firstly, if another CPU detects this one is stuck, removes it from the
> mask, mask becomes empty and is re-filled with non-atomic stores. This
> is okay because it would re-fill the mask with this CPU's bit clear
> anyway (because this CPU is now stuck), so it doesn't matter that the
> bit clear update got "lost". Add a comment for this.
> 
> Secondly, if another CPU detects a different CPU is stuck and removes it
> from the pending mask with a non-atomic store to bytes which also
> include the bit of this CPU. This case can result in the bit clear being
> lost and the end result being the bit is set. This should be so rare it
> hardly matters, but to make things simpler to reason about just avoid
> the non-atomic access for that case.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: Laurent Dufour <ldufour@linux.ibm.com>

> ---
>   arch/powerpc/kernel/watchdog.c | 36 ++++++++++++++++++++++++----------
>   1 file changed, 26 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchdog.c
> index be80071336a4..1d2623230297 100644
> --- a/arch/powerpc/kernel/watchdog.c
> +++ b/arch/powerpc/kernel/watchdog.c
> @@ -131,10 +131,10 @@ static void wd_lockup_ipi(struct pt_regs *regs)
>   	/* Do not panic from here because that can recurse into NMI IPI layer */
>   }
>   
> -static void set_cpumask_stuck(const struct cpumask *cpumask, u64 tb)
> +static bool set_cpu_stuck(int cpu, u64 tb)
>   {
> -	cpumask_or(&wd_smp_cpus_stuck, &wd_smp_cpus_stuck, cpumask);
> -	cpumask_andnot(&wd_smp_cpus_pending, &wd_smp_cpus_pending, cpumask);
> +	cpumask_set_cpu(cpu, &wd_smp_cpus_stuck);
> +	cpumask_clear_cpu(cpu, &wd_smp_cpus_pending);
>   	/*
>   	 * See wd_smp_clear_cpu_pending()
>   	 */
> @@ -144,11 +144,9 @@ static void set_cpumask_stuck(const struct cpumask *cpumask, u64 tb)
>   		cpumask_andnot(&wd_smp_cpus_pending,
>   				&wd_cpus_enabled,
>   				&wd_smp_cpus_stuck);
> +		return true;
>   	}
> -}
> -static void set_cpu_stuck(int cpu, u64 tb)
> -{
> -	set_cpumask_stuck(cpumask_of(cpu), tb);
> +	return false;
>   }
>   
>   static void watchdog_smp_panic(int cpu, u64 tb)
> @@ -177,15 +175,17 @@ static void watchdog_smp_panic(int cpu, u64 tb)
>   		 * get a backtrace on all of them anyway.
>   		 */
>   		for_each_cpu(c, &wd_smp_cpus_pending) {
> +			bool empty;
>   			if (c == cpu)
>   				continue;
> +			/* Take the stuck CPUs out of the watch group */
> +			empty = set_cpu_stuck(c, tb);
>   			smp_send_nmi_ipi(c, wd_lockup_ipi, 1000000);
> +			if (empty)
> +				break;
>   		}
>   	}
>   
> -	/* Take the stuck CPUs out of the watch group */
> -	set_cpumask_stuck(&wd_smp_cpus_pending, tb);
> -
>   	wd_smp_unlock(&flags);
>   
>   	if (sysctl_hardlockup_all_cpu_backtrace)
> @@ -232,6 +232,22 @@ static void wd_smp_clear_cpu_pending(int cpu, u64 tb)
>   		return;
>   	}
>   
> +	/*
> +	 * All other updates to wd_smp_cpus_pending are performed under
> +	 * wd_smp_lock. All of them are atomic except the case where the
> +	 * mask becomes empty and is reset. This will not happen here because
> +	 * cpu was tested to be in the bitmap (above), and a CPU only clears
> +	 * its own bit. _Except_ in the case where another CPU has detected a
> +	 * hard lockup on our CPU and takes us out of the pending mask. So in
> +	 * normal operation there will be no race here, no problem.
> +	 *
> +	 * In the lockup case, this atomic clear-bit vs a store that refills
> +	 * other bits in the accessed word wll not be a problem. The bit clear
> +	 * is atomic so it will not cause the store to get lost, and the store
> +	 * will never set this bit so it will not overwrite the bit clear. The
> +	 * only way for a stuck CPU to return to the pending bitmap is to
> +	 * become unstuck itself.
> +	 */
>   	cpumask_clear_cpu(cpu, &wd_smp_cpus_pending);
>   
>   	/*
> 

