Return-Path: <linuxppc-dev+bounces-1117-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 128C596F3CB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2024 13:57:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0ZRt05p5z3bkT;
	Fri,  6 Sep 2024 21:55:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725623737;
	cv=none; b=Aw7kbYz7s1Udh8QdCCQyU+0/SrL4TqSsmjPXLa9hwBsHxqP3T6LuDZ/Iq05KC5KKssjrXEdUdXmtVQ+SLA26johHfU4/XMOUCPOEsF5n/IKeG0jlmbw8DfxSEpDAPsFpjoig2Qo7ACrepudWGZhhJzPOI1hMJ/L6n0ChoRgR3CRQKpqJcZ4If8oJv9zQEnnN7JpbnVQs5lmmi9zUBdKejWAoahIRHbqOpd1tLOUmmU9GFSH1NXX6fP5TuFhngk9H9FzfFlWJb0L3nyrBwhHXuoBJGoW5CFXBBbd8UoRC1935z+WCdpeUUkaqepbpAFCr+5vAfAyshR5XptKvPVbvNg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725623737; c=relaxed/relaxed;
	bh=XCOV6R4Lc8pODzw7F70rIOwE/VaFBPys2s2ehe4n3RA=;
	h=DKIM-Signature:From:To:In-Reply-To:References:Subject:Message-Id:
	 Date:MIME-Version:Content-Type; b=CL6Erh/Eob1si0881yT+xHtOZSbqt7RIUSsbowpVMUNTsK1tyKRMK5hb8y4ZuGkcJWWWkk36kxF6zPfcLt4LehScSSzqbB/2dM47iXqvV/L2Mzw0Dc+JPnypnTqAKScHKKvrAL1y7ad5PvByhW4CYmPCUnsE0NgvHgV3HODV3U5pnGras+9Yv8PX8z/HZ/9C92VNJG6uDEoaqM+/RKWbs4HTz1+2tHwh5mqZ5ZkszZj+O8Pc2F1SvH9mDOaIprEuol7x51lNzHxF8PFs6J0V3zD/bShiTRUShYoq5VyPcx0+pTZSF0CLyTDi4zvjWypKcji6XtBEXmgTtc3wPi+vjQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=UEeRdjut; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=UEeRdjut;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0ZRs73Vwz30Np
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2024 21:55:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1725623737;
	bh=XCOV6R4Lc8pODzw7F70rIOwE/VaFBPys2s2ehe4n3RA=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=UEeRdjutnis8CEymfD+PqNU6d/NpQ/JMHHOjHsxW+N2xKEwu91ih8lOyzIlZcrViz
	 Ykid7lGVNCN46bp91hO84ak/2WUnMM65Z87RFa9IyZYELuptC9T0Dt8m2e0Z+/i8/d
	 bvAnhDMIJFnWqmG8QOCEfQ4NVQajTiiITDrGlnPzsERhpUSJO/ogHu7ZAq4MIDLyUT
	 RiE+Sb4m0pmQ51/Rzq3MpAHsODJEtGU1/V/OqoF6wGMbwuFdMYhp1fgtYNPClW76QT
	 eA3RkgVUNo7Ccom/y6xYWYTpYTubUPik2cbePDCmPF39/OZ5A1drErFdrgAQTgksSZ
	 +8NQ+XCvKAsxQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X0ZRs61njz4xPc;
	Fri,  6 Sep 2024 21:55:37 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20240903111951.141376-1-mpe@ellerman.id.au>
References: <20240903111951.141376-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc: Stop using no_llseek
Message-Id: <172562357219.467568.206380891394643682.b4-ty@ellerman.id.au>
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

On Tue, 03 Sep 2024 21:19:51 +1000, Michael Ellerman wrote:
> Since commit 868941b14441 ("fs: remove no_llseek"), no_llseek() is
> simply defined to be NULL, and a NULL llseek means seeking is
> unsupported.
> 
> So for statically defined file_operations, such as all these, there's no
> need or benefit to set llseek = no_llseek.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: Stop using no_llseek
      https://git.kernel.org/powerpc/c/5b4bc44a4854ccd41eef9aa9f47677f7d136c294

cheers

