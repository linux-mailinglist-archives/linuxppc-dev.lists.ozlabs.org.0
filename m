Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 326F52A7B84
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 11:20:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRfg72cJbzDqw0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 21:20:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRfdT1NrmzDqRf
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Nov 2020 21:19:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=hKopHS3w; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CRfdS55rwz9sSs;
 Thu,  5 Nov 2020 21:19:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1604571564;
 bh=eEU8J1Xn0BAw7pVd2Uc6urVx08KWrOzz+ZqbmLqX71A=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=hKopHS3wmgQfYzGkwDySE96RY6B6fHxAXWebbZIvKNlqm3Q6eaYOXpLQPiRHE5BVZ
 UsLfVIlbvj48czM5/qlgvliHeubbn63SWYMF60x27iiVtzqTFEwS2ogadyaIAFkj+u
 CYZeQYiWgpBb5wtZJ/u7hp0sY45ouIpWl3S+KvIECTOfhiu7RUIncyzI8yB2r6HaQB
 h4Ig0x3ZZDdUAqk08TFTCBuGXkxLmN91OE9mv0bH070tSwcFq5O25htO5UI38kUmIY
 vrUL/WBIJ1HYGsQmay1DANJJ8mGNJhfw3/yq3QyICtzK/yFgQfxzEbic6czXen/rHq
 teRJUpU790qZg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Carl Jacobsen <cjacobsen@storix.com>
Subject: Re: Kernel panic from malloc() on SUSE 15.1?
In-Reply-To: <CAKkwB_RD0_=9SSwyYn-8Vo2dr2Li4X-v_KJ4qBWZRgxZuGUeRw@mail.gmail.com>
References: <CAKkwB_S6Bs_+5At2aajbQbJg==WE_4NLdhSK=Bj+td67215Htg@mail.gmail.com>
 <878sbjuqe6.fsf@mpe.ellerman.id.au>
 <CAKkwB_RD0_=9SSwyYn-8Vo2dr2Li4X-v_KJ4qBWZRgxZuGUeRw@mail.gmail.com>
Date: Thu, 05 Nov 2020 21:19:22 +1100
Message-ID: <87lffgt8b9.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Carl Jacobsen <cjacobsen@storix.com> writes:
> The panic (on a call to malloc from static linked libcrypto) looks like
> this:

Thanks.

This doesn't make a lot of sense.

> Bad kernel stack pointer 7fffffffeac0 at 700

"at 700" is the regs->nip value, and suggests we're trying to handle a
program check, which is either a trap or BUG or WARN, or illegal
instruction or several other things.

> Oops: Bad kernel stack pointer, sig: 6 [#1]
> SMP NR_CPUS=2048 NUMA pSeries
> Modules linked in: scsi_transport_iscsi af_packet xt_tcpudp ip6t_rpfilter
> ip6t_REJECT ipt_REJECT xt_conntrack ip_set nfnetlink ebtable_nat
> ebtable_broute br_netfilter bridge stp llc ip6table_nat nf_conntrack_ipv6
> nf_defrag_ipv6 nf_nat_ipv6 ip6table_mangle ip6table_raw ip6table_security
> iptable_nat nf_conntrack_ipv4 nf_defrag_ipv4 nf_nat_ipv4 nf_nat
> nf_conntrack libcrc32c iptable_mangle iptable_raw iptable_security
> ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter ip_tables
> x_tables ibmveth(X) vmx_crypto gf128mul crct10dif_vpmsum rtc_generic btrfs
> xor zstd_decompress zstd_compress xxhash raid6_pq sr_mod cdrom sd_mod
> ibmvscsi(X) scsi_transport_srp crc32c_vpmsum sg dm_multipath dm_mod
> scsi_dh_rdac scsi_dh_emc scsi_dh_alua scsi_mod autofs4
> Supported: Yes, External
> CPU: 0 PID: 14144 Comm: rand_test_no_pt Tainted: G 4.12.14-197.18-default #1 SLE15-SP1
> task: c00000002fa23b80 task.stack: c000000032824000
> NIP: 0000000000000700 LR: 0000000010004ad0 CTR: 0000000000000000
> REGS: c00000001ec2fd40 TRAP: 0300   Tainted: G (4.12.14-197.18-default)

But then here it says TRAP = 0x300, which is != 0x700.

The trap number is hardcoded in the bad stack handling code, and I don't
see how we can end up with nip == 0x700 but the trap value == 0x300.

> MSR: 8000000000001000 <SF,ME> CR: 44000844  XER: 20000000

And here the MSR says you were in big endian mode, but you said before
your machine was ppc64le.

> CFAR: 00000000000010f0 DAR: ffffffffffffb27a DSISR: 40000000 SOFTE: 0
> GPR00: 0000000020000000 00007fffffffeac0 00000000102af788 fffffffffffffffd
> GPR04: 0000000000000020 0000000000000030 00000000102b0550 0000000000000001
> GPR08: 0000000000000000 00007fffb7dacc00 00000000102b0520 800000010280f033
> GPR12: 0000000000004000 00007fffb7ffa100 0000000000000000 0000000000000000
> GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> GPR24: 0000000000000000 0000000000000000 0000000000000000 00007fffb7fef4b8
> GPR28: 00007fffb7ff0000 0000000000000000 0000000000000000 00007fffffffeac0

The rest of the regs look like user space values, not kernel.

> NIP [0000000000000700] 0x700
> LR [0000000010004ad0] 0x10004ad0
> Call Trace:
> Instruction dump:
> 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> 00000000 00000000 00000000 00000000 7db243a6 7db142a6 f92d0080 7d20e2a6
> ---[ end trace cc04515f274cfbf6 ]---


What hardware is this on?

Can you try booting with ppc_tm=off on the kernel command line, and see
if that changes anything?

Can you put your compiled test program up somewhere we can download it
and look at? Or post the disassembly?

cheers
