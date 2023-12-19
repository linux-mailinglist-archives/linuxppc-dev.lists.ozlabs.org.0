Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7837B818783
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Dec 2023 13:32:54 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ogPokliN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Svbgm18Q8z3cVm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Dec 2023 23:32:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ogPokliN;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Svbfx2sFGz2xYt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Dec 2023 23:32:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1702989128;
	bh=yegy5KvHAjVR/3lUPtBaK8gT7xS7yxnnzH8gSTQaNjU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ogPokliNma+UCVMcfxvIV7oxKkXpzS8O7GpG2MFI3U3QwpBJnhuRXZ5G9G+UL5+WA
	 h9dEoH+0QtZwmbDIZ3BC/Zi+JJ3RK1ISYnDsTa19zPr8qMmFeXSvvIqJUNElABkWvK
	 yUo81kw3/oLJ6+SxTk2b8+nZ/cF+12wpJX1M57zdF1/AplmLIVFkwUyEmW+Ynq2HBN
	 ai2lA8291/po9+dIZ2fesQ/IUNxPNZTe9ggDLqs8bZeHMv+js9otOwdpnhcQBKLQq/
	 zvMHlQ1PIiMN+T77hXord8kqiLhkBKhs1e8pnQRiPytvcJgZx7JLSYDuT9MsfNatti
	 IgSGpmuUcQ3Iw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Svbfw1vtbz4wdD;
	Tue, 19 Dec 2023 23:32:08 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/64s: Increase default stack size to 32KB
In-Reply-To: <20231215124449.317597-1-mpe@ellerman.id.au>
References: <20231215124449.317597-1-mpe@ellerman.id.au>
Date: Tue, 19 Dec 2023 23:32:07 +1100
Message-ID: <87ttoel6ew.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:
> There are reports of kernels crashing due to stack overflow while
> running OpenShift (Kubernetes). The primary contributor to the stack
> usage seems to be openvswitch, which is used by OVN-Kubernetes (based on
> OVN (Open Virtual Network)), but NFS also contributes in some stack
> traces.

For the archives here's an example trace.

This comes from the openshift CI:
  https://prow.ci.openshift.org/view/gs/origin-ci-test/logs/periodic-ci-openshift-multiarch-master-nightly-4.14-ocp-e2e-ovn-remote-libvirt-ppc64le/1703597644732960768

Which links through to the kdump.tar:
  https://gcsweb-ci.apps.ci.l2s4.p1.openshiftapps.com/gcs/origin-ci-test/logs/periodic-ci-openshift-multiarch-master-nightly-4.14-ocp-e2e-ovn-remote-libvirt-ppc64le/1703597644732960768/artifacts/ocp-e2e-ovn-remote-libvirt-ppc64le/ipi-conf-debug-kdump-gather-logs/artifacts/kdump.tar

Which contains vmcore-dmesg.txt, which includes this trace:

[ 1805.324030] do_IRQ: stack overflow: 1808
[ 1805.324179] CPU: 0 PID: 263384 Comm: mount.nfs Kdump: loaded Not tainted 5.14.0-284.32.1.el9_2.ppc64le #1
[ 1805.324184] Call Trace:
[ 1805.324186] [c00000037d4806d0] [c0000000008427d0] dump_stack_lvl+0x74/0xa8 (unreliable)
[ 1805.324199] [c00000037d480710] [c000000000016bbc] __do_IRQ+0x11c/0x130
[ 1805.324205] [c00000037d4807a0] [c000000000016c10] do_IRQ+0x40/0xa0
[ 1805.324210] [c00000037d4807d0] [c000000000009080] hardware_interrupt_common_virt+0x210/0x220
[ 1805.324215] --- interrupt: 500 at slab_pre_alloc_hook.constprop.0+0x7c/0x340
[ 1805.324221] NIP:  c0000000004feb3c LR: c0000000004feb24 CTR: c00000000092b770
[ 1805.324223] REGS: c00000037d480840 TRAP: 0500   Not tainted  (5.14.0-284.32.1.el9_2.ppc64le)
[ 1805.324226] MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 24424442  XER: 00000000
[ 1805.324240] CFAR: c00000000045ef8c IRQMASK: 0 
GPR00: c0000000004feb24 c00000037d480ae0 c000000002b12700 0000000000000000 
GPR04: 0000000000000a20 c00000037d480b60 0000000000000001 0000000000000a20 
GPR08: c00000000133ca80 0000000000000000 0000000000000028 0000000000004000 
GPR12: c00000000092b770 c000000002ea0000 0000000000000000 0000000000000000 
GPR16: 0000000000000005 0000000000000040 000000000000012e c0000000566930e0 
GPR20: 0000000000000008 0000000000000000 c0000000566930e0 0000000000000000 
GPR24: c00000000092bac4 c000000003010400 c00000037d480b60 0000000000000001 
GPR28: 0000000000000000 0000000000000a20 0000000000000000 c000000003010400 
[ 1805.324284] NIP [c0000000004feb3c] slab_pre_alloc_hook.constprop.0+0x7c/0x340
[ 1805.324288] LR [c0000000004feb24] slab_pre_alloc_hook.constprop.0+0x64/0x340
[ 1805.324291] --- interrupt: 500
[ 1805.324292] [c00000037d480ae0] [0000000000000000] 0x0 (unreliable)
[ 1805.324298] [c00000037d480b40] [c00000000050560c] __kmalloc+0x8c/0x5e0
[ 1805.324302] [c00000037d480bc0] [c00000000092bac4] virtqueue_add_outbuf+0x354/0xac0
[ 1805.324307] [c00000037d480cc0] [c0080000011b3a84] xmit_skb+0x1dc/0x350 [virtio_net]
[ 1805.324317] [c00000037d480d50] [c0080000011b3ccc] start_xmit+0xd4/0x3b0 [virtio_net]
[ 1805.324321] [c00000037d480e00] [c000000000c4baac] dev_hard_start_xmit+0x11c/0x280
[ 1805.324327] [c00000037d480e80] [c000000000cf1c8c] sch_direct_xmit+0xec/0x330
[ 1805.324332] [c00000037d480f20] [c000000000c4a03c] __dev_xmit_skb+0x41c/0xa80
[ 1805.324336] [c00000037d480f90] [c000000000c4c194] __dev_queue_xmit+0x414/0x950
[ 1805.324340] [c00000037d481070] [c008000002abdfdc] ovs_vport_send+0xb4/0x210 [openvswitch]
[ 1805.324351] [c00000037d4810f0] [c008000002aa14a4] do_output+0x7c/0x200 [openvswitch]
[ 1805.324359] [c00000037d481140] [c008000002aa33b0] do_execute_actions+0xe48/0xeb0 [openvswitch]
[ 1805.324366] [c00000037d481300] [c008000002aa3800] ovs_execute_actions+0x78/0x1f0 [openvswitch]
[ 1805.324373] [c00000037d481380] [c008000002aa970c] ovs_dp_process_packet+0xb4/0x2e0 [openvswitch]
[ 1805.324380] [c00000037d481450] [c008000002abde84] ovs_vport_receive+0x8c/0x130 [openvswitch]
[ 1805.324388] [c00000037d481660] [c008000002abe638] internal_dev_xmit+0x40/0xd0 [openvswitch]
[ 1805.324396] [c00000037d481690] [c000000000c4baac] dev_hard_start_xmit+0x11c/0x280
[ 1805.324401] [c00000037d481710] [c000000000c4c3b4] __dev_queue_xmit+0x634/0x950
[ 1805.324405] [c00000037d4817f0] [c000000000d50810] neigh_hh_output+0xd0/0x180
[ 1805.324410] [c00000037d481840] [c000000000d516ec] ip_finish_output2+0x31c/0x5c0
[ 1805.324415] [c00000037d4818e0] [c000000000d53f94] ip_local_out+0x64/0x90
[ 1805.324419] [c00000037d481920] [c000000000dd83e4] iptunnel_xmit+0x194/0x290
[ 1805.324423] [c00000037d4819c0] [c008000003160408] udp_tunnel_xmit_skb+0x100/0x140 [udp_tunnel]
[ 1805.324429] [c00000037d481a80] [c008000003203a54] geneve_xmit_skb+0x34c/0x610 [geneve]
[ 1805.324434] [c00000037d481bb0] [c00800000320596c] geneve_xmit+0x94/0x1e8 [geneve]
[ 1805.324438] [c00000037d481c30] [c000000000c4baac] dev_hard_start_xmit+0x11c/0x280
[ 1805.324442] [c00000037d481cb0] [c000000000c4c3b4] __dev_queue_xmit+0x634/0x950
[ 1805.324446] [c00000037d481d90] [c008000002abdfdc] ovs_vport_send+0xb4/0x210 [openvswitch]
[ 1805.324454] [c00000037d481e10] [c008000002aa14a4] do_output+0x7c/0x200 [openvswitch]
[ 1805.324461] [c00000037d481e60] [c008000002aa33b0] do_execute_actions+0xe48/0xeb0 [openvswitch]
[ 1805.324468] [c00000037d482020] [c008000002aa3800] ovs_execute_actions+0x78/0x1f0 [openvswitch]
[ 1805.324475] [c00000037d4820a0] [c008000002aa970c] ovs_dp_process_packet+0xb4/0x2e0 [openvswitch]
[ 1805.324482] [c00000037d482170] [c008000002aa36e0] clone_execute+0x2c8/0x370 [openvswitch]
[ 1805.324489] [c00000037d482210] [c008000002aa2a20] do_execute_actions+0x4b8/0xeb0 [openvswitch]
[ 1805.324495] [c00000037d4823d0] [c008000002aa3800] ovs_execute_actions+0x78/0x1f0 [openvswitch]
[ 1805.324502] [c00000037d482450] [c008000002aa970c] ovs_dp_process_packet+0xb4/0x2e0 [openvswitch]
[ 1805.324509] [c00000037d482520] [c008000002abde84] ovs_vport_receive+0x8c/0x130 [openvswitch]
[ 1805.324516] [c00000037d482730] [c008000002abe638] internal_dev_xmit+0x40/0xd0 [openvswitch]
[ 1805.324524] [c00000037d482760] [c000000000c4baac] dev_hard_start_xmit+0x11c/0x280
[ 1805.324528] [c00000037d4827e0] [c000000000c4c3b4] __dev_queue_xmit+0x634/0x950
[ 1805.324532] [c00000037d4828c0] [c000000000d50810] neigh_hh_output+0xd0/0x180
[ 1805.324536] [c00000037d482910] [c000000000d516ec] ip_finish_output2+0x31c/0x5c0
[ 1805.324541] [c00000037d4829b0] [c000000000d54440] __ip_queue_xmit+0x1b0/0x4f0
[ 1805.324545] [c00000037d482a40] [c000000000d821e0] __tcp_transmit_skb+0x450/0x9a0
[ 1805.324549] [c00000037d482b10] [c000000000d84230] tcp_write_xmit+0x4e0/0xb40
[ 1805.324553] [c00000037d482be0] [c000000000d848d4] __tcp_push_pending_frames+0x44/0x130
[ 1805.324557] [c00000037d482c50] [c000000000d63aac] __tcp_sock_set_cork.part.0+0x8c/0xb0
[ 1805.324561] [c00000037d482c80] [c000000000d63b48] tcp_sock_set_cork+0x78/0xa0
[ 1805.324565] [c00000037d482cb0] [c0080000061b2acc] xs_tcp_send_request+0x2d4/0x430 [sunrpc]
[ 1805.324594] [c00000037d482e50] [c0080000061ab120] xprt_request_transmit.constprop.0+0xa8/0x3c0 [sunrpc]
[ 1805.324619] [c00000037d482eb0] [c0080000061acc74] xprt_transmit+0x12c/0x260 [sunrpc]
[ 1805.324644] [c00000037d482f20] [c0080000061a1de8] call_transmit+0xd0/0x100 [sunrpc]
[ 1805.324667] [c00000037d482f50] [c0080000061c8dc4] __rpc_execute+0xec/0x570 [sunrpc]
[ 1805.324696] [c00000037d482fd0] [c0080000061d00e0] rpc_execute+0x168/0x1d0 [sunrpc]
[ 1805.324725] [c00000037d483010] [c0080000061a4a74] rpc_run_task+0x1cc/0x2a0 [sunrpc]
[ 1805.324754] [c00000037d483070] [c008000006013970] nfs4_call_sync_sequence+0x98/0x100 [nfsv4]
[ 1805.324811] [c00000037d483120] [c008000006013dec] _nfs4_server_capabilities+0xd4/0x3c0 [nfsv4]
[ 1805.324832] [c00000037d483210] [c00800000602036c] nfs4_server_capabilities+0x74/0xd0 [nfsv4]
[ 1805.324854] [c00000037d483270] [c008000006020404] nfs4_proc_get_root+0x3c/0x150 [nfsv4]
[ 1805.324876] [c00000037d4832f0] [c0080000062bee54] nfs_get_root+0xac/0x660 [nfs]
[ 1805.324907] [c00000037d483420] [c0080000062c7ccc] nfs_get_tree_common+0x104/0x5f0 [nfs]
[ 1805.324946] Kernel panic - not syncing: corrupted stack end detected inside scheduler
[ 1805.325103] CPU: 0 PID: 263384 Comm: mount.nfs Kdump: loaded Not tainted 5.14.0-284.32.1.el9_2.ppc64le #1
[ 1805.325316] Call Trace:
[ 1805.325368] [c00000037d482c50] [c0000000008427d0] dump_stack_lvl+0x74/0xa8 (unreliable)
[ 1805.325549] [c00000037d482c90] [c0000000001492b4] panic+0x160/0x3ec
[ 1805.325706] [c00000037d482d30] [c000000000efce90] __schedule+0x710/0x720
[ 1805.325838] [c00000037d482e00] [c000000000efcf7c] schedule+0x3c/0xa0
[ 1805.325978] [c00000037d482e30] [c0080000061c4f84] rpc_wait_bit_killable+0x3c/0x110 [sunrpc]
[ 1805.326185] [c00000037d482e60] [c000000000efd664] __wait_on_bit+0xd4/0x210
[ 1805.326325] [c00000037d482ee0] [c000000000efd840] out_of_line_wait_on_bit+0xa0/0xd0
[ 1805.326502] [c00000037d482f50] [c0080000061c8e54] __rpc_execute+0x17c/0x570 [sunrpc]
[ 1805.326751] [c00000037d482fd0] [c0080000061d00e0] rpc_execute+0x168/0x1d0 [sunrpc]
[ 1805.326936] [c00000037d483010] [c0080000061a4a74] rpc_run_task+0x1cc/0x2a0 [sunrpc]
[ 1805.327120] [c00000037d483070] [c008000006013970] nfs4_call_sync_sequence+0x98/0x100 [nfsv4]
[ 1805.327346] [c00000037d483120] [c008000006013dec] _nfs4_server_capabilities+0xd4/0x3c0 [nfsv4]
[ 1805.327548] [c00000037d483210] [c00800000602036c] nfs4_server_capabilities+0x74/0xd0 [nfsv4]
[ 1805.327747] [c00000037d483270] [c008000006020404] nfs4_proc_get_root+0x3c/0x150 [nfsv4]
[ 1805.327972] [c00000037d4832f0] [c0080000062bee54] nfs_get_root+0xac/0x660 [nfs]
[ 1805.328174] [c00000037d483420] [c0080000062c7ccc] nfs_get_tree_common+0x104/0x5f0 [nfs]
[ 1805.328366] [c00000037d4834b0] [c0080000062ec6f8] nfs_get_tree+0x90/0xc0 [nfs]
[ 1805.328556] [c00000037d4834e0] [c00000000056cd38] vfs_get_tree+0x48/0x160
[ 1805.328715] [c00000037d483560] [c0080000062d8b68] nfs_do_submount+0x170/0x210 [nfs]
[ 1805.328911] [c00000037d483600] [c008000006055b58] nfs4_submount+0x250/0x360 [nfsv4]
[ 1805.329115] [c00000037d4836b0] [c0080000062d8eac] nfs_d_automount+0x194/0x2d0 [nfs]
[ 1805.329303] [c00000037d483710] [c00000000057c7f4] __traverse_mounts+0x114/0x330
[ 1805.329459] [c00000037d483770] [c000000000583d54] step_into+0x364/0x4d0
[ 1805.329581] [c00000037d4837f0] [c00000000058465c] walk_component+0x8c/0x300
[ 1805.329700] [c00000037d483870] [c000000000585868] path_lookupat+0xa8/0x260
[ 1805.329819] [c00000037d4838c0] [c000000000586ab8] filename_lookup+0xc8/0x230
[ 1805.329962] [c00000037d483a00] [c000000000586d18] vfs_path_lookup+0x68/0xc0
[ 1805.330093] [c00000037d483a60] [c0000000005b0760] mount_subtree+0xd0/0x1e0
[ 1805.330214] [c00000037d483ad0] [c0080000060496b8] do_nfs4_mount+0x280/0x520 [nfsv4]
[ 1805.330370] [c00000037d483ba0] [c0080000060499b8] nfs4_try_get_tree+0x60/0x140 [nfsv4]
[ 1805.330526] [c00000037d483c20] [c0080000062ec6c8] nfs_get_tree+0x60/0xc0 [nfs]
[ 1805.330681] [c00000037d483c50] [c00000000056cd38] vfs_get_tree+0x48/0x160
[ 1805.330821] [c00000037d483cd0] [c0000000005ae154] do_new_mount+0x204/0x3c0
[ 1805.330972] [c00000037d483d40] [c0000000005af8f8] sys_mount+0x168/0x1c0
[ 1805.331086] [c00000037d483db0] [c00000000002f544] system_call_exception+0x164/0x310
[ 1805.331227] [c00000037d483e10] [c00000000000bfe8] system_call_vectored_common+0xe8/0x278
[ 1805.331367] --- interrupt: 3000 at 0x7fffb235f4d0


cheers
