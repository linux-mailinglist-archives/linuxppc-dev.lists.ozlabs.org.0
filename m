Return-Path: <linuxppc-dev+bounces-8538-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BA0AB54C1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 May 2025 14:27:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZxbN51WHgz2y0B;
	Tue, 13 May 2025 22:27:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747139269;
	cv=none; b=ZkR3UugvqHbRUdZs265IPKU5iL0MUZQSiRrl6XBscf173rRcWpoGzVF6ETTfataOUu6PRUwccDcn7wSlYZIDp1x5QCOP4frwN5l1Km7B7Lnf6yaIIBqkGQ7HGo2R4xJR3DHu/D8R2QalrC0MQ5ARLGVdIdKid7/f6AORTIokRsUOFQweOX3NZKMZnKwtUSgSUvKgYvSzQD5aHNH6/5dQt+5/H5Y4Wq2fF+HacXP7vRSa35dGxVem6REMif2A6ZBdDxZFAkDehyWEid3omOMW8rg2jRG+ymcMSuZ+v2t1NLZtN1zyM3X3NOg2Qfb0+lB1a1DLdtSK/CTyiBNz9MdElw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747139269; c=relaxed/relaxed;
	bh=roEKt1Srlmkdzg64X708Duq0Iz59s1exkIC/EuuZb6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lneVFCDoORAHHWaokxeB9zH81KTQwuZ1+KSgWKXs4WP9S9YjcP1SbzKzuLXRG4+CukED/TdOpVVdmiZya/uW7q6HSblMmONWMdcu0qHu5Bp5ttaHernNRgVcb7Dv+qlNRjZhDPpfxQhGmiUmhqRlNFv0KGgU5p9R5joyY4NWxJ17kk4yrSUtPrs6uc2qtIkbqC2Qh5ekxnC0LmvofMwDKtXJO9PoMbngWNaGIbTIAoLHROpyo3gYBzFGLMpg7LMm962GyjtKYX6Kt3Q41IRG9tMMgaLa5JMru0dXmMr8q1Qc5ocxFII4ox8bEsLa2tWK7glHnkZJGL0W96wg7y1e4Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org; dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=lcAd1Gox; dkim-atps=neutral; spf=pass (client-ip=2404:9400:2221:ea00::3; helo=mail.ozlabs.org; envelope-from=paulus@gandalf.ozlabs.org; receiver=lists.ozlabs.org) smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=lcAd1Gox;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gandalf.ozlabs.org (client-ip=2404:9400:2221:ea00::3; helo=mail.ozlabs.org; envelope-from=paulus@gandalf.ozlabs.org; receiver=lists.ozlabs.org)
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZxbN40HYvz2xtt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 May 2025 22:27:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1747139266;
	bh=roEKt1Srlmkdzg64X708Duq0Iz59s1exkIC/EuuZb6U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lcAd1Gox4eJ3QmD5LdrUotW6oXC+uqO0h+uIWFUrw8nGVRvRyXCg9dg9q0BY5tTQU
	 PCKoApRVZSKHmQyO26S9qSCFgT/MQ2JfZh9MnloNvBMxhuHR6o2ZD2+lSLhCoRERtS
	 mR0Cc3aks4SG1LzwV4Yk202SNJJoZon44JHt/vFwlQDlRgkylVZtRFmqdQLTBwf4+1
	 ivJ5FMbSpE76HYb0hsZL+UsZf3bLSGSlRQTC+ulld7J0iPcYMBwGMWWmdJD4cWdn/v
	 kx7zhb1I0BeNZBwItDOicQA8brDitcfFjfWbZfwH+d37mZSf13wXZoa4+RhMEQVUtq
	 6mbIcIAMA8k1w==
Received: by gandalf.ozlabs.org (Postfix, from userid 1003)
	id 4ZxbN254hrz4x3J; Tue, 13 May 2025 22:27:46 +1000 (AEST)
Date: Tue, 13 May 2025 22:27:40 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: Crash in __do_IRQ with gcc 15
Message-ID: <aCM6vKAdNrox9wjp@bruin>
References: <aB6teOoVLWkdvyBu@bruin>
 <87y0v2sdwp.fsf@mpe.ellerman.id.au>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y0v2sdwp.fsf@mpe.ellerman.id.au>
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, May 12, 2025 at 01:31:34PM +1000, Michael Ellerman wrote:

> Are you building with pcrel? Otherwise r2 shouldn't be getting used as
> an ordinary register.

Yes, CONFIG_PPC_KERNEL_PCREL=y.  I'll try with n and see what happens.

> Can you show the disassembly of where it's getting used?

c00000000000fc50 <__do_IRQ>:
c00000000000fc50:	a6 02 08 7c 	mflr    r0
c00000000000fc54:	f0 ff c1 fb 	std     r30,-16(r1)
c00000000000fc58:	f8 ff e1 fb 	std     r31,-8(r1)
c00000000000fc5c:	26 01 10 06 	pla     r2,19317860	# c00000000127c0c0 <__irq_regs>
c00000000000fc60:	64 c4 40 38 
c00000000000fc64:	2e 01 10 06 	pla     r10,19857060	# c0000000012ffb08 <hardirq_ctx>
c00000000000fc68:	a4 fe 40 39 
c00000000000fc6c:	10 00 01 f8 	std     r0,16(r1)
c00000000000fc70:	d1 ff 21 f8 	stdu    r1,-48(r1)
c00000000000fc74:	20 00 0d e9 	ld      r8,32(r13)
c00000000000fc78:	78 13 49 7c 	mr      r9,r2
c00000000000fc7c:	2a 40 c9 7f 	ldx     r30,r9,r8
c00000000000fc80:	2a 49 68 7c 	stdx    r3,r8,r9
c00000000000fc84:	00 00 2d a1 	lhz     r9,0(r13)
c00000000000fc88:	24 1f 29 79 	sldi    r9,r9,3
c00000000000fc8c:	2a 48 ea 7f 	ldx     r31,r10,r9
c00000000000fc90:	64 04 29 78 	clrrdi  r9,r1,14
c00000000000fc94:	40 48 3f 7c 	cmpld   r31,r9
c00000000000fc98:	24 00 82 40 	bne     c00000000000fcbc <__do_IRQ+0x6c>
c00000000000fc9c:	78 0b 24 7c 	mr      r4,r1
c00000000000fca0:	e5 f9 ff 4b 	bl      c00000000000f684 <__do_irq>
c00000000000fca4:	26 01 10 06 	pla     r2,19317788	# c00000000127c0c0 <__irq_regs>
c00000000000fca8:	1c c4 40 38 
c00000000000fcac:	20 00 2d e9 	ld      r9,32(r13)
c00000000000fcb0:	30 00 21 38 	addi    r1,r1,48
c00000000000fcb4:	2a 11 c9 7f 	stdx    r30,r9,r2
c00000000000fcb8:	4c c0 50 48 	b       c00000000051bd04 <_restgpr0_30>
c00000000000fcbc:	e1 3f 3f f8 	stdu    r1,16352(r31)
c00000000000fcc0:	78 0b 24 7c 	mr      r4,r1
c00000000000fcc4:	78 fb e1 7f 	mr      r1,r31
c00000000000fcc8:	bd f9 ff 4b 	bl      c00000000000f684 <__do_irq>
c00000000000fccc:	00 00 21 e8 	ld      r1,0(r1)
c00000000000fcd0:	dc ff ff 4b 	b       c00000000000fcac <__do_IRQ+0x5c>

That's the whole of __do_IRQ().  It explodes at c00000000000fcb4 after
the return from the call to __do_irq() at c00000000000fcc8, which is
the one in the inline asm.  The compiler does reload r2 after the
ordinary call to __do_irq() at c00000000000fca0.

> There was a change to r2 handling in GCC 15, but AFAICS it was meant to
> only affect pcrel code.
> 
> Still it's likely our bug because we are being weird and calling a
> function inside an inline asm block.

Yep.

Thanks,
Paul.

