Return-Path: <linuxppc-dev+bounces-8491-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 527AFAB2629
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 May 2025 04:10:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zw5mp6hVdz2yF0;
	Sun, 11 May 2025 12:10:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=144.6.53.87
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746929434;
	cv=none; b=W3WjjrP+FZuyT6D1CxzP2dlam2Bpxyj23ATtAFEsCww75geBgRZVQRrI9jP8l/vfzW9bDfgM7Cvj7Aiz3QEmxZY2hViukBc01Jxns8D136DTfIwHhIi7Z3GysuZFyVLBUIWDWcReFmL3JpsEAr5pK5F+EGO2OrXT5FoRMEUBAFuEndKTUMEZnAwqO7AAtr2JDYQU6wKd6g7b37GvXveGOboH/oPQy6fA3wTm2I/Qsz3SqZoGZ2sAewr+S+phT62W6xYq3RFHQw12cYQXExKynte8PyyLDKhraUjgFF5pGHHlw/MFTKO1jdLeluWLpPBsc+tl5ACOt7prCF46SXaBYA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746929434; c=relaxed/relaxed;
	bh=1CWY/3p83a71s1c0nZWdC5lD6l8cif6NWAoVMJXjvcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YGc2FZLAQ4s9v/TXtX62vTzUcYuJUWaiSpCRpdl3dIcEj96HPRHPaDMd/0QcTXN4AaulfnEhnFvOThaQW4Q8N7u75C2/L3YGLb9/AJULIQURW73707byPro+veqdAzYFLMfNVPjYtUwdQM6KXizLCg0nZHntNFcx+xdoCCHARWfWS+TgdudMkD3x3oSjEoAtPGKz0pap5yYrrRhro0xC1wD85YLAkwaO1R1FrY7AGmqtZRR8G2Mk8WiFbFpwm5GeDpOkn+7Wk/AXbkcpU1MuY0eXh3HkWud8TXbhG4F0pQRkLoZA5jiWAjHdlD1OGOrc1qg/EywH1dO7qfQRUtlNzQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=dY6wxncF; dkim-atps=neutral; spf=pass (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=dY6wxncF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org)
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zw5ml4QJ0z2yDr
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 May 2025 12:10:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=1CWY/3p83a71s1c0nZWdC5lD6l8cif6NWAoVMJXjvcQ=; b=dY6wxncFU5a/IhfMhnbVtgEEH9
	3aY05cODJoQ1XeKtB008Qg2RFyG8zK/dUupiGzUh3K+YwiGN/1JPi6GuKMXYspd866vQBOEUU9Ype
	XQ4TRhTYt5zAtWZ5jRSsddJZ6jir22A2b4OV0k+l6SXjdGOfg7f97WKlnxCCGh/f/PrlBYJtK+etD
	GrEFTgBXPmDwtxuraLxpwptZDUxRA4GBuya5mx89wkbiPt0gdhp/3jEApsg9ah8syF1bczyUSfBwT
	8NX27ZnXbBD4+gGSExMspPp807G61ks4iGMiKfzmNq/76lAnIEKoKsL+B8EmkFHsH5B40GIsmDMA1
	t5HAaM3Q==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uDw8g-0059qN-0n;
	Sun, 11 May 2025 10:10:03 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sun, 11 May 2025 10:10:02 +0800
Date: Sun, 11 May 2025 10:10:02 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Segher Boessenkool <segher@kernel.crashing.org>
Cc: Eric Biggers <ebiggers@kernel.org>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Danny Tsen <dtsen@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [v2 PATCH] crypto: powerpc/poly1305 - Add poly1305_emit_arch
 wrapper
Message-ID: <aCAG-rNiy0b1C9BF@gondor.apana.org.au>
References: <37cf099e-d5c2-40d8-bc31-77e1f9623b1c@linux.ibm.com>
 <aByX_Y64C6lVRR8M@gondor.apana.org.au>
 <f66620e2-77e3-4713-a946-ddb2c8a0bccb@linux.ibm.com>
 <aByiNZNxqyTerdYG@gondor.apana.org.au>
 <1d2c2fdc-5c36-4d4e-8b25-8289b865726d@linux.ibm.com>
 <aB31DI4QBBZuQObQ@gondor.apana.org.au>
 <20250510044450.GA505731@sol>
 <aB7fvi_FBdnmLUON@gondor.apana.org.au>
 <20250510053308.GB505731@sol>
 <20250510223401.GK30295@gate.crashing.org>
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
In-Reply-To: <20250510223401.GK30295@gate.crashing.org>
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, May 10, 2025 at 05:34:01PM -0500, Segher Boessenkool wrote:
>
> What doe "may_use_simd" even *mean*?  At its declaration site it says
> "whether it is allowable at this time to issue SIMD instructions or
> access the SIMD register file", but that is 100% meaningless, you can do
> SIMD in GPRs.
> 
> On PowerPC we have two separate register files dedicated to SIMD-like
> stuff, the VMX and the VSX register files.  Which of those is this
> function supposed to care about?
> 
> It looks like the whole "may_use_simd" thing is a misguided abstraction
> unfortunately :-(

While we may debate the name of this function, the question is
simply whether you need to save state or not when you get an
interrupt.

If you don't need to save state, then may_use_simd doesn't apply
to you.  If you need to manually save state when you get an IRQ,
then you must obey the rules.

So even if VMX and VSX registers are separate, you must assume
that in an IRQ either could be in use already and therefore you
must not use any of them without saving the state.

The ideal solution is to save the state (if necessary) in softirqs,
or simply disable softirqs when these instructions are in use.
Then the fallback path can be removed, for softirqs at least.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

