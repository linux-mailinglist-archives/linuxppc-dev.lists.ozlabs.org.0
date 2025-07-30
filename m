Return-Path: <linuxppc-dev+bounces-10463-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC243B162A9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jul 2025 16:25:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bsZHt0xH3z30Vq;
	Thu, 31 Jul 2025 00:25:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753872417;
	cv=none; b=bjoEbObpkpuMGzCnU9rQ8P70nxcMTkzN09biDRuIxcSTAwgO32Zz2mMn+nm+1jOcwYD4nUKQxLMx1j4SFx7uuNQXslr98/V2m3pRIrI994VGW1PExxrXXS9ZPiiC9nmfbWzDVVkZa03v51b90k1emKP/pWNdCevFep/ppi2zgGRWOF73KCBf+WIg/8jZTOpnnbd+q+CUhpM8RWlOrCBByECYVBpnMquY5LRzxKYPhpNITUIRpulgR1eDvqHb2Fbu7H3dF9kMmbG3hVq4a/FjBJMBjB/WysdwqedQ3GrYPFtcj08qRZ6Ayk6Djev+ODgXN4tun6veBMomyPIdf6YTMg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753872417; c=relaxed/relaxed;
	bh=1z1uP49klDvnz1PCnlN/PgZalSHcJuI+oDjWq743grk=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=MNOMFyEm5oIMpIk3FcJd28rroLZFWEmDoJ2Lcrz91S7+2Br73pBLSgYukXV3fB8CE6Y8VsEKFjPIW6xKsovT5+mw8uNWukMNFmPtl3XRAAYkBtmVKET21QHJj+Sm8UzvLO+oqMVFAiTDML4Uem8jpFV5+uOtFlxJu9O+UsqNitHWvDGrseuNbCo9NXQ2fk2zECMdiPc+vh4ZUzB05mS4ujL5sHBOOyCMaOGdBp+KUxH92gGEGZFcfP5xLKBefqy3CQsaDV31QrORkQaVaTKoLdNIHmK4p8dgzPDa1Ka+hV/CKDKkNVGzGaAqrqWmh6UqGjRtMzF1hb5vb7k6iPgs2g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XiOzldYo; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=samir@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XiOzldYo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=samir@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bsTRh11X5z3091
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Jul 2025 20:46:55 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56U0IOuf008962;
	Wed, 30 Jul 2025 10:46:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=1z1uP4
	9klDvnz1PCnlN/PgZalSHcJuI+oDjWq743grk=; b=XiOzldYoCf7A3Y44MCT27m
	q8MUJmJXEz8QKOrk4fVIFXJrt6sCaw7xlpgKe+qQIaezo/h7yiirJTYhD3UBPKKX
	2akX51QKbKS71bZL3ePqduuhsKQJ0Y5H+kilMUXqdo0QcmC8us7NmZbJwbm/16mY
	qYyvKE6X7H/VXiDp84D96bcqAIXIxjSxf9bYh+Bj3MmIBcX8Ho1ZTTRdS+U04LOD
	xiccWI1OOnA6Ulg0bIqGCNcMr/FfLjHAoH+jx3luD1eERHxDzsNWRHs/ANdijN6v
	6AuLMnwShFHy7sJ3mHeX0j9pzF/xMZgvhPC8uerSlbbupEPrpnEVd9M/wm7S5F+w
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 484qcg45c6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Jul 2025 10:46:40 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 56UAkeDC013479;
	Wed, 30 Jul 2025 10:46:40 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 484qcg45c1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Jul 2025 10:46:40 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 56U6ZGwD016406;
	Wed, 30 Jul 2025 10:46:39 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 485aumpvgu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Jul 2025 10:46:39 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 56UAkcHF9438402
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 30 Jul 2025 10:46:38 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0C1A858063;
	Wed, 30 Jul 2025 10:46:38 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 514A358059;
	Wed, 30 Jul 2025 10:46:37 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.5.196.140])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 30 Jul 2025 10:46:37 +0000 (GMT)
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
Date: Wed, 30 Jul 2025 16:16:36 +0530
From: samir <samir@linux.ibm.com>
To: "Nysal Jan K.A." <nysal@linux.ibm.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman
 <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy
 <christophe.leroy@csgroup.eu>,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc/qspinlock: Add spinlock contention tracepoint
In-Reply-To: <20250725081432.1254986-1-nysal@linux.ibm.com>
References: <20250725081432.1254986-1-nysal@linux.ibm.com>
Message-ID: <7147ea4e429326e76723fd788e44b6f4@linux.ibm.com>
X-Sender: samir@linux.ibm.com
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA3NiBTYWx0ZWRfXwAX79tK09qbW
 5e5+oSGa2/Yw4n2KarCQ2xuyj44KEaALdhUff2413+RkR/1qQKAkYCiAm491OwuxhY6epA+9nWV
 H7CjqHh+Tryl4dZs/jnNSJg+N6sZuixl/a3F+YWi6cu56RX3HYiPQedJqIsqB7ys47rEStT1zPP
 TY5oQD5lMzE0OQVUePwwKQBwFUrPgBnpVH6deRpOmtRSB/3lO3X/HaNVPtgB0Aw980rkAi/6cr1
 93N/Ke8hEHo0ILd8ZchT/azySbG/Ekgj7vuKTlvyvLRLEs5QVRK8mAAxqT3QSuoXJu3owE/BE0o
 TgQq/k+RZ1Mp0Rep3INZNSF3Od+0J9nI7IxW7srNMD6Kn3GcUHgfL5WA9YTuYr/OoTipauEeDzc
 6LR1KfBoF2AAOHeQe8NYTceIQw1s8l3EmfXVw0XSAxWcENDJL9gDzDtzhNoM2dYDjQSKxXF/
X-Proofpoint-ORIG-GUID: nqb4w52MkUjpp6xb-tZ_24uc6Iw1NTz6
X-Authority-Analysis: v=2.4 cv=Lp2Symdc c=1 sm=1 tr=0 ts=6889f810 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=NEAV23lmAAAA:8 a=VnNF1IyMAAAA:8
 a=hfXmp_HCLgfKRUNig1YA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: uj1zfZhl9W3Qyuk1dGZIlUEWUTBXsx9D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_04,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 mlxscore=0 priorityscore=1501
 adultscore=0 clxscore=1011 lowpriorityscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507300076
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2025-07-25 13:44, Nysal Jan K.A. wrote:
> Add a lock contention tracepoint in the queued spinlock slowpath.
> Also add the __lockfunc annotation so that in_lock_functions()
> works as expected.
> 
> Signed-off-by: Nysal Jan K.A. <nysal@linux.ibm.com>
> ---
>  arch/powerpc/lib/qspinlock.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/powerpc/lib/qspinlock.c 
> b/arch/powerpc/lib/qspinlock.c
> index bcc7e4dff8c3..622e7f45c2ce 100644
> --- a/arch/powerpc/lib/qspinlock.c
> +++ b/arch/powerpc/lib/qspinlock.c
> @@ -9,6 +9,7 @@
>  #include <linux/sched/clock.h>
>  #include <asm/qspinlock.h>
>  #include <asm/paravirt.h>
> +#include <trace/events/lock.h>
> 
>  #define MAX_NODES	4
> 
> @@ -708,8 +709,9 @@ static __always_inline void
> queued_spin_lock_mcs_queue(struct qspinlock *lock, b
>  	qnodesp->count--;
>  }
> 
> -void queued_spin_lock_slowpath(struct qspinlock *lock)
> +void __lockfunc queued_spin_lock_slowpath(struct qspinlock *lock)
>  {
> +	trace_contention_begin(lock, LCB_F_SPIN);
>  	/*
>  	 * This looks funny, but it induces the compiler to inline both
>  	 * sides of the branch rather than share code as when the condition
> @@ -718,16 +720,17 @@ void queued_spin_lock_slowpath(struct qspinlock 
> *lock)
>  	if (IS_ENABLED(CONFIG_PARAVIRT_SPINLOCKS) && is_shared_processor()) {
>  		if (try_to_steal_lock(lock, true)) {
>  			spec_barrier();
> -			return;
> +		} else {
> +			queued_spin_lock_mcs_queue(lock, true);
>  		}
> -		queued_spin_lock_mcs_queue(lock, true);
>  	} else {
>  		if (try_to_steal_lock(lock, false)) {
>  			spec_barrier();
> -			return;
> +		} else {
> +			queued_spin_lock_mcs_queue(lock, false);
>  		}
> -		queued_spin_lock_mcs_queue(lock, false);
>  	}
> +	trace_contention_end(lock, 0);
>  }
>  EXPORT_SYMBOL(queued_spin_lock_slowpath);

Hello,

I have verified the patch with the latest upstream Linux kernel, and 
here are my findings:

———Kernel Version———
6.16.0-rc7-160000.11-default+
———perf --version———
perf version 6.16.rc7.g5f33ebd2018c

To test this patch, I used the Lockstorm benchmark, which rigorously 
exercises spinlocks from kernel space.

Benchmark repository: https://github.com/lop-devops/lockstorm
To capture all events related to the Lockstorm benchmark, I used the 
following command:
cmd: perf lock record -a insmod lockstorm.ko
After generating the perf.data, I analyzed the results using:
cmd: perf lock contention -a -i perf.data

————Logs————
contended   total wait     max wait     avg wait         type   caller

    6187241     12.50 m       2.30 ms    121.22 us     spinlock   
kthread+0x160
         78      8.23 ms    209.87 us    105.47 us     rwlock:W   
do_exit+0x378
         71      7.97 ms    208.07 us    112.24 us     spinlock   
do_exit+0x378
         68      4.18 ms    210.04 us     61.43 us     rwlock:W   
release_task+0xe0
         63      3.96 ms    204.02 us     62.90 us     spinlock   
release_task+0xe0
        115    477.15 us     19.69 us      4.15 us     spinlock   
rcu_report_qs_rdp+0x40
        250    437.34 us      5.34 us      1.75 us     spinlock   
raw_spin_rq_lock_nested+0x24
         32    156.32 us     13.56 us      4.88 us     spinlock   
cgroup_exit+0x34
         19     88.12 us     12.20 us      4.64 us     spinlock   
exit_fs+0x44
         12     23.25 us      3.09 us      1.94 us     spinlock   
lock_hrtimer_base+0x4c
          1     18.83 us     18.83 us     18.83 us      rwsem:R   
btrfs_tree_read_lock_nested+0x38
          1     17.84 us     17.84 us     17.84 us      rwsem:W   
btrfs_tree_lock_nested+0x38
         10     15.75 us      5.72 us      1.58 us     spinlock   
raw_spin_rq_lock_nested+0x24
          5     15.08 us      5.59 us      3.02 us     spinlock   
mix_interrupt_randomness+0xb4
          2     12.78 us      9.50 us      4.26 us     spinlock   
raw_spin_rq_lock_nested+0x24
          1     11.13 us     11.13 us     11.13 us     spinlock   
__queue_work+0x338
          3     10.79 us      7.04 us      3.60 us     spinlock   
raw_spin_rq_lock_nested+0x24
          3      8.17 us      4.58 us      2.72 us     spinlock   
raw_spin_rq_lock_nested+0x24
          3      7.99 us      3.13 us      2.66 us     spinlock   
lock_hrtimer_base+0x4c
          2      6.66 us      4.57 us      3.33 us     spinlock   
free_pcppages_bulk+0x50
          3      5.34 us      2.19 us      1.78 us     spinlock   
ibmvscsi_handle_crq+0x1e4
          2      3.71 us      2.32 us      1.85 us     spinlock   
__hrtimer_run_queues+0x1b8
          2      2.98 us      2.19 us      1.49 us     spinlock   
raw_spin_rq_lock_nested+0x24
          1      2.85 us      2.85 us      2.85 us     spinlock   
raw_spin_rq_lock_nested+0x24
          2      2.15 us      1.09 us      1.07 us     spinlock   
raw_spin_rq_lock_nested+0x24
          2      2.06 us      1.06 us      1.03 us     spinlock   
raw_spin_rq_lock_nested+0x24
          1      1.69 us      1.69 us      1.69 us     spinlock   
raw_spin_rq_lock_nested+0x24
          1      1.53 us      1.53 us      1.53 us     spinlock   
__queue_work+0xd8
          1      1.27 us      1.27 us      1.27 us     spinlock   
pull_rt_task+0xa0
          1      1.16 us      1.16 us      1.16 us     spinlock   
raw_spin_rq_lock_nested+0x24
          1       740 ns       740 ns       740 ns     spinlock   
add_device_randomness+0x5c
          1       566 ns       566 ns       566 ns     spinlock   
raw_spin_rq_lock_nested+0x24

 From the results, we were able to observe lock contention specifically 
on spinlocks.

The patch works as expected.
Thank you for the patch!

Tested-by: Samir Mulani <samir@linux.ibm.com>

