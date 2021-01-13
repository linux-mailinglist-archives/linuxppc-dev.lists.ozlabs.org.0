Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DC22A2F50C2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 18:15:21 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DGDbW0WjzzDrcF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jan 2021 04:15:19 +1100 (AEDT)
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
 header.s=pp1 header.b=TqSDKmxK; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DGDYW5M6rzDqmJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jan 2021 04:13:34 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10DH4tto051009; Wed, 13 Jan 2021 12:13:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=MNu69AKjJm3nG53SgMHXypE4CI8PDaFzLPocZJuT2zo=;
 b=TqSDKmxKJnzq6KrKhrcYuRdzcXOjpTBNPAYgty9wNUrlsJW9FZtNYi2Cstk7ojJn+BR1
 psfQVXlJl3SUHR4aImKWhBZ0311lWIa5ZujUGAg85lHD239ng1ps0IoYlspGYSz6Cm65
 QmpSe1v06rbFQqPo35DFbcxenK6TZZ/4BkYHGh3OhnbDmWL7T2I2y7O+te1bo7tB1xJH
 ErfHl+jODssT1N+O8fd7K46SAlvgyN5s9MmLA3hv0DoP3njEfwFYrCK2s6SVYUcvxZua
 VwVQQndnX8a8R3EGRI+j1W3G856WGuf5Fd1pbliatz4IwdVv1WXxyGTOCELQiIxG/9T4 eg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3624ech2es-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jan 2021 12:13:27 -0500
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10DH54fX051294;
 Wed, 13 Jan 2021 12:13:13 -0500
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3624ech2d8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jan 2021 12:13:12 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10DH2W1i025433;
 Wed, 13 Jan 2021 17:13:10 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma05wdc.us.ibm.com with ESMTP id 35y44972pc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jan 2021 17:13:10 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10DHD9Lh36831742
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Jan 2021 17:13:09 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A44E6B205F;
 Wed, 13 Jan 2021 17:13:09 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 62E6FB2064;
 Wed, 13 Jan 2021 17:13:08 +0000 (GMT)
Received: from oc6034535106.ibm.com (unknown [9.211.128.152])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 13 Jan 2021 17:13:08 +0000 (GMT)
Subject: Re: [PATCH v4 01/21] ibmvfc: add vhost fields and defaults for MQ
 enablement
To: Tyrel Datwyler <tyreld@linux.ibm.com>,
 james.bottomley@hansenpartnership.com
References: <20210111231225.105347-1-tyreld@linux.ibm.com>
 <20210111231225.105347-2-tyreld@linux.ibm.com>
 <0525bee7-433f-dcc7-9e35-e8706d6edee5@linux.vnet.ibm.com>
 <a8623705-6d49-2056-09bb-80190e0b6f52@linux.ibm.com>
From: Brian King <brking@linux.vnet.ibm.com>
Message-ID: <51bfc34b-c2c4-bf14-c903-d37015f65361@linux.vnet.ibm.com>
Date: Wed, 13 Jan 2021 11:13:07 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <a8623705-6d49-2056-09bb-80190e0b6f52@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-13_07:2021-01-13,
 2021-01-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 adultscore=0 impostorscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101130100
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
Cc: martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
 james.smart@broadcom.com, linux-kernel@vger.kernel.org, brking@linux.ibm.com,
 Ming Lei <ming.lei@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/12/21 6:33 PM, Tyrel Datwyler wrote:
> On 1/12/21 2:54 PM, Brian King wrote:
>> On 1/11/21 5:12 PM, Tyrel Datwyler wrote:
>>> Introduce several new vhost fields for managing MQ state of the adapter
>>> as well as initial defaults for MQ enablement.
>>>
>>> Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
>>> ---
>>>  drivers/scsi/ibmvscsi/ibmvfc.c | 8 ++++++++
>>>  drivers/scsi/ibmvscsi/ibmvfc.h | 9 +++++++++
>>>  2 files changed, 17 insertions(+)
>>>
>>> diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
>>> index ba95438a8912..9200fe49c57e 100644
>>> --- a/drivers/scsi/ibmvscsi/ibmvfc.c
>>> +++ b/drivers/scsi/ibmvscsi/ibmvfc.c
>>> @@ -3302,6 +3302,7 @@ static struct scsi_host_template driver_template = {
>>>  	.max_sectors = IBMVFC_MAX_SECTORS,
>>>  	.shost_attrs = ibmvfc_attrs,
>>>  	.track_queue_depth = 1,
>>> +	.host_tagset = 1,
>>
>> This doesn't seem right. You are setting host_tagset, which means you want a
>> shared, host wide, tag set for commands. It also means that the total
>> queue depth for the host is can_queue. However, it looks like you are allocating
>> max_requests events for each sub crq, which means you are over allocating memory.
> 
> With the shared tagset yes the queue depth for the host is can_queue, but this
> also implies that the max queue depth for each hw queue is also can_queue. So,
> in the worst case that all commands are queued down the same hw queue we need an
> event pool with can_queue commands.
> 
>>
>> Looking at this closer, we might have bigger problems. There is a host wide
>> max number of commands that the VFC host supports, which gets returned on
>> NPIV Login. This value can change across a live migration event.
> 
> From what I understand the max commands can only become less.
> 
>>
>> The ibmvfc driver, which does the same thing the lpfc driver does, modifies
>> can_queue on the scsi_host *after* the tag set has been allocated. This looks
>> to be a concern with ibmvfc, not sure about lpfc, as it doesn't look like
>> we look at can_queue once the tag set is setup, and I'm not seeing a good way
>> to dynamically change the host queue depth once the tag set is setup. 
>>
>> Unless I'm missing something, our best options appear to either be to implement
>> our own host wide busy reference counting, which doesn't sound very good, or
>> we need to add some API to block / scsi that allows us to dynamically change
>> can_queue.
> 
> Changing can_queue won't do use any good with the shared tagset becasue each
> queue still needs to be able to queue can_queue number of commands in the worst
> case.

The issue I'm trying to highlight here is the following scenario:

1. We set shost->can_queue, then call scsi_add_host, which allocates the tag set.

2. On our NPIV login response from the VIOS, we might get a lower value than we
initially set in shost->can_queue, so we update it, but nobody ever looks at it
again, and we don't have any protection against sending too many commands to the host.


Basically, we no longer have any code that ensures we don't send more
commands to the VIOS than we are told it supports. According to the architecture,
if we actually do this, the VIOS will do an h_free_crq, which would be a bit
of a bug on our part.

I don't think it was ever clearly defined in the API that a driver can
change shost->can_queue after calling scsi_add_host, but up until
commit 6eb045e092efefafc6687409a6fa6d1dabf0fb69, this worked and now
it doesn't. 

I started looking through drivers that do this, and so far, it looks like the
following drivers do: ibmvfc, lpfc, aix94xx, libfc, BusLogic, and likely others...

We probably need an API that lets us change shost->can_queue dynamically.

Thanks,

Brian

-- 
Brian King
Power Linux I/O
IBM Linux Technology Center

