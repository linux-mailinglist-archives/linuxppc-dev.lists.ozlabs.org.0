Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 545A759F69E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Aug 2022 11:43:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MCLl468Qqz3c5p
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Aug 2022 19:43:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lp9t9d9V;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lp9t9d9V;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MCLkL2RPbz2xk5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Aug 2022 19:43:05 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27O9QaLR016738;
	Wed, 24 Aug 2022 09:42:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=vtVu45q7UBsFx+ttMQc+rAnZaXT2Yh6MubCvCgSvT2M=;
 b=lp9t9d9V9x814f7OahPcTFsFZP9IZQDf+AQ4Tfg7bnh6EBR8BOMy5fkS4ZoHS0poUr/5
 aQz9UKY7iN72tOnFLProwTmBrLrwxxDYlfh5Gqh/8+6vYeb3fm08Pux7lyKrHtbaPnuw
 PpKoEiL7vyMljbvPTcZ9X2Fdc5vh5kVwvlMN4hRDDFKwps/+yzsgA5F8fgpYuR7OOHfC
 LDVmEViOQICMnwkuaFYrmHWj5UO61TayhsrR1n/Hxka8RdrTAqnduCY5/2gPh2unD7+i
 pu+2xmEvvc9ApdQOQmVnqDnRdYb/C2yy2r1Z+70+tXs2CK02KylMkeRGTu8f6GlJHgbe 8A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j5hbq8fre-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Aug 2022 09:42:43 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27O9RoGe019937;
	Wed, 24 Aug 2022 09:42:43 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j5hbq8fqc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Aug 2022 09:42:43 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27O9ZfJn026002;
	Wed, 24 Aug 2022 09:42:40 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma03ams.nl.ibm.com with ESMTP id 3j2q88vx25-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Aug 2022 09:42:40 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com [9.149.105.60])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27O9gcjT13369836
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 24 Aug 2022 09:42:38 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 68A1042041;
	Wed, 24 Aug 2022 09:42:38 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 850574203F;
	Wed, 24 Aug 2022 09:42:37 +0000 (GMT)
Received: from [9.171.36.149] (unknown [9.171.36.149])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed, 24 Aug 2022 09:42:37 +0000 (GMT)
Message-ID: <0ee42968-f742-56dd-78c3-b70a1c9c40af@linux.ibm.com>
Date: Wed, 24 Aug 2022 11:42:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] misc: ocxl: fix possible refcount leak in afu_ioctl()
Content-Language: en-US
To: Hangyu Hua <hbh25y@gmail.com>, ajd@linux.ibm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, alastair@d-silva.org, mpe@ellerman.id.au
References: <20220824082600.36159-1-hbh25y@gmail.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20220824082600.36159-1-hbh25y@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: fFKkhTTeSbOuNNj1vQ8BXYXZjMmnj8PE
X-Proofpoint-ORIG-GUID: U4vYSp9hB9GUtz-TIk2-x4CGPSwVbTBz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-24_05,2022-08-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1011
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208240036
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 24/08/2022 10:26, Hangyu Hua wrote:
> eventfd_ctx_put need to be called to put the refcount that gotten by
> eventfd_ctx_fdget when ocxl_irq_set_handler fails.
> 
> Fixes: 060146614643 ("ocxl: move event_fd handling to frontend")
> Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
> ---


Thanks for fixing it! LGTM

Acked-by: Frederic Barrat <fbarrat@linux.ibm.com>

   Fred


>   drivers/misc/ocxl/file.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/misc/ocxl/file.c b/drivers/misc/ocxl/file.c
> index 6777c419a8da..d46dba2df5a1 100644
> --- a/drivers/misc/ocxl/file.c
> +++ b/drivers/misc/ocxl/file.c
> @@ -257,6 +257,8 @@ static long afu_ioctl(struct file *file, unsigned int cmd,
>   		if (IS_ERR(ev_ctx))
>   			return PTR_ERR(ev_ctx);
>   		rc = ocxl_irq_set_handler(ctx, irq_id, irq_handler, irq_free, ev_ctx);
> +		if (rc)
> +			eventfd_ctx_put(ev_ctx);
>   		break;
>   
>   	case OCXL_IOCTL_GET_METADATA:
