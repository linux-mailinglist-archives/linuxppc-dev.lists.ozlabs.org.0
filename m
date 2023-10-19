Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 375267CEECE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Oct 2023 06:49:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=nrG9hfkG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S9wHH0kV6z3cM4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Oct 2023 15:49:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=nrG9hfkG;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S9wGT221Tz2xdY
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Oct 2023 15:48:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1697690929;
	bh=HSBVb0/6PKzVd/BXIi0nFqaJ/m0nLqwjF6CLo8nWfJQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=nrG9hfkGjdJ8PvVVCnQKQ+Qfmxsr4+knCkz3c05OZTbzy9MYDUfvYgATbRUl2cNg6
	 ZvWMBYpsXDzLQ62vsYjy0z3Bb1kAEbaSB9w/46q/y+qXE88YVE8604Py5oaZhu1/Ot
	 puJ8sTEUN6oRljLbxy7AYwf9IPYCG9IAGspWIeCVxFZBgQ9yCJZ0ysodf8wQm2j7QZ
	 Sna8LOFq0HXyH4Nx+toSPZ7Nw03a115OBsAqBBGIO4itk+6pmSlDfRvrivuVkBrfrR
	 klJK3MBlRM1jH6p2BHaO0A/Te2JDtz44iKdaklLMKGlY9Ds+Ixa0lg+udnzeqRchix
	 L3zcp2f1Uj9bg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4S9wGS5XSkz4x80;
	Thu, 19 Oct 2023 15:48:48 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 4/6] powerpc/smp: Disable MC domain for shared processor
In-Reply-To: <20231018163751.2423181-5-srikar@linux.vnet.ibm.com>
References: <20231018163751.2423181-1-srikar@linux.vnet.ibm.com>
 <20231018163751.2423181-5-srikar@linux.vnet.ibm.com>
Date: Thu, 19 Oct 2023 15:48:48 +1100
Message-ID: <87pm1b5ia7.fsf@mail.lhotse>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Valentin Schneider <vschneid@redhat.com>, Srikar Dronamraju <srikar@linux.vnet.ibm.com>, Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, Rohan McLure <rmclure@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Josh Poimboeuf <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
> Like L2-cache info, coregroup information which is used to determine MC
> sched domains is only present on dedicated LPARs. i.e PowerVM doesn't
> export coregroup information for shared processor LPARs. Hence disable
> creating MC domains on shared LPAR Systems.
>
> Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> ---
>  arch/powerpc/kernel/smp.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> index 498c2d51fc20..29da9262cb17 100644
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -1046,6 +1046,10 @@ static struct cpumask *cpu_coregroup_mask(int cpu)
>  
>  static bool has_coregroup_support(void)
>  {
> +	/* Coregroup identification not available on shared systems */
> +	if (is_shared_processor())
> +		return 0;

That will catch guests running under KVM too right? Do we want that?

>  	return coregroup_enabled;

What does coregroup_enabled mean now?

I'd rather this was actually checking the presence of something, rather
than just hard coding that shared processor means no coregroup support.

cheers
