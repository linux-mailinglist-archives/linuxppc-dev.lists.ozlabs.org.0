Return-Path: <linuxppc-dev+bounces-3596-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D25B9DB5DF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Nov 2024 11:43:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XzXwD54r5z2y8k;
	Thu, 28 Nov 2024 21:43:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732790604;
	cv=none; b=BG/8UrhD9I5VN3Pv4IpU6vT1uTudslXwaRJd95yijdyDAAVbac8zlQN/f2LyfS63OhJ+fgZXim2hXzCU/wc/rv6ls6Fe0xiOvcz2k2z35q6hyAO8tdrNV6axKn0C8aFrqVZ6xfxi/TxjAqJ/4OU55XN73ev2LrUopu+aZy4KGITU45AJJaRksrIvEnwxYPaoAy1rFKFeHTqe+XQiUGVtmGbU8OJyIdpdnQml57MW+x5ezjNFI+R4aPk7bqwZNDroktgse4PB3lYQUsTrNVQnZlc6SvObdIWZ9R6rdkXPABPaN4Hqrsnvnt1an+WXb0AnaIFt9Jjk7uQs5v6njY39aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732790604; c=relaxed/relaxed;
	bh=aCmQQl38KHm7OVYLjhjrypJsn1uxlFszVOYpGELlk8w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Zd89TqZby3RK/2knwi+KE155CU1bB7Sbu3zFvfx7L1RY3TutbNftC3Rjv1KtEhCR3UslSU7hGsVe3Goh5InauUTgIhBLWKFthv7cY0Y2ymnLGf5DK+K/QMcIMcqhfCf9gFAO8zSl7lB6n12eiArbGLNQzMb13fYybVsR8IB/y4fnWdsnwqd32IsxVEanuCxY2nZwa4Vyy6LjKEMHCSPBiivsTI9n8HCjNMXUmdMFSAeSPvRWHdtHE8cFQXhaP2vjbypF7TBozMs52VZJ4WisUows4pXI8yz3YCOdVWHAs+4lgSozEm3f7Y8OLX+56FQ4nixyxDp15EWPRylYDVSQqQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=4tOZDNQY; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=uR2GKpLq; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=4tOZDNQY;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=uR2GKpLq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XzXwC4g5Kz2xk1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Nov 2024 21:43:23 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1732790601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aCmQQl38KHm7OVYLjhjrypJsn1uxlFszVOYpGELlk8w=;
	b=4tOZDNQYKL0+NvxpccStVP+xZdeNpJQWALcz+eLwBE8q/HKPqmfO1vItUcZEVjsS3b7FnC
	SezSM2iPWaHhkAK3MH6I/rX++qP9Q9bg37VDOOvnf2iHEm5mQmnKgX8iJ4xoowq2s3HGhw
	G2OlulGMOon2xHAYp0m0GcP6s+6bCtic/XZ1iL/RdyNmfo0KKg4S04gWzp19ijGzATxX1Z
	gxKSrCqfMrO6lL/1hCNFDPF7uhjSNCZAQJJ0T+N1xxz/whh2eJw8+or0CNTrwoszVUWGyB
	AAvRxgEQemBuntahOZl9sB7QB3GmD+T8/G7LpAobv5P89d4/rG0jVQT6BQBaCQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1732790601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aCmQQl38KHm7OVYLjhjrypJsn1uxlFszVOYpGELlk8w=;
	b=uR2GKpLqs0Qu7dVUcL5x5mdbnU24CUpxi/okbTdaQYsFjY/Eci0NPixDGyI35r4CFXBbty
	GSlxQ5S9OBoqqxBQ==
To: Eliav Farber <farbere@amazon.com>, linux@armlinux.org.uk,
 catalin.marinas@arm.com, will@kernel.org, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org,
 maddy@linux.ibm.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, akpm@linux-foundation.org, bhe@redhat.com,
 farbere@amazon.com, hbathini@linux.ibm.com, adityag@linux.ibm.com,
 songshuaishuai@tinylab.org, takakura@valinux.co.jp,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org
Cc: jonnyc@amazon.com
Subject: Re: [PATCH v2] arm64: kexec: Check if IRQ is already masked before
 masking
In-Reply-To: <20241127152236.26122-1-farbere@amazon.com>
References: <20241127152236.26122-1-farbere@amazon.com>
Date: Thu, 28 Nov 2024 11:43:20 +0100
Message-ID: <87ldx3y6yf.ffs@tglx>
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
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Nov 27 2024 at 15:22, Eliav Farber wrote:

As a related note. The subject line is not really matching what the
patch does. It want's to be split into a core change and one patch per
architecture.

> This patch replaces the direct invocation of the irq_mask() and

git grep 'This patch' Documentation/process/

> irq_disable() hooks with simplified code that leverages the
> irq_disable() kernel infrastructure. This higher-level function checks
> the interrupt's state to prevent redundant operations. Additionally, the
> IRQ_DISABLE_UNLAZY status flag is set to ensure that, for interrupt
> chips lacking an irq_disable callback, the disable operation is handled
> using the lazy approach.

Not that it matters much anymore, but the last sentence does not make
sense:

  Set the UNLAZY flag so disable is handled using the LAZY approach ...

Thanks,

        tglx

