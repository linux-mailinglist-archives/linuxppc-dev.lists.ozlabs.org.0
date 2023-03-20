Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9490A6C0A80
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Mar 2023 07:21:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pg4PK3kF2z3cFw
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Mar 2023 17:21:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VJrkhrSQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aboorvad@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VJrkhrSQ;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pg4NP2ZGkz2yRV
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Mar 2023 17:20:20 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32K66KEg011266;
	Mon, 20 Mar 2023 06:19:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=vhRJkP6zSvUOBRvgshunZ4mm1ErAQqPPHd+78vJ8+gw=;
 b=VJrkhrSQvZkTiKCIPOnNf9eDcFtcVIboiEj6Hsh4FL7fHXj8sg/aYvf7xAC5QlXmpM2g
 eWQDLzjEGV0/Kwf8bb1MXnMZLECMN5I+B29jndJ1Eoc3teNL+347c9e2p01EqucDwCQV
 EgljBvdrV6582HaqBRcibN/qxFOIIhg9yk0P9Tcb22K/r6O9j6d/FFvyQpUMXYFxaLar
 Y3f8c5srsZykT9vyv7BwcBV6LamnmWbnEnmgG9FYSvFrOpLiJ+kRiiMC30VTfprNbf5I
 u3EZqfourh1/EJ4mnJTHJjGrPuFy+R1+WqFEbeuBfhm88We+3n0tkVn4YAee+6JQ4bzx zw== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pdq6kq8gk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Mar 2023 06:19:57 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
	by ppma03wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32K3ZDji019556;
	Mon, 20 Mar 2023 06:19:56 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([9.208.129.114])
	by ppma03wdc.us.ibm.com (PPS) with ESMTPS id 3pd4x6k607-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Mar 2023 06:19:56 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32K6Jtth31195874
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 20 Mar 2023 06:19:55 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2C53858055;
	Mon, 20 Mar 2023 06:19:55 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 79B6158043;
	Mon, 20 Mar 2023 06:19:52 +0000 (GMT)
Received: from li-34d1fccc-27cd-11b2-a85c-c167793e56f7.ibm.com (unknown [9.204.200.131])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 20 Mar 2023 06:19:52 +0000 (GMT)
Message-ID: <5f2ab8a44d685701fe36cdaa8042a1aef215d10d.camel@linux.vnet.ibm.com>
Subject: CPU Hotplug optimization: offcputime analysis
From: Aboorva Devarajan <aboorvad@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, paulmck@kernel.org,
        peterz@infradead.org, daniel.lezcano@linaro.org,
        nicolas.pitre@linaro.org
Date: Mon, 20 Mar 2023 11:49:51 +0530
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: R2KBh79dy-zP_FHKwSMrP28Z_Q3ycgwP
X-Proofpoint-ORIG-GUID: R2KBh79dy-zP_FHKwSMrP28Z_Q3ycgwP
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-20_03,2023-03-16_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxscore=0 clxscore=1011 bulkscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 mlxlogscore=999 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303200053
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
Cc: srikar@linux.vnet.ibm.com, linux-pm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

CPU Hotplug smt=off operation on a maximum configuration ppc64le system
with 1920 logical CPUs takes more than 59 minutes to complete.

Several attempts made to reduce the time consumption of CPU hotplug
operation is discussed in this thread below:
https://lore.kernel.org/all/Y01UWQL2y2r69sBX@li-05afa54c-330e-11b2-a85c-e3f3aa0db1e9.ibm.com/

By applying the solution discussed in the above thread, time taken for
CPU hotplug smt=off operation is brought down from 59m to 32m resulting
in a performance improvement of around 45%.

Though a significant performance improvement is achieved, still 32m for
CPU hotplug (smt=off) operation is a large number. To bring it down further,
we analysed the blocking time overhead in CPU hotplug using the offcputime
bcc script. The script outputs the stack-traces of the tasks that were
blocked and the total duration for which the tasks were blocked, to
identify the areas of improvement.

offcputime bcc script:
https://github.com/iovisor/bcc/blob/master/tools/offcputime.py

Below is one of the call-stacks that accounted for most of the blocking
time overhead as reported by offcputime bcc script for CPU offline
operation,

    finish_task_switch
    __schedule
    schedule
    schedule_timeout
    wait_for_completion
    __wait_rcu_gp
    synchronize_rcu
    cpuidle_uninstall_idle_handler
    powernv_cpuidle_cpu_dead
    cpuhp_invoke_callback
    __cpuhp_invoke_callback_range
    _cpu_down
    cpu_device_down
    cpu_subsys_offline
    device_offline
    online_store
    dev_attr_store
    sysfs_kf_write
    kernfs_fop_write_iter
    vfs_write
    ksys_write
    system_call_exception
    system_call_common
   -                bash (29705)
        5771569  ------------------------>  Duration (us)

From the above call-stack, it is observed that in
cpuidle_uninstall_idle_handler, synchronize_rcu is accounting for major
chunk of the overhead seen in CPU online and offline operations. This
stack-trace is observed in pseries and powernv systems but not in ACPI
based systems where we don't invoke cpuidle_disable_device during CPU
hotplug offline operation.

Patch that introduces synchronize_rcu in cpuidle_uninstall_idle_handler
442bf3aaf55a ("sched: Let the scheduler see CPU idle states")
is reverted to check for the accounted overhead.

On a machine having 128 logical CPUs with the below configuration,

root@ltc:~# lscpu
Architecture:        ppc64le
Byte Order:          Little Endian
CPU(s):              128
On-line CPU(s) list: 0-127
Thread(s) per core:  4
Core(s) per socket:  16
Socket(s):           2
NUMA node(s):        8
Model:               2.3 (pvr 004e 1203)
Model name:          POWER9, altivec supported
CPU max MHz:         3800.0000
CPU min MHz:         2300.0000
L1d cache:           32K
L1i cache:           32K
L2 cache:            512K
L3 cache:            10240K
NUMA node0 CPU(s):   0-63
NUMA node8 CPU(s):   64-127
NUMA node250 CPU(s):
NUMA node251 CPU(s):
NUMA node252 CPU(s):
NUMA node253 CPU(s):
NUMA node254 CPU(s):
NUMA node255 CPU(s):

The tabulation below lists the total time taken for the CPU hotplug
offline and online operation in 4 different scenarios:

|-------------------------------------------------------------------------|
| Time take to offline 127 CPUs (niters : 10)                             |
|--------------------------------------------------|---------|------------|
| kernel version                                   | avg (s) | % decrease |
|--------------------------------------------------|---------|------------|
| (1) v6.2.0-rc5                                   | 17.945  | baseline   |
| (2) revert 442bf3aaf55a (remove synchronize_rcu) | 10.259  | 42.831     |
| (3) replace synchronize_rcu with                 |         |            |
|     synchronize_rcu_expedited                    | 10.129  | 43.554     |
|     in cpuidle_uninstall_idle_handler  	   |         |            |
| (4) enable system-wide rcu_expedited             | 0.842   | 95.304     |
|--------------------------------------------------|---------|------------|

|-------------------------------------------------------------------------|
| Time take to online 127 CPUs (niters : 10)                              |
|-------------------------------------------------------------------------|
| kernel version                                   | avg (s) | % decrease |
|--------------------------------------------------|---------|------------|
| (1) v6.2.0-rc5                                   | 16.474  | baseline   |
| (2) revert 442bf3aaf55a (remove synchronize_rcu) | 12.503  | 24.104     |
| (3) replace synchronize_rcu with                 |         |            |
|     synchronize_rcu_expedited                    | 12.817  | 22.197     |
|     in cpuidle_uninstall_idle_handler            |         |            |
| (4) enable system-wide rcu_expedited             | 0.4983  | 96.975     |
|--------------------------------------------------|---------|------------|

Note: A performance improvement of around 16% for CPU offline operation is
observed on large configuration systems with nCPUs = 1600 as well by
avoiding `synchronize_rcu` in `cpuidle_uninstall_idle_handler`.

It is observed from the above tabulations that synchronize_rcu introduced
in 442bf3aaf55a ("sched: Let the scheduler see CPU idle states") accounts
for around 40% and 24% of the total time taken by the CPU hotplug offline
and online operation respectively, it will be really helpful to get any
guidance from the community on suggestions for optimization here.

Thanks,
Aboorva

