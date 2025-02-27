Return-Path: <linuxppc-dev+bounces-6524-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B49DA47396
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2025 04:30:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z3H0b53gRz2yvk;
	Thu, 27 Feb 2025 14:30:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740627023;
	cv=none; b=SZLEEUu+q3wHk4B3gveM5Ll+9oNvU31u1XcUiO1qUdXvysr6N7U7gegtYizdEOE4mQZUTOJWv+Tnhb3XYACICMC+xlecEjycnZHR7ZFWiYE7FoUTxeWnED0O6yWEsCQF1nyhm6A0Qo6wF6Cky3xUMUG06DCjfxcDEywnyrr0LhbFFjva2MBtm5lcy8cjuBSsLFzZ9aERGoptaSQ4G7sRSqC8ry/xRYy0YBtVUF78nbTRq0BjsFEGjeqPVrDe/antfuBd9n8WEhsxjDbaiC5b02rJ9fTPYNAySR3QeFhVJkFvpHts5cIyUiwVpZajAudWWQmQ038RR0s3eo1efbw11A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740627023; c=relaxed/relaxed;
	bh=M6THhD7s68JM3b5ClFD5Y/5q6feae9N06KpBUw2vPU4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ERQlXGlK5Yvdj2mvLc4ekDv7eEsc5UG/wCMcJA7GE/1PIsOWciii6KHQZ7x28bMV5zQHtgCCry2bNcoulvNEPAzg5uscrIn6LHHu8CpyhepO7gbOEtxRHQf39x7RuKu45JOAADF+kpZ8LXtYDL5CKmindVqaptBAxZ4pMzXi6q7P4fipd41i3EO7Mad3IxTOTNOML8+pvXrvE0TCr0mJrJdpAUnDmtzuo1mq8TkGRN3ZqVrdzBTJ8K1xqS1OTiMWdXuSd9lt8vEPeAo63z/R0jsQ6eKrC7Vj2YEjZRukvVFG74TeBN1LcOZHEDvg67tKQn63rVofc6oLhHSsXjRt+A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=G79nmhUI; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=G79nmhUI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z3H0Z61nSz2ygR
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2025 14:30:22 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51R2XIZ4022241;
	Thu, 27 Feb 2025 03:30:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=M6THhD
	7s68JM3b5ClFD5Y/5q6feae9N06KpBUw2vPU4=; b=G79nmhUIC3gf9Rj5MtDN1W
	0wG+ALnW0K7f1o9L9H+5AYDzZxJI5YFHXtJ2f2bzNGzdcZVtJ6VbtKcNfl6k8X1c
	8fR3o7UVo2/2G5dlDLGCnxlFoSLOok8WjrHIqj0ustYIR9RmSmr6aUcbog/UbIrl
	ts+kmg81s2DEHUqCBxCIcFzybEHHlZsjlIRjUWnfTbEv8Sr0rSDzN+qp5REM+53f
	kILqgw3qa4KT2k6ixyGWmiDnD2iVLG9QpqzStPi6jQSEwGAdSFPNWQhb+tmVt5xv
	49tsvHN052hr9cbcop0tTyGs2F/3ERa9HtVGRHTsg/qPdvR7Vk5XN2koUL3ecbkQ
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 451vs85shq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 03:30:13 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51R20i2K026280;
	Thu, 27 Feb 2025 03:30:12 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44yswnpesd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 03:30:12 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51R3UBqE15925838
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Feb 2025 03:30:12 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E35B15805D;
	Thu, 27 Feb 2025 03:30:11 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 701F85805C;
	Thu, 27 Feb 2025 03:30:09 +0000 (GMT)
Received: from [9.43.105.242] (unknown [9.43.105.242])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 27 Feb 2025 03:30:08 +0000 (GMT)
Message-ID: <7f795152-9d03-4f89-bfb6-125eb6e33873@linux.ibm.com>
Date: Thu, 27 Feb 2025 09:00:06 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Missing '#size-cells' in /ht@0,f2000000/pci@8/mac-io@7/i2s@0 on
 G5/G4 (kernel 6.13-rc3)
To: Erhard Furtner <erhard_f@mailbox.org>,
        Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
References: <20241219000749.6836d610@yea> <87jzbqpnd9.fsf@mpe.ellerman.id.au>
 <20250226231418.1df533c6@yea>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <20250226231418.1df533c6@yea>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: kAqNX2okQ9MiFQEvQ6TuIFmbFdnBDJpj
X-Proofpoint-GUID: kAqNX2okQ9MiFQEvQ6TuIFmbFdnBDJpj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_01,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 mlxlogscore=851 spamscore=0 mlxscore=0 malwarescore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502270025
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URI_HEX
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 2/27/25 3:44 AM, Erhard Furtner wrote:
> On Mon, 23 Dec 2024 23:58:26 +1100
> Michael Ellerman <mpe@ellerman.id.au> wrote:
> 
>> Erhard Furtner <erhard_f@mailbox.org> writes:
>>> Greetings!
>>>
>>> I am aware there is commit cf89c9434af122f28a3552e6f9cc5158c33ce50a
>>> (already merged in v6.13-rc3) which fixes some of the "Missing
>>> '#size-cells' errors" but there is more:
>>>
>>> ------------[ cut here ]------------
>>> hub 3-0:1.0: USB hub found
>>> Missing '#size-cells' in /ht@0,f2000000/pci@8/mac-io@7/i2s@0  
>>
>> Something like below might fix it.
>>
>> cheers
>>
>>
>> diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
>> index 8e776ba39497..462ee36ef891 100644
>> --- a/arch/powerpc/kernel/prom_init.c
>> +++ b/arch/powerpc/kernel/prom_init.c
>> @@ -2898,11 +2898,11 @@ static void __init fixup_device_tree_pmac(void)
>>  	char type[8];
>>  	phandle node;
>>  
>> -	// Some pmacs are missing #size-cells on escc nodes
>> +	// Some pmacs are missing #size-cells on escc & i2s nodes
>>  	for (node = 0; prom_next_node(&node); ) {
>>  		type[0] = '\0';
>>  		prom_getprop(node, "device_type", type, sizeof(type));
>> -		if (prom_strcmp(type, "escc"))
>> +		if (prom_strcmp(type, "escc") && prom_strcmp(type, "i2s"))
>>  			continue;
>>  
>>  		if (prom_getproplen(node, "#size-cells") != PROM_ERROR)
>>
> 
> The fix works on my PowerMac G4 DP. And there is also https://patchwork.ozlabs.org/project/linuxppc-dev/patch/875xmizl6a.fsf@igel.home/ which seems to be the same patch.
> 
Sorry, missed it. I will add the above patch to -next.

Maddy

> But as of kernel v6.14-rc3 none of these is included. Could one of these patches be upstreamed?
> 
> Regards,
> Erhard
> 


