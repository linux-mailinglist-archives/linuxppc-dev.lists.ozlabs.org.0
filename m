Return-Path: <linuxppc-dev+bounces-9359-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F1FAD9390
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jun 2025 19:12:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJmD304vWz2yMF;
	Sat, 14 Jun 2025 03:12:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749834738;
	cv=none; b=HqmoCn/bDIyRs+Jn9sM9xPF0W6Wb/Zt4gb2t2Tm4W5dOs64Z9tmEz9vvyWS7tsnYhut6XxL1VyXNilMLBuunxkB0qKq5d7JJoJV06aMIDD0fBz9XrRJo2mihvyWKttWn/SSam0MsHMKpiQ+SYLru5MKNXdj4m6AjsnYIT8E+IfTKKIBZ7X8tlLwuOcnqK4Tt1+3s4oVSXkkXsgYAQaiOjq5raDDs6OY2A6y//bZ3Y24GGTs0r7khnS2el7C8KZVmGkpMlJvwmFMioibBWpJQm98NNTpDyaKCb0O0ZqGIai8uvNdg8Itp3hD/U8q1DqHd58tj+L34Bge03KhTZ+2hNg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749834738; c=relaxed/relaxed;
	bh=SvL9AL31A+o3wK3njb/Du4yvgoiu7rebh1/wJmOONVs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h17SqTJER4HC5Lh9lhZUPnB0KGKAqk9lO6tdrSHABmvRQh9UqcVUi66OtPtu0+oaKiG3UZd8SlUcaiRJx7SwtGi+VwwP0Aw3/gWtXM1I8D8w+Z0VfdWdgnljMUlJDvoE0Tk3RCHsmjzGPztNQAv9orYnPXiOG61O1/swZtL8EUXkyIw4LxxKOiZgb19RuG+7vRfhnASV7HEeAI92yTejg9QN1tKRS+skizt6PustLoctDrjLyvbH8hd3SSNkgEBtLDkZDMhewu/fWXqMj/kEnpEbtkiWEjklY47Izl4shnC97mXJpkS0sIgsLk/AJL+XPcbKtpllUoFqytpHtt+0+w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BhivCur+; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BhivCur+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bJmCx5sztz2xKN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Jun 2025 03:12:13 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0B2ED61F1A;
	Fri, 13 Jun 2025 17:12:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43202C4CEEB;
	Fri, 13 Jun 2025 17:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749834730;
	bh=MwLvd5PG7WoLPNV5X3+UTldK/899ju4MNdrqiosDJ9I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BhivCur+l0uxRrXdj3m3GKjsKlQNT6CXQx3iCBvVkXSvE4m7EvCcVuRfY6gZB5DtI
	 RrJabvRIGIr3L4g87xf0gTfQDs/DflrsqDAj5QlhN5vplNG9fEENywbAPzXW3gnNlq
	 m+coGK+eBLQeJtsoxM3fU4c5Xpiy8kfmTbUODa1wg4jIDHjdtxdql01cyMgso0UG9q
	 znLaUKdE+SbabPCvrEijY1od4XSYKiQECxgj+txYdWIoB7IUqgUD3yiEVggSkRo5Am
	 oG2oDjLPd9qcjldUhG53BMbb8wG7cjW4jHsngIK0FAWMIuyciYpkyJRP9+ahUBrIUW
	 mqv3dY3gjk5ZQ==
Date: Fri, 13 Jun 2025 10:11:43 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org,
	linux-arch@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v2 09/12] lib/crc/s390: migrate s390-optimized CRC code
 into lib/crc/
Message-ID: <20250613171143.GB1284@sol>
References: <20250607200454.73587-1-ebiggers@kernel.org>
 <20250607200454.73587-10-ebiggers@kernel.org>
 <aExLZaoBCg55rZWJ@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
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
In-Reply-To: <aExLZaoBCg55rZWJ@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Jun 13, 2025 at 06:01:41PM +0200, Alexander Gordeev wrote:
> On Sat, Jun 07, 2025 at 01:04:51PM -0700, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > Move the s390-optimized CRC code from arch/s390/lib/crc* into its new
> > location in lib/crc/s390/, and wire it up in the new way.  This new way
> > of organizing the CRC code eliminates the need to artificially split the
> > code for each CRC variant into separate arch and generic modules,
> > enabling better inlining and dead code elimination.  For more details,
> > see "lib/crc: prepare for arch-optimized code in subdirs of lib/crc/".
> > 
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> ...
> 
> Hi Eric,
> 
> With this series I am getting on s390:
> 
> alg: hash: skipping comparison tests for crc32c-s390 because crc32c-generic is unavailable
> 
> Thanks!

I think that's actually from "crypto/crc32c: register only one shash_alg"
(https://lore.kernel.org/linux-crypto/20250601224441.778374-3-ebiggers@kernel.org/),
not the patch you replied to.

Those self-test warnings are expected.  But I guess they are going to confuse
people, so we should do something to make them go away.

I think we should do what I've proposed for SHA-512: stop worrying about setting
the cra_driver_name to something meaningful (which has never really worked
anyway), instead just use *-lib, and update crypto/testmgr.c accordingly.

I'll send out patches that do that.

- Eric

