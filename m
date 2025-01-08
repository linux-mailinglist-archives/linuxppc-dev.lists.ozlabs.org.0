Return-Path: <linuxppc-dev+bounces-4844-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D5AA05AE9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 13:02:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSmkm3rsCz2xFm;
	Wed,  8 Jan 2025 23:02:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736337760;
	cv=none; b=Vw8w2YTrVND/sOWyIsgzZguO95FPDak8GjbvVK6Q7O1z+p3nvFsu4bIC28nQ4Ra7Q9R3Bg6GgU06+rQmI76XmUMeyJAlxANM4R0JWVFF0cqbHrGcqaOEWNt8+6BG2HS+p4D55zvV3z+YbxrG45p63z4/ExF/s2W68T1/mNJV40ueY2sBjaYw0YzfGAI8rXATadkTe8Vfgm/YWtgjEZ8Wfyun8A+rX8IoNySb5QBOQqSqzYNxuYzxREGReSuG+iKvKY1Zs9i2fwyb/ZNjcU+4Dpywi8N9iltXaE+TTlTVErSseL0yGukwKyMIgIpzGYLa88M+5XcgJvdSierDNbHxcw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736337760; c=relaxed/relaxed;
	bh=MmS4DYQwur7WJQ24jzp44KxvRMWZaKri3Od2Jv/tigk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PVj8RY6j6YYw8b/vyv4yYwqyJeEahfLx9j/AhXQgE1YfHzVnnhqw4lsO+LzsoRNYb0Hv77UkBZorWkYNFLD/vXgZtPOdOlD8UJxs9rQqbOiKzRodAogjqbERJWmEVamHwb6ANzUVzFPr0Fd09eHSdqurLKYkiqnk0lwDUw6ORWF4KWliXJccV8huGfggO3vYHbdnHSRZJxI0O6Ok50eTNL+acR/cts7sBhc+Pn8p/+BkMXn0++ZUKFxgN9GtWA4b2w+l+HloAgLle1JTJyV+mG66fk+toVFjWhxDtoUi+2R1BtVdqG9pq6W+a87IWOe0ZtQt0z8c/thUw1UivCQpxA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VoqZT8Tj; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VoqZT8Tj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YSmkk6k82z2x9T
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2025 23:02:38 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5083r5IL006929;
	Wed, 8 Jan 2025 12:02:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=MmS4DY
	Qwur7WJQ24jzp44KxvRMWZaKri3Od2Jv/tigk=; b=VoqZT8Tj0d8alM6xU2cNKQ
	6+Gxe/JmeFgyneKS0QlqjLxBNXAwKRZ5zSz8NUTMyaC73b9vv9tk0ewynE23MjNZ
	y3jBpMaDz6A7OPv5FJR8mQj3+Jo0sx5EAtMGq97vW5u5jAUCC7zXxzsU4/+2MYlv
	aYJ28Fqd0HvQaop6cjxWgZo17VedG0koq+1HDvWeVNwwHsoxvst0krqCjvk+If4W
	huu5ytsye8aO7qmxP7PjzUceA41d8KfuG9t4O/jJRxZdmNrHX4ZqgSmgSHig4VzL
	GrN675+xw83dfhExgd612O8gPeLDBrvGjZ8PCfgKGnUtixCeL1pto2D9/Wp115QQ
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 441hupt2jc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 12:02:27 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 508A2Bfv027997;
	Wed, 8 Jan 2025 12:02:26 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 43yhhk7c0s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 12:02:26 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 508C2MCH50594104
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Jan 2025 12:02:22 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 78F2F20049;
	Wed,  8 Jan 2025 12:02:22 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 93A6B2004D;
	Wed,  8 Jan 2025 12:02:20 +0000 (GMT)
Received: from [9.109.204.94] (unknown [9.109.204.94])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  8 Jan 2025 12:02:20 +0000 (GMT)
Message-ID: <622d9d6d-3dfc-4bdb-b251-4abf9299fc6a@linux.ibm.com>
Date: Wed, 8 Jan 2025 17:32:19 +0530
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
Subject: Re: [PATCH RESEND v1 2/5] crash: let arch decide crash memory export
 to iomem_resource
To: Baoquan he <bhe@redhat.com>
Cc: linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>, kexec@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250108101458.406806-1-sourabhjain@linux.ibm.com>
 <20250108101458.406806-3-sourabhjain@linux.ibm.com>
 <Z35gnO2N/LFt1E7E@MiWiFi-R3L-srv>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <Z35gnO2N/LFt1E7E@MiWiFi-R3L-srv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: FDF-htNt5foZo1yPQ6u0KJVXvE4WVYwE
X-Proofpoint-GUID: FDF-htNt5foZo1yPQ6u0KJVXvE4WVYwE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 bulkscore=0 impostorscore=0 mlxlogscore=653
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501080098
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello Baoquan

On 08/01/25 16:55, Baoquan he wrote:
> Hi,
>
> On 01/08/25 at 03:44pm, Sourabh Jain wrote:
>> insert_crashkernel_resources() adds crash memory to iomem_resource if
>> generic crashkernel reservation is enabled on an architecture.
>>
>> On PowerPC, system RAM is added to iomem_resource. See commit
>> c40dd2f766440 ("powerpc: Add System RAM to /proc/iomem").
>>
>> Enabling generic crashkernel reservation on PowerPC leads to a conflict
>> when system RAM is added to iomem_resource because a part of the system
>> RAM, the crashkernel memory, has already been added to iomem_resource.
>>
>> The next commit in the series "powerpc/crash: use generic crashkernel
>> reservation" enables generic crashkernel reservation on PowerPC. If the
>> crashkernel is added to iomem_resource, the kernel fails to add
>> system RAM to /proc/iomem and prints the following traces:
>>
>> CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.13.0-rc2+
>> snip...
>> NIP [c000000002016b3c] add_system_ram_resources+0xf0/0x15c
>> LR [c000000002016b34] add_system_ram_resources+0xe8/0x15c
>> Call Trace:
>> [c00000000484bbc0] [c000000002016b34] add_system_ram_resources+0xe8/0x15c
>> [c00000000484bc20] [c000000000010a4c] do_one_initcall+0x7c/0x39c
>> [c00000000484bd00] [c000000002005418] do_initcalls+0x144/0x18c
>> [c00000000484bd90] [c000000002005714] kernel_init_freeable+0x21c/0x290
>> [c00000000484bdf0] [c0000000000110f4] kernel_init+0x2c/0x1b8
>> [c00000000484be50] [c00000000000dd3c] ret_from_kernel_user_thread+0x14/0x1c
>>
>> To avoid this, an architecture hook is added in
>> insert_crashkernel_resources(), allowing the architecture to decide
>> whether crashkernel memory should be added to iomem_resource.
> Have you tried defining HAVE_ARCH_ADD_CRASH_RES_TO_IOMEM_EARLY in ppc to
> add crashkernel region to iomem early?


I didn’t try, but I think even if I do, the kernel will run into the 
same issue
because as soon as crashkernel is added to iomem, there will be a resource
conflict when the PowerPC code tries to add system RAM to iomem. Which
happens during subsys_initcall.

Regardless, I will give it a try.

> Now there are two branches in the
> existing code, adding a hook will make three ways.

I agree. I can try updating powerpc code to not consider crashkernel 
memory as
iomem conflict.

Thanks for the review.

- Sourabh Jain

