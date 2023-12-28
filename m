Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A8781F45A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Dec 2023 04:20:15 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=nfF7UQxS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T0tzk6gMJz3c71
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Dec 2023 14:20:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=nfF7UQxS;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T0tys2HD1z30fM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Dec 2023 14:19:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1703733552;
	bh=EfJurZriD67cDIIwfiSM+kPHFvEVVHjMJmp7iWbFTLU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=nfF7UQxSvEFaj4zjVVDZFGc/PuImmuvaZ3mEKMBJyLZm//iqAnLT0yisJQwrCU7S0
	 bVxB5akL39HmDbuq/jT4FGLf0kG7kMimzsxsXVIQl/mVEy6wniHoOa3HjFqSvwg89c
	 FwIVvXQps64q92tRsf80IoYSQySfoqSCVs6siW9OBv42MMkw4ViUAtXCJbfNsKG6jA
	 JedpVqkGyrM26BxsJG65GhzLbngP100uf6zRb8p8DvCR1wTRoUbRUvXTe88wX+1nMn
	 fbLyXQTIPhHG72UC0XCwCWZ6EhuHxg/PdFGez6CnLQRSkY31By3C1FxLqqZHNiIIU8
	 bOMIA4nGmREWg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4T0tyk6hCKz4wxx;
	Thu, 28 Dec 2023 14:19:10 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Samuel Holland <samuel.holland@sifive.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 x86@kernel.org, linux-riscv@lists.infradead.org, Christoph Hellwig
 <hch@lst.de>
Subject: Re: [PATCH v2 08/14] powerpc: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
In-Reply-To: <20231228014220.3562640-9-samuel.holland@sifive.com>
References: <20231228014220.3562640-1-samuel.holland@sifive.com>
 <20231228014220.3562640-9-samuel.holland@sifive.com>
Date: Thu, 28 Dec 2023 14:19:08 +1100
Message-ID: <87wmszj9oz.fsf@mail.lhotse>
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
Cc: linux-arch@vger.kernel.org, amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, Samuel Holland <samuel.holland@sifive.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Samuel Holland <samuel.holland@sifive.com> writes:
> PowerPC provides an equivalent to the common kernel-mode FPU API, but in
> a different header and using different function names. The PowerPC API
> also requires a non-preemptible context. Add a wrapper header, and
> export the CFLAGS adjustments.
>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
>
> (no changes since v1)
>
>  arch/powerpc/Kconfig           |  1 +
>  arch/powerpc/Makefile          |  5 ++++-
>  arch/powerpc/include/asm/fpu.h | 28 ++++++++++++++++++++++++++++
>  3 files changed, 33 insertions(+), 1 deletion(-)
>  create mode 100644 arch/powerpc/include/asm/fpu.h

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers
