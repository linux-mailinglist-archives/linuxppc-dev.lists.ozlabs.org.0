Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 564B472AF6D
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Jun 2023 00:16:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qdsk20qNFz3fQG
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Jun 2023 08:16:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=gh6v9LMh;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Q3sVALgd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=gh6v9LMh;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Q3sVALgd;
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qdsj92v8tz3cdD
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Jun 2023 08:15:57 +1000 (AEST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1686435352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ejqz0m9VjFELy9cEgnoQTo9qjHEOQ+IrkiWMVEjBzhc=;
	b=gh6v9LMhGIqwDHTwxIyyBxfZPk5v6QiuvVyiGb08d1x9hWXgm7HPz5whju/xKJ9wlOI7Hq
	AzRsW6Up0FcpiPVswqWqd0ZvefaVra9lEbuRn3Q6lYOOnX9Hs3CZL6UrswZqbat0AjKBMS
	cZVRgh93L6Lm/nHBYVjh/yJIfRVgScNHfbBVKqMrnTJQdELnE/K7bFQjNtLyUVtE+3pnEZ
	y6VvF3ogaAKwBQ0DuYu1V0Ld/3qws2+yTCS4X7g8oldBo9bJUqNoHqTfKEgX+gSNAmEvk6
	mkD/mGIT4hBH7kqVTF2cAk7HWanYRLocwsKJkCEq8s9Jz4/U1o0cfzhjCXChOw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1686435352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ejqz0m9VjFELy9cEgnoQTo9qjHEOQ+IrkiWMVEjBzhc=;
	b=Q3sVALgdzN2U6GI78CLlYcdM+zv5eNsJJ01lzIOMRh7Kc1acgqpvUkHg8utt2KZSKqktdj
	u7FmSJOEYiidbhDA==
To: Michael Ellerman <mpe@ellerman.id.au>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/9] cpu/SMT: Create topology_smt_threads_supported()
In-Reply-To: <20230524155630.794584-4-mpe@ellerman.id.au>
References: <20230524155630.794584-1-mpe@ellerman.id.au>
 <20230524155630.794584-4-mpe@ellerman.id.au>
Date: Sun, 11 Jun 2023 00:15:52 +0200
Message-ID: <878rcr7ylj.ffs@tglx>
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
Cc: linux-arch@vger.kernel.org, x86@kernel.org, dave.hansen@linux.intel.com, mingo@redhat.com, bp@alien8.de, ldufour@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 25 2023 at 01:56, Michael Ellerman wrote:
> +/**
> + * topology_smt_threads_supported - Check if the given number of SMT threads
> + *				    is supported.
> + *
> + * @threads:	The number of SMT threads.
> + */
> +bool topology_smt_threads_supported(unsigned int threads)
> +{
> +	// Only support a single thread or all threads.
> +	return threads == 1 || threads == smp_num_siblings;
> +}

You can make that a simple core function when cpu_smt_*_threads is
consistent along the lines of my previous reply.

static bool cpu_smt_num_threads_valid(unsigned int threads)
{
        if (IS_ENABLED(CONFIG_SMT_NUM_THREADS_DYNAMIC))
		return threads >= 1 && threads <= cpu_smt_max_threads;
        return threads == 1 || threads == cpu_smt_max_threads;
}

Or something like that.

Thanks,

        tglx
