Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC3A79200B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Sep 2023 04:37:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Br/G74Wd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RfqR62Cbpz3c48
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Sep 2023 12:37:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Br/G74Wd;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RfqQF6dqCz30Jy
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Sep 2023 12:36:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1693881397;
	bh=5+JoxtLs6MVTssB1pdaRBmIYrJlBYbAptn7l8A1Vk+A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Br/G74WdcIjQZxwDT+3mLhNHjcoPzFSvAB/Y+N6jsZfYbOgF3AbHwCA2vW91rZlkR
	 kVr/zcNm3e4X36YDgFg64oFezqScC1nSyMEJKS5hbIidm9gAd+K/o57X/f/wTVM1rx
	 l7omlV3WPJ63z7H3WOl4x/rqphjCnCs0X90rs7biRA0S0qE3vqHtsK9EWOBeAPkdHi
	 /KPsJpkfn6UjL4BevawmfW2+xPoBB5V/gN4KOst/Y+lDp3S0qDWtKRxUo9XjWb3lI6
	 1pdzYcSZ7Vm5hxGCkj8YaPZzUtEmBTSUzYTBbmw8HmkdQupT9tIZtSjsTk5W/ZjvXd
	 GnY495hVf7QUg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RfqQF028Gz4wxy;
	Tue,  5 Sep 2023 12:36:36 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Nicholas Piggin
 <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64e: Fix wrong test in
 __ptep_test_and_clear_young()
In-Reply-To: <2daed51109cbd7e7fbd26fab4e77fc6a27dee63e.1693643773.git.christophe.leroy@csgroup.eu>
References: <2daed51109cbd7e7fbd26fab4e77fc6a27dee63e.1693643773.git.christophe.leroy@csgroup.eu>
Date: Tue, 05 Sep 2023 12:36:36 +1000
Message-ID: <87a5u1ibwr.fsf@mail.lhotse>
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
> Commit 45201c879469 ("powerpc/nohash: Remove hash related code from
> nohash headers.") replaced:
>
>   if ((pte_val(*ptep) & (_PAGE_ACCESSED | _PAGE_HASHPTE)) == 0)
> 	return 0;
>
> By:
>
>   if (pte_young(*ptep))
> 	return 0;
>
> But it should be:
>
>   if (!pte_young(*ptep))
> 	return 0;


That seems bad :)

But I don't know off the top of my head where
__ptep_test_and_clear_young() is used, and so what the symptoms could
be. Presumably nothing too bad or someone would have noticed?

cheers
