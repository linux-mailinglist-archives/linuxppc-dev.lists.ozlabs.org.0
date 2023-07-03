Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE21745C39
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 14:29:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DeRbszFr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QvlbN22Kfz3bsf
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 22:29:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DeRbszFr;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QvlZS2S5Pz2ywt
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jul 2023 22:28:16 +1000 (AEST)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4QvlZS0fQBz4wxR
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jul 2023 22:28:16 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4QvlZS0Zd8z4wqZ; Mon,  3 Jul 2023 22:28:16 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DeRbszFr;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4QvlZR3Hp8z4wZp;
	Mon,  3 Jul 2023 22:28:14 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 363CH3f0010627;
	Mon, 3 Jul 2023 12:28:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=stnW1JaLeiyIPN4wAdLkEf9+kfNVulhn4QswGgf1HxM=;
 b=DeRbszFrV18A10tgbuT2vyet34ZTjqxvMn3lWIAjnO0nqIag1xSOx36EYCU5VoAelc9r
 no8Mm7q/OeFFWJKJc+MlUFRb7SFsCM/cZkfBgQoYarHIjiYkMRTwg/5BoABUJ2boFx6K
 QQSoT6GzySOzPXgOUy0llFqWvApQhG19v0k5WkEcXvFjuLYv8zTyXgNj5T1CP7aEv/2x
 /2d6GE0qmOVFyclrZfi9itmlK4DBq9P+4bIwm3pIseafsJZlDGYUUHkjuqOB4KZMzvR7
 B8g0bBegAPVY7C4fvDm1xXq64IjM35SJg2q9yCNYvsE3EAz1u4PdO/nuWx7MLM8qlBQ6 0A== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rkx6s88f5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jul 2023 12:28:11 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3638HYUf014803;
	Mon, 3 Jul 2023 12:28:08 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3rjbde1aee-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jul 2023 12:28:08 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 363CS4FF17892016
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 3 Jul 2023 12:28:04 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7E8B920049;
	Mon,  3 Jul 2023 12:28:04 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 99B8A20040;
	Mon,  3 Jul 2023 12:28:02 +0000 (GMT)
Received: from [9.43.7.197] (unknown [9.43.7.197])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  3 Jul 2023 12:28:02 +0000 (GMT)
Message-ID: <a199b87c-241e-1c64-7031-ad77d322822d@linux.ibm.com>
Date: Mon, 3 Jul 2023 17:58:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] powerpc/fadump: reset dump area size variable if memblock
 reserve fails
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
References: <20230608092246.343761-1-sourabhjain@linux.ibm.com>
 <ed637200-537f-70a5-bf40-ceefb2092e1e@linux.ibm.com>
 <875y71w7w2.fsf@mail.lhotse>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <875y71w7w2.fsf@mail.lhotse>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: F82jPpDrwfSG9F0f_b_OGZpuCtDi1oPN
X-Proofpoint-GUID: F82jPpDrwfSG9F0f_b_OGZpuCtDi1oPN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-03_09,2023-06-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307030109
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
Cc: mahesh@linux.vnet.ibm.com, Mahesh Salgaonkar <mahesh@linux.ibm.com>, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 03/07/23 16:59, Michael Ellerman wrote:
> Sourabh Jain <sourabhjain@linux.ibm.com> writes:
>> Hello Michael,
>>
>> Do you have any feedback or comments regarding this patch?
>>
>> Thanks,
>> Sourabh
>>
>> On 08/06/23 14:52, Sourabh Jain wrote:
>>> If the memory reservation process (memblock_reserve) fails to reserve
>>> the memory, the reserve dump variable retains the dump area size.
>>> Consequently, the size of the dump area calculated for reservation
>>> is displayed in /sys/kernel/fadump/mem_reserved.
>>>
>>> To resolve this issue, the reserve dump area size variable is set to 0
>>> if the memblock_reserve fails to reserve memory.
>>>
>>> Fixes: 8255da95e545 ("powerpc/fadump: release all the memory above boot memory size")
>>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>>> Acked-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
>>> ---
>>>    arch/powerpc/kernel/fadump.c | 1 +
>>>    1 file changed, 1 insertion(+)
>>>
>>> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
>>> index ea0a073abd96..a8f2c3b2fa1e 100644
>>> --- a/arch/powerpc/kernel/fadump.c
>>> +++ b/arch/powerpc/kernel/fadump.c
>>> @@ -641,6 +641,7 @@ int __init fadump_reserve_mem(void)
>>>    			goto error_out;
>>>    
>>>    		if (memblock_reserve(base, size)) {
>>> +			fw_dump.reserve_dump_area_size = 0;
>>>    			pr_err("Failed to reserve memory!\n");
>>>    			goto error_out;
>>>    		}
> Shouldn't reserve_dump_area_size be set to zero at error_out, which
> already clears fadump_enabled?
>
> 	return ret;
> error_out:
> 	fw_dump.fadump_enabled = 0;
> 	return 0;
> }
>
>
> Otherwise the code immediately above will suffer from the same issue
> won't it?
>
> 		if (fw_dump.ops->fadump_setup_metadata &&
> 		    (fw_dump.ops->fadump_setup_metadata(&fw_dump) < 0))
> 			goto error_out;

Agree, resetting fw_dump.reserve_dump_area_size below error_out label is 
better.

Thanks for the review. I will send v2.

Sourabh Jain
