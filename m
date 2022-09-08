Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC195B1611
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Sep 2022 09:57:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MNWg3308nz3br9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Sep 2022 17:57:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OWxp6Vyp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OWxp6Vyp;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MNWfH5Cwlz2ywc
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Sep 2022 17:56:23 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2887Kq93005834
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 8 Sep 2022 07:56:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=SoJ5sYA/H6D9Vt3aoi1EqOdj3AFQkYJnTxFkMmetMhg=;
 b=OWxp6VypA3Md53SWgA9csMhVegD3XyQMDerqRa0MxjdFBsFwX3lQ10kxh3q+IaNSLQhq
 DZK1vCCGtvRF04JOBBLLfYn3CBN1TSSvhHggWPVvjjy6ZAzFbFx51hNflAZYK45bDj3J
 v8YbdKP0+R0VUk5jNmfP17eZ2zBWV+SLcissZiYD1LOXMN5PovixoY1wCAEf/47n0v0v
 +WN8VaoJ4FPt++0IBNID4eqGAbsLrdlJk0R80vmC0QOBMzkXZ55EjPGkSXIpMkqaJbeo
 rrCO800Pdwi/q8oc+fUwiUEmBpsy2zlsqY7PGloMtzEMh97JcvinOdl0TXPdHECgQhzH PQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jfbx4920d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Sep 2022 07:56:19 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2887MqeV013498
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 8 Sep 2022 07:56:19 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jfbx491yx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Sep 2022 07:56:19 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2887oC2T016293;
	Thu, 8 Sep 2022 07:56:17 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma04ams.nl.ibm.com with ESMTP id 3jbxj8x7w2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Sep 2022 07:56:17 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2887uEpi34996674
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 8 Sep 2022 07:56:14 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 035DD5204F;
	Thu,  8 Sep 2022 07:56:14 +0000 (GMT)
Received: from [9.145.9.202] (unknown [9.145.9.202])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id C1A6E52051;
	Thu,  8 Sep 2022 07:56:13 +0000 (GMT)
Message-ID: <429708cd-7ae9-10e7-cbb9-3261ac339c8f@linux.ibm.com>
Date: Thu, 8 Sep 2022 09:56:13 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH] Revert "powerpc/rtas: Implement reentrant rtas call"
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20220907220111.223267-1-nathanl@linux.ibm.com>
Content-Language: fr
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <20220907220111.223267-1-nathanl@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: l1L8yoHFXcD0uerAWYuXixMvSfLvAtv0
X-Proofpoint-GUID: P7p54zNBQwhCGcKW3Hs5QyZ1yWtLxLdk
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-08_04,2022-09-07_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015 mlxscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2209080026
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
Cc: leobras.c@gmail.com, haren@linux.ibm.com, tyreld@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 08/09/2022 à 00:01, Nathan Lynch a écrit :
> At the time this was submitted by Leonardo, I confirmed -- or thought
> I had confirmed -- with PowerVM partition firmware development that
> the following RTAS functions:
> 
> - ibm,get-xive
> - ibm,int-off
> - ibm,int-on
> - ibm,set-xive
> 
> were safe to call on multiple CPUs simultaneously, not only with
> respect to themselves as indicated by PAPR, but with arbitrary other
> RTAS calls:
> 
> https://lore.kernel.org/linuxppc-dev/875zcy2v8o.fsf@linux.ibm.com/
> 
> Recent discussion with firmware development makes it clear that this
> is not true, and that the code in commit b664db8e3f97 ("powerpc/rtas:
> Implement reentrant rtas call") is unsafe, likely explaining several
> strange bugs we've seen in internal testing involving DLPAR and
> LPM. These scenarios use ibm,configure-connector, whose internal state
> can be corrupted by the concurrent use of the "reentrant" functions,
> leading to symptoms like endless busy statuses from RTAS.

Thanks, Nathan,
T
his is fixing LPAR hangs I was facing when doing some migration tests.

Reviewed-by: Laurent Dufour <laurent.dufour@fr.ibm.com>

> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
> Fixes: b664db8e3f97 ("powerpc/rtas: Implement reentrant rtas call")
> Cc: stable@vger.kernel.org
> ---
>  arch/powerpc/include/asm/paca.h     |  1 -
>  arch/powerpc/include/asm/rtas.h     |  1 -
>  arch/powerpc/kernel/paca.c          | 32 -----------------
>  arch/powerpc/kernel/rtas.c          | 54 -----------------------------
>  arch/powerpc/sysdev/xics/ics-rtas.c | 22 ++++++------
>  5 files changed, 11 insertions(+), 99 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/paca.h b/arch/powerpc/include/asm/paca.h
> index 4d7aaab82702..3537b0500f4d 100644
> --- a/arch/powerpc/include/asm/paca.h
> +++ b/arch/powerpc/include/asm/paca.h
> @@ -263,7 +263,6 @@ struct paca_struct {
>  	u64 l1d_flush_size;
>  #endif
>  #ifdef CONFIG_PPC_PSERIES
> -	struct rtas_args *rtas_args_reentrant;
>  	u8 *mce_data_buf;		/* buffer to hold per cpu rtas errlog */
>  #endif /* CONFIG_PPC_PSERIES */
>  
> diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
> index 00531af17ce0..56319aea646e 100644
> --- a/arch/powerpc/include/asm/rtas.h
> +++ b/arch/powerpc/include/asm/rtas.h
> @@ -240,7 +240,6 @@ extern struct rtas_t rtas;
>  extern int rtas_token(const char *service);
>  extern int rtas_service_present(const char *service);
>  extern int rtas_call(int token, int, int, int *, ...);
> -int rtas_call_reentrant(int token, int nargs, int nret, int *outputs, ...);
>  void rtas_call_unlocked(struct rtas_args *args, int token, int nargs,
>  			int nret, ...);
>  extern void __noreturn rtas_restart(char *cmd);
> diff --git a/arch/powerpc/kernel/paca.c b/arch/powerpc/kernel/paca.c
> index ba593fd60124..dfd097b79160 100644
> --- a/arch/powerpc/kernel/paca.c
> +++ b/arch/powerpc/kernel/paca.c
> @@ -16,7 +16,6 @@
>  #include <asm/kexec.h>
>  #include <asm/svm.h>
>  #include <asm/ultravisor.h>
> -#include <asm/rtas.h>
>  
>  #include "setup.h"
>  
> @@ -170,30 +169,6 @@ static struct slb_shadow * __init new_slb_shadow(int cpu, unsigned long limit)
>  }
>  #endif /* CONFIG_PPC_64S_HASH_MMU */
>  
> -#ifdef CONFIG_PPC_PSERIES
> -/**
> - * new_rtas_args() - Allocates rtas args
> - * @cpu:	CPU number
> - * @limit:	Memory limit for this allocation
> - *
> - * Allocates a struct rtas_args and return it's pointer,
> - * if not in Hypervisor mode
> - *
> - * Return:	Pointer to allocated rtas_args
> - *		NULL if CPU in Hypervisor Mode
> - */
> -static struct rtas_args * __init new_rtas_args(int cpu, unsigned long limit)
> -{
> -	limit = min_t(unsigned long, limit, RTAS_INSTANTIATE_MAX);
> -
> -	if (early_cpu_has_feature(CPU_FTR_HVMODE))
> -		return NULL;
> -
> -	return alloc_paca_data(sizeof(struct rtas_args), L1_CACHE_BYTES,
> -			       limit, cpu);
> -}
> -#endif /* CONFIG_PPC_PSERIES */
> -
>  /* The Paca is an array with one entry per processor.  Each contains an
>   * lppaca, which contains the information shared between the
>   * hypervisor and Linux.
> @@ -232,10 +207,6 @@ void __init initialise_paca(struct paca_struct *new_paca, int cpu)
>  	/* For now -- if we have threads this will be adjusted later */
>  	new_paca->tcd_ptr = &new_paca->tcd;
>  #endif
> -
> -#ifdef CONFIG_PPC_PSERIES
> -	new_paca->rtas_args_reentrant = NULL;
> -#endif
>  }
>  
>  /* Put the paca pointer into r13 and SPRG_PACA */
> @@ -307,9 +278,6 @@ void __init allocate_paca(int cpu)
>  #endif
>  #ifdef CONFIG_PPC_64S_HASH_MMU
>  	paca->slb_shadow_ptr = new_slb_shadow(cpu, limit);
> -#endif
> -#ifdef CONFIG_PPC_PSERIES
> -	paca->rtas_args_reentrant = new_rtas_args(cpu, limit);
>  #endif
>  	paca_struct_size += sizeof(struct paca_struct);
>  }
> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
> index 693133972294..0b8a858aa847 100644
> --- a/arch/powerpc/kernel/rtas.c
> +++ b/arch/powerpc/kernel/rtas.c
> @@ -43,7 +43,6 @@
>  #include <asm/time.h>
>  #include <asm/mmu.h>
>  #include <asm/topology.h>
> -#include <asm/paca.h>
>  
>  /* This is here deliberately so it's only used in this file */
>  void enter_rtas(unsigned long);
> @@ -932,59 +931,6 @@ void rtas_activate_firmware(void)
>  		pr_err("ibm,activate-firmware failed (%i)\n", fwrc);
>  }
>  
> -#ifdef CONFIG_PPC_PSERIES
> -/**
> - * rtas_call_reentrant() - Used for reentrant rtas calls
> - * @token:	Token for desired reentrant RTAS call
> - * @nargs:	Number of Input Parameters
> - * @nret:	Number of Output Parameters
> - * @outputs:	Array of outputs
> - * @...:	Inputs for desired RTAS call
> - *
> - * According to LoPAR documentation, only "ibm,int-on", "ibm,int-off",
> - * "ibm,get-xive" and "ibm,set-xive" are currently reentrant.
> - * Reentrant calls need their own rtas_args buffer, so not using rtas.args, but
> - * PACA one instead.
> - *
> - * Return:	-1 on error,
> - *		First output value of RTAS call if (nret > 0),
> - *		0 otherwise,
> - */
> -int rtas_call_reentrant(int token, int nargs, int nret, int *outputs, ...)
> -{
> -	va_list list;
> -	struct rtas_args *args;
> -	unsigned long flags;
> -	int i, ret = 0;
> -
> -	if (!rtas.entry || token == RTAS_UNKNOWN_SERVICE)
> -		return -1;
> -
> -	local_irq_save(flags);
> -	preempt_disable();
> -
> -	/* We use the per-cpu (PACA) rtas args buffer */
> -	args = local_paca->rtas_args_reentrant;
> -
> -	va_start(list, outputs);
> -	va_rtas_call_unlocked(args, token, nargs, nret, list);
> -	va_end(list);
> -
> -	if (nret > 1 && outputs)
> -		for (i = 0; i < nret - 1; ++i)
> -			outputs[i] = be32_to_cpu(args->rets[i + 1]);
> -
> -	if (nret > 0)
> -		ret = be32_to_cpu(args->rets[0]);
> -
> -	local_irq_restore(flags);
> -	preempt_enable();
> -
> -	return ret;
> -}
> -
> -#endif /* CONFIG_PPC_PSERIES */
> -
>  /**
>   * get_pseries_errorlog() - Find a specific pseries error log in an RTAS
>   *                          extended event log.
> diff --git a/arch/powerpc/sysdev/xics/ics-rtas.c b/arch/powerpc/sysdev/xics/ics-rtas.c
> index 9e7007f9aca5..f8320f8e5bc7 100644
> --- a/arch/powerpc/sysdev/xics/ics-rtas.c
> +++ b/arch/powerpc/sysdev/xics/ics-rtas.c
> @@ -36,8 +36,8 @@ static void ics_rtas_unmask_irq(struct irq_data *d)
>  
>  	server = xics_get_irq_server(d->irq, irq_data_get_affinity_mask(d), 0);
>  
> -	call_status = rtas_call_reentrant(ibm_set_xive, 3, 1, NULL, hw_irq,
> -					  server, DEFAULT_PRIORITY);
> +	call_status = rtas_call(ibm_set_xive, 3, 1, NULL, hw_irq, server,
> +				DEFAULT_PRIORITY);
>  	if (call_status != 0) {
>  		printk(KERN_ERR
>  			"%s: ibm_set_xive irq %u server %x returned %d\n",
> @@ -46,7 +46,7 @@ static void ics_rtas_unmask_irq(struct irq_data *d)
>  	}
>  
>  	/* Now unmask the interrupt (often a no-op) */
> -	call_status = rtas_call_reentrant(ibm_int_on, 1, 1, NULL, hw_irq);
> +	call_status = rtas_call(ibm_int_on, 1, 1, NULL, hw_irq);
>  	if (call_status != 0) {
>  		printk(KERN_ERR "%s: ibm_int_on irq=%u returned %d\n",
>  			__func__, hw_irq, call_status);
> @@ -68,7 +68,7 @@ static void ics_rtas_mask_real_irq(unsigned int hw_irq)
>  	if (hw_irq == XICS_IPI)
>  		return;
>  
> -	call_status = rtas_call_reentrant(ibm_int_off, 1, 1, NULL, hw_irq);
> +	call_status = rtas_call(ibm_int_off, 1, 1, NULL, hw_irq);
>  	if (call_status != 0) {
>  		printk(KERN_ERR "%s: ibm_int_off irq=%u returned %d\n",
>  			__func__, hw_irq, call_status);
> @@ -76,8 +76,8 @@ static void ics_rtas_mask_real_irq(unsigned int hw_irq)
>  	}
>  
>  	/* Have to set XIVE to 0xff to be able to remove a slot */
> -	call_status = rtas_call_reentrant(ibm_set_xive, 3, 1, NULL, hw_irq,
> -					  xics_default_server, 0xff);
> +	call_status = rtas_call(ibm_set_xive, 3, 1, NULL, hw_irq,
> +				xics_default_server, 0xff);
>  	if (call_status != 0) {
>  		printk(KERN_ERR "%s: ibm_set_xive(0xff) irq=%u returned %d\n",
>  			__func__, hw_irq, call_status);
> @@ -108,7 +108,7 @@ static int ics_rtas_set_affinity(struct irq_data *d,
>  	if (hw_irq == XICS_IPI || hw_irq == XICS_IRQ_SPURIOUS)
>  		return -1;
>  
> -	status = rtas_call_reentrant(ibm_get_xive, 1, 3, xics_status, hw_irq);
> +	status = rtas_call(ibm_get_xive, 1, 3, xics_status, hw_irq);
>  
>  	if (status) {
>  		printk(KERN_ERR "%s: ibm,get-xive irq=%u returns %d\n",
> @@ -126,8 +126,8 @@ static int ics_rtas_set_affinity(struct irq_data *d,
>  	pr_debug("%s: irq %d [hw 0x%x] server: 0x%x\n", __func__, d->irq,
>  		 hw_irq, irq_server);
>  
> -	status = rtas_call_reentrant(ibm_set_xive, 3, 1, NULL,
> -				     hw_irq, irq_server, xics_status[1]);
> +	status = rtas_call(ibm_set_xive, 3, 1, NULL,
> +			   hw_irq, irq_server, xics_status[1]);
>  
>  	if (status) {
>  		printk(KERN_ERR "%s: ibm,set-xive irq=%u returns %d\n",
> @@ -158,7 +158,7 @@ static int ics_rtas_check(struct ics *ics, unsigned int hw_irq)
>  		return -EINVAL;
>  
>  	/* Check if RTAS knows about this interrupt */
> -	rc = rtas_call_reentrant(ibm_get_xive, 1, 3, status, hw_irq);
> +	rc = rtas_call(ibm_get_xive, 1, 3, status, hw_irq);
>  	if (rc)
>  		return -ENXIO;
>  
> @@ -174,7 +174,7 @@ static long ics_rtas_get_server(struct ics *ics, unsigned long vec)
>  {
>  	int rc, status[2];
>  
> -	rc = rtas_call_reentrant(ibm_get_xive, 1, 3, status, vec);
> +	rc = rtas_call(ibm_get_xive, 1, 3, status, vec);
>  	if (rc)
>  		return -1;
>  	return status[0];

