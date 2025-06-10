Return-Path: <linuxppc-dev+bounces-9253-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C76AD422F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jun 2025 20:48:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bGyVH7005z30Ql;
	Wed, 11 Jun 2025 04:48:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749581303;
	cv=none; b=QVvw/3B4csdd/LFqlI8AAFMd6gpRx7j9Z2wZ1V+UF7HuCKBWpT3nPTkPIV5kX73tJMciV8z2f7OGmTW6aSbrybt+0LonQpnIrgKNC4oKSoHD9pW1yxyMzliUqigES3MdiRUhArrnS1YA3GGZ9794Xe1zPt+89X40aoN3qzghoSnGp6bSNVi4ooUpAcHwujPyqmxT/68o2jF34HkhAduKsZUJl7KDFKNJG4EmyN7ccksp+465KPot0Y61aapzTyakPFytpQ0Kfi4CvPegNRd6Nif03Pt8wJc/rbbHPqGVOU93zGsdVStshKCzmDH8s1xlmQJUqifljCFMt5cPI/+rlg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749581303; c=relaxed/relaxed;
	bh=D4V9fFFznfhj/boa7AgPZs5HTODgZe9iwQpbGyIQYB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d+PZXl3mtiP3udwhCFGC5B8KsW2moVW++6MS2iWY58LqEtpgV+sVyAufaXJ8zKhCicm08wIAdGrywC60gxqtCaWZtFl2d5hULC6IZBmx2JAvSKHnazGVRS2W24+2qKYZzOBZd8PxlTc1stvd6T6jqD5E/XprjN5tXZ3Grc8K2bhxNwH/9EqMpgCGPbTgaIz/nQBFRBSmprgQkVCV0uEm3QI/9/wezWVQqIAshYTDSAaKJv+/MwC0Q3z1Z2P/mugB4Hs4JmOALE/4heHpUy0vwut9uBtLhkSdiRTcpiCM49R0SBayqzZsN5ltf/JmsomQFUH3q1a7OgnwLu53tDwIuw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=N2rR2VQ8; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=N2rR2VQ8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bGyVG6wKKz30Qk
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Jun 2025 04:48:22 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 238B4A51404;
	Tue, 10 Jun 2025 18:48:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B537C4CEED;
	Tue, 10 Jun 2025 18:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749581299;
	bh=fW4WUlLPzTcOGUmKEUJPh5AreVUZepIXG7py1Yrxjzw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N2rR2VQ8Oq9Cmc6H9eooraC/6WL6LWGn/CyQscdSYoBnxrd6j556t8Yr4T5TQT33Y
	 KjAddPGzxn/a1xZsEPhM/wtGddhOqKWPsMgUketQdpHVnfaf6YaA4v61Gwh2iKlc4q
	 XkImdNQGb8y/Dgab6Udgq58Wxqco3rHtvNJ/qMnxwy9JcEIqHgZDQeAJCWUxC+A3oV
	 OL2cGfo+A5I1Vic3XRH5dNQh8oPwI4lU72wrwqRIvmCAJJGgAq2b9hXkSx0B0RmSDD
	 yJDpesZCL8iTxUJpJJvTqXeUEjtLqkz9iTejv45bhW3iFAmqRSy59HNfkPBVXi01hH
	 mICO2Doj48fpw==
Date: Tue, 10 Jun 2025 11:47:55 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
	x86@kernel.org, linux-arch@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v2 00/12] lib/crc: improve how arch-optimized code is
 integrated
Message-ID: <20250610184755.GC1649@sol>
References: <20250607200454.73587-1-ebiggers@kernel.org>
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
In-Reply-To: <20250607200454.73587-1-ebiggers@kernel.org>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, Jun 07, 2025 at 01:04:42PM -0700, Eric Biggers wrote:
> This series is also available at:
> 
>     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git lib-crc-arch-v2
> 
> This series improves how lib/crc supports arch-optimized code.  First,
> instead of the arch-optimized CRC code being in arch/$(SRCARCH)/lib/, it
> will now be in lib/crc/$(SRCARCH)/.  Second, the API functions (e.g.
> crc32c()), arch-optimized functions (e.g. crc32c_arch()), and generic
> functions (e.g. crc32c_base()) will now be part of a single module for
> each CRC type, allowing better inlining and dead code elimination.  The
> second change is made possible by the first.
> 
> As an example, consider CONFIG_CRC32=m on x86.  We'll now have just
> crc32.ko instead of both crc32-x86.ko and crc32.ko.  The two modules
> were already coupled together and always both got loaded together via
> direct symbol dependency, so the separation provided no benefit.
> 
> Note: later I'd like to apply the same design to lib/crypto/ too, where
> often the API functions are out-of-line so this will work even better.
> In those cases, for each algorithm we currently have 3 modules all
> coupled together, e.g. libsha256.ko, libsha256-generic.ko, and
> sha256-x86.ko.  We should have just one, inline things properly, and
> rely on the compiler's dead code elimination to decide the inclusion of
> the generic code instead of manually setting it via kconfig.
> 
> Having arch-specific code outside arch/ was somewhat controversial when
> Zinc proposed it back in 2018.  But I don't think the concerns are
> warranted.  It's better from a technical perspective, as it enables the
> improvements mentioned above.  This model is already successfully used
> in other places in the kernel such as lib/raid6/.  The community of each
> architecture still remains free to work on the code, even if it's not in
> arch/.  At the time there was also a desire to put the library code in
> the same files as the old-school crypto API, but that was a mistake; now
> that the library is separate, that's no longer a constraint either.
> 
> Changed in v2:
>    - Fixed build warning on architectures without any optimized CRC code
>    - Fixed build warning in sparc/crc32.h by removing pr_fmt
>    - Moved fallback definitions of crc32*_arch back into arch files
>    - Remove ARCH_HAS_CRC* symbols at end of series instead of beginning,
>      so that they're not removed until they're no longer being selected
>    - Slightly improved some commit messages
>    - Rebased onto other pending lib/crc changes
> 
> Eric Biggers (12):
>   lib/crc: move files into lib/crc/
>   lib/crc: prepare for arch-optimized code in subdirs of lib/crc/
>   lib/crc/arm: migrate arm-optimized CRC code into lib/crc/
>   lib/crc/arm64: migrate arm64-optimized CRC code into lib/crc/
>   lib/crc/loongarch: migrate loongarch-optimized CRC code into lib/crc/
>   lib/crc/mips: migrate mips-optimized CRC code into lib/crc/
>   lib/crc/powerpc: migrate powerpc-optimized CRC code into lib/crc/
>   lib/crc/riscv: migrate riscv-optimized CRC code into lib/crc/
>   lib/crc/s390: migrate s390-optimized CRC code into lib/crc/
>   lib/crc/sparc: migrate sparc-optimized CRC code into lib/crc/
>   lib/crc/x86: migrate x86-optimized CRC code into lib/crc/
>   lib/crc: remove ARCH_HAS_* kconfig symbols

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=crc-next

- Eric

