Return-Path: <linuxppc-dev+bounces-15-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC29E94ECCF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2024 14:22:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WjDDJ4ys2z2yDr;
	Mon, 12 Aug 2024 22:22:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WjCl54fgxz2xXV
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Aug 2024 22:00:33 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WjCl34NBYz4wcs;
	Mon, 12 Aug 2024 22:00:31 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Andrew Morton <akpm@linux-foundation.org>, Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <1cdaacb391cbd3e0240f0e0faf691202874e9422.1723109462.git.christophe.leroy@csgroup.eu>
References: <1cdaacb391cbd3e0240f0e0faf691202874e9422.1723109462.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/mm: Fix size of allocated PGDIR
Message-Id: <172346398143.772106.7025827300868207438.b4-ty@ellerman.id.au>
Date: Mon, 12 Aug 2024 21:59:41 +1000
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On Thu, 08 Aug 2024 11:32:47 +0200, Christophe Leroy wrote:
> Commit 6b0e82791bd0 ("powerpc/e500: switch to 64 bits PGD on 85xx
> (32 bits)") increased the size of PGD entries but failed to increase
> the PGD directory.
> 
> Use the size of pgd_t instead of the size of pointers to calculate
> the allocated size.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/mm: Fix size of allocated PGDIR
      https://git.kernel.org/powerpc/c/e7a9af8c93aa9f408f9972809b642faeec5287e1

cheers

