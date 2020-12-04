Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE262CF004
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 15:50:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CnbGs1zhDzDrfT
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Dec 2020 01:50:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=brking@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=fKDVzZi9; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CnbCB1qG7zDrfF
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Dec 2020 01:47:18 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B4Ecgvk072487; Fri, 4 Dec 2020 09:47:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=O/3d67bel08Jwwdc8/L+X/AO1Rj/mB+H+1sQLgHRnpI=;
 b=fKDVzZi95SmJ5nPQMr3VTmYhXf2CK4Yqc/Eq7yL9PQthxm7iqT1VLRW3RKVU2SNyApVi
 ruhjT+nAxD8GsqzIouYl2zqVShV3b/tWARDw4s+AGnRG74vneaCEFArtUP8Ywn8Ovx5Q
 gBWAVZu/2qfOq7hwPE20C0G1X2hVHFNe9YWoOrFmByo3tNpaQjnDk5UkavJPmcaevrZJ
 pOqWSMgIsY1tiNAVnRQDloz+nkWDJLWpVlPhxNsk7wvOmhGlIoteKrf8MGNMbyx2zlip
 tdEEFEFO1qrEDrKDQMgN+GsRQ0R6SakRUxEGh/qsY1vgNCsoumw5gwc0P7X9PlQ4xf08 Qw== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 357ps78m66-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Dec 2020 09:47:15 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B4Ehc4e010269;
 Fri, 4 Dec 2020 14:47:14 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01dal.us.ibm.com with ESMTP id 355rf86k9u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Dec 2020 14:47:14 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B4ElCio26018108
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Dec 2020 14:47:12 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AEC4E7805C;
 Fri,  4 Dec 2020 14:47:12 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3B8A878060;
 Fri,  4 Dec 2020 14:47:12 +0000 (GMT)
Received: from oc6034535106.ibm.com (unknown [9.163.73.174])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  4 Dec 2020 14:47:12 +0000 (GMT)
Subject: Re: [PATCH v3 04/18] ibmvfc: add alloc/dealloc routines for SCSI
 Sub-CRQ Channels
To: Tyrel Datwyler <tyreld@linux.ibm.com>,
 james.bottomley@hansenpartnership.com
References: <20201203020806.14747-1-tyreld@linux.ibm.com>
 <20201203020806.14747-5-tyreld@linux.ibm.com>
From: Brian King <brking@linux.vnet.ibm.com>
Message-ID: <b372b257-49d8-16ae-2390-9617222e4cd9@linux.vnet.ibm.com>
Date: Fri, 4 Dec 2020 08:47:11 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201203020806.14747-5-tyreld@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-04_05:2020-12-04,
 2020-12-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0 mlxlogscore=999
 suspectscore=2 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012040084
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
Cc: brking@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 linux-scsi@vger.kernel.org, martin.petersen@oracle.com,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/2/20 8:07 PM, Tyrel Datwyler wrote:
> @@ -4983,6 +4993,118 @@ static int ibmvfc_init_crq(struct ibmvfc_host *vhost)
>  	return retrc;
>  }
>  
> +static int ibmvfc_register_scsi_channel(struct ibmvfc_host *vhost,
> +				  int index)
> +{
> +	struct device *dev = vhost->dev;
> +	struct vio_dev *vdev = to_vio_dev(dev);
> +	struct ibmvfc_sub_queue *scrq = &vhost->scsi_scrqs.scrqs[index];
> +	int rc = -ENOMEM;
> +
> +	ENTER;
> +
> +	scrq->msgs = (struct ibmvfc_sub_crq *)get_zeroed_page(GFP_KERNEL);
> +	if (!scrq->msgs)
> +		return rc;
> +
> +	scrq->size = PAGE_SIZE / sizeof(*scrq->msgs);
> +	scrq->msg_token = dma_map_single(dev, scrq->msgs, PAGE_SIZE,
> +					 DMA_BIDIRECTIONAL);
> +
> +	if (dma_mapping_error(dev, scrq->msg_token))
> +		goto dma_map_failed;
> +
> +	rc = h_reg_sub_crq(vdev->unit_address, scrq->msg_token, PAGE_SIZE,
> +			   &scrq->cookie, &scrq->hw_irq);
> +
> +	if (rc) {
> +		dev_warn(dev, "Error registering sub-crq: %d\n", rc);
> +		if (rc == H_PARAMETER)
> +			dev_warn_once(dev, "Firmware may not support MQ\n");
> +		goto reg_failed;
> +	}
> +
> +	scrq->hwq_id = index;
> +	scrq->vhost = vhost;
> +
> +	LEAVE;
> +	return 0;
> +
> +reg_failed:
> +	dma_unmap_single(dev, scrq->msg_token, PAGE_SIZE, DMA_BIDIRECTIONAL);
> +dma_map_failed:
> +	free_page((unsigned long)scrq->msgs);
> +	LEAVE;
> +	return rc;
> +}
> +
> +static void ibmvfc_deregister_scsi_channel(struct ibmvfc_host *vhost, int index)
> +{
> +	struct device *dev = vhost->dev;
> +	struct vio_dev *vdev = to_vio_dev(dev);
> +	struct ibmvfc_sub_queue *scrq = &vhost->scsi_scrqs.scrqs[index];
> +	long rc;
> +
> +	ENTER;
> +
> +	do {
> +		rc = plpar_hcall_norets(H_FREE_SUB_CRQ, vdev->unit_address,
> +					scrq->cookie);
> +	} while (rc == H_BUSY || H_IS_LONG_BUSY(rc));
> +
> +	if (rc)
> +		dev_err(dev, "Failed to free sub-crq[%d]: rc=%ld\n", index, rc);
> +
> +	dma_unmap_single(dev, scrq->msg_token, PAGE_SIZE, DMA_BIDIRECTIONAL);
> +	free_page((unsigned long)scrq->msgs);
> +	LEAVE;
> +}
> +
> +static int ibmvfc_init_sub_crqs(struct ibmvfc_host *vhost)
> +{
> +	int i, j;
> +
> +	ENTER;
> +
> +	vhost->scsi_scrqs.scrqs = kcalloc(IBMVFC_SCSI_HW_QUEUES,
> +					  sizeof(*vhost->scsi_scrqs.scrqs),
> +					  GFP_KERNEL);
> +	if (!vhost->scsi_scrqs.scrqs)
> +		return -1;
> +
> +	for (i = 0; i < IBMVFC_SCSI_HW_QUEUES; i++) {
> +		if (ibmvfc_register_scsi_channel(vhost, i)) {
> +			for (j = i; j > 0; j--)
> +				ibmvfc_deregister_scsi_channel(vhost, j - 1);
> +			kfree(vhost->scsi_scrqs.scrqs);
> +			vhost->scsi_scrqs.scrqs = NULL;
> +			vhost->scsi_scrqs.active_queues = 0;
> +			LEAVE;
> +			return -1;
> +		}
> +	}
> +
> +	LEAVE;
> +	return 0;
> +}
> +
> +static void ibmvfc_release_sub_crqs(struct ibmvfc_host *vhost)
> +{
> +	int i;
> +
> +	ENTER;
> +	if (!vhost->scsi_scrqs.scrqs)
> +		return;
> +
> +	for (i = 0; i < IBMVFC_SCSI_HW_QUEUES; i++)
> +		ibmvfc_deregister_scsi_channel(vhost, i);
> +
> +	kfree(vhost->scsi_scrqs.scrqs);
> +	vhost->scsi_scrqs.scrqs = NULL;
> +	vhost->scsi_scrqs.active_queues = 0;
> +	LEAVE;
> +}
> +
>  /**
>   * ibmvfc_free_mem - Free memory for vhost
>   * @vhost:	ibmvfc host struct
> @@ -5239,6 +5361,12 @@ static int ibmvfc_probe(struct vio_dev *vdev, const struct vio_device_id *id)
>  		goto remove_shost;
>  	}
>  
> +	if (vhost->mq_enabled) {
> +		rc = ibmvfc_init_sub_crqs(vhost);
> +		if (rc)
> +			dev_warn(dev, "Failed to allocate Sub-CRQs. rc=%d\n", rc);

So, I think if you end up down this path, you will have:

vhost->scsi_scrqs.scrqs == NULL
vhost->scsi_scrqs.active_queues == 0

And you proceed with discovery. You will proceed with enquiry and channel setup.
Then, I think you could end up in queuecommand doing this:

evt->hwq = hwq % vhost->scsi_scrqs.active_queues;

And that is a divide by zero...

I wonder if it would be better in this scenario where registering the sub crqs fails,
if you just did:

vhost->do_enquiry = 0;
vhost->mq_enabled = 0;
vhost->using_channels = 0;

It looks like you only try to allocate the subcrqs in probe, so if that fails, we'd
never end up using mq, so just disabling in this case seems reasonable.

Thanks,

Brian

-- 
Brian King
Power Linux I/O
IBM Linux Technology Center

