Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6817444577D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Nov 2021 17:49:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HlV3q2PDrz2yfZ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 03:49:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kp2/4qx7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=kp2/4qx7; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HlV352CKcz2y8P
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Nov 2021 03:49:04 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A4Gfc9f017499
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 4 Nov 2021 16:49:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=4MAfsetFBpRjcMO0lpqY0GiSWToSM7JeTQ8x5D+rugk=;
 b=kp2/4qx7C+Q0y/qons5F5z1+bT+9+mgOGl/0J9bgb7UoAzIkVSu7ZvTXWzF0ENHQwoME
 +wN3VGZ6c9IQAw7jgk51N8mKOVMx1fu951nqJnoBYiLekbLAcVYnqPTkhnUBMvTOI6MT
 NGtPrxZqYeOAuRsXch0DXkEMzpGU1UthY4SeboZ2uJoNsCF0P17Nz3teq6jYNjUYlyYV
 3QlCyGxn7YrXKopwzNyQXn1R01MtSZKb0zC02ngLjSA8Jw+vTW9vmUAoP2YpMeHJxBoh
 pNliBP3TCjJ1NDSImUegKFxJM99AK4jbL992rsl5vEZUMHpnx/YoMzIMW8uHft84huxM 5g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c4jj49d1w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Nov 2021 16:49:01 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1A4GgQhN020751
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 4 Nov 2021 16:49:00 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c4jj49cyy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Nov 2021 16:49:00 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1A4GbNvg032173;
 Thu, 4 Nov 2021 16:48:57 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03fra.de.ibm.com with ESMTP id 3c0wpa7pxf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Nov 2021 16:48:57 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1A4GmtB961866326
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 4 Nov 2021 16:48:55 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 05FA952052;
 Thu,  4 Nov 2021 16:48:55 +0000 (GMT)
Received: from pomme.toulouse-blagnac.fr.ibm.com (unknown [9.144.158.191])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id D402552065;
 Thu,  4 Nov 2021 16:48:54 +0000 (GMT)
Subject: Re: [PATCH v2 5/5] powerpc/watchdog: Remove backtrace print from
 unstuck message
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20211104161057.1255659-1-npiggin@gmail.com>
 <20211104161057.1255659-6-npiggin@gmail.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
Message-ID: <1e50adff-1e07-23e9-807b-43f97cab2844@linux.ibm.com>
Date: Thu, 4 Nov 2021 17:48:54 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211104161057.1255659-6-npiggin@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: IwKd9rcwixa_E9InfQeSPY2BU7LhRVwi
X-Proofpoint-ORIG-GUID: jbtM9twL_ei3CUNk8YBI1JhMWhIDZ4aX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-04_05,2021-11-03_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 spamscore=0 clxscore=1015 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 mlxlogscore=999 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111040063
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
> The watchdog unstuck message can't be serialised with other watchdog
> messages because that might prevent watchdog reporting. This removes
> the big backtrace from the unstuck message, which can get mixed with
> other messages and confuse logs, and just prints a single line.

I'm not sure that's a good idea to remove the registers and backtrace here.
I agree that this output may interleaved (and usually it does), but it is also 
providing some good information about the culprit block of code. Usually, it's 
pointing the IRQ release code, and so the IRQ blocking one which are really useful.

I don't have a good way to prevent trace interleaving here, but I think 
interleaved traces are better here than nothing.

Thanks,
Laurent.

> Signed-of-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/kernel/watchdog.c | 6 ------
>   1 file changed, 6 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchdog.c
> index 2444cd10b61a..5f69ba4de1f3 100644
> --- a/arch/powerpc/kernel/watchdog.c
> +++ b/arch/powerpc/kernel/watchdog.c
> @@ -242,16 +242,10 @@ static void wd_smp_clear_cpu_pending(int cpu)
>   {
>   	if (!cpumask_test_cpu(cpu, &wd_smp_cpus_pending)) {
>   		if (unlikely(cpumask_test_cpu(cpu, &wd_smp_cpus_stuck))) {
> -			struct pt_regs *regs = get_irq_regs();
>   			unsigned long flags;
>   
>   			pr_emerg("CPU %d became unstuck TB:%lld\n",
>   				 cpu, get_tb());
> -			print_irqtrace_events(current);
> -			if (regs)
> -				show_regs(regs);
> -			else
> -				dump_stack();
>   
>   			wd_smp_lock(&flags);
>   			cpumask_clear_cpu(cpu, &wd_smp_cpus_stuck);
> 

