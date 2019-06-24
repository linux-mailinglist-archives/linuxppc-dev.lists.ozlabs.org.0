Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D4451958
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2019 19:11:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45XbRp3dPmzDqR5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2019 03:11:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=sachinp@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45XbPn2pwmzDqQZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2019 03:09:48 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5OH32h6116535
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jun 2019 13:09:45 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tb1p4b5ja-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jun 2019 13:09:45 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sachinp@linux.vnet.ibm.com>;
 Mon, 24 Jun 2019 18:09:43 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 24 Jun 2019 18:09:40 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5OH9d9G42402044
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Jun 2019 17:09:39 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ACDF24C044;
 Mon, 24 Jun 2019 17:09:39 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C9ACC4C040;
 Mon, 24 Jun 2019 17:09:37 +0000 (GMT)
Received: from [9.85.121.109] (unknown [9.85.121.109])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 24 Jun 2019 17:09:37 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [next][PowerPC] RCU stalls while booting linux-next on PowerVM
 LPAR
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
In-Reply-To: <83a31209-68cb-3e60-6b50-322154e6dcea@redhat.com>
Date: Mon, 24 Jun 2019 22:39:36 +0530
Content-Transfer-Encoding: quoted-printable
References: <0F3EAC10-0EA8-4097-99F2-BC42D92291FE@linux.vnet.ibm.com>
 <83a31209-68cb-3e60-6b50-322154e6dcea@redhat.com>
To: David Hildenbrand <david@redhat.com>
X-Mailer: Apple Mail (2.3445.104.11)
X-TM-AS-GCONF: 00
x-cbid: 19062417-0016-0000-0000-0000028BF2F8
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19062417-0017-0000-0000-000032E960A1
Message-Id: <0D14734F-0402-434E-936C-C9213ABA7CCC@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-24_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906240135
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 24-Jun-2019, at 8:12 PM, David Hildenbrand <david@redhat.com> =
wrote:
>=20
> On 24.06.19 16:09, Sachin Sant wrote:
>> Latest -next fails to boot on POWER9 PowerVM LPAR due to RCU stalls.
>>=20
>> This problem was introduced with next-20190620 (dc636f5d78).
>> next-20190619 was last good kernel.
>>=20
>> Reverting following commit allows the kernel to boot.
>> 2fd4aeea6b603 : mm/memory_hotplug: move and simplify =
walk_memory_blocks()
>>=20
>>=20
>> [    0.014409] Using shared cache scheduler topology
>> [    0.016302] devtmpfs: initialized
>> [    0.031022] clocksource: jiffies: mask: 0xffffffff max_cycles: =
0xffffffff, max_idle_ns: 19112604462750000 ns
>> [    0.031034] futex hash table entries: 16384 (order: 5, 2097152 =
bytes, linear)
>> [    0.031575] NET: Registered protocol family 16
>> [    0.031724] audit: initializing netlink subsys (disabled)
>> [    0.031796] audit: type=3D2000 audit(1561344029.030:1): =
state=3Dinitialized audit_enabled=3D0 res=3D1
>> [    0.032249] cpuidle: using governor menu
>> [    0.032403] pstore: Registered nvram as persistent store backend
>> [   60.061246] rcu: INFO: rcu_sched self-detected stall on CPU
>> [   60.061254] rcu: 	0-....: (5999 ticks this GP) =
idle=3D1ea/1/0x4000000000000002 softirq=3D5/5 fqs=3D2999=20
>> [   60.061261] 	(t=3D6000 jiffies g=3D-1187 q=3D0)
>> [   60.061265] NMI backtrace for cpu 0
>> [   60.061269] CPU: 0 PID: 1 Comm: swapper/0 Not tainted =
5.2.0-rc5-next-20190621-autotest-autotest #1
>> [   60.061275] Call Trace:
>> [   60.061280] [c0000018ee85f380] [c000000000b624ec] =
dump_stack+0xb0/0xf4 (unreliable)
>> [   60.061287] [c0000018ee85f3c0] [c000000000b6d464] =
nmi_cpu_backtrace+0x144/0x150
>> [   60.061293] [c0000018ee85f450] [c000000000b6d61c] =
nmi_trigger_cpumask_backtrace+0x1ac/0x1f0
>> [   60.061300] [c0000018ee85f4f0] [c0000000000692c8] =
arch_trigger_cpumask_backtrace+0x28/0x40
>> [   60.061306] [c0000018ee85f510] [c0000000001c5f90] =
rcu_dump_cpu_stacks+0x10c/0x16c
>> [   60.061313] [c0000018ee85f560] [c0000000001c4fe4] =
rcu_sched_clock_irq+0x744/0x990
>> [   60.061318] [c0000018ee85f630] [c0000000001d5b58] =
update_process_times+0x48/0x90
>> [   60.061325] [c0000018ee85f660] [c0000000001ea03c] =
tick_periodic+0x4c/0x120
>> [   60.061330] [c0000018ee85f690] [c0000000001ea150] =
tick_handle_periodic+0x40/0xe0
>> [   60.061336] [c0000018ee85f6d0] [c00000000002b5cc] =
timer_interrupt+0x10c/0x2e0
>> [   60.061342] [c0000018ee85f730] [c000000000009204] =
decrementer_common+0x134/0x140
>> [   60.061350] --- interrupt: 901 at replay_interrupt_return+0x0/0x4
>> [   60.061350]     LR =3D arch_local_irq_restore+0x84/0x90
>> [   60.061357] [c0000018ee85fa30] [c0000018ee85fbac] =
0xc0000018ee85fbac (unreliable)
>> [   60.061364] [c0000018ee85fa50] [c000000000b88300] =
_raw_spin_unlock_irqrestore+0x50/0x80
>> [   60.061369] [c0000018ee85fa70] [c000000000b69da4] =
klist_next+0xb4/0x150
>> [   60.061376] [c0000018ee85fac0] [c000000000766ea0] =
subsys_find_device_by_id+0xf0/0x1a0
>> [   60.061382] [c0000018ee85fb20] [c000000000797a94] =
walk_memory_blocks+0x84/0x100
>> [   60.061388] [c0000018ee85fb80] [c000000000795ea0] =
link_mem_sections+0x40/0x60
>> [   60.061395] [c0000018ee85fbb0] [c000000000f28c28] =
topology_init+0xa0/0x268
>> [   60.061400] [c0000018ee85fc10] [c000000000010448] =
do_one_initcall+0x68/0x2c0
>> [   60.061406] [c0000018ee85fce0] [c000000000f247dc] =
kernel_init_freeable+0x318/0x47c
>> [   60.061411] [c0000018ee85fdb0] [c0000000000107c4] =
kernel_init+0x24/0x150
>> [   60.061417] [c0000018ee85fe20] [c00000000000ba54] =
ret_from_kernel_thread+0x5c/0x68
>> [   88.016563] watchdog: BUG: soft lockup - CPU#0 stuck for 22s! =
[swapper/0:1]
>> [   88.016569] Modules linked in:
>>=20
>=20
> Hi, thanks! Please see
>=20
> https://lkml.org/lkml/2019/6/21/600
>=20
> and especially
>=20
> https://lkml.org/lkml/2019/6/21/908
>=20
> Does this fix your problem? The fix is on its way to next.

Yes, this patch fixes the problem for me.

Thanks
-Sachin

