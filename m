Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AC585A96BF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2019 00:53:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Nzcz1c9bzDqxc
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2019 08:53:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46NzZv1XqHzDqm9
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2019 08:51:34 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x84MktTe035900; Wed, 4 Sep 2019 18:51:27 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2utmpbutyw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Sep 2019 18:51:27 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x84Mokbn044529;
 Wed, 4 Sep 2019 18:51:26 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2utmpbutyj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Sep 2019 18:51:26 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x84MpC6J013964;
 Wed, 4 Sep 2019 22:51:26 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma05wdc.us.ibm.com with ESMTP id 2utmc40rf8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Sep 2019 22:51:26 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x84MpPc558654982
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 4 Sep 2019 22:51:25 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2CF1C6E053;
 Wed,  4 Sep 2019 22:51:25 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 013606E054;
 Wed,  4 Sep 2019 22:51:24 +0000 (GMT)
Received: from localhost (unknown [9.41.101.192])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  4 Sep 2019 22:51:24 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: missing doorbell interrupt when onlining cpu
Date: Wed, 04 Sep 2019 17:51:19 -0500
Message-ID: <87zhjjr7yw.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-04_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=817 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909040220
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
Cc: Gautham R Shenoy <ego.lkml@gmail.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I'm hoping for some help investigating a behavior I see when doing cpu
hotplug under load on P9 and P8 LPARs. Occasionally, while coming online
a cpu will seem to get "stuck" in idle, with a pending doorbell
interrupt unserviced (cpu 12 here):

cpuhp/12-70    [012] 46133.602202: cpuhp_enter:          cpu: 0012 target: 205 step: 174 (0xc000000000028920s)
 load.sh-8201  [014] 46133.602248: sched_waking:         comm=cpuhp/12 pid=70 prio=120 target_cpu=012
 load.sh-8201  [014] 46133.602251: smp_send_reschedule:  (c000000000052868) cpu=12
  <idle>-0     [012] 46133.602252: do_idle:              (c000000000162e08)
 load.sh-8201  [014] 46133.602252: smp_muxed_ipi_message_pass: (c0000000000527e8) cpu=12 msg=1
 load.sh-8201  [014] 46133.602253: doorbell_core_ipi:    (c00000000004d3e8) cpu=12
  <idle>-0     [012] 46133.602257: arch_cpu_idle:        (c000000000022d08)
  <idle>-0     [012] 46133.602259: pseries_lpar_idle:    (c0000000000d43c8)

This leaves the task initiating the online blocked in a state like this:

[<0>] __switch_to+0x2dc/0x430
[<0>] __cpuhp_kick_ap+0x78/0xa0
[<0>] cpuhp_kick_ap+0x60/0xf0
[<0>] cpuhp_invoke_callback+0xf4/0x780
[<0>] _cpu_up+0x138/0x260
[<0>] do_cpu_up+0x130/0x160
[<0>] cpu_subsys_online+0x68/0xe0
[<0>] device_online+0xb4/0x120
[<0>] online_store+0xb4/0xc0
[<0>] dev_attr_store+0x3c/0x60
[<0>] sysfs_kf_write+0x70/0xb0
[<0>] kernfs_fop_write+0x17c/0x250
[<0>] __vfs_write+0x40/0x80
[<0>] vfs_write+0xd4/0x250
[<0>] ksys_write+0x74/0x130
[<0>] system_call+0x5c/0x70

This trace is from a 5.2.10 kernel, and I've observed the problem on a
4.12 vendor kernel as well.

The issue always occurs before the cpu has completed all the cpuhp
callbacks that need to run on that cpu. Often it occurs before it even
runs a task (rcu_sched, migration, or cpuhp kthreads are the first to
run). But sometimes it will have run a task or two, as in this case.

It seems specific to doorbell i.e. intra-core IPIs; I have not observed
IPIs between cores getting dropped.

sysrq-l gets the newly onlined cpu unstuck.

The cpu can get in this state even after servicing doorbells earlier in
the online process.

This is using the default cede offline state, not stop-self (which I
haven't tried).

Ideas?
