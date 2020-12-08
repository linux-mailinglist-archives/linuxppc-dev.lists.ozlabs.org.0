Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 574272D3659
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 23:38:57 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CrFTV0qthzDqll
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 09:38:54 +1100 (AEDT)
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
 header.s=pp1 header.b=IinELtBz; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CrFRn68dpzDqgL
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Dec 2020 09:37:24 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B8MW9Ec106166; Tue, 8 Dec 2020 17:37:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=ny4BGtsIDYCNJGw0eK1XWCj9RE2kutEusQjjkUxM/bI=;
 b=IinELtBzPOnmbSaQjLmMTQ2kyaiigWd0K10ApwnaRlH393m2M1dp/t2naYJGkv1U6+xn
 DYMIMZCbGpbpoa/3zjdQtFOu8P36Ox+/VMZigz3Y3PnR58sgLk69ULde7zqTs3CL/cD1
 Yo4H+Fau5H7gy8BzSuYJA+eI02P2/faWO6EQTNd6XLKzHzm3jeQBubQPZsvXJ5zaxSbv
 dYqRB+bryeS4qOxT//+Zqw7gJ4MQRHDmQpPlJHa8yDVTEFqd6rboMQtDo3rpq2Px7c+e
 13Jsuw7Jb7+tnGdaQKdyqBblzUfbIvqEBPbDJAUpBfFpxhixEAnJ87deuBAK5jHuKTCt hg== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35ajbng5br-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Dec 2020 17:37:21 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B8MWO9T029588;
 Tue, 8 Dec 2020 22:37:20 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma03dal.us.ibm.com with ESMTP id 3581u99pss-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Dec 2020 22:37:20 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B8MbJRi28049680
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Dec 2020 22:37:20 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DD4B8112079;
 Tue,  8 Dec 2020 22:37:19 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2347811207A;
 Tue,  8 Dec 2020 22:37:18 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.65.215.138])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  8 Dec 2020 22:37:17 +0000 (GMT)
Subject: Re: [PATCH v2 01/17] ibmvfc: add vhost fields and defaults for MQ
 enablement
To: Hannes Reinecke <hare@suse.de>, Brian King <brking@linux.vnet.ibm.com>,
 james.bottomley@hansenpartnership.com
References: <20201202005329.4538-1-tyreld@linux.ibm.com>
 <20201202005329.4538-2-tyreld@linux.ibm.com>
 <a11c0e6a-cfa6-0dc4-5d34-6fd35ae1f29b@linux.vnet.ibm.com>
 <38903a4f-9253-0b4b-6f67-af78ec86175f@linux.ibm.com>
 <efbfe9e9-c692-80a1-f5b4-55473d8193e4@linux.vnet.ibm.com>
 <6ce79011-d288-7a49-3d51-262da58d8486@suse.de>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
Message-ID: <f226e3f9-60e9-b96a-ecc3-2e4008e08bac@linux.ibm.com>
Date: Tue, 8 Dec 2020 14:37:16 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <6ce79011-d288-7a49-3d51-262da58d8486@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-08_15:2020-12-08,
 2020-12-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 suspectscore=0
 impostorscore=0 mlxscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2012080137
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

On 12/7/20 3:56 AM, Hannes Reinecke wrote:
> On 12/4/20 3:26 PM, Brian King wrote:
>> On 12/2/20 11:27 AM, Tyrel Datwyler wrote:
>>> On 12/2/20 7:14 AM, Brian King wrote:
>>>> On 12/1/20 6:53 PM, Tyrel Datwyler wrote:
>>>>> Introduce several new vhost fields for managing MQ state of the adapter
>>>>> as well as initial defaults for MQ enablement.
>>>>>
>>>>> Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
>>>>> ---
>>>>>   drivers/scsi/ibmvscsi/ibmvfc.c |  9 ++++++++-
>>>>>   drivers/scsi/ibmvscsi/ibmvfc.h | 13 +++++++++++--
>>>>>   2 files changed, 19 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
>>>>> index 42e4d35e0d35..f1d677a7423d 100644
>>>>> --- a/drivers/scsi/ibmvscsi/ibmvfc.c
>>>>> +++ b/drivers/scsi/ibmvscsi/ibmvfc.c
>>>>> @@ -5161,12 +5161,13 @@ static int ibmvfc_probe(struct vio_dev *vdev, const
>>>>> struct vio_device_id *id)
>>>>>       }
>>>>>         shost->transportt = ibmvfc_transport_template;
>>>>> -    shost->can_queue = max_requests;
>>>>> +    shost->can_queue = (max_requests / IBMVFC_SCSI_HW_QUEUES);
>>>>
>>>> This doesn't look right. can_queue is the SCSI host queue depth, not the MQ
>>>> queue depth.
>>>
>>> Our max_requests is the total number commands allowed across all queues. From
>>> what I understand is can_queue is the total number of commands in flight allowed
>>> for each hw queue.
>>>
>>>          /*
>>>           * In scsi-mq mode, the number of hardware queues supported by the LLD.
>>>           *
>>>           * Note: it is assumed that each hardware queue has a queue depth of
>>>           * can_queue. In other words, the total queue depth per host
>>>           * is nr_hw_queues * can_queue. However, for when host_tagset is set,
>>>           * the total queue depth is can_queue.
>>>           */
>>>
>>> We currently don't use the host wide shared tagset.
>>
>> Ok. I missed that bit... In that case, since we allocate by default only 100
>> event structs. If we slice that across IBMVFC_SCSI_HW_QUEUES (16) queues, then
>> we end up with only about 6 commands that can be outstanding per queue,
>> which is going to really hurt performance... I'd suggest bumping up
>> IBMVFC_MAX_REQUESTS_DEFAULT from 100 to 1000 as a starting point.
>>
> Before doing that I'd rather use the host-wide shared tagset.
> Increasing the number of requests will increase the memory footprint of the
> driver (as each request will be statically allocated).
> 

In the case where we use host-wide how do I determine the queue depth per
hardware queue? Is is hypothetically can_queue or is it (can_queue /
nr_hw_queues)? We want to allocate an event pool per-queue which made sense
without host-wide tags since the queue depth per hw queue is exactly can_queue.

-Tyrel
