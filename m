Return-Path: <linuxppc-dev+bounces-7794-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E79A93912
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Apr 2025 17:02:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZfHzS0XpRz3c01;
	Sat, 19 Apr 2025 01:01:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744988515;
	cv=none; b=RQ1RpEsbBseNJn+v+3ldmRzdoklUXVNKCalUGlR5kxWo/wGH5t64Yy+k3DD2Yb0oPvj8ggXz+tbAchtb2bG0CuttksObfKOU9UNCsuwCbRbqwmyeOcXSkSfig/ogaDG1WSyPJbiJYM3v+mWLFIJ8wPCfgrW/0dGF81DwqD4MLBsBMEXRUCKSAUqPXAjyqINmTdx67IYBudvLPnqV6QOOXSqdTKtFUXikE11YC/Y9H785DTuheatQiiAH+r6cNlc1LZdDQ9q5yE45Opqah6YmWXvJ9DR1qKAw14qFHVggnomKhlh+ZR8a20zTWg/5ht8ZChTAocqh0suYk3o56j6Cdg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744988515; c=relaxed/relaxed;
	bh=dyam2Laux0ugR7DF3vNNAwkYT1XfFoet9+lfV2VmL18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qm/kqXxaFDpO+UfIze1ITVhUHqOcFCuSpTniAgHZGYWCEjfFRMCIs9WsTggijtUH2RBGiQMCcKQGfltAGk9o9nFgev9UeAaRwsAQADbIWXbo/fdGL+GcJkXZwGVFETjOFbdQDbT2QqV8lGElhtK0CD2RCWLZe2Vnqp/35l/tMZwLpH39YBdtmRg5kLXw4+RtbU9RaJDCVhLpXFCYD3N3lNjww3j6r1+fSunkX3X7vjHwK0voLfJ9wsJ+f0GrOvZfHdTJkaFML481SxpkBqXl0g2IUUCgFay8idSUcUDq+a7Cel3VIBaimyAOtY+J7GEFUgd1/5wyRjy9sAPkJB5TTg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=A/hWodxC; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=A/hWodxC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZfHzR0HjWz3bxM
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Apr 2025 01:01:54 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 671CC4A218;
	Fri, 18 Apr 2025 15:01:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2F22C4CEED;
	Fri, 18 Apr 2025 15:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744988511;
	bh=8A/sIYJ5SKbc782T5XhHrLEMq+A/QJdgAYupGNodiY4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A/hWodxCNPsy1G6IUlmfsUKPqnT1Ujt4MbzqWbcblOUnrPeC6mUHiaQLG39y8aCpX
	 CqM4lGrfOvsbTyqM0ArrrdiSchD0Xw68g1637tLVyX/a9miA1OW2TXJvaaJKssdA15
	 inuGhv2ZpxgFYHibi/I/56uplFouJCiprgLowDFdyI+DlKXeBDXjv5/ilK8nceskID
	 33KmL/slPYF0SJaOQKKaeK1Y5oGNFE2aC5lj8BAeoOh/smuVOSxzQ777mGw5dvt2gU
	 JYALSfe1bQeiyShNesrRus2B56KAIV2A8kPS//gNu0iYoXVZZSAu0XoWTuho1RFTd7
	 UcpVyOsFppB7Q==
Date: Fri, 18 Apr 2025 08:01:49 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
	x86@kernel.org, Jason@zx2c4.com, ardb@kernel.org
Subject: Re: [PATCH 01/15] crypto: arm - remove CRYPTO dependency of library
 functions
Message-ID: <20250418150149.GB1890@quark.localdomain>
References: <20250417182623.67808-2-ebiggers@kernel.org>
 <aAHDIRlSNLsYYZmW@gondor.apana.org.au>
 <20250418033236.GB38960@quark.localdomain>
 <aAHJRszwcQ4UyQ2e@gondor.apana.org.au>
 <20250418040931.GD38960@quark.localdomain>
 <aAIMhLD3UMM41JkT@gondor.apana.org.au>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAIMhLD3UMM41JkT@gondor.apana.org.au>
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Apr 18, 2025 at 04:25:40PM +0800, Herbert Xu wrote:
> On Thu, Apr 17, 2025 at 09:09:31PM -0700, Eric Biggers wrote:
> >
> > arch/$ARCH/lib/crypto/ is the "right" way to do it, mirroring lib/crypto/.  I
> > was just hoping to avoid a 4-deep directory.  But we can do it.
> 
> You can do that in a follow-up, assuming nothing else pops for this
> series.

Doing it as a follow-up when this series hasn't been merged yet would be kind of
silly, since it would undo a lot of this series.  I'll just send out a v2 of
this series.

- Eric

