Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9909B7250C3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jun 2023 01:24:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QbRPx37Gfz3ch8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jun 2023 09:24:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=AXZoxQDw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QbRP30QRKz3ccg
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Jun 2023 09:23:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=AXZoxQDw;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QbRP24tbZz4x1R;
	Wed,  7 Jun 2023 09:23:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1686093814;
	bh=B9rC28pDVp3JnlueCNsKy/WRFzMnmaVeBbX2EHevunw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=AXZoxQDwqSMKCAYWKROI0Ak6EPJTjMlSRmZI78oE9iPxlQ68kJ72tR+YgOlCHXAUm
	 wf+mSlkkXBn//CAWbGevsbdq6WYnUbFS5YiD47Gzk4JzVySmgk1F2W9W+zXQj1RQHq
	 4mbFD34tRAMXlTyCOAYNFZFJHFLAEw5DTqriZdjObBh72x4Wlk4ODKxMdq0RatTkdR
	 IF9DNXGRoBw77vEHoA7YVhgNdqYc0d7zg/KcCp+izku259RlhBfDXkalnAxFN4jomU
	 d03/K/40ffyHttQm3MQy+cI/Zzt6cqJozG5BxKUlZ3/tbmSu3Eh3SeB+52NJI0z1C9
	 lzwyVhvc6sFHw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, Sachin Sant
 <sachinp@linux.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: Re: WARN at kernel/sched/core.c:5358 (kthread_end_lazy_tlb_mm)
In-Reply-To: <CT5GZLOV5Y7B.2TE12USLNTKER@wheely>
References: <A9A5D83D-BA70-47A4-BCB4-30C1AE19BC22@linux.ibm.com>
 <CT5GZLOV5Y7B.2TE12USLNTKER@wheely>
Date: Wed, 07 Jun 2023 09:23:27 +1000
Message-ID: <87a5xcgopc.fsf@mail.lhotse>
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
Cc: linux-mm@kvack.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Nicholas Piggin" <npiggin@gmail.com> writes:
> On Thu Jun 1, 2023 at 8:46 PM AEST, Sachin Sant wrote:
>> While compiling a kernel on a IBM Power system booted with
>> 6.4.0-rc4-next-20230601 following warning is observed
>>
>> [  276.351697] ------------[ cut here ]------------
>> [  276.351709] WARNING: CPU: 27 PID: 9237 at kernel/sched/core.c:5358 kthread_end_lazy_tlb_mm+0x90/0xa0
>> [  276.351719] Modules linked in: dm_mod nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 bonding tls rfkill ip_set nf_tables nfnetlink sunrpc pseries_rng aes_gcm_p10_crypto xfs libcrc32c sd_mod sr_mod t10_pi crc64_rocksoft_generic cdrom crc64_rocksoft crc64 sg ibmvscsi scsi_transport_srp ibmveth vmx_crypto fuse
>> [  276.351752] CPU: 27 PID: 9237 Comm: cc1 Kdump: loaded Not tainted 6.4.0-rc4-next-20230601 #1
>> [  276.351756] Hardware name: IBM,9080-HEX POWER10 (raw) 0x800200 0xf000006 of:IBM,FW1030.20 (NH1030_058) hv:phyp pSeries
>> [  276.351759] NIP:  c0000000001b8c10 LR: c0000000000a8d54 CTR: c00000000046ec00
>> [  276.351763] REGS: c0000000dce337d0 TRAP: 0700   Not tainted  (6.4.0-rc4-next-20230601)
>> [  276.351766] MSR:  8000000000029033 <SF,EE,ME,IR,DR,RI,LE>  CR: 24002228  XER: 00000000
>> [  276.351774] CFAR: c0000000001b8ba0 IRQMASK: 0  [  276.351774] GPR00: c0000000000a8d54 c0000000dce33a70 c0000000014a1800 c000000007852a00  [  276.351774] GPR04: 0000000000000001 ffffffffffffffff 0000000000000000 c000000007852f78  [  276.351774] GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000024002428  [  276.351774] GPR12: c0000000a032b608 c00000135faa5b00 0000000000000000 0000000000000000  [  276.351774] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000  [  276.351774] GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000  [  276.351774] GPR24: 0000000000000000 0000000000000000 0000000000000000 c000000007852a70  [  276.351774] GPR28: 0000000000000000 0000000000000000 000000000000001b c000000007852a00  [  276.351810] NIP [c0000000001b8c10] kthread_end_lazy_tlb_mm+0x90/0xa0
>> [  276.351814] LR [c0000000000a8d54] exit_lazy_flush_tlb+0xf4/0x110
>> [  276.351818] Call Trace:
>> [  276.351820] [c0000000dce33a70] [0000000000000001] 0x1 (unreliable)
>> [  276.351825] [c0000000dce33ab0] [c0000000000a8fbc] flush_type_needed+0x24c/0x260
>> [  276.351829] [c0000000dce33af0] [c0000000000a91a8] __flush_all_mm+0x48/0x2c0
>> [  276.351833] [c0000000dce33b40] [c0000000004d6dcc] tlb_finish_mmu+0x16c/0x230
>> [  276.351839] [c0000000dce33b70] [c0000000004d2a2c] exit_mmap+0x17c/0x4c0
>
> Thanks for the report. IRQs aren't diabled where I'd they would be. Fix
> should be just add a local_irq_disable somewhere, but this looks like it
> is exposing an upstream bug of mine so I'll work out a fix for that
> first. No big deal for this series, it can stay in -next for now, it
> might just require a rebase.

Can we drop the newly added WARN_ON_ONCE() in the interim?

It blows up a bunch of my tests, because they fail on seeing any WARN.

cheers
