Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE8D26368E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 21:22:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BmsNb2ZbjzDqZT
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 05:22:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Xn3olNCn; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BmsLs4V1gzDqZH
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Sep 2020 05:21:09 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 089J5enk077421; Wed, 9 Sep 2020 15:20:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=wI2LxfXNbDDIWk+xzWG3L8PJPVjUR3KEWKVAUC1zG7g=;
 b=Xn3olNCnyQbPW4fO0sfB3M7imcUtD4sOJvn2ymxDutok9DNIPUHONSFCc66B6WA8kdXY
 zJ/mAokkqV08mqDeNW6p8yyWyQVInV/ESL9vIwHlKtz0EwH8kpcl7Ve8fkKjf1dkk9n7
 hPI9aJG0wX+t2TTAnhOXssLhNF7iqPQek3ldRELGWbn5EDt4EEGzRhpzl15uGdYcs5Pt
 RltwfBEsK21HHeuO/VExL/1tBXWlzh2CbNm6dVGcQen93Ud0w6tHTWEJiKLxm8FmkVHf
 X70WSYR9YRAyssOis21kz/PH6he9aAjy6jJN+OoqR51b86i/6hOP+AT0KfDk4tCpDUxD YA== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33f47eshya-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Sep 2020 15:20:58 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 089JBtJP026932;
 Wed, 9 Sep 2020 19:20:57 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma01dal.us.ibm.com with ESMTP id 33d46mw1m8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Sep 2020 19:20:57 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 089JKuCj49873192
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 9 Sep 2020 19:20:56 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 56765AE060;
 Wed,  9 Sep 2020 19:20:56 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 163E2AE05F;
 Wed,  9 Sep 2020 19:20:55 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.65.215.230])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  9 Sep 2020 19:20:54 +0000 (GMT)
Subject: Re: [PATCH] scsi: ibmvfc: Fix error return in ibmvfc_probe()
To: Jing Xiangfeng <jingxiangfeng@huawei.com>, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org, jejb@linux.ibm.com,
 martin.petersen@oracle.com
References: <20200907083949.154251-1-jingxiangfeng@huawei.com>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
Message-ID: <93fb2dbf-b386-4009-95e2-508c56c68607@linux.ibm.com>
Date: Wed, 9 Sep 2020 12:20:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200907083949.154251-1-jingxiangfeng@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-09_13:2020-09-09,
 2020-09-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 phishscore=0 mlxlogscore=999 suspectscore=2 lowpriorityscore=0 spamscore=0
 clxscore=1011 malwarescore=0 adultscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009090169
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/7/20 1:39 AM, Jing Xiangfeng wrote:
> Fix to return error code PTR_ERR() from the error handling case instead
> of 0.
> 
> Signed-off-by: Jing Xiangfeng <jingxiangfeng@huawei.com>

Acked-by: Tyrel Datwyler <tyreld@linux.ibm.com>

> ---
>  drivers/scsi/ibmvscsi/ibmvfc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
> index ea7c8930592d..70daa0605082 100644
> --- a/drivers/scsi/ibmvscsi/ibmvfc.c
> +++ b/drivers/scsi/ibmvscsi/ibmvfc.c
> @@ -4928,6 +4928,7 @@ static int ibmvfc_probe(struct vio_dev *vdev, const struct vio_device_id *id)
>  	if (IS_ERR(vhost->work_thread)) {
>  		dev_err(dev, "Couldn't create kernel thread: %ld\n",
>  			PTR_ERR(vhost->work_thread));
> +		rc = PTR_ERR(vhost->work_thread);
>  		goto free_host_mem;
>  	}
>  
> 

