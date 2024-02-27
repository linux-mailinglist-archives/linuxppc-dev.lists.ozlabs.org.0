Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC855868C36
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 10:27:44 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=LBXzZyzp;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=C8mTHtGb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TkXFp36m3z3vZT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 20:27:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=LBXzZyzp;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=C8mTHtGb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TkXF227Vsz3cQg
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Feb 2024 20:27:02 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1709026015;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B2DNoua1xXX/U7MFUA3YAYMVHqRpCwfO/mAGYY3xBzc=;
	b=LBXzZyzpTdtFHY2VpBGJuBijVqvUA1/5HqeGa9x0azN7ESTVKdASwMyQMCNvsEfplBSqWD
	lYadRJTx9WvXlMP6RQQ2fiBOwpZxOBQeiQACRizedDCtqrnApMlbjXaXebOu0gQz+e1IBF
	/+kjcWbjdLBsblLwcFZV1fQD0vr4mYtyMpHsUDjWd1/2Po+GhloYKuerl6A0A0suFrUp3f
	G7e2YaJ5PkaxdwQFfGLfGgCatP0tKtBkU+Dw6bbClyOrxJ8gyIrv4+2VTwSm+bp3Dz9yZf
	ij+ctMoFxVbQNnrg8AjT5/sU76h9JQ+VdeCVSWAoME/7f484RDK2pWxhj+Q5fQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1709026015;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B2DNoua1xXX/U7MFUA3YAYMVHqRpCwfO/mAGYY3xBzc=;
	b=C8mTHtGbmzr9wsRK3X5g+Sxjc/EK71HQgCXHKl29hrvYxg92eeCD5tIpuo8n/BoE+A+z9x
	zYhhKfoOOpl5hPAA==
To: Bitao Hu <yaoma@linux.alibaba.com>, dianders@chromium.org,
 liusong@linux.alibaba.com, akpm@linux-foundation.org, pmladek@suse.com,
 kernelfans@gmail.com, deller@gmx.de, npiggin@gmail.com,
 tsbogend@alpha.franken.de, James.Bottomley@HansenPartnership.com,
 jan.kiszka@siemens.com
Subject: Re: [PATCHv10 3/4] genirq: Avoid summation loops for /proc/interrupts
In-Reply-To: <20240226020939.45264-4-yaoma@linux.alibaba.com>
References: <20240226020939.45264-1-yaoma@linux.alibaba.com>
 <20240226020939.45264-4-yaoma@linux.alibaba.com>
Date: Tue, 27 Feb 2024 10:26:55 +0100
Message-ID: <87le769s0w.ffs@tglx>
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
Cc: yaoma@linux.alibaba.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 26 2024 at 10:09, Bitao Hu wrote:
> We could use the irq_desc::tot_count member to avoid the summation
> loop for interrupts which are not marked as 'PER_CPU' interrupts in
> 'show_interrupts'. This could reduce the time overhead of reading
> /proc/interrupts.

"Could" is not really a technical term. Either we do or we do not. Also
please provide context for your change and avoid the 'We'.

> --- a/include/linux/irqdesc.h
> +++ b/include/linux/irqdesc.h
> @@ -121,6 +121,8 @@ static inline void irq_unlock_sparse(void) { }
>  extern struct irq_desc irq_desc[NR_IRQS];
>  #endif
>
> +extern bool irq_is_nmi(struct irq_desc *desc);
> +

If at all this wants to be in kernel/irq/internal.h. There is zero
reason to expose this globally.

> -static bool irq_is_nmi(struct irq_desc *desc)
> +bool irq_is_nmi(struct irq_desc *desc)
>  {
>  	return desc->istate & IRQS_NMI;
>  }

If at all this really wants to be a static inline in internals.h, but
instead of blindly copying code this can be done smarter:

unsigned int kstat_irq_desc(struct irq_desc *desc)
{
	unsigned int sum = 0;
	int cpu;

	if (!irq_settings_is_per_cpu_devid(desc) &&
	    !irq_settings_is_per_cpu(desc) &&
	    !irq_is_nmi(desc))
		return data_race(desc->tot_count);

	for_each_possible_cpu(cpu)
		sum += data_race(*per_cpu_ptr(desc->kstat_irqs, cpu));
	return sum;
}

and then let kstat_irqs() and show_interrupts() use it. See?

With that a proper changelog would be:

   show_interrupts() unconditionally accumulates the per CPU interrupt
   statistics to determine whether an interrupt was ever raised.

   This can be avoided for all interrupts which are not strictly per CPU
   and not of type NMI because those interrupts provide already an
   accumulated counter. The required logic is already implemented in
   kstat_irqs().

   Split the inner access logic out of kstat_irqs() and use it for
   kstat_irqs() and show_interrupts() to avoid the accumulation loop
   when possible.

Thanks,

        tglx
