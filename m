Return-Path: <linuxppc-dev+bounces-10630-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D968B1AD61
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Aug 2025 06:59:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bx1SM0fFyz3bh6;
	Tue,  5 Aug 2025 14:59:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754369987;
	cv=none; b=VVVDBMhtP8aW1QoZtJ6+uJltBMlINk8eW9LfCoO7BscZv9AZcP2ha5zDhIURu1oxjedio0aesq0dUxWgHKSLRISJ+FmYzTdyKLfsaJd+LLqo9iAO8xDbVrvUMSSy7ai5R2blMwshsLASEVu8KcoGKq2mTB+1AEZqUMXYmTA389+krlynpYYKqDthGPDiQ5thyrc+IS+/m5aAjF3BHCP/LKvSlBxPcsw3WobMKugW3NKyJMfL6Sbox3NO3PNT90wD1RFEPfSYyO+xAf96w/eOceypc1HIhvHACwhsUsfbz6zW5+uucnWW597kLUZY22FrXPjm6cEAEkqw2rnIhV5ISA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754369987; c=relaxed/relaxed;
	bh=Rtby8lr4dRpFMuuj8wNYgwGIlxYQYLzo58PI/Bzw1K4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T68BAhA54nqf6xLTcmOmAEiWGgYBeVej4iAkef/ra8eh6jUxEuvglEYYqhcVo6inmLhXOKoPEvGdfVrwaHXYzQdr/UnF2pdeYZ0ZEu3L6cNXZcE3pHsQOhXES0a5bLuBVQ/7bOtRfBUVhbjgCW3L+Djup5JPMApiMbWZe9JBq1jFpwmCCAxqmnUo9uOVK7/4LfX3cMjaLYvkni0qtpQpfbk77SQFG0IkaPJcnYK3X0rhtRKfgTcR0kKCrOjIlBEJSxxNrtko3NFL7qqYSdeOTqEajRocAlhWMBcznQk0tbzvaxAZpozhrRFnn24KkpP/JYQPDi3l/Sik2L4PcunNjA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sibsd5Ib; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sibsd5Ib;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bx1SL1NvZz2yLJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Aug 2025 14:59:46 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5AD99438F8;
	Tue,  5 Aug 2025 04:59:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E67AFC4CEF4;
	Tue,  5 Aug 2025 04:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754369983;
	bh=eaxnvmVTMli/ZAZQbfboGasvLy0/KdIKJiwUt3cWC1Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sibsd5Ib8TIGgpCHzIQtPVqgLjZvCWfmrAOeyow9dEzOgIiMYKQeDwgG0kONbFyb+
	 BkUJhZT5mPRwGIX0jc8tTiE4Z8V3nkVCmFKZbE/jrng1GDORa2IfVAQ7X9IiqaCOMF
	 pRDS8RDKRcYWhdiDPIazvkh2+5LpYA6xaRP26jnu2Hb6/JMAKxejHQVi4oYUadAfv3
	 g9tkSHBfE6NAl/VEIMcpdr/Q/ICHWsp+sOrnNt8Zm/NwIKNGxGn4U3FhKTcjo6k1wG
	 8MRjZOLfKaTCi7Ch9t6qeiyk1EEUEAvCriVyKTTgX0RjBtL+JK2yopuTYbRwIY341j
	 xhT3F5a6adiRw==
Date: Mon, 4 Aug 2025 21:58:46 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Simon Richter <Simon.Richter@hogyros.de>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org
Subject: Re: Crypto use cases (was: Remove PowerPC optimized MD5 code)
Message-ID: <20250805045846.GA10695@sol>
References: <20250803204433.75703-1-ebiggers@kernel.org>
 <20250803204433.75703-4-ebiggers@kernel.org>
 <593b6997-9da4-439c-ba82-84e8bb2ed980@csgroup.eu>
 <20250804180923.GA54248@google.com>
 <187412bd-3ae0-4fe8-b526-f96af6bea6dc@csgroup.eu>
 <20250804225901.GC54248@google.com>
 <913e23f9-d039-4de1-a0d3-d1067dcda8ac@hogyros.de>
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
In-Reply-To: <913e23f9-d039-4de1-a0d3-d1067dcda8ac@hogyros.de>
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	TVD_SUBJ_WIPE_DEBT autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Aug 05, 2025 at 01:49:31PM +0900, Simon Richter wrote:
> Hi,
> 
> On 8/5/25 07:59, Eric Biggers wrote:
> 
> > > md5sum uses the kernel's MD5 code:
> 
> > What?  That's crazy.  Userspace MD5 code would be faster and more
> > reliable.  No need to make syscalls, transfer data to and from the
> > kernel, have an external dependency, etc.  Is this the coreutils md5sum?
> > We need to get this reported and fixed.
> 
> The userspace API allows zero-copy transfers from userspace, and AFAIK also
> directly operating on files without ever transferring the data to userspace
> (so we save one copy).
> 
> Userspace requests are also where the asynchronous hardware offload units
> get to chomp on large blocks of data while the CPU is doing something else:
> 
> $ time dd if=test.bin of=/dev/zero bs=1G     # warm up caches
> real    0m1.541s
> user    0m0.000s
> sys     0m0.732s
> 
> $ time gzip -9 <test.bin >test.bin.gz        # compress with the CPU
> real    2m57.789s
> user    2m55.986s
> sys     0m1.508s
> 
> $ time ./gzfht_test test.bin                 # compress with NEST unit
> real    0m3.207s
> user    0m0.584s
> sys     0m2.487s
> 
> $ time gzip -d <test.bin.nx.gz >test.bin.nx  # decompress with CPU
> real    1m0.103s
> user    0m57.990s
> sys     0m1.878s
> 
> $ time ./gunz_test test.bin.gz               # decompress with NEST unit
> real    0m2.722s
> user    0m0.200s
> sys     0m1.872s
> 
> That's why I'm objecting to measuring the general usefulness of hardware
> crypto units by the standards of fscrypt, which has an artificial limitation
> of never submitting blocks larger than 4kB: there are other use cases that
> don't have that limitation, and where the overhead is negligible because it
> is incurred only once for a few gigabytes of data.
> 
> That's why I suggested changing from a priority field to "speed" and
> "overhead" fields, and calculate priority for each application as
> (size/speed+overhead) -- smallest number wins, size is what the application
> expects to use as the typical request size (which for fscrypt and IPsec is
> on the small side, so it would always select the CPU unless there was a
> low-overhead offload engine available)
> 
> This probably needs some adjustment to allow selecting a low-power
> implementation (e.g. on mobile, I'd want to use offloading for fscrypt even
> if it is slower), and model request batching which reduces the overhead in a
> busy system, but it should be a good start.

What does this have to do with this thread, which is about the PowerPC
optimized MD5 code?

- Eric

