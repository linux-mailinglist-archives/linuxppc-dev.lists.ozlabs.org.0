Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FFA596EB2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Aug 2022 14:49:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M77B21fgTz3cdY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Aug 2022 22:48:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=OWOFpkz+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=OWOFpkz+;
	dkim-atps=neutral
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M779M3xRFz2xgN
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Aug 2022 22:48:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=1qmsUsB+4SBL13h98w97pLya6IvHEpIdUKliGvuz3Dw=; b=OWOFpkz+Ko9XgkcpKc1GMq7+TX
	ANlnrr10yPCb1OwelWivsKmunjQoAgn7A9GQd+Am39PQjMbuAJsXd/Pq/c+g05OdWn/PkfzXb7bp9
	rLOLVteaZlcASPS6sAIppv1VHJAppyCgHlOhOuM0W3MRSnmFsT8hhnWZhNdGOHMoJZ/jmEQM/bZzx
	jlJMeaXNueMP3TIu7Wp85XsfthG2V29eQyDUVcyRj3fhyWdQAIK23zXvHZCOTE3PELP2UecxBg0Ue
	uLF5CWcEScvwgUmZUzh/98YhCbDJNPGm7NJJULOA1gDY36pxvMJu1RsvAY9KnqifAnxlfkG/OPiYd
	tYq383Pw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=worktop.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOISg-003HpW-Mc; Wed, 17 Aug 2022 12:47:56 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
	id C3BE1980256; Wed, 17 Aug 2022 14:47:52 +0200 (CEST)
Date: Wed, 17 Aug 2022 14:47:52 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Marco Elver <elver@google.com>
Subject: Re: [PATCH v3 10/14] locking/percpu-rwsem: Add
 percpu_is_write_locked() and percpu_is_read_locked()
Message-ID: <YvzjeEHYX9d5dhAt@worktop.programming.kicks-ass.net>
References: <20220704150514.48816-1-elver@google.com>
 <20220704150514.48816-11-elver@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220704150514.48816-11-elver@google.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-sh@vger.kernel.org, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Frederic Weisbecker <frederic@kernel.org>, x86@kernel.org, linuxppc-dev@lists.ozlabs.org, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, kasan-dev@googlegroups.com, Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jiri Olsa <jolsa@redhat.com>, Ingo Molnar <mingo@kernel.org>, Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 04, 2022 at 05:05:10PM +0200, Marco Elver wrote:

> +bool percpu_is_read_locked(struct percpu_rw_semaphore *sem)
> +{
> +	return per_cpu_sum(*sem->read_count) != 0;
> +}
> +EXPORT_SYMBOL_GPL(percpu_is_read_locked);

I don't think this is correct; read_count can have spurious increments.

If we look at __percpu_down_read_trylock(), it does roughly something
like this:

	this_cpu_inc(*sem->read_count);
	smp_mb();
	if (!sem->block)
		return true;
	this_cpu_dec(*sem->read_count);
	return false;

So percpu_is_read_locked() needs to ensure the read_count is non-zero
*and* that block is not set.

That said; I really dislike the whole _is_locked family with a passion.
Let me try and figure out what you need this for.
