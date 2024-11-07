Return-Path: <linuxppc-dev+bounces-2965-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 306F79C0045
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2024 09:45:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkbHN3Ym4z3bjb;
	Thu,  7 Nov 2024 19:45:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730969104;
	cv=none; b=Wj034ebedxN1X7IhsdZ+hkwaLlN2OmgyQmOC7NECFMwxzfPdD5Mj7ADfKXjRebLtsCdrDse3ooBQJ2cyQBwyTxEDtL9/nQkUiE+mee/DfHTLQS2AMYKiA5dlBAB+y5mM2xQhzanT3CInIkPCR8qV1nLxuUYcEvd8vBw2StA4b9ce1FZH2y7x3Sf3ljwjpYdoDuZ8KKOJb6AiqKZ9PCIZTp+29up6gXTbH/2h4SNdEEiRORNVN9CeJRoLfQPknw7+knqdimh6O4+6JRCz04Zugz+mf51l6k2pJCUC8R8l+9Wt/YsmNLHd2FOKfrZOq+Fv6NGZa2xIFnGaZ5u8EVF9yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730969104; c=relaxed/relaxed;
	bh=qv+lXZk9AxiBXOukRl42TWk9GVsab/O46laDxhRM5hE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jr2ZFpIK1li2+qNObZFOIizM7/AG1k25H4qdi3HDeFPKjSoCf4JXrZvrS1xUPqWnhhk//4lLswlccpeAd/5qzeWI0WOtoYtqWV2yxGgHtrhgfkyi6EdYJ99LYQiVf9KNBMxcl+z3kX0wdx2GSoZ1hoAZu35PwW1JJ1k6oviY6C1zl/OESUY4TdgkW5irdDpBu0aVYY9yisn641jlCrt3mnL33Qq0dWKC8KUvVRaVGIGSMZCW5iJQehvT5yKoG8h8R2+nJUn/GcT8nRyJC0eizr2gfaGtR+8XxVWEQZfoHl8jPrrvsqy1XeJWqc5B8spCF2XJnZ+Am/YctB6kzDBgBQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=M/4lmfPE; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=M/4lmfPE;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XkbHN0BG3z3bkP
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2024 19:45:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1730969101;
	bh=qv+lXZk9AxiBXOukRl42TWk9GVsab/O46laDxhRM5hE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=M/4lmfPEFRH6/1lbGXZBiuQuWuN2f8FgVMgompeW9KGF6Se4j/TxtUiG5cI8liugR
	 DKqNkDPNEh9c8Dsncmnhna5GB/rb/gUG0Sf4CeGKiVe5fELEqOus4gH96I2F0P5539
	 b3wn8WIYcWynrYfX9RKuvDYCQ7shNlF+dqtmKr1uhmpFyNpgL3mOWcEA6V+G3Wcv/G
	 KEH0oZh3ZfLj7EZBtS2poxP7EoIohkWX9Q7qGxnnEN9gNRwXyN3kuTMIUpThnoC7f+
	 6ixUqafHF1r/Rm2cC7JqJq5OjIW6VIWnCqRD/lynN3imW71Lhgo3FhmD0fDC5nrgYC
	 /DeAjY60zFUrA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XkbHK1YtXz4xFt;
	Thu,  7 Nov 2024 19:45:01 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
Cc: linux-kernel@vger.kernel.org
In-Reply-To: <20241013102957.548291-1-mpe@ellerman.id.au>
References: <20241013102957.548291-1-mpe@ellerman.id.au>
Subject: Re: [PATCH v2] powerpc/64: Remove maple platform
Message-Id: <173096894650.18315.14444465278023846329.b4-ty@ellerman.id.au>
Date: Thu, 07 Nov 2024 19:42:26 +1100
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, 13 Oct 2024 21:29:57 +1100, Michael Ellerman wrote:
> The maple platform was added in 2004 [1], to support the "Maple" 970FX
> evaluation board.
> 
> It was later used for IBM JS20/JS21 machines, as well as the Bimini
> machine, aka "Yellow Dog Powerstation".
> 
> Sadly all those machines have passed into memory, and there's been no
> evidence for years that anyone is still using any of them.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/64: Remove maple platform
      https://git.kernel.org/powerpc/c/62f8f307c80e99ab18d38aa1a5bbbc18128ee5f8

cheers

