Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D61AA85B7F0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Feb 2024 10:45:18 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=cCLwgIeV;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=OrKtuVM5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TfDzJ3wT6z3d24
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Feb 2024 20:45:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=cCLwgIeV;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=OrKtuVM5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 527 seconds by postgrey-1.37 at boromir; Tue, 20 Feb 2024 20:44:39 AEDT
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TfDyb0Q3Lz2yth
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Feb 2024 20:44:38 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1708421746;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qMQgNxW/cq/W95W6944hYW0g2WX+zW1/CtYeKCgciio=;
	b=cCLwgIeVqk4CouvgCnTPalK72eB/TqNV+rcqZKi6Ty6+dSv9T3Y/NAgPG2522nRuY/tDEN
	Lf/1TIRYn7YE/IbOrGaA5JltxJnzsSfdcwCXhPDlxxjsBRKe1uqbFVGNpa3XIGPVbbOrrT
	gTSHZymZCXWEmI0fqbfMSbt1Clud/UllJflFtwc2RbZlq9wxsfiFi3pCDlDliXWpiXYPMs
	ygBf7TsBGhhk1YMmn/RZV0akQ6yS4c/JRA3IicgsaS3R1vpsQV5D7wmUv7LlJbhbPiYGaX
	TN6gflLlkdc611Xe6p8vEcSKk1dxclpf4+NikcliEABItbEktKtZH98KNvsWqg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1708421746;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qMQgNxW/cq/W95W6944hYW0g2WX+zW1/CtYeKCgciio=;
	b=OrKtuVM5z5R2D1L6JMmFtnZECQzcxYfqQM8regq0BxlYfBaFai9vdE41U1mrkjSj3F6yV4
	OC6dgfeJgjmh0XCA==
To: Bitao Hu <yaoma@linux.alibaba.com>, dianders@chromium.org,
 pmladek@suse.com, akpm@linux-foundation.org, kernelfans@gmail.com,
 liusong@linux.alibaba.com, deller@gmx.de, npiggin@gmail.com,
 jan.kiszka@siemens.com, kbingham@kernel.org
Subject: Re: [PATCHv8 2/2] watchdog/softlockup: report the most frequent
 interrupts
In-Reply-To: <20240219161920.15752-3-yaoma@linux.alibaba.com>
References: <20240219161920.15752-1-yaoma@linux.alibaba.com>
 <20240219161920.15752-3-yaoma@linux.alibaba.com>
Date: Tue, 20 Feb 2024 10:35:45 +0100
Message-ID: <87le7fiiku.ffs@tglx>
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
Cc: linux-parisc@vger.kernel.org, kvm@vger.kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, Bitao Hu <yaoma@linux.alibaba.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 20 2024 at 00:19, Bitao Hu wrote:
>  arch/mips/dec/setup.c                |   2 +-
>  arch/parisc/kernel/smp.c             |   2 +-
>  arch/powerpc/kvm/book3s_hv_rm_xics.c |   2 +-
>  include/linux/irqdesc.h              |   9 ++-
>  include/linux/kernel_stat.h          |   4 +
>  kernel/irq/internals.h               |   2 +-
>  kernel/irq/irqdesc.c                 |  34 ++++++--
>  kernel/irq/proc.c                    |   9 +--

This really wants to be split into two patches. Interrupt infrastructure
first and then the actual usage site in the watchdog code.

Thanks,

        tglx
