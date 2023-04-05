Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 532746D7CE8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Apr 2023 14:46:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ps4B313jvz3f3r
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Apr 2023 22:46:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GER116tg;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VOaUqbHi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=vschneid@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GER116tg;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VOaUqbHi;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ps49816PGz30Mn
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Apr 2023 22:45:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680698711;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rJlvbrDO3MZW25EtVUfp0HoO311UYJgGKtfX/KEqF/k=;
	b=GER116tgb+iYLrIT7d4YCy70CvkCC3ZTYBKLxajJxbZgXuyKM2JcZML6stGxqYHRr9T3HP
	v8nxW5K3mkeZs7BYaINTyAH6JCw+5alZIbchu93T79G7V2a+W0U8fV0muR1w1xJg8nfw83
	Gk8E7tl2N3FaU5OmliSluZx/6RQwOf8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680698712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rJlvbrDO3MZW25EtVUfp0HoO311UYJgGKtfX/KEqF/k=;
	b=VOaUqbHiE2KsX8j2+ZaPdjQNGPnRZ9gzSveDOemwB5nBg1nBwszCop6W9KedLMPRnNo8F4
	n6EMZrbQxaC2DSYJBnMfzopwRq87/kwjjjoX4obd71FfOfYt+ZECHGV0vgFaBfi2c9BBAI
	xG7uzYQiemNmxwSYm6urcvQS8XCwYyU=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-256-WIxacERQOcWw8yVk4eP-IQ-1; Wed, 05 Apr 2023 08:45:10 -0400
X-MC-Unique: WIxacERQOcWw8yVk4eP-IQ-1
Received: by mail-qk1-f200.google.com with SMTP id z187-20020a3765c4000000b007468706dfb7so16000023qkb.9
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Apr 2023 05:45:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680698710;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rJlvbrDO3MZW25EtVUfp0HoO311UYJgGKtfX/KEqF/k=;
        b=0nrczxH3b6tlEvocffGnENmHcqtD8vwN/3aQ9WRh8rV1cbaz5cKWT/gDz8SDtZPUU8
         6qo3CNnCVBY/niDplNCDXt/q3B5PZ+KB+vWyqAfMk+cg8zVPPqdymx857qgCgs8Poig3
         7QqEOtFO0nO2Rq/9FbXYJvG7TQQev9Q6gbufoxu3hC4xYA5XxyXyA7thyz6NSNPCQBdU
         HC+s4iiX0TqVkvetnEz/EsnJjkzWGvzK/fxl2lA9PeITJ/am63hHnOVMgngG/A4ZGDms
         bP8/So+VMvVVS7nawSKGKVBlG4TPnnH0NHgIPz1+Z2xIEmKLcRT5GoZjo1/deVoJAJgD
         4Avw==
X-Gm-Message-State: AAQBX9c69E+pIJqKZ5tj5hXvM926hwpchSQ6fmcHB5EMJtWuGTh3y/Of
	gpIHC4KakvHPoh8UtGTS1Br0ywR6GmE1E0n3H6eTaip7rGC7ZxWyOIrN9fbaPOvDeBgUxwYBOjc
	EF1cnN+U7dsdsOHDzDtU7FK6J+g==
X-Received: by 2002:a05:622a:1716:b0:3e4:eb03:687d with SMTP id h22-20020a05622a171600b003e4eb03687dmr4303584qtk.44.1680698709897;
        Wed, 05 Apr 2023 05:45:09 -0700 (PDT)
X-Google-Smtp-Source: AKy350YM3193lIgKl2aWj9mqpkVtYuh0l9dX5dcxwgxaNjVBgfvhxy0L8/57jtC9NbW/iCG3sMx10Q==
X-Received: by 2002:a05:622a:1716:b0:3e4:eb03:687d with SMTP id h22-20020a05622a171600b003e4eb03687dmr4303502qtk.44.1680698709447;
        Wed, 05 Apr 2023 05:45:09 -0700 (PDT)
Received: from vschneid.remote.csb ([154.57.232.159])
        by smtp.gmail.com with ESMTPSA id t186-20020a37aac3000000b00746b7372d62sm4415939qke.27.2023.04.05.05.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 05:45:08 -0700 (PDT)
From: Valentin Schneider <vschneid@redhat.com>
To: Frederic Weisbecker <frederic@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>
Subject: Re: [PATCH 3/3] mm/mmu_gather: send tlb_remove_table_smp_sync IPI
 only to CPUs in kernel mode
In-Reply-To: <ZC1j8ivE/kK7+Gd5@lothringen>
References: <20230404134224.137038-1-ypodemsk@redhat.com>
 <20230404134224.137038-4-ypodemsk@redhat.com>
 <ZC1Q7uX4rNLg3vEg@lothringen> <ZC1XD/sEJY+zRujE@lothringen>
 <20230405114148.GA351571@hirez.programming.kicks-ass.net>
 <ZC1j8ivE/kK7+Gd5@lothringen>
Date: Wed, 05 Apr 2023 13:45:02 +0100
Message-ID: <xhsmhpm8ia46p.mognet@vschneid.remote.csb>
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
Cc: geert+renesas@glider.be, tony@atomide.com, linus.walleij@linaro.org, dave.hansen@linux.intel.com, Yair Podemsky <ypodemsk@redhat.com>, sebastian.reichel@collabora.com, linux-mm@kvack.org, hpa@zytor.com, sparclinux@vger.kernel.org, agordeev@linux.ibm.com, will@kernel.org, ardb@kernel.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, arnd@arndb.de, paulmck@kernel.org, aneesh.kumar@linux.ibm.com, x86@kernel.org, linux@armlinux.org.uk, mingo@redhat.com, samitolvanen@google.com, borntraeger@linux.ibm.com, keescook@chromium.org, gor@linux.ibm.com, hca@linux.ibm.com, npiggin@gmail.com, rmk+kernel@armlinux.org.uk, bp@alien8.de, nick.hawkins@hpe.com, tglx@linutronix.de, jpoimboe@kernel.org, linux-arm-kernel@lists.infradead.org, alougovs@redhat.com, mtosatti@redhat.com, linux-kernel@vger.kernel.org, juerg.haefliger@canonical.com, svens@linux.ibm.com, dhildenb@redhat.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 05/04/23 14:05, Frederic Weisbecker wrote:
>  static void smp_call_function_many_cond(const struct cpumask *mask,
>                                       smp_call_func_t func, void *info,
> @@ -946,10 +948,13 @@ static void smp_call_function_many_cond(const struct cpumask *mask,
>  #endif
>                       cfd_seq_store(pcpu->seq_queue, this_cpu, cpu, CFD_SEQ_QUEUE);
>                       if (llist_add(&csd->node.llist, &per_cpu(call_single_queue, cpu))) {
> -				__cpumask_set_cpu(cpu, cfd->cpumask_ipi);
> -				nr_cpus++;
> -				last_cpu = cpu;
> -
> +				if (!(scf_flags & SCF_NO_USER) ||
> +				    !IS_ENABLED(CONFIG_GENERIC_ENTRY) ||
> +				     ct_state_cpu(cpu) != CONTEXT_USER) {
> +					__cpumask_set_cpu(cpu, cfd->cpumask_ipi);
> +					nr_cpus++;
> +					last_cpu = cpu;
> +				}

I've been hacking on something like this (CSD deferral for NOHZ-full),
and unfortunately this uses the CPU-local cfd_data storage thing, which
means any further smp_call_function() from the same CPU to the same
destination will spin on csd_lock_wait(), waiting for the target CPU to
come out of userspace and flush the queue - and we've just spent extra
effort into *not* disturbing it, so that'll take a while :(

I don't have much that is in a shareable state yet (though I'm supposed to
talk some more about it at OSPM in <2 weeks, so I'll have to get there),
but ATM I'm playing with
o a bitmask (like in [1]) for coalescable stuff such as do_sync_core() for
  x86 instruction patching
o a CSD-like queue for things that need to pass data around, using
  statically-allocated storage (so with a limit on how much it can be used) - the
  alternative being allocating a struct on sending, since you don't have a
  bound on how much crap you can queue on an undisturbed NOHZ-full CPU...

[1]: https://lore.kernel.org/all/20210929152429.067060646@infradead.org/

