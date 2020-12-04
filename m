Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8E42CEFB6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 15:31:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CnZrr1k1hzDrQ1
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Dec 2020 01:31:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=brking@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Q/wVs8rv; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CnZmQ5xn2zDrZC
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Dec 2020 01:27:34 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B4E4fP1147939; Fri, 4 Dec 2020 09:27:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=IfM/Ey0nB8wsSk7NCHr8qaeC/s7Q0Ik7M1AN6KkYovk=;
 b=Q/wVs8rv2oMqXAUKkDGU+VehZCyDPBttmT7K+PJF79yvE0z4W7Q7QlvCALYWN/n1kE5F
 cYX8PJVMv4No88WzQ85h3SkdxT3ibNTSf4fXBpC61ZW8f8RM9E7VGk83EsA3lpEpVhDP
 fLKXXaaPs4sLu/eKTOO/Exi7Y7GZWi6K3jziNTQsEfbMhcpV134FRYaphGvU442/7b9F
 H9oBAh4UUv65IDsZiBjPkwsnuZRAKznU+Qk/RQ69ekG2E9dVY8GNbLnRvbxulTvXUca1
 GgaOFEPYDcFBB13ixRvye2TzLd28XFCzX74xjqKBMPPKZIBQ6b4mKjDg/4xzmzLXSnc6 kg== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3577436a1d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Dec 2020 09:27:29 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B4EHZHq021260;
 Fri, 4 Dec 2020 14:27:24 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma01wdc.us.ibm.com with ESMTP id 355vrgb32j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Dec 2020 14:27:24 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B4EQ8ro19333580
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Dec 2020 14:26:08 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B041078074;
 Fri,  4 Dec 2020 14:26:07 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 483A178063;
 Fri,  4 Dec 2020 14:26:07 +0000 (GMT)
Received: from oc6034535106.ibm.com (unknown [9.163.73.174])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  4 Dec 2020 14:26:07 +0000 (GMT)
Subject: Re: [PATCH v2 01/17] ibmvfc: add vhost fields and defaults for MQ
 enablement
To: Tyrel Datwyler <tyreld@linux.ibm.com>,
 james.bottomley@hansenpartnership.com
References: <20201202005329.4538-1-tyreld@linux.ibm.com>
 <20201202005329.4538-2-tyreld@linux.ibm.com>
 <a11c0e6a-cfa6-0dc4-5d34-6fd35ae1f29b@linux.vnet.ibm.com>
 <38903a4f-9253-0b4b-6f67-af78ec86175f@linux.ibm.com>
From: Brian King <brking@linux.vnet.ibm.com>
Message-ID: <efbfe9e9-c692-80a1-f5b4-55473d8193e4@linux.vnet.ibm.com>
Date: Fri, 4 Dec 2020 08:26:06 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <38903a4f-9253-0b4b-6f67-af78ec86175f@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-04_04:2020-12-04,
 2020-12-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0
 priorityscore=1501 mlxscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012040077
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

On 12/2/20 11:27 AM, Tyrel Datwyler wrote:
> On 12/2/20 7:14 AM, Brian King wrote:
>> On 12/1/20 6:53 PM, Tyrel Datwyler wrote:
>>> Introduce several new vhost fields for managing MQ state of the adapter
>>> as well as initial defaults for MQ enablement.
>>>
>>> Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
>>> ---
>>>  drivers/scsi/ibmvscsi/ibmvfc.c |  9 ++++++++-
>>>  drivers/scsi/ibmvscsi/ibmvfc.h | 13 +++++++++++--
>>>  2 files changed, 19 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
>>> index 42e4d35e0d35..f1d677a7423d 100644
>>> --- a/drivers/scsi/ibmvscsi/ibmvfc.c
>>> +++ b/drivers/scsi/ibmvscsi/ibmvfc.c
>>> @@ -5161,12 +5161,13 @@ static int ibmvfc_probe(struct vio_dev *vdev, const struct vio_device_id *id)
>>>  	}
>>>  
>>>  	shost->transportt = ibmvfc_transport_template;
>>> -	shost->can_queue = max_requests;
>>> +	shost->can_queue = (max_requests / IBMVFC_SCSI_HW_QUEUES);
>>
>> This doesn't look right. can_queue is the SCSI host queue depth, not the MQ queue depth.
> 
> Our max_requests is the total number commands allowed across all queues. From
> what I understand is can_queue is the total number of commands in flight allowed
> for each hw queue.
> 
>         /*
>          * In scsi-mq mode, the number of hardware queues supported by the LLD.
>          *
>          * Note: it is assumed that each hardware queue has a queue depth of
>          * can_queue. In other words, the total queue depth per host
>          * is nr_hw_queues * can_queue. However, for when host_tagset is set,
>          * the total queue depth is can_queue.
>          */
> 
> We currently don't use the host wide shared tagset.

Ok. I missed that bit... In that case, since we allocate by default only 100
event structs. If we slice that across IBMVFC_SCSI_HW_QUEUES (16) queues, then
we end up with only about 6 commands that can be outstanding per queue,
which is going to really hurt performance... I'd suggest bumping up
IBMVFC_MAX_REQUESTS_DEFAULT from 100 to 1000 as a starting point.

Thanks,

Brian


-- 
Brian King
Power Linux I/O
IBM Linux Technology Center

