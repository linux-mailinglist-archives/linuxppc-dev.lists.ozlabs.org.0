Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9974723111C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jul 2020 19:48:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BGPKv0Bg5zDr5Y
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jul 2020 03:48:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BGPJC2WNTzDqx1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jul 2020 03:47:06 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06SHjO9H130037
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jul 2020 13:47:03 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32j7sxpc2b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jul 2020 13:47:03 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06SHVun8010589
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jul 2020 17:47:01 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06fra.de.ibm.com with ESMTP id 32jgvprgj4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jul 2020 17:47:01 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06SHkwoD32964912
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Jul 2020 17:46:59 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BEA5E4C059;
 Tue, 28 Jul 2020 17:46:58 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 887104C04A;
 Tue, 28 Jul 2020 17:46:58 +0000 (GMT)
Received: from pomme.local (unknown [9.145.163.64])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 28 Jul 2020 17:46:58 +0000 (GMT)
Subject: Re: [PATCH] powerpc/pseries: explicitly reschedule during drmem_lmb
 list traversal
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20200728173741.717372-1-nathanl@linux.ibm.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
Message-ID: <bd9225f2-40c9-0460-ba45-c29c920b5f91@linux.ibm.com>
Date: Tue, 28 Jul 2020 19:46:58 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200728173741.717372-1-nathanl@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-28_15:2020-07-28,
 2020-07-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0 adultscore=0
 bulkscore=0 spamscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007280126
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
Cc: tyreld@linux.ibm.com, cheloha@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 28/07/2020 à 19:37, Nathan Lynch a écrit :
> The drmem lmb list can have hundreds of thousands of entries, and
> unfortunately lookups take the form of linear searches. As long as
> this is the case, traversals have the potential to monopolize the CPU
> and provoke lockup reports, workqueue stalls, and the like unless
> they explicitly yield.
> 
> Rather than placing cond_resched() calls within various
> for_each_drmem_lmb() loop blocks in the code, put it in the iteration
> expression of the loop macro itself so users can't omit it.

Hi Nathan,

Is that not too much to call cond_resched() on every LMB?

Could that be less frequent, every 10, or 100, I don't really know ?

Cheers,
Laurent.
> 
> Fixes: 6c6ea53725b3 ("powerpc/mm: Separate ibm, dynamic-memory data from DT format")
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
> ---
>   arch/powerpc/include/asm/drmem.h | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/drmem.h b/arch/powerpc/include/asm/drmem.h
> index 414d209f45bb..36d0ed04bda8 100644
> --- a/arch/powerpc/include/asm/drmem.h
> +++ b/arch/powerpc/include/asm/drmem.h
> @@ -8,6 +8,8 @@
>   #ifndef _ASM_POWERPC_LMB_H
>   #define _ASM_POWERPC_LMB_H
>   
> +#include <linux/sched.h>
> +
>   struct drmem_lmb {
>   	u64     base_addr;
>   	u32     drc_index;
> @@ -26,8 +28,14 @@ struct drmem_lmb_info {
>   
>   extern struct drmem_lmb_info *drmem_info;
>   
> +static inline struct drmem_lmb *drmem_lmb_next(struct drmem_lmb *lmb)
> +{
> +	cond_resched();
> +	return ++lmb;
> +}
> +
>   #define for_each_drmem_lmb_in_range(lmb, start, end)		\
> -	for ((lmb) = (start); (lmb) < (end); (lmb)++)
> +	for ((lmb) = (start); (lmb) < (end); lmb = drmem_lmb_next(lmb))
>   
>   #define for_each_drmem_lmb(lmb)					\
>   	for_each_drmem_lmb_in_range((lmb),			\
> 

