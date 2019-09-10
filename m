Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F0000AF31D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 01:06:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46SgdV2MBDzF1nd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 09:06:38 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Sgbh533pzDscf
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2019 09:05:04 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8AMvS7c062416; Tue, 10 Sep 2019 19:04:56 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2uxhk7ef43-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Sep 2019 19:04:56 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x8AN05p4067576;
 Tue, 10 Sep 2019 19:04:55 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2uxhk7ef3s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Sep 2019 19:04:55 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8AN4XTZ025006;
 Tue, 10 Sep 2019 23:04:55 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma01dal.us.ibm.com with ESMTP id 2uv46765uj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Sep 2019 23:04:54 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8AN4s2r51249414
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Sep 2019 23:04:54 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1FF24112063;
 Tue, 10 Sep 2019 23:04:54 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0EC80112062;
 Tue, 10 Sep 2019 23:04:54 +0000 (GMT)
Received: from localhost (unknown [9.41.101.192])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 10 Sep 2019 23:04:53 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: Re: missing doorbell interrupt when onlining cpu
In-Reply-To: <87woenr6p5.fsf@linux.ibm.com>
References: <87zhjjr7yw.fsf@linux.ibm.com> <87woenr6p5.fsf@linux.ibm.com>
Date: Tue, 10 Sep 2019 18:04:53 -0500
Message-ID: <87o8zrrbvu.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-10_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=626 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909100214
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

Nathan Lynch <nathanl@linux.ibm.com> writes:

> Nathan Lynch <nathanl@linux.ibm.com> writes:
>
>> I'm hoping for some help investigating a behavior I see when doing cpu
>> hotplug under load on P9 and P8 LPARs. Occasionally, while coming online
>> a cpu will seem to get "stuck" in idle, with a pending doorbell
>> interrupt unserviced (cpu 12 here):
>>
>> cpuhp/12-70    [012] 46133.602202: cpuhp_enter:          cpu: 0012 target: 205 step: 174 (0xc000000000028920s)
>>  load.sh-8201  [014] 46133.602248: sched_waking:         comm=cpuhp/12 pid=70 prio=120 target_cpu=012
>>  load.sh-8201  [014] 46133.602251: smp_send_reschedule:  (c000000000052868) cpu=12
>>   <idle>-0     [012] 46133.602252: do_idle:              (c000000000162e08)
>>  load.sh-8201  [014] 46133.602252: smp_muxed_ipi_message_pass: (c0000000000527e8) cpu=12 msg=1
>>  load.sh-8201  [014] 46133.602253: doorbell_core_ipi:    (c00000000004d3e8) cpu=12
>>   <idle>-0     [012] 46133.602257: arch_cpu_idle:        (c000000000022d08)
>>   <idle>-0     [012] 46133.602259: pseries_lpar_idle:    (c0000000000d43c8)
>
> I should be more explicit that given my tracing configuration I would
> expect to see doorbell events etc here e.g.
>
>          <idle>-0     [012] 46133.602086: doorbell_entry:       pt_regs=0xc000000200e7fb50
>          <idle>-0     [012] 46133.602087: smp_ipi_demux_relaxed: (c0000000000530f8)
>          <idle>-0     [012] 46133.602088: scheduler_ipi:        (c00000000015e4f8)
>          <idle>-0     [012] 46133.602091: sched_wakeup:         cpuhp/12:70 [120] success=1 CPU:012
>          <idle>-0     [012] 46133.602092: sched_wakeup:         migration/12:71 [0] success=1 CPU:012
>          <idle>-0     [012] 46133.602093: doorbell_exit:        pt_regs=0xc000000200e7fb50
>
> but instead cpu 12 goes to idle.

Another clue is that I've occasionaly provoked this warning:

WARNING: CPU: 7 PID: 9045 at arch/powerpc/kernel/irq.c:282 arch_local_irq_restore+0xdc/0x150
Modules linked in:
CPU: 7 PID: 9045 Comm: offliner Not tainted 5.3.0-rc2-00190-g9b123d1ea237-dirty #45
NIP:  c00000000001d91c LR: c000000001988210 CTR: 0000000000334ee8
REGS: c00000000e19f390 TRAP: 0700   Not tainted  (5.3.0-rc2-00190-g9b123d1ea237-dirty)
MSR:  800000010282b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE,TM[E]>  CR: 44444424  XER: 20040000
CFAR: c00000000001d884 IRQMASK: 0 
GPR00: c000000001988210 c00000000e19f620 c0000000032f6200 0000000000000000 
GPR04: c00000000e589f10 0000000000000006 c00000000e19f664 c00000000395f260 
GPR08: 000000000000003b 0000000000008000 0000000000000009 0000000000000000 
GPR12: 0000000000000001 c00000001eca7780 000000000000005c 00000100106c7de0 
GPR16: 0000000000000000 0000000000000000 00000000100c0a48 0000000000000001 
GPR20: 00000000100c5748 00000001fc710000 0000000000000078 c000000003345c78 
GPR24: c0000003ffd99a00 c000000003349de0 0000000000000000 c0000003fb086c10 
GPR28: 0000000000000000 000000000000000f c0000003fb086c10 0000000000000000 
NIP [c00000000001d91c] arch_local_irq_restore+0xdc/0x150
LR [c000000001988210] _raw_spin_unlock_irqrestore+0xa0/0xd0
Call Trace:
[c00000000e19f6a0] [c000000001988210] _raw_spin_unlock_irqrestore+0xa0/0xd0
[c00000000e19f6d0] [c0000000001be920] try_to_wake_up+0x330/0xf30
[c00000000e19f7a0] [c0000000001bf5b0] wake_up_q+0x70/0xc0
[c00000000e19f7e0] [c0000000002b5a08] cpu_stop_queue_work+0xc8/0x140
[c00000000e19f850] [c0000000002b5bac] queue_stop_cpus_work+0xdc/0x160
[c00000000e19f8b0] [c0000000002b5c98] __stop_cpus+0x68/0xc0
[c00000000e19f950] [c0000000002b65ec] stop_cpus+0x5c/0x90
[c00000000e19f9a0] [c0000000002b6924] stop_machine_cpuslocked+0x194/0x1f0
[c00000000e19fa10] [c00000000016c768] takedown_cpu+0x98/0x260
[c00000000e19fad0] [c00000000016cea4] cpuhp_invoke_callback+0x114/0xf40
[c00000000e19fb60] [c00000000017194c] _cpu_down+0x19c/0x320
[c00000000e19fbd0] [c00000000016ff58] do_cpu_down+0x68/0xb0
[c00000000e19fc10] [c000000000ccccd4] cpu_subsys_offline+0x24/0x40
[c00000000e19fc30] [c000000000cc2860] device_offline+0x100/0x140
[c00000000e19fc70] [c000000000cc2a00] online_store+0x70/0xf0
[c00000000e19fcb0] [c000000000cbcee8] dev_attr_store+0x38/0x60
[c00000000e19fcd0] [c00000000059c970] sysfs_kf_write+0x70/0xb0
[c00000000e19fd10] [c00000000059afa8] kernfs_fop_write+0xf8/0x280
[c00000000e19fd60] [c0000000004b436c] __vfs_write+0x3c/0x70
[c00000000e19fd80] [c0000000004b8700] vfs_write+0xd0/0x220
[c00000000e19fdd0] [c0000000004b8abc] ksys_write+0x7c/0x140
[c00000000e19fe20] [c00000000000bbd8] system_call+0x5c/0x68

i.e. in arch_local_irq_restore():
		/*
		 * We should already be hard disabled here. We had bugs
		 * where that wasn't the case so let's dbl check it and
		 * warn if we are wrong. Only do that when IRQ tracing
		 * is enabled as mfmsr() can be costly.
		 */
		if (WARN_ON_ONCE(mfmsr() & MSR_EE))
			__hard_irq_disable();

Anyway, I've proposed a fix:

https://patchwork.ozlabs.org/patch/1160572/
