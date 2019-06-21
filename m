Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD1F4DE0C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2019 02:24:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45VKDt5cqbzDrNY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2019 10:24:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45VKC72N8dzDrDD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2019 10:22:42 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5L0MWqo094890
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 20:22:38 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2t8hsydebp-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 20:22:38 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ajd@linux.ibm.com>;
 Fri, 21 Jun 2019 01:22:36 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 21 Jun 2019 01:22:32 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5L0MVOF48169088
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Jun 2019 00:22:31 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 452AC5204F;
 Fri, 21 Jun 2019 00:22:31 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 9F0195204E;
 Fri, 21 Jun 2019 00:22:30 +0000 (GMT)
Received: from [9.81.215.199] (unknown [9.81.215.199])
 (using TLSv1.2 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id A89F5A004E;
 Fri, 21 Jun 2019 10:22:26 +1000 (AEST)
Subject: Re: [PATCH v2] ocxl: Allow contexts to be attached with a NULL mm
To: "Alastair D'Silva" <alastair@au1.ibm.com>, alastair@d-silva.org
References: <20190620041203.12274-1-alastair@au1.ibm.com>
From: Andrew Donnellan <ajd@linux.ibm.com>
Date: Fri, 21 Jun 2019 10:22:26 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190620041203.12274-1-alastair@au1.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-AU
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19062100-4275-0000-0000-00000344378D
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19062100-4276-0000-0000-0000385468AA
Message-Id: <a4e6b156-0dce-53e3-786f-cc954ebe08fa@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-20_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=827 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906210000
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
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Paul Mackerras <paulus@samba.org>,
 Suraj Jitindar Singh <sjitindarsingh@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 20/6/19 2:12 pm, Alastair D'Silva wrote:
> From: Alastair D'Silva <alastair@d-silva.org>
> 
> If an OpenCAPI context is to be used directly by a kernel driver, there
> may not be a suitable mm to use.
> 
> The patch makes the mm parameter to ocxl_context_attach optional.
> 
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>

Acked-by: Andrew Donnellan <ajd@linux.ibm.com>

> ---
>   arch/powerpc/mm/book3s64/radix_tlb.c |  5 +++++
>   drivers/misc/ocxl/context.c          |  9 ++++++---
>   drivers/misc/ocxl/link.c             | 28 ++++++++++++++++++++++++----
>   3 files changed, 35 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
> index bb9835681315..ce8a77fae6a7 100644
> --- a/arch/powerpc/mm/book3s64/radix_tlb.c
> +++ b/arch/powerpc/mm/book3s64/radix_tlb.c
> @@ -666,6 +666,11 @@ EXPORT_SYMBOL(radix__flush_tlb_page);
>   #define radix__flush_all_mm radix__local_flush_all_mm
>   #endif /* CONFIG_SMP */
>   
> +/*
> + * If kernel TLBIs ever become local rather than global, then
> + * drivers/misc/ocxl/link.c:ocxl_link_add_pe will need some work, as it
> + * assumes kernel TLBIs are global.
> + */
>   void radix__flush_tlb_kernel_range(unsigned long start, unsigned long end)
>   {
>   	_tlbie_pid(0, RIC_FLUSH_ALL);
> diff --git a/drivers/misc/ocxl/context.c b/drivers/misc/ocxl/context.c
> index bab9c9364184..994563a078eb 100644
> --- a/drivers/misc/ocxl/context.c
> +++ b/drivers/misc/ocxl/context.c
> @@ -69,6 +69,7 @@ static void xsl_fault_error(void *data, u64 addr, u64 dsisr)
>   int ocxl_context_attach(struct ocxl_context *ctx, u64 amr, struct mm_struct *mm)
>   {
>   	int rc;
> +	unsigned long pidr = 0;
>   
>   	// Locks both status & tidr
>   	mutex_lock(&ctx->status_mutex);
> @@ -77,9 +78,11 @@ int ocxl_context_attach(struct ocxl_context *ctx, u64 amr, struct mm_struct *mm)
>   		goto out;
>   	}
>   
> -	rc = ocxl_link_add_pe(ctx->afu->fn->link, ctx->pasid,
> -			mm->context.id, ctx->tidr, amr, mm,
> -			xsl_fault_error, ctx);
> +	if (mm)
> +		pidr = mm->context.id;
> +
> +	rc = ocxl_link_add_pe(ctx->afu->fn->link, ctx->pasid, pidr, ctx->tidr,
> +			      amr, mm, xsl_fault_error, ctx);
>   	if (rc)
>   		goto out;
>   
> diff --git a/drivers/misc/ocxl/link.c b/drivers/misc/ocxl/link.c
> index cce5b0d64505..58d111afd9f6 100644
> --- a/drivers/misc/ocxl/link.c
> +++ b/drivers/misc/ocxl/link.c
> @@ -224,6 +224,17 @@ static irqreturn_t xsl_fault_handler(int irq, void *data)
>   		ack_irq(spa, ADDRESS_ERROR);
>   		return IRQ_HANDLED;
>   	}
> +
> +	if (!pe_data->mm) {
> +		/*
> +		 * translation fault from a kernel context - an OpenCAPI
> +		 * device tried to access a bad kernel address
> +		 */
> +		rcu_read_unlock();
> +		pr_warn("Unresolved OpenCAPI xsl fault in kernel context\n");
> +		ack_irq(spa, ADDRESS_ERROR);
> +		return IRQ_HANDLED;
> +	}
>   	WARN_ON(pe_data->mm->context.id != pid);
>   
>   	if (mmget_not_zero(pe_data->mm)) {
> @@ -523,7 +534,13 @@ int ocxl_link_add_pe(void *link_handle, int pasid, u32 pidr, u32 tidr,
>   	pe->amr = cpu_to_be64(amr);
>   	pe->software_state = cpu_to_be32(SPA_PE_VALID);
>   
> -	mm_context_add_copro(mm);
> +	/*
> +	 * For user contexts, register a copro so that TLBIs are seen
> +	 * by the nest MMU. If we have a kernel context, TLBIs are
> +	 * already global.
> +	 */
> +	if (mm)
> +		mm_context_add_copro(mm);
>   	/*
>   	 * Barrier is to make sure PE is visible in the SPA before it
>   	 * is used by the device. It also helps with the global TLBI
> @@ -546,7 +563,8 @@ int ocxl_link_add_pe(void *link_handle, int pasid, u32 pidr, u32 tidr,
>   	 * have a reference on mm_users. Incrementing mm_count solves
>   	 * the problem.
>   	 */
> -	mmgrab(mm);
> +	if (mm)
> +		mmgrab(mm);
>   	trace_ocxl_context_add(current->pid, spa->spa_mem, pasid, pidr, tidr);
>   unlock:
>   	mutex_unlock(&spa->spa_lock);
> @@ -652,8 +670,10 @@ int ocxl_link_remove_pe(void *link_handle, int pasid)
>   	if (!pe_data) {
>   		WARN(1, "Couldn't find pe data when removing PE\n");
>   	} else {
> -		mm_context_remove_copro(pe_data->mm);
> -		mmdrop(pe_data->mm);
> +		if (pe_data->mm) {
> +			mm_context_remove_copro(pe_data->mm);
> +			mmdrop(pe_data->mm);
> +		}
>   		kfree_rcu(pe_data, rcu);
>   	}
>   unlock:
> 

-- 
Andrew Donnellan              OzLabs, ADL Canberra
ajd@linux.ibm.com             IBM Australia Limited

