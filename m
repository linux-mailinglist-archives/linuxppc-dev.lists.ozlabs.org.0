Return-Path: <linuxppc-dev+bounces-5499-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B60A1A2D3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2025 12:22:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ydz7V6j74z3024;
	Thu, 23 Jan 2025 22:22:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737631350;
	cv=none; b=icO9jqYdglRdmwWNwrSIJWhaJjZgU1t3WwMwk7ozkdKbZJGWKodzk3+JPDIvKJMVvNErp4UbxfdSpZK0ebvROG+VqRjPmDE1MPCIYvadarGUCfOlEiFMe5NEb5eE5NVG1t3faSZCeqaQd1v1dpqGCyI7QrKs9dYdTRlAQDNq7t9XKcHGESgiCG9kXrSrldbbhVjEsNEmmNhuuTNm0WfxzPgCgoW3bF1pY6Ij9f+xpKrdaYcrDRFiuxzNQ7tQSSbppgldqWIPy7PI2JUFMjEPyZIkbSfgzMCQGMn5bSBhrsO5uWiHdqg74vkP9I4bOzDCmaFoZ8A3u01KkGoezVIw2w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737631350; c=relaxed/relaxed;
	bh=LR5n9GkVxfTaElMok3QnHOYgkrzpHmgjrAqxzgax9wI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eUyadS1rDYfdyz9aBaev8lQ+6x7Lrl+1eTKrpwUbAYOnQqGXYlKuGBQSLER3E0n2SMFsfDg986McplHlHWLcUMc4D+Bf1PPEwTXB35HgoYvgSQDwIDDF/tQA+H/urqBAKDfWQQalrOF03r/tXzvNCczIKnGgn1H58zTGG0Sf+DvCaRX5hJJ1RIv5KHc1122D41Ws7TXTmB01cqwMZfXprDlB6s5Tb4PJi66zfM8o7+Ipw/fi5krlJG9lP+xz8pFVIX61piHgDi/1sDP0Cvjkm+ayX4dJWzv+99Pdn4cq2wl303+sLBGXvzHfnXGaVizWd7xJ4OAhoJuPpzF2YkA+mw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=joON4YHz; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=joON4YHz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ydz7T5djmz2ytN
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jan 2025 22:22:29 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50N3oIZI017109;
	Thu, 23 Jan 2025 11:22:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=LR5n9G
	kVxfTaElMok3QnHOYgkrzpHmgjrAqxzgax9wI=; b=joON4YHz6ebOzUVJuOrRsG
	DkxS3E+mhHEuMuTrLsNpXoGT640d2UfyO1Ul6uQY4vhoPPv8npp8X2mOZ9uEr126
	ghLAkD/CKN45+QX62ASfoyvBY/jbIu/nCBpOpRMW1LHcbqquPN1MNa/Zz338ojv6
	9F/lZvfm20Vxu83SvnNGXwSDGuptAo3w++8gJWDfhn80nC6C/cUoSZAeTuic/4FV
	eTT8rmV+USxMpVxK2vuTS9FTssWrcLbSMPwN5l0D0qHH69mjRqXFl6ameBaryB5M
	t6ywnom2cKi6pQRskil2fBBkunlgMWFwRP+LToLyQ7FHjf82uMY+Brkjny7ISzQA
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44b3gtvpq9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 11:22:17 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50N7fXNx029594;
	Thu, 23 Jan 2025 11:22:16 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 448qmnn8vy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 11:22:16 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50NBMCOD19530166
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Jan 2025 11:22:12 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8A62B20049;
	Thu, 23 Jan 2025 11:22:12 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D259520040;
	Thu, 23 Jan 2025 11:22:10 +0000 (GMT)
Received: from [9.109.204.94] (unknown [9.109.204.94])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 23 Jan 2025 11:22:10 +0000 (GMT)
Message-ID: <feff3c37-4998-43a5-9636-121c87e5d393@linux.ibm.com>
Date: Thu, 23 Jan 2025 16:52:09 +0530
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
Subject: Re: [PATCH v2 4/6] powerpc/kdump: preserve user-specified memory
 limit
To: Hari Bathini <hbathini@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Baoquan he <bhe@redhat.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>, kexec@lists.infradead.org,
        linux-kernel@vger.kernel.org, Mahesh Salgaonkar <mahesh@linux.ibm.com>
References: <20250121115442.1278458-1-sourabhjain@linux.ibm.com>
 <20250121115442.1278458-5-sourabhjain@linux.ibm.com>
 <43aeaa2c-c266-4d6e-921d-80b99ceb418b@linux.ibm.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <43aeaa2c-c266-4d6e-921d-80b99ceb418b@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: cmluhe-W408j1Z0_tx81-oGiE3ZSFkxB
X-Proofpoint-GUID: cmluhe-W408j1Z0_tx81-oGiE3ZSFkxB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_04,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 bulkscore=0 mlxscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 mlxlogscore=999 phishscore=0
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501230084
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello Hari,


On 23/01/25 16:00, Hari Bathini wrote:
>
>
> On 21/01/25 5:24 pm, Sourabh Jain wrote:
>> Commit 59d58189f3d9 ("crash: fix crash memory reserve exceed system
>> memory bug") fails crashkernel parsing if the crash size is found to be
>> higher than system RAM, which makes the memory_limit adjustment code
>> ineffective due to an early exit from reserve_crashkernel().
>>
>> Regardless lets not violated the user-specified memory limit by
>
> s/violated/violate/

Noted. It will be fixed in next version.

>
>> adjusting it. Remove this adjustment to ensure all reservations stay
>> within the limit. Commit f94f5ac07983 ("powerpc/fadump: Don't update
>> the user-specified memory limit") did the same for fadump.
>>
>
> Acked-by: Hari Bathini <hbathini@linux.ibm.com>

Thanks for the Ack!

- Sourabh Jain


>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: Baoquan he <bhe@redhat.com>
>> Cc: Hari Bathini <hbathini@linux.ibm.com>
>> CC: Madhavan Srinivasan <maddy@linux.ibm.com>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: kexec@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> ---
>>   arch/powerpc/kexec/core.c | 8 --------
>>   1 file changed, 8 deletions(-)
>>
>> diff --git a/arch/powerpc/kexec/core.c b/arch/powerpc/kexec/core.c
>> index b8333a49ea5d..4945b33322ae 100644
>> --- a/arch/powerpc/kexec/core.c
>> +++ b/arch/powerpc/kexec/core.c
>> @@ -150,14 +150,6 @@ void __init reserve_crashkernel(void)
>>           return;
>>       }
>>   -    /* Crash kernel trumps memory limit */
>> -    if (memory_limit && memory_limit <= crashk_res.end) {
>> -        memory_limit = crashk_res.end + 1;
>> -        total_mem_sz = memory_limit;
>> -        printk("Adjusted memory limit for crashkernel, now 0x%llx\n",
>> -               memory_limit);
>> -    }
>> -
>>       printk(KERN_INFO "Reserving %ldMB of memory at %ldMB "
>>               "for crashkernel (System RAM: %ldMB)\n",
>>               (unsigned long)(crash_size >> 20),
>


