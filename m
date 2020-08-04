Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2364C23B345
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 05:31:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLKzj6k7xzDqPF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 13:31:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::843;
 helo=mail-qt1-x843.google.com; envelope-from=flukshun@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=DqQOV2fQ; dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLKxr6sVVzDqBy
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Aug 2020 13:29:49 +1000 (AEST)
Received: by mail-qt1-x843.google.com with SMTP id v22so24015016qtq.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Aug 2020 20:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=mGMUXdKd2/CgAcLW8jFlyb6fQMsr4WdD6fv8znHM1Lw=;
 b=DqQOV2fQ0xDbE3Hn4SqChUefjY9QxydSWz4PHSU5aabbr6eTUBEwcjRaSUpEklHMkn
 wKg+55eUUF3m4oB9nhRPfx9AdlOtuziKCPQPtAd+zPYSniDEQ6e/55RQ/MdF/Ap8EMUm
 tJofbDRdpsKOuidKl1+U48hHVcK+e1rsBkfOu4hZJalBDG2Uwxc4f3cthAHZs5wb6D2u
 f4HTW1j0EGKPfcoVNjVmEWk8BQscWsGJ6csAkj78TkX98ygjFbMjpw/kOjUh6bR6y7P5
 jOrq7Pt/4Xx0Ijx4RLM2qvsEnToxO8k2unKuoVif7NIsmDpHY7Zv+BsBEWXnokWlmXl7
 Z0DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=mGMUXdKd2/CgAcLW8jFlyb6fQMsr4WdD6fv8znHM1Lw=;
 b=Kq+QKJ76ZNDWKgtJGr2m3lNRcraQUKEWhZfh89O6tKfaMxSlLY4UpWF4yDHzG+n/n0
 jLK9S3pXgzZr/YE26UpdRUhFqaO+cD0uDiHF2Jgs9dLtICWPu432BWUbUA3jyHS/02uI
 GNt8dP4m8Iiu9xXuFgQ9AC09fwZs1Gpj0v7jUloRIJhL2JUaoj7qWU5BaL1Fcg11muVk
 PUJfwxHYa9eKKKUFVQJuPf3JXQW2p83C5SbjoBVsG/aK9F5QEOkP89fXuY41/F4s3PFt
 Cj+kJdQXc72X2AxTZ3csSO6TeahUW0X+xbCMwNvJPARXF2YSaDgcpc+mFqWz6GncW464
 jwdg==
X-Gm-Message-State: AOAM5326yIRDzFdjOFpqqxB+zat0HcYh4OzAuMSA2YCEMqH6gxabdrRE
 GNp/SxU76e1FY3jHZnMxebbDFRXw
X-Google-Smtp-Source: ABdhPJyz22yh79wZTwHzOFkk4FbRaL89dWV+MnPB0eBK49tQyrmMPwnAFPiaVNxpggrMUf+gqW0rqQ==
X-Received: by 2002:ac8:320b:: with SMTP id x11mr19161248qta.320.1596511784845; 
 Mon, 03 Aug 2020 20:29:44 -0700 (PDT)
Received: from localhost (76-251-165-188.lightspeed.austtx.sbcglobal.net.
 [76.251.165.188])
 by smtp.gmail.com with ESMTPSA id x24sm25609137qtj.8.2020.08.03.20.29.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 03 Aug 2020 20:29:43 -0700 (PDT)
From: Michael Roth <mdroth@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/pseries/hotplug-cpu: increase wait time for vCPU death
Date: Mon,  3 Aug 2020 22:29:37 -0500
Message-Id: <20200804032937.7235-1-mdroth@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Cedric Le Goater <clg@kaod.org>,
 Greg Kurz <groug@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

For a power9 KVM guest with XIVE enabled, running a test loop
where we hotplug 384 vcpus and then unplug them, the following traces
can be seen (generally within a few loops) either from the unplugged
vcpu:

  [ 1767.353447] cpu 65 (hwid 65) Ready to die...
  [ 1767.952096] Querying DEAD? cpu 66 (66) shows 2
  [ 1767.952311] list_del corruption. next->prev should be c00a000002470208, but was c00a000002470048
  [ 1767.952322] ------------[ cut here ]------------
  [ 1767.952323] kernel BUG at lib/list_debug.c:56!
  [ 1767.952325] Oops: Exception in kernel mode, sig: 5 [#1]
  [ 1767.952326] LE SMP NR_CPUS=2048 NUMA pSeries
  [ 1767.952328] Modules linked in: fuse nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nf_tables_set nft_chain_nat_ipv6 nf_nat_ipv6 nft_chain_route_ipv6 nft_chain_nat_ipv4 nf_nat_ipv4 nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nft_chain_route_ipv4 ip6_tables nft_compat ip_set nf_tables nfnetlink uio_pdrv_genirq ip_tables xfs libcrc32c sd_mod sg xts vmx_crypto virtio_net net_failover failover virtio_scsi dm_multipath dm_mirror dm_region_hash dm_log dm_mod be2iscsi bnx2i cnic uio cxgb4i cxgb4 libcxgbi libcxgb qla4xxx iscsi_boot_sysfs iscsi_tcp libiscsi_tcp libiscsi scsi_transport_iscsi
  [ 1767.952352] CPU: 66 PID: 0 Comm: swapper/66 Kdump: loaded Not tainted 4.18.0-221.el8.ppc64le #1
  [ 1767.952354] NIP:  c0000000007ab50c LR: c0000000007ab508 CTR: 00000000000003ac
  [ 1767.952355] REGS: c0000009e5a17840 TRAP: 0700   Not tainted  (4.18.0-221.el8.ppc64le)
  [ 1767.952355] MSR:  800000000282b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 28000842  XER: 20040000
  [ 1767.952360] CFAR: c0000000001ffe64 IRQMASK: 1
  [ 1767.952360] GPR00: c0000000007ab508 c0000009e5a17ac0 c000000001ac0700 0000000000000054
  [ 1767.952360] GPR04: c0000009f056cf90 c0000009f05f5628 c0000009ed40d654 c000000001c90700
  [ 1767.952360] GPR08: 0000000000000007 c0000009f0573980 00000009ef2b0000 7562202c38303230
  [ 1767.952360] GPR12: 0000000000000000 c0000007fff6ce80 c00a000002470208 0000000000000000
  [ 1767.952360] GPR16: 0000000000000001 c0000009f05fbb00 0000000000000800 c0000009ff3d4980
  [ 1767.952360] GPR20: c0000009f05fbb10 5deadbeef0000100 5deadbeef0000200 0000000000187961
  [ 1767.952360] GPR24: c0000009e5a17b78 0000000000000000 0000000000000001 ffffffffffffffff
  [ 1767.952360] GPR28: c00a000002470200 c0000009f05fbb10 c0000009f05fbb10 0000000000000000
  [ 1767.952375] NIP [c0000000007ab50c] __list_del_entry_valid+0xac/0x100
  [ 1767.952376] LR [c0000000007ab508] __list_del_entry_valid+0xa8/0x100
  [ 1767.952377] Call Trace:
  [ 1767.952378] [c0000009e5a17ac0] [c0000000007ab508] __list_del_entry_valid+0xa8/0x100 (unreliable)
  [ 1767.952381] [c0000009e5a17b20] [c000000000476e18] free_pcppages_bulk+0x1f8/0x940
  [ 1767.952383] [c0000009e5a17c20] [c00000000047a9a0] free_unref_page+0xd0/0x100
  [ 1767.952386] [c0000009e5a17c50] [c0000000000bc2a8] xive_spapr_cleanup_queue+0x148/0x1b0
  [ 1767.952388] [c0000009e5a17cf0] [c0000000000b96dc] xive_teardown_cpu+0x1bc/0x240
  [ 1767.952391] [c0000009e5a17d30] [c00000000010bf28] pseries_mach_cpu_die+0x78/0x2f0
  [ 1767.952393] [c0000009e5a17de0] [c00000000005c8d8] cpu_die+0x48/0x70
  [ 1767.952394] [c0000009e5a17e00] [c000000000021cf0] arch_cpu_idle_dead+0x20/0x40
  [ 1767.952397] [c0000009e5a17e20] [c0000000001b4294] do_idle+0x2f4/0x4c0
  [ 1767.952399] [c0000009e5a17ea0] [c0000000001b46a8] cpu_startup_entry+0x38/0x40
  [ 1767.952400] [c0000009e5a17ed0] [c00000000005c43c] start_secondary+0x7bc/0x8f0
  [ 1767.952403] [c0000009e5a17f90] [c00000000000ac70] start_secondary_prolog+0x10/0x14

or on the worker thread handling the unplug:

  [ 1538.253044] pseries-hotplug-cpu: Attempting to remove CPU <NULL>, drc index: 1000013a
  [ 1538.360259] Querying DEAD? cpu 314 (314) shows 2
  [ 1538.360736] BUG: Bad page state in process kworker/u768:3  pfn:95de1
  [ 1538.360746] cpu 314 (hwid 314) Ready to die...
  [ 1538.360784] page:c00a000002577840 refcount:0 mapcount:-128 mapping:0000000000000000 index:0x0
  [ 1538.361881] flags: 0x5ffffc00000000()
  [ 1538.361908] raw: 005ffffc00000000 5deadbeef0000100 5deadbeef0000200 0000000000000000
  [ 1538.361955] raw: 0000000000000000 0000000000000000 00000000ffffff7f 0000000000000000
  [ 1538.362002] page dumped because: nonzero mapcount
  [ 1538.362033] Modules linked in: kvm xt_CHECKSUM ipt_MASQUERADE xt_conntrack ipt_REJECT nft_counter nf_nat_tftp nft_objref nf_conntrack_tftp tun bridge stp llc nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nf_tables_set nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ip6_tables nft_compat ip_set nf_tables nfnetlink sunrpc xts vmx_crypto ip_tables xfs libcrc32c sd_mod sg virtio_net net_failover virtio_scsi failover dm_mirror dm_region_hash dm_log dm_mod
  [ 1538.362613] CPU: 0 PID: 548 Comm: kworker/u768:3 Kdump: loaded Not tainted 4.18.0-224.el8.bz1856588.ppc64le #1
  [ 1538.362687] Workqueue: pseries hotplug workque pseries_hp_work_fn
  [ 1538.362725] Call Trace:
  [ 1538.362743] [c0000009d4adf590] [c000000000e0e0fc] dump_stack+0xb0/0xf4 (unreliable)
  [ 1538.362789] [c0000009d4adf5d0] [c000000000475dfc] bad_page+0x12c/0x1b0
  [ 1538.362827] [c0000009d4adf660] [c0000000004784bc] free_pcppages_bulk+0x5bc/0x940
  [ 1538.362871] [c0000009d4adf760] [c000000000478c38] page_alloc_cpu_dead+0x118/0x120
  [ 1538.362918] [c0000009d4adf7b0] [c00000000015b898] cpuhp_invoke_callback.constprop.5+0xb8/0x760
  [ 1538.362969] [c0000009d4adf820] [c00000000015eee8] _cpu_down+0x188/0x340
  [ 1538.363007] [c0000009d4adf890] [c00000000015d75c] cpu_down+0x5c/0xa0
  [ 1538.363045] [c0000009d4adf8c0] [c00000000092c544] cpu_subsys_offline+0x24/0x40
  [ 1538.363091] [c0000009d4adf8e0] [c0000000009212f0] device_offline+0xf0/0x130
  [ 1538.363129] [c0000009d4adf920] [c00000000010aee4] dlpar_offline_cpu+0x1c4/0x2a0
  [ 1538.363174] [c0000009d4adf9e0] [c00000000010b2f8] dlpar_cpu_remove+0xb8/0x190
  [ 1538.363219] [c0000009d4adfa60] [c00000000010b4fc] dlpar_cpu_remove_by_index+0x12c/0x150
  [ 1538.363264] [c0000009d4adfaf0] [c00000000010ca24] dlpar_cpu+0x94/0x800
  [ 1538.363302] [c0000009d4adfc00] [c000000000102cc8] pseries_hp_work_fn+0x128/0x1e0
  [ 1538.363347] [c0000009d4adfc70] [c00000000018aa84] process_one_work+0x304/0x5d0
  [ 1538.363394] [c0000009d4adfd10] [c00000000018b5cc] worker_thread+0xcc/0x7a0
  [ 1538.363433] [c0000009d4adfdc0] [c00000000019567c] kthread+0x1ac/0x1c0
  [ 1538.363469] [c0000009d4adfe30] [c00000000000b7dc] ret_from_kernel_thread+0x5c/0x80

The latter trace is due to the following sequence:

  page_alloc_cpu_dead
    drain_pages
      drain_pages_zone
        free_pcppages_bulk

where drain_pages() in this case is called under the assumption that
the unplugged cpu is no longer executing. To ensure that is the case,
and early call is made to __cpu_die()->pseries_cpu_die(), which runs
a loop that waits for the cpu to reach a halted state by polling its
status via query-cpu-stopped-state RTAS calls. It only polls for
25 iterations before giving up, however, and in the trace above this
results in the following being printed only .1 seconds after the
hotplug worker thread begins processing the unplug request:

  [ 1538.253044] pseries-hotplug-cpu: Attempting to remove CPU <NULL>, drc index: 1000013a
  [ 1538.360259] Querying DEAD? cpu 314 (314) shows 2

At that point the worker thread assumes the unplugged CPU is in some
unknown/dead state and procedes with the cleanup, causing the race with
the XIVE cleanup code executed by the unplugged CPU.

Fix this by inserting an msleep() after each RTAS call to avoid
pseries_cpu_die() returning prematurely, and double the number of
attempts so we wait at least a total of 5 seconds. While this isn't an
ideal solution, it is similar to how we dealt with a similar issue for
cede_offline mode in the past (940ce422a3).

Fixes: eac1e731b59ee ("powerpc/xive: guest exploitation of the XIVE interrupt controller")
Bugzilla: https://bugzilla.redhat.com/show_bug.cgi?id=1856588
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Cedric Le Goater <clg@kaod.org>
Cc: Greg Kurz <groug@kaod.org>
Cc: Nathan Lynch <nathanl@linux.ibm.com>
Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
---
 arch/powerpc/platforms/pseries/hotplug-cpu.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
index c6e0d8abf75e..3cb172758052 100644
--- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
+++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
@@ -111,13 +111,12 @@ static void pseries_cpu_die(unsigned int cpu)
 	int cpu_status = 1;
 	unsigned int pcpu = get_hard_smp_processor_id(cpu);
 
-	for (tries = 0; tries < 25; tries++) {
+	for (tries = 0; tries < 50; tries++) {
 		cpu_status = smp_query_cpu_stopped(pcpu);
 		if (cpu_status == QCSS_STOPPED ||
 		    cpu_status == QCSS_HARDWARE_ERROR)
 			break;
-		cpu_relax();
-
+		msleep(100);
 	}
 
 	if (cpu_status != 0) {
-- 
2.17.1

