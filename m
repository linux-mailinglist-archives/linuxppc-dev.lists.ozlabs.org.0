Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3028482D80A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jan 2024 12:06:34 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QQ5H9Wpk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TD8Th0txzz3bn7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jan 2024 22:06:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QQ5H9Wpk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TD8Sq0TMcz30f8
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jan 2024 22:05:46 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40FArmvJ031597;
	Mon, 15 Jan 2024 11:05:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=n+SxP4a1Echsd2W48WiaYeGB/mW2FQoZ7a5VMYNkOkY=;
 b=QQ5H9WpkCERwUjDkb27SNrfNP4wc5fPQOHq3tusma95TUII00wYsBq85qgpV/dS+VwsH
 NZwuutrRA7MpKyIdyfoPW/Vrh6A0jYkyr/Wx7ijmDHAdP8CwkVy01uWMMQR0mXp8Obs9
 geYBj9x7zx7bwwS+VKJRClKaju2wB+IUhRRpJ68M4p3JxaWIwfOMDsEKGeKsE3PPbLU0
 KoUQ7yJrNmLNQbVyrmoQ2umZ2lpGbSpQScdI2LgDa9taYHrcJe8CqBBKu7ikLzFe9tkT
 RKJbh+NmlWDdzTg8Qvgboc9hoUFM0KzEHM46mtAiIOSMjOP9eL4zkQdk39iNpQnwP0IB zQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vmqju6a1n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Jan 2024 11:05:27 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40FA6Jxh003268;
	Mon, 15 Jan 2024 11:05:26 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vmqju6a1e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Jan 2024 11:05:26 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 40FApW8k008775;
	Mon, 15 Jan 2024 11:05:25 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3vm57y7yax-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Jan 2024 11:05:25 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 40FB5NRo20906610
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 15 Jan 2024 11:05:23 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8F26520049;
	Mon, 15 Jan 2024 11:05:23 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 19BE320040;
	Mon, 15 Jan 2024 11:05:23 +0000 (GMT)
Received: from [9.171.7.113] (unknown [9.171.7.113])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 15 Jan 2024 11:05:23 +0000 (GMT)
Message-ID: <80f1ba0d-afae-4af7-8de7-9813cb22e741@linux.ibm.com>
Date: Mon, 15 Jan 2024 12:05:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] cxl: Fix null pointer dereference in cxl_get_fd
To: Kunwu Chan <chentao@kylinos.cn>, ajd@linux.ibm.com, arnd@arndb.de,
        mpe@ellerman.id.au, mrochs@linux.vnet.ibm.com
References: <20240112054903.133145-1-chentao@kylinos.cn>
Content-Language: en-US
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20240112054903.133145-1-chentao@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: JchAga7cNIfcyPNxpbIUp0MpQ_cdTOvI
X-Proofpoint-GUID: S8h4f2npXqJkgmLx0HW_uQuR3DTVBV7Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-15_06,2024-01-15_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 clxscore=1011
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 mlxscore=0
 mlxlogscore=833 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401150080
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Kunwu Chan <kunwu.chan@hotmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 12/01/2024 06:49, Kunwu Chan wrote:
> kasprintf() returns a pointer to dynamically allocated memory
> which can be NULL upon failure.
> 
> Uniformly handle resource release in error paths. And when an
> error occurs, an error pointer should be returned.
> 
> Fixes: bdecf76e319a ("cxl: Fix coredump generation when cxl_get_fd() is used")
> Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
> Cc: Kunwu Chan <kunwu.chan@hotmail.com>
> Suggested-by: Frederic Barrat <fbarrat@linux.ibm.com>
> ---

Thanks!
Acked-by: Frederic Barrat <fbarrat@linux.ibm.com>

   Fred


> v2: Deal with error path
> ---
>   drivers/misc/cxl/api.c | 18 ++++++++++++++----
>   1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/misc/cxl/api.c b/drivers/misc/cxl/api.c
> index d85c56530863..b49bc3d29fc0 100644
> --- a/drivers/misc/cxl/api.c
> +++ b/drivers/misc/cxl/api.c
> @@ -389,19 +389,22 @@ struct file *cxl_get_fd(struct cxl_context *ctx, struct file_operations *fops,
>   			int *fd)
>   {
>   	struct file *file;
> -	int rc, flags, fdtmp;
> +	int rc = 0, flags, fdtmp;
>   	char *name = NULL;
>   
>   	/* only allow one per context */
> -	if (ctx->mapping)
> -		return ERR_PTR(-EEXIST);
> +	if (ctx->mapping) {
> +		rc = -EEXIST;
> +		goto err;
> +	}
>   
>   	flags = O_RDWR | O_CLOEXEC;
>   
>   	/* This code is similar to anon_inode_getfd() */
>   	rc = get_unused_fd_flags(flags);
>   	if (rc < 0)
> -		return ERR_PTR(rc);
> +		goto err;
> +
>   	fdtmp = rc;
>   
>   	/*
> @@ -419,6 +422,10 @@ struct file *cxl_get_fd(struct cxl_context *ctx, struct file_operations *fops,
>   		fops = (struct file_operations *)&afu_fops;
>   
>   	name = kasprintf(GFP_KERNEL, "cxl:%d", ctx->pe);
> +	if (!name) {
> +		rc = -ENOMEM;
> +		goto err_fd;
> +	}
>   	file = cxl_getfile(name, fops, ctx, flags);
>   	kfree(name);
>   	if (IS_ERR(file))
> @@ -430,6 +437,9 @@ struct file *cxl_get_fd(struct cxl_context *ctx, struct file_operations *fops,
>   
>   err_fd:
>   	put_unused_fd(fdtmp);
> +err:
> +	if (rc < 0)
> +		return ERR_PTR(rc);
>   	return NULL;
>   }
>   EXPORT_SYMBOL_GPL(cxl_get_fd);
