Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B434507EC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Nov 2021 16:10:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HtCLj5gGVz2yJM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Nov 2021 02:10:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=b1KpDluy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=b1KpDluy; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HtCKw1f4zz2xY4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Nov 2021 02:10:11 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AFEDPvt011472
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Nov 2021 15:10:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=jkKzR0z+5hnb0CVvCVvhRpK+LDU87ts2ZabuYtgwV/E=;
 b=b1KpDluyItde9SoZ8q1QMWf1Dps7yMCfDJFwK5P2joKo+gGkeGB6A0FU21omym1drIZ/
 QWBsn+VNIJ1NeafQxrprhlrPgHcl/o9uMIUseC1ZVwQFffu4Hgwa9m2Sw3DoX6E73mYa
 Kth3++MPC0fApu2DQdyGeOyW7X+6HD7AV2rV4+RfUg2IiutRBt6zQaaRQe68elCyekh8
 1yDm+JIMHsQYkXRm0XILg4j/PunQYbpbyGaP2/ZpARrJWp/9zV5jW7ZQLTuazB7uPv/+
 E3BYlU9QeKJJRJ7KWOgXzFYoNk4E3ytczT8h35P1wi3fNOzhuGhnMnn898V+1js6of2c bw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cbm00r67d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Nov 2021 15:10:06 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AFDjMHj003134
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Nov 2021 15:10:05 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cbm00r65y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Nov 2021 15:10:05 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AFF02uG006923;
 Mon, 15 Nov 2021 15:10:03 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 3ca4mjf3dg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Nov 2021 15:10:03 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AFFA0uO60490050
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Nov 2021 15:10:00 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1D74752051;
 Mon, 15 Nov 2021 15:10:00 +0000 (GMT)
Received: from [9.144.158.191] (unknown [9.144.158.191])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id ECAD95204E;
 Mon, 15 Nov 2021 15:09:59 +0000 (GMT)
Message-ID: <0b0cffcb-c99a-bad5-5620-9f3ad154b61e@linux.ibm.com>
Date: Mon, 15 Nov 2021 16:09:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: [PATCH v3 1/4] powerpc/watchdog: Fix missed watchdog reset due to
 memory ordering race
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20211110025056.2084347-1-npiggin@gmail.com>
 <20211110025056.2084347-2-npiggin@gmail.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <20211110025056.2084347-2-npiggin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ST5Q0NscZIvZaBmSsOwscn3KtUhUFePd
X-Proofpoint-GUID: hkqfYGogH40BdDcltAll9KB_zuNDmsgX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-15_10,2021-11-15_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 mlxscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111150081
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

Le 10/11/2021 à 03:50, Nicholas Piggin a écrit :
> It is possible for all CPUs to miss the pending cpumask becoming clear,
> and then nobody resetting it, which will cause the lockup detector to
> stop working. It will eventually expire, but watchdog_smp_panic will
> avoid doing anything if the pending mask is clear and it will never be
> reset.
> 
> Order the cpumask clear vs the subsequent test to close this race.
> 
> Add an extra check for an empty pending mask when the watchdog fires and
> finds its bit still clear, to try to catch any other possible races or
> bugs here and keep the watchdog working. The extra test in
> arch_touch_nmi_watchdog is required to prevent the new warning from
> firing off.
> 
> Debugged-by: Laurent Dufour <ldufour@linux.ibm.com>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/kernel/watchdog.c | 41 +++++++++++++++++++++++++++++++++-
>   1 file changed, 40 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchdog.c
> index f9ea0e5357f9..3c60872b6a2c 100644
> --- a/arch/powerpc/kernel/watchdog.c
> +++ b/arch/powerpc/kernel/watchdog.c
> @@ -135,6 +135,10 @@ static void set_cpumask_stuck(const struct cpumask *cpumask, u64 tb)
>   {
>   	cpumask_or(&wd_smp_cpus_stuck, &wd_smp_cpus_stuck, cpumask);
>   	cpumask_andnot(&wd_smp_cpus_pending, &wd_smp_cpus_pending, cpumask);
> +	/*
> +	 * See wd_smp_clear_cpu_pending()
> +	 */
> +	smp_mb();
>   	if (cpumask_empty(&wd_smp_cpus_pending)) {
>   		wd_smp_last_reset_tb = tb;
>   		cpumask_andnot(&wd_smp_cpus_pending,
> @@ -215,13 +219,44 @@ static void wd_smp_clear_cpu_pending(int cpu, u64 tb)
>   
>   			cpumask_clear_cpu(cpu, &wd_smp_cpus_stuck);
>   			wd_smp_unlock(&flags);
> +		} else {
> +			/*
> +			 * The last CPU to clear pending should have reset the
> +			 * watchdog so we generally should not find it empty
> +			 * here if our CPU was clear. However it could happen
> +			 * due to a rare race with another CPU taking the
> +			 * last CPU out of the mask concurrently.
> +			 *
> +			 * We can't add a warning for it. But just in case
> +			 * there is a problem with the watchdog that is causing
> +			 * the mask to not be reset, try to kick it along here.
> +			 */
> +			if (unlikely(cpumask_empty(&wd_smp_cpus_pending)))
> +				goto none_pending;

If I understand correctly, that branch is a security in case the code is not 
working as expected. But I'm really wondering if that's really needed, and we 
will end up with a contention on the watchdog lock while this path should be 
lockless, and I'd say that in most of the case there is nothing to do after 
grabbing that lock. Am I missing something risky here?

>   		}
>   		return;
>   	}
> +
>   	cpumask_clear_cpu(cpu, &wd_smp_cpus_pending);
> +
> +	/*
> +	 * Order the store to clear pending with the load(s) to check all
> +	 * words in the pending mask to check they are all empty. This orders
> +	 * with the same barrier on another CPU. This prevents two CPUs
> +	 * clearing the last 2 pending bits, but neither seeing the other's
> +	 * store when checking if the mask is empty, and missing an empty
> +	 * mask, which ends with a false positive.
> +	 */
> +	smp_mb();
>   	if (cpumask_empty(&wd_smp_cpus_pending)) {
>   		unsigned long flags;
>   
> +none_pending:
> +		/*
> +		 * Double check under lock because more than one CPU could see
> +		 * a clear mask with the lockless check after clearing their
> +		 * pending bits.
> +		 */
>   		wd_smp_lock(&flags);
>   		if (cpumask_empty(&wd_smp_cpus_pending)) {
>   			wd_smp_last_reset_tb = tb;
> @@ -312,8 +347,12 @@ void arch_touch_nmi_watchdog(void)
>   {
>   	unsigned long ticks = tb_ticks_per_usec * wd_timer_period_ms * 1000;
>   	int cpu = smp_processor_id();
> -	u64 tb = get_tb();
> +	u64 tb;
>   
> +	if (!cpumask_test_cpu(cpu, &watchdog_cpumask))
> +		return;
> +
> +	tb = get_tb();
>   	if (tb - per_cpu(wd_timer_tb, cpu) >= ticks) {
>   		per_cpu(wd_timer_tb, cpu) = tb;
>   		wd_smp_clear_cpu_pending(cpu, tb);
> 

