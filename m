Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5262CF7DB
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Dec 2020 01:17:05 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cnqrb2XZ7zDrMb
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Dec 2020 11:17:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=gJiJGbRJ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CnqpZ6LdVzDrWW
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Dec 2020 11:15:17 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B508H2h104220; Fri, 4 Dec 2020 19:15:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=WgM17G/SUjkBI+KP1DQtZj0n82LAcN9MHV72Ex2/3bs=;
 b=gJiJGbRJBZqonN2zy7rGQV+66+pBuTGaidQPzcxAisbAbxB7cmklxVhv4l0exZmoXQhe
 NmuRvDCv1z1b4HwTo1I2+4burOiS6Agd/mq2VICoxtM8QT4poHSxHSXw2qUuYDGio2tK
 g7m06dKTWRge21nsvXCaJOxwPYcIQrDctye7s72KvUS9s/Nz1bTcMZ0kLVz6rGA1MYIQ
 XHYGcE2YLWtr3b8WGLeG71IrFSyUrxQKk+7RTmwaeTEFQsVveQz9iNPy4S493v7B50i8
 DFlDpAJSqOlOgY1WgmqXLHTLlZkp1vQ2HnFLI2weaCCZXpANZ4aGA84x80cOGVkF76NB 9A== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 357h7gm53t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Dec 2020 19:15:12 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B507ctY015599;
 Sat, 5 Dec 2020 00:15:11 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma04wdc.us.ibm.com with ESMTP id 354ysv5r6v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 05 Dec 2020 00:15:11 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B50FB3262783756
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 5 Dec 2020 00:15:11 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 20949112066;
 Sat,  5 Dec 2020 00:15:11 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E3B1E112063;
 Sat,  5 Dec 2020 00:15:08 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.65.215.138])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Sat,  5 Dec 2020 00:15:08 +0000 (GMT)
Subject: Re: [PATCH v3 04/18] ibmvfc: add alloc/dealloc routines for SCSI
 Sub-CRQ Channels
To: Brian King <brking@linux.vnet.ibm.com>,
 james.bottomley@hansenpartnership.com
References: <20201203020806.14747-1-tyreld@linux.ibm.com>
 <20201203020806.14747-5-tyreld@linux.ibm.com>
 <b372b257-49d8-16ae-2390-9617222e4cd9@linux.vnet.ibm.com>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
Message-ID: <42213f04-a971-add5-1295-e3df95e2530a@linux.ibm.com>
Date: Fri, 4 Dec 2020 16:15:08 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <b372b257-49d8-16ae-2390-9617222e4cd9@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-04_13:2020-12-04,
 2020-12-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0
 suspectscore=2 spamscore=0 priorityscore=1501 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 adultscore=0 mlxscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012040134
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

On 12/4/20 6:47 AM, Brian King wrote:
> On 12/2/20 8:07 PM, Tyrel Datwyler wrote:
>> @@ -4983,6 +4993,118 @@ static int ibmvfc_init_crq(struct ibmvfc_host *vhost)
>>  	return retrc;
>>  }
>>  
>> +static int ibmvfc_register_scsi_channel(struct ibmvfc_host *vhost,
>> +				  int index)
>> +{
>> +	struct device *dev = vhost->dev;
>> +	struct vio_dev *vdev = to_vio_dev(dev);
>> +	struct ibmvfc_sub_queue *scrq = &vhost->scsi_scrqs.scrqs[index];
>> +	int rc = -ENOMEM;
>> +
>> +	ENTER;
>> +
>> +	scrq->msgs = (struct ibmvfc_sub_crq *)get_zeroed_page(GFP_KERNEL);
>> +	if (!scrq->msgs)
>> +		return rc;
>> +
>> +	scrq->size = PAGE_SIZE / sizeof(*scrq->msgs);
>> +	scrq->msg_token = dma_map_single(dev, scrq->msgs, PAGE_SIZE,
>> +					 DMA_BIDIRECTIONAL);
>> +
>> +	if (dma_mapping_error(dev, scrq->msg_token))
>> +		goto dma_map_failed;
>> +
>> +	rc = h_reg_sub_crq(vdev->unit_address, scrq->msg_token, PAGE_SIZE,
>> +			   &scrq->cookie, &scrq->hw_irq);
>> +
>> +	if (rc) {
>> +		dev_warn(dev, "Error registering sub-crq: %d\n", rc);
>> +		if (rc == H_PARAMETER)
>> +			dev_warn_once(dev, "Firmware may not support MQ\n");
>> +		goto reg_failed;
>> +	}
>> +
>> +	scrq->hwq_id = index;
>> +	scrq->vhost = vhost;
>> +
>> +	LEAVE;
>> +	return 0;
>> +
>> +reg_failed:
>> +	dma_unmap_single(dev, scrq->msg_token, PAGE_SIZE, DMA_BIDIRECTIONAL);
>> +dma_map_failed:
>> +	free_page((unsigned long)scrq->msgs);
>> +	LEAVE;
>> +	return rc;
>> +}
>> +
>> +static void ibmvfc_deregister_scsi_channel(struct ibmvfc_host *vhost, int index)
>> +{
>> +	struct device *dev = vhost->dev;
>> +	struct vio_dev *vdev = to_vio_dev(dev);
>> +	struct ibmvfc_sub_queue *scrq = &vhost->scsi_scrqs.scrqs[index];
>> +	long rc;
>> +
>> +	ENTER;
>> +
>> +	do {
>> +		rc = plpar_hcall_norets(H_FREE_SUB_CRQ, vdev->unit_address,
>> +					scrq->cookie);
>> +	} while (rc == H_BUSY || H_IS_LONG_BUSY(rc));
>> +
>> +	if (rc)
>> +		dev_err(dev, "Failed to free sub-crq[%d]: rc=%ld\n", index, rc);
>> +
>> +	dma_unmap_single(dev, scrq->msg_token, PAGE_SIZE, DMA_BIDIRECTIONAL);
>> +	free_page((unsigned long)scrq->msgs);
>> +	LEAVE;
>> +}
>> +
>> +static int ibmvfc_init_sub_crqs(struct ibmvfc_host *vhost)
>> +{
>> +	int i, j;
>> +
>> +	ENTER;
>> +
>> +	vhost->scsi_scrqs.scrqs = kcalloc(IBMVFC_SCSI_HW_QUEUES,
>> +					  sizeof(*vhost->scsi_scrqs.scrqs),
>> +					  GFP_KERNEL);
>> +	if (!vhost->scsi_scrqs.scrqs)
>> +		return -1;
>> +
>> +	for (i = 0; i < IBMVFC_SCSI_HW_QUEUES; i++) {
>> +		if (ibmvfc_register_scsi_channel(vhost, i)) {
>> +			for (j = i; j > 0; j--)
>> +				ibmvfc_deregister_scsi_channel(vhost, j - 1);
>> +			kfree(vhost->scsi_scrqs.scrqs);
>> +			vhost->scsi_scrqs.scrqs = NULL;
>> +			vhost->scsi_scrqs.active_queues = 0;
>> +			LEAVE;
>> +			return -1;
>> +		}
>> +	}
>> +
>> +	LEAVE;
>> +	return 0;
>> +}
>> +
>> +static void ibmvfc_release_sub_crqs(struct ibmvfc_host *vhost)
>> +{
>> +	int i;
>> +
>> +	ENTER;
>> +	if (!vhost->scsi_scrqs.scrqs)
>> +		return;
>> +
>> +	for (i = 0; i < IBMVFC_SCSI_HW_QUEUES; i++)
>> +		ibmvfc_deregister_scsi_channel(vhost, i);
>> +
>> +	kfree(vhost->scsi_scrqs.scrqs);
>> +	vhost->scsi_scrqs.scrqs = NULL;
>> +	vhost->scsi_scrqs.active_queues = 0;
>> +	LEAVE;
>> +}
>> +
>>  /**
>>   * ibmvfc_free_mem - Free memory for vhost
>>   * @vhost:	ibmvfc host struct
>> @@ -5239,6 +5361,12 @@ static int ibmvfc_probe(struct vio_dev *vdev, const struct vio_device_id *id)
>>  		goto remove_shost;
>>  	}
>>  
>> +	if (vhost->mq_enabled) {
>> +		rc = ibmvfc_init_sub_crqs(vhost);
>> +		if (rc)
>> +			dev_warn(dev, "Failed to allocate Sub-CRQs. rc=%d\n", rc);
> 
> So, I think if you end up down this path, you will have:
> 
> vhost->scsi_scrqs.scrqs == NULL
> vhost->scsi_scrqs.active_queues == 0
> 
> And you proceed with discovery. You will proceed with enquiry and channel setup.
> Then, I think you could end up in queuecommand doing this
> 
> evt->hwq = hwq % vhost->scsi_scrqs.active_queues;
> 
> And that is a divide by zero...

Actually, we would bite the dust earlier than that but it requires the sub-crq
allocation to fail for a reason other than lack of firmware support. In the no
firmware support case the VIOS doesn't report channel support and we skip the
enquiry and setup steps. However, in the case where there is support and
allocation fails we would dereference a NULL pointer trying to write the channel
sub-crq handles into the channel_setup MAD.

> 
> I wonder if it would be better in this scenario where registering the sub crqs fails,
> if you just did:
> 
> vhost->do_enquiry = 0;
> vhost->mq_enabled = 0;
> vhost->using_channels = 0;
> 
> It looks like you only try to allocate the subcrqs in probe, so if that fails, we'd
> never end up using mq, so just disabling in this case seems reasonable.

This breaks migration from legacy to a target with channel support. It appears
that migration for that case is already broken anyways. Need to rethink sub-crq
setup. Maybe best to actually do it during the negoation steps instead of in probe.

-Tyrel

> 
> Thanks,
> 
> Brian
> 

