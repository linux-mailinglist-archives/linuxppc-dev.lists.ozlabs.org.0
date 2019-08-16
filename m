Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E554690096
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 13:16:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46913r6CJZzDr6x
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 21:16:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46911Z60Y8zDr76
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2019 21:14:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46911X3v0Hz9sML;
 Fri, 16 Aug 2019 21:14:40 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Major Hayden <major@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org
Subject: Oops in blk_mq_get_request() (was Re: ppc64le kernel panic on
 5.2.9-rc1)
In-Reply-To: <2ff51999-cf99-2190-2707-acf2f2ca3dc5@redhat.com>
References: <2ff51999-cf99-2190-2707-acf2f2ca3dc5@redhat.com>
Date: Fri, 16 Aug 2019 21:14:34 +1000
Message-ID: <87blwp746d.fsf@concordia.ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Major Hayden <major@redhat.com> writes:
> Hello there,
>
> The CKI Project just found a kernel panic while running the blktests
> test suite on stable 5.2.9-rc1[0]. Michael Ellerman requested for this
> list to be copied on these ppc64le failures.
>
> We have some logs[1] for these failures and they start with
> "ppc64le_host_2_Storage_blktests*". We hope this helps!
>
> [0] https://lore.kernel.org/stable/255f9af4-6087-7f56-5860-5aa0397a7631@redhat.com/T/#t
> [1] https://artifacts.cki-project.org/pipelines/100875/logs/

Thanks for the report.

It looks like you tested the stable queue yesterday, which AFAICS
results in the exact same source tree as you tested above, and yet
yesterday you didn't see the failure. So it's intermittent, which is
annoying.

Looking at the oops:

[ 7101.930385] NIP:  c00000000067b230 LR: c00000000067b1d4 CTR: c000000000029140
[ 7101.930400] REGS: c00020391ccc35c0 TRAP: 0300   Not tainted  (5.2.9-rc1-2440e48.cki)
[ 7101.930413] MSR:  900000000280b033 <SF,HV,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 44002228  XER: 20040000
[ 7101.930433] CFAR: c0000000001d9e28 DAR: 800a00066b9e7e28 DSISR: 40000000 IRQMASK: 0 
               GPR00: c00000000067b1d4 c00020391ccc3850 c0000000016cdb00 0000067578a4ab31 
               GPR04: 0000000000000000 ffffffffffffffff 0000000001f3fb0e 0000000000000001 
               GPR08: 800a00066b9e7d80 800a00066b9e7d80 0000000000000001 c00800000cd5db88 
                                       r9
               GPR12: c000000000029140 c000203fff6b9800 0000000000000008 c00800000d5751e0 
               GPR16: c000203985a8a6c0 c00800000e013278 c000203985a8a700 0000000000000038 
               GPR20: 0000000000000030 0000000000000028 0000000000000020 fffffffffffff000 
               GPR24: 0000000000000001 0000000000000400 0000000000000000 0000000000000023 
               GPR28: 0000000000000000 0000000000000000 c00020391ccc38c8 c000003ef1b00000 
[ 7101.930544] NIP [c00000000067b230] blk_mq_get_request+0x260/0x4b0
[ 7101.930557] LR [c00000000067b1d4] blk_mq_get_request+0x204/0x4b0
[ 7101.930569] Call Trace:
[ 7101.930577] [c00020391ccc3850] [c00000000067b1d4] blk_mq_get_request+0x204/0x4b0 (unreliable)
[ 7101.930594] [c00020391ccc38a0] [c00000000067b688] blk_mq_alloc_request_hctx+0x108/0x1b0
[ 7101.930617] [c00020391ccc3910] [c00800000cd51aac] nvme_alloc_request+0x54/0xe0 [nvme_core]
[ 7101.930633] [c00020391ccc3940] [c00800000cd5641c] __nvme_submit_sync_cmd+0x64/0x290 [nvme_core]
[ 7101.930651] [c00020391ccc39c0] [c00800000d571650] nvmf_connect_io_queue+0x148/0x1e0 [nvme_fabrics]
[ 7101.930668] [c00020391ccc3ab0] [c00800000e0106b0] nvme_loop_connect_io_queues+0x98/0xf8 [nvme_loop]
[ 7101.930684] [c00020391ccc3af0] [c00800000e01116c] nvme_loop_create_ctrl+0x434/0x6a0 [nvme_loop]
[ 7101.930700] [c00020391ccc3bd0] [c00800000d5724f0] nvmf_dev_write+0xd38/0x124c [nvme_fabrics]
[ 7101.930719] [c00020391ccc3d60] [c000000000421e58] __vfs_write+0x38/0x70
[ 7101.930731] [c00020391ccc3d80] [c000000000426188] vfs_write+0xd8/0x250
[ 7101.930744] [c00020391ccc3dd0] [c000000000426558] ksys_write+0x78/0x130
[ 7101.930758] [c00020391ccc3e20] [c00000000000bde4] system_call+0x5c/0x70

And then the disassembly:

x = op_is_sync(op)
r27 = op = 0x0000000000000023
c00000000067b1e0:	3e 06 67 57 	clrlwi  r7,r27,24	# r7 = r27 & REQ_OP_MASK

c00000000067b1e4:	00 00 07 2c 	cmpwi   r7,0		# if r7 == REQ_OP_READ, x = 1 then goto label2
x = 1
c00000000067b1e8:	01 00 20 39 	li      r9,1

...

r30 = data = c00020391ccc38c8 
r8 = data->ctx = 800a00066b9e7d80
c00000000067b208:	18 00 1e e9 	ld      r8,24(r30)
c00000000067b20c:	18 00 82 41 	beq     c00000000067b224 <blk_mq_get_request+0x254>	->	label2

		(op & (REQ_SYNC | REQ_FUA | REQ_PREFLUSH))
c00000000067b210:	1c 05 6a 57 	rlwinm  r10,r27,0,20,14
c00000000067b214:	68 03 4a 55 	rlwinm  r10,r10,0,13,20
c00000000067b218:	34 00 4a 7d 	cntlzw  r10,r10
c00000000067b21c:	7e d9 4a 55 	rlwinm  r10,r10,27,5,31
c00000000067b220:	01 00 49 69 	xori    r9,r10,1

c00000000067b224:	24 1f 29 79 	rldicr  r9,r9,3,60					<-	label2
r9 = x * 8

c00000000067b228:	01 00 e0 38 	li      r7,1	# for refcount_set

r9 = data->ctx + x
c00000000067b22c:	14 4a 28 7d 	add     r9,r8,r9

	data->ctx->rq_dispatched[op_is_sync(op)]++;

r10 = data->ctx->rq_dispatched[x]
c00000000067b230:	a8 00 49 e9 	ld      r10,168(r9)					<-	NIP

x++
c00000000067b234:	01 00 4a 39 	addi    r10,r10,1

data->ctx->rq_dispatched[x] = r10
c00000000067b238:	a8 00 49 f9 	std     r10,168(r9)

	refcount_set(&rq->ref, 1);
c00000000067b23c:	d4 00 ff 90 	stw     r7,212(r31)


So we're oopsing at data->ctx->rq_dispatched[op_is_sync(op)]++.

data->ctx looks completely bogus, ie. 800a00066b9e7d80, that's not
anything like a valid kernel address.

And also op doesn't look like a valid op value, it's 0x23, which has no
flag bits set, but also doesn't match any of the values in req_opf.

So I suspect data is pointing somewhere bogus. Or possibly it used to
point at a blk_mq_alloc_data but doesn't anymore.

Why that's happened I have no idea. I can't see any obvious commits in
mainline or stable that mention anything similar, maybe someone on
linux-block recognises it?

cheers
