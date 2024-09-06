Return-Path: <linuxppc-dev+bounces-1119-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E469596F3CE
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2024 13:57:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0ZRv41V8z3c58;
	Fri,  6 Sep 2024 21:55:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725623739;
	cv=none; b=klTk3pOHRYNkXFL7C5wygMujBM0fEI1rBACd01k8e9U2LcXIZbK8Zb4T92v+EVb0HdmytPCU9fBC2vTfi7NB3O+9Cx9l/Kd0cHFHXLSbqub35KyypCjD27OnmJ1FjN882ywLSqcBU4u3qPtlsSolbPY2BTq5StfGICd+ThgT1Ous8tS1XhXJk19a7SwBS1ChHo67qg7l+rz+zS2Wg2cFDys7+RW9FF6Tw7DUVT8bz0qVPxPkCl/HBvraZJGGqgwoxj2IbtRkU1XpntjSLSIlB2XU7b/yIZugxfy0VKbcq41jQIt/KdA3WltKScQT0whv06VI8jNDFMBKCw6YhXR/1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725623739; c=relaxed/relaxed;
	bh=xm9oPvSxnx+j2S8rfz1zspmYYZ7rHrYmPAfeZ7JS1tU=;
	h=DKIM-Signature:From:To:In-Reply-To:References:Subject:Message-Id:
	 Date:MIME-Version:Content-Type; b=Ox4rXOKh3N4U/LXb1pjiJdZudgL+8h5pD83w+97bYcKRt2k11hVnkb7K2n6AJP0WR3NXKBAMGx6JFIthLwnzH/EZ6gBRzzOGDLKIA6BH3RSjzgZBBObQ/oo/vSooZQuSoOmK7QIz4Hfqg55jdf4M4iXDiOPdAm8EGESi46CrCtLwD0g7GnsixU6uLB6TYyRJUMspEonMYWnMfHwFgCoDmqNfb8aFkveZPh0CN09wWixQ8zXHKPlhvRdT8dVvbwwvt865k9Y3BZ5fkVFU43IfWG1WwMKceYgWN+zUsngrG6WMprroF54kHKHHuqAPFtxtUfvZmibRq3LT89qOKDVmbw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=eINYVe7l; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=eINYVe7l;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0ZRv3qF5z30Np
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2024 21:55:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1725623736;
	bh=xm9oPvSxnx+j2S8rfz1zspmYYZ7rHrYmPAfeZ7JS1tU=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=eINYVe7lxAVXqZv7Ocea6HZyLAND5/Vj1+Ss2kupcQbwfeQfKUGvdO6KVZGZQTi4w
	 xlQo99Zn0W1ruXdYZJgLY8SiPrxilivQdlQ05RA16MO6VeHHl1tYG6lZtO05gNFSaO
	 sB9dOm5aHpx9wMTP2qsRqPogADJJYGfj9895HJr48eJ/fChDfFrsuVKh0CjRI2R2nq
	 69ArIWWoIE1lmsoPk1n+n9auHx5DlrtwA6XqJrQEzamUovU+ADslZuSwf/fGG4Wpp4
	 ENtXJGomD4oar3QOJf+54pKiVarpAcossBZnOYN5TggOa1zC5mmGABq4RygIzFv0sg
	 pbYlZp12f1oAQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X0ZRr2FRCz4xM4;
	Fri,  6 Sep 2024 21:55:36 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20240821080729.872034-1-mpe@ellerman.id.au>
References: <20240821080729.872034-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/64s/mm: Move __real_pte stubs into hash-4k.h
Message-Id: <172562357189.467568.16028658312206280756.b4-ty@ellerman.id.au>
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

On Wed, 21 Aug 2024 18:07:29 +1000, Michael Ellerman wrote:
> The stub versions of __real_pte() etc are only used with HPT & 4K pages,
> so move them into the hash-4k.h header.
> 
> 

Applied to powerpc/next.

[1/1] powerpc/64s/mm: Move __real_pte stubs into hash-4k.h
      https://git.kernel.org/powerpc/c/8ae4f16f7d7b59cca55aeca6db7c9636ffe7fbaa

cheers

