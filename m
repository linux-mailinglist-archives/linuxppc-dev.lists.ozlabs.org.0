Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7362F3CBF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 01:35:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DFpPM0wQmzDrNc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 11:35:03 +1100 (AEDT)
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
 header.s=pp1 header.b=QWo3sEZk; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DFpMk3LHhzDr5V
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Jan 2021 11:33:36 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10D0X7vx081560; Tue, 12 Jan 2021 19:33:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=fHpUwCpPpEwMh0UVJzkXZBdzGvfanSshJxK+UoDE7b4=;
 b=QWo3sEZkOJ3Gf0pEWn92zuXBaa03g8WPQ9rK4lcbCTLtNI6DYv1elPdt+o8/N3gVQrem
 9CV5mUS+979NGAtPrr5VdK6o3JxEc/xnnby1dma9UPNDXNgBC7DUJvfUaWzKInpru4Ci
 Ml+yNhzFbHwGJy5ARebIdoicfpvOeRc3JT/l25nc6djGkG+1H25P0n4G3rGsiRB4/nhx
 HmtKwXL774Eobg9B8AMM+XCnV4bVO44pcuoBDIV7wZLm5bQG4En0QnHSdUMgJ4Luyh/n
 cH/ZFd/OiDJOKyqzM6odXpJ0nTx+NS9AYcqY6LmEK+cHXEebIzYxbMeBLsubvD/7mgvJ aQ== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 361nds1cfx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Jan 2021 19:33:31 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10D0WWWE032202;
 Wed, 13 Jan 2021 00:33:30 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma04dal.us.ibm.com with ESMTP id 35y4498arm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jan 2021 00:33:30 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10D0XULn27328804
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Jan 2021 00:33:30 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1A7B9AC059;
 Wed, 13 Jan 2021 00:33:30 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DB426AC05E;
 Wed, 13 Jan 2021 00:33:28 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.160.27.90])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 13 Jan 2021 00:33:28 +0000 (GMT)
Subject: Re: [PATCH v4 01/21] ibmvfc: add vhost fields and defaults for MQ
 enablement
To: Brian King <brking@linux.vnet.ibm.com>,
 james.bottomley@hansenpartnership.com
References: <20210111231225.105347-1-tyreld@linux.ibm.com>
 <20210111231225.105347-2-tyreld@linux.ibm.com>
 <0525bee7-433f-dcc7-9e35-e8706d6edee5@linux.vnet.ibm.com>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
Message-ID: <a8623705-6d49-2056-09bb-80190e0b6f52@linux.ibm.com>
Date: Tue, 12 Jan 2021 16:33:27 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <0525bee7-433f-dcc7-9e35-e8706d6edee5@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-12_21:2021-01-12,
 2021-01-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 malwarescore=0 mlxlogscore=999 spamscore=0 mlxscore=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1011
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101130001
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
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/12/21 2:54 PM, Brian King wrote:
> On 1/11/21 5:12 PM, Tyrel Datwyler wrote:
>> Introduce several new vhost fields for managing MQ state of the adapter
>> as well as initial defaults for MQ enablement.
>>
>> Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
>> ---
>>  drivers/scsi/ibmvscsi/ibmvfc.c | 8 ++++++++
>>  drivers/scsi/ibmvscsi/ibmvfc.h | 9 +++++++++
>>  2 files changed, 17 insertions(+)
>>
>> diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
>> index ba95438a8912..9200fe49c57e 100644
>> --- a/drivers/scsi/ibmvscsi/ibmvfc.c
>> +++ b/drivers/scsi/ibmvscsi/ibmvfc.c
>> @@ -3302,6 +3302,7 @@ static struct scsi_host_template driver_template = {
>>  	.max_sectors = IBMVFC_MAX_SECTORS,
>>  	.shost_attrs = ibmvfc_attrs,
>>  	.track_queue_depth = 1,
>> +	.host_tagset = 1,
> 
> This doesn't seem right. You are setting host_tagset, which means you want a
> shared, host wide, tag set for commands. It also means that the total
> queue depth for the host is can_queue. However, it looks like you are allocating
> max_requests events for each sub crq, which means you are over allocating memory.

With the shared tagset yes the queue depth for the host is can_queue, but this
also implies that the max queue depth for each hw queue is also can_queue. So,
in the worst case that all commands are queued down the same hw queue we need an
event pool with can_queue commands.

> 
> Looking at this closer, we might have bigger problems. There is a host wide
> max number of commands that the VFC host supports, which gets returned on
> NPIV Login. This value can change across a live migration event.

From what I understand the max commands can only become less.

> 
> The ibmvfc driver, which does the same thing the lpfc driver does, modifies
> can_queue on the scsi_host *after* the tag set has been allocated. This looks
> to be a concern with ibmvfc, not sure about lpfc, as it doesn't look like
> we look at can_queue once the tag set is setup, and I'm not seeing a good way
> to dynamically change the host queue depth once the tag set is setup. 
> 
> Unless I'm missing something, our best options appear to either be to implement
> our own host wide busy reference counting, which doesn't sound very good, or
> we need to add some API to block / scsi that allows us to dynamically change
> can_queue.

Changing can_queue won't do use any good with the shared tagset becasue each
queue still needs to be able to queue can_queue number of commands in the worst
case.

The complaint before was not using shared tags increases the tag memory
allocation because they are statically allocated for each queue. The question is
what claims more memory our event pool allocation or the tagset per queue
allocation.

If we chose to not use the shared tagset then the queue depth for each hw queue
becomes (can_queue / nr_hw_queues).

-Tyrel

> 
> Thanks,
> 
> Brian
> 
> 

