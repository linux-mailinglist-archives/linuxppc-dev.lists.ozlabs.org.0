Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 359B22CC0C4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 16:27:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CmNB23kVdzDrB3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 02:27:06 +1100 (AEDT)
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
 header.s=pp1 header.b=GsG25H/A; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CmN836qG2zDr3X
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Dec 2020 02:25:23 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B2FOc2V097506; Wed, 2 Dec 2020 10:25:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=G6Bm7w0HyTqomHLyXwVFkBJZZrNbr36wA4aMwyCpd9A=;
 b=GsG25H/AQJ/l4YTYkHGSC8Al9nWs6NFzUxFewcp4WkLRXkkg2dB29TIy7drjBxWU+FYh
 8nEnXP01gt2lpUqfCCXtUfbG3W5sOOebqDUy4tJajL1Jiys5pgwS6R2lSvQfawab648j
 fqxkx3FbPmpdDjm8bj90045vgo9hzRkIT1302BifVJwJfDJDubTjVYfik1c9xXtJkoiD
 3Vu1/J0lNTFfhzXEQXCQswDqFpvSjxu+bod3DcmG0KVwf5iiTnWMLK9wqpgxFQJlx4Xh
 rO9hDlVnGtBIoF3R1n61tiO//MnGbL8pit5Y8yFgouImuxLWlQbVGJ7e2V6xpzzmVrBb Cw== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 356ceu2gxu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Dec 2020 10:25:20 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B2FDReb019645;
 Wed, 2 Dec 2020 15:25:19 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04wdc.us.ibm.com with ESMTP id 354ysujcqp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Dec 2020 15:25:19 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B2FPJqR15401504
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Dec 2020 15:25:19 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 22EDFAE05C;
 Wed,  2 Dec 2020 15:25:19 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4FAF9AE063;
 Wed,  2 Dec 2020 15:25:18 +0000 (GMT)
Received: from oc6034535106.ibm.com (unknown [9.211.78.151])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  2 Dec 2020 15:25:18 +0000 (GMT)
Subject: Re: [PATCH v2 04/17] ibmvfc: add alloc/dealloc routines for SCSI
 Sub-CRQ Channels
To: Tyrel Datwyler <tyreld@linux.ibm.com>,
 james.bottomley@hansenpartnership.com
References: <20201202005329.4538-1-tyreld@linux.ibm.com>
 <20201202005329.4538-5-tyreld@linux.ibm.com>
From: Brian King <brking@linux.vnet.ibm.com>
Message-ID: <f0b848d3-0a39-dd95-e4a2-b303c12ed0dd@linux.vnet.ibm.com>
Date: Wed, 2 Dec 2020 09:25:17 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201202005329.4538-5-tyreld@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-02_08:2020-11-30,
 2020-12-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 suspectscore=2 bulkscore=0 phishscore=0 adultscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012020093
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

On 12/1/20 6:53 PM, Tyrel Datwyler wrote:
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
> +		dev_warn(dev, "Firmware may not support MQ\n");

Will this now get logged everywhere this new driver runs if the firmware
does not support sub CRQs? Is there something better that could be done
here to only log this for a true error and not just because a new driver
is running with an older firmware release?

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



-- 
Brian King
Power Linux I/O
IBM Linux Technology Center

