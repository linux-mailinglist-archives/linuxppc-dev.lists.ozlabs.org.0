Return-Path: <linuxppc-dev+bounces-1164-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DB6970E04
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Sep 2024 08:40:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X2HKC3ctNz2yLV;
	Mon,  9 Sep 2024 16:40:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725864047;
	cv=none; b=ZGxhbzhmZ436dwKNCC6uUrVbBdyKCadWDD8piVGe+9XBn416zdCx3HRwjciMe0nqcYjS50zTLb8qakgItDHBVSKdBWdzAwajMEyitqbj1v1uH6punAu31/ZBSIWmUueZDFu5FMFrzkfwc83bzaxrJKZvXTlqoA8GT9z6xQBdWb5kemivPpeSixn7ReFBXIYExuvbhPw9HJ2yNMRGBKWJWgRvHzfxgW8kZA9PXAXutWa75bbG/60RJpUSDplsebKtw+jaBNDW2YHqkxKNOrs26tX3WNx7b4Yink146tbLQmNR/n7U4gVuDGf7E+ipfyRC2BWjAjEjSEWeMdr3fe7d4A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725864047; c=relaxed/relaxed;
	bh=54hk2p1maVgXQGJ3OCTm/U8cy6tgPAEmLuVVz391iHU=;
	h=DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:Date:
	 Message-ID:MIME-Version:Content-Type; b=hFyaGeEca52utMbiYez3X9M5vwtZfwP/6B8SFKV2p+cK9fZFUBRhD6PHAQJTb1P9IgR5olukR3+QrwMvx5UYUUUhRfLOM1hYDK+NPUPV3UP0DD4Ji2HOCrUQEjOhZfM4uPBCjNbL1aEExZ0fP0wKX975m13BdI9Gbk/iN1wSeFjsUOvfjzo/zuUUnDBxJu4nyfALMijbTTRQFF8PBcgLAjg7X7VoSv1LbkxU9ICDYq6eTR8Yh2BESTN9QmIkIqc9stW1oPRZSzNYvTg3rdx13ayJG7irpydw6RsRN3kmy+JBu0oqHP7P2M0KaHpDJDlrlCJwXXF0L8lfRWKYj9jsfw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=nVviHyVz; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=nVviHyVz;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X2HKC3Strz2yLP
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Sep 2024 16:40:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1725864041;
	bh=54hk2p1maVgXQGJ3OCTm/U8cy6tgPAEmLuVVz391iHU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=nVviHyVzOyVlcqiWLb3rMH2A3l1O6yWQ2EVNz2VEuO+gROFJSG1/r2Jl/AsEYi5OS
	 i2BlJvetLug6p0fnUHcWF3M/8RD0tl4TaBPUIFZTQegTVqe2f8V+OwqSyJcDFRxpCu
	 PGYj0zANfKph1R3WT0qloWqM9iqTHqXd3nbSLgCl2MVSYChxR+M+mRyCEDHUE5rwRQ
	 DbpJ7YJBPKr7ayyiodxjDeJ0Dzv5RXB4+hjHf6T2CUjdCGIv8yIUGaTHyB6aK7OTgs
	 vMWqvQ4uyrIcC3DfPM1iAIbna5ixSY/6XlV3y9F4t+NArrsLPA5l2acZApxA0xB0Ca
	 +woBzfoTxo4tg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X2HK55bS3z4w2F;
	Mon,  9 Sep 2024 16:40:41 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Masami Hiramatsu <mhiramat@kernel.org>, Michael Ellerman
 <patch-notifications@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org, Abhishek Dubey <adubey@linux.ibm.com>,
 naveen@kernel.org, hbathini@linux.ibm.com, npiggin@gmail.com,
 mhiramat@kernel.org, bpf@vger.kernel.org
Subject: Re: [PATCH v4 RESEND] powerpc: Replace kretprobe code with rethook
 on powerpc
In-Reply-To: <20240908221053.ad2ed73bf42db9273aac419c@kernel.org>
References: <20240830113131.7597-1-adubey@linux.ibm.com>
 <172562357215.467568.2172858907419105155.b4-ty@ellerman.id.au>
 <20240908221053.ad2ed73bf42db9273aac419c@kernel.org>
Date: Mon, 09 Sep 2024 16:40:41 +1000
Message-ID: <87bk0x49ee.fsf@mail.lhotse>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain

Masami Hiramatsu (Google) <mhiramat@kernel.org> writes:
> On Fri, 06 Sep 2024 21:52:52 +1000
> Michael Ellerman <patch-notifications@ellerman.id.au> wrote:
>
>> On Fri, 30 Aug 2024 07:31:31 -0400, Abhishek Dubey wrote:
>> > This is an adaptation of commit f3a112c0c40d ("x86,rethook,kprobes:
>> > Replace kretprobe with rethook on x86") to powerpc.
>> > 
>> > Rethook follows the existing kretprobe implementation, but separates
>> > it from kprobes so that it can be used by fprobe (ftrace-based
>> > function entry/exit probes). As such, this patch also enables fprobe
>> > to work on powerpc. The only other change compared to the existing
>> > kretprobe implementation is doing the return address fixup in
>> > arch_rethook_fixup_return().
>> > 
>> > [...]
>> 
>> Applied to powerpc/next.
>> 
>> [1/1] powerpc: Replace kretprobe code with rethook on powerpc
>>       https://git.kernel.org/powerpc/c/19f1bc3fb55452739dd3d56cfd06c29ecdbe3e9f
>
> Thanks, and sorry for late reply, but I don't have any objection.

Thanks. No worries. 

cheers

