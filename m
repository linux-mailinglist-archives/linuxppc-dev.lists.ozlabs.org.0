Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEF16C6D6F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 17:26:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pj9hL4Hjzz3f8D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Mar 2023 03:26:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WtAcDI5L;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Yv1j5KZ9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=vschneid@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WtAcDI5L;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Yv1j5KZ9;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pj9gM59B4z3cj9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Mar 2023 03:25:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679588731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Rf1EargHhjBzXfO07IgMLtInuWGSM9rCL6OoPVE8vbA=;
	b=WtAcDI5Li9QEuKB6ODiSX0jbpDGrOdDIqwDU2vDXzdQwZ4qWnByqG4ED6i+CW3k0/Gt+V+
	SVdKQ2jON8/0A7itlPWthpIyCtnBE9lSlxelDZpNicneCJ0cDdPReRYWbuxzJPXW1v+V1a
	wK0EDzKZaf+WDd+bqZnKQXTlkS1uyOQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679588732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Rf1EargHhjBzXfO07IgMLtInuWGSM9rCL6OoPVE8vbA=;
	b=Yv1j5KZ9npGgkOhmsonRh7yVkFGx+qvFcWuu4HV5xDbie6ISSOjJHPtXUxqss8NP1Ohf0Y
	atE43w/TAHJClbILu60Aq+DT7IwPv7vrsfgeaN9LzQPTIFn/T6K3BX2mFOmej/iCpR4fri
	a9cnrxzwTpiruJFOgXNRzvxjnKBVjZQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-282-NgWkUOm3M_WR7Cf0B5YQmw-1; Thu, 23 Mar 2023 12:25:30 -0400
X-MC-Unique: NgWkUOm3M_WR7Cf0B5YQmw-1
Received: by mail-wm1-f70.google.com with SMTP id m5-20020a05600c4f4500b003ee8db23ef9so1076419wmq.8
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Mar 2023 09:25:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679588728;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rf1EargHhjBzXfO07IgMLtInuWGSM9rCL6OoPVE8vbA=;
        b=5WPTtk9qWx1I/zzFYx6ZwN0GgDBz80Dwxld9IbSZI6mUrPhupYumTpqU9MaFakoa+2
         DIPzRGpO6Td0ztw9AIar3wxMiR0Zas0CJuyLesqhASvZUHGdT3RY4JnlheIHf1YEBh3S
         Vj9SOM1YeIWU0sIQO9201v7fqtbO+vvHKDVynciMFH2p8FHaN4Aa3Ti1ROqWD6h6pxBH
         30rAe03jREpO+SJyyhkR7WSq+3Fu02YJWrhIxxG7wo1jJcT+HRawEYYPMARVNgNLaNrl
         E3O3PRdh8EL5pCO99LkktqC2tgXcf6eERn6WV6IwJWDArDEnmi+w+OAOMwKTSBGN+JA+
         COLg==
X-Gm-Message-State: AAQBX9f0I3MYFp5BJenm+Xu5F1GqrvxpFDxVeLAkZ5H/6D1XDwZxqoty
	nExCADkl5k1zaZLApEFUz494xNgGahcU1Ag4nFWbX7oiiya/8hwkh+NgVsyNOMVgJi1tuE07nYw
	7CIjX4qFEcAlaypITV0JoJGjuLA==
X-Received: by 2002:a5d:4568:0:b0:2c7:e5f:e0e0 with SMTP id a8-20020a5d4568000000b002c70e5fe0e0mr2967368wrc.65.1679588728477;
        Thu, 23 Mar 2023 09:25:28 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z2pOP19Ooh7wiG9F4iyBZnUcLGOtnlVl1iiXTySJV6QCXnwRVxEdgZiRrRO9IHVKHT4hkvPQ==
X-Received: by 2002:a5d:4568:0:b0:2c7:e5f:e0e0 with SMTP id a8-20020a5d4568000000b002c70e5fe0e0mr2967333wrc.65.1679588728212;
        Thu, 23 Mar 2023 09:25:28 -0700 (PDT)
Received: from vschneid.remote.csb ([154.57.232.159])
        by smtp.gmail.com with ESMTPSA id d10-20020adfe88a000000b002c70e60abd4sm16586783wrm.2.2023.03.23.09.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 09:25:27 -0700 (PDT)
From: Valentin Schneider <vschneid@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v5 7/7] sched, smp: Trace smp callback causing an IPI
In-Reply-To: <20230322140434.GC2357380@hirez.programming.kicks-ass.net>
References: <20230307143558.294354-1-vschneid@redhat.com>
 <20230307143558.294354-8-vschneid@redhat.com>
 <20230322095329.GS2017917@hirez.programming.kicks-ass.net>
 <xhsmhmt45c703.mognet@vschneid.remote.csb>
 <20230322140434.GC2357380@hirez.programming.kicks-ass.net>
Date: Thu, 23 Mar 2023 16:25:25 +0000
Message-ID: <xhsmhbkkjcu4q.mognet@vschneid.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org, Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Marc Zyngier <maz@kernel.org>, linux-hexagon@vger.kernel.org, x86@kernel.org, Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, "Paul E. McKenney" <paulmck@kernel.org>, Frederic Weisbecker <frederic@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>, Nicholas Piggin <npiggin@gmail.com>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.
 org, Daniel Bristot de Oliveira <bristot@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 22/03/23 15:04, Peter Zijlstra wrote:
> @@ -798,14 +794,20 @@ static void smp_call_function_many_cond(
>  		}
>  
>  		/*
> +		 * Trace each smp_function_call_*() as an IPI, actual IPIs
> +		 * will be traced with func==generic_smp_call_function_single_ipi().
> +		 */
> +		trace_ipi_send_cpumask(cfd->cpumask_ipi, _RET_IP_, func);

I just got a trace pointing out this can emit an event even though no IPI
is sent if e.g. the cond_func predicate filters all CPUs in the argument
mask:

  ipi_send_cpumask:     cpumask= callsite=on_each_cpu_cond_mask+0x3c callback=flush_tlb_func+0x0

Maybe something like so on top?

---
diff --git a/kernel/smp.c b/kernel/smp.c
index ba5478814e677..1dc452017d000 100644
--- a/kernel/smp.c
+++ b/kernel/smp.c
@@ -791,6 +791,8 @@ static void smp_call_function_many_cond(const struct cpumask *mask,
 			}
 		}
 
+		if (!nr_cpus)
+			goto local;
 		/*
 		 * Trace each smp_function_call_*() as an IPI, actual IPIs
 		 * will be traced with func==generic_smp_call_function_single_ipi().
@@ -804,10 +806,10 @@ static void smp_call_function_many_cond(const struct cpumask *mask,
 		 */
 		if (nr_cpus == 1)
 			send_call_function_single_ipi(last_cpu);
-		else if (likely(nr_cpus > 1))
+		else
 			send_call_function_ipi_mask(cfd->cpumask_ipi);
 	}
-
+local:
 	if (run_local && (!cond_func || cond_func(this_cpu, info))) {
 		unsigned long flags;
 

