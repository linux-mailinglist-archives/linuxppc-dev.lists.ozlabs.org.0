Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC652CF7EB
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Dec 2020 01:18:54 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cnqth3rXczDrhM
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Dec 2020 11:18:52 +1100 (AEDT)
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
 header.s=pp1 header.b=nj0m7RQ8; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CnqrQ1lj4zDrc9
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Dec 2020 11:16:54 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B501PBj128630; Fri, 4 Dec 2020 19:16:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=8wxorAXIC7ZiFl4r0LxfUGzOj9+G63ZI658uKzqhNR4=;
 b=nj0m7RQ8rE9GR6YV8/sMOATJ+yVslergRPrhizAhDoFUliJApbC8Icq2GNvXgfFlpvVk
 cWtf2Dh98UXyGhuH+8nKAXC1bF+AAR2p8AqPybKbriHi2M3uYsEM3hPIJU7rhPtR0MZj
 l/0MoSxqEqADNkjEhkvpa+EJG4TaQQsoDaTBAl2KzaVFyUvkIdctPgV1dvQJCyG3LSof
 AjECUx51kefpFsM7qzkX+nqFf1Vu335Jitx5knBm22jN+to11o9ddCm0bCJVUW5JHy7W
 XhXy8HFPv+CAl9RiXPcJ77hIRFj1YqERViEoD2TwElluXn1NklRjc4zNLaL0KIhDwEee Ug== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 357m8gbma2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Dec 2020 19:16:50 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B507gq0015623;
 Sat, 5 Dec 2020 00:16:50 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma04wdc.us.ibm.com with ESMTP id 354ysv5rjs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 05 Dec 2020 00:16:50 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B50Gncp4850412
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 5 Dec 2020 00:16:50 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E22E2112062;
 Sat,  5 Dec 2020 00:16:49 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DF613112067;
 Sat,  5 Dec 2020 00:16:48 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.65.215.138])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Sat,  5 Dec 2020 00:16:48 +0000 (GMT)
Subject: Re: [PATCH v3 06/18] ibmvfc: add handlers to drain and complete
 Sub-CRQ responses
To: Brian King <brking@linux.vnet.ibm.com>,
 james.bottomley@hansenpartnership.com
References: <20201203020806.14747-1-tyreld@linux.ibm.com>
 <20201203020806.14747-7-tyreld@linux.ibm.com>
 <3fe8683a-47f6-8713-762a-02c57c2e4ec2@linux.vnet.ibm.com>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
Message-ID: <1961b4e3-0732-ac5c-e691-2fa02218ac35@linux.ibm.com>
Date: Fri, 4 Dec 2020 16:16:48 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <3fe8683a-47f6-8713-762a-02c57c2e4ec2@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-04_13:2020-12-04,
 2020-12-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=2 clxscore=1015
 adultscore=0 spamscore=0 mlxlogscore=999 priorityscore=1501 phishscore=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 bulkscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012040134
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

On 12/4/20 6:51 AM, Brian King wrote:
> On 12/2/20 8:07 PM, Tyrel Datwyler wrote:
>> The logic for iterating over the Sub-CRQ responses is similiar to that
>> of the primary CRQ. Add the necessary handlers for processing those
>> responses.
>>
>> Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
>> ---
>>  drivers/scsi/ibmvscsi/ibmvfc.c | 80 ++++++++++++++++++++++++++++++++++
>>  1 file changed, 80 insertions(+)
>>
>> diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
>> index e082935f56cf..b61ae1df21e5 100644
>> --- a/drivers/scsi/ibmvscsi/ibmvfc.c
>> +++ b/drivers/scsi/ibmvscsi/ibmvfc.c
>> @@ -3381,6 +3381,86 @@ static int ibmvfc_toggle_scrq_irq(struct ibmvfc_sub_queue *scrq, int enable)
>>  	return rc;
>>  }
>>  
>> +static void ibmvfc_handle_scrq(struct ibmvfc_crq *crq, struct ibmvfc_host *vhost)
>> +{
>> +	struct ibmvfc_event *evt = (struct ibmvfc_event *)be64_to_cpu(crq->ioba);
>> +	unsigned long flags;
>> +
>> +	switch (crq->valid) {
>> +	case IBMVFC_CRQ_CMD_RSP:
>> +		break;
>> +	case IBMVFC_CRQ_XPORT_EVENT:
>> +		return;
>> +	default:
>> +		dev_err(vhost->dev, "Got and invalid message type 0x%02x\n", crq->valid);
>> +		return;
>> +	}
>> +
>> +	/* The only kind of payload CRQs we should get are responses to
>> +	 * things we send. Make sure this response is to something we
>> +	 * actually sent
>> +	 */
>> +	if (unlikely(!ibmvfc_valid_event(&vhost->pool, evt))) {
>> +		dev_err(vhost->dev, "Returned correlation_token 0x%08llx is invalid!\n",
>> +			crq->ioba);
>> +		return;
>> +	}
>> +
>> +	if (unlikely(atomic_read(&evt->free))) {
>> +		dev_err(vhost->dev, "Received duplicate correlation_token 0x%08llx!\n",
>> +			crq->ioba);
>> +		return;
>> +	}
>> +
>> +	del_timer(&evt->timer);
>> +	list_del(&evt->queue);
>> +	ibmvfc_trc_end(evt);> +	spin_unlock_irqrestore(vhost->host->host_lock, flags);
> 
> You can't do this here... You are grabbing the host lock in ibmvfc_drain_sub_crq
> and saving the irqflags to a local in that function, then doing a spin_unlock_irqrestore
> and restoring irqflags using an uninitialized local in this function...
> 
> I'm assuming this will get sorted out with the locking changes we've been discussing off-list...

Correct, moving to per-queue locks and flags stored in the queue struct.

-Tyrel

> 
> 
>> +	evt->done(evt);
>> +	spin_lock_irqsave(vhost->host->host_lock, flags);
>> +}
>> +
>> +static struct ibmvfc_crq *ibmvfc_next_scrq(struct ibmvfc_sub_queue *scrq)
>> +{
>> +	struct ibmvfc_crq *crq;
>> +
>> +	crq = &scrq->msgs[scrq->cur].crq;
>> +	if (crq->valid & 0x80) {
>> +		if (++scrq->cur == scrq->size)
>> +			scrq->cur = 0;
>> +		rmb();
>> +	} else
>> +		crq = NULL;
>> +
>> +	return crq;
>> +}
>> +
>> +static void ibmvfc_drain_sub_crq(struct ibmvfc_sub_queue *scrq)
>> +{
>> +	struct ibmvfc_crq *crq;
>> +	unsigned long flags;
>> +	int done = 0;
>> +
>> +	spin_lock_irqsave(scrq->vhost->host->host_lock, flags);
>> +	while (!done) {
>> +		while ((crq = ibmvfc_next_scrq(scrq)) != NULL) {
>> +			ibmvfc_handle_scrq(crq, scrq->vhost);
>> +			crq->valid = 0;
>> +			wmb();
>> +		}
>> +
>> +		ibmvfc_toggle_scrq_irq(scrq, 1);
>> +		if ((crq = ibmvfc_next_scrq(scrq)) != NULL) {
>> +			ibmvfc_toggle_scrq_irq(scrq, 0);
>> +			ibmvfc_handle_scrq(crq, scrq->vhost);
>> +			crq->valid = 0;
>> +			wmb();
>> +		} else
>> +			done = 1;
>> +	}
>> +	spin_unlock_irqrestore(scrq->vhost->host->host_lock, flags);
>> +}
>> +
>>  /**
>>   * ibmvfc_init_tgt - Set the next init job step for the target
>>   * @tgt:		ibmvfc target struct
>>
> 
> 

