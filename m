Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 374478030CC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Dec 2023 11:44:36 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AYCX44ub;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SkKzj5BhKz3cZ5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Dec 2023 21:44:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AYCX44ub;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SkKyp6wGNz3bpp
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Dec 2023 21:43:46 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B4AI0JS015598;
	Mon, 4 Dec 2023 10:43:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=yck7Sg1fkSFdwL5QojOnd3gIXKfA6cZophichAG2+xs=;
 b=AYCX44ubxV1/PSPNOYSo3OoFdf0YIRUtHMFXO2tVob587J/KkkZ7+7Svcfvdq8o8skUj
 JzYLZGHG5Lz7oQdVpzNI0g/81SSkzEvu78WUIOk78030dO/C+QnqgIWl+lZWiig6AmsK
 ANxrp2lhVdQPGMpAIij5NhWz7U9N3kNNEwNiBnVMz0wMcZSxVw02/oUunvs1pA9MOCLm
 No1ajQf/w9Z4cNDu+awZY2FJQ7oKCEF6NcJZm0t6X0c7qa+cLf32FpFPdm5WmVyBgRkv
 imwUBi2qLsAGH9ilVXuhC6dkMsnH2LX+MOUGYR6eCUXoVZGVGq2qS6DVNdimqnyPtKIP eg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uscw4gut2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Dec 2023 10:43:16 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3B4AINko017299;
	Mon, 4 Dec 2023 10:43:16 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uscw4gusp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Dec 2023 10:43:16 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3B4AXsrH029121;
	Mon, 4 Dec 2023 10:43:15 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3urv8dmcda-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Dec 2023 10:43:15 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3B4AhDIT23069192
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 4 Dec 2023 10:43:13 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8BA6320040;
	Mon,  4 Dec 2023 10:43:13 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 058AE2004B;
	Mon,  4 Dec 2023 10:43:13 +0000 (GMT)
Received: from [9.171.74.235] (unknown [9.171.74.235])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  4 Dec 2023 10:43:12 +0000 (GMT)
Message-ID: <c914f4ba-253d-4b57-bdd2-4c95d40bbf91@linux.ibm.com>
Date: Mon, 4 Dec 2023 11:43:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cxl: Fix null pointer dereference in cxl_get_fd
To: Kunwu Chan <chentao@kylinos.cn>, ajd@linux.ibm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, mpe@ellerman.id.au,
        mrochs@linux.vnet.ibm.com
References: <20231204020745.2445944-1-chentao@kylinos.cn>
Content-Language: en-US
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20231204020745.2445944-1-chentao@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: YMk3lE-uDcZCcR3NcJ2MvL9pLVpT5A0f
X-Proofpoint-ORIG-GUID: HFcsBiLNRHDuySOzizfLcbuBZCwD31y2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-04_06,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 clxscore=1011
 adultscore=0 phishscore=0 spamscore=0 suspectscore=0 mlxscore=0
 mlxlogscore=851 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2312040081
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, kunwu.chan@hotmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 04/12/2023 03:07, Kunwu Chan wrote:
> kasprintf() returns a pointer to dynamically allocated memory
> which can be NULL upon failure.
> 
> Fixes: bdecf76e319a ("cxl: Fix coredump generation when cxl_get_fd() is used")
> Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
> ---
>   drivers/misc/cxl/api.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/misc/cxl/api.c b/drivers/misc/cxl/api.c
> index d85c56530863..bfd7ccd4d7e1 100644
> --- a/drivers/misc/cxl/api.c
> +++ b/drivers/misc/cxl/api.c
> @@ -419,6 +419,10 @@ struct file *cxl_get_fd(struct cxl_context *ctx, struct file_operations *fops,
>   		fops = (struct file_operations *)&afu_fops;
>   
>   	name = kasprintf(GFP_KERNEL, "cxl:%d", ctx->pe);
> +	if (!name) {
> +		put_unused_fd(fdtmp);
> +		return ERR_PTR(-ENOMEM);
> +	}


That works, but you might as well follow the existing error path:

	name = kasprintf(GFP_KERNEL, "cxl:%d", ctx->pe);
	if (!name)
		goto err_fd;

   Fred


>   	file = cxl_getfile(name, fops, ctx, flags);
>   	kfree(name);
>   	if (IS_ERR(file))
