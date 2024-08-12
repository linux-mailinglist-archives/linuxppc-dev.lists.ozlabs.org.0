Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A66194E63B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2024 07:46:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MlX+eeQb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wj3RQ0nWtz2yGQ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2024 15:46:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MlX+eeQb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wj3Qj1Z3tz2xX4
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Aug 2024 15:45:48 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47C3SPcM004225;
	Mon, 12 Aug 2024 05:45:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=pp1; bh=
	dk45BxEtrcNh/cVkwB3JSlqu9Bo25I7aCPMvBHhgY+4=; b=MlX+eeQbzdw/joO8
	WzDCt19bKaPxn0yDniLZWxJ5H2KEwxOTp6rJ8xfQ31MS7qv7nmEjsafFCNq5sqjp
	Yki7jnio1qm2seEkICBC3fvwTsiCXARGnS9WdXCJ70eJpPLkCDNYhTBWZtDWad2G
	x/RUCEYbrU6gXPBgNewCJyQNkTywIytaxsdPq0aZGxTzBvMblqysWILS+NlsywIj
	8p0zbDmX+jlI+osUREu3V9242beB0Jo1T3baRhXptu1qrxuc7zQqRWJbSERMkJwF
	P5UzCBE306f5SBQqhFWlbxwo1un6y4QPo/PkiuMmswYGWHVSafSyYnrmcpZULVDF
	z15AVw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40wy0rkvyk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Aug 2024 05:45:34 +0000 (GMT)
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 47C5jY5H030966;
	Mon, 12 Aug 2024 05:45:34 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40wy0rkvyh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Aug 2024 05:45:34 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 47C3UaQC029698;
	Mon, 12 Aug 2024 05:45:33 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 40xmrm4rpt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Aug 2024 05:45:33 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 47C5jTCO38732280
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Aug 2024 05:45:31 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CBB2820086;
	Mon, 12 Aug 2024 05:45:29 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 42A4E2008A;
	Mon, 12 Aug 2024 05:45:27 +0000 (GMT)
Received: from [9.43.69.208] (unknown [9.43.69.208])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 12 Aug 2024 05:45:26 +0000 (GMT)
Message-ID: <01d935c2-bdb9-4117-841c-3e90f3c3dade@linux.ibm.com>
Date: Mon, 12 Aug 2024 11:15:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Document/kexec: Generalize crash hotplug description
To: Petr Tesarik <ptesarik@suse.com>
References: <20240812041651.703156-1-sourabhjain@linux.ibm.com>
 <20240812074152.321febe5@mordecai.tesarici.cz>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <20240812074152.321febe5@mordecai.tesarici.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: mXkdh4Rh3UDIawpTg5ElUdF1Wa8NuH2C
X-Proofpoint-GUID: 8_Kxw9uN09fZzBi3SGBhExBZ-ZvTNpFc
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-11_25,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 malwarescore=0 spamscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 mlxscore=0 bulkscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408120033
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
Cc: bhe@redhat.com, =?UTF-8?B?UGV0ciBUZXNhxZnDrWs=?= <petr@tesarici.cz>, x86@kernel.org, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 12/08/24 11:11, Petr Tesarik wrote:
> On Mon, 12 Aug 2024 09:46:51 +0530
> Sourabh Jain <sourabhjain@linux.ibm.com> wrote:
>
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
> It's perfect now.
>
> Reviewed-by: Petr Tesarik <ptesarik@suse.com>


Thank you the review, Petr.

- Sourabh Jain


> Petr T
>
>> ---
>>
>> Changelog:
>>
>> Since v1: https://lore.kernel.org/all/20240805050829.297171-1-sourabhjain@linux.ibm.com/
>>    - Update crash_hotplug sysfs document as suggested by Petr T
>>    - Update an error message in crash_handle_hotplug_event and
>>      crash_check_hotplug_support function.
>>
>> ---
>>   .../ABI/testing/sysfs-devices-memory          |  6 ++--
>>   .../ABI/testing/sysfs-devices-system-cpu      |  6 ++--
>>   .../admin-guide/mm/memory-hotplug.rst         |  5 +--
>>   Documentation/core-api/cpu_hotplug.rst        | 10 +++---
>>   kernel/crash_core.c                           | 33 +++++++++++--------
>>   5 files changed, 35 insertions(+), 25 deletions(-)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-devices-memory b/Documentation/ABI/testing/sysfs-devices-memory
>> index a95e0f17c35a..cec65827e602 100644
>> --- a/Documentation/ABI/testing/sysfs-devices-memory
>> +++ b/Documentation/ABI/testing/sysfs-devices-memory
>> @@ -115,6 +115,6 @@ What:		/sys/devices/system/memory/crash_hotplug
>>   Date:		Aug 2023
>>   Contact:	Linux kernel mailing list <linux-kernel@vger.kernel.org>
>>   Description:
>> -		(RO) indicates whether or not the kernel directly supports
>> -		modifying the crash elfcorehdr for memory hot un/plug and/or
>> -		on/offline changes.
>> +		(RO) indicates whether or not the kernel updates relevant kexec
>> +		segments on memory hot un/plug and/or on/offline events, avoiding the
>> +		need to reload kdump kernel.
>> diff --git a/Documentation/ABI/testing/sysfs-devices-system-cpu b/Documentation/ABI/testing/sysfs-devices-system-cpu
>> index 325873385b71..1a31b7c71676 100644
>> --- a/Documentation/ABI/testing/sysfs-devices-system-cpu
>> +++ b/Documentation/ABI/testing/sysfs-devices-system-cpu
>> @@ -703,9 +703,9 @@ What:		/sys/devices/system/cpu/crash_hotplug
>>   Date:		Aug 2023
>>   Contact:	Linux kernel mailing list <linux-kernel@vger.kernel.org>
>>   Description:
>> -		(RO) indicates whether or not the kernel directly supports
>> -		modifying the crash elfcorehdr for CPU hot un/plug and/or
>> -		on/offline changes.
>> +		(RO) indicates whether or not the kernel updates relevant kexec
>> +		segments on memory hot un/plug and/or on/offline events, avoiding the
>> +		need to reload kdump kernel.
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
>> index 63cf89393c6e..c1048893f4b6 100644
>> --- a/kernel/crash_core.c
>> +++ b/kernel/crash_core.c
>> @@ -505,7 +505,7 @@ int crash_check_hotplug_support(void)
>>   	crash_hotplug_lock();
>>   	/* Obtain lock while reading crash information */
>>   	if (!kexec_trylock()) {
>> -		pr_info("kexec_trylock() failed, elfcorehdr may be inaccurate\n");
>> +		pr_info("kexec_trylock() failed, kdump image may be inaccurate\n");
>>   		crash_hotplug_unlock();
>>   		return 0;
>>   	}
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
>> @@ -540,7 +547,7 @@ static void crash_handle_hotplug_event(unsigned int hp_action, unsigned int cpu,
>>   	crash_hotplug_lock();
>>   	/* Obtain lock while changing crash information */
>>   	if (!kexec_trylock()) {
>> -		pr_info("kexec_trylock() failed, elfcorehdr may be inaccurate\n");
>> +		pr_info("kexec_trylock() failed, kdump image may be inaccurate\n");
>>   		crash_hotplug_unlock();
>>   		return;
>>   	}

