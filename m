Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 517EE7D39C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2019 05:22:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45zbG267ZBzDqnf
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2019 13:22:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45zbCp6JNlzDqn1
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Aug 2019 13:20:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45zbCp3QVrz8shd
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Aug 2019 13:20:54 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45zbCp2QZzz9sNf; Thu,  1 Aug 2019 13:20:54 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 45zbCn444Lz9sNF
 for <linuxppc-dev@ozlabs.org>; Thu,  1 Aug 2019 13:20:52 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x713HHRR011680
 for <linuxppc-dev@ozlabs.org>; Wed, 31 Jul 2019 23:20:49 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2u3nna505s-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Wed, 31 Jul 2019 23:20:49 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <ajd@linux.ibm.com>;
 Thu, 1 Aug 2019 04:20:47 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 1 Aug 2019 04:20:44 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x713KRa139780848
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 1 Aug 2019 03:20:27 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A16AD11C04A;
 Thu,  1 Aug 2019 03:20:43 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4F7D111C058;
 Thu,  1 Aug 2019 03:20:43 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  1 Aug 2019 03:20:43 +0000 (GMT)
Received: from [10.61.2.125] (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id AE788A01FE;
 Thu,  1 Aug 2019 13:20:41 +1000 (AEST)
Subject: Re: [PATCH 1/3] powerpc/spinlocks: Refactor SHARED_PROCESSOR
To: "Christopher M. Riedl" <cmr@informatik.wtf>, linuxppc-dev@ozlabs.org
References: <20190728125438.1550-1-cmr@informatik.wtf>
 <20190728125438.1550-2-cmr@informatik.wtf>
From: Andrew Donnellan <ajd@linux.ibm.com>
Date: Thu, 1 Aug 2019 13:20:41 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190728125438.1550-2-cmr@informatik.wtf>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-AU
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19080103-4275-0000-0000-000003529CE4
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19080103-4276-0000-0000-000038638E1B
Message-Id: <3468d006-63e2-8e20-47d6-fe41de31b14b@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-01_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=674 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908010027
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

On 28/7/19 10:54 pm, Christopher M. Riedl wrote:
> Determining if a processor is in shared processor mode is not a constant
> so don't hide it behind a #define.
> 
> Signed-off-by: Christopher M. Riedl <cmr@informatik.wtf>

This seems aesthetically more right.

Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>

> ---
>   arch/powerpc/include/asm/spinlock.h | 21 +++++++++++++++------
>   1 file changed, 15 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/spinlock.h b/arch/powerpc/include/asm/spinlock.h
> index a47f827bc5f1..8631b0b4e109 100644
> --- a/arch/powerpc/include/asm/spinlock.h
> +++ b/arch/powerpc/include/asm/spinlock.h
> @@ -101,15 +101,24 @@ static inline int arch_spin_trylock(arch_spinlock_t *lock)
>   
>   #if defined(CONFIG_PPC_SPLPAR)
>   /* We only yield to the hypervisor if we are in shared processor mode */
> -#define SHARED_PROCESSOR (lppaca_shared_proc(local_paca->lppaca_ptr))
>   extern void __spin_yield(arch_spinlock_t *lock);
>   extern void __rw_yield(arch_rwlock_t *lock);
>   #else /* SPLPAR */
>   #define __spin_yield(x)	barrier()
>   #define __rw_yield(x)	barrier()
> -#define SHARED_PROCESSOR	0
>   #endif
>   
> +static inline bool is_shared_processor(void)
> +{
> +/* Only server processors have an lppaca struct */
> +#ifdef CONFIG_PPC_BOOK3S
> +	return (IS_ENABLED(CONFIG_PPC_SPLPAR) &&
> +		lppaca_shared_proc(local_paca->lppaca_ptr));
> +#else
> +	return false;
> +#endif
> +}
> +
>   static inline void arch_spin_lock(arch_spinlock_t *lock)
>   {
>   	while (1) {
> @@ -117,7 +126,7 @@ static inline void arch_spin_lock(arch_spinlock_t *lock)
>   			break;
>   		do {
>   			HMT_low();
> -			if (SHARED_PROCESSOR)
> +			if (is_shared_processor())
>   				__spin_yield(lock);
>   		} while (unlikely(lock->slock != 0));
>   		HMT_medium();
> @@ -136,7 +145,7 @@ void arch_spin_lock_flags(arch_spinlock_t *lock, unsigned long flags)
>   		local_irq_restore(flags);
>   		do {
>   			HMT_low();
> -			if (SHARED_PROCESSOR)
> +			if (is_shared_processor())
>   				__spin_yield(lock);
>   		} while (unlikely(lock->slock != 0));
>   		HMT_medium();
> @@ -226,7 +235,7 @@ static inline void arch_read_lock(arch_rwlock_t *rw)
>   			break;
>   		do {
>   			HMT_low();
> -			if (SHARED_PROCESSOR)
> +			if (is_shared_processor())
>   				__rw_yield(rw);
>   		} while (unlikely(rw->lock < 0));
>   		HMT_medium();
> @@ -240,7 +249,7 @@ static inline void arch_write_lock(arch_rwlock_t *rw)
>   			break;
>   		do {
>   			HMT_low();
> -			if (SHARED_PROCESSOR)
> +			if (is_shared_processor())
>   				__rw_yield(rw);
>   		} while (unlikely(rw->lock != 0));
>   		HMT_medium();
> 

-- 
Andrew Donnellan              OzLabs, ADL Canberra
ajd@linux.ibm.com             IBM Australia Limited

