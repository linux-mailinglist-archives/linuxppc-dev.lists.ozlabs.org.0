Return-Path: <linuxppc-dev+bounces-15443-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 18741D06BC7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 09 Jan 2026 02:27:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dnPJk33bkz2y6G;
	Fri, 09 Jan 2026 12:27:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767922038;
	cv=none; b=mgYfGKc0zgH+7MXOFCH1mamQpHB3C3rX+AL3VQSIjk604RKJOVQ7y0zF6nx8Y8va0onUGF1+HW8bevtxa6nNdym6Eb3YYLivmlAvOoaAkWySGnY+7NJ1rKLh4LF1pOjC7m3VaKPidDEydYRMUM6DIHdvtNV3qSOj+MWJGF1l3cfdDB/pYAY6M3/tCPeVP3udital34Yte9UzDFCjdIqlTTS1LHyVn9RJLaEbWIdiTXnrc++SKsf5zjbK3q3zsU1BCkPf9Q99gp+u9/7mYUpQqLRn2ek8eZYdoQm8u86pjNKtFsmjunLOPblIv+F4QkFezktrurOPAzfNjtJ1r3+EJw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767922038; c=relaxed/relaxed;
	bh=S+edcJQ6qsUosWLmW2pZdLsa+cSgVPdAbKyNWalNKbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ntnPnlmtrqs0IgcoWoyLv0+ywzZu/KL7BcY6CIGOrFTugpLnOtJjQTVn7DmtnVd+kbztloRFVuk2QbQAuvo+QmM1t24vmu8LpXR1LB/G0c3h9C5jDFiN01CFRsi41DdmGtfPYJlCflRmUtlnvrqoFq25joqoK1zL9k65d7tWX/pUdRVG18EWlP9GaZxnZmNJ/jrRTYCUY4tx/flZFVpEbR+O1+7EVbgwPazRKz2KihoFzArv5uOG+wNpRDcZl92Kr7u32BcgSNyIL8d6ME8U2VxnDIK49Nq4Rry0dVNcvMO1vGbEaCkufaQdCWX3s5medyKgof3P4LnO5pI+3Z36Xg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nTm4iY/9; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nTm4iY/9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dnPJj34KNz2xFn
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jan 2026 12:27:17 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D95B7408AF;
	Fri,  9 Jan 2026 01:27:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41AA3C116C6;
	Fri,  9 Jan 2026 01:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767922034;
	bh=sGamr4oDumUwof9ouQDHjPD2MuG2QwTZ+qmSKHHoRwI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nTm4iY/9PqHkmCfZPWUCsadXnM0N/kVK095TkUeZS2oGCRp411HnNcSPL1XPuxvrJ
	 n6u5RSIEVWlKUR7qspcOO+E6TZ8758Z+uhEiw7eqTZKfR8isEktdfLVmWynZaasYdc
	 8UJ8BS/h7OU7xxWaoReQp4gdEN+zBb3oIcZ0dJuoeZ2Gw6E2Chgyk2OGqSMMrO147m
	 sYo+fPWiu1einrR19xgYEQiYvHmjGSVaMYzalWFkUQwpkqToFAdtco5KfIhZ9n1S18
	 HLFhwCVAdWp4zTLRs+lJguGmPQTIZsUZ+NecGhG2BjT+cqMjoRX7UAZSWm0bnyZBSN
	 8KHYCX6+zQ4tQ==
Date: Fri, 9 Jan 2026 01:27:12 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org,
	Holger Dengler <dengler@linux.ibm.com>,
	Harald Freudenberger <freude@linux.ibm.com>
Subject: Re: [PATCH 00/36] AES library improvements
Message-ID: <20260109012712.GA730896@google.com>
References: <20260105051311.1607207-1-ebiggers@kernel.org>
 <CAMj1kXGRTfyXPD3+Ravr7O5ZUMAUeabQw455sW5g7aRy3BU+2Q@mail.gmail.com>
 <20260108202618.GA2687@sol>
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
In-Reply-To: <20260108202618.GA2687@sol>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jan 08, 2026 at 12:26:18PM -0800, Eric Biggers wrote:
> On Thu, Jan 08, 2026 at 12:32:00PM +0100, Ard Biesheuvel wrote:
> > On Mon, 5 Jan 2026 at 06:14, Eric Biggers <ebiggers@kernel.org> wrote:
> > >
> > > This series applies to libcrypto-next.  It can also be retrieved from:
> > >
> > >     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git aes-lib-v1
> > >
> > > This series makes three main improvements to the kernel's AES library:
> > >
> > >   1. Make it use the kernel's existing architecture-optimized AES code,
> > >      including AES instructions, when available.  Previously, only the
> > >      traditional crypto API gave access to the optimized AES code.
> > >      (As a reminder, AES instructions typically make AES over 10 times
> > >      as fast as the generic code.  They also make it constant-time.)
> > >
> > >   2. Support preparing an AES key for only the forward direction of the
> > >      block cipher, using about half as much memory.  This is a helpful
> > >      optimization for many common AES modes of operation.  It also helps
> > >      keep structs small enough to be allocated on the stack, especially
> > >      considering potential future library APIs for AES modes.
> > >
> > >   3. Replace the library's generic AES implementation with a much faster
> > >      one that is almost as fast as "aes-generic", while still keeping
> > >      the table size reasonably small and maintaining some constant-time
> > >      hardening.  This allows removing "aes-generic", unifying the
> > >      current two generic AES implementations in the kernel tree.
> > >
> > 
> > Architectures that support memory operands will be impacted by
> > dropping the pre-rotated lookup tables, especially if they have few
> > GPRs.
> > 
> > I suspect that doesn't really matter in practice: if your pre-AESNI
> > IA-32 workload has a bottleneck on "aes-generic", you would have
> > probably moved it to a different machine by now. But the performance
> > delta will likely be noticeable so it is something that deserves a
> > mention.
> 
> Sure.  I only claimed that the new implementation is "almost as fast" as
> aes-generic, not "as fast".
> 
> By the way, these are the results I get for crypto_cipher_encrypt_one()
> and crypto_cipher_decrypt_one() (averaged together) in a loop on an i386
> kernel patched to not use AES-NI:
> 
>     aes-fixed-time: 77 MB/s
>     aes-generic: 192 MB/s
>     aes-lib: 185 MB/s
> 
> I'm not sure how relevant these are, considering that this was collected
> on a modern CPU, not one of the (very) old ones that would actually be
> running i386 non-AESNI code.  But if they are even vaguely
> representative, this suggests the new code does quite well: little
> slowdown over aes-generic, while adding some constant-time hardening
> (which arguably was an undeserved shortcut to not include before) and
> also using a lot less dcache.
> 
> At the same time, there's clearly a large speedup vs. aes-fixed-time.
> So this will actually be a significant performance improvement on
> systems that were using aes-fixed-time.  Many people may have been doing
> that unintentionally, due to it being set to a higher priority than
> aes-generic in the crypto_cipher API.
> 
> I'll also note that the state of the art for parallelizable AES modes on
> CPUs without AES instructions is bit-slicing with vector registers.  The
> kernel has such code for arm and arm64, but not for x86.  If x86 without
> AES-NI was actually important, we should be adding that.  But it seems
> clear that x86 CPUs have moved on, and hardly anyone cares anymore.  If
> for now we can just provide something that's almost as fast as before
> (and maybe even a lot faster in some cases!), that seems fine.

It's also worth emphasizing that there are likely to be systems that
support AES instructions but are not using them due to the corresponding
kconfig options (e.g. CONFIG_CRYPTO_AES_NI_INTEL) not being set to 'y'.
As we know, missing the crypto optimization kconfig options is a common
mistake.  This series fixes that for single-block AES.

So (in addition to the aes-fixed-time case) that's another case that
just gets faster, and where the difference between aes-generic and the
new generic code isn't actually relevant.

- Eric

