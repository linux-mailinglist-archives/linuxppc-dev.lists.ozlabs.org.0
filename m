Return-Path: <linuxppc-dev+bounces-9208-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8BFAD165E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jun 2025 02:50:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bFtcb2zcKz2yZS;
	Mon,  9 Jun 2025 10:50:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749430207;
	cv=none; b=Z3UmyXviRUA16U04i2RCOAKSJAE/UhVZ1srjR50wyDNNem/0CiXasC04pUa7q1T2VwsAG84kWwH2obxyXRCDKo7Q98o0QaGgMGEKQfrMMmaoVg8nLPJkJwbn1mRX1Sr/KPupshxa/5R+3XDZbfyRNzVYDhgKLRwmOS9hLgvL/57WTr/2EZmmR6HCs0K8Z6kdZjB/aynr2rXSIbv5hcHzu9TDDGuNYb8cgG3gSPox2u8K5DkB1/Ygz/KqbJH2CliOHDG0virW9pHF58wKM23PFdgWJCmQZhS3/lxZFEkbYZAA41SXeCENm55vvNjB7sktkAfghqMBKxwQK3WoqTEPXw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749430207; c=relaxed/relaxed;
	bh=sdfLGZeREbdRtpiQQRo8sJe4Akri5tZyrF4Ogu7Xmes=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=MW9WLlmAShzFda0WJlhewK/xgCfPEY1IGDAMcOjzIARZ66QFihhP2Pxpf3oRFJmO1w04QPLfN03a81Q3o7vAsbERtv3uGstnPdezOT7YmCnDa18yYDpbFqrGVzVinzYQkbywzXXTpo2UlGGLk+OHhGfKmfzujr/4o6cxD3qj6UVtnx3C0umpCxtjxkUZ/qqLoOXzll0fUZbngk4K29bubRcCsKK723j35bSbTV5tJCqvg7QOnJL+gnZpYmdw7imTdm/wge5dU67+lMK7K4gpkPUX9g5Z0Gj9n7MQv8eSR2IHn3hzlvHMVALPaAsiod8bgp9INnVVQe+sX1jeBRgcfw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=UXCmrlKN; dkim-atps=neutral; spf=pass (client-ip=2404:9400:2221:ea00::3; helo=mail.ozlabs.org; envelope-from=mpe@ellerman.id.au; receiver=lists.ozlabs.org) smtp.mailfrom=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=UXCmrlKN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ellerman.id.au (client-ip=2404:9400:2221:ea00::3; helo=mail.ozlabs.org; envelope-from=mpe@ellerman.id.au; receiver=lists.ozlabs.org)
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bFtcY4tSWz2xCd
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Jun 2025 10:50:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1749430202;
	bh=sdfLGZeREbdRtpiQQRo8sJe4Akri5tZyrF4Ogu7Xmes=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=UXCmrlKNCbZbitpL8txJwEXwigYIQeBOQYDj+nGYPVrtdx8aUV/ahizYFuJQRI7hy
	 uQUL9plAzWwbgQwB1gjqH2f/mRriRqHE9hw9a4lrxRcEAXOCOhk0qsUjfjeU5aOdPW
	 HDl/nhYxm9w96n2YE9S0K5vjm++/9RPaV7qZU1RDkEiGirzSt2yPyoYUEyEoYpMrv/
	 0I7DBCjG3wCS9gD4YnuE0asEsQjC01gKBScqXH79Zw39mDKxUNZ3rxNofjm/ABey0k
	 ckfbnlMu0xFO/WA6iTkxvX6GmfSVx8Io5ytwSsxLfqf7L/LEpe6bBLR3YNFoIeKhst
	 fgibYyCLw1ZOQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bFtcT614gz4wbv;
	Mon,  9 Jun 2025 10:50:01 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Thomas Fourier <fourier.thomas@gmail.com>
Cc: Thomas Fourier <fourier.thomas@gmail.com>, Anatolij Gustschin
 <agust@denx.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, Nicholas
 Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>, "open list:LINUX FOR POWERPC EMBEDDED
 MPC5XXX" <linuxppc-dev@lists.ozlabs.org>, open list
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] (powerpc/512) Fix possible `dma_unmap_single()` on
 uninitialized pointer
In-Reply-To: <20250605163717.18020-1-fourier.thomas@gmail.com>
References: <20250605163717.18020-1-fourier.thomas@gmail.com>
Date: Mon, 09 Jun 2025 10:49:59 +1000
Message-ID: <878qm1wxfs.fsf@mpe.ellerman.id.au>
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

Thomas Fourier <fourier.thomas@gmail.com> writes:
> If the device configuration fails (if `dma_dev->device_config()`),
> `sg_dma_address(&sg)` is not initialized and the jump to `err_dma_prep`
> leads to calling `dma_unmap_single()` on `sg_dma_address(&sg)`.
>
> Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
> ---
>  arch/powerpc/platforms/512x/mpc512x_lpbfifo.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/platforms/512x/mpc512x_lpbfifo.c b/arch/powerpc/platforms/512x/mpc512x_lpbfifo.c
> index 9668b052cd4b..ef3be438f914 100644
> --- a/arch/powerpc/platforms/512x/mpc512x_lpbfifo.c
> +++ b/arch/powerpc/platforms/512x/mpc512x_lpbfifo.c
> @@ -241,8 +241,7 @@ static int mpc512x_lpbfifo_kick(void)
>  
>  	/* Make DMA channel work with LPB FIFO data register */
>  	if (dma_dev->device_config(lpbfifo.chan, &dma_conf)) {
> -		ret = -EINVAL;
> -		goto err_dma_prep;
> +		return -EINVAL;
>  	}
>  
>  	sg_init_table(&sg, 1);

Yep looks good. That's the first use of goto for error handling, and
it's clearly too early. All the previous error cases do a direct return.

Reviewed-by: Michael Ellerman <mpe@ellerman.id.au>

cheers

