Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0B942E3F3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 00:08:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HVk7n2Kw7z3c5v
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 09:08:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JgkB8ht6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=JgkB8ht6; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HVk6y5w7yz2xXf
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Oct 2021 09:08:10 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19EKbnfb002347; 
 Thu, 14 Oct 2021 18:07:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=gcqkgO7usWMi/qHhToo/mTrw8IHuIq/Ug6jZaEWgIVI=;
 b=JgkB8ht6SbLw8x+QDKzhIbQVIdeBiEzFQ60lTjaL8bJVj3Z46OuiJ3m3qdM0pI9wM2Pb
 NTjd6xlcVa8T/oHlBLvduAsy55dlEHVY4lJTWPkNIRI7fMKNSCmAyLWy3CtJjv9KgmuL
 BjkXLsK9+WrzPaFhOf5Dhxgg8fZRxizWFBpfU570sWXq3Ifea+5qjV3qvou7nwmm+cxr
 8Fht8Zr3BhNaq4K/MZ9iicdH0eXmRCfgLxVyq4qwkFXWO7FqGuCv1ur56DG+xmJVUNmE
 SwmJdTFBanFY3MTB7+GNskmWwanPLtaFYvsZwkeTkcpk58qOjHJpDIe5Y2Cc7oz4lkLq Hg== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bpurn1t36-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Oct 2021 18:07:58 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19ELppN7027402;
 Thu, 14 Oct 2021 22:07:58 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma05wdc.us.ibm.com with ESMTP id 3bk2qctmj4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Oct 2021 22:07:58 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19EM7vlP42598748
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Oct 2021 22:07:57 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 942BDB206B;
 Thu, 14 Oct 2021 22:07:57 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 70016B2067;
 Thu, 14 Oct 2021 22:07:56 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.65.220.106])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 14 Oct 2021 22:07:56 +0000 (GMT)
Subject: Re: [PATCH v2] scsi: ibmvscsi: Use dma_alloc_noncoherent() instead of
 get_zeroed_page/dma_map_single()
To: Cai Huoqing <caihuoqing@baidu.com>
References: <20211012032317.2360-1-caihuoqing@baidu.com>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
Message-ID: <0a2ef145-b84f-129a-c915-50f32aeeaa1d@linux.ibm.com>
Date: Thu, 14 Oct 2021 15:07:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211012032317.2360-1-caihuoqing@baidu.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _j95V1l7K9Lv-zgNFqw8wQ1RBemS559Q
X-Proofpoint-ORIG-GUID: _j95V1l7K9Lv-zgNFqw8wQ1RBemS559Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-14_11,2021-10-14_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 suspectscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1011 bulkscore=0 priorityscore=1501 mlxlogscore=999 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110140123
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
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-scsi@vger.kernel.org, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/11/21 8:23 PM, Cai Huoqing wrote:
> Replacing get_zeroed_page/free_page/dma_map_single/dma_unmap_single()
> with dma_alloc_noncoherent/dma_free_noncoherent() helps to reduce
> code size, and simplify the code, and the hardware can keeep DMA
> coherent itsel
Not sure why the switch from coherent in v1 to noncoherent in v2. I think that
was unnecessary and I believe requires explicit synchronization via
dma_sync_single_{for_device|for_cpu} calls.

Further, as both kernel-bot and Nathan have already pointed out this doesn't
even compile.

-Tyrel

> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
> v1->v2:
> 	*Change to dma_alloc/free_noncoherent from dma_alloc/free_coherent.
> 	*Update changelog.
> 
>  drivers/scsi/ibmvscsi/ibmvfc.c   | 16 ++++------------
>  drivers/scsi/ibmvscsi/ibmvscsi.c | 29 +++++++++--------------------
>  2 files changed, 13 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
> index 1f1586ad48fe..6e95fd02fd25 100644
> --- a/drivers/scsi/ibmvscsi/ibmvfc.c
> +++ b/drivers/scsi/ibmvscsi/ibmvfc.c
> @@ -869,8 +869,8 @@ static void ibmvfc_free_queue(struct ibmvfc_host *vhost,
>  {
>  	struct device *dev = vhost->dev;
>  
> -	dma_unmap_single(dev, queue->msg_token, PAGE_SIZE, DMA_BIDIRECTIONAL);
> -	free_page((unsigned long)queue->msgs.handle);
> +	dma_free_noncoherent(dev, PAGE_SIZE, queue->msgs.handle,
> +			     queue->msg_token, DMA_BIDIRECTIONAL);
>  	queue->msgs.handle = NULL;
>  
>  	ibmvfc_free_event_pool(vhost, queue);
> @@ -5663,19 +5663,11 @@ static int ibmvfc_alloc_queue(struct ibmvfc_host *vhost,
>  		return -ENOMEM;
>  	}
>  
> -	queue->msgs.handle = (void *)get_zeroed_page(GFP_KERNEL);
> +	queue->msgs.handle = dma_alloc_noncoherent(dev, PAGE_SIZE, &queue->msg_token,
> +						   DMA_BIDIRECTIONAL, GFP_KERNEL);
>  	if (!queue->msgs.handle)
>  		return -ENOMEM;
>  
> -	queue->msg_token = dma_map_single(dev, queue->msgs.handle, PAGE_SIZE,
> -					  DMA_BIDIRECTIONAL);
> -
> -	if (dma_mapping_error(dev, queue->msg_token)) {
> -		free_page((unsigned long)queue->msgs.handle);
> -		queue->msgs.handle = NULL;
> -		return -ENOMEM;
> -	}
> -
>  	queue->cur = 0;
>  	queue->fmt = fmt;
>  	queue->size = PAGE_SIZE / fmt_size;
> diff --git a/drivers/scsi/ibmvscsi/ibmvscsi.c b/drivers/scsi/ibmvscsi/ibmvscsi.c
> index ea8e01f49cba..68409c298c74 100644
> --- a/drivers/scsi/ibmvscsi/ibmvscsi.c
> +++ b/drivers/scsi/ibmvscsi/ibmvscsi.c
> @@ -151,10 +151,8 @@ static void ibmvscsi_release_crq_queue(struct crq_queue *queue,
>  			msleep(100);
>  		rc = plpar_hcall_norets(H_FREE_CRQ, vdev->unit_address);
>  	} while ((rc == H_BUSY) || (H_IS_LONG_BUSY(rc)));
> -	dma_unmap_single(hostdata->dev,
> -			 queue->msg_token,
> -			 queue->size * sizeof(*queue->msgs), DMA_BIDIRECTIONAL);
> -	free_page((unsigned long)queue->msgs);
> +	dma_free_noncoherent(hostdata->dev, PAGE_SIZE,
> +			     queue->msgs, queue->msg_token, DMA_BIDIRECTIONAL);
>  }
>  
>  /**
> @@ -331,18 +329,12 @@ static int ibmvscsi_init_crq_queue(struct crq_queue *queue,
>  	int retrc;
>  	struct vio_dev *vdev = to_vio_dev(hostdata->dev);
>  
> -	queue->msgs = (struct viosrp_crq *)get_zeroed_page(GFP_KERNEL);
> -
> -	if (!queue->msgs)
> -		goto malloc_failed;
>  	queue->size = PAGE_SIZE / sizeof(*queue->msgs);
> -
> -	queue->msg_token = dma_map_single(hostdata->dev, queue->msgs,
> -					  queue->size * sizeof(*queue->msgs),
> -					  DMA_BIDIRECTIONAL);
> -
> -	if (dma_mapping_error(hostdata->dev, queue->msg_token))
> -		goto map_failed;
> +	queue->msgs = dma_alloc_noncoherent(hostdata->dev,
> +					    PAGE_SIZE, &queue->msg_token,
> +					    DMA_BIDIRECTIONAL, GFP_KERNEL);
> +	if (!queue->msg)
> +		goto malloc_failed;
>  
>  	gather_partition_info();
>  	set_adapter_info(hostdata);
> @@ -395,11 +387,8 @@ static int ibmvscsi_init_crq_queue(struct crq_queue *queue,
>  		rc = plpar_hcall_norets(H_FREE_CRQ, vdev->unit_address);
>  	} while ((rc == H_BUSY) || (H_IS_LONG_BUSY(rc)));
>        reg_crq_failed:
> -	dma_unmap_single(hostdata->dev,
> -			 queue->msg_token,
> -			 queue->size * sizeof(*queue->msgs), DMA_BIDIRECTIONAL);
> -      map_failed:
> -	free_page((unsigned long)queue->msgs);
> +	dma_free_noncoherent(hostdata->dev, PAGE_SIZE, queue->msg,
> +			     queue->msg_token, DMA_BIDIRECTIONAL);
>        malloc_failed:
>  	return -1;
>  }
> 

