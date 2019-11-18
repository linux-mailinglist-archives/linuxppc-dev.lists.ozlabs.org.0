Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 753061003B0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Nov 2019 12:20:26 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Gmhk3L5mzDqVT
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Nov 2019 22:20:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Gmdm3grGzDqFF
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Nov 2019 22:17:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="P9Zr8f/a"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47Gmdl70pTz9sPT;
 Mon, 18 Nov 2019 22:17:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1574075868;
 bh=tmFsG35fivh8ejaJ9XgtyHjYWy2bP+f58gTSBDMDha4=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=P9Zr8f/a4w0PzwG1oWqu08JCQY+iz+8l0rLmzbZtoHmq7ycuc176lzu3stnmUgSAk
 YRlqwPjyFpjtdqzvRaacmy/QSdCuR6IlJSlXjOZaxQ2qdX4GY6srNfzWJFU4HTQISA
 D4TwYFvUBh3Lk7d2tlbRriDjiUrN980RbI9nRz9B3+6J8OcWOJn3APJc/03UvHx0kV
 lotx5uRVLSe3kMtDsQKKWK/EMad1wvAOOHRo8wn89nR6JE0mJxN1qy5WRvVDs469Ka
 c6etghTsvYmSHvanhED1nBTxSrY+A4Nn8A2O6RT8C4C86qKgVO8gPqegBeZH0+TpVp
 CvmANc5dYW8og==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH] powerpc/8xx: Fix permanently mapped IMMR region.
In-Reply-To: <ad9d45119a48a92bf122781d0c79c9407baa12d7.1566554026.git.christophe.leroy@c-s.fr>
References: <ad9d45119a48a92bf122781d0c79c9407baa12d7.1566554026.git.christophe.leroy@c-s.fr>
Date: Mon, 18 Nov 2019 22:17:46 +1100
Message-ID: <87sgmlcu1x.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@c-s.fr> writes:
> When not using large TLBs, the IMMR region is still
> mapped as a whole block in the FIXMAP area.
>
> Do not remove pages mapped in the FIXMAP region when
> initialising paging.
>
> Properly report that the IMMR region is block-mapped even
> when not using large TLBs.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> ---
>  arch/powerpc/mm/mem.c        |  8 --------
>  arch/powerpc/mm/nohash/8xx.c | 13 +++++++------
>  2 files changed, 7 insertions(+), 14 deletions(-)

This blows up pmac32_defconfig + qemu mac99 for me with:

  NET: Registered protocol family 1
  RPC: Registered named UNIX socket transport module.
  RPC: Registered udp transport module.
  RPC: Registered tcp transport module.
  RPC: Registered tcp NFSv4.1 backchannel transport module.
  PCI: CLS 0 bytes, default 32
  Trying to unpack rootfs image as initramfs...
  BUG: Unable to handle kernel data access on write at 0xfffdf000
  Faulting instruction address: 0xc001eb4c
  Oops: Kernel access of bad area, sig: 11 [#1]
  BE PAGE_SIZE=4K MMU=Hash PowerMac
  Modules linked in:
  CPU: 0 PID: 1 Comm: swapper Not tainted 5.4.0-rc2-gcc49+ #50
  NIP:  c001eb4c LR: c0394214 CTR: 00000080
  REGS: ef0b5a70 TRAP: 0300   Not tainted  (5.4.0-rc2-gcc49+)
  MSR:  00009032 <EE,ME,IR,DR,RI>  CR: 44088444  XER: 20000000
  DAR: fffdf000 DSISR: 42000000 
  GPR00: 00000080 ef0b5b28 ef0b0000 fffdf000 ef2001e4 00000000 fffdeffc fffe0000 
  GPR08: ef2011e8 00000008 00000009 00000004 28088442 00000000 c0005734 00000000 
  GPR16: 00000000 00000000 00000000 00000000 c07f0000 c0735600 00000000 ef09f500 
  GPR24: fffdf000 00000000 00000000 00000000 fffdf000 ef0b5c38 00001000 00001000 
  NIP [c001eb4c] memcpy+0x88/0x10c
  LR [c0394214] iov_iter_copy_from_user_atomic+0x1fc/0x468
  Call Trace:
  [ef0b5b28] [c0394060] iov_iter_copy_from_user_atomic+0x48/0x468 (unreliable)
  [ef0b5b68] [c0131438] generic_perform_write+0xfc/0x218
  [ef0b5bb8] [c01360bc] __generic_file_write_iter+0x134/0x26c
  [ef0b5bf8] [c0136324] generic_file_write_iter+0x130/0x1d8
  [ef0b5c28] [c01a1754] __vfs_write+0x170/0x220
  [ef0b5ca8] [c01a34f0] vfs_write+0xcc/0x1e0
  [ef0b5cd8] [c01a386c] ksys_write+0xd0/0x120
  [ef0b5d08] [c08a03a4] xwrite+0x44/0xa4
  [ef0b5d28] [c08a0b64] do_copy+0x94/0xdc
  [ef0b5d48] [c08a0044] write_buffer+0x40/0x68
  [ef0b5d68] [c08a00cc] flush_buffer+0x60/0xe4
  [ef0b5d98] [c08e87bc] __gunzip+0x2f0/0x3d0
  [ef0b5dd8] [c08a0974] unpack_to_rootfs+0x1d8/0x334
  [ef0b5e38] [c08a1238] populate_rootfs+0x80/0x168
  [ef0b5e68] [c0005494] do_one_initcall+0x58/0x1f4
  [ef0b5ed8] [c089e918] kernel_init_freeable+0x198/0x29c
  [ef0b5f18] [c000574c] kernel_init+0x18/0x110
  [ef0b5f38] [c0016274] ret_from_kernel_thread+0x14/0x1c
  Instruction dump:
  4200fff0 5400f0bf 7c0903a6 41820010 85240004 95260004 4200fff8 54a0d97f 
  54a506fe 39600004 7c0903a6 4182004c <7c0b37ec> 80e40004 81040008 8124000c 
  ---[ end trace 52276ec2410ac084 ]---


cheers
