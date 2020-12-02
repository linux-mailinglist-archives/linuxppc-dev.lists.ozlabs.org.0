Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 729CF2CC99D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 23:30:26 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CmYZQ4D9kzDrD2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 09:30:22 +1100 (AEDT)
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
 header.s=pp1 header.b=c5htedYD; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CmYXd5dFpzDr8g
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Dec 2020 09:28:49 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B2M9bvW141673; Wed, 2 Dec 2020 17:28:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=6HVa8RLE7OuIuHZnE4IedQHk7/6maZgbj3WycH3YaRQ=;
 b=c5htedYDO1DcmiSSP1DdqyjD89e05Afs+QsqqXHKJg1mSd2LFAeJumUVcxfB3c/VIwbw
 QkfxTIR76L7ZPGc2KOT268N7UJFDHPBwm4+EUybwdc+7Lff43JrXTa6x+jsVuTTWj7rk
 MS0bS5Pcl4/GWPa3xY8dBGV/bfEA6A4znimzwY6UUKS+qOKqI5eZ/++lM/kY+NE1J64X
 ZkBiFs5Q2T3rJL0xnAemaqF0ZHieo9jiZsfFxfockqGq+O9D6A3IpTL2jy65J0YA0afI
 kkLl1VfhKMxImO9dQpmcWpAFlCvMrJ+LMxWMh7LwXWYN5BQaJtmzQM63iHKAAjhV9/OP ug== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 356jfrstvf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Dec 2020 17:28:46 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B2MIQHj012885;
 Wed, 2 Dec 2020 22:28:45 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma03dal.us.ibm.com with ESMTP id 353e69mqpc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Dec 2020 22:28:45 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B2MSjfd524852
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Dec 2020 22:28:45 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EDC6A112064;
 Wed,  2 Dec 2020 22:28:44 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 56CA6112066;
 Wed,  2 Dec 2020 22:28:43 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.65.215.138])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  2 Dec 2020 22:28:43 +0000 (GMT)
Subject: Re: [PATCH v2 06/17] ibmvfc: add handlers to drain and complete
 Sub-CRQ responses
To: Brian King <brking@linux.vnet.ibm.com>,
 james.bottomley@hansenpartnership.com
References: <20201202005329.4538-1-tyreld@linux.ibm.com>
 <20201202005329.4538-7-tyreld@linux.ibm.com>
 <32b08be7-4c1e-a572-c70c-1f182f1d0259@linux.vnet.ibm.com>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
Message-ID: <38838bf6-5976-14de-e3a7-37f4c735d89b@linux.ibm.com>
Date: Wed, 2 Dec 2020 14:28:42 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <32b08be7-4c1e-a572-c70c-1f182f1d0259@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-02_13:2020-11-30,
 2020-12-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 mlxlogscore=999
 suspectscore=2 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012020130
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

On 12/2/20 7:46 AM, Brian King wrote:
> On 12/1/20 6:53 PM, Tyrel Datwyler wrote:
>> The logic for iterating over the Sub-CRQ responses is similiar to that
>> of the primary CRQ. Add the necessary handlers for processing those
>> responses.
>>
>> Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
>> ---
>>  drivers/scsi/ibmvscsi/ibmvfc.c | 77 ++++++++++++++++++++++++++++++++++
>>  1 file changed, 77 insertions(+)
>>
>> diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
>> index 97f00fefa809..e9da3f60c793 100644
>> --- a/drivers/scsi/ibmvscsi/ibmvfc.c
>> +++ b/drivers/scsi/ibmvscsi/ibmvfc.c
>> @@ -3381,6 +3381,83 @@ static int ibmvfc_toggle_scrq_irq(struct ibmvfc_sub_queue *scrq, int enable)
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
>> +	spin_lock_irqsave(vhost->host->host_lock, flags);
>> +	del_timer(&evt->timer);
>> +	list_del(&evt->queue);
>> +	ibmvfc_trc_end(evt);
>> +	spin_unlock_irqrestore(vhost->host->host_lock, flags);
>> +	evt->done(evt);
>> +}
>> +
>> +static struct ibmvfc_crq *ibmvfc_next_scrq(struct ibmvfc_sub_queue *scrq)
>> +{
>> +	struct ibmvfc_crq *crq;
>> +
>> +	crq = &scrq->msgs[scrq->cur].crq;
>> +	if (crq->valid & 0x80) {
>> +		if (++scrq->cur == scrq->size)
> 
> You are incrementing the cur pointer without any locks held. Although
> unlikely, could you also be in ibmvfc_reset_crq in another thread?
> If so, you'd have a subtle race condition here where the cur pointer could
> be read, then ibmvfc_reset_crq writes it to zero, then this thread
> writes it to a non zero value, which would then cause you to be out of
> sync with the VIOS as to where the cur pointer is.

Oof, yeah I was previously holding the lock the whole time, but switched it up
once I realized I can't complete a scsi command with the lock held, and got a
little too loose with it.

-Tyrel
> 
>> +			scrq->cur = 0;
>> +		rmb();
>> +	} else
>> +		crq = NULL;
>> +
>> +	return crq;
>> +}
>> +
> 
> 
> 

