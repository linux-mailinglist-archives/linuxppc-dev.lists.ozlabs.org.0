Return-Path: <linuxppc-dev+bounces-13990-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D36B5C45642
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Nov 2025 09:40:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d4jln3l0Lz2xql;
	Mon, 10 Nov 2025 19:40:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762764005;
	cv=none; b=eRtA2TlF+ADfOq21OB4uJVwPuuZyYBxuoB/KJBuqwFQ9OSRhh/r93+WAGzd+ptJlpTE7BZbrG1rzcMkDIpiNjZzYPPKkJ2sBJSD/X4MowkcrYGilcfN3lOs4DkyXWIy4hEWkjnj7CNLoO+XLcURXsK9KayaBj4PNBMu9LWqTOCFVXOvDpVSf+ncWLdkFjBpMX92PDWUnkXB5CxxyNulX6BEFJhR/0meSUcs0hqlHH9HHgqIEIWOooWtWed3b/ZkXSIOFEozc2cE9FyUwl/14Q5OWUW1nZ4/u5tXmzgFKS6EfkQIajvLiFw66XEjrfn6Sh0way8kIETDT/03lymzd4A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762764005; c=relaxed/relaxed;
	bh=CoKojaskLBR6PzEuZ4qSFL6ygxd9zLbisaOhoCbAjLM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dK2T6t6GPT3lUJ2UT99PG6t/HWmC1N3jm1U06gR/flLUDGCek0PzjzsuixRJon4vtnF4NWWK1C/l/z+72fCLtEjHB+8GtR0eS85k48IrOSrrNcZltf/u+pn8kLLxiV/1XFtITlYJ3Fy5H+4JZZdAaeglF1vbNmssVZboACtnpBesqSf5MWw3PCehjWkzvrRTNv7d4lY5zY4L98iOaD+SX4z/WB+umZH1Nk4/dGdOO7IAzQqjsWvGIWiSbaNVjlnURHPNCdXQjp1XEGTpIt0Squ5SEwfqya6OVmBW3sOVxGd3gOtQRapD7/XlAKle4ibMFF6AnmugPMKnfcrRNvd2xQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YHA9LAJe; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YHA9LAJe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d4jlm4n7Dz2xqh
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Nov 2025 19:40:04 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A9KjEar017554;
	Mon, 10 Nov 2025 08:40:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=CoKoja
	skLBR6PzEuZ4qSFL6ygxd9zLbisaOhoCbAjLM=; b=YHA9LAJeAu997JGQ76AmMi
	XJ8xOvUXLaqdw7LLD2nqQZyXH9zoMHMhanYe7yYBGfR9vPxYIvBV3HOncBkjKtVJ
	djxHk4jmtVd7vgJ4qfPllH4MfgaKi/1ux2LZ477LSVf735jx5E+z5ge2KAiOkBnh
	dRSeKVwkU+OEs9xyyFh178p5Je7xp0D0nsa27HH3IpLDwlwv8aXcM/BhEzWIDLBw
	n5yL0mZbEVBj6pgVPCwVETF8qjy3YJv2faeOqufyGsXhFg/8WxRUfZ1UqJw6yIQn
	QGHayHlClwR3Ty+WraXVL+QIu2Z8RjXM2JOdKaeScpNUwYYvR0uKTjGS7rfeBkKg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a9wk7y87p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 08:39:59 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AA8Mnw0017921;
	Mon, 10 Nov 2025 08:39:59 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a9wk7y87m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 08:39:59 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AA4g8rf008190;
	Mon, 10 Nov 2025 08:39:57 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4aah6mmp20-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 08:39:57 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AA8drjX30146954
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Nov 2025 08:39:53 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9C5172004B;
	Mon, 10 Nov 2025 08:39:53 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9C5A020040;
	Mon, 10 Nov 2025 08:39:50 +0000 (GMT)
Received: from [9.109.204.116] (unknown [9.109.204.116])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 10 Nov 2025 08:39:50 +0000 (GMT)
Message-ID: <09c4c181-eb4b-43ea-a439-04b83f4c20ba@linux.ibm.com>
Date: Mon, 10 Nov 2025 14:09:49 +0530
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] crash: export crashkernel CMA reservation to
 userspace
To: Baoquan he <bhe@redhat.com>
Cc: linux-kernel@vger.kernel.org, Aditya Gupta <adityag@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Dave Young <dyoung@redhat.com>, Hari Bathini <hbathini@linux.ibm.com>,
        Jiri Bohac <jbohac@suse.cz>, Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
        Pingfan Liu <piliu@redhat.com>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Shivang Upadhyay <shivangu@linux.ibm.com>,
        Vivek Goyal <vgoyal@redhat.com>, linuxppc-dev@lists.ozlabs.org,
        kexec@lists.infradead.org
References: <20251110043143.484408-1-sourabhjain@linux.ibm.com>
 <20251110043143.484408-6-sourabhjain@linux.ibm.com>
 <aRGPee9izxWPRHj5@MiWiFi-R3L-srv>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <aRGPee9izxWPRHj5@MiWiFi-R3L-srv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA4MDAyMiBTYWx0ZWRfX/lFqTdb+Ix31
 +ZxCwVkKK4eLHYKRdw/zlF4OBjYsPLlqSV25Ey2IeqS9NvBniaYxHkvF7FVO5m//S9NFjJtAr7c
 x+zUQ3zVKM+8B0loekFp8s1iK6uvGGEvpheDNbSz7rbDNaglzi3KA8vStXj4M2VNK9JR1hg9r3X
 198c4gYtB0Y2BajB3OnPTSXEuq0i3ilYkad5nEI3C7JPuFId2TM375JeY7tDkXGYDGR+vft1/px
 QGqA8ILewfwDDP/jSo3C052x1yR+0F2QGAocwZSt26JpIWE/KkD/WZKQnX+cSpRqfTEeAyVhaDv
 flIRIJ8demq62mlo0xYXj2LfLlkswpcV9/2s3ZUex1CD0df7TobM+yqNS+oOxpJSoBTvKRP1Ua0
 pfPdzQ51fWSodz1TMxO6uSB7k4aY4w==
X-Authority-Analysis: v=2.4 cv=ZK3aWH7b c=1 sm=1 tr=0 ts=6911a4df cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=Z4Rwk6OoAAAA:8 a=20KFwNOVAAAA:8
 a=pGLkceISAAAA:8 a=voM4FWlXAAAA:8 a=JfrnYn6hAAAA:8 a=nZ6l4sNALc67V84wghEA:9
 a=QEXdDO2ut3YA:10 a=HkZW87K1Qel5hWWM3VKY:22 a=IC2XNlieTeVoXbcui8wp:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: DwbPY7ohE7XwxBRgz3LrgMxK1K-_LihJ
X-Proofpoint-GUID: PlH9k_X-djhYdUkQ_pkrIaAwTCZLBdtr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_03,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2511080022
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 10/11/25 12:38, Baoquan he wrote:
> On 11/10/25 at 10:01am, Sourabh Jain wrote:
>> Add a sysfs entry /sys/kernel/kexec/crash_cma_ranges to expose all
>> CMA crashkernel ranges.
> I am not against this way. While wondering if it's more appropriate to
> export them into iomem_resource just like crashk_res and crashk_low_res
> doing.

Handling conflict is challenging. Hence we don't export crashk_res and
crashk_low_res to iomem on powerpc. Checkout [1]

And I think conflicts can occur regardless of the order in which System 
RAM and
Crash CMA ranges are added to iomem.

[1] 
https://lore.kernel.org/all/20251016142831.144515-1-sourabhjain@linux.ibm.com/

- Sourabh Jain

>
>> This allows userspace tools configuring kdump to determine how much
>> memory is reserved for crashkernel. If CMA is used, tools can warn
>> users when attempting to capture user pages with CMA reservation.
>>
>> The new sysfs hold the CMA ranges in below format:
>>
>> cat /sys/kernel/kexec/crash_cma_ranges
>> 100000000-10c7fffff
>>
>> Cc: Aditya Gupta <adityag@linux.ibm.com>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: Baoquan he <bhe@redhat.com>
>> Cc: Dave Young <dyoung@redhat.com>
>> Cc: Hari Bathini <hbathini@linux.ibm.com>
>> Cc: Jiri Bohac <jbohac@suse.cz>
>> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
>> Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
>> Cc: Pingfan Liu <piliu@redhat.com>
>> Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
>> Cc: Shivang Upadhyay <shivangu@linux.ibm.com>
>> Cc: Vivek Goyal <vgoyal@redhat.com>
>> Cc: linuxppc-dev@lists.ozlabs.org
>> Cc: kexec@lists.infradead.org
>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> ---
>> Changelog:
>>   - Add the missing hunk to export crash_cma_ranges sysfs
>>
>> ---
>>   .../ABI/testing/sysfs-kernel-kexec-kdump        | 10 ++++++++++
>>   kernel/kexec_core.c                             | 17 +++++++++++++++++
>>   2 files changed, 27 insertions(+)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-kernel-kexec-kdump b/Documentation/ABI/testing/sysfs-kernel-kexec-kdump
>> index 00c00f380fea..f59051b5d96d 100644
>> --- a/Documentation/ABI/testing/sysfs-kernel-kexec-kdump
>> +++ b/Documentation/ABI/testing/sysfs-kernel-kexec-kdump
>> @@ -49,3 +49,13 @@ Description:	read only
>>   		is used by the user space utility kexec to support updating the
>>   		in-kernel kdump image during hotplug operations.
>>   User:		Kexec tools
>> +
>> +What:		/sys/kernel/kexec/crash_cma_ranges
>> +Date:		Nov 2025
>> +Contact:	kexec@lists.infradead.org
>> +Description:	read only
>> +		Provides information about the memory ranges reserved from
>> +		the Contiguous Memory Allocator (CMA) area that are allocated
>> +		to the crash (kdump) kernel. It lists the start and end physical
>> +		addresses of CMA regions assigned for crashkernel use.
>> +User:		kdump service
>> diff --git a/kernel/kexec_core.c b/kernel/kexec_core.c
>> index 7476a46de5d6..da6ff72b4669 100644
>> --- a/kernel/kexec_core.c
>> +++ b/kernel/kexec_core.c
>> @@ -1271,6 +1271,22 @@ static ssize_t crash_size_store(struct kobject *kobj,
>>   }
>>   static struct kobj_attribute crash_size_attr = __ATTR_RW(crash_size);
>>   
>> +static ssize_t crash_cma_ranges_show(struct kobject *kobj,
>> +				     struct kobj_attribute *attr, char *buf)
>> +{
>> +
>> +	ssize_t len = 0;
>> +	int i;
>> +
>> +	for (i = 0; i < crashk_cma_cnt; ++i) {
>> +		len += sysfs_emit_at(buf, len, "%08llx-%08llx\n",
>> +				     crashk_cma_ranges[i].start,
>> +				     crashk_cma_ranges[i].end);
>> +	}
>> +	return len;
>> +}
>> +static struct kobj_attribute crash_cma_ranges_attr = __ATTR_RO(crash_cma_ranges);
>> +
>>   #ifdef CONFIG_CRASH_HOTPLUG
>>   static ssize_t crash_elfcorehdr_size_show(struct kobject *kobj,
>>   			       struct kobj_attribute *attr, char *buf)
>> @@ -1289,6 +1305,7 @@ static struct attribute *kexec_attrs[] = {
>>   #ifdef CONFIG_CRASH_DUMP
>>   	&crash_loaded_attr.attr,
>>   	&crash_size_attr.attr,
>> +	&crash_cma_ranges_attr.attr,
>>   #ifdef CONFIG_CRASH_HOTPLUG
>>   	&crash_elfcorehdr_size_attr.attr,
>>   #endif
>> -- 
>> 2.51.1
>>


