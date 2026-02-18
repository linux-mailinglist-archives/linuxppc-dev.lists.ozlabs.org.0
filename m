Return-Path: <linuxppc-dev+bounces-16942-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJwiEcQxlmktcAIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16942-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Feb 2026 22:40:20 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FAA15A4A8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Feb 2026 22:40:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fGVKr5dMxz2xpk;
	Thu, 19 Feb 2026 08:40:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771450816;
	cv=none; b=OYH2tRef+A6Nl4FESSq++a9aMzExCGw8HCYlXYz2FwOnZU+hUkG74MKOtc6P1A0DPgl+7+Py0uf2X68L38qIQQJOXjb8DecgB3ieBBbLH5/c4skUaGJ39nPhTRaEEc8CE9qGoV8CS3phtVGWYaVmnbqXlWcT8wUXiVSz+T9KJYQ9RuWJCT4KGwg2d+zilr07PxLPtREgFW5A01h74MNGKGlDkaGjkubWaLcWa30ZD4GVId9JMOZQViic8Kq49Q0DLwYQKw6gDm/lx6RVHqY0ZtIHDmUF5kFiPOMWhmVNcIjUF6HK3IPvQSTYIXKGfnik8/6KeK9EASVctTHDBXLJ1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771450816; c=relaxed/relaxed;
	bh=Fvsgj3xzlM8pk0E82os1IY2C0CLexVFX94N1M/Seirg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jHSeEZrC+gpPns7pGb3Jbu2vXRv16mgSNQok+pPIG4YMleYg9sQsceU8AkAgMw4TXCwnr+TbybrNeXo2Mp6LNi1iRA8UmM2jM+SviLtAmh4mvV2liLp/5Zd3C9rhFbAua6145n4ARSitx4oJ9gNckzJgy3DgFdY1HHlL72ub5yfMFhPRhVgH97CAvyGgRFJAXIJInLoC6L/Axi0NJq4tqZpaqzfu+JoXEkbYSvzWsaX4slKoC1LHEJjK6yWDFSJ5Yi3GiLt4K6vq1ba6Thw8PbNR21DPftAEZ6qZPrxoU4t8N4/sLeMEyRNUG2Y90oME2ASvFJbkOzUicSkvTGfVZA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FoVc5i96; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FoVc5i96;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fGVKq6Dt6z2xC3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Feb 2026 08:40:15 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E091E40E3C;
	Wed, 18 Feb 2026 21:40:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73187C116D0;
	Wed, 18 Feb 2026 21:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771450812;
	bh=OnNhwTWGy/gIc8Om3z5bDNQcIBpK83c1vmDUBtOLdGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FoVc5i96SJAUmQbtszCb/kqsj8vDjLUA6HIeHKU8lyS+U/nA8WTQCF+sN0/FZNOQW
	 lPknCSE86KipezFLgw8J+DFyNHF4eYVFe7Z3R2z1M54qbcGhz9al2wgH2Hht3bMfCG
	 sikVKakhO6YPrBXk1PZstcoYNGg4g3P9uFXyrRH4TX4Dcbxe54rNUMuF3HwklS6PtO
	 y3qSN/YibzJxa/MIRwoFR1hAXYGqvWnp9FOiS47kRS3wZQsGvOjHcNfDQI+2xb0ihO
	 q8MEtRtu9jVKDbkEQDO8V9c4Tp9dtVlr2jPxH2Pvu5aNvfIwSwaQLZXAYHuu5lsobK
	 N/xEoE+Cs15jA==
Date: Wed, 18 Feb 2026 13:40:10 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] lib/crypto: powerpc/aes: Fix rndkey_from_vsx() on big
 endian CPUs
Message-ID: <20260218214010.GA2128@quark>
References: <20260216022104.332991-1-ebiggers@kernel.org>
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
In-Reply-To: <20260216022104.332991-1-ebiggers@kernel.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:linux-crypto@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ardb@kernel.org,m:Jason@zx2c4.com,m:herbert@gondor.apana.org.au,m:linuxppc-dev@lists.ozlabs.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ebiggers@kernel.org,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-16942-lists,linuxppc-dev=lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ebiggers@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: 39FAA15A4A8
X-Rspamd-Action: no action

On Sun, Feb 15, 2026 at 06:21:04PM -0800, Eric Biggers wrote:
> I finally got a big endian PPC64 kernel to boot in QEMU.  The PPC64 VSX
> optimized AES library code does work in that case, with the exception of
> rndkey_from_vsx() which doesn't take into account that the order in
> which the VSX code stores the round key words depends on the endianness.
> So fix rndkey_from_vsx() to do the right thing on big endian CPUs.
> 
> Fixes: 7cf2082e74ce ("lib/crypto: powerpc/aes: Migrate POWER8 optimized code into library")
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> ---
>  lib/crypto/powerpc/aes.h | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=libcrypto-next

- Eric

