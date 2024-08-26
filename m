Return-Path: <linuxppc-dev+bounces-535-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F27CB95EFBE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2024 13:30:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WspQN4qKMz2xch;
	Mon, 26 Aug 2024 21:30:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724671852;
	cv=none; b=EV/7BQIpXSAg7WUmJpnPHz+v+M40scZqItS6mWhnYJk+vbGkSUPVTO+/TJLFvtsKQY6QpnX95d6F9Gxjp+ynRtYUa5XFmHfibh0t8CZ1RyKtY2K7T8qBSZkGa4nHpFLlC4/pwJaIW2C/8YE2t2c/9AiNIPat09gCzl9wOjcfVVqwhqTxavRfpgXDEOV2x7CHcWPhnQ3o8LNvWZzUtv2pZMbMqRDoe3mD7P3DSuYM/9Wr8OGuZH5kJaNChuVv5QJi2uWxVSTOGW39GeJkaL4cP8uzGkbKf+SfCf6W8TxQeGiHaYw/XzvVhzQ51mQ0nPn2F4CjNg3tQ3i4ek2HcYun8A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724671852; c=relaxed/relaxed;
	bh=ttpy1/JaNbGA4zSXYIvYi6j8MvKhycJrmaqudt0RP7g=;
	h=Received:DKIM-Signature:Received:Received:Received:Received:
	 Received:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-TM-AS-GCONF:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details; b=eUFtKPcN37te5VI9Fp073nRHMYwzd5wcBsR45PC8MOkk50IZbB/ijC54ecTdEUtDVjS4N2C0Yatvr6VFUZdYy6xmSRkTNI3bxTBIERCnGM1h9/4bDY/vZv3CPsLXPJ5olYcBzldpGhtv4ORTURLOQjyzD/3XedM+i8Gh3UJtxk6eX8RR1ep7nzpsZMDUrDi9NZcydG/gO1Lhlv+0zgxpEofsDTOnIgWfZ9jiuo4cKxAl220jSm68c3pWFuoKartg9qsjyOEKeQRja/IrSovRYJo58rzbX9eDmnVzEG9tN5YXxyFG/Ox+YKUc466Um7jGmhajBwE7qB01Nas9hPguQQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rnpZ42gE; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rnpZ42gE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WspQN0Xjmz2xbC
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2024 21:30:51 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47Q7ugZv001314;
	Mon, 26 Aug 2024 11:30:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:mime-version:subject:to:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=pp1; bh=t
	tpy1/JaNbGA4zSXYIvYi6j8MvKhycJrmaqudt0RP7g=; b=rnpZ42gE7zhRqAbVm
	0fEPJNm13D9If/7C0dEqzON2fHvw9RJwZb6cS4+4NCGc1IMz/AKvuBwP2pgmPMY9
	HqxQuL76KCZ3RGQV4Z9q94rVO4cBsPGOuTjmja7oJrlKDXNHaHqUVP8Tk7tEqgw9
	0e/1Pzs9YNpE/DAlT2AY/kfxo2biTDYVjGC03dd7NCKl9a/7Ix2MsIWj9QrxMhtk
	GnbWQaxXNwdqTmldiBNY5V34EJc2/OMYvSTvcxU+IiM/M+PuYEdKmLncmgdEVwBe
	XbMT8E58HtzFi0UMsrVq6v9IVzj1iLSVWH01GTCe7L7zvFbtGov2ScVGhvlUpkYV
	Cg7GA==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 417gr36etg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Aug 2024 11:30:44 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 47Q7aZQs021748;
	Mon, 26 Aug 2024 11:30:43 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 417suu619w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Aug 2024 11:30:43 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 47QBUfMw57278964
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Aug 2024 11:30:41 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8DFCC20043;
	Mon, 26 Aug 2024 11:30:41 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DAAF820040;
	Mon, 26 Aug 2024 11:30:40 +0000 (GMT)
Received: from [9.43.16.37] (unknown [9.43.16.37])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 26 Aug 2024 11:30:40 +0000 (GMT)
Message-ID: <46d95c42-5f41-4dcd-93ea-c5ceea20dcb5@linux.ibm.com>
Date: Mon, 26 Aug 2024 17:00:39 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/pseries: Fix dtl_access_lock to be a rw_semaphore
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
References: <20240819122401.513203-1-mpe@ellerman.id.au>
Content-Language: en-US
From: kajoljain <kjain@linux.ibm.com>
In-Reply-To: <20240819122401.513203-1-mpe@ellerman.id.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ipi3HIARa6EAryjmEOCC79pZT8yWTWY7
X-Proofpoint-ORIG-GUID: ipi3HIARa6EAryjmEOCC79pZT8yWTWY7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-26_08,2024-08-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 bulkscore=0 mlxscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408260087

Hi Michael,
   Thanks for the patch, the patch looks fine to me.

Tested-by: Kajol Jain<kjain@linux.ibm.com>
Reviewed-by: Kajol Jain<kjain@linux.ibm.com>

Thanks,
Kajol Jain

On 8/19/24 17:54, Michael Ellerman wrote:
> The dtl_access_lock needs to be a rw_sempahore, a sleeping lock, because
> the code calls kmalloc() while holding it, which can sleep:
> 
>   # echo 1 > /proc/powerpc/vcpudispatch_stats
>   BUG: sleeping function called from invalid context at include/linux/sched/mm.h:337
>   in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 199, name: sh
>   preempt_count: 1, expected: 0
>   3 locks held by sh/199:
>    #0: c00000000a0743f8 (sb_writers#3){.+.+}-{0:0}, at: vfs_write+0x324/0x438
>    #1: c0000000028c7058 (dtl_enable_mutex){+.+.}-{3:3}, at: vcpudispatch_stats_write+0xd4/0x5f4
>    #2: c0000000028c70b8 (dtl_access_lock){+.+.}-{2:2}, at: vcpudispatch_stats_write+0x220/0x5f4
>   CPU: 0 PID: 199 Comm: sh Not tainted 6.10.0-rc4 #152
>   Hardware name: IBM pSeries (emulated by qemu) POWER9 (raw) 0x4e1202 0xf000005 of:SLOF,HEAD hv:linux,kvm pSeries
>   Call Trace:
>     dump_stack_lvl+0x130/0x148 (unreliable)
>     __might_resched+0x174/0x410
>     kmem_cache_alloc_noprof+0x340/0x3d0
>     alloc_dtl_buffers+0x124/0x1ac
>     vcpudispatch_stats_write+0x2a8/0x5f4
>     proc_reg_write+0xf4/0x150
>     vfs_write+0xfc/0x438
>     ksys_write+0x88/0x148
>     system_call_exception+0x1c4/0x5a0
>     system_call_common+0xf4/0x258
> 
> Fixes: 06220d78f24a ("powerpc/pseries: Introduce rwlock to gatekeep DTLB usage")
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  arch/powerpc/include/asm/dtl.h        | 3 ++-
>  arch/powerpc/platforms/pseries/dtl.c  | 8 ++++----
>  arch/powerpc/platforms/pseries/lpar.c | 8 ++++----
>  3 files changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/dtl.h b/arch/powerpc/include/asm/dtl.h
> index d6f43d149f8d..e21bac6c065c 100644
> --- a/arch/powerpc/include/asm/dtl.h
> +++ b/arch/powerpc/include/asm/dtl.h
> @@ -1,6 +1,7 @@
>  #ifndef _ASM_POWERPC_DTL_H
>  #define _ASM_POWERPC_DTL_H
>  
> +#include <linux/rwsem.h>
>  #include <asm/lppaca.h>
>  #include <linux/spinlock_types.h>
>  
> @@ -35,7 +36,7 @@ struct dtl_entry {
>  #define DTL_LOG_ALL		(DTL_LOG_CEDE | DTL_LOG_PREEMPT | DTL_LOG_FAULT)
>  
>  extern struct kmem_cache *dtl_cache;
> -extern rwlock_t dtl_access_lock;
> +extern struct rw_semaphore dtl_access_lock;
>  
>  extern void register_dtl_buffer(int cpu);
>  extern void alloc_dtl_buffers(unsigned long *time_limit);
> diff --git a/arch/powerpc/platforms/pseries/dtl.c b/arch/powerpc/platforms/pseries/dtl.c
> index 3f1cdccebc9c..ecc04ef8c53e 100644
> --- a/arch/powerpc/platforms/pseries/dtl.c
> +++ b/arch/powerpc/platforms/pseries/dtl.c
> @@ -191,7 +191,7 @@ static int dtl_enable(struct dtl *dtl)
>  		return -EBUSY;
>  
>  	/* ensure there are no other conflicting dtl users */
> -	if (!read_trylock(&dtl_access_lock))
> +	if (!down_read_trylock(&dtl_access_lock))
>  		return -EBUSY;
>  
>  	n_entries = dtl_buf_entries;
> @@ -199,7 +199,7 @@ static int dtl_enable(struct dtl *dtl)
>  	if (!buf) {
>  		printk(KERN_WARNING "%s: buffer alloc failed for cpu %d\n",
>  				__func__, dtl->cpu);
> -		read_unlock(&dtl_access_lock);
> +		up_read(&dtl_access_lock);
>  		return -ENOMEM;
>  	}
>  
> @@ -217,7 +217,7 @@ static int dtl_enable(struct dtl *dtl)
>  	spin_unlock(&dtl->lock);
>  
>  	if (rc) {
> -		read_unlock(&dtl_access_lock);
> +		up_read(&dtl_access_lock);
>  		kmem_cache_free(dtl_cache, buf);
>  	}
>  
> @@ -232,7 +232,7 @@ static void dtl_disable(struct dtl *dtl)
>  	dtl->buf = NULL;
>  	dtl->buf_entries = 0;
>  	spin_unlock(&dtl->lock);
> -	read_unlock(&dtl_access_lock);
> +	up_read(&dtl_access_lock);
>  }
>  
>  /* file interface */
> diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
> index c1d8bee8f701..bb09990eec30 100644
> --- a/arch/powerpc/platforms/pseries/lpar.c
> +++ b/arch/powerpc/platforms/pseries/lpar.c
> @@ -169,7 +169,7 @@ struct vcpu_dispatch_data {
>   */
>  #define NR_CPUS_H	NR_CPUS
>  
> -DEFINE_RWLOCK(dtl_access_lock);
> +DECLARE_RWSEM(dtl_access_lock);
>  static DEFINE_PER_CPU(struct vcpu_dispatch_data, vcpu_disp_data);
>  static DEFINE_PER_CPU(u64, dtl_entry_ridx);
>  static DEFINE_PER_CPU(struct dtl_worker, dtl_workers);
> @@ -463,7 +463,7 @@ static int dtl_worker_enable(unsigned long *time_limit)
>  {
>  	int rc = 0, state;
>  
> -	if (!write_trylock(&dtl_access_lock)) {
> +	if (!down_write_trylock(&dtl_access_lock)) {
>  		rc = -EBUSY;
>  		goto out;
>  	}
> @@ -479,7 +479,7 @@ static int dtl_worker_enable(unsigned long *time_limit)
>  		pr_err("vcpudispatch_stats: unable to setup workqueue for DTL processing\n");
>  		free_dtl_buffers(time_limit);
>  		reset_global_dtl_mask();
> -		write_unlock(&dtl_access_lock);
> +		up_write(&dtl_access_lock);
>  		rc = -EINVAL;
>  		goto out;
>  	}
> @@ -494,7 +494,7 @@ static void dtl_worker_disable(unsigned long *time_limit)
>  	cpuhp_remove_state(dtl_worker_state);
>  	free_dtl_buffers(time_limit);
>  	reset_global_dtl_mask();
> -	write_unlock(&dtl_access_lock);
> +	up_write(&dtl_access_lock);
>  }
>  
>  static ssize_t vcpudispatch_stats_write(struct file *file, const char __user *p,

