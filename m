Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 796DE3B2AB3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 10:49:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G9Yj32X8hz3bx4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 18:49:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lUKJNGQ9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=lUKJNGQ9; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G9Yhc114mz2xb7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Jun 2021 18:49:03 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15O8X0KH050799
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Jun 2021 04:49:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=T8MCKEay5U++n4eZpb7NcWm5tWK7U9D7RYwIJFG58ng=;
 b=lUKJNGQ9OBYcpdpX4rGbkbyldUWmDzV5RuexYndNhWdCDpuuJwdNfFdcoC7dUyAW0yJa
 VsgQ4x8rzX6kw0azfQZinL+2nGW4WiqQnW4GgrinaPsCO2WC5RgT+B8xGEeS09hZ1gyc
 AVXv9Yxc3DhYSi8oX/QKNCpt6atzDpFWla2rgomrfEJm1ohjx4HHOfom4pHl3vAdIwv1
 QKCLf9QF+zCegcsiMcCNzFAGQ/Q7Z0ze6fMakeVf5RtnsmFw28uDTc1vNj3SdK81paOL
 PNjf/626sOI4TGoWqQ5go+Y5qB/289V+J2edGLe6UQP9NiIwyjtBJa5j46EmURvS0WLr 5w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39cp57hfy5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Jun 2021 04:49:00 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15O8X8YH051233
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Jun 2021 04:48:59 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39cp57hfxj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Jun 2021 04:48:59 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15O8jnZ3009139;
 Thu, 24 Jun 2021 08:48:58 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma02fra.de.ibm.com with ESMTP id 3998789bsa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Jun 2021 08:48:57 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 15O8lTuJ7012686
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Jun 2021 08:47:30 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4C85742064;
 Thu, 24 Jun 2021 08:48:54 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1F39D4205E;
 Thu, 24 Jun 2021 08:48:54 +0000 (GMT)
Received: from pomme.local (unknown [9.145.158.63])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 24 Jun 2021 08:48:54 +0000 (GMT)
Subject: Re: [PATCH 3/3] powerpc/pseries: fail quicker in
 dlpar_memory_add_by_ic()
To: Daniel Henrique Barboza <danielhb413@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
References: <20210622133923.295373-1-danielhb413@gmail.com>
 <20210622133923.295373-4-danielhb413@gmail.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
Message-ID: <a9c5499f-6a7f-a892-3941-03c22ba92317@linux.ibm.com>
Date: Thu, 24 Jun 2021 10:48:53 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210622133923.295373-4-danielhb413@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: SV5FbGbD_Ix3RV3uf7pIP7CXyjNn3Vxv
X-Proofpoint-GUID: GVxMCxX-GjGF6dcS1iN67myqKHZXpz3W
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-24_06:2021-06-23,
 2021-06-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999
 lowpriorityscore=0 mlxscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
> The validation done at the start of dlpar_memory_add_by_ic() is an all
> of nothing scenario - if any LMBs in the range is marked as RESERVED we
> can fail right away.
> 
> We then can remove the 'lmbs_available' var and its check with
> 'lmbs_to_add' since the whole LMB range was already validated in the
> previous step.

Reviewed-by: Laurent Dufour <ldufour@linux.ibm.com>

> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   arch/powerpc/platforms/pseries/hotplug-memory.c | 14 ++++++--------
>   1 file changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
> index c0a03e1537cb..377d852f5a9a 100644
> --- a/arch/powerpc/platforms/pseries/hotplug-memory.c
> +++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
> @@ -796,7 +796,6 @@ static int dlpar_memory_add_by_index(u32 drc_index)
>   static int dlpar_memory_add_by_ic(u32 lmbs_to_add, u32 drc_index)
>   {
>   	struct drmem_lmb *lmb, *start_lmb, *end_lmb;
> -	int lmbs_available = 0;
>   	int rc;
>   
>   	pr_info("Attempting to hot-add %u LMB(s) at index %x\n",
> @@ -811,15 +810,14 @@ static int dlpar_memory_add_by_ic(u32 lmbs_to_add, u32 drc_index)
>   
>   	/* Validate that the LMBs in this range are not reserved */
>   	for_each_drmem_lmb_in_range(lmb, start_lmb, end_lmb) {
> -		if (lmb->flags & DRCONF_MEM_RESERVED)
> -			break;
> -
> -		lmbs_available++;
> +		/* Fail immediately if the whole range can't be hot-added */
> +		if (lmb->flags & DRCONF_MEM_RESERVED) {
> +			pr_err("Memory at %llx (drc index %x) is reserved\n",
> +					lmb->base_addr, lmb->drc_index);
> +			return -EINVAL;
> +		}
>   	}
>   
> -	if (lmbs_available < lmbs_to_add)
> -		return -EINVAL;
> -
>   	for_each_drmem_lmb_in_range(lmb, start_lmb, end_lmb) {
>   		if (lmb->flags & DRCONF_MEM_ASSIGNED)
>   			continue;
> 

