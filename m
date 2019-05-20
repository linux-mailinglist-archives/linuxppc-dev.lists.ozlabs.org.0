Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E3C229D4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2019 04:03:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 456hyX6CZwzDqJk
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2019 12:03:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 456hwx48TszDqGg
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 May 2019 12:02:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 456hwv6bSbz9sB8;
 Mon, 20 May 2019 12:02:23 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: bharata@linux.ibm.com, srikanth <sraithal@linux.vnet.ibm.com>
Subject: Re: PROBLEM: Power9: kernel oops on memory hotunplug from ppc64le
 guest
In-Reply-To: <20190518141434.GA22939@in.ibm.com>
References: <16a7a635-c592-27e2-75b4-d02071833278@linux.vnet.ibm.com>
 <20190518141434.GA22939@in.ibm.com>
Date: Mon, 20 May 2019 12:02:23 +1000
Message-ID: <878sv1993k.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: aneesh.kumar@linux.ibm.com, linux-kernel@vger.kernel.org, npiggin@gmail.com,
 linux-next@vger.kernel.org, bharata@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Bharata B Rao <bharata@linux.ibm.com> writes:
> On Thu, May 16, 2019 at 07:44:20PM +0530, srikanth wrote:
>> Hello,
>>=20
>> On power9 host, performing memory hotunplug from ppc64le guest results in
>> kernel oops.
>>=20
>> Kernel used : https://github.com/torvalds/linux/tree/v5.1 built using
>> ppc64le_defconfig for host and ppc64le_guest_defconfig for guest.
>>=20
>> Recreation steps:
>>=20
>> 1. Boot a guest with below mem configuration:
>> =C2=A0 <maxMemory slots=3D'32' unit=3D'KiB'>33554432</maxMemory>
>> =C2=A0 <memory unit=3D'KiB'>8388608</memory>
>> =C2=A0 <currentMemory unit=3D'KiB'>4194304</currentMemory>
>> =C2=A0 <cpu>
>> =C2=A0=C2=A0=C2=A0 <numa>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <cell id=3D'0' cpus=3D'0-31' memory=3D'83=
88608' unit=3D'KiB'/>
>> =C2=A0=C2=A0=C2=A0 </numa>
>> =C2=A0 </cpu>
>>=20
>> 2. From host hotplug 8G memory -> verify memory hotadded succesfully -> =
now
>> reboot guest -> once guest comes back try to unplug 8G memory
>>=20
>> mem.xml used:
>> <memory model=3D'dimm'>
>> <target>
>> <size unit=3D'GiB'>8</size>
>> <node>0</node>
>> </target>
>> </memory>
>>=20
>> Memory attach and detach commands used:
>> =C2=A0=C2=A0=C2=A0 virsh attach-device vm1 ./mem.xml --live
>> =C2=A0=C2=A0=C2=A0 virsh detach-device vm1 ./mem.xml --live
>>=20
>> Trace seen inside guest after unplug, guest just hangs there forever:
>>=20
>> [=C2=A0=C2=A0 21.962986] kernel BUG at arch/powerpc/mm/pgtable-frag.c:11=
3!
>> [=C2=A0=C2=A0 21.963064] Oops: Exception in kernel mode, sig: 5 [#1]
>> [=C2=A0=C2=A0 21.963090] LE PAGE_SIZE=3D64K MMU=3DRadix MMU=3DHash SMP N=
R_CPUS=3D2048 NUMA
>> pSeries
>> [=C2=A0=C2=A0 21.963131] Modules linked in: xt_tcpudp iptable_filter squ=
ashfs fuse
>> vmx_crypto ib_iser rdma_cm iw_cm ib_cm ib_core libiscsi scsi_transport_i=
scsi
>> ip_tables x_tables autofs4 btrfs zstd_decompress zstd_compress lzo_compr=
ess
>> raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx
>> xor raid6_pq multipath crc32c_vpmsum
>> [=C2=A0=C2=A0 21.963281] CPU: 11 PID: 316 Comm: kworker/u64:5 Kdump: loa=
ded Not
>> tainted 5.1.0-dirty #2
>> [=C2=A0=C2=A0 21.963323] Workqueue: pseries hotplug workque pseries_hp_w=
ork_fn
>> [=C2=A0=C2=A0 21.963355] NIP:=C2=A0 c000000000079e18 LR: c000000000c7930=
8 CTR:
>> 0000000000008000
>> [=C2=A0=C2=A0 21.963392] REGS: c0000003f88034f0 TRAP: 0700=C2=A0=C2=A0 N=
ot tainted (5.1.0-dirty)
>> [=C2=A0=C2=A0 21.963422] MSR:=C2=A0 800000000282b033 <SF,VEC,VSX,EE,FP,M=
E,IR,DR,RI,LE>=C2=A0 CR:
>> 28002884=C2=A0 XER: 20040000
>> [=C2=A0=C2=A0 21.963470] CFAR: c000000000c79304 IRQMASK: 0
>> [=C2=A0=C2=A0 21.963470] GPR00: c000000000c79308 c0000003f8803780 c00000=
0001521000
>> 0000000000fff8c0
>> [=C2=A0=C2=A0 21.963470] GPR04: 0000000000000001 00000000ffe30005 000000=
0000000005
>> 0000000000000020
>> [=C2=A0=C2=A0 21.963470] GPR08: 0000000000000000 0000000000000001 c00a00=
0000fff8e0
>> c0000000016d21a0
>> [=C2=A0=C2=A0 21.963470] GPR12: c0000000016e7b90 c000000007ff2700 c00a00=
0000a00000
>> c0000003ffe30100
>> [=C2=A0=C2=A0 21.963470] GPR16: c0000003ffe30000 c0000000014aa4de c00a00=
00009f0000
>> c0000000016d21b0
>> [=C2=A0=C2=A0 21.963470] GPR20: c0000000014de588 0000000000000001 c00000=
00016d21b8
>> c00a000000a00000
>> [=C2=A0=C2=A0 21.963470] GPR24: 0000000000000000 ffffffffffffffff c00a00=
0000a00000
>> c0000003ffe96000
>> [=C2=A0=C2=A0 21.963470] GPR28: c00a000000a00000 c00a000000a00000 c00000=
03fffec000
>> c00a000000fff8c0
>> [=C2=A0=C2=A0 21.963802] NIP [c000000000079e18] pte_fragment_free+0x48/0=
xd0
>> [=C2=A0=C2=A0 21.963838] LR [c000000000c79308] remove_pagetable+0x49c/0x=
5b4
>> [=C2=A0=C2=A0 21.963873] Call Trace:
>> [=C2=A0=C2=A0 21.963890] [c0000003f8803780] [c0000003ffe997f0] 0xc000000=
3ffe997f0
>> (unreliable)
>> [=C2=A0=C2=A0 21.963933] [c0000003f88037b0] [0000000000000000] (null)
>> [=C2=A0=C2=A0 21.963969] [c0000003f88038c0] [c00000000006f038]
>> vmemmap_free+0x218/0x2e0
>> [=C2=A0=C2=A0 21.964006] [c0000003f8803940] [c00000000036f100]
>> sparse_remove_one_section+0xd0/0x138
>> [=C2=A0=C2=A0 21.964050] [c0000003f8803980] [c000000000383a50]
>> __remove_pages+0x410/0x560
>> [=C2=A0=C2=A0 21.964093] [c0000003f8803a90] [c000000000c784d8]
>> arch_remove_memory+0x68/0xdc
>> [=C2=A0=C2=A0 21.964136] [c0000003f8803ad0] [c000000000385d74]
>> __remove_memory+0xc4/0x110
>> [=C2=A0=C2=A0 21.964180] [c0000003f8803b10] [c0000000000d44e4]
>> dlpar_remove_lmb+0x94/0x140
>> [=C2=A0=C2=A0 21.964223] [c0000003f8803b50] [c0000000000d52b4]
>> dlpar_memory+0x464/0xd00
>> [=C2=A0=C2=A0 21.964259] [c0000003f8803be0] [c0000000000cd5c0]
>> handle_dlpar_errorlog+0xc0/0x190
>> [=C2=A0=C2=A0 21.964303] [c0000003f8803c50] [c0000000000cd6bc]
>> pseries_hp_work_fn+0x2c/0x60
>> [=C2=A0=C2=A0 21.964346] [c0000003f8803c80] [c00000000013a4a0]
>> process_one_work+0x2b0/0x5a0
>> [=C2=A0=C2=A0 21.964388] [c0000003f8803d10] [c00000000013a818]
>> worker_thread+0x88/0x610
>> [=C2=A0=C2=A0 21.964434] [c0000003f8803db0] [c000000000143884] kthread+0=
x1a4/0x1b0
>> [=C2=A0=C2=A0 21.964468] [c0000003f8803e20] [c00000000000bdc4]
>> ret_from_kernel_thread+0x5c/0x78
>> [=C2=A0=C2=A0 21.964506] Instruction dump:
>> [=C2=A0=C2=A0 21.964527] fbe1fff8 f821ffd1 78638502 78633664 ebe90000 7f=
ff1a14
>> 395f0020 813f0020
>> [=C2=A0=C2=A0 21.964569] 7d2907b4 7d2900d0 79290fe0 69290001 <0b090000> =
7c0004ac
>> 7d205028 3129ffff
>> [=C2=A0=C2=A0 21.964613] ---[ end trace aaa571aa1636fee6 ]---
>> [=C2=A0=C2=A0 21.966349]
>> [=C2=A0=C2=A0 21.966383] Sending IPI to other CPUs
>> [=C2=A0=C2=A0 21.978335] IPI complete
>> [=C2=A0=C2=A0 21.981354] kexec: Starting switchover sequence.
>> I'm in purgatory
>
> git bisect points to
>
> commit 4231aba000f5a4583dd9f67057aadb68c3eca99d
> Author: Nicholas Piggin <npiggin@gmail.com>
> Date:   Fri Jul 27 21:48:17 2018 +1000
>
>     powerpc/64s: Fix page table fragment refcount race vs speculative ref=
erences
>
>     The page table fragment allocator uses the main page refcount racily
>     with respect to speculative references. A customer observed a BUG due
>     to page table page refcount underflow in the fragment allocator. This
>     can be caused by the fragment allocator set_page_count stomping on a
>     speculative reference, and then the speculative failure handler
>     decrements the new reference, and the underflow eventually pops when
>     the page tables are freed.
>
>     Fix this by using a dedicated field in the struct page for the page
>     table fragment allocator.
>
>     Fixes: 5c1f6ee9a31c ("powerpc: Reduce PTE table memory wastage")
>     Cc: stable@vger.kernel.org # v3.10+

That's the commit that added the BUG_ON(), so prior to that you won't
see the crash.

cheers
