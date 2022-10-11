Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4205FB49C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Oct 2022 16:31:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mmyrk3wt6z3bgC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Oct 2022 01:31:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DWnICvFO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DWnICvFO;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mmyqk3LgSz2xZ7
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Oct 2022 01:30:26 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29BEBTVT027128;
	Tue, 11 Oct 2022 14:30:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Os2RaEbQ9GVITBvDxwys+IihW6sILyr8NFRDg+QzZLo=;
 b=DWnICvFOytCU2VVpehzTqxYsC+XhS8FZrp2Vw9SnpNmNVg7Orqz52gqRQlHBG2CthLJK
 5DrSWtf3M4Eg1GIX0yUGLWzdM/oARHC3ekF3998w/nKtEBK+SAvFKk8+ZlbtGVWt+t3n
 hSqsdrleikoELBL5Tp9iuXMaeyro6Vh7+FjrE539NoiSjvTZ3sU9OZPN4etaFXRYIZfe
 WXWq5RpBVP1E6CeZWJZtKUQlbLQpEZ6+RMLyc9lm7yB0Pcee1DHEaqz59DCTozihyv4e
 +i9imiCwKSNEhSrgRiIIikqCGvkK6qU+8DPa4SfR3TNvd8rV92sznGm2OSUcUtqG0n22 VA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k54d0uk64-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Oct 2022 14:30:17 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29BEC5UB032310;
	Tue, 11 Oct 2022 14:30:16 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k54d0uk3w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Oct 2022 14:30:16 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29BELuBi013090;
	Tue, 11 Oct 2022 14:30:14 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma03fra.de.ibm.com with ESMTP id 3k30u9bch5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Oct 2022 14:30:14 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29BEUB566292096
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Oct 2022 14:30:11 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D3369AE053;
	Tue, 11 Oct 2022 14:30:11 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 27B13AE04D;
	Tue, 11 Oct 2022 14:30:11 +0000 (GMT)
Received: from [9.171.47.225] (unknown [9.171.47.225])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 11 Oct 2022 14:30:11 +0000 (GMT)
Message-ID: <83377974-a28a-c581-60ea-c8c70b1b1973@linux.ibm.com>
Date: Tue, 11 Oct 2022 16:30:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v3] powerpc/pseries/vas: Add VAS IRQ primary handler
To: Haren Myneni <haren@linux.ibm.com>, mpe@ellerman.id.au, npiggin@gmail.com,
        linuxppc-dev@lists.ozlabs.org
References: <aaad8813b4762a6753cfcd0b605a7574a5192ec7.camel@linux.ibm.com>
Content-Language: en-US
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <aaad8813b4762a6753cfcd0b605a7574a5192ec7.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ug50Q4nKonLHSw3ayO1UyrxDKnPeAJbE
X-Proofpoint-ORIG-GUID: 2PGNz0LNXStI0yDu8iCViKGHvcHxmlwq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-11_08,2022-10-11_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 mlxscore=0
 spamscore=0 mlxlogscore=999 phishscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210110077
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 10/10/2022 05:41, Haren Myneni wrote:
> 
> irq_default_primary_handler() can be used only with IRQF_ONESHOT
> flag, but the flag disables IRQ before executing the thread handler
> and enables it after the interrupt is handled. But this IRQ disable
> sets the VAS IRQ OFF state in the hypervisor. In case if NX faults
> during this window, the hypervisor will not deliver the fault
> interrupt to the partition and the user space may wait continuously
> for the CSB update. So use VAS specific IRQ handler instead of
> calling the default primary handler.
> 
> Increment pending_faults counter in IRQ handler and the bottom
> thread handler will process all faults based on this counter.
> In case if the another interrupt is received while the thread is
> running, it will be processed using this counter. The synchronization
> of top and bottom handlers will be done with IRQTF_RUNTHREAD flag
> and will re-enter to bottom half if this flag is set.
> 
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> ---


That version looks good to me.
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>

   Fred


> v3: Update pending_faults usage in changelog
> v2: Use the pending_faults counter for the second interrupt and
>      process it with the previous interrupt handling if its thread
>      handler is executing.
> 
>   arch/powerpc/platforms/pseries/vas.c | 40 +++++++++++++++++++++++-----
>   arch/powerpc/platforms/pseries/vas.h |  1 +
>   2 files changed, 34 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
> index 1a2cbc156e8f..70f26efcc35a 100644
> --- a/arch/powerpc/platforms/pseries/vas.c
> +++ b/arch/powerpc/platforms/pseries/vas.c
> @@ -200,16 +200,41 @@ static irqreturn_t pseries_vas_fault_thread_fn(int irq, void *data)
>   	struct vas_user_win_ref *tsk_ref;
>   	int rc;
>   
> -	rc = h_get_nx_fault(txwin->vas_win.winid, (u64)virt_to_phys(&crb));
> -	if (!rc) {
> -		tsk_ref = &txwin->vas_win.task_ref;
> -		vas_dump_crb(&crb);
> -		vas_update_csb(&crb, tsk_ref);
> +	while (atomic_read(&txwin->pending_faults)) {
> +		rc = h_get_nx_fault(txwin->vas_win.winid, (u64)virt_to_phys(&crb));
> +		if (!rc) {
> +			tsk_ref = &txwin->vas_win.task_ref;
> +			vas_dump_crb(&crb);
> +			vas_update_csb(&crb, tsk_ref);
> +		}
> +		atomic_dec(&txwin->pending_faults);
>   	}
>   
>   	return IRQ_HANDLED;
>   }
>   
> +/*
> + * irq_default_primary_handler() can be used only with IRQF_ONESHOT
> + * which disables IRQ before executing the thread handler and enables
> + * it after. But this disabling interrupt sets the VAS IRQ OFF
> + * state in the hypervisor. If the NX generates fault interrupt
> + * during this window, the hypervisor will not deliver this
> + * interrupt to the LPAR. So use VAS specific IRQ handler instead
> + * of calling the default primary handler.
> + */
> +static irqreturn_t pseries_vas_irq_handler(int irq, void *data)
> +{
> +	struct pseries_vas_window *txwin = data;
> +
> +	/*
> +	 * The thread hanlder will process this interrupt if it is
> +	 * already running.
> +	 */
> +	atomic_inc(&txwin->pending_faults);
> +
> +	return IRQ_WAKE_THREAD;
> +}
> +
>   /*
>    * Allocate window and setup IRQ mapping.
>    */
> @@ -240,8 +265,9 @@ static int allocate_setup_window(struct pseries_vas_window *txwin,
>   		goto out_irq;
>   	}
>   
> -	rc = request_threaded_irq(txwin->fault_virq, NULL,
> -				  pseries_vas_fault_thread_fn, IRQF_ONESHOT,
> +	rc = request_threaded_irq(txwin->fault_virq,
> +				  pseries_vas_irq_handler,
> +				  pseries_vas_fault_thread_fn, 0,
>   				  txwin->name, txwin);
>   	if (rc) {
>   		pr_err("VAS-Window[%d]: Request IRQ(%u) failed with %d\n",
> diff --git a/arch/powerpc/platforms/pseries/vas.h b/arch/powerpc/platforms/pseries/vas.h
> index 333ffa2f9f42..a2cb12a31c17 100644
> --- a/arch/powerpc/platforms/pseries/vas.h
> +++ b/arch/powerpc/platforms/pseries/vas.h
> @@ -132,6 +132,7 @@ struct pseries_vas_window {
>   	u64 flags;
>   	char *name;
>   	int fault_virq;
> +	atomic_t pending_faults; /* Number of pending faults */
>   };
>   
>   int sysfs_add_vas_caps(struct vas_cop_feat_caps *caps);
