Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EA4AAF14
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2019 01:23:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46PcFC4KVhzDr3B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2019 09:23:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=mdroth@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46PcC64wlXzDr39
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2019 09:21:38 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x85NHRii056844; Thu, 5 Sep 2019 19:21:32 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2uu91rx02c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Sep 2019 19:21:31 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x85NHcKJ057455;
 Thu, 5 Sep 2019 19:21:31 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2uu91rx01y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Sep 2019 19:21:31 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x85NKJPN017175;
 Thu, 5 Sep 2019 23:21:30 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma03dal.us.ibm.com with ESMTP id 2uqgh7pkyr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Sep 2019 23:21:30 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x85NLTOQ27918596
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Sep 2019 23:21:29 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6E85C124053;
 Thu,  5 Sep 2019 23:21:29 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3058E124052;
 Thu,  5 Sep 2019 23:21:29 +0000 (GMT)
Received: from localhost (unknown [9.53.179.213])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  5 Sep 2019 23:21:29 +0000 (GMT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
From: Michael Roth <mdroth@linux.vnet.ibm.com>
In-Reply-To: <87pnkfphnz.fsf@mpe.ellerman.id.au>
References: <20190904222837.25798-1-mdroth@linux.vnet.ibm.com>
 <87pnkfphnz.fsf@mpe.ellerman.id.au>
Message-ID: <156772568231.16169.9825098672263419233@sif>
User-Agent: alot/0.7
Subject: Re: [PATCH] KVM: PPC: Book3S HV: add smp_mb() in kvmppc_set_host_ipi()
Date: Thu, 05 Sep 2019 18:21:22 -0500
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-05_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909050216
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
Cc: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Quoting Michael Ellerman (2019-09-04 22:04:48)
> Hi Mike,
> =

> Thanks for the patch & great change log, just a few comments.

Hi Michael,

Thank you for the suggestions. I will roll them into v2 unless otherwise
noted below.

> =

> Michael Roth <mdroth@linux.vnet.ibm.com> writes:
> > On a 2-socket Witherspoon system with 128 cores and 1TB of memory
>                            ^
>                            Power9 (not everyone knows what a Witherspoon =
is)
> =

> > running the following guest configs:
> >
> >   guest A:
> >     - 224GB of memory
> >     - 56 VCPUs (sockets=3D1,cores=3D28,threads=3D2), where:
> >       VCPUs 0-1 are pinned to CPUs 0-3,
> >       VCPUs 2-3 are pinned to CPUs 4-7,
> >       ...
> >       VCPUs 54-55 are pinned to CPUs 108-111
> >
> >   guest B:
> >     - 4GB of memory
> >     - 4 VCPUs (sockets=3D1,cores=3D4,threads=3D1)
> >
> > with the following workloads (with KSM and THP enabled in all):
> >
> >   guest A:
> >     stress --cpu 40 --io 20 --vm 20 --vm-bytes 512M
> >
> >   guest B:
> >     stress --cpu 4 --io 4 --vm 4 --vm-bytes 512M
> >
> >   host:
> >     stress --cpu 4 --io 4 --vm 2 --vm-bytes 256M
> >
> > the below soft-lockup traces were observed after an hour or so and
> > persisted until the host was reset (this was found to be reliably
> > reproducible for this configuration, for kernels 4.15, 4.18, 5.0,
> > and 5.3-rc5):
> >
> >   [ 1253.183290] rcu: INFO: rcu_sched self-detected stall on CPU
> >   [ 1253.183319] rcu:     124-....: (5250 ticks this GP) idle=3D10a/1/0=
x4000000000000002 softirq=3D5408/5408 fqs=3D1941
> >   [ 1256.287426] watchdog: BUG: soft lockup - CPU#105 stuck for 23s! [C=
PU 52/KVM:19709]
> >   [ 1264.075773] watchdog: BUG: soft lockup - CPU#24 stuck for 23s! [wo=
rker:19913]
> >   [ 1264.079769] watchdog: BUG: soft lockup - CPU#31 stuck for 23s! [wo=
rker:20331]
> >   [ 1264.095770] watchdog: BUG: soft lockup - CPU#45 stuck for 23s! [wo=
rker:20338]
> >   [ 1264.131773] watchdog: BUG: soft lockup - CPU#64 stuck for 23s! [av=
ocado:19525]
> >   [ 1280.408480] watchdog: BUG: soft lockup - CPU#124 stuck for 22s! [k=
smd:791]
> >   [ 1316.198012] rcu: INFO: rcu_sched self-detected stall on CPU
> >   [ 1316.198032] rcu:     124-....: (21003 ticks this GP) idle=3D10a/1/=
0x4000000000000002 softirq=3D5408/5408 fqs=3D8243
> >   [ 1340.411024] watchdog: BUG: soft lockup - CPU#124 stuck for 22s! [k=
smd:791]
> >   [ 1379.212609] rcu: INFO: rcu_sched self-detected stall on CPU
> >   [ 1379.212629] rcu:     124-....: (36756 ticks this GP) idle=3D10a/1/=
0x4000000000000002 softirq=3D5408/5408 fqs=3D14714
> >   [ 1404.413615] watchdog: BUG: soft lockup - CPU#124 stuck for 22s! [k=
smd:791]
> >   [ 1442.227095] rcu: INFO: rcu_sched self-detected stall on CPU
> >   [ 1442.227115] rcu:     124-....: (52509 ticks this GP) idle=3D10a/1/=
0x4000000000000002 softirq=3D5408/5408 fqs=3D21403
> >   [ 1455.111787] INFO: task worker:19907 blocked for more than 120 seco=
nds.
> >   [ 1455.111822]       Tainted: G             L    5.3.0-rc5-mdr-vanill=
a+ #1
> >   [ 1455.111833] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" dis=
ables this message.
> >   [ 1455.111884] INFO: task worker:19908 blocked for more than 120 seco=
nds.
> >   [ 1455.111905]       Tainted: G             L    5.3.0-rc5-mdr-vanill=
a+ #1
> >   [ 1455.111925] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" dis=
ables this message.
> >   [ 1455.111966] INFO: task worker:20328 blocked for more than 120 seco=
nds.
> >   [ 1455.111986]       Tainted: G             L    5.3.0-rc5-mdr-vanill=
a+ #1
> >   [ 1455.111998] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" dis=
ables this message.
> >   [ 1455.112048] INFO: task worker:20330 blocked for more than 120 seco=
nds.
> >   [ 1455.112068]       Tainted: G             L    5.3.0-rc5-mdr-vanill=
a+ #1
> >   [ 1455.112097] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" dis=
ables this message.
> >   [ 1455.112138] INFO: task worker:20332 blocked for more than 120 seco=
nds.
> >   [ 1455.112159]       Tainted: G             L    5.3.0-rc5-mdr-vanill=
a+ #1
> >   [ 1455.112179] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" dis=
ables this message.
> >   [ 1455.112210] INFO: task worker:20333 blocked for more than 120 seco=
nds.
> >   [ 1455.112231]       Tainted: G             L    5.3.0-rc5-mdr-vanill=
a+ #1
> >   [ 1455.112242] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" dis=
ables this message.
> >   [ 1455.112282] INFO: task worker:20335 blocked for more than 120 seco=
nds.
> >   [ 1455.112303]       Tainted: G             L    5.3.0-rc5-mdr-vanill=
a+ #1
> >   [ 1455.112332] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" dis=
ables this message.
> >   [ 1455.112372] INFO: task worker:20336 blocked for more than 120 seco=
nds.
> >   [ 1455.112392]       Tainted: G             L    5.3.0-rc5-mdr-vanill=
a+ #1
> =

> There should be stack traces here, did they get lost or you omitted them
> for brevity?

Both, I suppose :) This kernel was booted with 'quiet' option so I think the
traces were below CONFIG_CONSOLE_LOGLEVEL_QUIET=3D4 threshold, but the above
output was more to characterize that this was a persistent/re-occurring
lock-up, where I think brevity helps.

I do have the traces from xmon for all the CPUs that reported a soft-lockup,
but in some instances we don't see any lockups from spinlock waiters so I
wanted to keep the focus on the smp_call_function_many() callers.

Here's the trace for one of the spinlock waiters, if you think it would
be helpful to incorporate some or all of these into the commit log I can
certainly add them.

  # call trace/registers for CPU 124

  47:mon> c7c
  [link register   ] c00000000039cba4 follow_page_mask+0x6f4/0xcd0
  [c000008fe44c7b80] 0000000000000000 (unreliable)
  [c000008fe44c7bb0] c00000000039d0e4 follow_page_mask+0xc34/0xcd0
  [c000008fe44c7c40] c00000000039fef4 follow_page+0x44/0x110
  [c000008fe44c7c90] c0000000003ff6c8 ksm_scan_thread+0x5e8/0x1f60
  [c000008fe44c7db0] c00000000015e864 kthread+0x1a4/0x1b0
  [c000008fe44c7e20] c00000000000b760 ret_from_kernel_thread+0x5c/0x7c
  7c:mon> r
  R00 =3D c00000000039cba4   R16 =3D 0000000000000000
  R01 =3D c000008fe44c7b80   R17 =3D c000000001ca9a20
  R02 =3D c0000000019b3a00   R18 =3D c000000001b626b0
  R03 =3D c00c00000da5afe8   R19 =3D c00c00000da5afc0
  R04 =3D 0000000000000009   R20 =3D c000003696bfc610
  R05 =3D 0000000096bfc009   R21 =3D 0000000000000001
  R06 =3D 0000000000000009   R22 =3D c000003696bfc000
  R07 =3D 000000004d600386   R23 =3D 0000000000000610
  R08 =3D 4000000000000800   R24 =3D c000000001b62740
  R09 =3D 0000000080000069   R25 =3D c000000001b62738
  R10 =3D 000000008000007c   R26 =3D 00007d1c18490000
  R11 =3D 0000000000000000   R27 =3D c000008fe44c7c68
  R12 =3D 0000000000002000   R28 =3D 0000000000000000
  R13 =3D c000207fff60e800   R29 =3D c00000363df40af0
  R14 =3D c00c00000dd35800   R30 =3D c0000000019e1d80
  R15 =3D 5deadbeef0000100   R31 =3D c00c00000da5afe8
  pc  =3D c000000000ea1eb8 _raw_spin_lock+0x68/0x100
  cfar=3D c000000000ea1ee0 _raw_spin_lock+0x90/0x100
  lr  =3D c00000000039cba4 follow_page_mask+0x6f4/0xcd0
  msr =3D 9000000000089033   cr  =3D 24002824
  ctr =3D 0000000000000000   xer =3D 0000000000000000   trap =3D  100
  7c:mon> e
  cpu 0x7c: Vector: 100 (System Reset) at [c000207fff133d70]
      pc: c000000000ea1eb8: _raw_spin_lock+0x68/0x100
      lr: c00000000039cba4: follow_page_mask+0x6f4/0xcd0
      sp: c000008fe44c7b80
     msr: 9000000000089033
    current =3D 0xc000008fe6f94900
    paca    =3D 0xc000207fff60e800   irqmask: 0x03   irq_happened: 0x01
      pid   =3D 791, comm =3D ksmd

> =

> > CPU 45/0x2d, 24/0x18, 124/0x7c are stuck on spin locks, likely held by
> > CPUs 105/31
> =

> That last one "105/31" is confusing because it looks like you're giving
> the decimal/hex values again, but you're not.
> =

> I know xmon uses hex CPU numbers, but you don't actually refer to them
> much in this change log, so it's probably clearer just to convert all
> CPU numbers to decimal for the sake of the change log.
> =

> > CPU 105/0x69, and 31/0x1f are stuck in smp_call_function_many(),
> > waiting on target CPU 42. For instance:
> >
> >   69:mon> r
> =

> I think here and below are the only places we have a hex CPU number, so
> instead of using the xmon prompt just do eg:
> =

>     Registers for CPU 105:
> >   R00 =3D c00000000020b20c   R16 =3D 00007d1bcd800000
> >   R01 =3D c00000363eaa7970   R17 =3D 0000000000000001
> >   R02 =3D c0000000019b3a00   R18 =3D 000000000000006b
> >   R03 =3D 000000000000002a   R19 =3D 00007d537d7aecf0
> >   R04 =3D 000000000000002a   R20 =3D 60000000000000e0
> >   R05 =3D 000000000000002a   R21 =3D 0801000000000080
> >   R06 =3D c0002073fb0caa08   R22 =3D 0000000000000d60
> >   R07 =3D c0000000019ddd78   R23 =3D 0000000000000001
> >   R08 =3D 000000000000002a   R24 =3D c00000000147a700
> >   R09 =3D 0000000000000001   R25 =3D c0002073fb0ca908
> >   R10 =3D c000008ffeb4e660   R26 =3D 0000000000000000
> >   R11 =3D c0002073fb0ca900   R27 =3D c0000000019e2464
> >   R12 =3D c000000000050790   R28 =3D c0000000000812b0
> >   R13 =3D c000207fff623e00   R29 =3D c0002073fb0ca808
> >   R14 =3D 00007d1bbee00000   R30 =3D c0002073fb0ca800
> >   R15 =3D 00007d1bcd600000   R31 =3D 0000000000000800
> >   pc  =3D c00000000020b260 smp_call_function_many+0x3d0/0x460
> >   cfar=3D c00000000020b270 smp_call_function_many+0x3e0/0x460
> >   lr  =3D c00000000020b20c smp_call_function_many+0x37c/0x460
> >   msr =3D 900000010288b033   cr  =3D 44024824
> >   ctr =3D c000000000050790   xer =3D 0000000000000000   trap =3D  100
> >
> > CPU 42 is running normally, doing VCPU work:
> >
> >   1f:mon> c2a
> =

> And similarly here just say "Backtrace for CPU 42:" and omit the xmon pro=
mpt.
> =

> >   [link register   ] c00800001be17188 kvmppc_book3s_radix_page_fault+0x=
90/0x2b0 [kvm_hv]
> >   [c000008ed3343820] c000008ed3343850 (unreliable)
> >   [c000008ed33438d0] c00800001be11b6c kvmppc_book3s_hv_page_fault+0x264=
/0xe30 [kvm_hv]
> >   [c000008ed33439d0] c00800001be0d7b4 kvmppc_vcpu_run_hv+0x8dc/0xb50 [k=
vm_hv]
> >   [c000008ed3343ae0] c00800001c10891c kvmppc_vcpu_run+0x34/0x48 [kvm]
> >   [c000008ed3343b00] c00800001c10475c kvm_arch_vcpu_ioctl_run+0x244/0x4=
20 [kvm]
> >   [c000008ed3343b90] c00800001c0f5a78 kvm_vcpu_ioctl+0x470/0x7c8 [kvm]
> >   [c000008ed3343d00] c000000000475450 do_vfs_ioctl+0xe0/0xc70
> >   [c000008ed3343db0] c0000000004760e4 ksys_ioctl+0x104/0x120
> >   [c000008ed3343e00] c000000000476128 sys_ioctl+0x28/0x80
> >   [c000008ed3343e20] c00000000000b388 system_call+0x5c/0x70
> >   --- Exception: c00 (System Call) at 00007d545cfd7694
> >   SP (7d53ff7edf50) is in userspace
> >
> > It was subsequently found that ipi_message[PPC_MSG_CALL_FUNCTION]
> > was set for CPU 42 by at least 1 of the CPUs waiting in
> > smp_call_function_many(), but somehow the corresponding
> > call_single_queue entries were never processed, causing the callers
>                                                 ^
>                                                 "by CPU 42" (just to be c=
ompletely clear?)
> > to spin in csd_lock_wait() indefinitely.
> >
> > Nick Piggin suggested something similar to the following sequence as
> > a possible explanation (interleaving of CALL_FUNCTION/RESCHEDULE
> > IPI messages seems to be most common, but any mix of CALL_FUNCTION and
> > !CALL_FUNCTION messages could trigger it):
> =

> It's not very clear below where the smp_mb()'s and other functions you
> refer to are located in the code, so worth commenting each I think, eg:
> =

> >   CPU
>       X: smp_mb()                       // in smp_muxed_ipi_set_message()
> >     X: ipi_message[RESCHEDULE] =3D 1
>       X: kvmppc_set_host_ipi(42, 1)     // in doorbell_global_ipi()
> >     X: smp_mb()
>          ^
> Where is that, I can't work out which one you're referring to?
> =

> We do call ppc_msgsnd_sync(), which is a `sync` which happens to be the
> same thing as smp_mb()? But that's not very clear to me.

Yes, that's the one. I thought it would be easier to reason about this
particular example by applying the smp_mb() naming, but I agree it should
be clarified better. Something like this maybe?

  X: smp_mb() // via the `sync` in ppc_msgsnd_sync()

or would this be clearer?

  X: ppc_msgsnd_sync() // same as smp_mb() in current code

> =

> >     X: doorbell/msgsnd -> 42
> >    42: doorbell_exception() (from CPU X)
> >    42: msgsync
>     105: smb_mb()                       // in smp_muxed_ipi_set_message()
> =

> The key point is that the store we think we do here is reordered vs the
> next store, at least from the other CPUs POV. So that's probably worth
> explicitly annotating, something like:
> =

>     105: store issued but delayed: ipi_message[CALL_FUNCTION] =3D 1 ...
> =

> Or some better syntax that someone else can think of :)
> =

>     105: kvmppc_set_host_ipi(42, 1)     // in doorbell_global_ipi()
> >    42: kvmppc_set_host_ipi(42, 0)
> >    42: smp_ipi_demux_relaxed()
> >    42: // returns to executing guest
> >   105: ipi_message[CALL_FUNCTION] =3D 1 // due to re-ordering
> >   105: smp_mb()
> >   105: doorbell/msgsnd -> 42
> >    42: local_paca->kvm_hstate.host_ipi =3D=3D 0 // IPI ignored
> >   105: // hangs waiting on 42 to process messages/call_single_queue
> >
> > This patch avoids that scenario by placing a barrier at the start
> =

> "prevents" is better than "avoids" IMHO.
> =

> > of kvmppc_set_host_ipi() such that the storing of these messages (or
> > other state indicated by host_ipi being set) cannot be re-ordered past
> > it.
> =

> I think I'd phrase it more like : ".. placing a barrier at the start of
> kvmppc_set_host_ipi() so that stores to the ipi_message (or other state)
> are ordered vs the store to host_ipi."
> =

> That raises the question of whether this needs to be a full barrier or
> just a write barrier, and where is the matching barrier on the reading
> side?

For this particular case I think the same barrier orders it on the
read-side via kvmppc_set_host_ipi(42, 0) above, but I'm not sure that
work as a general solution, unless maybe we make that sort of usage
(clear-before-processing) part of the protocol of using
kvmppc_set_host_ipi()... it makes sense given we already need to take
care to not miss clearing them else we get issues like what was fixed
in 755563bc79c7, which introduced the clear in doorbell_exception(). So
then it's a matter of additionally making sure we do it prior to
processing host_ipi state. I haven't looked too closely at the other
users of kvmppc_set_host_ipi() yet though.

Alternatively, if I'm reading things right we currently have a four places
(A, B, C, and D below) that read host_ipi and branch when it's set:

in arch/powerpc/kvm/book3s_hv_rmhandlers.S:

       kvmppc_check_wake_reason:
               ...
               /* hypervisor doorbell */
       3:      li      r12, BOOK3S_INTERRUPT_H_DOORBELL
       =

               /*
                * Clear the doorbell as we will invoke the handler
                * explicitly in the guest exit path.
                */
               lis     r6, (PPC_DBELL_SERVER << (63-36))@h
               PPC_MSGCLR(6)
               /* see if it's a host IPI */
               li      r3, 1
       BEGIN_FTR_SECTION
               PPC_MSGSYNC
               lwsync
       END_FTR_SECTION_IFSET(CPU_FTR_ARCH_300)

  A)
               lbz     r0, HSTATE_HOST_IPI(r13)
               cmpwi   r0, 0
               bnelr
               /* if not, return -1 */
               li      r3, -1
               blr
  =

               ...
  =

               /* external interrupt - create a stack frame so we can call =
C */
       7:      mflr    r0
               std     r0, PPC_LR_STKOFF(r1)
               stdu    r1, -PPC_MIN_STKFRM(r1)
  B)
               bl      kvmppc_read_intr
               nop
               li      r12, BOOK3S_INTERRUPT_EXTERNAL
               cmpdi   r3, 1
               ble     1f
  =

        kvmppc_interrupt_hv:
                ...
                /* Hypervisor doorbell - exit only if host IPI flag set */
                cmpwi   r12, BOOK3S_INTERRUPT_H_DOORBELL
                bne     3f
        BEGIN_FTR_SECTION
                PPC_MSGSYNC
                lwsync
                /* always exit if we're running a nested guest */
                ld      r0, VCPU_NESTED(r9)
                cmpdi   r0, 0
                bne     guest_exit_cont
        END_FTR_SECTION_IFSET(CPU_FTR_ARCH_300)
        =

  C)
                lbz     r0, HSTATE_HOST_IPI(r13)
                cmpwi   r0, 0
                beq     maybe_reenter_guest
                b       guest_exit_cont
        =

                ...
        =

                /* External interrupt ? */
                cmpwi   r12, BOOK3S_INTERRUPT_EXTERNAL
                beq     kvmppc_guest_external
        =

        kvmppc_guest_external:
                /* External interrupt, first check for host_ipi. If this is
                 * set, we know the host wants us out so let's do it now
                 */
  D)
                bl      kvmppc_read_intr
        =

                ...
        =

                li      r12, BOOK3S_INTERRUPT_EXTERNAL
        =

                /*
                 * kvmppc_read_intr return codes:
                 *
                 * Exit to host (r3 > 0)
                 *   1 An interrupt is pending that needs to be handled by =
the host
                 *     Exit guest and return to host by branching to guest_=
exit_cont
                 *
                 *   2 Passthrough that needs completion in the host
                 *     Exit guest and return to host by branching to guest_=
exit_cont
                 *     However, we also set r12 to BOOK3S_INTERRUPT_HV_RM_H=
ARD
                 *     to indicate to the host to complete handling the int=
errupt
                 *
                 * Before returning to guest, we check if any CPU is headin=
g out
                 * to the host and if so, we head out also. If no CPUs are =
heading
                 * check return values <=3D 0.
                 *
                 * Return to guest (r3 <=3D 0)
                 *  0 No external interrupt is pending
                 * -1 A guest wakeup IPI (which has now been cleared)
                 *    In either case, we return to guest to deliver any pen=
ding
                 *    guest interrupts.
                 *
                 * -2 A PCI passthrough external interrupt was handled
                 *    (interrupt was delivered directly to guest)
                 *    Return to guest to deliver any pending guest interrup=
ts.
                 */
        =

                cmpdi   r3, 1
                ble     1f
        =

                /* Return code =3D 2 */
                li      r12, BOOK3S_INTERRUPT_HV_RM_HARD
                stw     r12, VCPU_TRAP(r9)
                b       guest_exit_cont
        =

        1:      /* Return code <=3D 1 */
                cmpdi   r3, 0
                bgt     guest_exit_cont


We could add an explicit `sync` after A) and C), and an smp_mb() in the
2 places where we test for it and find it set in kvmppc_read_intr() to
cover instances like B) and D). I was thinking maybe guest_exit_cont was
a common point where we could cover all these cases but kvm_novcpu_wakeup
seems to be at least one exception, plus if we went that route we'd issue
smp_mb()'s in cases where we don't actually need them.

Definitely open to other alternatives.

As far as using rw barriers, I can't think of any reason we couldn't, but
I wouldn't say I'm at all confident in declaring that safe atm...

> =

> > With this the above workload ran for 6 hours (so far) without
> =

> s/this/that fix in place/
> =

> > triggering any lock-ups.
> >
> > Cc: Paul Mackerras <paulus@ozlabs.org>
> > Cc: Nicholas Piggin <npiggin@gmail.com>
> > Cc: kvm-ppc@vger.kernel.org
> > Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
> =

> Can we think of a Fixes tag?

For this particular issue I think:

Fixes: 755563bc79c7 ("powerpc/powernv: Fixes for hypervisor doorbell handli=
ng") # v4.0

> =

> > ---
> >  arch/powerpc/include/asm/kvm_ppc.h | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/=
asm/kvm_ppc.h
> > index 2484e6a8f5ca..254abad0f55e 100644
> > --- a/arch/powerpc/include/asm/kvm_ppc.h
> > +++ b/arch/powerpc/include/asm/kvm_ppc.h
> > @@ -454,6 +454,7 @@ static inline u32 kvmppc_get_xics_latch(void)
> >  =

> >  static inline void kvmppc_set_host_ipi(int cpu, u8 host_ipi)
> >  {
> > +     smp_mb();
> =

> This needs a big comment explaining why it's there and what it orders vs
> what. I know you explained it all in the change log, but people don't
> see that when they're browsing the code, so we need a summarised version
> in a comment here please.

Yes, of course.

Thanks!

> =

> >       paca_ptrs[cpu]->kvm_hstate.host_ipi =3D host_ipi;
> >  }
> =

> =

> cheers
