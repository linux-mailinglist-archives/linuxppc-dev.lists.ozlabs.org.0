Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E405A968C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2019 00:33:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Nz9l0k1bzDqyZ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2019 08:33:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=mdroth@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Nz7d3GL9zDqX9
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2019 08:31:18 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x84MRSMt108282; Wed, 4 Sep 2019 18:31:15 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2utkrvcc92-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Sep 2019 18:31:15 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x84MTIIF111177;
 Wed, 4 Sep 2019 18:31:14 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2utkrvcc83-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Sep 2019 18:31:14 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x84MUD1a026784;
 Wed, 4 Sep 2019 22:31:13 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma05wdc.us.ibm.com with ESMTP id 2utmc40n8k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Sep 2019 22:31:13 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x84MVDkQ54198698
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 4 Sep 2019 22:31:13 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 110FFAC05E;
 Wed,  4 Sep 2019 22:31:13 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DF4D1AC062;
 Wed,  4 Sep 2019 22:31:12 +0000 (GMT)
Received: from localhost (unknown [9.53.179.213])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  4 Sep 2019 22:31:12 +0000 (GMT)
From: Michael Roth <mdroth@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] KVM: PPC: Book3S HV: add smp_mb() in kvmppc_set_host_ipi()
Date: Wed,  4 Sep 2019 17:28:37 -0500
Message-Id: <20190904222837.25798-1-mdroth@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.17.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-04_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909040216
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
Cc: kvm-ppc@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On a 2-socket Witherspoon system with 128 cores and 1TB of memory
running the following guest configs:

  guest A:
    - 224GB of memory
    - 56 VCPUs (sockets=1,cores=28,threads=2), where:
      VCPUs 0-1 are pinned to CPUs 0-3,
      VCPUs 2-3 are pinned to CPUs 4-7,
      ...
      VCPUs 54-55 are pinned to CPUs 108-111

  guest B:
    - 4GB of memory
    - 4 VCPUs (sockets=1,cores=4,threads=1)

with the following workloads (with KSM and THP enabled in all):

  guest A:
    stress --cpu 40 --io 20 --vm 20 --vm-bytes 512M

  guest B:
    stress --cpu 4 --io 4 --vm 4 --vm-bytes 512M

  host:
    stress --cpu 4 --io 4 --vm 2 --vm-bytes 256M

the below soft-lockup traces were observed after an hour or so and
persisted until the host was reset (this was found to be reliably
reproducible for this configuration, for kernels 4.15, 4.18, 5.0,
and 5.3-rc5):

  [ 1253.183290] rcu: INFO: rcu_sched self-detected stall on CPU
  [ 1253.183319] rcu:     124-....: (5250 ticks this GP) idle=10a/1/0x4000000000000002 softirq=5408/5408 fqs=1941
  [ 1256.287426] watchdog: BUG: soft lockup - CPU#105 stuck for 23s! [CPU 52/KVM:19709]
  [ 1264.075773] watchdog: BUG: soft lockup - CPU#24 stuck for 23s! [worker:19913]
  [ 1264.079769] watchdog: BUG: soft lockup - CPU#31 stuck for 23s! [worker:20331]
  [ 1264.095770] watchdog: BUG: soft lockup - CPU#45 stuck for 23s! [worker:20338]
  [ 1264.131773] watchdog: BUG: soft lockup - CPU#64 stuck for 23s! [avocado:19525]
  [ 1280.408480] watchdog: BUG: soft lockup - CPU#124 stuck for 22s! [ksmd:791]
  [ 1316.198012] rcu: INFO: rcu_sched self-detected stall on CPU
  [ 1316.198032] rcu:     124-....: (21003 ticks this GP) idle=10a/1/0x4000000000000002 softirq=5408/5408 fqs=8243
  [ 1340.411024] watchdog: BUG: soft lockup - CPU#124 stuck for 22s! [ksmd:791]
  [ 1379.212609] rcu: INFO: rcu_sched self-detected stall on CPU
  [ 1379.212629] rcu:     124-....: (36756 ticks this GP) idle=10a/1/0x4000000000000002 softirq=5408/5408 fqs=14714
  [ 1404.413615] watchdog: BUG: soft lockup - CPU#124 stuck for 22s! [ksmd:791]
  [ 1442.227095] rcu: INFO: rcu_sched self-detected stall on CPU
  [ 1442.227115] rcu:     124-....: (52509 ticks this GP) idle=10a/1/0x4000000000000002 softirq=5408/5408 fqs=21403
  [ 1455.111787] INFO: task worker:19907 blocked for more than 120 seconds.
  [ 1455.111822]       Tainted: G             L    5.3.0-rc5-mdr-vanilla+ #1
  [ 1455.111833] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
  [ 1455.111884] INFO: task worker:19908 blocked for more than 120 seconds.
  [ 1455.111905]       Tainted: G             L    5.3.0-rc5-mdr-vanilla+ #1
  [ 1455.111925] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
  [ 1455.111966] INFO: task worker:20328 blocked for more than 120 seconds.
  [ 1455.111986]       Tainted: G             L    5.3.0-rc5-mdr-vanilla+ #1
  [ 1455.111998] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
  [ 1455.112048] INFO: task worker:20330 blocked for more than 120 seconds.
  [ 1455.112068]       Tainted: G             L    5.3.0-rc5-mdr-vanilla+ #1
  [ 1455.112097] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
  [ 1455.112138] INFO: task worker:20332 blocked for more than 120 seconds.
  [ 1455.112159]       Tainted: G             L    5.3.0-rc5-mdr-vanilla+ #1
  [ 1455.112179] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
  [ 1455.112210] INFO: task worker:20333 blocked for more than 120 seconds.
  [ 1455.112231]       Tainted: G             L    5.3.0-rc5-mdr-vanilla+ #1
  [ 1455.112242] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
  [ 1455.112282] INFO: task worker:20335 blocked for more than 120 seconds.
  [ 1455.112303]       Tainted: G             L    5.3.0-rc5-mdr-vanilla+ #1
  [ 1455.112332] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
  [ 1455.112372] INFO: task worker:20336 blocked for more than 120 seconds.
  [ 1455.112392]       Tainted: G             L    5.3.0-rc5-mdr-vanilla+ #1

CPU 45/0x2d, 24/0x18, 124/0x7c are stuck on spin locks, likely held by
CPUs 105/31

CPU 105/0x69, and 31/0x1f are stuck in smp_call_function_many(),
waiting on target CPU 42. For instance:

  69:mon> r
  R00 = c00000000020b20c   R16 = 00007d1bcd800000
  R01 = c00000363eaa7970   R17 = 0000000000000001
  R02 = c0000000019b3a00   R18 = 000000000000006b
  R03 = 000000000000002a   R19 = 00007d537d7aecf0
  R04 = 000000000000002a   R20 = 60000000000000e0
  R05 = 000000000000002a   R21 = 0801000000000080
  R06 = c0002073fb0caa08   R22 = 0000000000000d60
  R07 = c0000000019ddd78   R23 = 0000000000000001
  R08 = 000000000000002a   R24 = c00000000147a700
  R09 = 0000000000000001   R25 = c0002073fb0ca908
  R10 = c000008ffeb4e660   R26 = 0000000000000000
  R11 = c0002073fb0ca900   R27 = c0000000019e2464
  R12 = c000000000050790   R28 = c0000000000812b0
  R13 = c000207fff623e00   R29 = c0002073fb0ca808
  R14 = 00007d1bbee00000   R30 = c0002073fb0ca800
  R15 = 00007d1bcd600000   R31 = 0000000000000800
  pc  = c00000000020b260 smp_call_function_many+0x3d0/0x460
  cfar= c00000000020b270 smp_call_function_many+0x3e0/0x460
  lr  = c00000000020b20c smp_call_function_many+0x37c/0x460
  msr = 900000010288b033   cr  = 44024824
  ctr = c000000000050790   xer = 0000000000000000   trap =  100

CPU 42 is running normally, doing VCPU work:

  1f:mon> c2a
  [link register   ] c00800001be17188 kvmppc_book3s_radix_page_fault+0x90/0x2b0 [kvm_hv]
  [c000008ed3343820] c000008ed3343850 (unreliable)
  [c000008ed33438d0] c00800001be11b6c kvmppc_book3s_hv_page_fault+0x264/0xe30 [kvm_hv]
  [c000008ed33439d0] c00800001be0d7b4 kvmppc_vcpu_run_hv+0x8dc/0xb50 [kvm_hv]
  [c000008ed3343ae0] c00800001c10891c kvmppc_vcpu_run+0x34/0x48 [kvm]
  [c000008ed3343b00] c00800001c10475c kvm_arch_vcpu_ioctl_run+0x244/0x420 [kvm]
  [c000008ed3343b90] c00800001c0f5a78 kvm_vcpu_ioctl+0x470/0x7c8 [kvm]
  [c000008ed3343d00] c000000000475450 do_vfs_ioctl+0xe0/0xc70
  [c000008ed3343db0] c0000000004760e4 ksys_ioctl+0x104/0x120
  [c000008ed3343e00] c000000000476128 sys_ioctl+0x28/0x80
  [c000008ed3343e20] c00000000000b388 system_call+0x5c/0x70
  --- Exception: c00 (System Call) at 00007d545cfd7694
  SP (7d53ff7edf50) is in userspace

It was subsequently found that ipi_message[PPC_MSG_CALL_FUNCTION]
was set for CPU 42 by at least 1 of the CPUs waiting in
smp_call_function_many(), but somehow the corresponding
call_single_queue entries were never processed, causing the callers
to spin in csd_lock_wait() indefinitely.

Nick Piggin suggested something similar to the following sequence as
a possible explanation (interleaving of CALL_FUNCTION/RESCHEDULE
IPI messages seems to be most common, but any mix of CALL_FUNCTION and
!CALL_FUNCTION messages could trigger it):

  CPU
    X: smp_mb()
    X: ipi_message[RESCHEDULE] = 1
    X: kvmppc_set_host_ipi(42, 1)
    X: smp_mb()
    X: doorbell/msgsnd -> 42
   42: doorbell_exception() (from CPU X)
   42: msgsync
  105: smb_mb()
  105: kvmppc_set_host_ipi(42, 1)
   42: kvmppc_set_host_ipi(42, 0)
   42: smp_ipi_demux_relaxed()
   42: // returns to executing guest
  105: ipi_message[CALL_FUNCTION] = 1 // due to re-ordering
  105: smp_mb()
  105: doorbell/msgsnd -> 42
   42: local_paca->kvm_hstate.host_ipi == 0 // IPI ignored
  105: // hangs waiting on 42 to process messages/call_single_queue

This patch avoids that scenario by placing a barrier at the start
of kvmppc_set_host_ipi() such that the storing of these messages (or
other state indicated by host_ipi being set) cannot be re-ordered past
it.

With this the above workload ran for 6 hours (so far) without
triggering any lock-ups.

Cc: Paul Mackerras <paulus@ozlabs.org>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: kvm-ppc@vger.kernel.org
Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/kvm_ppc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
index 2484e6a8f5ca..254abad0f55e 100644
--- a/arch/powerpc/include/asm/kvm_ppc.h
+++ b/arch/powerpc/include/asm/kvm_ppc.h
@@ -454,6 +454,7 @@ static inline u32 kvmppc_get_xics_latch(void)
 
 static inline void kvmppc_set_host_ipi(int cpu, u8 host_ipi)
 {
+	smp_mb();
 	paca_ptrs[cpu]->kvm_hstate.host_ipi = host_ipi;
 }
 
-- 
2.17.1

