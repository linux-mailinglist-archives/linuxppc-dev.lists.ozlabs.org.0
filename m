Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 343AA8A485D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Apr 2024 08:50:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FoiWNSXV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VHyVG6dLYz3vX1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Apr 2024 16:50:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FoiWNSXV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VHyTY2MQ1z3bnv
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Apr 2024 16:49:52 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43F3usoH011540;
	Mon, 15 Apr 2024 06:49:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Tv8pAB4SLvSUA1v50B/DUEvGp350+hQH/O07Dmma1y0=;
 b=FoiWNSXV5xPGayojCMKqxKgJTVQ97ngS/7k+r5TrtEwEnlJsk3pQ8dKBc5JqkjPyEpLJ
 b2WcYhtuKcVnxGCiPb52OAl8tWs84d4fieER2nxpLvjWOAPG+lUZa0xT5H85HYNHlR1w
 bdyjhS7dJR1gCb4Z8GccucY6H+G7UVkFhhU4XHLJYG1P49HQ4zr2zi/EwLnti2mtPA6+
 NUL28aFfB3x35vmYAztdd90nPUx6Z2t/0WXKEChtw6tNtVyeKJjO0naGbFF/QiUlCQZS
 rGJp8p26waqi8ZMSLY3zxOcd32a8sxmeojkEL/RfrADwB1aDd2iOrfq49Nl9Gr17oySF pQ== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xfh2jk8xw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Apr 2024 06:49:46 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43F602QW023632;
	Mon, 15 Apr 2024 06:49:45 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3xg5cnpb9p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Apr 2024 06:49:45 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43F6nfQi39387536
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 15 Apr 2024 06:49:43 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6246720063;
	Mon, 15 Apr 2024 06:49:41 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 54E6E20040;
	Mon, 15 Apr 2024 06:49:39 +0000 (GMT)
Received: from [9.171.63.54] (unknown [9.171.63.54])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 15 Apr 2024 06:49:39 +0000 (GMT)
Message-ID: <73516a29-a172-4b47-8f69-3e40ffacd47c@linux.ibm.com>
Date: Mon, 15 Apr 2024 12:19:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/eeh: Permanently disable the removed device
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
References: <20240405131420.998618-1-ganeshgr@linux.ibm.com>
 <87v84qaopi.fsf@mail.lhotse>
From: Ganesh G R <ganeshgr@linux.ibm.com>
In-Reply-To: <87v84qaopi.fsf@mail.lhotse>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Zr19JoZ06asJaahj9BPqIedbTtUwSTIM
X-Proofpoint-ORIG-GUID: Zr19JoZ06asJaahj9BPqIedbTtUwSTIM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-15_06,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 mlxscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404150043
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
Cc: Sahitya.Damerla@ibm.com, mahesh@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/9/24 14:37, Michael Ellerman wrote:

> Hi Ganesh,
>
> Ganesh Goudar <ganeshgr@linux.ibm.com> writes:
>> When a device is hot removed on powernv, the hotplug
>> driver clears the device's state. However, on pseries,
>> if a device is removed by phyp after reaching the error
>> threshold, the kernel remains unaware, leading to the
>> device not being torn down. This prevents necessary
>> remediation actions like failover.
>>
>> Permanently disable the device if the presence check
>> fails.
> You can wrap your changelogs a bit wider, 70 or 80 columns is fine.

ok

>> diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
>> index ab316e155ea9..8d1606406d3f 100644
>> --- a/arch/powerpc/kernel/eeh.c
>> +++ b/arch/powerpc/kernel/eeh.c
>> @@ -508,7 +508,9 @@ int eeh_dev_check_failure(struct eeh_dev *edev)
>>   	 * state, PE is in good state.
>>   	 */
>>   	if ((ret < 0) ||
>> -	    (ret == EEH_STATE_NOT_SUPPORT) || eeh_state_active(ret)) {
>> +	    (ret == EEH_STATE_NOT_SUPPORT &&
>> +	     dev->error_state == pci_channel_io_perm_failure) ||
>> +	    eeh_state_active(ret)) {
>>   		eeh_stats.false_positives++;
>>   		pe->false_positives++;
>>   		rc = 0;
> How does this hunk relate the changelog?
>
> This is adding an extra condition to the false positive check, so
> there's a risk this causes devices to go into failure when previously
> they didn't, right? So please explain why it's a good change. The
> comment above the if needs updating too.

We need this change to log the event and get the device removed, I will explain this
in commit message.

>> diff --git a/arch/powerpc/kernel/eeh_driver.c b/arch/powerpc/kernel/eeh_driver.c
>> index 48773d2d9be3..10317badf471 100644
>> --- a/arch/powerpc/kernel/eeh_driver.c
>> +++ b/arch/powerpc/kernel/eeh_driver.c
>> @@ -867,7 +867,13 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
>>   	if (!devices) {
>>   		pr_debug("EEH: Frozen PHB#%x-PE#%x is empty!\n",
>>   			pe->phb->global_number, pe->addr);
>> -		goto out; /* nothing to recover */
> The other cases that go to recover_failed usually print something at
> warn level, so this probably should too. So either make the above a
> pr_warn(), or change it to a warn with a more helpful message.

ok

>> +		/*
>> +		 * The device is removed, Tear down its state,
>> +		 * On powernv hotplug driver would take care of
>> +		 * it but not on pseries, Permanently disable the
>> +		 * card as it is hot removed.
>> +		 */
> Formatting and punctuation is weird. It can be wider, and capital letter
> is only required after a full stop, not a comma.

ok, i will take care of it.

> Also you say that the powernv hotplug driver "would" take care of it,
> that's past tense, is that what you mean? Does the powernv hotplug
> driver still take care of it after this change? And (how) does that
> driver cope with it happening here also?

Yes, hotplug driver can still remove the device and the removal of
device is covered by pci rescan lock.

>> +		goto recover_failed;
>>   	}
>>   	
> cheers
