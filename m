Return-Path: <linuxppc-dev+bounces-8728-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1697AABD533
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 12:36:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1rZM6Yqrz3bcP;
	Tue, 20 May 2025 20:36:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747737387;
	cv=none; b=ofq66yPpfhlCrQWWH794HDb3H1vx9ZnB+3zsZGMeTPB/eaWEs32QLWOPB7q9fILQh6xgbrcNIb7CxpctzrRyemazhxB1tc+YlWIaoWsglCHolbS9hvcrRkFStQKvlXPHG8RfQ7Fq4JOzTnfcuUVgMckUPdmCKQANIdFkfco/zCDej/CTF5PoDiXWAF3K/nHsWnkL+IOkeWgYFUjAWhiDCNoP6uCyVFQvDBm3oK5qd1STpKYu6MsnHmPbSLFjzqRbwS5kC4cJwReE6W/TVdMKpaPn5ocqMMgGwukJ0z+oqj2xcYeffA+fiSYIG5eor3hI90FLvkod+ss1aavha2y+sA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747737387; c=relaxed/relaxed;
	bh=MNMMe1TUmeWsJbvhAOaMpY4WpLB1aAasL5LrAtqJ0cY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=EVQpvFYZcRQhZLN/U31/TATEJaWJwkll/iZpJnpqU5/2TUKGaHPPDNEzplOvhB138PdPb/XQiyceNoxHFnn7bhSC5PIMKOF28eHL5qtdc4KX4n39s9hhq6cu9eE3U8DWt7t8rhJEuEUSysoB7WfS1qGOz16Rl49fNOPOHG0GQET3lht/lCuY70od/B97rudpLdmnTs2fzpyGhO8tpDk9AxgD71/H4QqLkWiby48DLjkd5+bXKqg/ZE2LYrufkYs67jgyMaERdtm3pBzQt1ACiYJb9rMD8ucKQZXnL4r23h/cg49MjG8AL4AudvH/o0zGK7GiVYa1m1rnPwgNrXcvZA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=b22MUNHN; dkim-atps=neutral; spf=pass (client-ip=2404:9400:2221:ea00::3; helo=mail.ozlabs.org; envelope-from=mpe@ellerman.id.au; receiver=lists.ozlabs.org) smtp.mailfrom=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=b22MUNHN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ellerman.id.au (client-ip=2404:9400:2221:ea00::3; helo=mail.ozlabs.org; envelope-from=mpe@ellerman.id.au; receiver=lists.ozlabs.org)
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1rZM2FlSz3bcJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 20:36:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1747737387;
	bh=MNMMe1TUmeWsJbvhAOaMpY4WpLB1aAasL5LrAtqJ0cY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=b22MUNHNgMAsiT7X8Q8xhG+ycdv6OA55Dfy7escrm1ufBa7zxIVfOYFSoHFVOazvU
	 z4f7MsbjKIswnZ7YZ59swwWzgunDZYBTwCCuOQL1ZhxWKtC6GM9trrqU35G06p4Nu9
	 eEdJMMrgKhI4m1Rw31p2tA73OG4vG6byUeXAVUyzrHkLtbh9IN9PJThFP0hW3qgBId
	 597dtcdMoM8qCwxqlUWRjMapHRfi2aox9XIKhNx+e31Y6yMp9ZSmqN/F4/i+1N5EmZ
	 hfjEXG/vB0eAMMWbzZjNJJWqnVPKlEG147BC03z1rx8JdY9yOmvpcYh7t9fk/lRThZ
	 ncq0gL83FlG2A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b1rZL4k7Jz4xPd;
	Tue, 20 May 2025 20:36:26 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, npiggin@gmail.com,
 christophe.leroy@csgroup.eu
Cc: naveen@kernel.org, linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Tulio Magno <tuliom@ascii.art.br>
Subject: Re: [PATCH v2] powerpc: Fix struct termio related ioctl macros
In-Reply-To: <20250517142237.156665-1-maddy@linux.ibm.com>
References: <20250517142237.156665-1-maddy@linux.ibm.com>
Date: Tue, 20 May 2025 20:36:18 +1000
Message-ID: <87zff7fu1p.fsf@mpe.ellerman.id.au>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Madhavan Srinivasan <maddy@linux.ibm.com> writes:
> Since termio interface is now obsolete, include/uapi/asm/ioctls.h
> has some constant macros referring to "struct termio", this caused
> build failure at userspace.
>
> In file included from /usr/include/asm/ioctl.h:12,
>                  from /usr/include/asm/ioctls.h:5,
>                  from tst-ioctls.c:3:
> tst-ioctls.c: In function 'get_TCGETA':
> tst-ioctls.c:12:10: error: invalid application of 'sizeof' to incomplete type 'struct termio'
>    12 |   return TCGETA;
>       |          ^~~~~~
>
> Even though termios.h provides "struct termio", trying to juggle definitions around to
> make it compile could introduce regressions. So better to open code it.
>
> Reported-by: Tulio Magno <tuliom@ascii.art.br>
> Closes: https://lore.kernel.org/linuxppc-dev/8734dji5wl.fsf@ascii.art.br/
> Suggested-by: Nicholas Piggin <npiggin@gmail.com>
> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
> ---
> Changelog v1:
> - mpe pointing out mistake in hardcoded values.
>   Fixed the same.
>
>  arch/powerpc/include/uapi/asm/ioctls.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/powerpc/include/uapi/asm/ioctls.h b/arch/powerpc/include/uapi/asm/ioctls.h
> index 2c145da3b774..b5211e413829 100644
> --- a/arch/powerpc/include/uapi/asm/ioctls.h
> +++ b/arch/powerpc/include/uapi/asm/ioctls.h
> @@ -23,10 +23,10 @@
>  #define TCSETSW		_IOW('t', 21, struct termios)
>  #define TCSETSF		_IOW('t', 22, struct termios)
>  
> -#define TCGETA		_IOR('t', 23, struct termio)
> -#define TCSETA		_IOW('t', 24, struct termio)
> -#define TCSETAW		_IOW('t', 25, struct termio)
> -#define TCSETAF		_IOW('t', 28, struct termio)
> +#define TCGETA		0x40147417 /* _IOR('t', 23, struct termio) */
> +#define TCSETA		0x80147418 /* _IOW('t', 24, struct termio) */
> +#define TCSETAW		0x80147419 /* _IOW('t', 25, struct termio) */
> +#define TCSETAF		0x8014741c /* _IOW('t', 28, struct termio) */

These values look right to me. And the values should never change, so
hard-coding them is a reasonable solution.

Reviewed-by: Michael Ellerman <mpe@ellerman.id.au>

cheers

