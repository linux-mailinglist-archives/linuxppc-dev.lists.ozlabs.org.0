Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CD04D8AD4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Mar 2022 18:31:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KHNqj5qH1z3bNs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Mar 2022 04:31:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QZJF78+R;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=QZJF78+R; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KHNq136Yjz2ymt
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Mar 2022 04:30:36 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22EH2ctp021585
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Mar 2022 17:30:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=WESWI8IUacKVnxJkTAH7pdruuD1uAV1M1b0+iiuvUXo=;
 b=QZJF78+RwzzlGR1CpgMnV9OKp61UXyR89lai4HEDnSooyAYPmjCxACIBvrcrzrS4PzAa
 GY6BaTwHkQ8CG0Cnp9uU6IR6bQm3DrI4fQBPC1FvWykImVqaNKGJ/0N3zznCRjLEUuca
 oEfD3/lapo21AMJYr/lxWjyja/KZs2eovrSEDQor4KtwRGoUlxsGf8VMHr8MWXNGBkkX
 5bskvkMNQ/zg9Q8LH04vF+Ggu3OxCw3iTRnBOSeCHAu4L0Zku/qx2m7GgDqORhbj/NNm
 My47ZXhhFWFwMMN6cCHnSyqaeY5b2N4nicT86ioBpHdMqjnbxVKlxY4g8khxrGdCUQ0m 9Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3et6aex8ea-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Mar 2022 17:30:34 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22EHRQKV010289
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Mar 2022 17:30:34 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3et6aex8dn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 17:30:34 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22EHDIpM004158;
 Mon, 14 Mar 2022 17:30:31 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma05fra.de.ibm.com with ESMTP id 3erk58m1wf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 17:30:31 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22EHUTIU50790804
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Mar 2022 17:30:29 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1217F11C0B1;
 Mon, 14 Mar 2022 17:30:29 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E12C811C0C2;
 Mon, 14 Mar 2022 17:30:28 +0000 (GMT)
Received: from [9.101.4.33] (unknown [9.101.4.33])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 14 Mar 2022 17:30:28 +0000 (GMT)
Message-ID: <a39f804c-bb3d-4842-d035-5a1a685efb27@linux.ibm.com>
Date: Mon, 14 Mar 2022 18:30:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 10/14] powerpc/rtas: replace rtas_call_unlocked with
 raw_rtas_call
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20220308135047.478297-1-npiggin@gmail.com>
 <20220308135047.478297-11-npiggin@gmail.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <20220308135047.478297-11-npiggin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: mJZoh2iFjkSFe1kDDCUwx-vTAGEN5yyJ
X-Proofpoint-ORIG-GUID: qG3RpU1fJyfowEjMmvtg6hEOt_O3RP9i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-14_12,2022-03-14_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 phishscore=0 suspectscore=0 spamscore=0
 mlxlogscore=999 mlxscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203140104
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

On 08/03/2022, 14:50:43, Nicholas Piggin wrote:
> Use the same calling and rets return convention with the raw rtas
> call rather than requiring callers to load and byteswap return
> values out of rtas_args.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Despite a minor comment below
Reviewed-by: Laurent Dufour <ldufour@linux.ibm.com>

> ---
>  arch/powerpc/include/asm/rtas.h              |  4 +-
>  arch/powerpc/kernel/rtas.c                   | 53 +++++++++++---------
>  arch/powerpc/platforms/pseries/hotplug-cpu.c |  2 +-
>  arch/powerpc/platforms/pseries/ras.c         |  7 +--
>  arch/powerpc/xmon/xmon.c                     |  2 +-
>  5 files changed, 33 insertions(+), 35 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
> index 82e5b055fa2a..1014ff140cf8 100644
> --- a/arch/powerpc/include/asm/rtas.h
> +++ b/arch/powerpc/include/asm/rtas.h
> @@ -241,8 +241,8 @@ extern int rtas_token(const char *service);
>  extern int rtas_service_present(const char *service);
>  extern int rtas_call(int token, int, int, int *, ...);
>  int rtas_call_reentrant(int token, int nargs, int nret, int *outputs, ...);
> -void rtas_call_unlocked(struct rtas_args *args, int token, int nargs,
> -			int nret, ...);
> +int raw_rtas_call(struct rtas_args *args, int token,
> +			int nargs, int nret, int *outputs, ...);

Minor, would it be better to keep the "unlocked" suffix to advise that the
rtas lock is not held here?

>  extern void __noreturn rtas_restart(char *cmd);
>  extern void rtas_power_off(void);
>  extern void __noreturn rtas_halt(void);
> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
> index fece066115f0..751a20669669 100644
> --- a/arch/powerpc/kernel/rtas.c
> +++ b/arch/powerpc/kernel/rtas.c
> @@ -123,7 +123,7 @@ static void call_rtas_display_status(unsigned char c)
>  		return;
>  
>  	s = lock_rtas();
> -	rtas_call_unlocked(&rtas.args, 10, 1, 1, NULL, c);
> +	raw_rtas_call(&rtas.args, 10, 1, 1, NULL, c);
>  	unlock_rtas(s);
>  }
>  
> @@ -434,10 +434,9 @@ static char *__fetch_rtas_last_error(char *altbuf)
>  #define get_errorlog_buffer()		NULL
>  #endif
>  
> -
> -static void
> -va_rtas_call_unlocked(struct rtas_args *args, int token, int nargs, int nret,
> -		      va_list list)
> +static int notrace va_raw_rtas_call(struct rtas_args *args, int token,
> +				int nargs, int nret, int *outputs,
> +				va_list list)
>  {
>  	int i;
>  
> @@ -453,21 +452,37 @@ va_rtas_call_unlocked(struct rtas_args *args, int token, int nargs, int nret,
>  		args->rets[i] = 0;
>  
>  	do_enter_rtas(__pa(args));
> +
> +	if (nret > 1 && outputs != NULL) {
> +		for (i = 0; i < nret-1; ++i)
> +			outputs[i] = be32_to_cpu(args->rets[i+1]);
> +	}
> +
> +	return (nret > 0) ? be32_to_cpu(args->rets[0]) : 0;
>  }
>  
> -void rtas_call_unlocked(struct rtas_args *args, int token, int nargs, int nret, ...)
> +/*
> + * Like rtas_call but no kmalloc or printk etc in error handling, so
> + * error won't go through log_error. No tracing, may be called in real mode.
> + * rtas_args must be supplied, and appropriate synchronization for the rtas
> + * call being made has to be performed by the caller.
> + */
> +int notrace raw_rtas_call(struct rtas_args *args, int token,
> +			int nargs, int nret, int *outputs, ...)
>  {
>  	va_list list;
> +	int ret;
>  
> -	va_start(list, nret);
> -	va_rtas_call_unlocked(args, token, nargs, nret, list);
> +	va_start(list, outputs);
> +	ret = va_raw_rtas_call(args, token, nargs, nret, outputs, list);
>  	va_end(list);
> +
> +	return ret;
>  }
>  
>  int rtas_call(int token, int nargs, int nret, int *outputs, ...)
>  {
>  	va_list list;
> -	int i;
>  	unsigned long s;
>  	struct rtas_args *rtas_args;
>  	char *buff_copy = NULL;
> @@ -482,19 +497,14 @@ int rtas_call(int token, int nargs, int nret, int *outputs, ...)
>  	rtas_args = &rtas.args;
>  
>  	va_start(list, outputs);
> -	va_rtas_call_unlocked(rtas_args, token, nargs, nret, list);
> +	ret = va_raw_rtas_call(rtas_args, token, nargs, nret, outputs, list);
>  	va_end(list);
>  
>  	/* A -1 return code indicates that the last command couldn't
>  	   be completed due to a hardware error. */
> -	if (be32_to_cpu(rtas_args->rets[0]) == -1)
> +	if (ret == -1)
>  		buff_copy = __fetch_rtas_last_error(NULL);
>  
> -	if (nret > 1 && outputs != NULL)
> -		for (i = 0; i < nret-1; ++i)
> -			outputs[i] = be32_to_cpu(rtas_args->rets[i+1]);
> -	ret = (nret > 0)? be32_to_cpu(rtas_args->rets[0]): 0;
> -
>  	unlock_rtas(s);
>  
>  	if (buff_copy) {
> @@ -950,7 +960,7 @@ int rtas_call_reentrant(int token, int nargs, int nret, int *outputs, ...)
>  	va_list list;
>  	struct rtas_args *args;
>  	unsigned long flags;
> -	int i, ret = 0;
> +	int ret;
>  
>  	if (!rtas.entry || token == RTAS_UNKNOWN_SERVICE)
>  		return -1;
> @@ -962,16 +972,9 @@ int rtas_call_reentrant(int token, int nargs, int nret, int *outputs, ...)
>  	args = local_paca->rtas_args_reentrant;
>  
>  	va_start(list, outputs);
> -	va_rtas_call_unlocked(args, token, nargs, nret, list);
> +	ret = va_raw_rtas_call(args, token, nargs, nret, outputs, list);
>  	va_end(list);
>  
> -	if (nret > 1 && outputs)
> -		for (i = 0; i < nret - 1; ++i)
> -			outputs[i] = be32_to_cpu(args->rets[i + 1]);
> -
> -	if (nret > 0)
> -		ret = be32_to_cpu(args->rets[0]);
> -
>  	local_irq_restore(flags);
>  	preempt_enable();
>  
> diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
> index b81fc846d99c..17c05650b6b9 100644
> --- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
> +++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
> @@ -53,7 +53,7 @@ static void rtas_stop_self(void)
>  
>  	BUG_ON(rtas_stop_self_token == RTAS_UNKNOWN_SERVICE);
>  
> -	rtas_call_unlocked(&args, rtas_stop_self_token, 0, 1, NULL);
> +	raw_rtas_call(&args, rtas_stop_self_token, 0, 1, NULL);
>  
>  	panic("Alas, I survived.\n");
>  }
> diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/pseries/ras.c
> index 74c9b1b5bc66..b009ed7de1ee 100644
> --- a/arch/powerpc/platforms/pseries/ras.c
> +++ b/arch/powerpc/platforms/pseries/ras.c
> @@ -465,12 +465,7 @@ static void fwnmi_release_errinfo(void)
>  	struct rtas_args rtas_args;
>  	int ret;
>  
> -	/*
> -	 * On pseries, the machine check stack is limited to under 4GB, so
> -	 * args can be on-stack.
> -	 */
> -	rtas_call_unlocked(&rtas_args, ibm_nmi_interlock_token, 0, 1, NULL);
> -	ret = be32_to_cpu(rtas_args.rets[0]);
> +	ret = raw_rtas_call(&rtas_args, ibm_nmi_interlock_token, 0, 1, NULL);
>  	if (ret != 0)
>  		printk(KERN_ERR "FWNMI: nmi-interlock failed: %d\n", ret);
>  }
> diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
> index fd72753e8ad5..6f53e8bccc33 100644
> --- a/arch/powerpc/xmon/xmon.c
> +++ b/arch/powerpc/xmon/xmon.c
> @@ -410,7 +410,7 @@ static inline void disable_surveillance(void)
>  	if (set_indicator_token == RTAS_UNKNOWN_SERVICE)
>  		return;
>  
> -	rtas_call_unlocked(&args, set_indicator_token, 3, 1, NULL,
> +	raw_rtas_call(&args, set_indicator_token, 3, 1, NULL,
>  			   SURVEILLANCE_TOKEN, 0, 0);
>  
>  #endif /* CONFIG_PPC_PSERIES */

