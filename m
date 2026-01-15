Return-Path: <linuxppc-dev+bounces-15869-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D07C7D287EE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 21:45:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsZkc336gz309N;
	Fri, 16 Jan 2026 07:45:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768509944;
	cv=none; b=fq9DlKch2HAqvrLN/LPBFaqj8HKVFuE1JgjS6SKIqKKQlc3i596B+dr6yEp6OeFzb6HRwXr0O8XCn7ikV7ZvdVgyItRJ/SZxinSqinW4b4gtYPlTmGvPn6cnGQKm0g1Yyb6p+L/1pyzFWpfj55RYOG6hGn3IVuO9JHEWZxFkv8CPbztqCBmzHX3bBdSJ4pSpLKkBWPQUiw+DCwJ2VGzp9/T20fg6UYbh0TbDCWNTgPzmT3tPIZfbe7sCu6WBqwuBTQL/1aOO96Z9iVclcCDfZCYTFJvw+iCjvzqbh/28+kuc5OQGtLXyilf8TYcIKT0Kzd/5HFBd8voFrNjFrNocmA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768509944; c=relaxed/relaxed;
	bh=JHiV60RInJ4eituFivtzOayNDVgKZkDvtZ7bVjXaEgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AI8XajE8KVMJFhcM3a4JpK2lyqrNM0VDBB4MTUiX0s9n5xuANhBXhChT0zBeMEwzFI6xvfJi9YfnSe4vGTEcqTHkx4iyTzspRzBzLW8rlRY0yTtm65H2EW6PcUozXBlN0bmv4WrGpe8kGfkLfJD0FO+gT4YpL4DCUou0ffRfF7fleJkprlnWdac/TCTmayUDdNXrSOo2YT1imfjC9EUGX1AKhFILNoO3Tn4AM/JA+uazR8WVYLnmIsKplHkX2hbHzsGfOezc7Wjf3Y7tnhexcWhwU4atvIeM/fIT/fulOS38pkvp1hRqTVxyxHiHZdTGdiDMjeV69koqyBnbi5Fzag==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=u+snff/V; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=u+snff/V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsZkb5f4Mz2xNg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jan 2026 07:45:43 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E1B2B40164;
	Thu, 15 Jan 2026 20:45:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 144BAC116D0;
	Thu, 15 Jan 2026 20:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768509939;
	bh=TrVJ81gNlKGWflE9lzJbsnP9K0M2Q7j3JRWiu7197P4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u+snff/V7iHtCcygjYFJPTDIRB2va5QWcv2YTvthzYkkKO1dcLaPj0r1cWb+Qb0Ai
	 ZVpOJ/eQka5sAfYC6lulUHJjHAJpvcWXM+J1c9dpGfWO8QtlVm/Cw2UmGDfsxb+hb2
	 IyAaokiFcv3t0x5Ft7gH2uq7nPZ/1cVZRdTZbS2YPI+uHUJfIZ2X9X7c3kyukr5qNM
	 R+2zdGs48Km5Khd4oVNLQDGIKWfd0F+kukNy4BH3hlSFRi//OC1itB5pkumE0828um
	 nikeLbBlI0f+FnI5/oQ1XMHlgzziQOiqCsrTkLzNGbBUcWTeyZjD33D9GwKuEKNpfZ
	 SyUTiXJoNf48g==
Date: Thu, 15 Jan 2026 12:45:37 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org,
	Holger Dengler <dengler@linux.ibm.com>,
	Harald Freudenberger <freude@linux.ibm.com>
Subject: Re: [PATCH v2 00/35] AES library improvements
Message-ID: <20260115204537.GB3138@quark>
References: <20260112192035.10427-1-ebiggers@kernel.org>
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
In-Reply-To: <20260112192035.10427-1-ebiggers@kernel.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Jan 12, 2026 at 11:19:58AM -0800, Eric Biggers wrote:
> This series applies to libcrypto-next.  It can also be retrieved from:
> 
>     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git aes-lib-v2
> 
> This series makes three main improvements to the kernel's AES library:

FYI, applied to https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=libcrypto-next

As always, additional reviews still appreciated!

- Eric

