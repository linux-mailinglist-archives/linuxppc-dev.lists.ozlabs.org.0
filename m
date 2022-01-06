Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C58485F9C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jan 2022 05:19:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JTtRV1QbDz2yws
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jan 2022 15:19:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=f2HdYsV5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JTtQs4KCgz2x9b
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jan 2022 15:19:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=f2HdYsV5; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JTtQr1fKpz4xsl;
 Thu,  6 Jan 2022 15:19:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1641442757;
 bh=yydQ6GGs4qIt6f6LLOvnqm9PBKT62boPSR81EcFr8ss=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=f2HdYsV5Yw/XWcjGLKvKT/4bj9DW80Z1dYqTJ77ROO+gpM5atifN3GfZMAgHF2ik0
 Ibu9yupX7EsQOwJ4VRw5cbpswhOX58ij0qoQG9K2vO4e6D4nblq2VJDYMqKLMOaGKK
 jJNRdv4POygl2eFTXwFmH9pai2ZAp2QyYVCdk9PNlBiA+NKQH3O+bqgTufZGL5fPU8
 2x2J3Z/6bp8KOBPE5Lt9GxBdtfEv/nCevh2CHJUqdIl4KXqtxgN9lrVn+rw0TxK62e
 Is40WK9/ymClxO5NQ8ZzCTUdl4t/Ja6SsRJbZLFf8/IOaJJsHnFks5WWYW/JwfyYTK
 80BlHhJs92cmQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Jakub Kicinski <kuba@kernel.org>, Abdul Haleem
 <abdhalee@linux.vnet.ibm.com>
Subject: Re: [5.16.0-rc5][ppc][net] kernel oops when hotplug remove of vNIC
 interface
In-Reply-To: <20220105102625.2738186e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
References: <63380c22-a163-2664-62be-2cf401065e73@linux.vnet.ibm.com>
 <20220105102625.2738186e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
Date: Thu, 06 Jan 2022 15:19:15 +1100
Message-ID: <87lezt3398.fsf@mpe.ellerman.id.au>
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
Cc: dumazet@google.com, netdev <netdev@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Dany Madden <drt@linux.ibm.com>,
 alexandr.lobakin@intel.com, brian King <brking@linux.vnet.ibm.com>,
 Sukadev Bhattiprolu <sukadev@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jakub Kicinski <kuba@kernel.org> writes:
> On Wed, 5 Jan 2022 13:56:53 +0530 Abdul Haleem wrote:
>> Greeting's
>>=20
>> Mainline kernel 5.16.0-rc5 panics when DLPAR ADD of vNIC device on my=20
>> Powerpc LPAR
>>=20
>> Perform below dlpar commands in a loop from linux OS
>>=20
>> drmgr -r -c slot -s U9080.HEX.134C488-V1-C3 -w 5 -d 1
>> drmgr -a -c slot -s U9080.HEX.134C488-V1-C3 -w 5 -d 1
>>=20
>> after 7th iteration, the kernel panics with below messages
>>=20
>> console messages:
>> [102056] ibmvnic 30000003 env3: Sending CRQ: 801e000864000000=20
>> 0060000000000000
>> <intr> ibmvnic 30000003 env3: Handling CRQ: 809e000800000000=20
>> 0000000000000000
>> [102056] ibmvnic 30000003 env3: Disabling tx_scrq[0] irq
>> [102056] ibmvnic 30000003 env3: Disabling tx_scrq[1] irq
>> [102056] ibmvnic 30000003 env3: Disabling rx_scrq[0] irq
>> [102056] ibmvnic 30000003 env3: Disabling rx_scrq[1] irq
>> [102056] ibmvnic 30000003 env3: Disabling rx_scrq[2] irq
>> [102056] ibmvnic 30000003 env3: Disabling rx_scrq[3] irq
>> [102056] ibmvnic 30000003 env3: Disabling rx_scrq[4] irq
>> [102056] ibmvnic 30000003 env3: Disabling rx_scrq[5] irq
>> [102056] ibmvnic 30000003 env3: Disabling rx_scrq[6] irq
>> [102056] ibmvnic 30000003 env3: Disabling rx_scrq[7] irq
>> [102056] ibmvnic 30000003 env3: Replenished 8 pools
>> Kernel attempted to read user page (10) - exploit attempt? (uid: 0)
>> BUG: Kernel NULL pointer dereference on read at 0x00000010
>> Faulting instruction address: 0xc000000000a3c840
>> Oops: Kernel access of bad area, sig: 11 [#1]
>> LE PAGE_SIZE=3D64K MMU=3DRadix SMP NR_CPUS=3D2048 NUMA pSeries
>> Modules linked in: bridge stp llc ib_core rpadlpar_io rpaphp nfnetlink=20
>> tcp_diag udp_diag inet_diag unix_diag af_packet_diag netlink_diag=20
>> bonding rfkill ibmvnic sunrpc pseries_rng xts vmx_crypto gf128mul=20
>> sch_fq_codel binfmt_misc ip_tables ext4 mbcache jbd2 dm_service_time=20
>> sd_mod t10_pi sg ibmvfc scsi_transport_fc ibmveth dm_multipath dm_mirror=
=20
>> dm_region_hash dm_log dm_mod fuse
>> CPU: 9 PID: 102056 Comm: kworker/9:2 Kdump: loaded Not tainted=20
>> 5.16.0-rc5-autotest-g6441998e2e37 #1
>> Workqueue: events_long __ibmvnic_reset [ibmvnic]
>> NIP:=C2=A0 c000000000a3c840 LR: c0080000029b5378 CTR: c000000000a3c820
>> REGS: c0000000548e37e0 TRAP: 0300=C2=A0=C2=A0 Not tainted=20
>> (5.16.0-rc5-autotest-g6441998e2e37)
>> MSR:=C2=A0 8000000000009033 <SF,EE,ME,IR,DR,RI,LE>=C2=A0 CR: 28248484=C2=
=A0 XER: 00000004
>> CFAR: c0080000029bdd24 DAR: 0000000000000010 DSISR: 40000000 IRQMASK: 0
>> GPR00: c0080000029b55d0 c0000000548e3a80 c0000000028f0200 00000000000000=
00
>> GPR04: c000000c7d1a7e00 fffffffffffffff6 0000000000000027 c000000c7d1a7e=
08
>> GPR08: 0000000000000023 0000000000000000 0000000000000010 c0080000029bdd=
10
>> GPR12: c000000000a3c820 c000000c7fca6680 0000000000000000 c000000133016b=
f8
>> GPR16: 00000000000003fe 0000000000001000 0000000000000002 00000000000000=
08
>> GPR20: c000000133016eb0 0000000000000000 0000000000000000 00000000000000=
03
>> GPR24: c000000133016000 c000000133017168 0000000020000000 c000000133016a=
00
>> GPR28: 0000000000000006 c000000133016a00 0000000000000001 c0000001330160=
00
>> NIP [c000000000a3c840] napi_enable+0x20/0xc0
>> LR [c0080000029b5378] __ibmvnic_open+0xf0/0x430 [ibmvnic]
>> Call Trace:
>> [c0000000548e3a80] [0000000000000006] 0x6 (unreliable)
>> [c0000000548e3ab0] [c0080000029b55d0] __ibmvnic_open+0x348/0x430 [ibmvni=
c]
>> [c0000000548e3b40] [c0080000029bcc28] __ibmvnic_reset+0x500/0xdf0 [ibmvn=
ic]
>> [c0000000548e3c60] [c000000000176228] process_one_work+0x288/0x570
>> [c0000000548e3d00] [c000000000176588] worker_thread+0x78/0x660
>> [c0000000548e3da0] [c0000000001822f0] kthread+0x1c0/0x1d0
>> [c0000000548e3e10] [c00000000000cf64] ret_from_kernel_thread+0x5c/0x64
>> Instruction dump:
>> 7d2948f8 792307e0 4e800020 60000000 3c4c01eb 384239e0 f821ffd1 39430010
>> 38a0fff6 e92d1100 f9210028 39200000 <e9030010> f9010020 60420000 e9210020
>> ---[ end trace 5f8033b08fd27706 ]---
>> radix-mmu: Page sizes from device-tree:
>>=20
>> the fault instruction points to
>>=20
>> [root@ltcden11-lp1 boot]# gdb -batch=20
>> vmlinuz-5.16.0-rc5-autotest-g6441998e2e37 -ex 'list *(0xc000000000a3c840=
)'
>> 0xc000000000a3c840 is in napi_enable (net/core/dev.c:6966).
>> 6961=C2=A0=C2=A0=C2=A0 void napi_enable(struct napi_struct *n)
>> 6962=C2=A0=C2=A0=C2=A0 {
>> 6963=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 unsigned long val, new;
>> 6964
>> 6965=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 do {
>> 6966=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 val =3D REA=
D_ONCE(n->state);
>
> If n is NULL here that's gotta be a driver problem.

Definitely looks like it, the disassembly is:

  not     r9,r9
  clrldi  r3,r9,63
  blr				# end of previous function
  nop
  addis   r2,r12,491		# function entry
  addi    r2,r2,14816
  stdu    r1,-48(r1)		# stack frame creation
  li      r5,-10
  ld      r9,4352(r13)
  std     r9,40(r1)
  li      r9,0
  ld      r8,16(r3)		# load from r3 (n) + 16


The register dump shows that r3 is NULL, and it comes directly from the
caller. So we've been called with n =3D NULL.

cheers
