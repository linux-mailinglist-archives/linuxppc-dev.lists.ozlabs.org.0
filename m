Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE38B230C42
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jul 2020 16:17:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BGJfp1WbTzDqD4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jul 2020 00:17:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BGJWk2x3tzDqwD
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jul 2020 00:11:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=oXeGPn+K; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4BGJWj6QRBz9sVp; Wed, 29 Jul 2020 00:11:45 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BGJWh4sw9z9sVb;
 Wed, 29 Jul 2020 00:11:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1595945505;
 bh=Jr1H6AmsOFd6wTE49i8eBM9OqNwxXtvoMSicvum3Wvo=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=oXeGPn+KVCSQFACUnb2GXogPgbHjKrsSt0TsKxBJyKHYiMPL1s/86Yga4cFrQN9HS
 //9iBGFHmZOw97SSVu+3JOVYUeYTnsIPcr2d4EsrpagQzKCRdVfWa39PWCgfNbXOjN
 SQYRNCtM+EF9evN9kMgecsSmIVXH1SYnJbpHa2kE1I18JTtFPjCnR+J/o/z+5319zJ
 h/iqffcIA1XoHRg7WD40C58vA3RDgwTO5sEfo5Bmj0uNZiW9fYKgAYSxpxsHQ1aK4S
 t/nsfraMM2C6O0i7eFT4keDyCoDI1Uxsloy/h77l7BeUE/Ln0L9jQLuFSF32j2iW6t
 dL9BJrYyRRwvA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Hari Bathini <hbathini@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [RESEND PATCH v5 08/11] ppc64/kexec_file: setup backup region for
 kdump kernel
In-Reply-To: <159579235754.5790.5203600072984600891.stgit@hbathini>
References: <159579157320.5790.6748078824637688685.stgit@hbathini>
 <159579235754.5790.5203600072984600891.stgit@hbathini>
Date: Wed, 29 Jul 2020 00:11:43 +1000
Message-ID: <87y2n36868.fsf@mpe.ellerman.id.au>
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
Cc: Pingfan Liu <piliu@redhat.com>, Kexec-ml <kexec@lists.infradead.org>,
 Mimi Zohar <zohar@linux.ibm.com>, Nayna Jain <nayna@linux.ibm.com>,
 Petr Tesarik <ptesarik@suse.cz>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Sourabh Jain <sourabhjain@linux.ibm.com>, lkml <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>, Eric Biederman <ebiederm@xmission.com>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>, Dave Young <dyoung@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hari Bathini <hbathini@linux.ibm.com> writes:
> diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
> index a5c1442590b2..88408b17a7f6 100644
> --- a/arch/powerpc/kexec/file_load_64.c
> +++ b/arch/powerpc/kexec/file_load_64.c
> @@ -697,6 +699,69 @@ static int update_usable_mem_fdt(void *fdt, struct crash_mem *usable_mem)
>  	return ret;
>  }
>  
> +/**
> + * load_backup_segment - Locate a memory hole to place the backup region.
> + * @image:               Kexec image.
> + * @kbuf:                Buffer contents and memory parameters.
> + *
> + * Returns 0 on success, negative errno on error.
> + */
> +static int load_backup_segment(struct kimage *image, struct kexec_buf *kbuf)
> +{
> +	void *buf;
> +	int ret;
> +
> +	/* Setup a segment for backup region */
> +	buf = vzalloc(BACKUP_SRC_SIZE);

This worried me initially, because we can't copy from physically
discontiguous pages in real mode.

But as you explained this buffer is not used for copying.

I think if you move the large comment below up here, it would be
clearer.


> diff --git a/arch/powerpc/purgatory/trampoline_64.S b/arch/powerpc/purgatory/trampoline_64.S
> index 464af8e8a4cb..d4b52961f592 100644
> --- a/arch/powerpc/purgatory/trampoline_64.S
> +++ b/arch/powerpc/purgatory/trampoline_64.S
> @@ -43,14 +44,38 @@ master:
>  	mr	%r17,%r3	/* save cpu id to r17 */
>  	mr	%r15,%r4	/* save physical address in reg15 */
>  
> +	bl	0f		/* Work out where we're running */
> +0:	mflr	%r18

I know you just moved it, but this should use:

	bcl	20, 31, $+4
	mflr	%r18

Which is a special form of branch and link that doesn't unbalance the
link stack in the chip.

> +	/*
> +	 * Copy BACKUP_SRC_SIZE bytes from BACKUP_SRC_START to
> +	 * backup_start 8 bytes at a time.
> +	 *
> +	 * Use r3 = dest, r4 = src, r5 = size, r6 = count
> +	 */
> +	ld	%r3,(backup_start - 0b)(%r18)
> +	cmpdi	%cr0,%r3,0

I prefer spaces or tabs between arguments, eg:

	cmpdi	%cr0, %r3, 0

> +	beq	80f		/* skip if there is no backup region */

Local labels will make this clearer I think. eg:

	beq	.Lskip_copy

> +	lis	%r5,BACKUP_SRC_SIZE@h
> +	ori	%r5,%r5,BACKUP_SRC_SIZE@l
> +	cmpdi	%cr0,%r5,0
> +	beq	80f		/* skip if copy size is zero */
> +	lis	%r4,BACKUP_SRC_START@h
> +	ori	%r4,%r4,BACKUP_SRC_START@l
> +	li	%r6,0
> +70:

.Lcopy_loop:

> +	ldx	%r0,%r6,%r4
> +	stdx	%r0,%r6,%r3
> +	addi	%r6,%r6,8
> +	cmpld	%cr0,%r6,%r5
> +	blt	70b

	blt	.Lcopy_loop

> +

.Lskip_copy:

> +80:
>  	or	%r3,%r3,%r3	/* ok now to high priority, lets boot */
>  	lis	%r6,0x1
>  	mtctr	%r6		/* delay a bit for slaves to catch up */
>  	bdnz	.		/* before we overwrite 0-100 again */


cheers
