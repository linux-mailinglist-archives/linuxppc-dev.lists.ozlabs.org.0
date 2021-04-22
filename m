Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31707368201
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 15:57:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQzWZ0lHDz30D7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 23:57:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=IEwQvqr/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=IEwQvqr/; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQzWC6RKcz2yQq
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Apr 2021 23:57:11 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FQzWC0CQdz9sV5;
 Thu, 22 Apr 2021 23:57:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1619099831;
 bh=vodDxdbMHgKzn3FZqqPkJFp2BSw+/poOlMN5woeQ7h0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=IEwQvqr/Wt41NgGFe3I7tXI15JSRIevFn6iZ4x7dJw0jcqAg4bZGErLrd07H+5EmW
 AcBhGpeD+pnKR/qEvozsJtBK4SljBcFM4Jsxba3rVro0eStGCBMcfVCMnAE2/Mz+oB
 ahVxX/N8fMH3oA0mCMIQ7znIo04lmgO7X2AH5oH4DBwdehc9o8ovtW3eIckb8/KoSO
 nwLfxz5xAurz6mZG2AZmAj7LoksQ+TVPK7z5Dx+fWoWX9NrPeN/ciX+m7hCF9yhh5F
 h2ojbV+o3+PB3xv6rMt3g0HpjQILWBvKT1WtLN8GbHWU+RFjHdAqoKVy62MEowbgKn
 ncxCNaD6WoakA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH v2] powerpc/kconfig: Restore alphabetic order of the
 selects under CONFIG_PPC
In-Reply-To: <361ee3fc5009c709ae0ca592249bb0702c6ef073.1619024780.git.christophe.leroy@csgroup.eu>
References: <361ee3fc5009c709ae0ca592249bb0702c6ef073.1619024780.git.christophe.leroy@csgroup.eu>
Date: Thu, 22 Apr 2021 23:57:09 +1000
Message-ID: <87eef2bex6.fsf@mpe.ellerman.id.au>
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Commit a7d2475af7ae ("powerpc: Sort the selects under CONFIG_PPC")
> sorted all selects under CONFIG_PPC.
>
> 4 years later, several items have been introduced at wrong place,
> a few other have been renamed without moving them to their correct
> place.
>
> Reorder them now.
>
> While we are at it, simplify the test for a couple of them:
> - PPC_64 && PPC_PSERIES is simplified in PPC_PSERIES
> - PPC_64 && PPC_BOOK3S is simplified in PPC_BOOK3S_64
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
> v2: Rebased on d20f726744a0 ("Automatic merge of 'next' into merge (2021-04-21 22:57)")

This will conflict badly with other things in linux-next if I merge it
now.

The best time to do this is just before rc1. I'll try to remember :)

cheers
