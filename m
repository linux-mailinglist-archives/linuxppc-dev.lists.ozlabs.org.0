Return-Path: <linuxppc-dev+bounces-573-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7CC9602B5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2024 09:14:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtJgt1kg8z2x99;
	Tue, 27 Aug 2024 17:14:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724742858;
	cv=none; b=DXMiQ3DcCN68CPLw6BNouu+2PW/4E1e60XPYKP3ofA40NYjadwr5CSqj/zxe8pSFx/rETCXQ3Y9P5NH+qs0s285lduUZbgYHMe/JrrycCgoCduBdufJe7JxFNACcp/hRLQIa83QYmQUYBv1dvOgcYcTd+vYFjSoL5ZYV3O6Tqm18eS5yiWZeZ0AN6bBN+ONaP+m97JtFmK87HY53EM0Cjq8DPaVnjIq1FLQg3dF9eayya9okmOoIacCxjl1UVEC7DgSMlm+0wxcLOhIIXgHmxnaZdlMzpa3Winmpo0MAAkVhpfUfJQbaYKwvVc+hNuTw8kNRHnJtVlSf7ot2Kpu7CA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724742858; c=relaxed/relaxed;
	bh=4f8ZYn+PD/0Ua+DhzTGqi62/uCDj6DThJk05O8K3eP4=;
	h=DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding; b=lLDKaA6rM7STIPikvhjzRayrA39FQuiAsNpbTcOfmzYTQNMJRLHhI1sFfRm9B9cq59++dketF15CU8gt1apu4bNW1QFPBjqoOMOwx1JTYdlLYQ1/Ol6wAOf5A+04g7T9Jv48o7qZLoD5IKb1YF1nggzTyx4Fgxq+TA3FiaYdsEoPjMBGidAa8YJjuk26rRPeglhDUkwuOiE9F64dED2RsOAwqXqcfmGSWVqbOwolAm8IYlX+UyBxRc4y27ERgRoIPQxY37NMUMSaOhMg1HDYTFY5nAtMJBaWMGIYZTl2IKdI+jibmBZMxCpcq1uq7SQ+rq3iZZrvIzt8TfaLxvhCtg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=AsNub7R0; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=AsNub7R0;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WtJgs0CxWz2yLJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 17:14:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1724742856;
	bh=4f8ZYn+PD/0Ua+DhzTGqi62/uCDj6DThJk05O8K3eP4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=AsNub7R0L1gYIMMnFLUoxH9PTXLn/hwcO4WB/chjR4Irua8VZWKgU6/DXTwqtFaGh
	 sSVqnqNgBn5y2l51Zse8WaJw665Q39fCmyMJmnzAKFnO92IQtNuqOI52KuTrvGOh9K
	 Xq1SQT9HcUWDxfYs3x1FIWnLU0R1ql8rNEu/dZrWzwiaF+phhMvExXmer2QZEbAGtr
	 Cq8ND14nr1SvIRvh2S9LF5NahxvFKv0691yDhDprdIRq3VxZQT8fA7/iRtBYStLiHE
	 dfT9nhj7Ii28qFLjaqoq3FrxJBRRrAN60ikpp2gLgHVwnbhrksnWkGNDU4woplrMGP
	 lqSP8FPkJEy/Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WtJgr5bDDz4x3J;
	Tue, 27 Aug 2024 17:14:16 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <fd332b01c47bb9cb6c3af1696a2e109be655f5b5.1724222856.git.christophe.leroy@csgroup.eu>
References: <fd332b01c47bb9cb6c3af1696a2e109be655f5b5.1724222856.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc: Remove LHZX_BE macro
Message-Id: <172474280310.31690.9393479775812488774.b4-ty@ellerman.id.au>
Date: Tue, 27 Aug 2024 17:13:23 +1000
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

On Wed, 21 Aug 2024 08:47:51 +0200, Christophe Leroy wrote:
> LHZX_BE has been unused since commit dbf44daf7c88 ("bpf, ppc64: remove
> ld_abs/ld_ind")
> 
> Remove it.
> 
> 

Applied to powerpc/next.

[1/1] powerpc: Remove LHZX_BE macro
      https://git.kernel.org/powerpc/c/a540ad3e386f8f84bc6d600b93792a50861a81ef

cheers

