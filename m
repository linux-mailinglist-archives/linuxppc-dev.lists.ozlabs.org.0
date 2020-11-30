Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D592C8AFC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 18:30:04 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ClC0n5Gj8zDqtl
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 04:30:01 +1100 (AEDT)
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
 header.s=pp1 header.b=ft3qdr5K; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ClByL1SZszDqnF
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Dec 2020 04:27:53 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AUH2Rri118560; Mon, 30 Nov 2020 12:27:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=SOb54gOUrXdaoshbmRHGoBHrf3L6hsCVBJGLbwhOI5I=;
 b=ft3qdr5K4TYSFfiAO33vzEVoyweJfdW45POl7ZCpg61jVVRcA+egPLOIWXP+95cjDTfs
 /2bGaCnztpcXiSBsP2RbLMGtDgtwUTlNfoVJe+JVvVK+D0VqYgudd3/dyy0yZMdR0+B4
 tY5avFMTjN6kPlN8TqGyxwFnPGbtPVbl1rskXChNBKVamRnbC5Hb3YuPmabWG8ZAIMmH
 V52OPjalJtu18YRXMxfAjl+XYioqU3uIbMJ33wlHu51gnY3Kqb7tUM9ch34OH9rYEnIn
 o67u9BaPJiISJSCcYuAm1oyxkUPn9tBVvxkZC2Z39ibCXp8cVnbGvKT5CxmqMiGOKavv KA== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3552dc6jey-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Nov 2020 12:27:51 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AUHM3ix012951;
 Mon, 30 Nov 2020 17:27:50 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma01dal.us.ibm.com with ESMTP id 353e68wnd9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Nov 2020 17:27:50 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AUHRnZo16646542
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 30 Nov 2020 17:27:49 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8815211207A;
 Mon, 30 Nov 2020 17:27:49 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6D021112087;
 Mon, 30 Nov 2020 17:27:46 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.65.215.138])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 30 Nov 2020 17:27:46 +0000 (GMT)
Subject: Re: [PATCH 06/13] ibmvfc: add handlers to drain and complete Sub-CRQ
 responses
To: Brian King <brking@linux.vnet.ibm.com>,
 james.bottomley@hansenpartnership.com
References: <20201126014824.123831-1-tyreld@linux.ibm.com>
 <20201126014824.123831-7-tyreld@linux.ibm.com>
 <b3737660-4e13-8675-b4be-71283e2dcf99@linux.vnet.ibm.com>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
Message-ID: <1a9ae9b7-819e-4fd2-e31f-64c4d3bd7882@linux.ibm.com>
Date: Mon, 30 Nov 2020 09:27:45 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <b3737660-4e13-8675-b4be-71283e2dcf99@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-30_06:2020-11-30,
 2020-11-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 suspectscore=2 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011300106
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

On 11/27/20 9:47 AM, Brian King wrote:
> On 11/25/20 7:48 PM, Tyrel Datwyler wrote:
>> The logic for iterating over the Sub-CRQ responses is similiar to that
>> of the primary CRQ. Add the necessary handlers for processing those
>> responses.
>>
>> Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
>> ---
>>  drivers/scsi/ibmvscsi/ibmvfc.c | 72 ++++++++++++++++++++++++++++++++++
>>  1 file changed, 72 insertions(+)
>>
>> diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
>> index 6eaedda4917a..a8730522920e 100644
>> --- a/drivers/scsi/ibmvscsi/ibmvfc.c
>> +++ b/drivers/scsi/ibmvscsi/ibmvfc.c
>> @@ -3371,6 +3371,78 @@ static int ibmvfc_toggle_scrq_irq(struct ibmvfc_sub_queue *scrq, int enable)
>>  	return rc;
>>  }
>>  
>> +static void ibmvfc_handle_scrq(struct ibmvfc_crq *crq, struct ibmvfc_host *vhost)
>> +{
>> +	struct ibmvfc_event *evt = (struct ibmvfc_event *)be64_to_cpu(crq->ioba);
>> +
>> +	switch (crq->valid) {
>> +	case IBMVFC_CRQ_CMD_RSP:
>> +		break;
>> +	default:
>> +		dev_err(vhost->dev, "Got and invalid message type 0x%02x\n", crq->valid);
> 
> Is this correct? Can't we get transport events here as well?

Yes we can. We still handle them in the primary CRQ so at least for the time
being we can ignore them, but yeah we shouldn't log scary messages about them.

-Tyrel

> 
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
>> +	ibmvfc_trc_end(evt);
>> +	evt->done(evt);
>> +}
>> +
> 
> 
> 

