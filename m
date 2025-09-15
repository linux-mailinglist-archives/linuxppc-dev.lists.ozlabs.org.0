Return-Path: <linuxppc-dev+bounces-12245-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A449CB581E5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Sep 2025 18:20:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQVdM2ZlBz3ddL;
	Tue, 16 Sep 2025 02:20:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757953255;
	cv=none; b=SHj47Bg4GDw3rEeo3D2NyLq84Hky8GgP2Ss3ZEW36ha/yFolChKg1JT4oOcHjJhbirYL67k7Ggwr5sRWgr5elRwBUNUbcUwqZwSfAmI51ZQSDRKURoo229M9gnah+HFmhdDNWtFUlQwkD1MFQJe4JdA1ozNHkiJFwXezAuHMkMbOVPVDqKE0Hv7RU8rIa3RzcBprkf4gaJ2aHJJ/ujydVIzoVoZ4XJNKS9SV3LjWK4un6kIeLtRmfIiJnvytaOyFsvfjqj/mGUjG0n1K4rVW14vgu+wc+QJDj6XwYwEo2GRKxa95zWGOqTygf+I3XaPfS7qJqyLezvGyE6wPNavntg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757953255; c=relaxed/relaxed;
	bh=G9SQTqrBOVctis2CGVfZ3Pf9Ziye0iOOUfIC0e8jglg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CAwtUMFVv2/ElZkc47Iz/3w7cAlMrR9sjtLA2vL0dv9JYIrclmttJNRQ4GkSbqJCKfVzKy+H5TiRvRfjeiOCfEPcL8zG1k+Cr0JEZvlFSywZCoKhX8hHrU+W93kF+mqdXCPPPWIsdaUl6g8AzHsRwsuMHOkwBhNVPzcIm8/E04aclgnAqQGGorCyjbi3DMQcjEvEckIUkJkKk4Av97KI6q5ORPhwEPFfXpiufYqtTuzC6jpf73zPBrCQLJE/byDa2yvIMIQWVXcczRGKHHUW9Xo3RvZogOWcWTP8tlxc7EMY40P34pd1ftgI8Urst/A/ze+LMMwJii7ts7MRKLaskw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=F1eEEi3P; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=F1eEEi3P;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQVdL30X3z3dSW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Sep 2025 02:20:54 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EB7F441A35;
	Mon, 15 Sep 2025 16:20:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C939C4CEF1;
	Mon, 15 Sep 2025 16:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757953251;
	bh=yO0OtTf4tibabKMaQbj6as/6p1x2/RbPqYkzFHJWeRI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F1eEEi3P8Oal2RdCJlQQLkn9HUmgO/RjO0pcyhVlEhHUE45Tcg2bB9KCEl3guO60w
	 80hTMQPzrAZ7I3DIB2hxaR6V1PjuGALE3T/QBVWxYvnnTsVmuuBBoyOboNqd2EMKwZ
	 8N9V7w+/YSi52aErC4s5/CEEYCP+9naxq9YD2ZqqkPi9cGrwD72xSgpSbLvrc3s1p3
	 kxDqrfodmlF4cPwsQy3FWVBkK1xyRpwTO7VzsYHjzELlF9eV2j5fTzyukBtEUpxorN
	 EJAyL5RQJJyv1UEgD/7sfw2yAmaXpdGzCimPxze2Y3cYwFD+PFx7CsZbreqgtJVuxi
	 F4JzAtnmzr2Rg==
Date: Mon, 15 Sep 2025 11:20:44 -0500
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Zhiqi Song <songzhiqi1@huawei.com>,
	Longfang Liu <liulongfang@huawei.com>, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 00/12] Curve25519 cleanup
Message-ID: <20250915162044.GD1993@quark>
References: <20250906213523.84915-1-ebiggers@kernel.org>
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
In-Reply-To: <20250906213523.84915-1-ebiggers@kernel.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, Sep 06, 2025 at 02:35:11PM -0700, Eric Biggers wrote:
> This series is targeting libcrypto-next.  It can also be retrieved from:
> 
>     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git curve25519-v2
> 
> This series removes the unused crypto_kpp support for Curve25519,
> migrates curve25519-selftest to a KUnit test suite, and reorganizes the
> generic and arch-optimized Curve25519 code to all be located in
> lib/crypto/ and built into a single libcurve25519 module.
> 
> Changed from v1:
> - Split kpp removal into multiple patches
> - Don't select CRYPTO_LIB_CURVE25519_GENERIC from KUnit test
> - Removed unnecessary parameter from hpre_ecc_clear_ctx()
> - Removed unnecessary 'return' from arm curve25519_base_arch()
> - Updated file comment in lib/crypto/curve25519.c
> - Made kconfig help text for KUnit test more consistent with other tests
> - Used initializer in test_curve25519()
> - Removed unnecessary newlines from messages in test_curve25519()
> - Use NSEC_PER_SEC instead of literal 1000000000
> - Added an Acked-by

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=libcrypto-next

Reviews and acks would still be appreciated, of course.

- Eric

