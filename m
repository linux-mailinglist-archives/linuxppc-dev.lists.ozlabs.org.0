Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B44850D67
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 06:39:32 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=UMfTjBFW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYCvP6nplz3cy4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 16:39:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=UMfTjBFW;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TYCtd2GCMz2yQL
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Feb 2024 16:38:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1707716323;
	bh=WlznTFxLp/HqFR/zHSqL++eDGzo1KkY/I6UV1Hx6DCk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=UMfTjBFWpNqTOIZvz6QcIVM3SE6n+B41vf/0Kvn85Pw7GDCUwInzDu6DTsJgwCaVy
	 IMs4YMFg48fl9X+9RJUYaqR25O4+do2ND9cJpe41Y96p+hskf4xgEdJgFzBGjnMkrM
	 XwSc3MT89EHjIjFFkDb9GmTOkaRWzDj9X8jy9+yCBwBUfgwQNFLYO5o6+oaChYUTyd
	 16sI7XC8aQ/58Z/ZAT0jqwMYhxKx2GYl0ue66fznbLpoIJkree2ooJSxmatRgve7ed
	 nIbJPhvT1dXw7cKUOtD+ZGOd64lJlyD73eUMxmeqBWfNp/hm98fGs7DDvpkZlW2dSM
	 aiOq9Dzyo85xQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TYCtV1D1Kz4wyj;
	Mon, 12 Feb 2024 16:38:42 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Kees Cook <keescook@chromium.org>, linux-hardening@vger.kernel.org
Subject: Re: [PATCH 60/82] powerpc: Refactor intentional wrap-around test
In-Reply-To: <20240123002814.1396804-60-keescook@chromium.org>
References: <20240122235208.work.748-kees@kernel.org>
 <20240123002814.1396804-60-keescook@chromium.org>
Date: Mon, 12 Feb 2024 16:38:41 +1100
Message-ID: <87zfw66y3i.fsf@mail.lhotse>
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
Cc: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>, Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org, Mahesh Salgaonkar <mahesh@linux.ibm.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, dingsenjie <dingsenjie@yulong.com>, Nicholas Piggin <npiggin@gmail.com>, Justin Stitt <justinstitt@google.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Bill Wendling <morbo@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Kees Cook <keescook@chromium.org> writes:
> In an effort to separate intentional arithmetic wrap-around from
> unexpected wrap-around, we need to refactor places that depend on this
> kind of math. One of the most common code patterns of this is:
>
> 	VAR + value < VAR
>
> Notably, this is considered "undefined behavior" for signed and pointer
> types, which the kernel works around by using the -fno-strict-overflow
> option in the build[1] (which used to just be -fwrapv). Regardless, we
> want to get the kernel source to the position where we can meaningfully
> instrument arithmetic wrap-around conditions and catch them when they
> are unexpected, regardless of whether they are signed[2], unsigned[3],
> or pointer[4] types.
>
> Refactor open-coded wrap-around addition test to use add_would_overflow().
> This paves the way to enabling the wrap-around sanitizers in the future.
>
> Link: https://git.kernel.org/linus/68df3755e383e6fecf2354a67b08f92f18536594 [1]
> Link: https://github.com/KSPP/linux/issues/26 [2]
> Link: https://github.com/KSPP/linux/issues/27 [3]
> Link: https://github.com/KSPP/linux/issues/344 [4]
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
> Cc: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Cc: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
> Cc: dingsenjie <dingsenjie@yulong.com>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
> Cc: Naveen N. Rao <naveen.n.rao@linux.ibm.com>
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  arch/powerpc/platforms/powernv/opal-prd.c | 2 +-
>  arch/powerpc/xmon/xmon.c                  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers
