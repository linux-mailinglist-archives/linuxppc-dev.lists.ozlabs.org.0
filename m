Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7DA2C425F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 15:47:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ch3dw0JkLzDqsp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 01:47:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Sdj5P6cr; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ch3F65ZcfzDqgq
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 01:29:46 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0APE1ZNv148176
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 09:29:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=fAM/MWy6ElPrLuNX/TlehmDA2bhACof8tXX5cav90IM=;
 b=Sdj5P6cr+/GYohfG0/HVhOSSQeZfVy/mXkGF1fILpMEBAO5ZW4VwQkD3bMpmMOcfnB8z
 fabpgIgcTLNwfo70z3nIc/98LSUvK7W7AfgeIJqiaQ2tqbHCf6qt2N2XCF2mh2g52xH7
 UTq2P3wJEmvPmcqT2q2omTY714nV/AktrO8v6df8dHW19m8TB41od7jDRmRQN/UxAV8N
 91sOv3qi427oVrd/q5qGX6Uui0GwLj/8gsJe7cxm3LxCcQN8hdR3BYO4w2uxM0k4H9Ny
 wTEZtKt07gNgkPmWYmpCV61B5hpLgDqj1eof/OeXYOVQQ+Cf1EJc+CEUD0Z/U5TVslyT dA== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 351nr6qp3y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 09:29:43 -0500
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0APESCOQ013341
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 14:29:42 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04fra.de.ibm.com with ESMTP id 34xth8aefu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 14:29:42 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0APETdce24707360
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 Nov 2020 14:29:40 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B8B4FA4057;
 Wed, 25 Nov 2020 14:29:39 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8E1A5A404D;
 Wed, 25 Nov 2020 14:29:39 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.70.43])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 25 Nov 2020 14:29:39 +0000 (GMT)
Subject: Re: [PATCH V3 5/5] ocxl: Add new kernel traces
To: Christophe Lombard <clombard@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, fbarrat@linux.vnet.ibm.com,
 ajd@linux.ibm.com
References: <20201124095838.18665-1-clombard@linux.vnet.ibm.com>
 <20201124095838.18665-6-clombard@linux.vnet.ibm.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
Message-ID: <c63e1ed4-169c-b53d-f28d-8f3b1b396719@linux.ibm.com>
Date: Wed, 25 Nov 2020 15:29:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201124095838.18665-6-clombard@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-25_08:2020-11-25,
 2020-11-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 suspectscore=0 phishscore=0 priorityscore=1501 adultscore=0 spamscore=0
 impostorscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011250084
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



On 24/11/2020 10:58, Christophe Lombard wrote:
> Add specific kernel traces which provide information on mmu notifier and on
> pages range.
> 
> Signed-off-by: Christophe Lombard <clombard@linux.vnet.ibm.com>
> ---


Acked-by: Frederic Barrat <fbarrat@linux.ibm.com>


>   drivers/misc/ocxl/link.c  |  4 +++
>   drivers/misc/ocxl/trace.h | 64 +++++++++++++++++++++++++++++++++++++++
>   2 files changed, 68 insertions(+)
> 
> diff --git a/drivers/misc/ocxl/link.c b/drivers/misc/ocxl/link.c
> index 129d4eddc4d2..ab039c115381 100644
> --- a/drivers/misc/ocxl/link.c
> +++ b/drivers/misc/ocxl/link.c
> @@ -499,6 +499,7 @@ static void invalidate_range(struct mmu_notifier *mn,
>   	unsigned long addr, pid, page_size = PAGE_SIZE;
> 
>   	pid = mm->context.id;
> +	trace_ocxl_mmu_notifier_range(start, end, pid);
> 
>   	spin_lock(&link->atsd_lock);
>   	for (addr = start; addr < end; addr += page_size)
> @@ -590,6 +591,7 @@ int ocxl_link_add_pe(void *link_handle, int pasid, u32 pidr, u32 tidr,
>   			/* Use MMIO registers for the TLB Invalidate
>   			 * operations.
>   			 */
> +			trace_ocxl_init_mmu_notifier(pasid, mm->context.id);
>   			mmu_notifier_register(&pe_data->mmu_notifier, mm);
>   		}
>   	}
> @@ -725,6 +727,8 @@ int ocxl_link_remove_pe(void *link_handle, int pasid)
>   	} else {
>   		if (pe_data->mm) {
>   			if (link->arva) {
> +				trace_ocxl_release_mmu_notifier(pasid,
> +								pe_data->mm->context.id);
>   				mmu_notifier_unregister(&pe_data->mmu_notifier,
>   							pe_data->mm);
>   				spin_lock(&link->atsd_lock);
> diff --git a/drivers/misc/ocxl/trace.h b/drivers/misc/ocxl/trace.h
> index 17e21cb2addd..a33a5094ff6c 100644
> --- a/drivers/misc/ocxl/trace.h
> +++ b/drivers/misc/ocxl/trace.h
> @@ -8,6 +8,70 @@
> 
>   #include <linux/tracepoint.h>
> 
> +
> +TRACE_EVENT(ocxl_mmu_notifier_range,
> +	TP_PROTO(unsigned long start, unsigned long end, unsigned long pidr),
> +	TP_ARGS(start, end, pidr),
> +
> +	TP_STRUCT__entry(
> +		__field(unsigned long, start)
> +		__field(unsigned long, end)
> +		__field(unsigned long, pidr)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->start = start;
> +		__entry->end = end;
> +		__entry->pidr = pidr;
> +	),
> +
> +	TP_printk("start=0x%lx end=0x%lx pidr=0x%lx",
> +		__entry->start,
> +		__entry->end,
> +		__entry->pidr
> +	)
> +);
> +
> +TRACE_EVENT(ocxl_init_mmu_notifier,
> +	TP_PROTO(int pasid, unsigned long pidr),
> +	TP_ARGS(pasid, pidr),
> +
> +	TP_STRUCT__entry(
> +		__field(int, pasid)
> +		__field(unsigned long, pidr)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->pasid = pasid;
> +		__entry->pidr = pidr;
> +	),
> +
> +	TP_printk("pasid=%d, pidr=0x%lx",
> +		__entry->pasid,
> +		__entry->pidr
> +	)
> +);
> +
> +TRACE_EVENT(ocxl_release_mmu_notifier,
> +	TP_PROTO(int pasid, unsigned long pidr),
> +	TP_ARGS(pasid, pidr),
> +
> +	TP_STRUCT__entry(
> +		__field(int, pasid)
> +		__field(unsigned long, pidr)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->pasid = pasid;
> +		__entry->pidr = pidr;
> +	),
> +
> +	TP_printk("pasid=%d, pidr=0x%lx",
> +		__entry->pasid,
> +		__entry->pidr
> +	)
> +);
> +
>   DECLARE_EVENT_CLASS(ocxl_context,
>   	TP_PROTO(pid_t pid, void *spa, int pasid, u32 pidr, u32 tidr),
>   	TP_ARGS(pid, spa, pasid, pidr, tidr),
> 
