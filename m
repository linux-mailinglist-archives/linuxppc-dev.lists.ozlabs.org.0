Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 30405432CE4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Oct 2021 06:47:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HYLnN4mCGz3cQY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Oct 2021 15:47:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LZbidHJ+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=LZbidHJ+; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HYLmd0Wc3z2ynS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Oct 2021 15:46:24 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19J0lkBd030356; 
 Tue, 19 Oct 2021 00:46:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=F3NvIPovc58gvUpLCRwP+4Md0M1oXII9/E8QXzN7mWs=;
 b=LZbidHJ+StCsuocwR0KDtqy1lUQt/+ZKv8a1lnZmkccWPjtNmDbDzBwkEzlQt4eY7fnm
 1yidhqQZgAAnEgDR45o6FE2wLkSHVZQOWIB6btsqR3jXpZir/713WRgTWtWgX7MrGVnr
 v4SHavS/arMwVvOZTLwSM8PpeasQCpbFknfQUiAX9xruwmd8LRoPUzbEaf0D/XAyVOPW
 dhRGpOv5vB5WJbNHEc2vnxzW57KMjC0PapqrZloWQSoo7YRC7dfDVxGL74+kUocaoQiO
 pSctcxCl+xmFZCiTUX2OX/LCjfC9oEB9Dsbp/mJIcOo0PWxlS2JutQnB4B6Tes416T+/ /A== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bsksruab7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Oct 2021 00:46:05 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19J4hrO1030769;
 Tue, 19 Oct 2021 04:46:03 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 3bqpc9mxga-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Oct 2021 04:46:03 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19J4k0v263766790
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Oct 2021 04:46:01 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B3369A405B;
 Tue, 19 Oct 2021 04:46:00 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CD3F0A405C;
 Tue, 19 Oct 2021 04:45:58 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue, 19 Oct 2021 04:45:58 +0000 (GMT)
Date: Tue, 19 Oct 2021 10:15:57 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>
Subject: Re: [PATCH v2] powerpc/smp: do not decrement idle task preempt count
 in CPU offline
Message-ID: <20211019044557.GK2004@linux.vnet.ibm.com>
References: <20211015173902.2278118-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20211015173902.2278118-1-nathanl@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QyzmVIuTEKulrvgkkm_j2sQprhgxj-6Z
X-Proofpoint-ORIG-GUID: QyzmVIuTEKulrvgkkm_j2sQprhgxj-6Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-18_07,2021-10-18_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0
 spamscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 suspectscore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110190026
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
Cc: peterz@infradead.org, linux-kernel@vger.kernel.org, mingo@kernel.org,
 clg@kaod.org, linuxppc-dev@lists.ozlabs.org, valentin.schneider@arm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Nathan Lynch <nathanl@linux.ibm.com> [2021-10-15 12:39:02]:

> With PREEMPT_COUNT=y, when a CPU is offlined and then onlined again, we
> get:
> 
> BUG: scheduling while atomic: swapper/1/0/0x00000000
> no locks held by swapper/1/0.
> CPU: 1 PID: 0 Comm: swapper/1 Not tainted 5.15.0-rc2+ #100
> Call Trace:
>  dump_stack_lvl+0xac/0x108
>  __schedule_bug+0xac/0xe0
>  __schedule+0xcf8/0x10d0
>  schedule_idle+0x3c/0x70
>  do_idle+0x2d8/0x4a0
>  cpu_startup_entry+0x38/0x40
>  start_secondary+0x2ec/0x3a0
>  start_secondary_prolog+0x10/0x14
> 
> This is because powerpc's arch_cpu_idle_dead() decrements the idle task's
> preempt count, for reasons explained in commit a7c2bb8279d2 ("powerpc:
> Re-enable preemption before cpu_die()"), specifically "start_secondary()
> expects a preempt_count() of 0."
> 
> However, since commit 2c669ef6979c ("powerpc/preempt: Don't touch the idle
> task's preempt_count during hotplug") and commit f1a0a376ca0c ("sched/core:
> Initialize the idle task with preemption disabled"), that justification no
> longer holds.
> 
> The idle task isn't supposed to re-enable preemption, so remove the
> vestigial preempt_enable() from the CPU offline path.
> 
> Tested with pseries and powernv in qemu, and pseries on PowerVM.
> 
> Fixes: 2c669ef6979c ("powerpc/preempt: Don't touch the idle task's preempt_count during hotplug")
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
> Reviewed-by: Valentin Schneider <valentin.schneider@arm.com>

Looks good to me.

Reviewed-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>

> ---
> 
> Notes:
>     Changes since v1:
>     
>     - remove incorrect Fixes: tag, add Valentin's r-b.
> 
>  arch/powerpc/kernel/smp.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> index 9cc7d3dbf439..605bab448f84 100644
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -1730,8 +1730,6 @@ void __cpu_die(unsigned int cpu)
> 
>  void arch_cpu_idle_dead(void)
>  {
> -	sched_preempt_enable_no_resched();
> -
>  	/*
>  	 * Disable on the down path. This will be re-enabled by
>  	 * start_secondary() via start_secondary_resume() below
> -- 
> 2.31.1
> 

-- 
Thanks and Regards
Srikar Dronamraju
