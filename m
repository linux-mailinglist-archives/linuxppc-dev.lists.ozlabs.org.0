Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E2B86E970
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Mar 2024 20:23:40 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=lt5xGL4i;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=GQe+ObDJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TmdL16jgfz3vZY
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Mar 2024 06:23:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=lt5xGL4i;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=GQe+ObDJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TmdKJ6Xt4z3dWk
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Mar 2024 06:23:00 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1709320974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4YMpY8/JpqyvoIt2gTWiMpRfebnk0Oqv1/khPRGpbCE=;
	b=lt5xGL4ikp2rMYJDfZ7HvTc51J0sK0wPz+5c8vFx1SuS27stYaJOWuKM8UWBr5+pgOT4Px
	/zf1ECIiqu/o9bDNXwd0OmwFvn3wr5s6TWTh22XQgJnd6zNcYHvNw3H+EjqkCRzzHyGlCK
	9c0McLTbOgJYwbxjj3ufVtBUaYTbp1OW9F0wWwGg67WLBjIW6BXQ6uACYMaX/U19dW7hVE
	7YFSbHNtjH9wi+H5aXUENJ0WYyrEuLnL22HQ9pNMUw1GoSzpgNifD5GbZh1qfFM9H40tVf
	8sahtMCI3rvRxY+czEM18S9Ga4W7B19CKnB0D8BHfOsg6bSvXKNzJzKLNOWfWA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1709320974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4YMpY8/JpqyvoIt2gTWiMpRfebnk0Oqv1/khPRGpbCE=;
	b=GQe+ObDJ3PZr8qn2Ba8iOXvXOcVj7SM/gbg0My85H7/CKDbtY8JoxFhCmURN3Iwmiu2nfV
	rZD31bO4dKD6t8DQ==
To: Doug Anderson <dianders@chromium.org>, Bitao Hu <yaoma@linux.alibaba.com>
Subject: Re: [PATCHv11 2/4] genirq: Provide a snapshot mechanism for
 interrupt statistics
In-Reply-To: <CAD=FV=U1b+8atmju_w4eRmVKmSqjj6WCsy5EawYqj31fQ1kvrw@mail.gmail.com>
References: <20240228072216.95130-1-yaoma@linux.alibaba.com>
 <20240228072216.95130-3-yaoma@linux.alibaba.com>
 <CAD=FV=U1b+8atmju_w4eRmVKmSqjj6WCsy5EawYqj31fQ1kvrw@mail.gmail.com>
Date: Fri, 01 Mar 2024 20:22:54 +0100
Message-ID: <87plwdwycx.ffs@tglx>
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
Cc: pmladek@suse.com, tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, jan.kiszka@siemens.com, deller@gmx.de, liusong@linux.alibaba.com, npiggin@gmail.com, linux-kernel@vger.kernel.org, James.Bottomley@hansenpartnership.com, kernelfans@gmail.com, akpm@linux-foundation.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Doug!

On Wed, Feb 28 2024 at 14:44, Doug Anderson wrote:
> I won't insist on it, but I continue to worry about memory
> implications with large numbers of CPUs. With a 4-byte int, 8192 max
> CPUs, and 100 IRQs the extra "ref" value takes up over 3MB of memory
> (8192 * 4 bytes * 100).
>
> Technically, you could add a new symbol like "config
> NEED_IRQ_SNAPSHOTS". This wouldn't be a symbol selectable by the end
> user but would automatically be selected by "config
> SOFTLOCKUP_DETECTOR_INTR_STORM". If the config wasn't defined then the
> struct wouldn't contain "ref" and the snapshot routines would just be
> static inline stubs.
>
> Maybe Thomas has an opinion about whether this is something to worry
> about. Worst case it wouldn't be hard to do in a follow-up patch.

I'd say it makes sense to give people a choice to save memory especially
when the softlock detector code is not enabled.

It's rather straight forward to do.

Thanks,

        tglx
---
--- a/include/linux/irqdesc.h
+++ b/include/linux/irqdesc.h
@@ -24,7 +24,9 @@ struct pt_regs;
  */
 struct irqstat {
 	unsigned int	cnt;
+#ifdef CONFIG_GENIRQ_STAT_SNAPSHOT
 	unsigned int	ref;
+#endif
 };
 
 /**
--- a/kernel/irq/irqdesc.c
+++ b/kernel/irq/irqdesc.c
@@ -978,6 +978,7 @@ static unsigned int kstat_irqs(unsigned
 	return sum;
 }
 
+#ifdef CONFIG_GENIRQ_STAT_SNAPSHOT
 void kstat_snapshot_irqs(void)
 {
 	struct irq_desc *desc;
@@ -998,6 +999,7 @@ unsigned int kstat_get_irq_since_snapsho
 		return 0;
 	return this_cpu_read(desc->kstat_irqs->cnt) - this_cpu_read(desc->kstat_irqs->ref);
 }
+#endif
 
 /**
  * kstat_irqs_usr - Get the statistics for an interrupt from thread context
--- a/kernel/irq/Kconfig
+++ b/kernel/irq/Kconfig
@@ -108,6 +108,10 @@ config GENERIC_IRQ_MATRIX_ALLOCATOR
 config GENERIC_IRQ_RESERVATION_MODE
 	bool
 
+# Snapshot for interrupt statistics
+config GENERIC_IRQ_STAT_SNAPSHOT
+	bool
+
 # Support forced irq threading
 config IRQ_FORCED_THREADING
        bool
