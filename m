Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1DD75BD99
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jul 2023 07:01:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=kMSCklil;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R6cpc5ndkz3cCj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jul 2023 15:01:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=kMSCklil;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R6cnk2Tlcz305R
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jul 2023 15:00:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1689915638;
	bh=zOaO/BDiMViyIwV25A6Bb8YgrTQHlQUOzuaNQJEjFbI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=kMSCklilWZrrZg224QJpabopJPo7ZDKutmdB2yp5BfMhoOC8ytdTiPCgv1tuqMpM9
	 JDwhRDIVruD0cm3BHtEo9ZchHtb9yLW3Va1h9p/ZfEfzDFqIE6oZiNpC5ZJuFuKNCB
	 G+kl6hkBtS2kAcIwjmZZ4XdNxHATlUKSb+mNsRJkOmxXRqdKFOmdDLUvQPQ3bZKDru
	 XBHiNpdW1cxCSo14NGh0Uo7VwsgdUR/dPXFOYXGjkT1Ms/N/Xv6eavsPWxPsU1TnWA
	 Tr5qRQrxX5LSMkC+MyLx8N9vtvB1JuUKZJ1m1KrAlWPxgDDu9bIdl2A0+fdyZyNNZj
	 sGeqSFaV9P/cA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4R6cnf1zwhz4wxx;
	Fri, 21 Jul 2023 15:00:38 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Michael Ellerman <patch-notifications@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Sathvika Vasireddy <sv@linux.ibm.com>, Naveen N
 Rao <naveen@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: (subset) [PATCH v4 00/15] powerpc/objtool: uaccess validation
 for PPC32 (v4)
In-Reply-To: <168986105076.1117384.18255319220057556882.b4-ty@ellerman.id.au>
References: <cover.1689091394.git.christophe.leroy@csgroup.eu>
 <168986105076.1117384.18255319220057556882.b4-ty@ellerman.id.au>
Date: Fri, 21 Jul 2023 15:00:38 +1000
Message-ID: <87mszpj1u1.fsf@mail.lhotse>
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

Michael Ellerman <patch-notifications@ellerman.id.au> writes:
> On Tue, 11 Jul 2023 18:08:26 +0200, Christophe Leroy wrote:
>> This series adds UACCESS validation for PPC32. It includes
>> a dozen of changes to objtool core.
>> 
>> It applies on top of series "Cleanup/Optimise KUAP (v3)"
>> https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=363368&state=*
>> 
>> It is almost mature, performs code analysis for all PPC32.
>> 
>> [...]
>
> Applied to powerpc/fixes.
>
> [01/15] Revert "powerpc/bug: Provide better flexibility to WARN_ON/__WARN_FLAGS() with asm goto"
>         https://git.kernel.org/powerpc/c/b49e578b9314db051da0ad72bba24094193f9bd0

Sorry that's b4 getting confused, I actually applied the v5 that I sent:

https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20230712134552.534955-1-mpe@ellerman.id.au/

cheers
