Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 432B4BBF08
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 01:42:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cgpP3kbrzDqQc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 09:42:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46cgmM3RF0zDq5b
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2019 09:40:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="q10mVjMD"; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1003)
 id 46cgmL74mYz9sP7; Tue, 24 Sep 2019 09:40:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1569282018; bh=uRGpoLAOVKpmTxQoSqMe+LSZusUemVyaI5vYigVNcVY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q10mVjMD8jGo2PlhlXO83e8Xd521ZGRB3N/Il5vlP3C109QT/l5Vxjc9GjSzJWjqp
 IRvBUQwlexXTBIW9bVRqxptQ3yxRkuOUv+fqtewbP9Baclf+O4YVgF2CoVzas3+jt5
 wcO940A89yOZHkO5g+WNzfima2WGSEf/LrIs4ceiGKr4N8C3JJFLeF86YwX42vt5Vn
 LLX4uI5scnTET/nZe2PadCexP/TENsjaop1gwISjB/rTERdtSgSPVwcbA8sYrxCkCK
 CFa3GcUpXDhLdir/4vkXzAmWRV3GGGJQbDc/51P4s9gieyNlwJyoUKHaBJXqfd55pD
 rXv+0QinAAbjw==
Date: Tue, 24 Sep 2019 09:40:13 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: Michael Roth <mdroth@linux.vnet.ibm.com>
Subject: Re: [PATCH v2] KVM: PPC: Book3S HV: use smp_mb() when
 setting/clearing host_ipi flag
Message-ID: <20190923234013.GA28085@blackberry>
References: <20190911223155.16045-1-mdroth@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190911223155.16045-1-mdroth@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 11, 2019 at 05:31:55PM -0500, Michael Roth wrote:
> On a 2-socket Power9 system with 32 cores/128 threads (SMT4) and 1TB
> of memory running the following guest configs:
> 
>   guest A:
>     - 224GB of memory
>     - 56 VCPUs (sockets=1,cores=28,threads=2), where:
>       VCPUs 0-1 are pinned to CPUs 0-3,
>       VCPUs 2-3 are pinned to CPUs 4-7,
>       ...
>       VCPUs 54-55 are pinned to CPUs 108-111
> 
>   guest B:
>     - 4GB of memory
>     - 4 VCPUs (sockets=1,cores=4,threads=1)
> 
> with the following workloads (with KSM and THP enabled in all):
> 
>   guest A:
>     stress --cpu 40 --io 20 --vm 20 --vm-bytes 512M
> 
>   guest B:
>     stress --cpu 4 --io 4 --vm 4 --vm-bytes 512M
> 
>   host:
>     stress --cpu 4 --io 4 --vm 2 --vm-bytes 256M
> 
> the below soft-lockup traces were observed after an hour or so and
> persisted until the host was reset (this was found to be reliably
> reproducible for this configuration, for kernels 4.15, 4.18, 5.0,
> and 5.3-rc5):
> 
>   [ 1253.183290] rcu: INFO: rcu_sched self-detected stall on CPU
>   [ 1253.183319] rcu:     124-....: (5250 ticks this GP) idle=10a/1/0x4000000000000002 softirq=5408/5408 fqs=1941
>   [ 1256.287426] watchdog: BUG: soft lockup - CPU#105 stuck for 23s! [CPU 52/KVM:19709]
>   [ 1264.075773] watchdog: BUG: soft lockup - CPU#24 stuck for 23s! [worker:19913]
>   [ 1264.079769] watchdog: BUG: soft lockup - CPU#31 stuck for 23s! [worker:20331]
>   [ 1264.095770] watchdog: BUG: soft lockup - CPU#45 stuck for 23s! [worker:20338]
>   [ 1264.131773] watchdog: BUG: soft lockup - CPU#64 stuck for 23s! [avocado:19525]
>   [ 1280.408480] watchdog: BUG: soft lockup - CPU#124 stuck for 22s! [ksmd:791]
>   [ 1316.198012] rcu: INFO: rcu_sched self-detected stall on CPU
>   [ 1316.198032] rcu:     124-....: (21003 ticks this GP) idle=10a/1/0x4000000000000002 softirq=5408/5408 fqs=8243
>   [ 1340.411024] watchdog: BUG: soft lockup - CPU#124 stuck for 22s! [ksmd:791]
>   [ 1379.212609] rcu: INFO: rcu_sched self-detected stall on CPU
>   [ 1379.212629] rcu:     124-....: (36756 ticks this GP) idle=10a/1/0x4000000000000002 softirq=5408/5408 fqs=14714
>   [ 1404.413615] watchdog: BUG: soft lockup - CPU#124 stuck for 22s! [ksmd:791]
>   [ 1442.227095] rcu: INFO: rcu_sched self-detected stall on CPU
>   [ 1442.227115] rcu:     124-....: (52509 ticks this GP) idle=10a/1/0x4000000000000002 softirq=5408/5408 fqs=21403
>   [ 1455.111787] INFO: task worker:19907 blocked for more than 120 seconds.
>   [ 1455.111822]       Tainted: G             L    5.3.0-rc5-mdr-vanilla+ #1
>   [ 1455.111833] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
>   [ 1455.111884] INFO: task worker:19908 blocked for more than 120 seconds.
>   [ 1455.111905]       Tainted: G             L    5.3.0-rc5-mdr-vanilla+ #1
>   [ 1455.111925] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
>   [ 1455.111966] INFO: task worker:20328 blocked for more than 120 seconds.
>   [ 1455.111986]       Tainted: G             L    5.3.0-rc5-mdr-vanilla+ #1
>   [ 1455.111998] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
>   [ 1455.112048] INFO: task worker:20330 blocked for more than 120 seconds.
>   [ 1455.112068]       Tainted: G             L    5.3.0-rc5-mdr-vanilla+ #1
>   [ 1455.112097] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
>   [ 1455.112138] INFO: task worker:20332 blocked for more than 120 seconds.
>   [ 1455.112159]       Tainted: G             L    5.3.0-rc5-mdr-vanilla+ #1
>   [ 1455.112179] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
>   [ 1455.112210] INFO: task worker:20333 blocked for more than 120 seconds.
>   [ 1455.112231]       Tainted: G             L    5.3.0-rc5-mdr-vanilla+ #1
>   [ 1455.112242] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
>   [ 1455.112282] INFO: task worker:20335 blocked for more than 120 seconds.
>   [ 1455.112303]       Tainted: G             L    5.3.0-rc5-mdr-vanilla+ #1
>   [ 1455.112332] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
>   [ 1455.112372] INFO: task worker:20336 blocked for more than 120 seconds.
>   [ 1455.112392]       Tainted: G             L    5.3.0-rc5-mdr-vanilla+ #1
> 
> CPUs 45, 24, and 124 are stuck on spin locks, likely held by
> CPUs 105 and 31.
> 
> CPUs 105 and 31 are stuck in smp_call_function_many(), waiting on
> target CPU 42. For instance:
> 
>   # CPU 105 registers (via xmon)
>   R00 = c00000000020b20c   R16 = 00007d1bcd800000
>   R01 = c00000363eaa7970   R17 = 0000000000000001
>   R02 = c0000000019b3a00   R18 = 000000000000006b
>   R03 = 000000000000002a   R19 = 00007d537d7aecf0
>   R04 = 000000000000002a   R20 = 60000000000000e0
>   R05 = 000000000000002a   R21 = 0801000000000080
>   R06 = c0002073fb0caa08   R22 = 0000000000000d60
>   R07 = c0000000019ddd78   R23 = 0000000000000001
>   R08 = 000000000000002a   R24 = c00000000147a700
>   R09 = 0000000000000001   R25 = c0002073fb0ca908
>   R10 = c000008ffeb4e660   R26 = 0000000000000000
>   R11 = c0002073fb0ca900   R27 = c0000000019e2464
>   R12 = c000000000050790   R28 = c0000000000812b0
>   R13 = c000207fff623e00   R29 = c0002073fb0ca808
>   R14 = 00007d1bbee00000   R30 = c0002073fb0ca800
>   R15 = 00007d1bcd600000   R31 = 0000000000000800
>   pc  = c00000000020b260 smp_call_function_many+0x3d0/0x460
>   cfar= c00000000020b270 smp_call_function_many+0x3e0/0x460
>   lr  = c00000000020b20c smp_call_function_many+0x37c/0x460
>   msr = 900000010288b033   cr  = 44024824
>   ctr = c000000000050790   xer = 0000000000000000   trap =  100
> 
> CPU 42 is running normally, doing VCPU work:
> 
>   # CPU 42 stack trace (via xmon)
>   [link register   ] c00800001be17188 kvmppc_book3s_radix_page_fault+0x90/0x2b0 [kvm_hv]
>   [c000008ed3343820] c000008ed3343850 (unreliable)
>   [c000008ed33438d0] c00800001be11b6c kvmppc_book3s_hv_page_fault+0x264/0xe30 [kvm_hv]
>   [c000008ed33439d0] c00800001be0d7b4 kvmppc_vcpu_run_hv+0x8dc/0xb50 [kvm_hv]
>   [c000008ed3343ae0] c00800001c10891c kvmppc_vcpu_run+0x34/0x48 [kvm]
>   [c000008ed3343b00] c00800001c10475c kvm_arch_vcpu_ioctl_run+0x244/0x420 [kvm]
>   [c000008ed3343b90] c00800001c0f5a78 kvm_vcpu_ioctl+0x470/0x7c8 [kvm]
>   [c000008ed3343d00] c000000000475450 do_vfs_ioctl+0xe0/0xc70
>   [c000008ed3343db0] c0000000004760e4 ksys_ioctl+0x104/0x120
>   [c000008ed3343e00] c000000000476128 sys_ioctl+0x28/0x80
>   [c000008ed3343e20] c00000000000b388 system_call+0x5c/0x70
>   --- Exception: c00 (System Call) at 00007d545cfd7694
>   SP (7d53ff7edf50) is in userspace
> 
> It was subsequently found that ipi_message[PPC_MSG_CALL_FUNCTION]
> was set for CPU 42 by at least 1 of the CPUs waiting in
> smp_call_function_many(), but somehow the corresponding
> call_single_queue entries were never processed by CPU 42, causing the
> callers to spin in csd_lock_wait() indefinitely.
> 
> Nick Piggin suggested something similar to the following sequence as
> a possible explanation (interleaving of CALL_FUNCTION/RESCHEDULE
> IPI messages seems to be most common, but any mix of CALL_FUNCTION and
> !CALL_FUNCTION messages could trigger it):
> 
>     CPU
>       X: smp_muxed_ipi_set_message():
>       X:   smp_mb()
>       X:   message[RESCHEDULE] = 1
>       X: doorbell_global_ipi(42):
>       X:   kvmppc_set_host_ipi(42, 1)
>       X:   ppc_msgsnd_sync()/smp_mb()
>       X:   ppc_msgsnd() -> 42
>      42: doorbell_exception(): // from CPU X
>      42:   ppc_msgsync()
>     105: smp_muxed_ipi_set_message():
>     105:   smb_mb()
>          // STORE DEFERRED DUE TO RE-ORDERING
>   --105:   message[CALL_FUNCTION] = 1
>   | 105: doorbell_global_ipi(42):
>   | 105:   kvmppc_set_host_ipi(42, 1)
>   |  42:   kvmppc_set_host_ipi(42, 0)
>   |  42: smp_ipi_demux_relaxed()
>   |  42: // returns to executing guest
>   |      // RE-ORDERED STORE COMPLETES
>   ->105:   message[CALL_FUNCTION] = 1
>     105:   ppc_msgsnd_sync()/smp_mb()
>     105:   ppc_msgsnd() -> 42
>      42: local_paca->kvm_hstate.host_ipi == 0 // IPI ignored
>     105: // hangs waiting on 42 to process messages/call_single_queue
> 
> This can be prevented with an smp_mb() at the beginning of
> kvmppc_set_host_ipi(), such that stores to message[<type>] (or other
> state indicated by the host_ipi flag) are ordered vs. the store to
> to host_ipi.
> 
> However, doing so might still allow for the following scenario (not
> yet observed):
> 
>     CPU
>       X: smp_muxed_ipi_set_message():
>       X:   smp_mb()
>       X:   message[RESCHEDULE] = 1
>       X: doorbell_global_ipi(42):
>       X:   kvmppc_set_host_ipi(42, 1)
>       X:   ppc_msgsnd_sync()/smp_mb()
>       X:   ppc_msgsnd() -> 42
>      42: doorbell_exception(): // from CPU X
>      42:   ppc_msgsync()
>          // STORE DEFERRED DUE TO RE-ORDERING
>   -- 42:   kvmppc_set_host_ipi(42, 0)
>   |  42: smp_ipi_demux_relaxed()
>   | 105: smp_muxed_ipi_set_message():
>   | 105:   smb_mb()
>   | 105:   message[CALL_FUNCTION] = 1
>   | 105: doorbell_global_ipi(42):
>   | 105:   kvmppc_set_host_ipi(42, 1)
>   |      // RE-ORDERED STORE COMPLETES
>   -> 42:   kvmppc_set_host_ipi(42, 0)
>      42: // returns to executing guest
>     105:   ppc_msgsnd_sync()/smp_mb()
>     105:   ppc_msgsnd() -> 42
>      42: local_paca->kvm_hstate.host_ipi == 0 // IPI ignored
>     105: // hangs waiting on 42 to process messages/call_single_queue
> 
> Fixing this scenario would require an smp_mb() *after* clearing
> host_ipi flag in kvmppc_set_host_ipi() to order the store vs.
> subsequent processing of IPI messages.
> 
> To handle both cases, this patch splits kvmppc_set_host_ipi() into
> separate set/clear functions, where we execute smp_mb() prior to
> setting host_ipi flag, and after clearing host_ipi flag. These
> functions pair with each other to synchronize the sender and receiver
> sides.
> 
> With that change in place the above workload ran for 20 hours without
> triggering any lock-ups.
> 
> Fixes: 755563bc79c7 ("powerpc/powernv: Fixes for hypervisor doorbell handling") # v4.0
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Paul Mackerras <paulus@ozlabs.org>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: kvm-ppc@vger.kernel.org
> Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>

Looks good, makes sense.

Acked-by: Paul Mackerras <paulus@ozlabs.org>
