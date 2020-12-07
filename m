Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B31152D0FE5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Dec 2020 13:00:37 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CqMMP3LRkzDqQv
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Dec 2020 23:00:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=hare@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CqMGs6grxzDqN9
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Dec 2020 22:56:37 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DB8CFAC9A;
 Mon,  7 Dec 2020 11:56:32 +0000 (UTC)
Subject: Re: [PATCH v2 01/17] ibmvfc: add vhost fields and defaults for MQ
 enablement
To: Brian King <brking@linux.vnet.ibm.com>,
 Tyrel Datwyler <tyreld@linux.ibm.com>, james.bottomley@hansenpartnership.com
References: <20201202005329.4538-1-tyreld@linux.ibm.com>
 <20201202005329.4538-2-tyreld@linux.ibm.com>
 <a11c0e6a-cfa6-0dc4-5d34-6fd35ae1f29b@linux.vnet.ibm.com>
 <38903a4f-9253-0b4b-6f67-af78ec86175f@linux.ibm.com>
 <efbfe9e9-c692-80a1-f5b4-55473d8193e4@linux.vnet.ibm.com>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <6ce79011-d288-7a49-3d51-262da58d8486@suse.de>
Date: Mon, 7 Dec 2020 12:56:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <efbfe9e9-c692-80a1-f5b4-55473d8193e4@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 12/4/20 3:26 PM, Brian King wrote:
> On 12/2/20 11:27 AM, Tyrel Datwyler wrote:
>> On 12/2/20 7:14 AM, Brian King wrote:
>>> On 12/1/20 6:53 PM, Tyrel Datwyler wrote:
>>>> Introduce several new vhost fields for managing MQ state of the adapter
>>>> as well as initial defaults for MQ enablement.
>>>>
>>>> Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
>>>> ---
>>>>   drivers/scsi/ibmvscsi/ibmvfc.c |  9 ++++++++-
>>>>   drivers/scsi/ibmvscsi/ibmvfc.h | 13 +++++++++++--
>>>>   2 files changed, 19 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
>>>> index 42e4d35e0d35..f1d677a7423d 100644
>>>> --- a/drivers/scsi/ibmvscsi/ibmvfc.c
>>>> +++ b/drivers/scsi/ibmvscsi/ibmvfc.c
>>>> @@ -5161,12 +5161,13 @@ static int ibmvfc_probe(struct vio_dev *vdev, const struct vio_device_id *id)
>>>>   	}
>>>>   
>>>>   	shost->transportt = ibmvfc_transport_template;
>>>> -	shost->can_queue = max_requests;
>>>> +	shost->can_queue = (max_requests / IBMVFC_SCSI_HW_QUEUES);
>>>
>>> This doesn't look right. can_queue is the SCSI host queue depth, not the MQ queue depth.
>>
>> Our max_requests is the total number commands allowed across all queues. From
>> what I understand is can_queue is the total number of commands in flight allowed
>> for each hw queue.
>>
>>          /*
>>           * In scsi-mq mode, the number of hardware queues supported by the LLD.
>>           *
>>           * Note: it is assumed that each hardware queue has a queue depth of
>>           * can_queue. In other words, the total queue depth per host
>>           * is nr_hw_queues * can_queue. However, for when host_tagset is set,
>>           * the total queue depth is can_queue.
>>           */
>>
>> We currently don't use the host wide shared tagset.
> 
> Ok. I missed that bit... In that case, since we allocate by default only 100
> event structs. If we slice that across IBMVFC_SCSI_HW_QUEUES (16) queues, then
> we end up with only about 6 commands that can be outstanding per queue,
> which is going to really hurt performance... I'd suggest bumping up
> IBMVFC_MAX_REQUESTS_DEFAULT from 100 to 1000 as a starting point.
> 
Before doing that I'd rather use the host-wide shared tagset.
Increasing the number of requests will increase the memory footprint of 
the driver (as each request will be statically allocated).

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Felix Imendörffer
