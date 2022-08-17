Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2E959690F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Aug 2022 07:59:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M6y5Q0BYgz3blV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Aug 2022 15:59:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Qm8HDLjf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M6y4p53fFz2y29
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Aug 2022 15:58:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Qm8HDLjf;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4M6y4l1mv4z4x1d;
	Wed, 17 Aug 2022 15:58:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1660715927;
	bh=JA4+goBWtf4h6XwSrngJgDEJ8yL0yhQmTnVYwCHrGEI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Qm8HDLjfrH+BbVQ/yDgyE/tRhjyVd4YqKFGMztoG/CxCceV2TMH3sLpU95oz+wCnr
	 7SagaXZrCXt8g1PrwjzhW/8zIxFuPhok341IpnG1vqtgdRb2kmpnyN337ODmO+GWN8
	 rq6vg40iunHQVlrtq6OpA8to2z/4y7X0zxYmY5Sd55PCpc1iZ3V7FdCuIMMIY051MH
	 qT5loT7wr7oC992D3fCevRAWoCSOheSpA+HQeCIczPVQTzzZBno2NRygVh4QiyLt28
	 898vw+CKmdKC4s3Be0eBBcM2uKu5rrj/dFaVGQT0i3UO6sD5X087IXqB+z3rzK5ZM8
	 ZiVit4oGT9iJA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Sachin Sant <sachinp@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [6.0-rc1] Kernel crash while running MCE tests
In-Reply-To: <2BF30341-AD39-4949-9489-86C75A6F4513@linux.ibm.com>
References: <2BF30341-AD39-4949-9489-86C75A6F4513@linux.ibm.com>
Date: Wed, 17 Aug 2022 15:58:40 +1000
Message-ID: <87wnb7v2b3.fsf@mpe.ellerman.id.au>
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
Cc: mahesh@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sachin Sant <sachinp@linux.ibm.com> writes:
> Following crash is seen while running powerpc/mce subtest on
> a Power10 LPAR. 
>
> 1..1
> # selftests: powerpc/mce: inject-ra-err
> [  155.240591] BUG: Unable to handle kernel data access on read at 0xc00e00022d55b503
> [  155.240618] Faulting instruction address: 0xc0000000006f1f0c
> [  155.240627] Oops: Kernel access of bad area, sig: 11 [#1]
> [  155.240633] LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA pSeries
> [  155.240642] Modules linked in: dm_mod mptcp_diag xsk_diag tcp_diag udp_diag raw_diag inet_diag unix_diag af_packet_diag netlink_diag nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 bonding rfkill tls ip_set nf_tables nfnetlink sunrpc binfmt_misc pseries_rng drm drm_panel_orientation_quirks xfs libcrc32c sd_mod t10_pi sr_mod crc64_rocksoft_generic cdrom crc64_rocksoft crc64 sg ibmvscsi ibmveth scsi_transport_srp xts vmx_crypto fuse
> [  155.240750] CPU: 4 PID: 3645 Comm: inject-ra-err Not tainted 6.0.0-rc1 #2
> [  155.240761] NIP:  c0000000006f1f0c LR: c0000000000630d0 CTR: 0000000000000000
> [  155.240768] REGS: c0000000ff887890 TRAP: 0300   Not tainted  (6.0.0-rc1)
> [  155.240776] MSR:  8000000000001003 <SF,ME,RI,LE>  CR: 48002828  XER: 00000000
                                        ^^^^^^^^^^^^^
                                        MMU is off, aka. real mode.

> [  155.240792] CFAR: c0000000000630cc DAR: c00e00022d55b503 DSISR: 40000000 IRQMASK: 3 
> [  155.240792] GPR00: c0000000000630d0 c0000000ff887b30 c0000000044afe00 c00000116aada818 
> [  155.240792] GPR04: 0000000000004d43 0000000000000008 c0000000000630d0 004d424900000000 
> [  155.240792] GPR08: 0000000000000001 180000022d55b503 a80e000000000000 0000000003000048 
> [  155.240792] GPR12: 0000000000000000 c0000000ffffb700 0000000000000000 0000000000000000 
> [  155.240792] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
> [  155.240792] GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000010000b30 
> [  155.240792] GPR24: 00007fff8dad0000 00007fff8dacf6d8 00007fffd1551e98 000000001001fce8 
> [  155.240792] GPR28: c00000116aada888 c00000116aada800 0000000000004d43 c00000116aada818 
> [  155.240885] NIP [c0000000006f1f0c] __asan_load2+0x5c/0xe0
> [  155.240898] LR [c0000000000630d0] pseries_errorlog_id+0x20/0x40
> [  155.240910] Call Trace:
> [  155.240914] [c0000000ff887b50] [c0000000000630d0] pseries_errorlog_id+0x20/0x40
> [  155.240925] [c0000000ff887b80] [c0000000015595c8] get_pseries_errorlog+0xa8/0x110
 
get_pseries_errorlog() is marked noinstr.

And pseries_errorlog_id() is:

static
inline uint16_t pseries_errorlog_id(struct pseries_errorlog *sect)
{
	return be16_to_cpu(sect->id);
}

So I guess the compiler has decided not to inline it (why?!), and it is
not marked noinstr, so it gets KASAN instrumentation which crashes in
real mode.

We'll have to make sure everything get_pseries_errorlog() is either
forced inline, or marked noinstr.

cheers

