Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 837F46B8914
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Mar 2023 04:39:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PbK5c2MGtz3cNM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Mar 2023 14:39:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EjNxRmn9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PbK4Z1lgsz3cBF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 14:38:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EjNxRmn9;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4PbK4X28ZBz4xDw
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 14:38:36 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4PbK4X2598z4xFL; Tue, 14 Mar 2023 14:38:36 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EjNxRmn9;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4PbK4W6804z4xDw
	for <linuxppc-dev@ozlabs.org>; Tue, 14 Mar 2023 14:38:35 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32E2kFcF001771;
	Tue, 14 Mar 2023 03:38:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=FcbiC4dTFuB4GN/274JM92cXLby8h3uZleY3j+53RNM=;
 b=EjNxRmn9secllLbdKGwhwfVSzVms0u6xRouQ7g6F9yUASUBB7zp+R3VsYVWLHCdfanvG
 WpJCUj+wQRPlGLpyR4dkbBgGIuNFHN7AUbYa8t5QvNxpBJ5J+wUlyFso5thNQ5yvcIQ0
 XW9QqljURvI+MQ5KmjV2McUgrvwaDafI7hHnBQNCtT9CAvzRW9gu9fd/zdJlS5EhuSmS
 22Q31MgA1s3BVxsj1GNh1ce6y1rmY8rel8EySKPyq/UmZrJn6BL6OcFKV72JpDNXPJqR
 yu8HByq4aeBrNktFBNKrLPz7R2Ou5l/iRlIMNDPaTdJjLv9QA1cvPFt6fT5xVtkannjp 5w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3padrgmkde-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Mar 2023 03:38:21 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32E3ZX4m023228;
	Tue, 14 Mar 2023 03:38:20 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3padrgmkd1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Mar 2023 03:38:20 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32DEv0sV030084;
	Tue, 14 Mar 2023 03:38:19 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3p8gwfc71a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Mar 2023 03:38:18 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32E3cBa057147854
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Mar 2023 03:38:11 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 782D82004B;
	Tue, 14 Mar 2023 03:38:11 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9BB3620040;
	Tue, 14 Mar 2023 03:38:09 +0000 (GMT)
Received: from [9.43.46.246] (unknown [9.43.46.246])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 14 Mar 2023 03:38:09 +0000 (GMT)
Message-ID: <5aa8fb1c-73a0-4cb2-daac-9e9f40289253@linux.ibm.com>
Date: Tue, 14 Mar 2023 09:08:08 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v9 0/6] PowerPC: in kernel handling of CPU hotplug events
 for crash kernel
Content-Language: en-US
To: Eric DeVolder <eric.devolder@oracle.com>, linuxppc-dev@ozlabs.org
References: <20230312181154.278900-1-sourabhjain@linux.ibm.com>
 <ccf3a98d-60b6-a7db-c218-84b4eff69c1b@oracle.com>
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <ccf3a98d-60b6-a7db-c218-84b4eff69c1b@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: v-AkdHlp4M4vU-lMhapOQm5NR5GchWh_
X-Proofpoint-GUID: ukwUPUnh7DdH0cZZf9Kg-HpXauTm8Ujf
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-13_13,2023-03-13_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 spamscore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 malwarescore=0 mlxscore=0
 bulkscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2303140030
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
Cc: bhe@redhat.com, mahesh@linux.vnet.ibm.com, kexec@lists.infradead.org, ldufour@linux.ibm.com, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Eric,

On 13/03/23 21:12, Eric DeVolder wrote:
>
>
> On 3/12/23 13:11, Sourabh Jain wrote:
>> The Problem:
>> ============
>> Post hotplug/DLPAR events the capture kernel holds stale information 
>> about the
>> system. Dump collection with stale capture kernel might end up in 
>> dump capture
>> failure or an inaccurate dump collection.
>>
>> Existing solution:
>> ==================
>> The existing solution to keep the capture kernel up-to-date by 
>> monitoring
>> hotplug event via udev rule and trigger a full capture kernel reload for
>> every hotplug event.
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
>> Instead of reloading all kexec segments on hotplug event, this patch 
>> series
>> focuses on updating only the relevant kexec segment. Once the kexec 
>> segments
>> are loaded in the kernel reserved area then an arch-specific hotplug 
>> handler
>> will update the relevant kexec segment based on hotplug event type.
>>
>> Series Dependecies
>> ==================
>> This patch series implements the crash hotplug handler on PowerPC. 
>> The generic
>> crash hotplug update is introduced by 
>> https://lkml.org/lkml/2023/3/6/1358 patch
>> series.
>>
>> Git tree for testing:
>> =====================
>> The below git tree has this patch series applied on top of dependent 
>> patch
>> series.
>> https://github.com/sourabhjains/linux/tree/in-kernel-crash-update-v9
>>
>> To realise the feature the kdump udev rules must be disabled for 
>> CPU/Memory
>> hotplug events. Comment out the below line in kdump udev rule file:
>>
>>    RHEL: /usr/lib/udev/rules.d/98-kexec.rules
>>
>>        #SUBSYSTEM=="cpu", ACTION=="online", GOTO="kdump_reload_cpu"
>>     #SUBSYSTEM=="memory", ACTION=="online", GOTO="kdump_reload_mem"
>>     #SUBSYSTEM=="memory", ACTION=="offline", GOTO="kdump_reload_mem"
>>
>>    SLES: /usr/lib/kdump/70-kdump.rules
>>
>>     #SUBSYSTEM=="memory", ACTION=="add|remove", GOTO="kdump_try_restart"
>>     #SUBSYSTEM=="cpu", ACTION=="online", GOTO="kdump_try_restart"
>>
>
> Sourabh,
>
> The above seems to contradict what I anticipate to be udev rules 
> changes once the base series is accepted. Specifically I'm suggesting 
> the following:
>
>  - Prevent udev from updating kdump crash kernel on hot un/plug changes.
>    Add the following as the first lines to the RHEL udev rule file
>    /usr/lib/udev/rules.d/98-kexec.rules:
>
>    # The kernel handles updates to crash elfcorehdr for cpu and memory 
> changes
>    SUBSYSTEM=="cpu", ATTRS{crash_hotplug}=="1", GOTO="kdump_reload_end"
>    SUBSYSTEM=="memory", ATTRS{crash_hotplug}=="1", 
> GOTO="kdump_reload_end"
>
>    With this changeset applied, the two rules evaluate to false for
>    cpu and memory change events and thus skip the userspace
>    unload-then-reload of kdump.
>
> The above additions allow distros to deploy the udev rule immediately 
> and work properly even if the base patchset isn't yet merged, or down 
> the road, enabled/configured.
>
> Am I missing something such that your recommendation is different than 
> mine? ]

It is just for the test I have been suggesting to disable the udev 
rules, but your udev rules changes is the way forward.

I will use the above changes to control kdump service reload.

>> Note: only kexec_file_load syscall will work. For kexec_load minor
>> changes are required in kexec tool.
>
> Will this be the same/similar change as I have posted, or do you 
> envision something different?

I think the generic changes will be same. I might need to add some 
PowerPC specific changes to
make sure elfcorehdr and FDT kexec segment should have additional buffer 
space to accommodate
additional memory ranges.

Thanks for the suggestion, I will align the PowerPC kexec tool changes 
with your changes.

- Souarbh

