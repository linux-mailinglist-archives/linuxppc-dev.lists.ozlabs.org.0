Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E290777F6C3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 14:51:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=fLLVkqAC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RRPyQ56P7z30dt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 22:51:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=fLLVkqAC;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RRPxc5Jmkz2yVs
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Aug 2023 22:50:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1692276644;
	bh=5oaoKNipVX6iSVnp72EenoIUu3tPuOJ8sGaIEin3KYY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=fLLVkqACp2syBanYmRdMWC0/3PUAgD5PRnAXsBRgSfThdw0GmtniHRUReakEKl7lW
	 mMiOdflnsx9uQp37PgaO+XKQKbMkstMXUl7qiEEvaYqbtPa+YVS0a9VJxKelxX0VBA
	 gFg2BPfvHjrHmS424o7LlcFhHwV1mJ2qIXhNzHouOorCgVWI5cVOW8PQTxL9WTE9p7
	 QCSPahZ4qbmpfIxijy7wslasj0jjI7PIbKV2CD3RFLr1hf21WbDxMvWGjvzAcYK9yc
	 Wf9NMNg6Sm/S6xESj4A7N5FQXnZdAdWuph+CjNf+ooInhrDPS2d7WZwJCbyhkOuo7E
	 8rg7gcwD7ZYSA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RRPxc3Wwtz4wy6;
	Thu, 17 Aug 2023 22:50:44 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Nicholas Piggin
 <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/82xx: Remove pq2_init_pci
In-Reply-To: <8b2db7c3c2c346aa8aa49507415c360d441e5bf5.1692259498.git.christophe.leroy@csgroup.eu>
References: <8b2db7c3c2c346aa8aa49507415c360d441e5bf5.1692259498.git.christophe.leroy@csgroup.eu>
Date: Thu, 17 Aug 2023 22:50:44 +1000
Message-ID: <871qg1est7.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Commit 859b21a008eb ("powerpc: drop PowerQUICC II Family ADS platform
> support") removed last user of pq2_init_pci.
>
> Remove it.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/platforms/82xx/pq2.c | 46 -------------------------------
>  1 file changed, 46 deletions(-)

Haha, from my local tree:

$ show --stat dev/mpe
commit d4268218b50422292cb5e1273cc6829fb3b22b5b
Author:     Michael Ellerman <mpe@ellerman.id.au>
AuthorDate: Wed Aug 16 14:06:50 2023 +1000
Commit:     Michael Ellerman <mpe@ellerman.id.au>
CommitDate: Wed Aug 16 14:08:47 2023 +1000

    powerpc/82xx: Drop unused pq2 PCI code

    The last caller of this code was removed when the pq2fads platform was
    dropped in commit 859b21a008eb ("powerpc: drop PowerQUICC II Family ADS
    platform support").

    Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

 arch/powerpc/platforms/82xx/pq2.c | 46 ---------------------------------------
 1 file changed, 46 deletions(-)


But I'll take yours because you sent it first.

cheers
