Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D71B05AC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 00:34:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46TGt11zk1zDsTV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 08:34:33 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46TGr30pYQzF3sZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 08:32:50 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8BMQgTR029543; Wed, 11 Sep 2019 18:32:42 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2uy7a547rd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Sep 2019 18:32:30 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x8BMTEco034489;
 Wed, 11 Sep 2019 18:32:30 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2uy7a547r6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Sep 2019 18:32:30 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8BMTuo2009044;
 Wed, 11 Sep 2019 22:32:29 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma04dal.us.ibm.com with ESMTP id 2uv467g8e3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Sep 2019 22:32:29 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8BMWSqe38470138
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Sep 2019 22:32:28 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 19869136051;
 Wed, 11 Sep 2019 22:32:28 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D1B3F136053;
 Wed, 11 Sep 2019 22:32:27 +0000 (GMT)
Received: from localhost (unknown [9.53.179.213])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 11 Sep 2019 22:32:27 +0000 (GMT)
From: Michael Roth <mdroth@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] KVM: PPC: Book3S HV: use smp_mb() when setting/clearing
 host_ipi flag
Date: Wed, 11 Sep 2019 17:31:55 -0500
Message-Id: <20190911223155.16045-1-mdroth@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.17.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-11_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909110199
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

On a 2-socket Power9 system with 32 cores/128 threads (SMT4) and 1TB
of memory running the following guest configs:

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

CPUs 45, 24, and 124 are stuck on spin locks, likely held by
CPUs 105 and 31.

CPUs 105 and 31 are stuck in smp_call_function_many(), waiting on
target CPU 42. For instance:

  # CPU 105 registers (via xmon)
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

  # CPU 42 stack trace (via xmon)
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
call_single_queue entries were never processed by CPU 42, causing the
callers to spin in csd_lock_wait() indefinitely.

Nick Piggin suggested something similar to the following sequence as
a possible explanation (interleaving of CALL_FUNCTION/RESCHEDULE
IPI messages seems to be most common, but any mix of CALL_FUNCTION and
!CALL_FUNCTION messages could trigger it):

    CPU
      X: smp_muxed_ipi_set_message():
      X:   smp_mb()
      X:   message[RESCHEDULE] = 1
      X: doorbell_global_ipi(42):
      X:   kvmppc_set_host_ipi(42, 1)
      X:   ppc_msgsnd_sync()/smp_mb()
      X:   ppc_msgsnd() -> 42
     42: doorbell_exception(): // from CPU X
     42:   ppc_msgsync()
    105: smp_muxed_ipi_set_message():
    105:   smb_mb()
         // STORE DEFERRED DUE TO RE-ORDERING
  --105:   message[CALL_FUNCTION] = 1
  | 105: doorbell_global_ipi(42):
  | 105:   kvmppc_set_host_ipi(42, 1)
  |  42:   kvmppc_set_host_ipi(42, 0)
  |  42: smp_ipi_demux_relaxed()
  |  42: // returns to executing guest
  |      // RE-ORDERED STORE COMPLETES
  ->105:   message[CALL_FUNCTION] = 1
    105:   ppc_msgsnd_sync()/smp_mb()
    105:   ppc_msgsnd() -> 42
     42: local_paca->kvm_hstate.host_ipi == 0 // IPI ignored
    105: // hangs waiting on 42 to process messages/call_single_queue

This can be prevented with an smp_mb() at the beginning of
kvmppc_set_host_ipi(), such that stores to message[<type>] (or other
state indicated by the host_ipi flag) are ordered vs. the store to
to host_ipi.

However, doing so might still allow for the following scenario (not
yet observed):

    CPU
      X: smp_muxed_ipi_set_message():
      X:   smp_mb()
      X:   message[RESCHEDULE] = 1
      X: doorbell_global_ipi(42):
      X:   kvmppc_set_host_ipi(42, 1)
      X:   ppc_msgsnd_sync()/smp_mb()
      X:   ppc_msgsnd() -> 42
     42: doorbell_exception(): // from CPU X
     42:   ppc_msgsync()
         // STORE DEFERRED DUE TO RE-ORDERING
  -- 42:   kvmppc_set_host_ipi(42, 0)
  |  42: smp_ipi_demux_relaxed()
  | 105: smp_muxed_ipi_set_message():
  | 105:   smb_mb()
  | 105:   message[CALL_FUNCTION] = 1
  | 105: doorbell_global_ipi(42):
  | 105:   kvmppc_set_host_ipi(42, 1)
  |      // RE-ORDERED STORE COMPLETES
  -> 42:   kvmppc_set_host_ipi(42, 0)
     42: // returns to executing guest
    105:   ppc_msgsnd_sync()/smp_mb()
    105:   ppc_msgsnd() -> 42
     42: local_paca->kvm_hstate.host_ipi == 0 // IPI ignored
    105: // hangs waiting on 42 to process messages/call_single_queue

Fixing this scenario would require an smp_mb() *after* clearing
host_ipi flag in kvmppc_set_host_ipi() to order the store vs.
subsequent processing of IPI messages.

To handle both cases, this patch splits kvmppc_set_host_ipi() into
separate set/clear functions, where we execute smp_mb() prior to
setting host_ipi flag, and after clearing host_ipi flag. These
functions pair with each other to synchronize the sender and receiver
sides.

With that change in place the above workload ran for 20 hours without
triggering any lock-ups.

Fixes: 755563bc79c7 ("powerpc/powernv: Fixes for hypervisor doorbell handling") # v4.0
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Paul Mackerras <paulus@ozlabs.org>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: kvm-ppc@vger.kernel.org
Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
---
v2:
 - changelog: don't reference CPUs in hex
 - changelog: make pseudocode clearer
 - changelog: drop reference to Witherspoon, various clean-ups
 - changelog: add Fixes tag
 - add code comments to clarify barrier usage/pairing
 - split kvmppc_set_host_ipi() into separate set/clear routines
 - add separate smp_mb() on IPI handler side to guard against additional
   potential lock-up scenario (detailed in comments/changelog) and
   provide a proper pairing with the smp_mb() from v1
---
 arch/powerpc/include/asm/kvm_ppc.h    | 100 +++++++++++++++++++++++++-
 arch/powerpc/kernel/dbell.c           |   6 +-
 arch/powerpc/kvm/book3s_hv_rm_xics.c  |   2 +-
 arch/powerpc/platforms/powernv/smp.c  |   2 +-
 arch/powerpc/sysdev/xics/icp-native.c |   6 +-
 arch/powerpc/sysdev/xics/icp-opal.c   |   6 +-
 6 files changed, 108 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
index 2484e6a8f5ca..ecb4d6846698 100644
--- a/arch/powerpc/include/asm/kvm_ppc.h
+++ b/arch/powerpc/include/asm/kvm_ppc.h
@@ -452,9 +452,100 @@ static inline u32 kvmppc_get_xics_latch(void)
 	return xirr;
 }
 
-static inline void kvmppc_set_host_ipi(int cpu, u8 host_ipi)
+/*
+ * To avoid the need to unnecessarily exit fully to the host kernel, an IPI to
+ * a CPU thread that's running/napping inside of a guest is by default regarded
+ * as a request to wake the CPU (if needed) and continue execution within the
+ * guest, potentially to process new state like externally-generated
+ * interrupts or IPIs sent from within the guest itself (e.g. H_PROD/H_IPI).
+ *
+ * To force an exit to the host kernel, kvmppc_set_host_ipi() must be called
+ * prior to issuing the IPI to set the corresponding 'host_ipi' flag in the
+ * target CPU's PACA. To avoid unnecessary exits to the host, this flag should
+ * be immediately cleared via kvmppc_clear_host_ipi() by the IPI handler on
+ * the receiving side prior to processing the IPI work.
+ *
+ * NOTE:
+ *
+ * We currently issue an smp_mb() at the beginning of kvmppc_set_host_ipi().
+ * This is to guard against sequences such as the following:
+ *
+ *      CPU
+ *        X: smp_muxed_ipi_set_message():
+ *        X:   smp_mb()
+ *        X:   message[RESCHEDULE] = 1
+ *        X: doorbell_global_ipi(42):
+ *        X:   kvmppc_set_host_ipi(42)
+ *        X:   ppc_msgsnd_sync()/smp_mb()
+ *        X:   ppc_msgsnd() -> 42
+ *       42: doorbell_exception(): // from CPU X
+ *       42:   ppc_msgsync()
+ *      105: smp_muxed_ipi_set_message():
+ *      105:   smb_mb()
+ *           // STORE DEFERRED DUE TO RE-ORDERING
+ *    --105:   message[CALL_FUNCTION] = 1
+ *    | 105: doorbell_global_ipi(42):
+ *    | 105:   kvmppc_set_host_ipi(42)
+ *    |  42:   kvmppc_clear_host_ipi(42)
+ *    |  42: smp_ipi_demux_relaxed()
+ *    |  42: // returns to executing guest
+ *    |      // RE-ORDERED STORE COMPLETES
+ *    ->105:   message[CALL_FUNCTION] = 1
+ *      105:   ppc_msgsnd_sync()/smp_mb()
+ *      105:   ppc_msgsnd() -> 42
+ *       42: local_paca->kvm_hstate.host_ipi == 0 // IPI ignored
+ *      105: // hangs waiting on 42 to process messages/call_single_queue
+ *
+ * We also issue an smp_mb() at the end of kvmppc_clear_host_ipi(). This is
+ * to guard against sequences such as the following (as well as to create
+ * a read-side pairing with the barrier in kvmppc_set_host_ipi()):
+ *
+ *      CPU
+ *        X: smp_muxed_ipi_set_message():
+ *        X:   smp_mb()
+ *        X:   message[RESCHEDULE] = 1
+ *        X: doorbell_global_ipi(42):
+ *        X:   kvmppc_set_host_ipi(42)
+ *        X:   ppc_msgsnd_sync()/smp_mb()
+ *        X:   ppc_msgsnd() -> 42
+ *       42: doorbell_exception(): // from CPU X
+ *       42:   ppc_msgsync()
+ *           // STORE DEFERRED DUE TO RE-ORDERING
+ *    -- 42:   kvmppc_clear_host_ipi(42)
+ *    |  42: smp_ipi_demux_relaxed()
+ *    | 105: smp_muxed_ipi_set_message():
+ *    | 105:   smb_mb()
+ *    | 105:   message[CALL_FUNCTION] = 1
+ *    | 105: doorbell_global_ipi(42):
+ *    | 105:   kvmppc_set_host_ipi(42)
+ *    |      // RE-ORDERED STORE COMPLETES
+ *    -> 42:   kvmppc_clear_host_ipi(42)
+ *       42: // returns to executing guest
+ *      105:   ppc_msgsnd_sync()/smp_mb()
+ *      105:   ppc_msgsnd() -> 42
+ *       42: local_paca->kvm_hstate.host_ipi == 0 // IPI ignored
+ *      105: // hangs waiting on 42 to process messages/call_single_queue
+ */
+static inline void kvmppc_set_host_ipi(int cpu)
 {
-	paca_ptrs[cpu]->kvm_hstate.host_ipi = host_ipi;
+	/*
+	 * order stores of IPI messages vs. setting of host_ipi flag
+	 *
+	 * pairs with the barrier in kvmppc_clear_host_ipi()
+	 */
+	smp_mb();
+	paca_ptrs[cpu]->kvm_hstate.host_ipi = 1;
+}
+
+static inline void kvmppc_clear_host_ipi(int cpu)
+{
+	paca_ptrs[cpu]->kvm_hstate.host_ipi = 0;
+	/*
+	 * order clearing of host_ipi flag vs. processing of IPI messages
+	 *
+	 * pairs with the barrier in kvmppc_set_host_ipi()
+	 */
+	smp_mb();
 }
 
 static inline void kvmppc_fast_vcpu_kick(struct kvm_vcpu *vcpu)
@@ -486,7 +577,10 @@ static inline u32 kvmppc_get_xics_latch(void)
 	return 0;
 }
 
-static inline void kvmppc_set_host_ipi(int cpu, u8 host_ipi)
+static inline void kvmppc_set_host_ipi(int cpu)
+{}
+
+static inline void kvmppc_clear_host_ipi(int cpu)
 {}
 
 static inline void kvmppc_fast_vcpu_kick(struct kvm_vcpu *vcpu)
diff --git a/arch/powerpc/kernel/dbell.c b/arch/powerpc/kernel/dbell.c
index 804b1a6196fa..f17ff1200eaa 100644
--- a/arch/powerpc/kernel/dbell.c
+++ b/arch/powerpc/kernel/dbell.c
@@ -33,7 +33,7 @@ void doorbell_global_ipi(int cpu)
 {
 	u32 tag = get_hard_smp_processor_id(cpu);
 
-	kvmppc_set_host_ipi(cpu, 1);
+	kvmppc_set_host_ipi(cpu);
 	/* Order previous accesses vs. msgsnd, which is treated as a store */
 	ppc_msgsnd_sync();
 	ppc_msgsnd(PPC_DBELL_MSGTYPE, 0, tag);
@@ -48,7 +48,7 @@ void doorbell_core_ipi(int cpu)
 {
 	u32 tag = cpu_thread_in_core(cpu);
 
-	kvmppc_set_host_ipi(cpu, 1);
+	kvmppc_set_host_ipi(cpu);
 	/* Order previous accesses vs. msgsnd, which is treated as a store */
 	ppc_msgsnd_sync();
 	ppc_msgsnd(PPC_DBELL_MSGTYPE, 0, tag);
@@ -84,7 +84,7 @@ void doorbell_exception(struct pt_regs *regs)
 
 	may_hard_irq_enable();
 
-	kvmppc_set_host_ipi(smp_processor_id(), 0);
+	kvmppc_clear_host_ipi(smp_processor_id());
 	__this_cpu_inc(irq_stat.doorbell_irqs);
 
 	smp_ipi_demux_relaxed(); /* already performed the barrier */
diff --git a/arch/powerpc/kvm/book3s_hv_rm_xics.c b/arch/powerpc/kvm/book3s_hv_rm_xics.c
index 4d2ec77d806c..287d5911df0f 100644
--- a/arch/powerpc/kvm/book3s_hv_rm_xics.c
+++ b/arch/powerpc/kvm/book3s_hv_rm_xics.c
@@ -58,7 +58,7 @@ static inline void icp_send_hcore_msg(int hcore, struct kvm_vcpu *vcpu)
 	hcpu = hcore << threads_shift;
 	kvmppc_host_rm_ops_hv->rm_core[hcore].rm_data = vcpu;
 	smp_muxed_ipi_set_message(hcpu, PPC_MSG_RM_HOST_ACTION);
-	kvmppc_set_host_ipi(hcpu, 1);
+	kvmppc_set_host_ipi(hcpu);
 	smp_mb();
 	kvmhv_rm_send_ipi(hcpu);
 }
diff --git a/arch/powerpc/platforms/powernv/smp.c b/arch/powerpc/platforms/powernv/smp.c
index 94cd96b9b7bb..fbd6e6b7bbf2 100644
--- a/arch/powerpc/platforms/powernv/smp.c
+++ b/arch/powerpc/platforms/powernv/smp.c
@@ -193,7 +193,7 @@ static void pnv_smp_cpu_kill_self(void)
 		 * for coming online, which are handled via
 		 * generic_check_cpu_restart() calls.
 		 */
-		kvmppc_set_host_ipi(cpu, 0);
+		kvmppc_clear_host_ipi(cpu);
 
 		srr1 = pnv_cpu_offline(cpu);
 
diff --git a/arch/powerpc/sysdev/xics/icp-native.c b/arch/powerpc/sysdev/xics/icp-native.c
index 485569ff7ef1..7d13d2ef5a90 100644
--- a/arch/powerpc/sysdev/xics/icp-native.c
+++ b/arch/powerpc/sysdev/xics/icp-native.c
@@ -140,7 +140,7 @@ static unsigned int icp_native_get_irq(void)
 
 static void icp_native_cause_ipi(int cpu)
 {
-	kvmppc_set_host_ipi(cpu, 1);
+	kvmppc_set_host_ipi(cpu);
 	icp_native_set_qirr(cpu, IPI_PRIORITY);
 }
 
@@ -179,7 +179,7 @@ void icp_native_flush_interrupt(void)
 	if (vec == XICS_IPI) {
 		/* Clear pending IPI */
 		int cpu = smp_processor_id();
-		kvmppc_set_host_ipi(cpu, 0);
+		kvmppc_clear_host_ipi(cpu);
 		icp_native_set_qirr(cpu, 0xff);
 	} else {
 		pr_err("XICS: hw interrupt 0x%x to offline cpu, disabling\n",
@@ -200,7 +200,7 @@ static irqreturn_t icp_native_ipi_action(int irq, void *dev_id)
 {
 	int cpu = smp_processor_id();
 
-	kvmppc_set_host_ipi(cpu, 0);
+	kvmppc_clear_host_ipi(cpu);
 	icp_native_set_qirr(cpu, 0xff);
 
 	return smp_ipi_demux();
diff --git a/arch/powerpc/sysdev/xics/icp-opal.c b/arch/powerpc/sysdev/xics/icp-opal.c
index 8bb8dd7dd6ad..68fd2540b093 100644
--- a/arch/powerpc/sysdev/xics/icp-opal.c
+++ b/arch/powerpc/sysdev/xics/icp-opal.c
@@ -126,7 +126,7 @@ static void icp_opal_cause_ipi(int cpu)
 {
 	int hw_cpu = get_hard_smp_processor_id(cpu);
 
-	kvmppc_set_host_ipi(cpu, 1);
+	kvmppc_set_host_ipi(cpu);
 	opal_int_set_mfrr(hw_cpu, IPI_PRIORITY);
 }
 
@@ -134,7 +134,7 @@ static irqreturn_t icp_opal_ipi_action(int irq, void *dev_id)
 {
 	int cpu = smp_processor_id();
 
-	kvmppc_set_host_ipi(cpu, 0);
+	kvmppc_clear_host_ipi(cpu);
 	opal_int_set_mfrr(get_hard_smp_processor_id(cpu), 0xff);
 
 	return smp_ipi_demux();
@@ -157,7 +157,7 @@ void icp_opal_flush_interrupt(void)
 		if (vec == XICS_IPI) {
 			/* Clear pending IPI */
 			int cpu = smp_processor_id();
-			kvmppc_set_host_ipi(cpu, 0);
+			kvmppc_clear_host_ipi(cpu);
 			opal_int_set_mfrr(get_hard_smp_processor_id(cpu), 0xff);
 		} else {
 			pr_err("XICS: hw interrupt 0x%x to offline cpu, "
-- 
2.17.1

