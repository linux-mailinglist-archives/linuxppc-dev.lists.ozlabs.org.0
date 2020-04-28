Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE17D1BB4BA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 05:33:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49B6fh1ZJSzDqnB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 13:33:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49B6cS57F0zDql0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 13:31:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=PMIHp6Nx; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49B6cS1vscz9sSG;
 Tue, 28 Apr 2020 13:31:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1588044664;
 bh=1VWe/5XL31/JLnYJvZl4yo55lNCwWRadkzgRRox9tmo=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=PMIHp6Nx6E6xoMCK/wW0FVGhAy/wU3/+f86YSfpikplP5IJd0NWhbEPzMzXl3Js/C
 HMuS+LxS4A32Oh3V7ezhObU+rpqGiMCE+83EYDANENCAnzdIMabYMkFUUIt9eWgk9f
 CJDGJdJQaVxsN1QCCUDzor87K1H5gSgi5u2evUJN/lVkby/Xt8UhF2D82z9UG5uqaZ
 OHW5zCSkBoauiLStQWa1MiHlcHdn9aWscUbruRQSMAV3lKi7VfQNsBaeYKHPqySht8
 qik2LvlsIzmEEd6JVdLEL6CyMpBGfrU36k+KKsTQNJ8KuMs4+3BnW9hhz8IgXDYybl
 Z6VtUMesnPAwg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Sam Bobroff <sbobroff@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 1/3] powerpc/rtas: Export rtas_error_rc
In-Reply-To: <e9c245df4a0b1cd1f68171c81e0d9e64a13ab0e9.1587704308.git.sbobroff@linux.ibm.com>
References: <cover.1587704308.git.sbobroff@linux.ibm.com>
 <e9c245df4a0b1cd1f68171c81e0d9e64a13ab0e9.1587704308.git.sbobroff@linux.ibm.com>
Date: Tue, 28 Apr 2020 13:31:19 +1000
Message-ID: <87y2qgffqw.fsf@mpe.ellerman.id.au>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sam Bobroff <sbobroff@linux.ibm.com> writes:
> Export rtas_error_rc() so that it can be used by other users of
> rtas_call() (which is already exported).
>
> Signed-off-by: Sam Bobroff <sbobroff@linux.ibm.com>
> ---
> v3 * New in this version.
>
>  arch/powerpc/include/asm/rtas.h | 1 +
>  arch/powerpc/kernel/rtas.c      | 3 ++-
>  2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
> index 3c1887351c71..7c9e4d3635cf 100644
> --- a/arch/powerpc/include/asm/rtas.h
> +++ b/arch/powerpc/include/asm/rtas.h
> @@ -379,6 +379,7 @@ extern int rtas_set_rtc_time(struct rtc_time *rtc_time);
>  
>  extern unsigned int rtas_busy_delay_time(int status);
>  extern unsigned int rtas_busy_delay(int status);
> +extern int rtas_error_rc(int rtas_rc);
>  
>  extern int early_init_dt_scan_rtas(unsigned long node,
>  		const char *uname, int depth, void *data);
> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
> index c5fa251b8950..238bf112d29a 100644
> --- a/arch/powerpc/kernel/rtas.c
> +++ b/arch/powerpc/kernel/rtas.c
> @@ -518,7 +518,7 @@ unsigned int rtas_busy_delay(int status)
>  }
>  EXPORT_SYMBOL(rtas_busy_delay);
>  
> -static int rtas_error_rc(int rtas_rc)
> +int rtas_error_rc(int rtas_rc)
>  {
>  	int rc;
>  
> @@ -546,6 +546,7 @@ static int rtas_error_rc(int rtas_rc)
>  	}
>  	return rc;
>  }
> +EXPORT_SYMBOL(rtas_error_rc);

Will it be used in a module somewhere?

AFAICS the only caller you add is built-in.

cheers
