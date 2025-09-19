Return-Path: <linuxppc-dev+bounces-12436-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AD752B8B784
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Sep 2025 00:28:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cT6bJ4wydz2yDr;
	Sat, 20 Sep 2025 08:28:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758320892;
	cv=none; b=N+vIXjG0CJfINms5a2LdvQaq7bbSj5Tq2WYysl2VgWipcBnGoz2RcR3B3zutNV2XfOWJDxydGjxdOr9eyI2fpROl2X8IdOJz2rzZVfYO302GfcGJqlSK+5dxh76yaikjsYt7zXuMUkEhpX/MOIaIeBGarpC+RHnVznsTG8nSVuN9M09sVs8YFzS7d1KAOVPmz/cGRBHa8RJcyyk37hMrRYycwiDtMSBE+Wfx/4RR9t2uNzNYEr9ae+xO80PC/TSmahdNUV1hgAfZDgf9spUbbLP4VWtt49RK3ABTudIzwxzhNiHryDTTDXhWaybMT1ZMAimmXWQwLOPWF8JbEAIMWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758320892; c=relaxed/relaxed;
	bh=q5k0pAHpGk5J40AE2Yfvv+Ov14heouw97Y5iCG2zpaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dLxObyPDZ3G28Nq95yM8McplECuaonCBpkPNQcUX7fvWZdJJYxSjdX2m8P3GAIKWCCYBdrWPUorwDB/eAILxYCEyqdubVo0HBonn1+AeK7+I1DobGeOAFwSjgorp8IfkCWwvDkV7sTaqhg9oGM/BHXHPmfMJU65VlbS4XT5oo2uxzIWoU+ohgasYIrjWCYYa/eNTCYz+ep3ct2epIwv2S9f+ge9SYGqvwhdiMOFxfFTTPfCA8Eveev2uFvkBRNY+FsCUZs/8oqA5FfQRZ8yJQRwQQPjAWlMzrSJnw94tdr7rLu6AgG+6yxmo+KeAAXmNs23Y5YsugvYxMSPthlDRrQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=F8b5++pT; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=F8b5++pT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cT6bJ0psqz2xck
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Sep 2025 08:28:12 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 46B6F60194;
	Fri, 19 Sep 2025 22:28:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B311C4CEF0;
	Fri, 19 Sep 2025 22:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758320889;
	bh=Y84KteTHYJ4DAZ8QIqjiQleYtmkFVDSOiUlD/F/ayqc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F8b5++pTwDpYbFDh6mS5iqYWkGHN1t6Xtia5PUSoL/e9NMLxXXg2Ty9uHcjgzNR9o
	 DuJUHFeWkFVe25nvOb54iu52ojHitqvM+/9JZiVJDkK8Y6rn1rKvU9DCHkr+Htca/C
	 UVyHpXQ7lABHJ3p9HEaclQ1oShkL7r5pH7axcuMVI0L38vWZNROwU8bB1X9PlN6ckO
	 8BG6+r1hh0PNZWTJyw1R5Ax16NqMYa3wgpz/vtYGEOMGycqkqAJZYvfamSORVv0OQd
	 h2zR8Z9pMDSyjRO0XiNCh8S7Zcs/RmA9dZFVBB6wwoN/fRPIm+sWCKnfbdvTaes1e6
	 JngcGHeOhYxGA==
Date: Fri, 19 Sep 2025 15:28:04 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: clang-built-linux <llvm@lists.linux.dev>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	lkft-triage@lists.linaro.org,
	Nick Desaulniers <ndesaulniers@google.com>,
	Anders Roxell <anders.roxell@linaro.org>,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: clang nightly builds failing on PowerPc
Message-ID: <20250919222804.GA44805@ax162>
References: <CA+G9fYsJq0sPC+q6vLNKUgBqCGmmjDrfeP4R1-95Eu28FJRY_A@mail.gmail.com>
 <20230612185424.GA2891387@dev-arch.thelio-3990X>
 <CA+G9fYtX6YNqmz9vxJxa5cA5Uf2rr=RNM0nkoTzRpg79Azp2tA@mail.gmail.com>
 <CA+G9fYvmqz3nQ=Cgs=7J6vtRj=OhbNzgkLPmxxN+vOBTU=9zVA@mail.gmail.com>
 <aM071XHb5cppdEKK@stanley.mountain>
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
In-Reply-To: <aM071XHb5cppdEKK@stanley.mountain>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Dan,

On Fri, Sep 19, 2025 at 02:17:41PM +0300, Dan Carpenter wrote:
> Hi the Clang nightly builds are failing on PowerPC with the
> ppc64e_defconfig.  They started failing on Sept 11.  Clang is failing on
> PowerPC in both linux-next and stable so it seems like something changed
> in Clang and not the kernel.
> 
> Unfortunately I don't have ready access to the /tmp/vgetrandom-fef220.c
> file that was generated, but hopefully these logs are enough to reproduce
> the issue.

Indeed, thanks a lot for the report. I was able to reproduce this
locally, bisect LLVM to find the problematic commit, and report it
upstream:

https://github.com/llvm/llvm-project/pull/157206#issuecomment-3313700961

Hopefully it can be resolved quickly.

Cheers,
Nathan

