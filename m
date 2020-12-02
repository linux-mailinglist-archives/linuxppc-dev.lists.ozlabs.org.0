Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8FD2CC172
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 16:58:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CmNtF33MBzDqS4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 02:58:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=brking@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=aavXsClQ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CmNr034HBzDq9l
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Dec 2020 02:56:31 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B2Fl0ml193613; Wed, 2 Dec 2020 10:56:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=fIq6N6+4QBCiz2UKO/SQtbQHbwq6LD6ldQZR4ZK3QTI=;
 b=aavXsClQxhArBCvfFzXz/xw+WEd9m8mXLqqc5igYp3SCP77oM6HRvU6rT7Mk6a1pEelT
 XSwzynBIzD5d2EaO/8NVg+4jFYgtzeAqDYm4dKs0S503ZIbQP3aaUV8FfN5nm8Iyhqdk
 AKQ1ChHbpU1BNvzYMn2WdQiTujhl1Z3Ku1zrbihlK4HBt0+s4F6nOy3ID2PhNsV6J44L
 8/WTg91GOO6mtvGmivpcEbOaPPuIxlQOuZh/6q0BOIOc/MG7lyawNDiZEh9FX1Qr24nE
 1S97NugYN830a46+659tbatNg7SgeKmgFwXgHwL3LDESRESy+Tfoyz6gOyzoUgDJJl+v vw== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3568cwceuy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Dec 2020 10:56:29 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B2FXScf011719;
 Wed, 2 Dec 2020 15:56:28 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04wdc.us.ibm.com with ESMTP id 354ysujjwx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Dec 2020 15:56:28 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B2FuSNI7340768
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Dec 2020 15:56:28 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0973BAE05C;
 Wed,  2 Dec 2020 15:56:28 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 35E8AAE05F;
 Wed,  2 Dec 2020 15:56:27 +0000 (GMT)
Received: from oc6034535106.ibm.com (unknown [9.211.78.151])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  2 Dec 2020 15:56:27 +0000 (GMT)
Subject: Re: [PATCH v2 06/17] ibmvfc: add handlers to drain and complete
 Sub-CRQ responses
To: Tyrel Datwyler <tyreld@linux.ibm.com>,
 james.bottomley@hansenpartnership.com
References: <20201202005329.4538-1-tyreld@linux.ibm.com>
 <20201202005329.4538-7-tyreld@linux.ibm.com>
From: Brian King <brking@linux.vnet.ibm.com>
Message-ID: <8a3c6a0b-ebf5-581a-e3e9-748c09373d92@linux.vnet.ibm.com>
Date: Wed, 2 Dec 2020 09:56:26 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201202005329.4538-7-tyreld@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-02_08:2020-11-30,
 2020-12-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 suspectscore=2 mlxlogscore=999 impostorscore=0 mlxscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
> +static void ibmvfc_handle_scrq(struct ibmvfc_crq *crq, struct ibmvfc_host *vhost)
> +{
> +	struct ibmvfc_event *evt = (struct ibmvfc_event *)be64_to_cpu(crq->ioba);
> +	unsigned long flags;
> +
> +	switch (crq->valid) {
> +	case IBMVFC_CRQ_CMD_RSP:
> +		break;
> +	case IBMVFC_CRQ_XPORT_EVENT:
> +		return;
> +	default:
> +		dev_err(vhost->dev, "Got and invalid message type 0x%02x\n", crq->valid);
> +		return;
> +	}
> +
> +	/* The only kind of payload CRQs we should get are responses to
> +	 * things we send. Make sure this response is to something we
> +	 * actually sent
> +	 */
> +	if (unlikely(!ibmvfc_valid_event(&vhost->pool, evt))) {
> +		dev_err(vhost->dev, "Returned correlation_token 0x%08llx is invalid!\n",
> +			crq->ioba);
> +		return;
> +	}
> +
> +	if (unlikely(atomic_read(&evt->free))) {
> +		dev_err(vhost->dev, "Received duplicate correlation_token 0x%08llx!\n",
> +			crq->ioba);
> +		return;
> +	}
> +
> +	spin_lock_irqsave(vhost->host->host_lock, flags);
> +	del_timer(&evt->timer);
> +	list_del(&evt->queue);
> +	ibmvfc_trc_end(evt);

Another thought here... If you are going through ibmvfc_purge_requests at the same time
as this code, you could check the free bit above, then have ibmvfc_purge_requests
put the event on the free queue and call scsi_done, then you come down and get the host
lock here, remove the command from the free list, and call the done function again,
which could result in a double completion to the scsi layer.

I think you need to grab the host lock before you check the free bit to avoid this race.

> +	spin_unlock_irqrestore(vhost->host->host_lock, flags);
> +	evt->done(evt);
> +}
> +


-- 
Brian King
Power Linux I/O
IBM Linux Technology Center

