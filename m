Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 960B142E4B0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 01:16:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HVldm2273z2ynJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 10:16:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nJ74ofw8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=nJ74ofw8; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HVlcz0Jzdz2yHX
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Oct 2021 10:15:46 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19EKdq4B013490; 
 Thu, 14 Oct 2021 19:15:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=to : cc : references :
 subject : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=cCbkqufKm/LzI41BMQVYIhYz7oSMXKDVX6lxZMNyusM=;
 b=nJ74ofw8dynrPumFYQsc+E4a4WJRTNOsfgG6LT9QCQG1DCAsLj1gl6Bh4QMyDVuHfj5A
 r85LJYgUqPQIGFvVNPAvnAsJzfAjlcpvamKMt6nwLFP0Nd9dVKZ/gC2ZBBL9axkoW3vy
 h0BN/JwpoMxbFl2u9PbrYgKrJhQ5Ivc995b2BAJvsaVrfBqaoGpc7SINXQPzPciiEvEG
 6hPyAzXbc1kqEpCyn4+FwWYc2PH79yTOHkFazS2QiuUT3gRwk6WYYhTsmCCgOkpznxRm
 BV2CBmUEbkasHQtFQkVmilIuzg6TPUBb2p7fvI8+UhOVGaVSayndqMKhuFwhmc3gTEot UQ== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bpus8jtx5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Oct 2021 19:15:42 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19ENDkXw025318;
 Thu, 14 Oct 2021 23:15:39 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma02dal.us.ibm.com with ESMTP id 3bnm2f15eq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Oct 2021 23:15:39 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19ENFc9Y41025886
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Oct 2021 23:15:38 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5F1EDB206C;
 Thu, 14 Oct 2021 23:15:38 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8254DB206E;
 Thu, 14 Oct 2021 23:15:37 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.65.220.106])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 14 Oct 2021 23:15:37 +0000 (GMT)
To: tyreld@linux.vnet.ibm.com
References: <1547089149-20577-1-git-send-email-tyreld@linux.vnet.ibm.com>
Subject: Re: [PATCH] ibmvscsi: use GFP_KERNEL with dma_alloc_coherent in
 initialize_event_pool
From: Tyrel Datwyler <tyreld@linux.ibm.com>
Message-ID: <bbab1043-ee3a-6d5b-7ff5-ea5ed84e9fb8@linux.ibm.com>
Date: Thu, 14 Oct 2021 16:15:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <1547089149-20577-1-git-send-email-tyreld@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 2X6hSS2uRndpUdDnPelK54ypMf5nzmcE
X-Proofpoint-ORIG-GUID: 2X6hSS2uRndpUdDnPelK54ypMf5nzmcE
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-14_11,2021-10-14_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1011 priorityscore=1501 suspectscore=0
 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110140129
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
Cc: brking@linux.vnet.ibm.com, james.bottomley@hansenpartnership.com,
 linuxppc-dev@lists.ozlabs.org, martin.petersen@oracle.com,
 linux-scsi@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Just stumbled upon this trivial little patch that looks to have gotten lost in
the shuffle. Seems it even got a reviewed-by from Brian [1].

So, uh I guess after almost 3 years...ping?

-Tyrel

[1]
https://yhbt.net/lore/all/fd33df0e-012b-e437-c6e9-29cd0883808d@linux.vnet.ibm.com/

On 01/09/2019 08:59 PM, Tyrel Datwyler wrote:
> During driver probe we allocate a dma region for our event pool.
> Currently, zero is passed for the gfp_flags parameter. Driver probe
> callbacks run in process context and we hold no locks so we can sleep
> here if necessary.
>
> Fix by passing GFP_KERNEL explicitly to dma_alloc_coherent().
>
> Signed-off-by: Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
> ---
>  drivers/scsi/ibmvscsi/ibmvscsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/scsi/ibmvscsi/ibmvscsi.c b/drivers/scsi/ibmvscsi/ibmvscsi.c
> index cb8535e..10d5e77 100644
> --- a/drivers/scsi/ibmvscsi/ibmvscsi.c
> +++ b/drivers/scsi/ibmvscsi/ibmvscsi.c
> @@ -465,7 +465,7 @@ static int initialize_event_pool(struct event_pool *pool,
>  	pool->iu_storage =
>  	    dma_alloc_coherent(hostdata->dev,
>  			       pool->size * sizeof(*pool->iu_storage),
> -			       &pool->iu_token, 0);
> +			       &pool->iu_token, GFP_KERNEL);
>  	if (!pool->iu_storage) {
>  		kfree(pool->events);
>  		return -ENOMEM;
>
