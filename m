Return-Path: <linuxppc-dev+bounces-10544-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F87B1969D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Aug 2025 00:07:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bwDM51Kjfz2xlL;
	Mon,  4 Aug 2025 08:07:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=63.228.1.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754258849;
	cv=none; b=bCpbA7NtUtiiLFhKH9un6dat9rC1HAqE57WIlN9G4d561418v2PwarGJNPwcueqlB6TUeQhtQ/BM2zbHOai0XaZIuShEtFBvRs3FwCtYb9bx/Qs2EXdsGB667fPVU03aVJ2fIywnapZ7By7FRPUTFxiI0y6VjE+VY6Xxl+nPEkXRBxA8iDLFmBeA9Uc3Nz09V4bi5XxLz/nT319JvzMhWiAekrvVo7IZMer2SjZN9c7zhmsXPHODyrfddbGjfGc8rqYjfieuPhV/o71ugtLffMcoA1gbyrdVIQgOWVnuHvLQnqV4m+qjAHF7oCzdQdplY44QhQXpLuDJqZk3rZIY4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754258849; c=relaxed/relaxed;
	bh=LeYXs6NHWFRCb/3oX9kRDBLBZ6X4Zx2Kl1ewI+kBW88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W5CanLwzzTev8Ht19XTj4xMXDHPwmlqZ2A1ZXT9Ck9BoPnpk6QDVwRNz5fXmSwRBG0L9GZ0Gvj9Gc3EouK1OoHTSPsDcmKXZMbGRC7xtwe0kiTOCfG6FUgelUIdZxQXZ0fHHwIOaIyMYxTMCsLYfPxzzEwgjsvfOPACSBZG7V/HFrSgBLefz3aN4NVrhH6cFyANJ30rlgWf5+69DbbLPJ6WE5Spu/1HWusNAc6M5twXSuS35b8owcQ2E31WHzbIYWmgdY0NG1UUrVrS/oLVxP8CuiJQXrMOgch6i9JhCMQOJlwRvkfaCSXaR0QAkpMvMjL41QGSGl6w7tqLBkUcaWA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bwDM41LtVz2xgQ
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Aug 2025 08:07:27 +1000 (AEST)
Received: from gate.crashing.org (localhost [127.0.0.1])
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 573M7CHh1821837;
	Sun, 3 Aug 2025 17:07:12 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.18.1/8.18.1/Submit) id 573M7BAg1821833;
	Sun, 3 Aug 2025 17:07:11 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Sun, 3 Aug 2025 17:07:10 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ard Biesheuvel <ardb@kernel.org>,
        "Jason A . Donenfeld" <Jason@zx2c4.com>, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org
Subject: Re: [PATCH 3/7] crypto: powerpc/md5 - Remove PowerPC optimized MD5
 code
Message-ID: <aI_djr4v-3nQqG9E@gate>
References: <20250803204433.75703-1-ebiggers@kernel.org>
 <20250803204433.75703-4-ebiggers@kernel.org>
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
In-Reply-To: <20250803204433.75703-4-ebiggers@kernel.org>
X-Spam-Status: No, score=2.3 required=3.0 tests=SPF_HELO_PASS,SPF_PASS,
	TVD_SUBJ_WIPE_DEBT autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, Aug 03, 2025 at 01:44:29PM -0700, Eric Biggers wrote:
> MD5 is insecure,

Really?  Have you found an attack?  Can you explain it to the rest of
the world?

MD5 is not recommended for future cryptographic purposes, there have
been some collission "attacks" on it (quotes because such a thing is
never an attack at all, merely an indication that not all is well with
it, somewhere in the future an actual vulnerability might be found).

Since there are newer, better, *cheaper* alternatives available, of
course you should not use MD5 for anything new anymore.  But claiming it
is insecure is FUD.

> This commit removes the PowerPC optimized MD5 code.

Why?  It would help to have real arguments for it!

If you just want to remove code you have no interest in, there are much
bigger targets available...


Segher

