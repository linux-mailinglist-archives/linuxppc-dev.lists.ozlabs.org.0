Return-Path: <linuxppc-dev+bounces-1056-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA3896D85C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2024 14:24:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wzz7C0DhXz2ywq;
	Thu,  5 Sep 2024 22:24:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725539047;
	cv=none; b=AeNljOlSAg7E2VZk+rdSvqHHwVhModo7Ks4Wtd1OLMbNW2tUfm26XxDPhTz31lBW6GaR/nfC75MemDF/Gp/vjpRroeBXPFtMleMvDEwPOUP3qNe1fQAZsq0hYKYhDIpBzDKzOUXupbr3r5yYDFCAhvjg3cMzZ+rQE49gKgl7M6prf8OLhWlME03q0M8iaUWwaVOlVQMWCBVbjZzqyh3ETjGhrrYTeSGGpRN8I3rcklxDgis6oo1T/y6RXOlhtrpOdUbezZSoVhuvAJLRrV2++KPIT0uABZ8jR9sebVnxV8t+CQ522Qs5NZE1VJ2G8bQflt8HZ13HfBaLYPZ6yXsOQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725539047; c=relaxed/relaxed;
	bh=mUdYVDhcBbnbe8Qnsh0MBGJ/CuaR+SGTw9WGn1Sesjw=;
	h=DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:Date:
	 Message-ID:MIME-Version:Content-Type; b=B7hUZV2tcbTWa2tooxYtYcwU5Bvgrh8LhSHqd2QHpgwLap0AINBdnFzm5sqEZA2eX0Ez3gMT1nqS+OyYbM6mn6idtHifj0Um50tETKkUMh5MjNhQ/4StkAUxO7TiR3HSmCIHGOIs5VTbCW38wG4CDNUIjaSLP87Hti1hCUljh3aRW7qdzZ7J/lJ/8z9Tpz8dSlTvlTHr1ez9tfpDO0g6V09Niub2cZUDvyw01WGJe64j1sLPtC7m9QbeRlWvzKYt+dQKnDhIgu25M1T+De/dZzr+XpnxbcEeB3v86YESAS48SdWY62a/WcHmQGIhBOTEiFEdBkw9yKLPY+NTm4LI3g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=aNE0hW3k; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=aNE0hW3k;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wzz7B3xMDz2ysg
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2024 22:24:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1725539046;
	bh=mUdYVDhcBbnbe8Qnsh0MBGJ/CuaR+SGTw9WGn1Sesjw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=aNE0hW3ktB5ARsICz/sDICJpPHa+7JLjwZbfyZgZ3pBirixCFOKOHsJlHJKueCT+4
	 oO/jlji0rW5pNKsVEZb9l1e+vrwuXvXHlzxe3cW/CD+/DxV2M5RhbL/mu/Pxk+02P9
	 qsipRyRV0PDMs0nXFL0649/B2oYRSZgVw2QMf74t1tyGqR0SZL1fjy6VA2WsTdDrJZ
	 nFFHe+UBoIVY4RgE3JcARKeeLqK1M/Ui2reF+e1tAZ92g0d32LXyubGymdFC3d3Fuc
	 iqGnn6qGk8pQ972Et1Be/4tzXT7uvXw6+nDOIi3J5F7PsxjXKcp9OpButWBGUjKxsh
	 Rbiu1u9E3GfiA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wzz795cY6z4x0H;
	Thu,  5 Sep 2024 22:24:05 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker
 <frederic@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jonathan
 Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, Len Brown <len.brown@intel.com>, "Rafael
 J. Wysocki" <rafael@kernel.org>, Anna-Maria Behnsen
 <anna-maria@linutronix.de>, Nathan Lynch <nathanl@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 13/15] powerpc/rtas: Use fsleep() to minimize additional
 sleep duration
In-Reply-To: <20240904-devel-anna-maria-b4-timers-flseep-v1-13-e98760256370@linutronix.de>
References: <20240904-devel-anna-maria-b4-timers-flseep-v1-0-e98760256370@linutronix.de>
 <20240904-devel-anna-maria-b4-timers-flseep-v1-13-e98760256370@linutronix.de>
Date: Thu, 05 Sep 2024 22:24:05 +1000
Message-ID: <87cyli5lwa.fsf@mail.lhotse>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain

Anna-Maria Behnsen <anna-maria@linutronix.de> writes:
> When commit 38f7b7067dae ("powerpc/rtas: rtas_busy_delay() improvements")
> was introduced, documentation about proper usage of sleep realted functions
> was outdated.
>
...
> Use fsleep() directly instead of using an own heuristic for the best
> sleeping mechanism to use..

Thanks for tidying this up. I only learnt about fsleep() in the last ~year.

Two minor nits ...

> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
> index f7e86e09c49f..0794ca28e51e 100644
> --- a/arch/powerpc/kernel/rtas.c
> +++ b/arch/powerpc/kernel/rtas.c
> @@ -1390,21 +1390,14 @@ bool __ref rtas_busy_delay(int status)
>  		 */
>  		ms = clamp(ms, 1U, 1000U);
>  		/*
> -		 * The delay hint is an order-of-magnitude suggestion, not
> -		 * a minimum. It is fine, possibly even advantageous, for
> -		 * us to pause for less time than hinted. For small values,
> -		 * use usleep_range() to ensure we don't sleep much longer
> -		 * than actually needed.
> -		 *
> -		 * See Documentation/timers/timers-howto.rst for
> -		 * explanation of the threshold used here. In effect we use
> -		 * usleep_range() for 9900 and 9901, msleep() for
> -		 * 9902-9905.
> +		 * The delay hint is an order-of-magnitude suggestion, not a
> +		 * minimum. It is fine, possibly even advantageous, for us to
> +		 * pause for less time than hinted. To make sure pause time will
> +		 * not be a way longer than requested independent of HZ
 
"not be way longer" reads better I think?

> +		 * configuration, use fsleep(). See fsleep() for detailes of
                                                                 ^
                                                                 details
> +		 * used sleeping functions.
>  		 */
> -		if (ms <= 20)
> -			usleep_range(ms * 100, ms * 1000);
> -		else
> -			msleep(ms);
> +		fsleep(ms * 1000);
>  		break;
>  	case RTAS_BUSY:
>  		ret = true;

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)


cheers

