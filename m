Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB6020EE01
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 08:04:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wv2b3Fv6zDqsy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 16:04:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=a.darwish@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=tqyB+b0h; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=IS/fTrrE; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wtx147sczDqZm
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 15:59:49 +1000 (AEST)
Date: Tue, 30 Jun 2020 07:59:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1593496780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ISSeNlZb4Rl1m7bgMA2uyOzUeDrOW1JpndE6Mh/W8oo=;
 b=tqyB+b0h7XAflMZ6GCQA117o6LO/DRXQ49iOQJaRt6GU+AMe/g96NWoHeJ3OKOxYIqAf56
 R9jHf5NsgEwHhU8JfVG/7KopkPQObAv6gXHNLk3oVB02Cw6D9HfcjnLKG4kMEsSQbmRLKQ
 ql+OWsaB7Ew3IyMmDmdfTl0r4tj3w/0UmA59u6U3hXTKCSEoRma9BkbJFQWc4h6HHXV/UA
 0/DpJwbBzBymAknZtj5HJUHqavwWqGdtOWPff6P1edyHQuF/qvQiB+mrzLGOrOK7cV2SmH
 y9azpiFEn/6HMpOnxKo09o4IoZdBMmaq5qLwGKVa268DfUBmzcP9oCGC6uRtCg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1593496780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ISSeNlZb4Rl1m7bgMA2uyOzUeDrOW1JpndE6Mh/W8oo=;
 b=IS/fTrrEBdr0B5uSkPSVJuizfzPVBDIc0SfUXgPsIr2XNfbeNGHrvtMNmsoh6sP3ovWtTB
 9Z/W5HYn3zWJUVDw==
From: "Ahmed S. Darwish" <a.darwish@linutronix.de>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v4 7/8] lockdep: Change hardirq{s_enabled,_context} to
 per-cpu variables
Message-ID: <20200630055939.GA3676007@debian-buster-darwi.lab.linutronix.de>
References: <20200623083645.277342609@infradead.org>
 <20200623083721.512673481@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200623083721.512673481@infradead.org>
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
Cc: linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 bigeasy@linutronix.de, x86@kernel.org, heiko.carstens@de.ibm.com,
 linux-kernel@vger.kernel.org, rostedt@goodmis.org, davem@davemloft.net,
 sparclinux@vger.kernel.org, linux@armlinux.org.uk, tglx@linutronix.de,
 will@kernel.org, mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Peter Zijlstra wrote:

...

> -#define lockdep_assert_irqs_disabled()	do {			\
> -		WARN_ONCE(debug_locks && !current->lockdep_recursion &&	\
> -			  current->hardirqs_enabled,			\
> -			  "IRQs not disabled as expected\n");		\
> -	} while (0)

...

> +#define lockdep_assert_irqs_disabled()				\
> +do {									\
> +	WARN_ON_ONCE(debug_locks && this_cpu_read(hardirqs_enabled));	\
> +} while (0)

I think it would be nice to keep the "IRQs not disabled as expected"
message. It makes the lockdep splat much more readable.

This is similarly the case for the v3 lockdep preemption macros:

  https://lkml.kernel.org/r/20200630054452.3675847-5-a.darwish@linutronix.de

I did not add a message though to get in-sync with the IRQ macros above.

Thanks,

--
Ahmed S. Darwish
Linutronix GmbH
