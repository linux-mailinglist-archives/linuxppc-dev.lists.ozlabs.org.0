Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F94308761
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jan 2021 10:36:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DRsfk18pwzDrVP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jan 2021 20:36:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=DjORXRoU; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DRscW6mKyzDrTN
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jan 2021 20:34:35 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10T9W0hE018951; Fri, 29 Jan 2021 04:34:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=FsWDudmo6J8oBj8K9RB+KyjOXFuT6cep1iOIv31WAlY=;
 b=DjORXRoUOFOq79973Ts+B2IQ9elvjqmwAS3bDEkhZoF4yXeQtzBbnIScmr0NOAdprUoC
 SG0aUngFYDJy6BL3sSVycqz2r7MVXWbdoD5N02ZEtUFQ5WI6m0VeaS6zfC9bl0mziAUr
 0bAXjbEo2TgL19P3rktD0alU+A3967+UbnEXK30UZ/5OnYbYqL5DNtA/33dLLmrentAE
 eC91nHQmYHv/8IDivxxmwJdqFa3uToQ4rroPlbX8unB4tK2NWGlM+lLlU8edANJsPs9u
 GVjiJRRr6Ke6tAD3iJ144v0BWpOxySPZRcCvr10dAa78xLPFodhsCvz9zE6QFox39Vth 8A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36cdwnu6h5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Jan 2021 04:34:30 -0500
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10T9YUc6031323;
 Fri, 29 Jan 2021 04:34:30 -0500
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36cdwnu6gg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Jan 2021 04:34:30 -0500
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10T9NMI0018074;
 Fri, 29 Jan 2021 09:34:28 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma02fra.de.ibm.com with ESMTP id 368be8ayed-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Jan 2021 09:34:28 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 10T9YIJA30540274
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Jan 2021 09:34:18 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E76EF11C050;
 Fri, 29 Jan 2021 09:34:25 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A72A911C054;
 Fri, 29 Jan 2021 09:34:25 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.29.111])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 29 Jan 2021 09:34:25 +0000 (GMT)
Subject: Re: [PATCH] cxl: Simplify bool conversion
To: Yang Li <yang.lee@linux.alibaba.com>
References: <1611908705-98507-1-git-send-email-yang.lee@linux.alibaba.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
Message-ID: <eacd0324-26c5-dbb5-f5cb-da711e9af74f@linux.ibm.com>
Date: Fri, 29 Jan 2021 10:34:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1611908705-98507-1-git-send-email-yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-01-29_04:2021-01-28,
 2021-01-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101290049
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
Cc: gregkh@linuxfoundation.org, linuxppc-dev@lists.ozlabs.org,
 ajd@linux.ibm.com, arnd@arndb.de, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 29/01/2021 09:25, Yang Li wrote:
> Fix the following coccicheck warning:
> ./drivers/misc/cxl/sysfs.c:181:48-53: WARNING: conversion to bool not
> needed here
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---


Thanks!
Acked-by: Frederic Barrat <fbarrat@linux.ibm.com>


>   drivers/misc/cxl/sysfs.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/cxl/sysfs.c b/drivers/misc/cxl/sysfs.c
> index d97a243..c173a5e 100644
> --- a/drivers/misc/cxl/sysfs.c
> +++ b/drivers/misc/cxl/sysfs.c
> @@ -178,7 +178,7 @@ static ssize_t perst_reloads_same_image_store(struct device *device,
>   	if ((rc != 1) || !(val == 1 || val == 0))
>   		return -EINVAL;
>   
> -	adapter->perst_same_image = (val == 1 ? true : false);
> +	adapter->perst_same_image = (val == 1);
>   	return count;
>   }
>   
> 
