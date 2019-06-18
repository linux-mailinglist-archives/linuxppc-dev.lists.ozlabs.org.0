Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1E749728
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2019 03:52:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45SWLW3JhHzDqPj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2019 11:52:51 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45SWJb6XKjzDqS4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2019 11:51:10 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5I1kt3d087985
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jun 2019 21:51:07 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2t6n5gan6e-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jun 2019 21:51:06 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ajd@linux.ibm.com>;
 Tue, 18 Jun 2019 02:51:05 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 18 Jun 2019 02:51:03 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5I1p2Ed59572338
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Jun 2019 01:51:02 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5EF55A4053;
 Tue, 18 Jun 2019 01:51:02 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C66F6A4051;
 Tue, 18 Jun 2019 01:51:01 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 18 Jun 2019 01:51:01 +0000 (GMT)
Received: from [10.61.2.125] (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id AA010A0207;
 Tue, 18 Jun 2019 11:51:00 +1000 (AEST)
Subject: Re: [PATCH] ocxl: Allow contexts to be attached with a NULL mm
To: "Alastair D'Silva" <alastair@au1.ibm.com>, alastair@d-silva.org
References: <20190617044152.13707-1-alastair@au1.ibm.com>
From: Andrew Donnellan <ajd@linux.ibm.com>
Date: Tue, 18 Jun 2019 11:50:59 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190617044152.13707-1-alastair@au1.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-AU
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19061801-0028-0000-0000-0000037B29CB
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061801-0029-0000-0000-0000243B3100
Message-Id: <81f8951e-a095-3e13-4229-6475f6a8d4a5@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-18_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=963 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906180012
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 17/6/19 2:41 pm, Alastair D'Silva wrote:
> From: Alastair D'Silva <alastair@d-silva.org>
> 
> If an OpenCAPI context is to be used directly by a kernel driver, there
> may not be a suitable mm to use.
> 
> The patch makes the mm parameter to ocxl_context_attach optional.
> 
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>

The one issue I can see here is that using mm == NULL bypasses our 
method of enabling/disabling global TLBIs in mm_context_add_copro().

Discussing this privately with Alastair and Fred - this should be fine, 
but perhaps we should document that.

> ---
>   drivers/misc/ocxl/context.c |  9 ++++++---
>   drivers/misc/ocxl/link.c    | 12 ++++++++----
>   2 files changed, 14 insertions(+), 7 deletions(-)
> 
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
> index cce5b0d64505..43542f124807 100644
> --- a/drivers/misc/ocxl/link.c
> +++ b/drivers/misc/ocxl/link.c
> @@ -523,7 +523,8 @@ int ocxl_link_add_pe(void *link_handle, int pasid, u32 pidr, u32 tidr,
>   	pe->amr = cpu_to_be64(amr);
>   	pe->software_state = cpu_to_be32(SPA_PE_VALID);
>   
> -	mm_context_add_copro(mm);
> +	if (mm)
> +		mm_context_add_copro(mm);
>   	/*
>   	 * Barrier is to make sure PE is visible in the SPA before it
>   	 * is used by the device. It also helps with the global TLBI
> @@ -546,7 +547,8 @@ int ocxl_link_add_pe(void *link_handle, int pasid, u32 pidr, u32 tidr,
>   	 * have a reference on mm_users. Incrementing mm_count solves
>   	 * the problem.
>   	 */
> -	mmgrab(mm);
> +	if (mm)
> +		mmgrab(mm);
>   	trace_ocxl_context_add(current->pid, spa->spa_mem, pasid, pidr, tidr);
>   unlock:
>   	mutex_unlock(&spa->spa_lock);
> @@ -652,8 +654,10 @@ int ocxl_link_remove_pe(void *link_handle, int pasid)
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

