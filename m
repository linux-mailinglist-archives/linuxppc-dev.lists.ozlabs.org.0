Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFD742E207
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Oct 2021 21:26:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HVfXJ5HKvz30R1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 06:26:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fmK5trA1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=fmK5trA1; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HVfWV1QnXz2yNf
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Oct 2021 06:25:41 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19EHlw7K022386; 
 Thu, 14 Oct 2021 15:25:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 mime-version; s=pp1; bh=T+FTQs9iC3vHNPf7SovINCy/F5ijYl2mOFuFPVuo+m8=;
 b=fmK5trA1WcDRh89vftUEbaYc4LjT13bWDgpCHbpTAHJmiaOVq2wL7kKpy4bOc74ajVMZ
 awr6WQ1yL0BX14Js9Vi2pifEIcPtniFv8eaZVCiSWr42bg2wnxeqzCaurNHOmuUFXiCN
 YtC48atOTq2dq9ASO+lnaHmcgy9fCgVudSiKSR1dg9RRGwK0K0FUZ3KzwW8XQ5RNbzZ1
 cf0u4aAY+gfCptZYzu4andUr5M7LrMkbEOa49vVeYDAnYer99yKQfOPFO34zf1OrHNej
 ka/v9g0DXHYALdA9MSbPcDl8faF0MX5e39gCVPAbXWxb9ZFggHX6Ijk+wdhCvKoiG3oy hQ== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bps921xy3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Oct 2021 15:25:36 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19EJHofj016595;
 Thu, 14 Oct 2021 19:25:35 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04dal.us.ibm.com with ESMTP id 3bkeq8smdh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Oct 2021 19:25:35 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19EJPXeA47644970
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Oct 2021 19:25:33 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 677916A054;
 Thu, 14 Oct 2021 19:25:33 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 447F06A051;
 Thu, 14 Oct 2021 19:25:33 +0000 (GMT)
Received: from localhost (unknown [9.211.53.229])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 14 Oct 2021 19:25:33 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Cai Huoqing <caihuoqing@baidu.com>
Subject: Re: [PATCH v2] scsi: ibmvscsi: Use dma_alloc_noncoherent() instead
 of get_zeroed_page/dma_map_single()
In-Reply-To: <20211012032317.2360-1-caihuoqing@baidu.com>
References: <20211012032317.2360-1-caihuoqing@baidu.com>
Date: Thu, 14 Oct 2021 14:25:32 -0500
Message-ID: <878ryvz9w3.fsf@linux.ibm.com>
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Fwemt4NK7GdPjxbk-RoXEt7GPzNnhFpZ
X-Proofpoint-GUID: Fwemt4NK7GdPjxbk-RoXEt7GPzNnhFpZ
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-14_10,2021-10-14_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=849
 lowpriorityscore=0 spamscore=0 clxscore=1011 priorityscore=1501
 suspectscore=0 malwarescore=0 phishscore=0 mlxscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110140107
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, linux-scsi@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Cai Huoqing <caihuoqing@baidu.com> writes:
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


This version appears to retain the build breakage from v1 which was
reported here:

https://lore.kernel.org/linuxppc-dev/202110121452.nWPHZeZg-lkp@intel.com/

   drivers/scsi/ibmvscsi/ibmvscsi.c: In function 'ibmvscsi_init_crq_queue':
>> drivers/scsi/ibmvscsi/ibmvscsi.c:334:21: error: 'struct crq_queue' has no member named 'msg'; did you mean 'msgs'?
     334 |         if (!queue->msg)
         |                     ^~~
         |                     msgs
   drivers/scsi/ibmvscsi/ibmvscsi.c:388:60: error: 'struct crq_queue' has no member named 'msg'; did you mean 'msgs'?
     388 |         dma_free_coherent(hostdata->dev, PAGE_SIZE, queue->msg, queue->msg_token);
         |                                                            ^~~
         |                                                            msgs

