Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CADC6242D68
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 18:34:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BRZz558X8zDqSh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Aug 2020 02:34:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=f2JTFDVH; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BRZqP2F1LzDqcY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Aug 2020 02:25:59 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07CG3DLB045631; Wed, 12 Aug 2020 12:22:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=ulADsdqR1UKGVkndeaV+pyZ09sbODd2lhZRvdUd0ShQ=;
 b=f2JTFDVH9J67okS2UOSDqbrm1fd+g4JB09iT09K8xRiBV4LnxsdXU3BbSKwFJ6p1YFTB
 ZsLVK/BztPpXuz3j+L8CimNq0/9MqzfiGXzmc+JsnYIP1hwxLdKRaYO2R0Gi4KngxUIz
 IvfGWcpT97Q1z+newUSVcGRryvaWc73/98ZMnVlerDS5kZ1HHdO2zePfZgoowjG6bxIU
 pzbXjQHxhQ90fpOsXaRDonAjqjxza4JaYqsv7MONY0ezFg4GBiMl7WI53cd2KreLcO53
 lmIvtcDszqpkIrdAJo8iUrtjKOZAXwZ1CqiptmsgRTUClddCRtZZJLMBTmpvn5Db4JNo Tw== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32srasyy4y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Aug 2020 12:22:32 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07CGKxKk024551;
 Wed, 12 Aug 2020 16:22:30 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma04dal.us.ibm.com with ESMTP id 32skp9bm2t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Aug 2020 16:22:30 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07CGMTSh1508020
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Aug 2020 16:22:29 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 26A09C605B;
 Wed, 12 Aug 2020 16:22:29 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2870CC6055;
 Wed, 12 Aug 2020 16:22:28 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.160.67.173])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 12 Aug 2020 16:22:27 +0000 (GMT)
Subject: Re: [PATCH v2] powerpc/pseries: explicitly reschedule during
 drmem_lmb list traversal
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20200812012005.1919255-1-nathanl@linux.ibm.com>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
Message-ID: <5e8213a6-802b-f7ca-b43b-a3de8a03d1da@linux.ibm.com>
Date: Wed, 12 Aug 2020 09:22:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200812012005.1919255-1-nathanl@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-12_09:2020-08-11,
 2020-08-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0
 malwarescore=0 spamscore=0 mlxscore=0 lowpriorityscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008120109
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
Cc: cheloha@linux.ibm.com, ldufour@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 8/11/20 6:20 PM, Nathan Lynch wrote:
> The drmem lmb list can have hundreds of thousands of entries, and
> unfortunately lookups take the form of linear searches. As long as
> this is the case, traversals have the potential to monopolize the CPU
> and provoke lockup reports, workqueue stalls, and the like unless
> they explicitly yield.
> 
> Rather than placing cond_resched() calls within various
> for_each_drmem_lmb() loop blocks in the code, put it in the iteration
> expression of the loop macro itself so users can't omit it.
> 
> Call cond_resched() on every 20th element. Each iteration of the loop
> in DLPAR code paths can involve around ten RTAS calls which can each
> take up to 250us, so this ensures the check is performed at worst
> every few milliseconds.
> 
> Fixes: 6c6ea53725b3 ("powerpc/mm: Separate ibm, dynamic-memory data from DT format")
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/drmem.h | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 
> Changes since v1:
> * Add bounds assertions in drmem_lmb_next().
> * Call cond_resched() in the iterator on only every 20th element
>   instead of on every iteration, to reduce overhead in tight loops.
> 
> diff --git a/arch/powerpc/include/asm/drmem.h b/arch/powerpc/include/asm/drmem.h
> index 17ccc6474ab6..583277e30dd2 100644
> --- a/arch/powerpc/include/asm/drmem.h
> +++ b/arch/powerpc/include/asm/drmem.h
> @@ -8,6 +8,9 @@
>  #ifndef _ASM_POWERPC_LMB_H
>  #define _ASM_POWERPC_LMB_H
>  
> +#include <linux/bug.h>
> +#include <linux/sched.h>
> +
>  struct drmem_lmb {
>  	u64     base_addr;
>  	u32     drc_index;
> @@ -26,8 +29,21 @@ struct drmem_lmb_info {
>  
>  extern struct drmem_lmb_info *drmem_info;
>  
> +static inline struct drmem_lmb *drmem_lmb_next(struct drmem_lmb *lmb)
> +{
> +	const unsigned int resched_interval = 20;
> +
> +	BUG_ON(lmb < drmem_info->lmbs);
> +	BUG_ON(lmb >= drmem_info->lmbs + drmem_info->n_lmbs);

I think BUG_ON is a pretty big no-no these days unless there is no other option.

-Tyrel

> +
> +	if ((lmb - drmem_info->lmbs) % resched_interval == 0)
> +		cond_resched();
> +
> +	return ++lmb;
> +}
> +
>  #define for_each_drmem_lmb_in_range(lmb, start, end)		\
> -	for ((lmb) = (start); (lmb) < (end); (lmb)++)
> +	for ((lmb) = (start); (lmb) < (end); lmb = drmem_lmb_next(lmb))
>  
>  #define for_each_drmem_lmb(lmb)					\
>  	for_each_drmem_lmb_in_range((lmb),			\
> 

