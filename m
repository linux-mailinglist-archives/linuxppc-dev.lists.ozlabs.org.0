Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ED29E197D08
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 15:35:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rYPf4gWLzDqdw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 00:35:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bala24@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rYKR26fnzDqdV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 00:32:10 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02UD3R4X080773
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Mar 2020 09:32:07 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3022nmaquy-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Mar 2020 09:32:07 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bala24@linux.ibm.com>;
 Mon, 30 Mar 2020 14:32:03 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 30 Mar 2020 14:31:59 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02UDW0c946530604
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 30 Mar 2020 13:32:00 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 05D624C04A;
 Mon, 30 Mar 2020 13:32:00 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 27E714C044;
 Mon, 30 Mar 2020 13:31:58 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.88.242])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 30 Mar 2020 13:31:57 +0000 (GMT)
Subject: Re: [PATCH v5 03/13] powerpc/ptrace: drop unnecessary #ifdefs
 CONFIG_PPC64
From: Balamuruhan S <bala24@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@c-s.fr>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael
 Ellerman <mpe@ellerman.id.au>, mikey@neuling.org
Date: Mon, 30 Mar 2020 19:01:56 +0530
In-Reply-To: <af38b87a7e1e3efe4f9b664eaeb029e6e7d69fdb.1582848567.git.christophe.leroy@c-s.fr>
References: <cover.1582848567.git.christophe.leroy@c-s.fr>
 <af38b87a7e1e3efe4f9b664eaeb029e6e7d69fdb.1582848567.git.christophe.leroy@c-s.fr>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20033013-0028-0000-0000-000003EEB596
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20033013-0029-0000-0000-000024B4344E
Message-Id: <16b3ca310e6f5efb1ba1380e3ff80a1beea5a267.camel@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-30_01:2020-03-27,
 2020-03-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 malwarescore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003300125
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2020-02-28 at 00:14 +0000, Christophe Leroy wrote:
> Drop a bunch of #ifdefs CONFIG_PPC64 that are not vital.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> ---
>  arch/powerpc/include/asm/ptrace.h   |  2 ++
>  arch/powerpc/kernel/ptrace/ptrace.c | 18 +++---------------
>  2 files changed, 5 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/ptrace.h
> b/arch/powerpc/include/asm/ptrace.h
> index ee3ada66deb5..8e1953d99353 100644
> --- a/arch/powerpc/include/asm/ptrace.h
> +++ b/arch/powerpc/include/asm/ptrace.h
> @@ -276,6 +276,8 @@ static inline unsigned long
> regs_get_kernel_stack_nth(struct pt_regs *regs,
>  #endif /* __ASSEMBLY__ */
>  
>  #ifndef __powerpc64__
> +/* We need PT_SOFTE defined at all time to avoid #ifdefs */
> +#define PT_SOFTE PT_MQ
>  #else /* __powerpc64__ */
>  #define PT_FPSCR32 (PT_FPR0 + 2*32 + 1)	/* each FP reg occupies 2 32-
> bit userspace slots */
>  #define PT_VR0_32 164	/* each Vector reg occupies 4 slots in 32-bit
> */
> diff --git a/arch/powerpc/kernel/ptrace/ptrace.c
> b/arch/powerpc/kernel/ptrace/ptrace.c
> index 7ed54dbb2d7e..3dd94c296ac7 100644
> --- a/arch/powerpc/kernel/ptrace/ptrace.c
> +++ b/arch/powerpc/kernel/ptrace/ptrace.c
> @@ -274,17 +274,15 @@ int ptrace_get_reg(struct task_struct *task, int regno,
> unsigned long *data)
>  	if (regno == PT_DSCR)
>  		return get_user_dscr(task, data);
>  
> -#ifdef CONFIG_PPC64
>  	/*
>  	 * softe copies paca->irq_soft_mask variable state. Since irq_soft_mask
> is
>  	 * no more used as a flag, lets force usr to alway see the softe value
> as 1
>  	 * which means interrupts are not soft disabled.
>  	 */
> -	if (regno == PT_SOFTE) {
> +	if (IS_ENABLED(CONFIG_PPC64) && regno == PT_SOFTE) {
>  		*data = 1;
>  		return  0;
>  	}
> -#endif
>  
>  	regs_max = sizeof(struct user_pt_regs) / sizeof(unsigned long);
>  	if (regno < regs_max) {
> @@ -1998,7 +1996,6 @@ static const struct user_regset_view
> user_ppc_native_view = {
>  	.regsets = native_regsets, .n = ARRAY_SIZE(native_regsets)
>  };
>  
> -#ifdef CONFIG_PPC64

should we care for this ? 

/*
 * These are the regset flavors matching the CONFIG_PPC32 native set.
 */
static const struct user_regset compat_regsets[] = {
        [REGSET_GPR] = {
                .core_note_type = NT_PRSTATUS, .n = ELF_NGREG,
                .size = sizeof(compat_long_t), .align = sizeof(compat_long_t),
                .get = gpr32_get, .set = gpr32_set
        },
        [REGSET_FPR] = {
                .core_note_type = NT_PRFPREG, .n = ELF_NFPREG,
                .size = sizeof(double), .align = sizeof(double),
                .get = fpr_get, .set = fpr_set
        },

>  #include <linux/compat.h>

can we move it to head if we do not need the ifdef ?

rest looks good to me.

-- Bala

>  
>  static int gpr32_get_common(struct task_struct *target,
> @@ -2272,14 +2269,11 @@ static const struct user_regset_view
> user_ppc_compat_view = {
>  	.name = "ppc", .e_machine = EM_PPC, .ei_osabi = ELF_OSABI,
>  	.regsets = compat_regsets, .n = ARRAY_SIZE(compat_regsets)
>  };
> -#endif	/* CONFIG_PPC64 */
>  
>  const struct user_regset_view *task_user_regset_view(struct task_struct
> *task)
>  {
> -#ifdef CONFIG_PPC64
> -	if (test_tsk_thread_flag(task, TIF_32BIT))
> +	if (IS_ENABLED(CONFIG_PPC64) && test_tsk_thread_flag(task, TIF_32BIT))
>  		return &user_ppc_compat_view;
> -#endif
>  	return &user_ppc_native_view;
>  }
>  
> @@ -3063,11 +3057,7 @@ long arch_ptrace(struct task_struct *child, long
> request,
>  		else
>  			dbginfo.num_data_bps = 0;
>  		dbginfo.num_condition_regs = 0;
> -#ifdef CONFIG_PPC64
> -		dbginfo.data_bp_alignment = 8;
> -#else
> -		dbginfo.data_bp_alignment = 4;
> -#endif
> +		dbginfo.data_bp_alignment = sizeof(long);
>  		dbginfo.sizeof_condition = 0;
>  #ifdef CONFIG_HAVE_HW_BREAKPOINT
>  		dbginfo.features = PPC_DEBUG_FEATURE_DATA_BP_RANGE;
> @@ -3304,12 +3294,10 @@ long do_syscall_trace_enter(struct pt_regs *regs)
>  	if (unlikely(test_thread_flag(TIF_SYSCALL_TRACEPOINT)))
>  		trace_sys_enter(regs, regs->gpr[0]);
>  
> -#ifdef CONFIG_PPC64
>  	if (!is_32bit_task())
>  		audit_syscall_entry(regs->gpr[0], regs->gpr[3], regs->gpr[4],
>  				    regs->gpr[5], regs->gpr[6]);
>  	else
> -#endif
>  		audit_syscall_entry(regs->gpr[0],
>  				    regs->gpr[3] & 0xffffffff,
>  				    regs->gpr[4] & 0xffffffff,

