Return-Path: <linuxppc-dev+bounces-288-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D05BA95A7C1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 00:26:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wq1CM2M9Hz2xjh;
	Thu, 22 Aug 2024 08:26:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Rx1Zem8B;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nysal@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WpvZd6bDCz2yFK
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 04:12:57 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47LG0C5J011200;
	Wed, 21 Aug 2024 18:12:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date
	:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=pp1; bh=2mX23SCRhjLN3nb7l21EMXRinMT
	5R8wXV+cJqggUMMM=; b=Rx1Zem8B+L1ppRNh56xEv5G6OtUHv0/EY/wH0Tj5A9S
	uzldybcDd73lNTcs9xpzyYmxDVLkCA9SCoO8NyVyMdB9IyRFWd/wo7TyjZHqqrS6
	avIhMKVHKedx+I1vgQ6HnHxT+PJqBI3TfaiOvlOmxDTIX/YAsS7FPjr+unoabcHv
	IuEEJslKgGmpPDFRBxubcLeR0+VArL6Q0DcihHyQtPNwpK/k+xAQeTJn/Jbt1Rv9
	bw2BXzYorfRAxxvfWEnKEm4gAfk52/GNlM+9RHYDiyQdnxfYNU/IIBzgV3WPFGi3
	y0jHfdsy6S6tEyK7cf/tdl7oZvE/R605aQ4W9ayFEbw==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 412mc4ugat-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Aug 2024 18:12:49 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 47LHXSwD029389;
	Wed, 21 Aug 2024 18:12:48 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4138dmgsxw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Aug 2024 18:12:48 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 47LICh5R31851208
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Aug 2024 18:12:45 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5C04620043;
	Wed, 21 Aug 2024 18:12:43 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BA14720040;
	Wed, 21 Aug 2024 18:12:42 +0000 (GMT)
Received: from localhost (unknown [9.43.101.58])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 21 Aug 2024 18:12:42 +0000 (GMT)
Date: Wed, 21 Aug 2024 23:42:41 +0530
From: "Nysal Jan K.A." <nysal@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org, kjain@linux.ibm.com
Subject: Re: [PATCH] powerpc/pseries: Fix dtl_access_lock to be a rw_semaphore
Message-ID: <dbig653tn4c5d2qrnwixxrltrmhpwvmrkivvazcs5p4sqjuh4u@vz7dkar72nux>
References: <20240819122401.513203-1-mpe@ellerman.id.au>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240819122401.513203-1-mpe@ellerman.id.au>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: dc_wAdirI6-lwzhYjXPk_MnKHoOnNVt8
X-Proofpoint-GUID: dc_wAdirI6-lwzhYjXPk_MnKHoOnNVt8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-21_11,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 clxscore=1011 priorityscore=1501 mlxlogscore=999 adultscore=0 phishscore=0
 impostorscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408210132

On Mon, Aug 19, 2024 at 10:24:01PM GMT, Michael Ellerman wrote:

<snip>

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

The above include is redundant now and can be removed.

Reviewed-by: Nysal Jan K.A <nysal@linux.ibm.com>

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
> -- 
> 2.46.0
> 
> 

