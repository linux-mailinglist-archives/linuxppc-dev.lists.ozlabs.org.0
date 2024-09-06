Return-Path: <linuxppc-dev+bounces-1107-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C7F96F3B7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2024 13:55:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0ZRm2dl6z30Bd;
	Fri,  6 Sep 2024 21:55:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725623732;
	cv=none; b=M8XMQ1FIc1kYE03ush8JYPWqa+r7IKMXTem0e5rlSgwAxhzs+JjS8GB+nBcnLRwJEmyFAg6V48eE1hB3bQuKoXHybFZ8T4rF/PR5OrcdDjI4dhKLYhy+ku7qMA9R320ghrm/VbhQU9W27EcgF/onOi6X+AxvfNsHWzqazXM0BZlQYiVchKNx0ttVfbujna3u6oHn5NUi6GYyTKhfuBp7FarHyAwcdYxye0enZjbznl/foAn9q+4mria9dNwdmb3AXe7d4FeUb72uVgDmRLAcSkFbavGcY+isaipz+KKpIbTXxNPlyeUo+DmSDTS3PuZ0U0apDwBD/Xaz9qa3/az0ag==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725623732; c=relaxed/relaxed;
	bh=pESwynHQSNkY0aLaokNxE0tjc/kRDrUjm1a7r50uJDE=;
	h=DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type; b=f6/ef8l8N3Oi2s917VuWIHokRf0TtDKqHMtHmdEApC5Ft0Npp52T8sQHsMCgW79DXt8g827YXmYfDEKLRbuuwEovlTqQ+3nOtrXDXyAlgFpjVib4y80aNGf3LYu8tYC/yQ2A5tA0RHSvibMtvpYEWLY04fepejjq3O+SymifbU4JInDfU1PSFRZKhZampVr/2GjuaT/fywp9VFYabsxxc3Tl7q3kJDR3j1q0vZ2L80gTKV0TWBR68H8PlwiarBnRYATYHzMJC+WzC/irz5XuafGFidPMd2S7XYgH/UxpVs06AHnHuC/5WNhxqKskRyljUm7D87fq/1Dhb7fdDWWOZA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=lsJQzI64; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=lsJQzI64;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0ZRm2C5sz30BG
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2024 21:55:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1725623730;
	bh=pESwynHQSNkY0aLaokNxE0tjc/kRDrUjm1a7r50uJDE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=lsJQzI64a+H9g6i/EQmj2dWh4rPPA6DWdjn+b82AcCcduHinyhntIsN52GXMPnXCV
	 ZUX1fgO1Bb8VOlq866KLu74P1SSPuvh+7/cazg7iCwJFdMkvvMKZN9U+li5OWn6wl7
	 nTLD7jn+ee2LG2RQ2uIgRVmrfH5ySUNON2AApehBOyC4NirXdwb2Gs+SuKPmL+6/Nj
	 GY9INNsr2i/dW3fQv7P8MFZNUBfYUU9QHfxgNO83B0QjRo7F5FVH1d43hTFRo0O9uf
	 /KmIkURjqyczGrRUTRJeY/z8GxrhkszXWcY1ePzr27Bsb9YuT5ZmrgWgUuzKgkPkb/
	 N5y4c1GVrLAvA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X0ZRj6wzlz4wxx;
	Fri,  6 Sep 2024 21:55:29 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: CASAUBON Jean Michel <jean-michel.casaubon@cs-soprasteria.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <cover.1724173828.git.christophe.leroy@csgroup.eu>
References: <cover.1724173828.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 00/14] Reduce alignment constraint on STRICT_KERNEL_RWX and speed-up TLB misses on 8xx and 603
Message-Id: <172562357202.467568.4096138067751916114.b4-ty@ellerman.id.au>
Date: Fri, 06 Sep 2024 21:52:52 +1000
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

On Tue, 20 Aug 2024 19:23:44 +0200, Christophe Leroy wrote:
> This series does mainly two things:
> - Remove the 8M alignment constraint on STRICT_KERNEL_RWX on 8xx to
> avoid wasting memory.
> - Speed-up TLB misses by duplicating kernel PGD entries into each
> task's PGDIRs to avoid the address comparison in TLB miss handler.
> 
> On 8xx, the address comparison takes a significant part of CPU cycles
> as it requires saving/restoring CR, and because a taken branch
> requires 2 cycles.
> On 603 it is less significant because CR is saved automatically and
> has to be restored anyway but it is still worth it.
> 
> [...]

Applied to powerpc/next.

[01/14] powerpc/8xx: Fix initial memory mapping
        https://git.kernel.org/powerpc/c/f9f2bff64c2f0dbee57be3d8c2741357ad3d05e6
[02/14] powerpc/8xx: Fix kernel vs user address comparison
        https://git.kernel.org/powerpc/c/65a82e117ffeeab0baf6f871a1cab11a28ace183
[03/14] powerpc/8xx: Copy kernel PGD entries into all PGDIRs
        https://git.kernel.org/powerpc/c/985db026c34dfc45213649023d5505822a5dcd78
[04/14] Revert "powerpc/8xx: Always pin kernel text TLB"
        https://git.kernel.org/powerpc/c/1a736d98c84acd38e40fff69528ce7aaa55dd22d
[05/14] powerpc/8xx: Allow setting DATA alignment even with STRICT_KERNEL_RWX
        https://git.kernel.org/powerpc/c/bcf77a70c4ffc9b01044229de87f5b6f9c1f7913
[06/14] powerpc/8xx: Reduce default size of module/execmem area
        https://git.kernel.org/powerpc/c/c5eec4df25c34f4bee8c757ed157f5d96eaba554
[07/14] powerpc/8xx: Preallocate execmem page tables
        https://git.kernel.org/powerpc/c/16a71c045186a11c1c743934e330de78162b86dd
[08/14] powerpc/8xx: Inconditionally use task PGDIR in ITLB misses
        https://git.kernel.org/powerpc/c/33c527522f394f63cc589a6f7af990b2232444c8
[09/14] powerpc/8xx: Inconditionally use task PGDIR in DTLB misses
        https://git.kernel.org/powerpc/c/ac9f97ff8b324905d457f2694490c63b9deccbc6
[10/14] powerpc/32s: Reduce default size of module/execmem area
        https://git.kernel.org/powerpc/c/2f2b9a3adc66e978a1248ffb38df8477e8e97c57
[11/14] powerpc/603: Copy kernel PGD entries into all PGDIRs and preallocate execmem page tables
        https://git.kernel.org/powerpc/c/82ef440f9a38a1fd7f4854397633a35af33840a5
[12/14] powerpc/603: Switch r0 and r3 in TLB miss handlers
        https://git.kernel.org/powerpc/c/31c0e137ec609f36877ea39cd343ef2476d080aa
[13/14] powerpc/603: Inconditionally use task PGDIR in ITLB misses
        https://git.kernel.org/powerpc/c/3f57d90c231d3329aaed7079dd05b5a2f7692a58
[14/14] powerpc/603: Inconditionally use task PGDIR in DTLB misses
        https://git.kernel.org/powerpc/c/062e825a336017c0334c7497690826c95aa1a84f

cheers

