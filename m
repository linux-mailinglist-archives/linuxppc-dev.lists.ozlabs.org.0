Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BD56B2CC994
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 23:25:37 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CmYSv0S6MzDrBr
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 09:25:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=tJAomaqk; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CmYR0604PzDr8g
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Dec 2020 09:23:56 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B2M7H6L005628; Wed, 2 Dec 2020 17:23:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=vvJP7L7GD/TH5OrH89ahdxx8wfusIaynLjZJNNPzjc8=;
 b=tJAomaqkFRyaqJmGmZMV2+v+YTTB3jQOzOu4z8/N5Yh+fg5W3j41JrCYWE4d/BG7d5fE
 T5DjSkD0FrLGVcwK2LadqHnkhU6u3AX1rnr/Lnr6qPkHWG5Sycy5pfSg9YfJ0qFNes07
 RFZlvU2lYeF+sXeD1XVt903SIFSA/X91YNjUil+l2Fyvy0p9+JpzO0QdqwrJ2tD/hHCp
 /0EfAM4INfLfIWlUiNM+GUCW9oHfC5jB0eU/7l4+APDIal5AiBiOXRvgRO6796pEMMHA
 fvyCJ2HzTxRL/X6Kx3wLw+hyqqtFS/dbaPI9TSXXhMyfO/S2rdsEwv7LTDNXbiyPfRgq dQ== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 356jdqa1km-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Dec 2020 17:23:52 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B2MIbC4012953;
 Wed, 2 Dec 2020 22:23:52 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma03dal.us.ibm.com with ESMTP id 353e69mpqr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Dec 2020 22:23:52 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B2MNpGv65339864
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Dec 2020 22:23:51 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8563D112064;
 Wed,  2 Dec 2020 22:23:51 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4A803112062;
 Wed,  2 Dec 2020 22:23:50 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.65.215.138])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  2 Dec 2020 22:23:49 +0000 (GMT)
Subject: Re: [PATCH v2 04/17] ibmvfc: add alloc/dealloc routines for SCSI
 Sub-CRQ Channels
To: Brian King <brking@linux.vnet.ibm.com>,
 james.bottomley@hansenpartnership.com
References: <20201202005329.4538-1-tyreld@linux.ibm.com>
 <20201202005329.4538-5-tyreld@linux.ibm.com>
 <f0b848d3-0a39-dd95-e4a2-b303c12ed0dd@linux.vnet.ibm.com>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
Message-ID: <6f9dc1e8-76fe-0251-3e43-edf7da93eb82@linux.ibm.com>
Date: Wed, 2 Dec 2020 14:23:49 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <f0b848d3-0a39-dd95-e4a2-b303c12ed0dd@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-02_13:2020-11-30,
 2020-12-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=2 bulkscore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 malwarescore=0 mlxscore=0 impostorscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012020134
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

On 12/2/20 7:25 AM, Brian King wrote:
> On 12/1/20 6:53 PM, Tyrel Datwyler wrote:
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
>> +		dev_warn(dev, "Firmware may not support MQ\n");
> 
> Will this now get logged everywhere this new driver runs if the firmware
> does not support sub CRQs? Is there something better that could be done
> here to only log this for a true error and not just because a new driver
> is running with an older firmware release?

I suppose we can guess if the rc is H_PARAMETER that sub-crqs are probably not
supported and do a dev_warn_once() for the no MQ support message. H_PARAMETER
could mean other things though so we still need to log the failure in my opinion.

-Tyrel

> 
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
> 
> 
> 

