Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A976ED11F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Apr 2023 17:16:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q4pcv345zz3fSG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Apr 2023 01:16:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BVVrgjzk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q4pc148Qhz3bgr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Apr 2023 01:15:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BVVrgjzk;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4Q4pbx6S7yz4xFf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Apr 2023 01:15:41 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4Q4pbx6Nkbz4xFr; Tue, 25 Apr 2023 01:15:41 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BVVrgjzk;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4Q4pbx3jTnz4xFf
	for <linuxppc-dev@ozlabs.org>; Tue, 25 Apr 2023 01:15:41 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33OFEaYB027498;
	Mon, 24 Apr 2023 15:14:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=eGwH+czhQGpp4QXDxzkOcoLG8VMSqXayOyDMUdKN2yk=;
 b=BVVrgjzk8TGw0KlgkrcAo4faBUJgf46zdVjl10abeDR4/h8xQ40/WuOmWbJuqabILAL9
 jjUQf7Rqcn/NBwi9P4apkBb1/F7+Mezb4DD7m6WMFSOSNGWYMiGJQTEJYhKd/px5VoN6
 cu+0WT6wb2Ox9vyekZ2l+ZXCrZesGKZEX3LR/PLddfyTQEXprymaX2ijOyYRVBSge8ck
 VJa9wbt3I8DA0YsQa+SJifOo3g1bGVAnCQukfvMG6TUshCfbRHRsru33O3bg4VFfwxry
 gaziP+P+RE6AjJLvZXl9uvIWIohhTJixMyxW1boVavew5JaOHToSTU/uu182hVBAGqws LQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q47r7rc53-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Apr 2023 15:14:39 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33OF6fJ0032755;
	Mon, 24 Apr 2023 15:13:57 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q47r7rbbh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Apr 2023 15:13:57 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33ODx8d1031505;
	Mon, 24 Apr 2023 15:13:28 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3q4776s05b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Apr 2023 15:13:27 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 33OFDNl662718344
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 Apr 2023 15:13:23 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AE45E20043;
	Mon, 24 Apr 2023 15:13:23 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 08D5D20065;
	Mon, 24 Apr 2023 15:13:21 +0000 (GMT)
Received: from [9.43.100.55] (unknown [9.43.100.55])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 24 Apr 2023 15:13:20 +0000 (GMT)
Message-ID: <dfee1e13-01cb-e2f3-61cb-9f9c51f2a875@linux.ibm.com>
Date: Mon, 24 Apr 2023 20:43:19 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v10 0/5] PowerPC: In-kernel handling of CPU/Memory
 hotplug/online/offline events for kdump kernel
Content-Language: en-US
To: Eric DeVolder <eric.devolder@oracle.com>, linuxppc-dev@ozlabs.org,
        mpe@ellerman.id.au
References: <20230423105213.70795-1-sourabhjain@linux.ibm.com>
 <9713a2e4-ac13-425f-1954-fe16ff318916@oracle.com>
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <9713a2e4-ac13-425f-1954-fe16ff318916@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: CgvPg77QIYlpsaiIgXxPLo_51wXGnctt
X-Proofpoint-ORIG-GUID: MzmrLE2_p-V4ZZEhP6WjJTg682OIp1zR
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-24_09,2023-04-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 phishscore=0 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501
 mlxscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304240136
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
Cc: mahesh@linux.vnet.ibm.com, ldufour@linux.ibm.com, kexec@lists.infradead.org, hbathini@linux.ibm.com, bhe@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 24/04/23 19:35, Eric DeVolder wrote:
>
>
> On 4/23/23 05:52, Sourabh Jain wrote:
>> The Problem:
>> ============
>> Post CPU/Memory hot plug/unplug and online/offline events the kernel
>> holds stale information about the system. Dump collection with stale
>> kdump kernel might end up in dump capture failure or an inaccurate dump
>> collection.
>>
>> Existing solution:
>> ==================
>> The existing solution to keep the kdump kernel up-to-date by monitoring
>> CPU/Memory hotplug/online/offline events via udev rule and trigger a 
>> full
>> kdump kernel reload for every hotplug event.
>>
>> Shortcomings:
>> ------------------------------------------------
>> - Leaves a window where kernel crash might not lead to a successful dump
>>    collection.
>> - Reloading all kexec components for each hotplug is inefficient.
>> - udev rules are prone to races if hotplug events are frequent.
>>
>> More about issues with an existing solution is posted here:
>>   - https://lkml.org/lkml/2020/12/14/532
>>   - 
>> https://lists.ozlabs.org/pipermail/linuxppc-dev/2022-February/240254.html
>>
>> Proposed Solution:
>> ==================
>> Instead of reloading all kexec segments on CPU/Memory 
>> hotplug/online/offline
>> event, this patch series focuses on updating only the relevant kexec 
>> segment.
>> Once the kexec segments are loaded in the kernel reserved area then an
>> arch-specific hotplug handler will update the relevant kexec segment 
>> based on
>> hotplug event type.
>>
>> Series Dependencies
>> ====================
>> This patch series implements the crash hotplug handler on PowerPC. 
>> The generic
>> crash hotplug handler is introduced by 
>> https://lkml.org/lkml/2023/4/4/1136 patch
>> series.
>>
>> Git tree for testing:
>> =====================
>> The below git tree has this patch series applied on top of dependent 
>> patch
>> series.
>> https://github.com/sourabhjains/linux/tree/e21-s10
>>
>> To realise the feature the kdump udev rule must updated to avoid
>> reloading of kdump reload on CPU/Memory hotplug/online/offline events.
>>
>>    RHEL: /usr/lib/udev/rules.d/98-kexec.rules
>>
>>     -SUBSYSTEM=="cpu", ACTION=="online", GOTO="kdump_reload_cpu"
>>     -SUBSYSTEM=="memory", ACTION=="online", GOTO="kdump_reload_mem"
>>     -SUBSYSTEM=="memory", ACTION=="offline", GOTO="kdump_reload_mem"
>>     +SUBSYSTEM=="cpu", ATTRS{crash_hotplug}=="1", 
>> GOTO="kdump_reload_end"
>>     +SUBSYSTEM=="memory", ATTRS{crash_hotplug}=="1", 
>> GOTO="kdump_reload_end"
>>
>
> I didn't see in the patch series where you would have the equivalent 
> to the following (needed for the sysfs crash_hotplug entries):
>
> #ifdef CONFIG_HOTPLUG_CPU
> static inline int crash_hotplug_cpu_support(void) { return 1; }
> #define crash_hotplug_cpu_support crash_hotplug_cpu_support
> #endif
>
> #ifdef CONFIG_MEMORY_HOTPLUG
> static inline int crash_hotplug_memory_support(void) { return 1; }
> #define crash_hotplug_memory_support crash_hotplug_memory_support
> #endif

I missed the above diff in my testing environment. Thanks you for 
bringing it
to my attention. I will fix this next version.

- Sourabh Jain
