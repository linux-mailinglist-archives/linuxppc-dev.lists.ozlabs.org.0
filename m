Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A39248749
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 16:21:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWClg1tKPzDqcX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 00:21:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWCDX4S5jzDqVb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Aug 2020 23:58:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BWCDX2MPxz9sTT; Tue, 18 Aug 2020 23:58:19 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Roth <mdroth@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20200811161544.10513-1-mdroth@linux.vnet.ibm.com>
References: <20200811161544.10513-1-mdroth@linux.vnet.ibm.com>
Subject: Re: [PATCH v2] powerpc/pseries/hotplug-cpu: wait indefinitely for
 vCPU death
Message-Id: <159775907980.1766076.5723178364660464279.b4-ty@ellerman.id.au>
Date: Tue, 18 Aug 2020 23:58:19 +1000 (AEST)
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Greg Kurz <groug@kaod.org>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Cedric Le Goater <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 11 Aug 2020 11:15:44 -0500, Michael Roth wrote:
> For a power9 KVM guest with XIVE enabled, running a test loop
> where we hotplug 384 vcpus and then unplug them, the following traces
> can be seen (generally within a few loops) either from the unplugged
> vcpu:
> 
>   [ 1767.353447] cpu 65 (hwid 65) Ready to die...
>   [ 1767.952096] Querying DEAD? cpu 66 (66) shows 2
>   [ 1767.952311] list_del corruption. next->prev should be c00a000002470208, but was c00a000002470048
>   [ 1767.952322] ------------[ cut here ]------------
>   [ 1767.952323] kernel BUG at lib/list_debug.c:56!
>   [ 1767.952325] Oops: Exception in kernel mode, sig: 5 [#1]
>   [ 1767.952326] LE SMP NR_CPUS=2048 NUMA pSeries
>   [ 1767.952328] Modules linked in: fuse nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nf_tables_set nft_chain_nat_ipv6 nf_nat_ipv6 nft_chain_route_ipv6 nft_chain_nat_ipv4 nf_nat_ipv4 nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nft_chain_route_ipv4 ip6_tables nft_compat ip_set nf_tables nfnetlink uio_pdrv_genirq ip_tables xfs libcrc32c sd_mod sg xts vmx_crypto virtio_net net_failover failover virtio_scsi dm_multipath dm_mirror dm_region_hash dm_log dm_mod be2iscsi bnx2i cnic uio cxgb4i cxgb4 libcxgbi libcxgb qla4xxx iscsi_boot_sysfs iscsi_tcp libiscsi_tcp libiscsi scsi_transport_iscsi
>   [ 1767.952352] CPU: 66 PID: 0 Comm: swapper/66 Kdump: loaded Not tainted 4.18.0-221.el8.ppc64le #1
>   [ 1767.952354] NIP:  c0000000007ab50c LR: c0000000007ab508 CTR: 00000000000003ac
>   [ 1767.952355] REGS: c0000009e5a17840 TRAP: 0700   Not tainted  (4.18.0-221.el8.ppc64le)
>   [ 1767.952355] MSR:  800000000282b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 28000842  XER: 20040000
>   [ 1767.952360] CFAR: c0000000001ffe64 IRQMASK: 1
>   [ 1767.952360] GPR00: c0000000007ab508 c0000009e5a17ac0 c000000001ac0700 0000000000000054
>   [ 1767.952360] GPR04: c0000009f056cf90 c0000009f05f5628 c0000009ed40d654 c000000001c90700
>   [ 1767.952360] GPR08: 0000000000000007 c0000009f0573980 00000009ef2b0000 7562202c38303230
>   [ 1767.952360] GPR12: 0000000000000000 c0000007fff6ce80 c00a000002470208 0000000000000000
>   [ 1767.952360] GPR16: 0000000000000001 c0000009f05fbb00 0000000000000800 c0000009ff3d4980
>   [ 1767.952360] GPR20: c0000009f05fbb10 5deadbeef0000100 5deadbeef0000200 0000000000187961
>   [ 1767.952360] GPR24: c0000009e5a17b78 0000000000000000 0000000000000001 ffffffffffffffff
>   [ 1767.952360] GPR28: c00a000002470200 c0000009f05fbb10 c0000009f05fbb10 0000000000000000
>   [ 1767.952375] NIP [c0000000007ab50c] __list_del_entry_valid+0xac/0x100
>   [ 1767.952376] LR [c0000000007ab508] __list_del_entry_valid+0xa8/0x100
>   [ 1767.952377] Call Trace:
>   [ 1767.952378] [c0000009e5a17ac0] [c0000000007ab508] __list_del_entry_valid+0xa8/0x100 (unreliable)
>   [ 1767.952381] [c0000009e5a17b20] [c000000000476e18] free_pcppages_bulk+0x1f8/0x940
>   [ 1767.952383] [c0000009e5a17c20] [c00000000047a9a0] free_unref_page+0xd0/0x100
>   [ 1767.952386] [c0000009e5a17c50] [c0000000000bc2a8] xive_spapr_cleanup_queue+0x148/0x1b0
>   [ 1767.952388] [c0000009e5a17cf0] [c0000000000b96dc] xive_teardown_cpu+0x1bc/0x240
>   [ 1767.952391] [c0000009e5a17d30] [c00000000010bf28] pseries_mach_cpu_die+0x78/0x2f0
>   [ 1767.952393] [c0000009e5a17de0] [c00000000005c8d8] cpu_die+0x48/0x70
>   [ 1767.952394] [c0000009e5a17e00] [c000000000021cf0] arch_cpu_idle_dead+0x20/0x40
>   [ 1767.952397] [c0000009e5a17e20] [c0000000001b4294] do_idle+0x2f4/0x4c0
>   [ 1767.952399] [c0000009e5a17ea0] [c0000000001b46a8] cpu_startup_entry+0x38/0x40
>   [ 1767.952400] [c0000009e5a17ed0] [c00000000005c43c] start_secondary+0x7bc/0x8f0
>   [ 1767.952403] [c0000009e5a17f90] [c00000000000ac70] start_secondary_prolog+0x10/0x14
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/pseries/hotplug-cpu: wait indefinitely for vCPU death
      https://git.kernel.org/powerpc/c/801980f6497946048709b9b09771a1729551d705

cheers
