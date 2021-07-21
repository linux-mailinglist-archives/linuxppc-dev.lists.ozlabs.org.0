Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C580E3D0C8A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jul 2021 12:48:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GVC3y5mr6z30Gx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jul 2021 20:48:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ID6hrb0z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=will@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ID6hrb0z; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GVC3T3NhFz2yP1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jul 2021 20:48:05 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DDCED6138C;
 Wed, 21 Jul 2021 10:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626864482;
 bh=qR4EPIkAAUhsdXzNobnISSq8AvXs8KveVzIPRgC1ZSg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ID6hrb0zF1vZAWTO/w64wkH49bmbmEGRBdhTkmz8CXH9ZQ5RF7SsBYyX6mXFyyASq
 f07Ztur3Q8lPzlkZAf/va0W1gLo9bnlyRHdsKrfjsu5sUGuqAvqSocHtj4yFnuL0cJ
 HiqjLARL7TjecLsxZuUzEPQkZx1WtlU6O3iMOLP74mxKJjN7PE3iMkNtcDR6HQfFGj
 XRT3R6bViCjK4K/kVOCKFpFBDjuL9BhP+zLL9tekrqcd4Umomaxh0EnxUYxWWnlo0R
 ld9xxHa8rszAKphlvt/IYjNPlhOofDAjcAFSKgUAqmggENwS95WZ2jZptkug0eO44b
 WhsgW3cGaup2Q==
From: Will Deacon <will@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2] Revert "mm/pgtable: add stubs for
 {pmd/pub}_{set/clear}_huge"
Date: Wed, 21 Jul 2021 11:47:53 +0100
Message-Id: <162686329170.980657.905966885675716231.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <87r1fs1762.fsf@mpe.ellerman.id.au>
References: <20210720202627.Horde.vlszNhxkKrLIg0-3Sn2ucw5@messagerie.c-s.fr>
 <87r1fs1762.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
 linux-kernel@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
 Will Deacon <will@kernel.org>, catalin.marinas@arm.com,
 linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 Ard Biesheuvel <ardb@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-arm-kernel@lists.infradead.org, Paul Mackerras <paulus@samba.org>,
 Thomas Gleixner <tglx@linutronix.de>, kernel-team@android.com,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 21 Jul 2021 17:02:13 +1000, Michael Ellerman wrote:
> This reverts commit c742199a014de23ee92055c2473d91fe5561ffdf.
> 
> c742199a014d ("mm/pgtable: add stubs for {pmd/pub}_{set/clear}_huge")
> breaks arm64 in at least two ways for configurations where PUD or PMD
> folding occur:
> 
>   1. We no longer install huge-vmap mappings and silently fall back to
>      page-granular entries, despite being able to install block entries
>      at what is effectively the PGD level.
> 
> [...]

Thank you Michael! I owe you a beer next time I see you, if we don't go
extinct before then.

Applied to arm64 (for-next/fixes), thanks!

[1/1] Revert "mm/pgtable: add stubs for {pmd/pub}_{set/clear}_huge"
      https://git.kernel.org/arm64/c/d8a719059b9d

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
