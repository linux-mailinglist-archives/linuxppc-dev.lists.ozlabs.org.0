Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 404E61C908D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 May 2020 16:46:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Hx985ymwzDqXY
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 00:46:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Hwjq1b5WzDqSS
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 May 2020 00:25:51 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 047E6qrf061613; Thu, 7 May 2020 10:25:45 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30ux6eyx0c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 May 2020 10:25:45 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 047E7LFb064544;
 Thu, 7 May 2020 10:25:44 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30ux6eywys-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 May 2020 10:25:44 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 047EPfue004070;
 Thu, 7 May 2020 14:25:43 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma04dal.us.ibm.com with ESMTP id 30s0g7cy8s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 May 2020 14:25:43 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 047EPg1e59245020
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 7 May 2020 14:25:42 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 71DE87805F;
 Thu,  7 May 2020 14:25:42 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 66DBD7805E;
 Thu,  7 May 2020 14:25:40 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.199.52.212])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  7 May 2020 14:25:39 +0000 (GMT)
X-Mailer: emacs 27.0.91 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: Re: [PATCH v2 15/28] powerpc/book3s64/pkeys: Reset userspace AMR
 correctly on exec
In-Reply-To: <20200502112229.545331-16-aneesh.kumar@linux.ibm.com>
References: <20200502112229.545331-1-aneesh.kumar@linux.ibm.com>
 <20200502112229.545331-16-aneesh.kumar@linux.ibm.com>
Date: Thu, 07 May 2020 19:55:37 +0530
Message-ID: <874ksrakke.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-07_09:2020-05-07,
 2020-05-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005070114
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
Cc: linuxram@us.ibm.com, npiggin@gmail.com, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:

> On fork, we inherit from the parent and on exec, we should switch to default_amr values.
>
> Also, avoid changing the AMR register value within the kernel. The kernel now runs with
> different AMR values.
>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/book3s/64/kup.h |  2 ++
>  arch/powerpc/kernel/process.c            | 19 ++++++++++++++++++-
>  arch/powerpc/mm/book3s64/pkeys.c         | 18 ++----------------
>  3 files changed, 22 insertions(+), 17 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/book3s/64/kup.h b/arch/powerpc/include/asm/book3s/64/kup.h
> index 67320a990f3f..fe1818954e51 100644
> --- a/arch/powerpc/include/asm/book3s/64/kup.h
> +++ b/arch/powerpc/include/asm/book3s/64/kup.h
> @@ -171,6 +171,8 @@
>  #include <asm/ptrace.h>
>  
>  extern u64 default_uamor;
> +extern u64 default_amr;
> +extern u64 default_iamr;
>  
>  static inline void kuap_restore_user_amr(struct pt_regs *regs)
>  {
> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
> index 9ef95a1217ef..0ab9a8cf1bcb 100644
> --- a/arch/powerpc/kernel/process.c
> +++ b/arch/powerpc/kernel/process.c
> @@ -1474,7 +1474,25 @@ void arch_setup_new_exec(void)
>  		current->thread.regs = regs - 1;
>  	}
>  
> +#ifdef CONFIG_PPC_MEM_KEYS
> +	current->thread.regs->kuap  = default_amr;
> +	current->thread.regs->kuep  = default_iamr;
> +#endif
> +
>  }
> +#else
> +void arch_setup_new_exec(void)
> +{
> +	/*
> +	 * If we exec out of a kernel thread then thread.regs will not be
> +	 * set.  Do it now.
> +	 */
> +	if (!current->thread.regs) {
> +		struct pt_regs *regs = task_stack_page(current) + THREAD_SIZE;
> +		current->thread.regs = regs - 1;
> +	}
> +}
> +
>  #endif
>  
>  #ifdef CONFIG_PPC64
> @@ -1809,7 +1827,6 @@ void start_thread(struct pt_regs *regs, unsigned long start, unsigned long sp)
>  	current->thread.load_tm = 0;
>  #endif /* CONFIG_PPC_TRANSACTIONAL_MEM */
>  
> -	thread_pkey_regs_init(&current->thread);
>  }
>  EXPORT_SYMBOL(start_thread);
>  
> diff --git a/arch/powerpc/mm/book3s64/pkeys.c b/arch/powerpc/mm/book3s64/pkeys.c
> index 976f65f27324..5012b57af808 100644
> --- a/arch/powerpc/mm/book3s64/pkeys.c
> +++ b/arch/powerpc/mm/book3s64/pkeys.c
> @@ -20,8 +20,8 @@ int  max_pkey;			/* Maximum key value supported */
>   */
>  u32  reserved_allocation_mask;
>  static u32  initial_allocation_mask;   /* Bits set for the initially allocated keys */
> -static u64 default_amr;
> -static u64 default_iamr;
> +u64 default_amr;
> +u64 default_iamr;
>  /* Allow all keys to be modified by default */
>  u64 default_uamor = ~0x0UL;
>  /*
> @@ -387,20 +387,6 @@ void thread_pkey_regs_restore(struct thread_struct *new_thread,
>  		write_uamor(new_thread->uamor);
>  }
>  
> -void thread_pkey_regs_init(struct thread_struct *thread)
> -{
> -	if (!mmu_has_feature(MMU_FTR_PKEY))
> -		return;
> -
> -	thread->amr   = default_amr;
> -	thread->iamr  = default_iamr;
> -	thread->uamor = default_uamor;
> -
> -	write_amr(default_amr);
> -	write_iamr(default_iamr);
> -	write_uamor(default_uamor);
> -}
> -
>  int execute_only_pkey(struct mm_struct *mm)
>  {
>  	if (static_branch_likely(&execute_pkey_disabled))
> -- 
> 2.26.2

Needs this change to fix build error.

---
 arch/powerpc/include/asm/thread_info.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/powerpc/include/asm/thread_info.h b/arch/powerpc/include/asm/thread_info.h
index ca6c97025704..9418dff1cfe1 100644
--- a/arch/powerpc/include/asm/thread_info.h
+++ b/arch/powerpc/include/asm/thread_info.h
@@ -77,10 +77,8 @@ struct thread_info {
 /* how to get the thread information struct from C */
 extern int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src);
 
-#ifdef CONFIG_PPC_BOOK3S_64
 void arch_setup_new_exec(void);
 #define arch_setup_new_exec arch_setup_new_exec
-#endif
 
 #endif /* __ASSEMBLY__ */
 
-- 
2.26.2

