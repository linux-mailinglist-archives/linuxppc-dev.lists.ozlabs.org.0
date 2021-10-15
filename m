Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF8042F991
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 19:03:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HWCK45kJrz3c7m
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Oct 2021 04:03:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tibOp4OT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=tibOp4OT; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HWCJG5zPSz2xZR
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Oct 2021 04:02:53 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19FGR14M032722; 
 Fri, 15 Oct 2021 13:02:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=18C4erjU7UUGWt5QSOAjmCQ0Y0h89ojuGV+9tq3Dkbk=;
 b=tibOp4OTe9RBqC2DY0B8DmLT1Sl5/1LNWwsRBe/KiCBz+9unAQ49yd7EjuD4kjUjKbuC
 psNWf5rUp6SIJUb1C/bg55xMNKauVNtfHrgFomb1jgzDkkDTBHW4v74WWMvP7UGy5q13
 sP4o98uek5PzsUsg42SHXKHVJUrMCPAJHsauq1RugBiu3Ui+jbBhRGEO724yfWEFE1zb
 afPWlcKMLOEpVNYgNsAixETkSa5tNX+9oSuFF3dbV62Bp+o3Qbqj6zz9xOF8PUV+bdM/
 ZRMNgEB/LNg+Lhs7Qsw8xMV1sArF9UZizhHm9cy8d7YHVNZbYRxq/29S8NswvYmlxnKb Bw== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bps2tu0da-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Oct 2021 13:02:36 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19FGRqEW004817;
 Fri, 15 Oct 2021 17:02:35 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma04wdc.us.ibm.com with ESMTP id 3bk2qcsskf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Oct 2021 17:02:35 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19FH2Ytx21823748
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Oct 2021 17:02:34 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 913187806B;
 Fri, 15 Oct 2021 17:02:34 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6B07078060;
 Fri, 15 Oct 2021 17:02:34 +0000 (GMT)
Received: from localhost (unknown [9.211.119.24])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 15 Oct 2021 17:02:34 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Valentin Schneider <valentin.schneider@arm.com>
Subject: Re: [PATCH] powerpc/smp: do not decrement idle task preempt count
 in CPU offline
In-Reply-To: <87h7dijo4m.mognet@arm.com>
References: <20211015145548.2269836-1-nathanl@linux.ibm.com>
 <87h7dijo4m.mognet@arm.com>
Date: Fri, 15 Oct 2021 12:02:33 -0500
Message-ID: <875ytyz0eu.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: vcIiWTEvWK6PJYl8UWPy_frqBrN4iigK
X-Proofpoint-ORIG-GUID: vcIiWTEvWK6PJYl8UWPy_frqBrN4iigK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-15_05,2021-10-14_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 phishscore=0 malwarescore=0 mlxlogscore=836 bulkscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110150104
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
Cc: srikar@linux.vnet.ibm.com, peterz@infradead.org,
 linux-kernel@vger.kernel.org, clg@kaod.org, linuxppc-dev@lists.ozlabs.org,
 mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Valentin Schneider <valentin.schneider@arm.com> writes:

> On 15/10/21 09:55, Nathan Lynch wrote:
>> With PREEMPT_COUNT=y, when a CPU is offlined and then onlined again, we
>> get:
>>
>> BUG: scheduling while atomic: swapper/1/0/0x00000000
>> no locks held by swapper/1/0.
>> CPU: 1 PID: 0 Comm: swapper/1 Not tainted 5.15.0-rc2+ #100
>> Call Trace:
>>  dump_stack_lvl+0xac/0x108
>>  __schedule_bug+0xac/0xe0
>>  __schedule+0xcf8/0x10d0
>>  schedule_idle+0x3c/0x70
>>  do_idle+0x2d8/0x4a0
>>  cpu_startup_entry+0x38/0x40
>>  start_secondary+0x2ec/0x3a0
>>  start_secondary_prolog+0x10/0x14
>>
>> This is because powerpc's arch_cpu_idle_dead() decrements the idle task's
>> preempt count, for reasons explained in commit a7c2bb8279d2 ("powerpc:
>> Re-enable preemption before cpu_die()"), specifically "start_secondary()
>> expects a preempt_count() of 0."
>>
>> However, since commit 2c669ef6979c ("powerpc/preempt: Don't touch the idle
>> task's preempt_count during hotplug") and commit f1a0a376ca0c ("sched/core:
>> Initialize the idle task with preemption disabled"), that justification no
>> longer holds.
>>
>> The idle task isn't supposed to re-enable preemption, so remove the
>> vestigial preempt_enable() from the CPU offline path.
>>
>
> Humph, I got confused because 2c669ef6979c explicitly mentions hotplug,
> but that's the hotplug machinery which is already involved for bringing up
> the secondaries at boot time.
>
> IIUC your issue here is the preempt_count being messed up when
> hot-unplugging a CPU, which leads to fireworks during hotplug

That's right.

> (IOW I didn't
> test my last patch against hotplug - my bad!)
>
> Reviewed-by: Valentin Schneider <valentin.schneider@arm.com>

No worries and thank you for reviewing.


>> Tested with pseries and powernv in qemu, and pseries on PowerVM.
>>
>> Fixes: 2c669ef6979c ("powerpc/preempt: Don't touch the idle task's preempt_count during hotplug")
>> Fixes: f1a0a376ca0c ("sched/core: Initialize the idle task with preemption disabled")
>
> I think only the first Fixes: is needed.

OK, I'll re-send with that changed as well as your r-b. Thanks.
