Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A0F7D468A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Oct 2023 05:57:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=a4QEyhDP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SDyvR0rjxz3cSV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Oct 2023 14:57:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=a4QEyhDP;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SDytc2LpQz2ygY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Oct 2023 14:57:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1698119831;
	bh=IAhOV59IL0dDYPGzR0+4k0wjvyE6d0i0JVdfSx1wOqM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=a4QEyhDP0VqTgFZ9zxzlaqQC/4GByyJpTvk84VFb+90IYHaRdq5tVpIKlXPFwLIjl
	 KRI0XKjVZ45pxojown33ZbRCrjFgxmgnD/2KSjrIL7mJqQ4MfQeBJf4+H3nfl9/TaM
	 yUsnAhll712BIN/GVfO8/Ut8Bd7QjxIjj+cTVJFpGybXuvvFygy+jy7tmCim4eTYdM
	 7jfEXuKHv8wc0OuskDH6/m2UeXCFTwayUCcolpE4q8s01BbVaRWp8SFdjtCY/Gq6I8
	 ATam/zbdnfF2U3xhR5n6lcXhAiGXQwyF9XnOCEaUs0pWcXg0hRkBv/GCIFFLRBGEjZ
	 u1J+lt4kLq01g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SDytb0KQcz4wcN;
	Tue, 24 Oct 2023 14:57:11 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>, PowerPC
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the powerpc tree
In-Reply-To: <20231024081617.686c086f@canb.auug.org.au>
References: <20231024081617.686c086f@canb.auug.org.au>
Date: Tue, 24 Oct 2023 14:57:04 +1100
Message-ID: <87o7god65r.fsf@mail.lhotse>
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Stephen Rothwell <sfr@canb.auug.org.au> writes:
> Hi all,
>
> Commit
>
>   351a050f602d ("Revert "powerpc: add `cur_cpu_spec` symbol to vmcoreinfo"")
>
> is missing a Signed-off-by from its author and committer.
>
> Reverts are commits as well ...

Thanks, fixed.

cheers
