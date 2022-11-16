Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8244A62C736
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 19:06:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NC9vz2KfVz3fBr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 05:06:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ug6x9DUX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ug6x9DUX;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NC9tk1gCgz3fRC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 05:05:01 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AGGmCjr004256;
	Wed, 16 Nov 2022 18:04:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=8si5+7BxFl4tp4i+Cn3UuDN0YWpqYcoOSvXYutlZBIg=;
 b=Ug6x9DUXAn2Do8E2DOJtCfrFjgTiBmd/YvoIOlFgQppTCeA8LQf6hrU6yGNVlhnOQfJB
 94PvuqXR+pk3joBzFy47bA0q5RuzoCfIQea9VVSjBlbgh92CHImC3zVohS867lDsL0EI
 2RdT5yckgAgPsfwQbbGxsSqfRIlDUcAUlmCQTUpFwqWm8vlk4Iku8HjgcuysiNGLe5fq
 J/Cd98efoRm0GbZXA5LAANIC3MT2nIqJTL/owOZ7wKualh7FFTeAmZMY8hCI9XV4gnDO
 5PFfakAOiFokpOg9JILhM6CHBoEYVGwbgk8Iz0GddLbChPo20YqE7OFNahCeail0Maei KQ== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kw3q1t1ee-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Nov 2022 18:04:50 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AGHoTRQ002024;
	Wed, 16 Nov 2022 18:04:48 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma06ams.nl.ibm.com with ESMTP id 3kt2rjec32-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Nov 2022 18:04:48 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com [9.149.105.60])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AGI4kGP34472664
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Nov 2022 18:04:46 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1708042041;
	Wed, 16 Nov 2022 18:04:46 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D04F04203F;
	Wed, 16 Nov 2022 18:04:45 +0000 (GMT)
Received: from [9.101.4.34] (unknown [9.101.4.34])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed, 16 Nov 2022 18:04:45 +0000 (GMT)
Message-ID: <a6b5d6bf-7f6b-8443-f82d-8def1b5ee18d@linux.ibm.com>
Date: Wed, 16 Nov 2022 19:04:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 1/2] cxl: fix possible null-ptr-deref in
 cxl_guest_init_afu|adapter()
Content-Language: en-US
To: Yang Yingliang <yangyingliang@huawei.com>, linuxppc-dev@lists.ozlabs.org
References: <20221111145440.2426970-1-yangyingliang@huawei.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20221111145440.2426970-1-yangyingliang@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: cj9SqHIsKtod2GXELqrxJKDNIbKUG2wV
X-Proofpoint-GUID: cj9SqHIsKtod2GXELqrxJKDNIbKUG2wV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-16_03,2022-11-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211160124
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
Cc: gregkh@linuxfoundation.org, ajd@linux.ibm.com, arnd@arndb.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 11/11/2022 15:54, Yang Yingliang wrote:
> If device_register() fails in cxl_register_afu|adapter(), the device
> is not added, device_unregister() can not be called in the error path,
> otherwise it will cause a null-ptr-deref because of removing not added
> device.
> 
> As comment of device_register() says, it should use put_device() to give
> up the reference in the error path. So split device_unregister() into
> device_del() and put_device(), then goes to put dev when register fails.
> 
> Fixes: 14baf4d9c739 ("cxl: Add guest-specific code")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---


Thanks for fixing it!
At first, I was slightly uneasy about calling device_del() and 
put_device() directly, i.e. it would be better not to worry about what's 
under the hood of device_unregister(). But 1) I don't see how else to 
fix it and 2) more importantly, I looked at the history of 
device_unregister() to see how frequently it changed. I can now rest 
easy :-)

Acked-by: Frederic Barrat <fbarrat@linux.ibm.com>

   Fred



>   drivers/misc/cxl/guest.c | 24 ++++++++++++++----------
>   1 file changed, 14 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/misc/cxl/guest.c b/drivers/misc/cxl/guest.c
> index 375f692ae9d6..fb95a2d5cef4 100644
> --- a/drivers/misc/cxl/guest.c
> +++ b/drivers/misc/cxl/guest.c
> @@ -965,10 +965,10 @@ int cxl_guest_init_afu(struct cxl *adapter, int slice, struct device_node *afu_n
>   	 * if it returns an error!
>   	 */
>   	if ((rc = cxl_register_afu(afu)))
> -		goto err_put1;
> +		goto err_put_dev;
>   
>   	if ((rc = cxl_sysfs_afu_add(afu)))
> -		goto err_put1;
> +		goto err_del_dev;
>   
>   	/*
>   	 * pHyp doesn't expose the programming models supported by the
> @@ -984,7 +984,7 @@ int cxl_guest_init_afu(struct cxl *adapter, int slice, struct device_node *afu_n
>   		afu->modes_supported = CXL_MODE_DIRECTED;
>   
>   	if ((rc = cxl_afu_select_best_mode(afu)))
> -		goto err_put2;
> +		goto err_remove_sysfs;
>   
>   	adapter->afu[afu->slice] = afu;
>   
> @@ -1004,10 +1004,12 @@ int cxl_guest_init_afu(struct cxl *adapter, int slice, struct device_node *afu_n
>   
>   	return 0;
>   
> -err_put2:
> +err_remove_sysfs:
>   	cxl_sysfs_afu_remove(afu);
> -err_put1:
> -	device_unregister(&afu->dev);
> +err_del_dev:
> +	device_del(&afu->dev);
> +err_put_dev:
> +	put_device(&afu->dev);
>   	free = false;
>   	guest_release_serr_irq(afu);
>   err2:
> @@ -1141,18 +1143,20 @@ struct cxl *cxl_guest_init_adapter(struct device_node *np, struct platform_devic
>   	 * even if it returns an error!
>   	 */
>   	if ((rc = cxl_register_adapter(adapter)))
> -		goto err_put1;
> +		goto err_put_dev;
>   
>   	if ((rc = cxl_sysfs_adapter_add(adapter)))
> -		goto err_put1;
> +		goto err_del_dev;
>   
>   	/* release the context lock as the adapter is configured */
>   	cxl_adapter_context_unlock(adapter);
>   
>   	return adapter;
>   
> -err_put1:
> -	device_unregister(&adapter->dev);
> +err_del_dev:
> +	device_del(&adapter->dev);
> +err_put_dev:
> +	put_device(&adapter->dev);
>   	free = false;
>   	cxl_guest_remove_chardev(adapter);
>   err1:
