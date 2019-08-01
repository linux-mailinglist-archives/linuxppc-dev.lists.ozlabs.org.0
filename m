Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 826CA7D3A3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2019 05:29:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45zbPN288czDqpK
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2019 13:29:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45zbMb2DqkzDqnf
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Aug 2019 13:27:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45zbMZ6VV0z8swq
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Aug 2019 13:27:38 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45zbMZ5SYGz9sNF; Thu,  1 Aug 2019 13:27:38 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 45zbMZ1tXYz9s00
 for <linuxppc-dev@ozlabs.org>; Thu,  1 Aug 2019 13:27:37 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x713HHEf143663
 for <linuxppc-dev@ozlabs.org>; Wed, 31 Jul 2019 23:27:34 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2u3qu2rpcj-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Wed, 31 Jul 2019 23:27:34 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <ajd@linux.ibm.com>;
 Thu, 1 Aug 2019 04:27:32 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 1 Aug 2019 04:27:31 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x713RU3w31195328
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 1 Aug 2019 03:27:30 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2E730A4040;
 Thu,  1 Aug 2019 03:27:30 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D98B2A4053;
 Thu,  1 Aug 2019 03:27:29 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  1 Aug 2019 03:27:29 +0000 (GMT)
Received: from [10.61.2.125] (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 6D2AEA01FE;
 Thu,  1 Aug 2019 13:27:28 +1000 (AEST)
Subject: Re: [PATCH 2/3] powerpc/spinlocks: Rename SPLPAR-only spinlocks
To: "Christopher M. Riedl" <cmr@informatik.wtf>, linuxppc-dev@ozlabs.org
References: <20190728125438.1550-1-cmr@informatik.wtf>
 <20190728125438.1550-3-cmr@informatik.wtf>
From: Andrew Donnellan <ajd@linux.ibm.com>
Date: Thu, 1 Aug 2019 13:27:28 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190728125438.1550-3-cmr@informatik.wtf>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-AU
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19080103-0008-0000-0000-000003032B8A
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19080103-0009-0000-0000-000022722CBF
Message-Id: <e518948b-a849-051b-79ae-880306c09881@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-01_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=892 adultscore=0 classifier=spam adjust=0 reason=mlx
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
> The __rw_yield and __spin_yield locks only pertain to SPLPAR mode.
> Rename them to make this relationship obvious.
> 
> Signed-off-by: Christopher M. Riedl <cmr@informatik.wtf>

Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>

> ---
>   arch/powerpc/include/asm/spinlock.h | 6 ++++--
>   arch/powerpc/lib/locks.c            | 6 +++---
>   2 files changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/spinlock.h b/arch/powerpc/include/asm/spinlock.h
> index 8631b0b4e109..1e7721176f39 100644
> --- a/arch/powerpc/include/asm/spinlock.h
> +++ b/arch/powerpc/include/asm/spinlock.h
> @@ -101,8 +101,10 @@ static inline int arch_spin_trylock(arch_spinlock_t *lock)
>   
>   #if defined(CONFIG_PPC_SPLPAR)
>   /* We only yield to the hypervisor if we are in shared processor mode */
> -extern void __spin_yield(arch_spinlock_t *lock);
> -extern void __rw_yield(arch_rwlock_t *lock);
> +void splpar_spin_yield(arch_spinlock_t *lock);
> +void splpar_rw_yield(arch_rwlock_t *lock);
> +#define __spin_yield(x) splpar_spin_yield(x)
> +#define __rw_yield(x) splpar_rw_yield(x)
>   #else /* SPLPAR */
>   #define __spin_yield(x)	barrier()
>   #define __rw_yield(x)	barrier()
> diff --git a/arch/powerpc/lib/locks.c b/arch/powerpc/lib/locks.c
> index 6550b9e5ce5f..6440d5943c00 100644
> --- a/arch/powerpc/lib/locks.c
> +++ b/arch/powerpc/lib/locks.c
> @@ -18,7 +18,7 @@
>   #include <asm/hvcall.h>
>   #include <asm/smp.h>
>   
> -void __spin_yield(arch_spinlock_t *lock)
> +void splpar_spin_yield(arch_spinlock_t *lock)
>   {
>   	unsigned int lock_value, holder_cpu, yield_count;
>   
> @@ -36,14 +36,14 @@ void __spin_yield(arch_spinlock_t *lock)
>   	plpar_hcall_norets(H_CONFER,
>   		get_hard_smp_processor_id(holder_cpu), yield_count);
>   }
> -EXPORT_SYMBOL_GPL(__spin_yield);
> +EXPORT_SYMBOL_GPL(splpar_spin_yield);
>   
>   /*
>    * Waiting for a read lock or a write lock on a rwlock...
>    * This turns out to be the same for read and write locks, since
>    * we only know the holder if it is write-locked.
>    */
> -void __rw_yield(arch_rwlock_t *rw)
> +void splpar_rw_yield(arch_rwlock_t *rw)
>   {
>   	int lock_value;
>   	unsigned int holder_cpu, yield_count;
> 

-- 
Andrew Donnellan              OzLabs, ADL Canberra
ajd@linux.ibm.com             IBM Australia Limited

