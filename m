Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C44F3B2A83
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 10:39:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G9YTt2lWbz3bwh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 18:39:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BfQdzOFg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=BfQdzOFg; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G9YTN3FkXz2yxx
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Jun 2021 18:39:19 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15O8XEW4088088
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Jun 2021 04:39:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=SzOHvqJSM0WH+ERV8HsLLEZsMGK2R5orMyWuzKpt0d0=;
 b=BfQdzOFgIjT/MtZxw7ocn14VQv2CnGMAmaZDTbb72MDLKoiA2rQ6WK7Ilw1rOh0dDzez
 RJ3bYf8+lJV3aJit3vS9a0yYrV08yVY6oZ0l9QaqeL6O+iUqc9oefaF7pi5zMNgwbhYn
 X9w1VLcBV7vSqNrRdbGadgbWl7vicUgtjUU2CNkJXqWyVqbGzQGpaSDAm+lGshjKyexG
 qbjvY4G0wXciqWhaOBYF3+P34oCGmYzk3rPYLzavI0lOyR0oBJkM7UXSbg4hXkg1kVgp
 KiUpvNMt+7ldvCN4Hav8QvFRaLwHNckASW6dM9Lc2RKWcdRB3TSK+1uf0A/UEHSiRXT3 VQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39cnhvacav-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Jun 2021 04:39:15 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15O8XPed089090
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Jun 2021 04:39:15 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39cnhvaca5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Jun 2021 04:39:15 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15O8WmdD004100;
 Thu, 24 Jun 2021 08:39:13 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 399878ae44-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Jun 2021 08:39:13 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 15O8bnwH13828536
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Jun 2021 08:37:49 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B5CF442042;
 Thu, 24 Jun 2021 08:39:10 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A09D34204F;
 Thu, 24 Jun 2021 08:39:10 +0000 (GMT)
Received: from pomme.local (unknown [9.145.158.63])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 24 Jun 2021 08:39:10 +0000 (GMT)
Subject: Re: [PATCH 1/3] powerpc/pseries: skip reserved LMBs in
 dlpar_memory_add_by_count()
To: Daniel Henrique Barboza <danielhb413@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
References: <20210622133923.295373-1-danielhb413@gmail.com>
 <20210622133923.295373-2-danielhb413@gmail.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
Message-ID: <4146d67e-c606-e5c9-229d-310c05498684@linux.ibm.com>
Date: Thu, 24 Jun 2021 10:39:10 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210622133923.295373-2-danielhb413@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: n50kvq43_432wYNE1pR1bcC6UM7ojKMp
X-Proofpoint-GUID: phL0sYdzhryf939Su9nYtK9VYfjqW16_
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-24_06:2021-06-23,
 2021-06-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1011
 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106240046
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
> The function is counting reserved LMBs as available to be added, but
> they aren't. This will cause the function to miscalculate the available
> LMBs and can trigger errors later on when executing dlpar_add_lmb().

Indeed I'm wondering if dlpar_add_lmb() would fail in that case, so that's even 
better to check for that flag earlier.

Reviewed-by: Laurent Dufour <ldufour@linux.ibm.com>

> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   arch/powerpc/platforms/pseries/hotplug-memory.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
> index 36f66556a7c6..28a7fd90232f 100644
> --- a/arch/powerpc/platforms/pseries/hotplug-memory.c
> +++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
> @@ -683,6 +683,9 @@ static int dlpar_memory_add_by_count(u32 lmbs_to_add)
>   
>   	/* Validate that there are enough LMBs to satisfy the request */
>   	for_each_drmem_lmb(lmb) {
> +		if (lmb->flags & DRCONF_MEM_RESERVED)
> +			continue;
> +
>   		if (!(lmb->flags & DRCONF_MEM_ASSIGNED))
>   			lmbs_available++;
>   
> 

