Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BC93094B6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Jan 2021 12:26:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DSX2l0fVRzDrQt
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Jan 2021 22:26:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DSWyt2GcVzDr6c
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Jan 2021 22:22:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=jNpRT5Jp; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DSWyr1s0Sz9t0k;
 Sat, 30 Jan 2021 22:22:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1612005765;
 bh=8V293Tkag6x6U3djETvMcWGEUpxkEYNW4bxNdoMbQ+Y=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=jNpRT5JpKeaZ2F+n3+BjFEdmC8AXhGpN2xwOvqowtvGaAs7WlT2lIUPh9uyGflNqJ
 wY5yLKu/TajMgfHrnAOf0WKcWC9EQZxdLOzLAKtA2OXQqYBu1NphYr/srdBgv9ZEOx
 rw5WnHMUGoljg2hFCZJEHjT1ARcLF+kzOgtLAO24cByCpOl+vxmjItf/OdX5jrGzCm
 EioJ5RnwcVLX9G5DS+InACyv2Mmu2z1NDrVf5ma8IpF9m5TeRZVKw1miOV+MWty9cW
 oYcDSRYqC17XOGQtb+vEtL2BdOfcNzduvsdPtyBm6M94QyBwXQ+3j7s1W5KV7nGvZX
 WjS1OlJ6lC1+Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Zorro Lang
 <zlang@redhat.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH] powerpc/fault: fix wrong KUAP fault for IO_URING
In-Reply-To: <18dd441b-440a-fe95-0907-d8cec5b49410@csgroup.eu>
References: <20210127145648.348135-1-zlang@redhat.com>
 <cce83328-d996-defc-6c87-97cd24ec7027@csgroup.eu>
 <a8013c71-433a-96b3-c657-66ac2ba5b838@kernel.dk>
 <1611792928.nw4g8h8kj4.astroid@bobo.none>
 <20210128031355.GP14354@localhost.localdomain>
 <66061f75-c8de-c1eb-aaaf-9594a31be790@kernel.dk>
 <20210128135220.GQ14354@localhost.localdomain>
 <aedb880b-da2b-ec29-3b66-66f01733be9b@kernel.dk>
 <17ae2706-fe95-a5de-b9da-e3480800daf7@csgroup.eu>
 <20210129065220.GS14354@localhost.localdomain>
 <18dd441b-440a-fe95-0907-d8cec5b49410@csgroup.eu>
Date: Sat, 30 Jan 2021 22:22:39 +1100
Message-ID: <87r1m2d5z4.fsf@mpe.ellerman.id.au>
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
Cc: Jens Axboe <axboe@kernel.dk>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> +Aneesh
>
> Le 29/01/2021 =C3=A0 07:52, Zorro Lang a =C3=A9crit=C2=A0:
..
>> [   96.200296] ------------[ cut here ]------------
>> [   96.200304] Bug: Read fault blocked by KUAP!
>> [   96.200309] WARNING: CPU: 3 PID: 1876 at arch/powerpc/mm/fault.c:229 =
bad_kernel_fault+0x180/0x310
>
>> [   96.200734] NIP [c000000000849424] fault_in_pages_readable+0x104/0x350
>> [   96.200741] LR [c00000000084952c] fault_in_pages_readable+0x20c/0x350
>> [   96.200747] --- interrupt: 300
>
>
> Problem happens in a section where userspace access is supposed to be gra=
nted, so the patch you=20
> proposed is definitely not the right fix.
>
> c000000000849408:	2c 01 00 4c 	isync
> c00000000084940c:	a6 03 3d 7d 	mtspr   29,r9  <=3D=3D granting userspace =
access permission
> c000000000849410:	2c 01 00 4c 	isync
> c000000000849414:	00 00 36 e9 	ld      r9,0(r22)
> c000000000849418:	20 00 29 81 	lwz     r9,32(r9)
> c00000000084941c:	00 02 29 71 	andi.   r9,r9,512
> c000000000849420:	78 d3 5e 7f 	mr      r30,r26
> =3D=3D> c000000000849424:	00 00 bf 8b 	lbz     r29,0(r31)  <=3D=3D access=
ing userspace
> c000000000849428:	10 00 82 41 	beq     c000000000849438 <fault_in_pages_r=
eadable+0x118>
> c00000000084942c:	2c 01 00 4c 	isync
> c000000000849430:	a6 03 bd 7e 	mtspr   29,r21  <=3D=3D clearing userspace=
 access permission
> c000000000849434:	2c 01 00 4c 	isync
>
> My first guess is that the problem is linked to the following function, s=
ee the comment
>
> /*
>   * For kernel thread that doesn't have thread.regs return
>   * default AMR/IAMR values.
>   */
> static inline u64 current_thread_amr(void)
> {
> 	if (current->thread.regs)
> 		return current->thread.regs->amr;
> 	return AMR_KUAP_BLOCKED;
> }
>
> Above function was introduced by commit 48a8ab4eeb82 ("powerpc/book3s64/p=
keys: Don't update SPRN_AMR=20
> when in kernel mode")

Yeah that's a bit of a curly one.

At some point io_uring did kthread_use_mm(), which is supposed to mean
the kthread can operate on behalf of the original process that submitted
the IO.

But because KUAP is implemented using memory protection keys, it depends
on the value of the AMR register, which is not part of the mm, it's in
thread.regs->amr.

And what's worse by the time we're in kthread_use_mm() we no longer have
access to the thread.regs->amr of the original process that submitted
the IO.

We also can't simply move the AMR into the mm, precisely because it's
per thread, not per mm.

So TBH I don't know how we're going to fix this.

I guess we could return AMR=3Dunblocked for kernel threads, but that's
arguably a bug because it allows a process to circumvent memory keys by
asking the kernel to do the access.


cheers
