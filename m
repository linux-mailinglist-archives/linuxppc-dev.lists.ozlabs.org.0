Return-Path: <linuxppc-dev+bounces-798-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACF8965CC2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2024 11:25:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WwCS23p1zz305P;
	Fri, 30 Aug 2024 19:25:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725009938;
	cv=none; b=XZe/e937VuV0zNdq1DQxnCYCdU7JIWdyxnCIB2aJIyA/UTaikVoW25g64jlIJwb9AT2yKQu2yOiL0TmYPvnNPEXPW4akCE0njTbNyFBum5DKyRLKz0tf+qZI310Z6DLmjYA+90GktSzfNYjj12pUOh/s/Rut69LNaJvs+MCTiC5oJ+RMPfLCtZy+MTWJW2E2egHPbbVIXuyhRttANwb2AwErepqAPlFVcWDP6LO++PeAWJ3ORKrgX5irmW40EKyzhzvHljk3n8KD9elyiGzXU2NHyY2Wnb72DmT7WQqc6msQf6lKULrldC23ToP3CB0CI1o/w/lR3A8hPJldUJWKdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725009938; c=relaxed/relaxed;
	bh=pe8zEsPZ4T/GtQI80Kbm/oiJhLogqxGuPTYULMG2NWQ=;
	h=Received:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:User-Agent; b=P05YcJEkxtg2geDiLC1OfTQHIRn6WbiOuPvdGGobnfaoutfAdoWZ/fDWD9Njuh8TnH410x77fTLoWEWWnd+Dkp38ohXZmBuUS33jT3YNTgwXOcOJDMXwu2bprYSVcEaDB0u18vhPK5Aol0Y+PodIiyuQLGO3eYy7qfFs8c1GbXa8Nyv2iuWGaxK4H2I2Cy79kwE87IPtHQEvuzdpYraHI7i7NUb+akn303inmnTb7PyhMjayud2Jzmf7An1PJNLJjvGf4uVgtAcvCgTp0UR4gSthegh/9DkrFRzIkmubW9NgHJRSp+CYYWRiLpVFzgQSQvWTMXxspwbBTeBriao8kw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=a8NjdEMu; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=a8NjdEMu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WwCS2238qz302K
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2024 19:25:38 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 15080A44516;
	Fri, 30 Aug 2024 09:25:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3F71C4CEC2;
	Fri, 30 Aug 2024 09:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725009935;
	bh=4b/zMYknwobEnyHKkZkbn67H7Flf1WVrIa0s9HJwUG0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a8NjdEMu5r+VI7StBduEi/6GUvhVsXznHU1xpzq2XbPyWMKXKQBHllqIkcB0UaMND
	 ihsmQx9HE+JAExU2+qdjxM386lLDqSOkew7A5iaI42P88/kS3EgtmsCgdIWn5ckkpx
	 giMV7lxDe+9KBdksZOHR58U6pXP8zUQTQkS3P8M+kbYK2gWg4wCGoGjlxqpPYZ2yHq
	 OQKM5G1waKsz4liaBqLFJTafS1OL8sVz75X2YfdDeZE8l6s3wENoMymiwW2yaPXmxi
	 6Lm3i6DC34S6aqreSv8X9hZ8vDo+hmlE7pJR0SJSU5TSguPNtjj1GzlQMioJzqBBxI
	 rNmEZ24BSvxYw==
Date: Fri, 30 Aug 2024 10:25:27 +0100
From: Will Deacon <will@kernel.org>
To: Joey Gouly <joey.gouly@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, nd@arm.com,
	akpm@linux-foundation.org, aneesh.kumar@kernel.org,
	aneesh.kumar@linux.ibm.com, anshuman.khandual@arm.com, bp@alien8.de,
	broonie@kernel.org, catalin.marinas@arm.com,
	christophe.leroy@csgroup.eu, dave.hansen@linux.intel.com,
	hpa@zytor.com, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org, maz@kernel.org, mingo@redhat.com,
	mpe@ellerman.id.au, naveen.n.rao@linux.ibm.com, npiggin@gmail.com,
	oliver.upton@linux.dev, shuah@kernel.org, skhan@linuxfoundation.org,
	szabolcs.nagy@arm.com, tglx@linutronix.de, x86@kernel.org,
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 08/30] KVM: arm64: make kvm_at() take an OP_AT_*
Message-ID: <20240830092527.GB7678@willie-the-truck>
References: <20240822151113.1479789-1-joey.gouly@arm.com>
 <20240822151113.1479789-9-joey.gouly@arm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822151113.1479789-9-joey.gouly@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Thu, Aug 22, 2024 at 04:10:51PM +0100, Joey Gouly wrote:
> To allow using newer instructions that current assemblers don't know about,
> replace the `at` instruction with the underlying SYS instruction.
> 
> Signed-off-by: Joey Gouly <joey.gouly@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Oliver Upton <oliver.upton@linux.dev>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Reviewed-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/include/asm/kvm_asm.h       | 3 ++-
>  arch/arm64/kvm/hyp/include/hyp/fault.h | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

> diff --git arch/arm64/include/asm/kvm_asm.h arch/arm64/include/asm/kvm_asm.h
> index 2181a11b9d92..38d7bfa3966a 100644
> --- arch/arm64/include/asm/kvm_asm.h
> +++ arch/arm64/include/asm/kvm_asm.h

FWIW (mainly for Marc): you seem to be missing the 'a/' and 'b/'
prefixes here, so my git would't accept the change when I tried to
apply locally for testing.

Will

