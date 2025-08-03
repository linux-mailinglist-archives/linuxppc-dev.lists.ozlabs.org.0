Return-Path: <linuxppc-dev+bounces-10547-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CA5B196D1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Aug 2025 00:57:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bwFSD0mHrz2xlL;
	Mon,  4 Aug 2025 08:57:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754261820;
	cv=none; b=aFQHPXxGklOSNWtyx5d02F+5YVUdgO/laSxiVL/JeOTsY5ogYVuZgd4MN+bm404WpSTbCurypNbPjvn2QJVyVwBRT2NTHzmkVSHENOTOi/WjwOusvAUjM4l0Nv5zH1Tn/8ebng50rQCU2NZA5BfQ4Maeyz8KRvGU4Z+b6pgyOliit72huhOTWVjZoz9sUDFbqRFPlnhSvlLZuOce4H59ks1ezdImyx0sTKqfPwAHhOZz161zlP5ZCl3EO6UyjWoZbDMlnOBcHPTDMexlaSRmJR56T7iyrEAxX/cDryXlmbMA/+riIZYULbD0LlFpQaItQ1gYpgqsECipVjR3NU8NVA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754261820; c=relaxed/relaxed;
	bh=PV2Dunhvy8mUdBuGVoOd03/WCBNyj2qU2badb3TsDoM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L56hP6EqXVnf7XGmWF+upjdj5eIhZRD/kM2MuJBeobtAxtSo6ArFwL1rKbBfSiNmlyCgLLW5VaIjURi5mbEnu/gHKNVg9gqfBrDV7NcF6n2IZxcQZOqFHj3lhCY/Eb1zMSkeiKG5cyZgwIIJ3TLFp/4WZbNqgGPJund+WL9jiPYLiJVeHQuSJ3RCtpAL1i9e89IX8z/yh/dMgGG/qm1N6wseIB321yTJAz2K0vSW8FB2jdMLuxZpe24JX987KXN35WzGzFOBPMXfX0uiOfyUsDzu6V9hF7j1+TlqVjwenXJZEdIk84WJVKuRxSxGl90Rr1d+vyi4eQefFJLqwnGNSg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s3CbHS0X; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s3CbHS0X;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bwFSC1vYFz2xWc
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Aug 2025 08:56:59 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F0AFF601D8;
	Sun,  3 Aug 2025 22:56:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B364DC4CEEB;
	Sun,  3 Aug 2025 22:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754261815;
	bh=Ym+yYLpWdX2ByNjDG8czIJWJsK5Au9w7AVSJSphPKIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s3CbHS0XgKSoVBKeaq8ORC8nEoU8TGYQCUhn4dkm3IQ7qpZseRsaF/CV47bAjRD+4
	 LkCXnI0DjDXZLL47aQj8eD6nH6cRBCENJDu+v/d2acAR7+92ZEHJdI8VtnXCtODMs3
	 QvvbNAKDRsp3w4IUGSnJ40fuzuKi1LYomogzDOXYraSnfQaqXU/bFiMRifoptpwONT
	 ZEG+lTQrQZsoIWbKBToO18Z6Vi0JwTGZ/ds+weGh46QwIJl1/yYQetRrMFjhTYsjvT
	 Y4wTg4MbzPl2V3/0HZ5ZV/AQ0v7e+0yU2zdXSfZnxS4GJr9of1s9xg05GbUuCeogPl
	 XZLvSH8Bw1dDQ==
Date: Sun, 3 Aug 2025 15:56:52 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Segher Boessenkool <segher@kernel.crashing.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org
Subject: Re: [PATCH 3/7] crypto: powerpc/md5 - Remove PowerPC optimized MD5
 code
Message-ID: <20250803225652.GA2142@quark>
References: <20250803204433.75703-1-ebiggers@kernel.org>
 <20250803204433.75703-4-ebiggers@kernel.org>
 <aI_djr4v-3nQqG9E@gate>
 <20250803221438.GA119835@quark>
 <aI_iNQXxU6wKPEN8@gate>
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
In-Reply-To: <aI_iNQXxU6wKPEN8@gate>
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	TVD_SUBJ_WIPE_DEBT autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, Aug 03, 2025 at 05:27:01PM -0500, Segher Boessenkool wrote:
> You are replacing a known-working target implementation by a lower
> performance generic implementation.

That's probably correct, though FWIW there have been quite a few cases
where optimized assembly code in the kernel actually turned out to be
slower than the C code.  (That primarily happens when the assembly code
doesn't take advantage of any special CPU features, which was the case
for this PowerPC code.)  I don't have PowerPC hardware to check the
exact performance differential here, but IMO even if there was a
slowdown the factors still weigh strongly in favor of retiring this.

> But is that one known-working at all?  Does it come with tests?  Was
> it tested to have the same outputs as the existing thing, maybe?  Just
> on a few inputs maybe.

Of course.  Patch 7 adds a KUnit test suite for MD5, and there are still
the older tests in crypto/testmgr.c.  And of course generic code is much
easier to test than arch-specific code.  So not only is it tested, but
the test coverage is much better than it was before.

- Eric

