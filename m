Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 991A921796
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2019 13:22:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4555V914zXzDqDQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2019 21:22:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4555Sl26dqzDqCT
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2019 21:20:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4555Sk1dFjz9s3q;
 Fri, 17 May 2019 21:20:54 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: srikanth <sraithal@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: PROBLEM: Power9: kernel oops on memory hotunplug from ppc64le
 guest
In-Reply-To: <16a7a635-c592-27e2-75b4-d02071833278@linux.vnet.ibm.com>
References: <16a7a635-c592-27e2-75b4-d02071833278@linux.vnet.ibm.com>
Date: Fri, 17 May 2019 21:20:53 +1000
Message-ID: <87h89t8gyy.fsf@concordia.ellerman.id.au>
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
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
 bharata@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

srikanth <sraithal@linux.vnet.ibm.com> writes:
> Hello,
>
> On power9 host, performing memory hotunplug from ppc64le guest results=20
> in kernel oops.

Thanks for the report.

Did this used to work in the past? If so what is the last version that
worked?

> Kernel used : https://github.com/torvalds/linux/tree/v5.1 built using=20
> ppc64le_defconfig for host and ppc64le_guest_defconfig for guest.
>
> Recreation steps:
>
> 1. Boot a guest with below mem configuration:
>  =C2=A0 <maxMemory slots=3D'32' unit=3D'KiB'>33554432</maxMemory>
>  =C2=A0 <memory unit=3D'KiB'>8388608</memory>
>  =C2=A0 <currentMemory unit=3D'KiB'>4194304</currentMemory>
>  =C2=A0 <cpu>
>  =C2=A0=C2=A0=C2=A0 <numa>
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <cell id=3D'0' cpus=3D'0-31' memory=3D'83=
88608' unit=3D'KiB'/>
>  =C2=A0=C2=A0=C2=A0 </numa>
>  =C2=A0 </cpu>
>
> 2. From host hotplug 8G memory -> verify memory hotadded succesfully ->=20
> now reboot guest -> once guest comes back try to unplug 8G memory

I assume the reboot is required to trigger the bug? ie. if you unplug
without rebooting it doesn't crash?

> mem.xml used:
> <memory model=3D'dimm'>
> <target>
> <size unit=3D'GiB'>8</size>
> <node>0</node>
> </target>
> </memory>
>
> Memory attach and detach commands used:
>  =C2=A0=C2=A0=C2=A0 virsh attach-device vm1 ./mem.xml --live
>  =C2=A0=C2=A0=C2=A0 virsh detach-device vm1 ./mem.xml --live
>
> Trace seen inside guest after unplug, guest just hangs there forever:
>
> [=C2=A0=C2=A0 21.962986] kernel BUG at arch/powerpc/mm/pgtable-frag.c:113!
> [=C2=A0=C2=A0 21.963064] Oops: Exception in kernel mode, sig: 5 [#1]
> [=C2=A0=C2=A0 21.963090] LE PAGE_SIZE=3D64K MMU=3DRadix MMU=3DHash SMP NR=
_CPUS=3D2048 NUMA=20
> pSeries
> [=C2=A0=C2=A0 21.963131] Modules linked in: xt_tcpudp iptable_filter squa=
shfs fuse=20
> vmx_crypto ib_iser rdma_cm iw_cm ib_cm ib_core libiscsi=20
> scsi_transport_iscsi ip_tables x_tables autofs4 btrfs zstd_decompress=20
> zstd_compress lzo_compress raid10 raid456 async_raid6_recov async_memcpy=
=20
> async_pq async_xor async_tx xor raid6_pq multipath crc32c_vpmsum
> [=C2=A0=C2=A0 21.963281] CPU: 11 PID: 316 Comm: kworker/u64:5 Kdump: load=
ed Not=20
> tainted 5.1.0-dirty #2
> [=C2=A0=C2=A0 21.963323] Workqueue: pseries hotplug workque pseries_hp_wo=
rk_fn
> [=C2=A0=C2=A0 21.963355] NIP:=C2=A0 c000000000079e18 LR: c000000000c79308=
 CTR:=20
> 0000000000008000
> [=C2=A0=C2=A0 21.963392] REGS: c0000003f88034f0 TRAP: 0700=C2=A0=C2=A0 No=
t tainted (5.1.0-dirty)
> [=C2=A0=C2=A0 21.963422] MSR:=C2=A0 800000000282b033 <SF,VEC,VSX,EE,FP,ME=
,IR,DR,RI,LE>=C2=A0=20
> CR: 28002884=C2=A0 XER: 20040000
> [=C2=A0=C2=A0 21.963470] CFAR: c000000000c79304 IRQMASK: 0
> [=C2=A0=C2=A0 21.963470] GPR00: c000000000c79308 c0000003f8803780 c000000=
001521000=20
> 0000000000fff8c0

Can you try not to word wrap these, it makes them much harder to read.

There's some instructions here on configuring Thunderbird:
  https://www.kernel.org/doc/html/latest/process/email-clients.html#thunder=
bird-gui

> [=C2=A0=C2=A0 21.963470] GPR04: 0000000000000001 00000000ffe30005 0000000=
000000005=20
> 0000000000000020
> [=C2=A0=C2=A0 21.963470] GPR08: 0000000000000000 0000000000000001 c00a000=
000fff8e0=20
> c0000000016d21a0
> [=C2=A0=C2=A0 21.963470] GPR12: c0000000016e7b90 c000000007ff2700 c00a000=
000a00000=20
> c0000003ffe30100
> [=C2=A0=C2=A0 21.963470] GPR16: c0000003ffe30000 c0000000014aa4de c00a000=
0009f0000=20
> c0000000016d21b0
> [=C2=A0=C2=A0 21.963470] GPR20: c0000000014de588 0000000000000001 c000000=
0016d21b8=20
> c00a000000a00000
> [=C2=A0=C2=A0 21.963470] GPR24: 0000000000000000 ffffffffffffffff c00a000=
000a00000=20
> c0000003ffe96000
> [=C2=A0=C2=A0 21.963470] GPR28: c00a000000a00000 c00a000000a00000 c000000=
3fffec000=20
> c00a000000fff8c0
> [=C2=A0=C2=A0 21.963802] NIP [c000000000079e18] pte_fragment_free+0x48/0x=
d0
> [=C2=A0=C2=A0 21.963838] LR [c000000000c79308] remove_pagetable+0x49c/0x5=
b4
> [=C2=A0=C2=A0 21.963873] Call Trace:
> [=C2=A0=C2=A0 21.963890] [c0000003f8803780] [c0000003ffe997f0] 0xc0000003=
ffe997f0=20
> (unreliable)
> [=C2=A0=C2=A0 21.963933] [c0000003f88037b0] [0000000000000000] (null)
> [=C2=A0=C2=A0 21.963969] [c0000003f88038c0] [c00000000006f038]=20
> vmemmap_free+0x218/0x2e0
> [=C2=A0=C2=A0 21.964006] [c0000003f8803940] [c00000000036f100]=20
> sparse_remove_one_section+0xd0/0x138
> [=C2=A0=C2=A0 21.964050] [c0000003f8803980] [c000000000383a50]=20
> __remove_pages+0x410/0x560
> [=C2=A0=C2=A0 21.964093] [c0000003f8803a90] [c000000000c784d8]=20
> arch_remove_memory+0x68/0xdc
> [=C2=A0=C2=A0 21.964136] [c0000003f8803ad0] [c000000000385d74]=20
> __remove_memory+0xc4/0x110
> [=C2=A0=C2=A0 21.964180] [c0000003f8803b10] [c0000000000d44e4]=20
> dlpar_remove_lmb+0x94/0x140
> [=C2=A0=C2=A0 21.964223] [c0000003f8803b50] [c0000000000d52b4]=20
> dlpar_memory+0x464/0xd00
> [=C2=A0=C2=A0 21.964259] [c0000003f8803be0] [c0000000000cd5c0]=20
> handle_dlpar_errorlog+0xc0/0x190
> [=C2=A0=C2=A0 21.964303] [c0000003f8803c50] [c0000000000cd6bc]=20
> pseries_hp_work_fn+0x2c/0x60
> [=C2=A0=C2=A0 21.964346] [c0000003f8803c80] [c00000000013a4a0]=20
> process_one_work+0x2b0/0x5a0
> [=C2=A0=C2=A0 21.964388] [c0000003f8803d10] [c00000000013a818]=20
> worker_thread+0x88/0x610
> [=C2=A0=C2=A0 21.964434] [c0000003f8803db0] [c000000000143884] kthread+0x=
1a4/0x1b0
> [=C2=A0=C2=A0 21.964468] [c0000003f8803e20] [c00000000000bdc4]=20
> ret_from_kernel_thread+0x5c/0x78
> [=C2=A0=C2=A0 21.964506] Instruction dump:
> [=C2=A0=C2=A0 21.964527] fbe1fff8 f821ffd1 78638502 78633664 ebe90000 7ff=
f1a14=20
> 395f0020 813f0020
> [=C2=A0=C2=A0 21.964569] 7d2907b4 7d2900d0 79290fe0 69290001 <0b090000> 7=
c0004ac=20
> 7d205028 3129ffff
> [=C2=A0=C2=A0 21.964613] ---[ end trace aaa571aa1636fee6 ]---
> [=C2=A0=C2=A0 21.966349]
> [=C2=A0=C2=A0 21.966383] Sending IPI to other CPUs
> [=C2=A0=C2=A0 21.978335] IPI complete
> [=C2=A0=C2=A0 21.981354] kexec: Starting switchover sequence.
> I'm in purgatory

It's not hung here, it's just not executing what we want it to :)

If you break into the qemu monitor and issue `info registers` it should
give you some idea of what's going on.

cheers
