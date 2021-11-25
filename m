Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CA645DF94
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 18:22:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0Pp767hQz305Z
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 04:22:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CPtrdKpm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=CPtrdKpm; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0Pn46JKYz3bX0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Nov 2021 04:21:44 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1APEFkwC002779
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 17:21:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=k6tm4MKDsxbbDf0ydZtcrjCXQx4vwa87opWEN5P6rpY=;
 b=CPtrdKpmvQTL8WFMHZjPtc8mHuP/9Umlb0aagDn6RoJO7LouYF8SzqA64okaCsKCv5Nd
 SMEpTqzqe4+vLctODCwMGVdKSdbNtAy7j/iTLaue7ZouS4Q0dQr0t/vEM+75pF0TzQnR
 e7kMiCxI7OgnjQyb1O7BAgxojocOQJuNdJqIr7yCMTvTO1grbo08CL0AQfRZaWWzGPdo
 q3dd0JBmb9tsRnt41Dk6WBZiYmnZmJu7zvUjiSlimutYW3NoDJacCpqWweA57tGqPNnc
 TeXDLLbZRCaVgRIWbw831i80R1YbixYJErMYktock+AHSfTVIWe/+OE89H7UZGkQ2D7k 2A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3chxxh2fjm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 17:21:41 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1APGrO7O024733
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 17:21:41 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3chxxh2fjb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Nov 2021 17:21:41 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1APHHOq6007242;
 Thu, 25 Nov 2021 17:21:39 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3cer9kd58v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Nov 2021 17:21:39 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1APHLbPi33816946
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Nov 2021 17:21:37 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5E0F311C052;
 Thu, 25 Nov 2021 17:21:37 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3ED5411C04C;
 Thu, 25 Nov 2021 17:21:37 +0000 (GMT)
Received: from [9.145.31.81] (unknown [9.145.31.81])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 25 Nov 2021 17:21:37 +0000 (GMT)
Message-ID: <f8d08f56-29b7-5a17-9e64-5ac36731b9df@linux.ibm.com>
Date: Thu, 25 Nov 2021 18:21:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [PATCH] powerpc/watchdog: Fix wd_smp_last_reset_tb reporting
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20211125103346.1188958-1-npiggin@gmail.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <20211125103346.1188958-1-npiggin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: qJGDXnoN7rGBg5NdIUfVD9xYLOyL1_6x
X-Proofpoint-ORIG-GUID: Dtt1uSjbLqJJ00Fnmh5Ua8CLpkXrYVj3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-25_06,2021-11-25_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 spamscore=0 bulkscore=0 mlxscore=0 phishscore=0
 mlxlogscore=999 suspectscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2111250093
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

On 25/11/2021, 11:33:46, Nicholas Piggin wrote:
> wd_smp_last_reset_tb now gets reset by watchdog_smp_panic() as part of
> marking CPUs stuck and removing them from the pending mask before it
> begins any printing. This causes last reset times reported to be off.
> 
> Fix this by reading it into a local variable before it gets reset.
> 
> Fixes: 76521c4b0291 ("powerpc/watchdog: Avoid holding wd_smp_lock over printk and smp_send_nmi_ipi")
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
> 
> This is the delta for patches 1-4 between v3 and v4 of the series which
> is the result of fixing the bug in patch 3. Sending because v3 got
> merged into powerpc next

What about the 5th patch in the v4 series titled "[PATCH v4 5/5]
powerpc/watchdog: help remote CPUs to flush NMI printk output"?


> Thanks,
> Nick
> 
>  arch/powerpc/kernel/watchdog.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchdog.c
> index b6533539386b..23745af38d62 100644
> --- a/arch/powerpc/kernel/watchdog.c
> +++ b/arch/powerpc/kernel/watchdog.c
> @@ -179,13 +179,14 @@ static void watchdog_smp_panic(int cpu)
>  {
>  	static cpumask_t wd_smp_cpus_ipi; // protected by reporting
>  	unsigned long flags;
> -	u64 tb;
> +	u64 tb, last_reset;
>  	int c;
>  
>  	wd_smp_lock(&flags);
>  	/* Double check some things under lock */
>  	tb = get_tb();
> -	if ((s64)(tb - wd_smp_last_reset_tb) < (s64)wd_smp_panic_timeout_tb)
> +	last_reset = wd_smp_last_reset_tb;
> +	if ((s64)(tb - last_reset) < (s64)wd_smp_panic_timeout_tb)
>  		goto out;
>  	if (cpumask_test_cpu(cpu, &wd_smp_cpus_pending))
>  		goto out;
> @@ -210,8 +211,7 @@ static void watchdog_smp_panic(int cpu)
>  	pr_emerg("CPU %d detected hard LOCKUP on other CPUs %*pbl\n",
>  		 cpu, cpumask_pr_args(&wd_smp_cpus_ipi));
>  	pr_emerg("CPU %d TB:%lld, last SMP heartbeat TB:%lld (%lldms ago)\n",
> -		 cpu, tb, wd_smp_last_reset_tb,
> -		 tb_to_ns(tb - wd_smp_last_reset_tb) / 1000000);
> +		 cpu, tb, last_reset, tb_to_ns(tb - last_reset) / 1000000);
>  
>  	if (!sysctl_hardlockup_all_cpu_backtrace) {
>  		/*
> 

