Return-Path: <linuxppc-dev+bounces-7807-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A82ABA9410A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Apr 2025 04:41:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZfbV91Cqkz3cDg;
	Sat, 19 Apr 2025 12:41:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=144.6.53.87
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745030465;
	cv=none; b=Q5E0FhM5dL2F5KEPkTN/P4mpxcjth+IEItnNrYNYu6HrG0kjOhfUqWGpi6OlMa9zsREDMo8Dr8hZTowlA0MboJM1ty1EQz9jRXaYFbYH34Vl88kKT1FVYRvi9M/OxVaFB38dsuLeujgP+pYPYBakjIy3VnM6IPWsJ6dA+utrvWZpUWeQeDJR9GzvpFvLhCBJora0IfodEZQo1IaGBy8jPGlsr1fvD4yImr7rYrswCswdpgw+OxOtvwrBUtON+T8PrAtL15M+RCEUvuwN8kSvTTOkCwynd/SWWGOyPOeyyWBkBWq9u7wz4JRdvVkh5j0IUSQyBeVHSAbDPCT+5s72DA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745030465; c=relaxed/relaxed;
	bh=N71ulJFC7EzRy4IJC7JSkf+9aBSGBV5BXmKIuPUJx7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AIYbR5Pnnf5M7j5xe46UnFRSo1eIhFzip292Z0mYK0039RxSkFXdXE6KYpf1jWx1hUQRlXxAdq4U4vKdwoyJSGw3DM/xXFS1Nf8OEXj4J0c4ENO9nkJofz29BS03rU9kL48eUlv/7OdGUy6ItlVOo/hKQRll1vtz8BVNiGDu8CYxPVmZQTiDDM1oqLG/vjfo1GmP/I/kkrsleak5Sk9qPfbY65YKfDG9efeNZQuTdYNhKBhWnFNTtI2W1jPk51fU0mBfnfpw3WmBQHkYoGvaAi+Ny4B/CUn2hE4LUOXAHu8l4UXal4CQjdljmkI7yN45IZBLUm2WtijcaI36mHvzIw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=rmQd0n5F; dkim-atps=neutral; spf=pass (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=rmQd0n5F;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org)
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZfbV53rTnz3bpS
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Apr 2025 12:41:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=N71ulJFC7EzRy4IJC7JSkf+9aBSGBV5BXmKIuPUJx7U=; b=rmQd0n5Ffd7wgXc5CRfMsYvfej
	vy0M0uiUROHxK3PxU1ELCUZ55bqRS7IKOzdkIx2x/h3kf6i7ueq2uF2iXk+esRyER676Vn8nn6HPl
	/EUIRrt1qKRpgU7dPHA+0/rAdhZq8SqQqgwdPs18fXqmj5Vc6DfqBTMqCH2VeKeOqjtpsk1uVQdTB
	7C97E7AWZ+VRMuouNeTm66I/v/5mhb++Kjp8acKAz23ZX1T1sTBZddTZjuWyEHiOyEpxbSEZiqzYd
	8FLG2KSwbrYBgiH88lXTv2vFiWUXkF2HqN7hW+YAXzbLMgU3rYK+eiYH+SBvpg8M1ru6r24TM8ix6
	GC1QefCQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u5y8W-00Gtuw-1E;
	Sat, 19 Apr 2025 10:40:57 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 19 Apr 2025 10:40:56 +0800
Date: Sat, 19 Apr 2025 10:40:56 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
	x86@kernel.org, Jason@zx2c4.com, ardb@kernel.org
Subject: Re: [PATCH 01/15] crypto: arm - remove CRYPTO dependency of library
 functions
Message-ID: <aAMNOJa-xcxLrmgX@gondor.apana.org.au>
References: <20250417182623.67808-2-ebiggers@kernel.org>
 <aAHDIRlSNLsYYZmW@gondor.apana.org.au>
 <20250418033236.GB38960@quark.localdomain>
 <aAHJRszwcQ4UyQ2e@gondor.apana.org.au>
 <20250418040931.GD38960@quark.localdomain>
 <aAIMhLD3UMM41JkT@gondor.apana.org.au>
 <20250418150149.GB1890@quark.localdomain>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418150149.GB1890@quark.localdomain>
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Apr 18, 2025 at 08:01:49AM -0700, Eric Biggers wrote:
>
> Doing it as a follow-up when this series hasn't been merged yet would be kind of
> silly, since it would undo a lot of this series.  I'll just send out a v2 of
> this series.

OK that's fine too of course.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

