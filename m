Return-Path: <linuxppc-dev+bounces-3710-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 940A49E1A48
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2024 12:04:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2d8V3Qlfz2yLB;
	Tue,  3 Dec 2024 22:04:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733223882;
	cv=none; b=Qe/UBJCiLCcvyvpwKLDmF0R/iQttMvDRt+f9tqJ++bSr0alE66VrbEyqwbX1I/m7j3HKxInOXC2NhFJFivUosrkzECiBsri4B9Kjfg/pGTHJgO2XKoo/AU0vQDqg1TLWYhSYcfysBZG+2l0+nTMyPDkT5ZcPw/bUUxB/8JT39vUrimv9Xfk2/XSGduYqrVcJ8l5D6T9G5LWAKjP+PWkZzGXuIZMcADq7wnbvz4XwEEKj7dm6RNoczjFYZwSiAi0eohQNUXbqdv/ANxgOo1WeAfuNDfseM2vf7o1CwtPW/neZT/sqMjx/gXS4DHxyg0L9sZkSzQ1eMzU5BigA2btRRA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733223882; c=relaxed/relaxed;
	bh=4yYjvF6qVvKzBxYttP8yiTPmOTcqD+VbUaWnU4lSefY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=AwhePZm6yCPd+vvuwFS2S+RsaShFkl7GY0bXWiESqXYk+oQ8R0IVTt8xDsihwUn8mCatIDvpp/yuixKZEfmwurbO5aI6rfY7PPFXVPnlyCOkXHo3bUFBbDQjqI6B7bExlb7bftntLb8jnHr0yPPkeJBmxGdmtXSNRhTV4io2w8c7yZcq5fXVIjNTREX6r2saJBtWZ6b3pCSRX3gqOFjRDVjJz9TbLb9bwO8Jn3i8SbIm3uGg4pvZCKF7b+Ya84t7n9xeypPJg1ucRty7rK9CxRWMf6QnyNPVNUmUhZB//4IucWS+DfNAkE+Xmeyz4pNYUSHCHJvV/RN0sjHWW/n4vg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=GPh9J544; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Ug89W9+H; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=GPh9J544;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Ug89W9+H;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2d8T0dbDz2y8k
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Dec 2024 22:04:40 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1733223871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4yYjvF6qVvKzBxYttP8yiTPmOTcqD+VbUaWnU4lSefY=;
	b=GPh9J544GLpTTHxYmRPEOJGjgakTV87tvrpcFyzmjVfjTgmMlFaRBphYMzd68uKaM8UHBT
	/8y3ljPi3RMyCAjmib5czRfFtbslBOfcQND2YjCJ8guUjde0/0fHf5JU0GcGoDvWKmVKos
	HiPzu22BALCLVBnaXHNu8cUp4DGwd7LIi9olPiCZrjtyqBFwzlv3TOFKdEgE0vPjIgrxeW
	ZMzcUJGih0YwQZOopROfUFc48azjD7w7ql/w92e2WkbH/K3DxcmBxvGHWgWwsBmzo6u3Vk
	DP0ZtECGev+ymNGFFRj6jQyH2c2+D9uAlTvm0tEGHpf861Nip5oHzES5aNejpg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1733223871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4yYjvF6qVvKzBxYttP8yiTPmOTcqD+VbUaWnU4lSefY=;
	b=Ug89W9+H4bPUfmR6EL/qwLR3mPtemvy0s7sj/ASkjTx+PzWZ1v4vgS42y6KLbbJDWnoOWj
	Q/JVO9P0HhGoXGBg==
To: Eliav Farber <farbere@amazon.com>, linux@armlinux.org.uk,
 catalin.marinas@arm.com, will@kernel.org, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org,
 maddy@linux.ibm.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, akpm@linux-foundation.org, bhe@redhat.com,
 farbere@amazon.com, hbathini@linux.ibm.com, sourabhjain@linux.ibm.com,
 adityag@linux.ibm.com, songshuaishuai@tinylab.org, takakura@valinux.co.jp,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org
Cc: jonnyc@amazon.com
Subject: Re: [PATCH v5 1/2] kexec: Consolidate
 machine_kexec_mask_interrupts() implementation
In-Reply-To: <20241130201143.48808-2-farbere@amazon.com>
References: <20241130201143.48808-1-farbere@amazon.com>
 <20241130201143.48808-2-farbere@amazon.com>
Date: Tue, 03 Dec 2024 12:04:30 +0100
Message-ID: <87wmght4ch.ffs@tglx>
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

On Sat, Nov 30 2024 at 20:11, Eliav Farber wrote:
> +
> +config GENERIC_IRQ_KEXEC_CLEAR_VM_FORWARD
> +	bool "Clear forwarded VM interrupts during kexec"

This should not be user selectable. Just keep it as:

config GENERIC_IRQ_KEXEC_CLEAR_VM_FORWARD
	bool

which defaults to 'n'. Just add a comment what this is about like it's
done with the other options in that file which are only selectable.

Thanks,

        tglx

