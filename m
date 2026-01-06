Return-Path: <linuxppc-dev+bounces-15293-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 653AECF6E9C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 06 Jan 2026 07:36:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dlhJy5HvKz2yKr;
	Tue, 06 Jan 2026 17:36:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767681394;
	cv=none; b=ET1kU9pC4v2kGrAuJTTEfOIkT91bTRmB0N3KtpvSpQMTac6qxBRBW/nsp6Ihg97N9nRScLJh6KpTB2Jpw/dHRIZfMCoi61UuSjuUViguT22PjbPpfJGXHEXHgFHhAYEq29SwgfUuwiidk0MTxTbNtQjzcRQXx1tpqDcJ1dkJeHHIyYH7PZgZ0lrKdD2btTPfd2DAXb7zq4laerG/wLrVyNRM2cfQbW3ffrY6w5DkLeHFzt1Jbekn1YBn+ng1b/tX89/Vn6258cgSZPaO7+dc4O8cZL4sLsQh/Hs056UwN3EMFgUUsqzMHsPkDkKKL1MfR2EHAjGjnGckx38cbOyr2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767681394; c=relaxed/relaxed;
	bh=AY/d2gdeayfRcfMlW4Nszshzlp0aOs/XRVfUarrKrqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fkyEqxXFkW7WzdVvNUPOHzYKY1G8QfK89wEe0ZP2DlGg+DhBCxkAb2zRdrF7yAgl0dQawbRdMqoK7Gd5zU4VsO2j+/ebCOrqKIYwFDKm221HZszLYO4p6K9KrS/oI17AwaZBeaQK6bl0XfvkBBkZH73VE/WImkyxchrwBI5lNFmEqizAORZ3NHfaWEtcbwgD78WK+JTSg3lwLy7bzG6/igDBPu9vJsR69eKKesWok1CmKcMKRHHtyL4vSFOkhn8i1KEe6CtbLVGqNYcamqzLMBaxACPsHz4vAEuG0uGRNAWq0eywHKUNaI5JsPTk8xDJJdF+YiyMq+UW/hTCIgdhwA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=S3JAZfQT; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=S3JAZfQT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dlhJx5LTSz2xqr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jan 2026 17:36:33 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5B65240DD9;
	Tue,  6 Jan 2026 06:36:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C65CAC116C6;
	Tue,  6 Jan 2026 06:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767681391;
	bh=rdREKMSltpuBRXrhF+R1a8MfGIPmnymt3Sxftd/Knsk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S3JAZfQTQkdf3Szw+a/pV9YfijdR5VYyedZ8Y6EdU3MWnO6UcihH1xnxeFDL1x09k
	 ZuoY6of7XUhlA3+YlMbCj1sUISpfaSaDiYIPWaDNs04OrAKL/rFfQrs73OU/8w0Kl2
	 tN6ULSVQtHvDFxYzKonJ6O4zblqc4nITcveRLbcvhNvaXZCCa4WYKx86yFx2eaUVF2
	 rgU+tOAD76DU2buz1IUO0oCZoA11dXmKVoQHu4XmEXiIQtHyLHF3xalYdx+IVPWyrD
	 nm+cR6SrwOhHH9zKliIG8/CYHUjE571e9edTX4FLKyzXL8KAvjz6s5pLAlRkHgwdT3
	 U863fAfhVXoKg==
Date: Mon, 5 Jan 2026 22:36:12 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Qingfang Deng <dqfext@gmail.com>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org,
	Holger Dengler <dengler@linux.ibm.com>,
	Harald Freudenberger <freude@linux.ibm.com>
Subject: Re: [PATCH 02/36] lib/crypto: aes: Introduce improved AES library
Message-ID: <20260106063612.GA2630@sol>
References: <20260105051311.1607207-1-ebiggers@kernel.org>
 <20260105051311.1607207-3-ebiggers@kernel.org>
 <20260105074712.498-1-dqfext@gmail.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105074712.498-1-dqfext@gmail.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Jan 05, 2026 at 03:47:12PM +0800, Qingfang Deng wrote:
> On 4 Jan 2026 21:12:35 -0800, Eric Biggers wrote:
> >  extern const u8 crypto_aes_sbox[];
> >  extern const u8 crypto_aes_inv_sbox[];
> > +extern const u32 __cacheline_aligned aes_enc_tab[256];
> > +extern const u32 __cacheline_aligned aes_dec_tab[256];
>  
> __cacheline_aligned puts the array in ".data..cacheline_aligned"
> section. As a const array, it should be in ".rodata" section, so
> ____cacheline_aligned (note the extra underscores) should be used
> instead.
> You can also apply the same to crypto_aes_sbox and crypto_aes_inv_sbox
> while at it.
> 
> Regards,
> Qingfang

Good catch!  So the result is that MMU protection isn't applied to the
const data as intended.

I guess I'll change these to the four-underscore ____cacheline_aligned.

Though, I'm tempted to instead just do __aligned(SMP_CACHE_BYTES), to
stay well away from this footgun.

- Eric

