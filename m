Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D74485F80
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jan 2022 05:04:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JTt5h5kBLz3bT6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jan 2022 15:04:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=mlVmYprL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JTt4z0VM5z2xXd
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jan 2022 15:03:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=mlVmYprL; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JTt4s6vvCz4y41;
 Thu,  6 Jan 2022 15:03:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1641441822;
 bh=6YPwKRKwjitbgaxEVqFcVQMdDx8LYJnebdY6awqod/A=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=mlVmYprLuHfuzMaV/HgXmz9r0qfFRZ4O3pQx9TOKrFSXSL52OMyU7ULbXHWitz+1+
 7Xul8nv03KIPGGWV4umQKffBwJAceA57t5QxBl7QynlarJbA5Sbyx8Q1gpxwGNI1Cw
 jFwBnBj3gPFarVJdOoAylEpARE+TV5gtqUURj9/nqz+TKoJQ+Nrae1HfA4DYryZKag
 8Gdsu4Q1EcAmVZCrIjv/HmzE59h/M3IIXQW72JA3JtMLCxYhEJ3VtpCWEn2ROduPwe
 6BQbd6y/h6AYSqc1iO71mzzp+R6sdRhCOzt/07/kFeENo0cF4xXO+yuZD5+kL6MNW6
 sczfvVFVm0DsA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Lynch <nathanl@linux.ibm.com>, Kip Warner <kip@thevertigo.com>
Subject: Re: ppc64el kernel bug?
In-Reply-To: <87bl0pvcx9.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
References: <ab1cf0bfad75e06ee2a56ebcf435a977f463b2d6.camel@thevertigo.com>
 <87bl0pvcx9.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
Date: Thu, 06 Jan 2022 15:03:34 +1100
Message-ID: <87pmp533zd.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Tulio Magno Quites Machado Filho <tuliom@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch <nathanl@linux.ibm.com> writes:
> Kip Warner <kip@thevertigo.com> writes:
>>    Dec 25 06:52:52 romulus-server kernel: [28835.277591] BUG: Unable to =
handle kernel data access on write at 0x132b47d38499fd58
>>    Dec 25 06:52:52 romulus-server kernel: [28835.277624] Faulting instru=
ction address: 0xc0000000004d0434
>>    Dec 25 06:52:52 romulus-server kernel: [28835.277636] Oops: Kernel ac=
cess of bad area, sig: 11 [#150]
>>    Dec 25 06:52:52 romulus-server kernel: [28835.277656] LE PAGE_SIZE=3D=
64K MMU=3DRadix SMP NR_CPUS=3D2048 NUMA PowerNV
>>    Dec 25 06:52:52 romulus-server kernel: [28835.277669] Modules linked =
in: veth nft_masq zfs(PO) zunicode(PO) zzstd(O) zlua(O) zcommon(PO) znvpair=
(PO) zavl(PO) icp(PO) spl(O) vhost_vsock vmw_vsock_virtio_transport_common =
vhost vhost_iotlb vsock xt_CHECKSUM nft_chain_nat xt_MASQUERADE nf_nat nf_c=
onntrack nf_defrag_ipv6 nf_defrag_ipv4 nft_counter xt_tcpudp nft_compat bri=
dge stp llc nf_tables nfnetlink binfmt_misc dm_multipath scsi_dh_rdac scsi_=
dh_emc scsi_dh_alua joydev input_leds ipmi_powernv mac_hid ipmi_devintf ipm=
i_msghandler ofpart cmdlinepart at24 powernv_flash mtd uio_pdrv_genirq opal=
_prd uio ibmpowernv vmx_crypto sch_fq_codel jc42 ip_tables x_tables autofs4=
 xfs btrfs blake2b_generic raid10 raid456 async_raid6_recov async_memcpy as=
ync_pq async_xor async_tx xor hid_generic usbhid hid raid6_pq libcrc32c rai=
d1 raid0 multipath linear nouveau ses enclosure scsi_transport_sas ast drm_=
vram_helper i2c_algo_bit drm_ttm_helper ttm drm_kms_helper syscopyarea sysf=
illrect sysimgblt fb_sys_fops cec rc_core drm crct10dif_vpmsum
>>    Dec 25 06:52:52 romulus-server kernel: [28835.277776]  crc32c_vpmsum =
xhci_pci tg3 aacraid xhci_pci_renesas drm_panel_orientation_quirks
>>    Dec 25 06:52:52 romulus-server kernel: [28835.277918] CPU: 26 PID: 14=
4937 Comm: postgres Tainted: P      D    O      5.11.0-41-generic #45-Ubuntu
>>    Dec 25 06:52:52 romulus-server kernel: [28835.277943] NIP: c000000000=
4d0434 LR: c0000000004d032c CTR: c0000000010a90e0
>>    Dec 25 06:52:52 romulus-server kernel: [28835.277975] REGS: c00000005=
6b9f6b0 TRAP: 0380   Tainted: P      D    O       (5.11.0-41-generic)
>>    Dec 25 06:52:52 romulus-server kernel: [28835.278008] MSR: 9000000000=
009033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 88002281  XER: 0000008c
>>    Dec 25 06:52:52 romulus-server kernel: [28835.278050] CFAR: c00000000=
04d041c IRQMASK: 0=20
>>    Dec 25 06:52:52 romulus-server kernel: [28835.278050] GPR00: c0000000=
004d032c c000000056b9f950 c000000002409a00 0000000000000000=20
>>    Dec 25 06:52:52 romulus-server kernel: [28835.278050] GPR04: 00000000=
00400cc0 0000000000000097 ffffffffffffffff c000000ffda9d0d0=20
>>    Dec 25 06:52:52 romulus-server kernel: [28835.278050] GPR08: 0000000f=
fbd90000 132b47d38499fce8 0000000000000070 d4ff277338704e25=20
>>    Dec 25 06:52:52 romulus-server kernel: [28835.278050] GPR12: 00000000=
00002000 c000000ffffd2c00 0000000000000000 c000000116c512d0=20
>>    Dec 25 06:52:52 romulus-server kernel: [28835.278050] GPR16: 00000000=
00000154 c000000116c51570 c000000056b9fc88 0000000000000154=20
>>    Dec 25 06:52:52 romulus-server kernel: [28835.278050] GPR20: 00000000=
00000000 0000000000000000 0000000000000000 0000000000000000=20
>>    Dec 25 06:52:52 romulus-server kernel: [28835.278050] GPR24: c0000000=
00ecccc0 0000000000000001 c0000000024588fc c000000000ec9954=20
>>    Dec 25 06:52:52 romulus-server kernel: [28835.278050] GPR28: ffffffff=
ffffffff c00000001d597e40 0000000000400cc0 c000000003018880=20
>>    Dec 25 06:52:52 romulus-server kernel: [28835.278213] NIP [c000000000=
4d0434] kmem_cache_alloc_node+0x1d4/0x490
>>    Dec 25 06:52:52 romulus-server kernel: [28835.278237] LR [c0000000004=
d032c] kmem_cache_alloc_node+0xcc/0x490
>>    Dec 25 06:52:52 romulus-server kernel: [28835.278268] Call Trace:
>>    Dec 25 06:52:52 romulus-server kernel: [28835.278283] [c000000056b9f9=
50] [c0000000004d032c] kmem_cache_alloc_node+0xcc/0x490 (unreliable)
>>    Dec 25 06:52:52 romulus-server kernel: [28835.278328] [c000000056b9f9=
c0] [c000000000ec9954] __alloc_skb+0x74/0x2d0
>>    Dec 25 06:52:52 romulus-server kernel: [28835.278369] [c000000056b9fa=
20] [c000000000ecccc0] alloc_skb_with_frags+0x70/0x2e0
>>    Dec 25 06:52:52 romulus-server kernel: [28835.278403] [c000000056b9fa=
a0] [c000000000ec0f38] sock_alloc_send_pskb+0x1d8/0x200
>>    Dec 25 06:52:52 romulus-server kernel: [28835.278436] [c000000056b9fb=
10] [c0000000010a93a8] unix_stream_sendmsg+0x2c8/0x710
>>    Dec 25 06:52:52 romulus-server kernel: [28835.278471] [c000000056b9fc=
10] [c000000000eb64e0] sock_sendmsg+0x80/0xb0
>>    Dec 25 06:52:52 romulus-server kernel: [28835.278494] [c000000056b9fc=
40] [c000000000ebab88] __sys_sendto+0xf8/0x1a0
>>    Dec 25 06:52:52 romulus-server kernel: [28835.278526] [c000000056b9fd=
90] [c000000000ebaca0] sys_send+0x30/0x40
>>    Dec 25 06:52:52 romulus-server kernel: [28835.278558] [c000000056b9fd=
b0] [c000000000036ffc] system_call_exception+0x10c/0x230
>>    Dec 25 06:52:52 romulus-server kernel: [28835.278601] [c000000056b9fe=
10] [c00000000000d374] system_call_vectored_common+0xf4/0x26c
>>    Dec 25 06:52:52 romulus-server kernel: [28835.278634] --- interrupt: =
3000 at 0x7ec638a194f4
>>    Dec 25 06:52:52 romulus-server kernel: [28835.278654] NIP: 00007ec638=
a194f4 LR: 0000000000000000 CTR: 0000000000000000
>>    Dec 25 06:52:52 romulus-server kernel: [28835.278685] REGS: c00000005=
6b9fe80 TRAP: 3000   Tainted: P      D    O       (5.11.0-41-generic)
>>    Dec 25 06:52:52 romulus-server kernel: [28835.278719] MSR: 9000000002=
80f033 <SF,HV,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 48008281 XER: 00000000
>>    Dec 25 06:52:52 romulus-server kernel: [28835.278766] IRQMASK: 0=20
>>    Dec 25 06:52:52 romulus-server kernel: [28835.278766] GPR00: 00000000=
0000014e 00007fffe99c1800 00007ec638a47f00 0000000000000009=20
>>    Dec 25 06:52:52 romulus-server kernel: [28835.278766] GPR04: 00000043=
809d1148 0000000000000154 0000000000000000 0000000000001ae8=20
>>    Dec 25 06:52:52 romulus-server kernel: [28835.278766] GPR08: 00000043=
62347d00 0000000000000000 0000000000000000 0000000000000000=20
>>    Dec 25 06:52:52 romulus-server kernel: [28835.278766] GPR12: 00000000=
00000000 00007ec6348e0890 0000000000000000 ffffffffffffffff=20
>>    Dec 25 06:52:52 romulus-server kernel: [28835.278766] GPR16: 00000000=
00000000 000000436233f7a0 0000000000000001 0000000000000000=20
>>    Dec 25 06:52:52 romulus-server kernel: [28835.278766] GPR20: 00007fff=
e99c18ac 0000004362344f48 0000000000000004 00007fffe99c18b0=20
>>    Dec 25 06:52:52 romulus-server kernel: [28835.278766] GPR24: 00000000=
06000001 0000000000000000 0000000000000154 00000043809d1148=20
>>    Dec 25 06:52:52 romulus-server kernel: [28835.278766] GPR28: 00000000=
00000000 00007ec6348d9938 00000043809ceb00 000000000000000b=20
>>    Dec 25 06:52:52 romulus-server kernel: [28835.278992] NIP [00007ec638=
a194f4] 0x7ec638a194f4
>>    Dec 25 06:52:52 romulus-server kernel: [28835.279020] LR [00000000000=
00000] 0x0
>>    Dec 25 06:52:52 romulus-server kernel: [28835.279038] --- interrupt: =
3000
>>    Dec 25 06:52:52 romulus-server kernel: [28835.279054] Instruction dum=
p:
>>    Dec 25 06:52:52 romulus-server kernel: [28835.279072] f9210020 418200=
98 2e1cffff 3b200001 2c2a0000 41820088 41920010 894a0007=20
>>    Dec 25 06:52:52 romulus-server kernel: [28835.279110] 7c1c5000 408200=
78 815f0028 e97f00b8 <7ce9502a> 7c095214 886d0988 9b2d0988=20
>>    Dec 25 06:52:52 romulus-server kernel: [28835.279141] ---[ end trace =
fe7ee98d0b7beb6a ]---
>
> Perhaps slab corruption, but the 'D' taint flag (TAINT_DIE) means the
> kernel oopsed at least once before this. Probably best to look at that
> one first.

You also have the 'P' taint for a proprietary module loaded, so we
(upstream) can't really help with that, you're better off reporting to
your distro.

If it's easily reproducible you could boot with slub_debug=3DFZP and see
if that catches the slab corruption earlier, that might help us identify
the actual problem.

cheers
