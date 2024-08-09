Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E57E94CF2C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2024 13:04:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SAz2rH4j;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WgLdb2MBXz3023
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2024 21:04:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SAz2rH4j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WgLcv6gt6z2yNf
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Aug 2024 21:03:43 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4793o1gb016037;
	Fri, 9 Aug 2024 11:03:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=pp1; bh=
	nJqdIO0p9YPVRh8ZpNHZjkYc5An8vfwCyjwbvPnd+W8=; b=SAz2rH4jD+cwHj5b
	D4UfBmBnCVX6aVVKXwgUDW2l3PJOI3q8hiavJK2WyaXuCrZSSeajqqHAQWIs6mqT
	EibNjY8NEsPRzG6Z6CIwMJ7jyfMzUobYg4lBzhYkENKte1tXEwFU2A4eJHwN44Kh
	v8xVNSNKvXF9vES6e5TYvITVQTCjfBKLroAJ0nViF0vsoSpDCVSsKxYhfDAZv82h
	lGSaPeTCf0hRGxptzUseuGGwjhrUbwSB3sysNMkXZkLBZovBTOZd8/cJJtqBpQcu
	OvMtACoyqtQQrPUQpwQcGKV+o58CdBhyWTcTiFTz0B9GlfCxITjQ4Ml0qSLWjXvM
	t8zFFQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40vwkd2m8r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Aug 2024 11:03:31 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 479B3Vkh029468;
	Fri, 9 Aug 2024 11:03:31 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40vwkd2m8n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Aug 2024 11:03:31 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 4799XVRF030246;
	Fri, 9 Aug 2024 11:03:30 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 40t1k3jtfm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Aug 2024 11:03:30 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 479B3QQi52167120
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 9 Aug 2024 11:03:29 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D9B7B20043;
	Fri,  9 Aug 2024 11:03:26 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A8B3B20040;
	Fri,  9 Aug 2024 11:03:14 +0000 (GMT)
Received: from [9.43.4.15] (unknown [9.43.4.15])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  9 Aug 2024 11:03:12 +0000 (GMT)
Message-ID: <10624524-a078-404e-a5ba-c250de81c36f@linux.ibm.com>
Date: Fri, 9 Aug 2024 16:33:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Document/kexec: Generalize crash hotplug description
To: Baoquan He <bhe@redhat.com>, Petr Tesarik <petr@tesarici.cz>
References: <20240805050829.297171-1-sourabhjain@linux.ibm.com>
 <ZrV1V4QzDShYJSsI@MiWiFi-R3L-srv>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <ZrV1V4QzDShYJSsI@MiWiFi-R3L-srv>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: G3dNSs9_K1sjeYx6XFYqMwIVVVXLlSAp
X-Proofpoint-ORIG-GUID: HeiXgEUdtAaoaB5J6mr7b5erk5Y9HC1i
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-09_07,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 mlxscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 mlxlogscore=999 spamscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408090077
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
Cc: linuxppc-dev@lists.ozlabs.org, x86@kernel.org, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Baoquan,

On 09/08/24 07:18, Baoquan He wrote:
> On 08/05/24 at 10:38am, Sourabh Jain wrote:
>> Commit 79365026f869 ("crash: add a new kexec flag for hotplug support")
>> generalizes the crash hotplug support to allow architectures to update
>> multiple kexec segments on CPU/Memory hotplug and not just elfcorehdr.
>> Therefore, update the relevant kernel documentation to reflect the same.
>>
>> No functional change.
>>
>> Cc: Petr Tesarik <petr@tesarici.cz>
>> Cc: Hari Bathini <hbathini@linux.ibm.com>
>> Cc: kexec@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> Cc: linuxppc-dev@lists.ozlabs.org
>> Cc: x86@kernel.org
>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> ---
>>
>> Discussion about the documentation update:
>> https://lore.kernel.org/all/68d0328d-531a-4a2b-ab26-c97fd8a12e8b@linux.ibm.com/
>>
>> ---
>>   .../ABI/testing/sysfs-devices-memory          |  6 ++--
>>   .../ABI/testing/sysfs-devices-system-cpu      |  6 ++--
>>   .../admin-guide/mm/memory-hotplug.rst         |  5 ++--
>>   Documentation/core-api/cpu_hotplug.rst        | 10 ++++---
>>   kernel/crash_core.c                           | 29 ++++++++++++-------
>>   5 files changed, 33 insertions(+), 23 deletions(-)
> The overall looks good to me, except of concern from Petr. Thanks.

Thanks for the review. I will make the suggested changes in v2.

Additionally I will also generalize the error message
"kexec_trylock() failed, elfcorehdr may be inaccurate " from
functions crash_handle_hotplug_event() and crash_check_hotplug_support()
to "kexec_trylock() failed, kdump image may be inaccurate"

- Sourabh Jain

>
>> diff --git a/Documentation/ABI/testing/sysfs-devices-memory b/Documentation/ABI/testing/sysfs-devices-memory
>> index a95e0f17c35a..421acc8e2c6b 100644
>> --- a/Documentation/ABI/testing/sysfs-devices-memory
>> +++ b/Documentation/ABI/testing/sysfs-devices-memory
>> @@ -115,6 +115,6 @@ What:		/sys/devices/system/memory/crash_hotplug
>>   Date:		Aug 2023
>>   Contact:	Linux kernel mailing list <linux-kernel@vger.kernel.org>
>>   Description:
>> -		(RO) indicates whether or not the kernel directly supports
>> -		modifying the crash elfcorehdr for memory hot un/plug and/or
>> -		on/offline changes.
>> +		(RO) indicates whether or not the kernel update of kexec
>> +		segments on memory hot un/plug and/or on/offline events,
>> +		avoiding the need to reload kdump kernel.
>> diff --git a/Documentation/ABI/testing/sysfs-devices-system-cpu b/Documentation/ABI/testing/sysfs-devices-system-cpu
>> index 325873385b71..f4ada1cd2f96 100644
>> --- a/Documentation/ABI/testing/sysfs-devices-system-cpu
>> +++ b/Documentation/ABI/testing/sysfs-devices-system-cpu
>> @@ -703,9 +703,9 @@ What:		/sys/devices/system/cpu/crash_hotplug
>>   Date:		Aug 2023
>>   Contact:	Linux kernel mailing list <linux-kernel@vger.kernel.org>
>>   Description:
>> -		(RO) indicates whether or not the kernel directly supports
>> -		modifying the crash elfcorehdr for CPU hot un/plug and/or
>> -		on/offline changes.
>> +		(RO) indicates whether or not the kernel update of kexec
>> +		segments on CPU hot un/plug and/or on/offline events,
>> +		avoiding the need to reload kdump kernel.
>>   
>>   What:		/sys/devices/system/cpu/enabled
>>   Date:		Nov 2022
>> diff --git a/Documentation/admin-guide/mm/memory-hotplug.rst b/Documentation/admin-guide/mm/memory-hotplug.rst
>> index 098f14d83e99..cb2c080f400c 100644
>> --- a/Documentation/admin-guide/mm/memory-hotplug.rst
>> +++ b/Documentation/admin-guide/mm/memory-hotplug.rst
>> @@ -294,8 +294,9 @@ The following files are currently defined:
>>   ``crash_hotplug``      read-only: when changes to the system memory map
>>   		       occur due to hot un/plug of memory, this file contains
>>   		       '1' if the kernel updates the kdump capture kernel memory
>> -		       map itself (via elfcorehdr), or '0' if userspace must update
>> -		       the kdump capture kernel memory map.
>> +		       map itself (via elfcorehdr and other relevant kexec
>> +		       segments), or '0' if userspace must update the kdump
>> +		       capture kernel memory map.
>>   
>>   		       Availability depends on the CONFIG_MEMORY_HOTPLUG kernel
>>   		       configuration option.
>> diff --git a/Documentation/core-api/cpu_hotplug.rst b/Documentation/core-api/cpu_hotplug.rst
>> index dcb0e379e5e8..a21dbf261be7 100644
>> --- a/Documentation/core-api/cpu_hotplug.rst
>> +++ b/Documentation/core-api/cpu_hotplug.rst
>> @@ -737,8 +737,9 @@ can process the event further.
>>   
>>   When changes to the CPUs in the system occur, the sysfs file
>>   /sys/devices/system/cpu/crash_hotplug contains '1' if the kernel
>> -updates the kdump capture kernel list of CPUs itself (via elfcorehdr),
>> -or '0' if userspace must update the kdump capture kernel list of CPUs.
>> +updates the kdump capture kernel list of CPUs itself (via elfcorehdr and
>> +other relevant kexec segment), or '0' if userspace must update the kdump
>> +capture kernel list of CPUs.
>>   
>>   The availability depends on the CONFIG_HOTPLUG_CPU kernel configuration
>>   option.
>> @@ -750,8 +751,9 @@ file can be used in a udev rule as follows:
>>    SUBSYSTEM=="cpu", ATTRS{crash_hotplug}=="1", GOTO="kdump_reload_end"
>>   
>>   For a CPU hot un/plug event, if the architecture supports kernel updates
>> -of the elfcorehdr (which contains the list of CPUs), then the rule skips
>> -the unload-then-reload of the kdump capture kernel.
>> +of the elfcorehdr (which contains the list of CPUs) and other relevant
>> +kexec segments, then the rule skips the unload-then-reload of the kdump
>> +capture kernel.
>>   
>>   Kernel Inline Documentations Reference
>>   ======================================
>> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
>> index 63cf89393c6e..64dad01e260b 100644
>> --- a/kernel/crash_core.c
>> +++ b/kernel/crash_core.c
>> @@ -520,18 +520,25 @@ int crash_check_hotplug_support(void)
>>   }
>>   
>>   /*
>> - * To accurately reflect hot un/plug changes of cpu and memory resources
>> - * (including onling and offlining of those resources), the elfcorehdr
>> - * (which is passed to the crash kernel via the elfcorehdr= parameter)
>> - * must be updated with the new list of CPUs and memories.
>> + * To accurately reflect hot un/plug changes of CPU and Memory resources
>> + * (including onling and offlining of those resources), the relevant
>> + * kexec segments must be updated with latest CPU and Memory resources.
>>    *
>> - * In order to make changes to elfcorehdr, two conditions are needed:
>> - * First, the segment containing the elfcorehdr must be large enough
>> - * to permit a growing number of resources; the elfcorehdr memory size
>> - * is based on NR_CPUS_DEFAULT and CRASH_MAX_MEMORY_RANGES.
>> - * Second, purgatory must explicitly exclude the elfcorehdr from the
>> - * list of segments it checks (since the elfcorehdr changes and thus
>> - * would require an update to purgatory itself to update the digest).
>> + * Architectures must ensure two things for all segments that need
>> + * updating during hotplug events:
>> + *
>> + * 1. Segments must be large enough to accommodate a growing number of
>> + *    resources.
>> + * 2. Exclude the segments from SHA verification.
>> + *
>> + * For example, on most architectures, the elfcorehdr (which is passed
>> + * to the crash kernel via the elfcorehdr= parameter) must include the
>> + * new list of CPUs and memory. To make changes to the elfcorehdr, it
>> + * should be large enough to permit a growing number of CPU and Memory
>> + * resources. One can estimate the elfcorehdr memory size based on
>> + * NR_CPUS_DEFAULT and CRASH_MAX_MEMORY_RANGES. The elfcorehdr is
>> + * excluded from SHA verification by default if the architecture
>> + * supports crash hotplug.
>>    */
>>   static void crash_handle_hotplug_event(unsigned int hp_action, unsigned int cpu, void *arg)
>>   {
>> -- 
>> 2.45.2
>>

