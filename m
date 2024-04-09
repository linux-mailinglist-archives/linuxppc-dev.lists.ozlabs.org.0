Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0BD89D34E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Apr 2024 09:36:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Pb7dKC6c;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VDHp4215Kz3vXP
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Apr 2024 17:36:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Pb7dKC6c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=huschle@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VDHnK3YSYz30f8
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Apr 2024 17:35:49 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 4397NwIo016110;
	Tue, 9 Apr 2024 07:35:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=2+7diTVZ3rSZnpTn6NllEJkVpD9Qyx7pIep06/Paocs=;
 b=Pb7dKC6cjvTuGecDxZjCa6+Sqew6tlPvZhqgTqtYSZ2ZU+gNUyhRzM1jaQYXpy2OeTAX
 sS9MPaMM2RRdwlar0zG9wVoVthpT9w7eS52LlxBfmW/nfy0WltbVsKIFSxSeZdVDtcNY
 57/W+zqQluUKsNbh1uM6aZvUi6Qr20GgbMHJohIs2PdgVf1VOcEW+aYTrgoiEPBP+XpN
 Wai4pijI7d0bMqqTXu0gFwYuxQUzZRncwTRXKgZTvglD2nQiQX4ksw1gbnCkrSlFjNdL
 mmPb9WdXRjSOBv3+y2gQzOMRS00Ddp320vsxWT4oUr4aG+x032sCoKPN8hfKel2E4tON GQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xd0ty82jn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Apr 2024 07:35:35 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4397ZY3L002336;
	Tue, 9 Apr 2024 07:35:34 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xd0ty82jj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Apr 2024 07:35:34 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 4394eaLl019082;
	Tue, 9 Apr 2024 07:35:33 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3xbh405188-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Apr 2024 07:35:33 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4397ZTFq50266544
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 9 Apr 2024 07:35:31 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B887820040;
	Tue,  9 Apr 2024 07:35:29 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 72E072004B;
	Tue,  9 Apr 2024 07:35:29 +0000 (GMT)
Received: from DESKTOP-2CCOB1S. (unknown [9.171.210.49])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue,  9 Apr 2024 07:35:29 +0000 (GMT)
Date: Tue, 9 Apr 2024 09:35:27 +0200
From: Tobias Huschle <huschle@linux.ibm.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
Subject: Re: [RFC] sched/eevdf: sched feature to dismiss lag on wakeup
Message-ID: <ZhTvvz9oq7qhLJRs@DESKTOP-2CCOB1S.>
References: <20240228161018.14253-1-huschle@linux.ibm.com>
 <5a32e8e1-67cf-4296-a655-f0fc35dc880a@arm.com>
 <ZfL/hROYxQudcTuX@DESKTOP-2CCOB1S.>
 <66c4286e-deaf-44a0-be62-0928529ae73f@arm.com>
 <4b25ab45b762e64b9df09d4d12d8289f@linux.ibm.com>
 <CAKfTPtDyrsnq-CSFo+upzdOJpuH=JkRzSALad-OL29OvqkK2dg@mail.gmail.com>
 <65fa8a7c.050a0220.c8ec5.0278SMTPIN_ADDED_BROKEN@mx.google.com>
 <CAKfTPtBA7ECeYJYdzL9ybeXLbpEudLfB6V9s+DZiJUmpnPf_kQ@mail.gmail.com>
 <65fc25ae.810a0220.f705f.4cdbSMTPIN_ADDED_BROKEN@mx.google.com>
 <CAKfTPtCv37JA+5D6WQbgsjeY7-Vx4tD+6PFDH+wc8TtPE58T9A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKfTPtCv37JA+5D6WQbgsjeY7-Vx4tD+6PFDH+wc8TtPE58T9A@mail.gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: fRbtPw482L_B4nDgFsZ88BlC8FJn39pH
X-Proofpoint-GUID: 7obpUKdEzUtebrDf-jRoQWSL32CwjP1A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-09_04,2024-04-05_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0
 mlxscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2404010000
 definitions=main-2404090046
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
Cc: juri.lelli@redhat.com, vschneid@redhat.com, srikar@linux.vnet.ibm.com, Luis Machado <luis.machado@arm.com>, peterz@infradead.org, sshegde@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, rostedt@goodmis.org, bsegall@google.com, mingo@redhat.com, mgorman@suse.de, nd <nd@arm.com>, bristot@redhat.com, dietmar.eggemann@arm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 22, 2024 at 06:02:05PM +0100, Vincent Guittot wrote:
> and then
>     se->vruntime = max_vruntime(se->vruntime, vruntime)
> 

First things first, I was wrong to assume a "boost" in the CFS code. So I
dug a bit deeper and tried to pinpoint what the difference between CFS and
EEVDF actually is. I found the following:

Let's assume we have two tasks taking turns on a single CPU.
Task 1 is always runnable.
Task 2 gets woken up by task 1 and goes back to sleep when it is done.
This means, task 1 runs, wakes up task 2, task 2 runs, goes to sleep and
task 1 runs again and we repeat.
Most of the time: runtime(task1) > runtime(task2)
Rare occasions:   runtime(task1) < runtime(task2)
So, task 1 usually consumes more of its designated time slices until it gets
rescheduled by the wakeup of task2 than task 2 does. But both never consume
their full time slice. Rather the opposite, both run for low 5-digit ns or
less.

So something like this:

task 1    |----------|    |---------|    |------...
task 2               |----|         |----|

This creates different behaviors under CFS and EEVDF:

### CFS ####################################

In CFS the difference in runtimes means that task 2 cannot catch up with 
task 1 vruntime-wise

With every exchange between task 1 and task 2, task 2 falls back more on
vruntime. Once a difference in the magnitude of sysctl_sched_latency is 
established, the difference remains stable due to the max handling in 
place_entity.

Occasionally, task 2 may run longer than task 1. In those cases, it
will catch up slightly. But in the majority of cases, task 2 runs
shorter, thereby increasing the difference in vruntime.

This would explain why task 2 gets always scheduled immediately on wakeup.

### EEVDF ##################################

The rare occasions where task 2 runs longer than task 1 seem to cause 
issues with EEVDF:

In the regular case where task 1 runs longer than task 2. Task 2 gets 
a positive lag and is selected on wake up --> good.
In the irregular case where task 2 runs longer than task 1 task 2 
now gets a negative lag and is no longer chosen on wakeup --> bad (in some cases).

This would explain why task 2 gets not selected on wake up occasionally. 

### Summary ################################

So my wording, that a woken up task gets "boosted" was obviously wrong. 
Task 2 is not getting boosted in CFS, it gets "outrun" by task 1, with 
no chance of catching up. Leaving it with a smaller vruntime value.

EEVDF on the other hand, does not allow lag to accumulate if an entity, like 
task 2 in this case, regularly dequeues itself. So it will always have 
a lag with an upper boundary of whatever difference it encountered in 
comparison to the runtime with task 1.

The patch below, allows tasks to accumulate lag over time. This fixes the
original regression, that made me stumble into this topic. But, this might 
of course come with arbitrary side effects.

I'm not suggesting to actually implement this, but would like to confirm 
whether my understanding is correct that this is the aspect where CFS and 
EEVDF differ, where CFS is more aware of the past in this particular case
than EEVDF is.

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 03be0d1330a6..b83a72311d2a 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -701,7 +701,7 @@ static void update_entity_lag(struct cfs_rq *cfs_rq, struct sched_entity *se)
        s64 lag, limit;
 
        SCHED_WARN_ON(!se->on_rq);
-       lag = avg_vruntime(cfs_rq) - se->vruntime;
+       lag = se->vlag + avg_vruntime(cfs_rq) - se->vruntime;
 
        limit = calc_delta_fair(max_t(u64, 2*se->slice, TICK_NSEC), se);
        se->vlag = clamp(lag, -limit, limit);
