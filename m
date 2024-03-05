Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA188724F9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 17:58:27 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=HKbwYqoG;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=8tNakUsg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tq1wd4V3Kz3vZF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 03:58:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=HKbwYqoG;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=8tNakUsg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tq1vw0b7Mz3c20
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Mar 2024 03:57:47 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1709657861;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HRm+TnjyJg5idEpRreLSl5etxQBLrbJ4QAyjOJxgiHU=;
	b=HKbwYqoGgFwQ5w0c2x4gUshWZq5DHnmoTWFc3/aZZcUsyBPUvs7FtgO9sXWFeAyfxpuEi6
	xlcIADFKW3TAaX8V6Ga3Vk3KxGSZLgdUIYbQXmyX2czdZGrJV+gT+com+2AYsi4w5tCpPe
	P+3R/323Mr+jpB72RGyL7UAB2G4Y24a0f5aPuMXb2XzcFpBHmn6AX+fCh47ITffrAmlSjQ
	X0sd2R+FxjQ3skVdAjuyST0jIZLH7tS9pVec6Q/PgKFl70I0IEfjpeTld2114ViFAQn5Jb
	vMDMFcMAgaGC7ZbfrNWUXKsAS9MSi3fMQV2MyyOkR6PfJ5iMQMb9P8IPdthLhQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1709657861;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HRm+TnjyJg5idEpRreLSl5etxQBLrbJ4QAyjOJxgiHU=;
	b=8tNakUsgVDjiTy1DgFT1yzq4jZIkpWJOqH5pgA+w3enng6vlac/FwllNiicYgryByF76pu
	dUSgco6KK8GYs2CA==
To: Bitao Hu <yaoma@linux.alibaba.com>, Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCHv11 2/4] genirq: Provide a snapshot mechanism for
 interrupt statistics
In-Reply-To: <28a24e4b-c322-4631-ad6d-7259ca3d084d@linux.alibaba.com>
References: <20240228072216.95130-1-yaoma@linux.alibaba.com>
 <20240228072216.95130-3-yaoma@linux.alibaba.com>
 <CAD=FV=U1b+8atmju_w4eRmVKmSqjj6WCsy5EawYqj31fQ1kvrw@mail.gmail.com>
 <87plwdwycx.ffs@tglx>
 <3a89fafb-f62e-472f-b40b-8bf97954e9e3@linux.alibaba.com>
 <87wmqiulaw.ffs@tglx>
 <28a24e4b-c322-4631-ad6d-7259ca3d084d@linux.alibaba.com>
Date: Tue, 05 Mar 2024 17:57:40 +0100
Message-ID: <87h6hkvcor.ffs@tglx>
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
Cc: pmladek@suse.com, tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, jan.kiszka@siemens.com, deller@gmx.de, liusong@linux.alibaba.com, npiggin@gmail.com, linux-kernel@vger.kernel.org, James.Bottomley@hansenpartnership.com, yaoma@linux.alibaba.com, kernelfans@gmail.com, akpm@linux-foundation.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 05 2024 at 18:57, Bitao Hu wrote:
> On 2024/3/4 22:24, Thomas Gleixner wrote:
> "GENERIC_IRQ_STAT_SNAPSHOT" visible to the user. However, after
> analyzing the previous emails, it seems that what you were actually
> proposing was to directly disable "GENERIC_IRQ_STAT_SNAPSHOT" when
> "SOFTLOCKUP_DETECTOR_INTR_STORM" is not enabled, as a way to save
> memory. If my current understanding is correct, then the code for that
> part would look something like the following.

Correct.

> diff --git a/kernel/irq/Kconfig b/kernel/irq/Kconfig
> index 2531f3496ab6..a28e5ac5fc79 100644
> --- a/kernel/irq/Kconfig
> +++ b/kernel/irq/Kconfig
> @@ -108,6 +108,10 @@ config GENERIC_IRQ_MATRIX_ALLOCATOR
>   config GENERIC_IRQ_RESERVATION_MODE
>          bool
>
> +# Snapshot for interrupt statistics
> +config GENERIC_IRQ_STAT_SNAPSHOT
> +       bool
> +
>   # Support forced irq threading
>   config IRQ_FORCED_THREADING
>          bool
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 49f652674bd8..899b69fcb598 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -1032,6 +1032,7 @@ config SOFTLOCKUP_DETECTOR
>   config SOFTLOCKUP_DETECTOR_INTR_STORM
>          bool "Detect Interrupt Storm in Soft Lockups"
>          depends on SOFTLOCKUP_DETECTOR && IRQ_TIME_ACCOUNTING
> +       select GENERIC_IRQ_STAT_SNAPSHOT

This goes into the patch which adds the lockup detector parts.

Thanks,

        tglx
