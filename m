Return-Path: <linuxppc-dev+bounces-1108-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CE696F3B9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2024 13:55:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0ZRm3x6mz30CD;
	Fri,  6 Sep 2024 21:55:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725623732;
	cv=none; b=gMnRjUGGjY7btyeFAwoNEKg5VHBxNnImSX0Z9VjZYCjOBFnliQZpO/9+vrTeThBjaxNg3NGqRJxr0aX53ic1ewUabhZ4rnC6yWhijQX7KlslbnEVXZjr9dKCLLh/SRrcG0pujGaSLzpMmvrhLmkO7HIGtSIa4pzlpxeA5v5J1+ZgFxeUbG4v7B8L4uCEfS6cJ9prPWHhLFe+pXomjzWocq5hQ3VFT663CWeFwoQTCmxb9jUXsRu/CBsXTLcoliUScPh3WBZf5Sen0JLwen4hZSdqog/PRcHzfh37GSD4Pu+lISTPXC0kDKDQq7LJkcaOzz1wRqxFCcZBWdP9s1jUFg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725623732; c=relaxed/relaxed;
	bh=ybCT9fsaZN19E/BOFjTbclScIVopwetCOatG58ypcIc=;
	h=DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type; b=OSdsFkEa+c3RL6mqsuQ8GyyZRW9Of5E3py9LocMG+4NFNdAtluZgUFCJLgfe5bZgnqb3/O/gZnxT7IfQGe3smic22Ej3beiKyz84QqGJZJb9RA8emBwmqWC72xj77KpCUGIhidG2s+V8bRgHU3Q4e/uPmovso9vWP4Gx/Zd1m8/bywkrcobOVqnfMx3luFxhVL/K/cDU6T3dYxIcCbIy1e7I5MCjubdM/av3CaWTA01SxL4Dtbnc2Qwv99CXDCPRQRdaSUzGgvWbybC740BiPqlInTu50OK7E+T7EFl7Vlj8jN2dtBzooLr/HvNT6UcARqwyrpYuvblwdk3OSzpyew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=c6JIwH1m; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=c6JIwH1m;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0ZRm2vW6z30Bp
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2024 21:55:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1725623732;
	bh=ybCT9fsaZN19E/BOFjTbclScIVopwetCOatG58ypcIc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=c6JIwH1mKumUJdoNUdWmgF5fKWOLYygLoubnrLuTqGNcVdpPvcayRH0Z8HuoyC1U9
	 mwejExtXicAV/yYMMSIIwWSyqpiwfDgL2MsrBBI+4/VBUqkMds3GxzsB2/mLsvRK0H
	 Ed9rvaANdFqWRfamXIAtpSlG/cp6aB8QFcO1PkQ9iuXD8NtVsaws16PK+Ah5lXLryF
	 9gGrW1z2FUEILD0AMiccg+0vJwxJx7lsbLVuHYhWvEQzzz+qZBNodf1j7uTcPjJBhc
	 xcJ6ajVPJP5OGpPEiNwZ3pc1T5ElaSt5d0Z7r3wbt7KMd++iwOx7hOoW5kxl7+3sk9
	 1HinoXQR8OSEw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X0ZRl3DL7z4x3p;
	Fri,  6 Sep 2024 21:55:31 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org, akpm@linux-foundation.org, david@redhat.com, Liam.Howlett@oracle.com, tglx@linutronix.de, bgray@linux.ibm.com, joel@jms.id.au, bhelgaas@google.com, Gaosheng Cui <cuigaosheng1@huawei.com>
Cc: linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20240822130609.786431-1-cuigaosheng1@huawei.com>
References: <20240822130609.786431-1-cuigaosheng1@huawei.com>
Subject: Re: [PATCH -next 0/4] Remove obsoleted declaration for powerpc
Message-Id: <172562357198.467568.17772296791614231307.b4-ty@ellerman.id.au>
Date: Fri, 06 Sep 2024 21:52:51 +1000
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

On Thu, 22 Aug 2024 21:06:05 +0800, Gaosheng Cui wrote:
> Remove obsoleted declaration for powerpc, thanks!
> 
> Gaosheng Cui (4):
>   powerpc: Remove obsoleted declaration for _get_SP
>   powerpc: Remove obsoleted declaration for maple_calibrate_decr
>   powerpc: Remove obsoleted declaration for pas_pci_irq_fixup
>   powerpc: Remove obsoleted declarations for use_cop and drop_cop
> 
> [...]

Applied to powerpc/next.

[1/4] powerpc: Remove obsoleted declaration for _get_SP
      https://git.kernel.org/powerpc/c/dace02a9ee1921adee05bf1807a78f92ee2dea2b
[2/4] powerpc: Remove obsoleted declaration for maple_calibrate_decr
      https://git.kernel.org/powerpc/c/6745c5bb2e0fe513918ce2136108a2efb92bdea1
[3/4] powerpc: Remove obsoleted declaration for pas_pci_irq_fixup
      https://git.kernel.org/powerpc/c/fe16a749731e86d580acf8d43b0298dfe6d1503d
[4/4] powerpc: Remove obsoleted declarations for use_cop and drop_cop
      https://git.kernel.org/powerpc/c/600d6a7e630e970624911624eb15986245b18668

cheers

