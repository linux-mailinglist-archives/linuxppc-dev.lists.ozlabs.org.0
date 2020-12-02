Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E992CC962
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 23:11:46 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CmY8v3ZG3zDrBG
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 09:11:43 +1100 (AEDT)
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
 header.s=pp1 header.b=S5rUwgl5; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CmY6l2l79zDr4t
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Dec 2020 09:09:50 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B2M2nsS158328; Wed, 2 Dec 2020 17:09:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=xOYcIgHRxpLn8jOA98hLWOaGUzeQ/EDE9H3coqngL2E=;
 b=S5rUwgl5WvVo0v6flhO4nvx5J6HMurIfIkARfcNCGcYkY9q3z1Q9CNq5MzBrb4iMrcpB
 CwY4FtIFGZ78HKwNrrHQKlpdvEJKTph3aoceWkLJYsuG+m0B+r3FlHoFWjkngwJ0ttV6
 HdDrAtV5L2fDJjLgJtm+VBq8x1VJYfPHP+nl5UnDAt9+16Dx6TapND06jkbn555mXGou
 cUoz4twhEpo0dxsg7Ss4gSzf/jdQnC6f2zDdPPZAvLqKHZuR0z3o6qIMHbR67Y5IILue
 elGurBCukrpfEf/Yongtn0M7NL4ESLkJBssmz0C8VgXeW7wQ9+TM/Qg3U8Uz2/BcQtch jg== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 356a0vjxqc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Dec 2020 17:09:46 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B2M7Ul4029871;
 Wed, 2 Dec 2020 22:09:45 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma04wdc.us.ibm.com with ESMTP id 354ysumrku-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Dec 2020 22:09:45 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B2M9i5j9306800
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Dec 2020 22:09:44 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8A6FB1120B8;
 Wed,  2 Dec 2020 22:09:44 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 320581120B5;
 Wed,  2 Dec 2020 22:09:43 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.65.215.138])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  2 Dec 2020 22:09:43 +0000 (GMT)
Subject: Re: [PATCH v2 15/17] ibmvfc: send Cancel MAD down each hw scsi channel
To: Brian King <brking@linux.vnet.ibm.com>,
 james.bottomley@hansenpartnership.com
References: <20201202005329.4538-1-tyreld@linux.ibm.com>
 <20201202005329.4538-16-tyreld@linux.ibm.com>
 <21a7c970-2184-0524-5b42-1920eaa422a2@linux.vnet.ibm.com>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
Message-ID: <0e1760c8-ced0-cd50-391f-29a5a9ea340a@linux.ibm.com>
Date: Wed, 2 Dec 2020 14:09:42 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <21a7c970-2184-0524-5b42-1920eaa422a2@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-02_13:2020-11-30,
 2020-12-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012020134
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

On 12/2/20 10:27 AM, Brian King wrote:
> On 12/1/20 6:53 PM, Tyrel Datwyler wrote:
>> In general the client needs to send Cancel MADs and task management
>> commands down the same channel as the command(s) intended to cancel or
>> abort. The client assigns cancel keys per LUN and thus must send a
>> Cancel down each channel commands were submitted for that LUN. Further,
>> the client then must wait for those cancel completions prior to
>> submitting a LUN RESET or ABORT TASK SET.
>>
>> Allocate event pointers for each possible scsi channel and assign an
>> event for each channel that requires a cancel. Wait for completion each
>> submitted cancel.
>>
>> Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
>> ---
>>  drivers/scsi/ibmvscsi/ibmvfc.c | 106 +++++++++++++++++++++------------
>>  1 file changed, 68 insertions(+), 38 deletions(-)
>>
>> diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
>> index 0b6284020f06..97e8eed04b01 100644
>> --- a/drivers/scsi/ibmvscsi/ibmvfc.c
>> +++ b/drivers/scsi/ibmvscsi/ibmvfc.c
>> @@ -2339,32 +2339,52 @@ static int ibmvfc_cancel_all(struct scsi_device *sdev, int type)
>>  {
>>  	struct ibmvfc_host *vhost = shost_priv(sdev->host);
>>  	struct ibmvfc_event *evt, *found_evt;
>> -	union ibmvfc_iu rsp;
>> -	int rsp_rc = -EBUSY;
>> +	struct ibmvfc_event **evt_list;
>> +	union ibmvfc_iu *rsp;
>> +	int rsp_rc = 0;
>>  	unsigned long flags;
>>  	u16 status;
>> +	int num_hwq = 1;
>> +	int i;
>> +	int ret = 0;
>>  
>>  	ENTER;
>>  	spin_lock_irqsave(vhost->host->host_lock, flags);
>> -	found_evt = NULL;
>> -	list_for_each_entry(evt, &vhost->sent, queue) {
>> -		if (evt->cmnd && evt->cmnd->device == sdev) {
>> -			found_evt = evt;
>> -			break;
>> +	if (vhost->using_channels && vhost->scsi_scrqs.active_queues)
>> +		num_hwq = vhost->scsi_scrqs.active_queues;
>> +
>> +	evt_list = kcalloc(num_hwq, sizeof(*evt_list), GFP_KERNE> +	rsp = kcalloc(num_hwq, sizeof(*rsp), GFP_KERNEL);
> 
> Can't this just go on the stack? We don't want to be allocating memory
> during error recovery. Or, alternatively, you could put this in the
> vhost structure and protect it with a mutex. We only have enough events
> to single thread these anyway.
Yes, this could just go on the stack.

> 
>> +
>> +	for (i = 0; i < num_hwq; i++) {
>> +		sdev_printk(KERN_INFO, sdev, "Cancelling outstanding commands on queue %d.\n", i);
> 
> Prior to this patch, if there was nothing outstanding to the device and cancel_all was called,
> no messages would get printed. This is changing that behavior. Is that intentional? Additionally,
> it looks like this will get a lot more vebose, logging a message for each hw queue, regardless
> of whether there was anything outstanding. Perhaps you want to move this down to after the check
> for !found_evt?

It would actually print "no commands found to cancel". I think its fair to make
it less verbose or at least make them dbg output for each queue.

-Tyrel

> 
>> +
>> +		found_evt = NULL;
>> +		list_for_each_entry(evt, &vhost->sent, queue) {
>> +			if (evt->cmnd && evt->cmnd->device == sdev && evt->hwq == i) {
>> +				found_evt = evt;
>> +				break;
>> +			}
>>  		}
>> -	}
>>  
> 
> 
> 

