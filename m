Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE996784EF4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 04:59:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FkZXg8yO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RVrXS4zHtz3c5T
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 12:59:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FkZXg8yO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RVrWY0lrMz2yTN
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Aug 2023 12:58:32 +1000 (AEST)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37N2uenY027037;
	Wed, 23 Aug 2023 02:58:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=TNfLIqq8NbHmhSgwgu4SeZUoUuRWY2/Zw2rbTIh6Qk8=;
 b=FkZXg8yOw1HNpp8mCxs25ohLnMqOTlVuu3FLk70gRKmoR+j1UtviNaLyh6vlCfRTVvSZ
 SB4FpwbYUO+bdjJ95HhJa+I6cj525zkcA7ecxNDNy8L0WnJwcwuzSMTiEQGaocGO5HHR
 L50AQ9Umdk8UJYy2xoYoGU+rQniIDjr9ZztPzoFOkh+/uc2VXfR7w5lI5a+jlDGa1dzl
 67I1QyOgj0n7ltd1dBD3WGR4AmaMq5yQJE9iY7IwoFgf845ALfyVgwPYT9wGT9sJSV94
 0USElO7UUMmdpzo0ba4zLMXvPiMNVQS1o1B/g+lGjw56fE/E/IQH5+5tKa0gQeOABuVL Jg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sn9s8g14t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Aug 2023 02:58:23 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 37N2uuTv027637;
	Wed, 23 Aug 2023 02:58:22 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sn9s8g14g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Aug 2023 02:58:22 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37N1fvZa020123;
	Wed, 23 Aug 2023 02:58:21 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3sn22aaxth-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Aug 2023 02:58:21 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37N2wKbM20185780
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 23 Aug 2023 02:58:20 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0A00920040;
	Wed, 23 Aug 2023 02:58:20 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 17F012004B;
	Wed, 23 Aug 2023 02:58:19 +0000 (GMT)
Received: from in.ibm.com (unknown [9.109.248.226])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 23 Aug 2023 02:58:18 +0000 (GMT)
Date: Wed, 23 Aug 2023 08:28:16 +0530
From: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 1/2] powerpc/powernv: Fix fortify source warnings in
 opal-prd.c
Message-ID: <bssbc544h5dnd4ptlcdm7rul2kggxxoh4nxvludl4pelnskb56@7hb2feitzu7o>
References: <20230821142820.497107-1-mpe@ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230821142820.497107-1-mpe@ellerman.id.au>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: QFXU_kAgiSjZKdKQqRo03-Rm-_h2Kseu
X-Proofpoint-GUID: wbNMYHzLwdVFp6iX9puACuJT3kzgrCJA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-22_22,2023-08-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 adultscore=0 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0
 clxscore=1011 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308230022
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
Reply-To: mahesh@linux.ibm.com
Cc: jniethe5@gmail.com, linuxppc-dev@lists.ozlabs.org, joel@jms.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2023-08-22 00:28:19 Tue, Michael Ellerman wrote:
> As reported by Mahesh & Aneesh, opal_prd_msg_notifier() triggers a
> FORTIFY_SOURCE warning:
> 
>   memcpy: detected field-spanning write (size 32) of single field "&item->msg" at arch/powerpc/platforms/powernv/opal-prd.c:355 (size 4)
>   WARNING: CPU: 9 PID: 660 at arch/powerpc/platforms/powernv/opal-prd.c:355 opal_prd_msg_notifier+0x174/0x188 [opal_prd]
>   NIP opal_prd_msg_notifier+0x174/0x188 [opal_prd]
>   LR  opal_prd_msg_notifier+0x170/0x188 [opal_prd]
>   Call Trace:
>     opal_prd_msg_notifier+0x170/0x188 [opal_prd] (unreliable)
>     notifier_call_chain+0xc0/0x1b0
>     atomic_notifier_call_chain+0x2c/0x40
>     opal_message_notify+0xf4/0x2c0
> 
> This happens because the copy is targetting item->msg, which is only 4
> bytes in size, even though the enclosing item was allocated with extra
> space following the msg.
> 
> To fix the warning define struct opal_prd_msg with a union of the header
> and a flex array, and have the memcpy target the flex array.
> 
> Reported-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> Reported-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Tested-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>

Thanks,
-Mahesh

> ---
>  arch/powerpc/platforms/powernv/opal-prd.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/powernv/opal-prd.c b/arch/powerpc/platforms/powernv/opal-prd.c
> index 113bdb151f68..40e26e9f318f 100644
> --- a/arch/powerpc/platforms/powernv/opal-prd.c
> +++ b/arch/powerpc/platforms/powernv/opal-prd.c
> @@ -24,13 +24,20 @@
>  #include <linux/uaccess.h>
>  
>  
> +struct opal_prd_msg {
> +	union {
> +		struct opal_prd_msg_header header;
> +		DECLARE_FLEX_ARRAY(u8, data);
> +	};
> +};
> +
>  /*
>   * The msg member must be at the end of the struct, as it's followed by the
>   * message data.
>   */
>  struct opal_prd_msg_queue_item {
> -	struct list_head		list;
> -	struct opal_prd_msg_header	msg;
> +	struct list_head	list;
> +	struct opal_prd_msg	msg;
>  };
>  
>  static struct device_node *prd_node;
> @@ -156,7 +163,7 @@ static ssize_t opal_prd_read(struct file *file, char __user *buf,
>  	int rc;
>  
>  	/* we need at least a header's worth of data */
> -	if (count < sizeof(item->msg))
> +	if (count < sizeof(item->msg.header))
>  		return -EINVAL;
>  
>  	if (*ppos)
> @@ -186,7 +193,7 @@ static ssize_t opal_prd_read(struct file *file, char __user *buf,
>  			return -EINTR;
>  	}
>  
> -	size = be16_to_cpu(item->msg.size);
> +	size = be16_to_cpu(item->msg.header.size);
>  	if (size > count) {
>  		err = -EINVAL;
>  		goto err_requeue;
> @@ -352,7 +359,7 @@ static int opal_prd_msg_notifier(struct notifier_block *nb,
>  	if (!item)
>  		return -ENOMEM;
>  
> -	memcpy(&item->msg, msg->params, msg_size);
> +	memcpy(&item->msg.data, msg->params, msg_size);
>  
>  	spin_lock_irqsave(&opal_prd_msg_queue_lock, flags);
>  	list_add_tail(&item->list, &opal_prd_msg_queue);
> -- 
> 2.41.0
> 

-- 
Mahesh J Salgaonkar
