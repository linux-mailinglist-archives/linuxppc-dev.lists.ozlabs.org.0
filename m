Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0B562C73F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 19:08:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NC9ys1sxYz3bYF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 05:08:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Zhw2CKpw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Zhw2CKpw;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NC9xt5gTVz3c7J
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 05:07:46 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AGHrQPd002878;
	Wed, 16 Nov 2022 18:07:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=33vGo23jr1ObZ4dxlthIsvji2G3EcQXOlR720DF8pyQ=;
 b=Zhw2CKpwfKA4uOK5W0XiP+GDKjLeThZipfAQSRW8u2vmW43OFdnHapyfIoReysbnKYg8
 VOotf7BpsQ8kaJrcO5n0iuAiylSKWA9oJZmHP7ZjChsWqTSyOXQ2fnnN6eLDhit9c4PP
 f4bg0iWfFjlI9IXiE7zdClhdXbV+e6kM31sWKgRKsDHTsiSokXyk3uhctk/H+yPXZFE4
 wiS71wpj8R+pAD8gyIxrfum2yS6395NedRWZEusfdeo0zyz+YZKd+iLLC2h1gddi0cCW
 indcbtGuRFeQ+Fb0wZ8/3EQ4XTLg1vAvNgmSEDKnCC+Z9OHscuzfh7UURu7FNuNeQ/aO rQ== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kw4nm0cfm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Nov 2022 18:07:36 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AGI6ftY014267;
	Wed, 16 Nov 2022 18:07:34 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma06ams.nl.ibm.com with ESMTP id 3kt2rjec71-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Nov 2022 18:07:33 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com [9.149.105.60])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AGI7Vow63701492
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Nov 2022 18:07:31 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8A7ED42041;
	Wed, 16 Nov 2022 18:07:31 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 40D9C4203F;
	Wed, 16 Nov 2022 18:07:31 +0000 (GMT)
Received: from [9.101.4.34] (unknown [9.101.4.34])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed, 16 Nov 2022 18:07:31 +0000 (GMT)
Message-ID: <df03ab33-0a6d-f114-bb1b-ff854d7550de@linux.ibm.com>
Date: Wed, 16 Nov 2022 19:07:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 2/2] cxl: fix possible null-ptr-deref in
 cxl_pci_init_afu|adapter()
Content-Language: en-US
To: Yang Yingliang <yangyingliang@huawei.com>, linuxppc-dev@lists.ozlabs.org
References: <20221111145440.2426970-1-yangyingliang@huawei.com>
 <20221111145440.2426970-2-yangyingliang@huawei.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20221111145440.2426970-2-yangyingliang@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 0HDVofoHmfu_513ecvJZ2cQmnAwFzHcy
X-Proofpoint-ORIG-GUID: 0HDVofoHmfu_513ecvJZ2cQmnAwFzHcy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-16_03,2022-11-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 phishscore=0 spamscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
> If device_register() fails in cxl_pci_afu|adapter(), the device
> is not added, device_unregister() can not be called in the error
> path, otherwise it will cause a null-ptr-deref because of removing
> not added device.
> 
> As comment of device_register() says, it should use put_device() to give
> up the reference in the error path. So split device_unregister() into
> device_del() and put_device(), then goes to put dev when register fails.
> 
> Fixes: f204e0b8cedd ("cxl: Driver code for powernv PCIe based cards for userspace access")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---


Acked-by: Frederic Barrat <fbarrat@linux.ibm.com>

   Fred


>   drivers/misc/cxl/pci.c | 20 ++++++++++++--------
>   1 file changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/misc/cxl/pci.c b/drivers/misc/cxl/pci.c
> index 3de0aea62ade..6d495d641c95 100644
> --- a/drivers/misc/cxl/pci.c
> +++ b/drivers/misc/cxl/pci.c
> @@ -1164,10 +1164,10 @@ static int pci_init_afu(struct cxl *adapter, int slice, struct pci_dev *dev)
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
>   	adapter->afu[afu->slice] = afu;
>   
> @@ -1176,10 +1176,12 @@ static int pci_init_afu(struct cxl *adapter, int slice, struct pci_dev *dev)
>   
>   	return 0;
>   
> -err_put1:
> +err_del_dev:
> +	device_del(&afu->dev);
> +err_put_dev:
>   	pci_deconfigure_afu(afu);
>   	cxl_debugfs_afu_remove(afu);
> -	device_unregister(&afu->dev);
> +	put_device(&afu->dev);
>   	return rc;
>   
>   err_free_native:
> @@ -1667,23 +1669,25 @@ static struct cxl *cxl_pci_init_adapter(struct pci_dev *dev)
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
>   	/* Release the context lock as adapter is configured */
>   	cxl_adapter_context_unlock(adapter);
>   
>   	return adapter;
>   
> -err_put1:
> +err_del_dev:
> +	device_del(&adapter->dev);
> +err_put_dev:
>   	/* This should mirror cxl_remove_adapter, except without the
>   	 * sysfs parts
>   	 */
>   	cxl_debugfs_adapter_remove(adapter);
>   	cxl_deconfigure_adapter(adapter);
> -	device_unregister(&adapter->dev);
> +	put_device(&adapter->dev);
>   	return ERR_PTR(rc);
>   
>   err_release:
