Return-Path: <linuxppc-dev+bounces-5195-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C43E2A0C4D7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 23:45:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YX6lr1vlRz3cfT;
	Tue, 14 Jan 2025 09:45:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736808312;
	cv=none; b=jq/XAGfAkG7kGFETG2Fd7HsZcPQvq7xloQoUiYhiG+ofaRnNhSAV4BZ2b0IpUU+wTBvCAOhZPwClnfCY5D9FOX1zZ2bzYQsl/JlOEiVdXARzrmvFbp9xQr86iI6ChQgpnNOMmg9dODi5jAb64484HE8DNOJ8B4YWD6KGuiKVWeoSEyIDxDoDjHawzNLn7r8ZRhycdPcH7ozpfROY1qIipg7PWkdP8gAzhaUWxFZKMCVMOLmXdBYAuWUsY6/eIhKcd1ZwDKRv3nkVZaw8XY2JSjBW8Pv1INQPTk55CGN5ov3OFpnFWcVAJW0MAHxJRHLhE3d2wvHADaoIYi1LHCE5gg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736808312; c=relaxed/relaxed;
	bh=nTv2S6Ho22BLZr8e2UULZKyPl1nsZe5fyAlCeL7Kl0c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Y7ScykZ1CibmDsgf/qjRhTsqpEFv//ICjLSTkTNbGp5XcHYKqoD0cvxjpfFYRVgXogH+Qv/kQITFp8VgY2dR2NwMumjJJSqQbNR0bNKjGPX32+1ykgoQMtAUXq6Qyf9hdnAFrzC1/ZImNUzopnRZTCU8I+lINwY5d1L7aAe54+B1e00vGaWV2I5PEHcM5PDkZb0cP9b2eh2Z2UuzgTsqW96e3dEMC6CR5K7vOqNmSvh6ydyipC0O8T/wXXpGECy8Ch2WaEZ4GjIrHSM3RXmFxzplV0WCoe2aRXdUXU7IPZXv170wINve8q7TX8O1VoW4oK629gF7njlPgkeqjQIJoQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=TFJT95py; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=TFJT95py;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YX6lp0sDtz305G
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2025 09:45:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1736808299;
	bh=nTv2S6Ho22BLZr8e2UULZKyPl1nsZe5fyAlCeL7Kl0c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=TFJT95py3vVqhlxJ1aMaAUEJJOkzSU4N3zmsiiT8TW6rNvS0aktZV4Guw9vrWXOfg
	 R6AV02OyNWubNWn7+YA26QKk4Fj2HeiowdeXKDQmgLR9Uxfyz3DtSLKhz1LJEQwS3n
	 sV9NZRwUvEUlbr8CHrRHAD/jNYPYdmHTsV821l97NE5A7M68l7dl4KsvqfJlJhTQjD
	 6nNva+Q1olHyu3Jl+6weVbbtMsXtKxb+N+X1mgXrPu7Tz9VoolOhtBQQsX/Q+vI9z7
	 6Ytj0c4roEo7e8jZvEh6RuYl8pqis4Rc0Bfet+NHyNgeKzGost88yZTZ1IIWRlewRf
	 k3v+VerdHliWg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YX6lb2KZtz4wvg;
	Tue, 14 Jan 2025 09:44:59 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Nicholas Piggin <npiggin@gmail.com>, Naveen
 N Rao <naveen@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>,
 Paolo Bonzini <pbonzini@redhat.com>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MAINTAINERS: powerpc: Update my status
In-Reply-To: <20250113072037.55aff81a@canb.auug.org.au>
References: <8734hqkyrx.fsf@mpe.ellerman.id.au>
 <20250113072037.55aff81a@canb.auug.org.au>
Date: Tue, 14 Jan 2025 09:45:04 +1100
Message-ID: <87v7uipc3z.fsf@mpe.ellerman.id.au>
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
Content-Type: text/plain
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:
> Hi Michael,
>
> On Sat, 11 Jan 2025 10:57:38 +1100 Michael Ellerman <mpe@ellerman.id.au> wrote:
>>
>> Maddy is taking over the day-to-day maintenance of powerpc. I will still
>> be around to help, and as a backup.
>> 
>> Re-order the main POWERPC list to put Maddy first to reflect that.
>> 
>> KVM/powerpc patches will be handled by Maddy via the powerpc tree with
>> review from Nick, so replace myself with Maddy there.
>
> I have added Maddy as a contact on the powerpc and powerpc-fixes tree
> in linux-next and replaced you with Maddy for the kvm-ppc tree.  Are
> there any other changes needed?

Ah thanks sfr, I forgot about that. I think that's all that's needed for
now.

cheers

