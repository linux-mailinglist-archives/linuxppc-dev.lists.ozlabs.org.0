Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B89B83B2AA7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 10:46:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G9YdM3Szrz3bwZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 18:46:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Onyb5eRl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Onyb5eRl; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G9Ycv1Y20z2xb7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Jun 2021 18:45:50 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15O8Xjp8040044
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Jun 2021 04:45:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=z1ujShIptXIj/21BjLYcvwjtYOVpLKABFIIYV02oMv8=;
 b=Onyb5eRl/LxxLEIwcZX8Fdsuxme9DBF5NN7ga0ZKlU4uJqvvxSlDsnEsMLwU2L0sDjM2
 fXJMmo2wgPcnhlvqb0JGjnfuuVEG6DZSq3XlwJ3t7Tr5P8yuN61lq2+6Y8e218T2yrJU
 n3Qfp7MJNnHcNiL6K+ilMtmQDNCkyPZi5x13Uww9WfMGWjO8Bc3oLu8udJqO+81n/0RD
 KCtdYF33GqXl1FW2QjnQFM8fJk7y1FsMpVnSkRtcV7vXRoVGXSdd0zKIzigc4NdVpQKk
 jqMmhzIeB5VsQivwsDL00UXlkMFzTrWTay/VFlI64sDZYyVsIzN5kNmlhUO7uTs16+gH lw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39cn1vbtjb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Jun 2021 04:45:47 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15O8YOwv042097
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Jun 2021 04:45:47 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39cn1vbtgh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Jun 2021 04:45:46 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15O8idpt019484;
 Thu, 24 Jun 2021 08:45:44 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06fra.de.ibm.com with ESMTP id 3997uhhbhr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Jun 2021 08:45:44 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 15O8iKkQ20054292
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Jun 2021 08:44:20 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E7A5E42064;
 Thu, 24 Jun 2021 08:45:41 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B98B042077;
 Thu, 24 Jun 2021 08:45:41 +0000 (GMT)
Received: from pomme.local (unknown [9.145.158.63])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 24 Jun 2021 08:45:41 +0000 (GMT)
Subject: Re: [PATCH 2/3] powerpc/pseries: break early in
 dlpar_memory_add_by_count() loops
To: Daniel Henrique Barboza <danielhb413@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
References: <20210622133923.295373-1-danielhb413@gmail.com>
 <20210622133923.295373-3-danielhb413@gmail.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
Message-ID: <c0a3bb20-e3ed-1522-8411-510e94633511@linux.ibm.com>
Date: Thu, 24 Jun 2021 10:45:40 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210622133923.295373-3-danielhb413@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 8ozVHTJjLQb1U74UhyR9e8oiducnJm8V
X-Proofpoint-ORIG-GUID: yPMFYkhWNK6iczXie6gNiZ1TxFy9luaX
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-24_06:2021-06-23,
 2021-06-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106240046
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

Le 22/06/2021 à 15:39, Daniel Henrique Barboza a écrit :
> After a successful dlpar_add_lmb() call the LMB is marked as reserved.
> Later on, depending whether we added enough LMBs or not, we rely on
> the marked LMBs to see which ones might need to be removed, and we
> remove the reservation of all of them.
> 
> These are done in for_each_drmem_lmb() loops without any break
> condition. This means that we're going to check all LMBs of the partition
> even after going through all the reserved ones.
> 
> This patch adds break conditions in both loops to avoid this. The
> 'lmbs_added' variable was renamed to 'lmbs_reserved', and it's now
> being decremented each time a lmb reservation is removed, indicating
> if there are still marked LMBs to be processed.

Reviewed-by: Laurent Dufour <ldufour@linux.ibm.com>

> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   arch/powerpc/platforms/pseries/hotplug-memory.c | 17 ++++++++++++-----
>   1 file changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
> index 28a7fd90232f..c0a03e1537cb 100644
> --- a/arch/powerpc/platforms/pseries/hotplug-memory.c
> +++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
> @@ -673,7 +673,7 @@ static int dlpar_memory_add_by_count(u32 lmbs_to_add)
>   {
>   	struct drmem_lmb *lmb;
>   	int lmbs_available = 0;
> -	int lmbs_added = 0;
> +	int lmbs_reserved = 0;
>   	int rc;
>   
>   	pr_info("Attempting to hot-add %d LMB(s)\n", lmbs_to_add);
> @@ -714,13 +714,12 @@ static int dlpar_memory_add_by_count(u32 lmbs_to_add)
>   		 * requested LMBs cannot be added.
>   		 */
>   		drmem_mark_lmb_reserved(lmb);
> -
> -		lmbs_added++;
> -		if (lmbs_added == lmbs_to_add)
> +		lmbs_reserved++;
> +		if (lmbs_reserved == lmbs_to_add)
>   			break;
>   	}
>   
> -	if (lmbs_added != lmbs_to_add) {
> +	if (lmbs_reserved != lmbs_to_add) {
>   		pr_err("Memory hot-add failed, removing any added LMBs\n");
>   
>   		for_each_drmem_lmb(lmb) {
> @@ -735,6 +734,10 @@ static int dlpar_memory_add_by_count(u32 lmbs_to_add)
>   				dlpar_release_drc(lmb->drc_index);
>   
>   			drmem_remove_lmb_reservation(lmb);
> +			lmbs_reserved--;
> +
> +			if (lmbs_reserved == 0)
> +				break;
>   		}
>   		rc = -EINVAL;
>   	} else {
> @@ -745,6 +748,10 @@ static int dlpar_memory_add_by_count(u32 lmbs_to_add)
>   			pr_debug("Memory at %llx (drc index %x) was hot-added\n",
>   				 lmb->base_addr, lmb->drc_index);
>   			drmem_remove_lmb_reservation(lmb);
> +			lmbs_reserved--;
> +
> +			if (lmbs_reserved == 0)
> +				break;
>   		}
>   		rc = 0;
>   	}
> 

