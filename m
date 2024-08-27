Return-Path: <linuxppc-dev+bounces-589-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A19960455
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2024 10:24:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtLDL3KZLz2xT8;
	Tue, 27 Aug 2024 18:24:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724747042;
	cv=none; b=n+Cxu7zJD8vH4IeNbxJzDtcbPKN13NAUKdRmsuZD7ip325RYuEDQViMN3sHfsvGQXVRpi+et4ioJKEVobg+Q1FfdTt2AR71CepvsMhIEZR2AJ4Rt7QXoDHI6G7vqQdicq14KVKVzDmr6UjB0LaKLoONQHLiNfkD+7E7ctESmfQlRGKivE6F/6mEd8rsqnDD0rA7kV+v5XrM/AKTTsfM1Sy/F0Ikm2NvGbeRmztps1HTb9RcNVGhXsWzubPXlcM92xbpUF4HOjBHVjpagkJ7vsWTRx65BaOOOsgJv13hB/xbruK7KMswFxwtSDOIMKO/JEaVOCdpwdBTJE5ZGNTlq9w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724747042; c=relaxed/relaxed;
	bh=WmuK606DFi2DMVMI66hSRWyNshgp94GdeNA0AaiDqDE=;
	h=Received:Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=KTDgQe3yRC2qUM9OnbF7pvO+YJDu3HDqvGOf6YdW67W3OwvScMiYrm5HHOzd5nW0Ub1++kk7cRXG0nhowVo1u6SCL5YiNYUySVowPO9RQi5YzWTyIXEuZ7MTBHiKq8dVjpG274o8zkdafMyBFLNJQk6bc/fz/Bmhixd97oyyDYTmGBlC7Tk/4pwJdScNg/Bg4bnYQ4IdHrA4NUDyDbBcyct7kb6jQNZNMLUdU/46uIYE+sUmXV7mweRKJLIdgna+A6GWOPMQkaRjBlSnmWuDv2q2BHarkEvGSmPz/sBN//AQ5qycZ4oM6w7qsiF3Mfg85jmXfv5PV2mSieWEhQeqKg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com; dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=eJrITo3p; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=srs0=xpq3=p2=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=eJrITo3p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=srs0=xpq3=p2=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WtLDL1ZZxz2xHW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 18:24:02 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3AE71A41674;
	Tue, 27 Aug 2024 08:23:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CB19C8B7A1;
	Tue, 27 Aug 2024 08:23:58 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="eJrITo3p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1724747037;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WmuK606DFi2DMVMI66hSRWyNshgp94GdeNA0AaiDqDE=;
	b=eJrITo3pS1iTlmVRqXA4ossHQBCcqlsHt8xrxE0R9KhNEW05nlyFHJ7Q5ejNuECbDi0JQL
	dyZtB2nZ/WNhieoOU8GA6Sh0CZEvlKXGqRVYQTGP9gO5q25pQSZWNFCM1tqp8r5qUzm5kj
	tdyLngda2WPJXrCNlqQ+6kee5gX21+s=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 865e0cd7 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Tue, 27 Aug 2024 08:23:57 +0000 (UTC)
Date: Tue, 27 Aug 2024 10:23:50 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Theodore Ts'o <tytso@mit.edu>, Arnd Bergmann <arnd@arndb.de>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH 2/4] random: vDSO: Don't use PAGE_SIZE and PAGE_MASK
Message-ID: <Zs2NFjfBKKjfoI2d@zx2c4.com>
References: <cover.1724743492.git.christophe.leroy@csgroup.eu>
 <b8f8fb6d1d10386c74f2d8826b737a74c60b76b2.1724743492.git.christophe.leroy@csgroup.eu>
 <Zs2FJku2hM2bp4ik@zx2c4.com>
 <55a7d3ba-b384-4fb0-8fbb-e05ddf0d1fb8@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <55a7d3ba-b384-4fb0-8fbb-e05ddf0d1fb8@csgroup.eu>

On Tue, Aug 27, 2024 at 10:16:18AM +0200, Christophe Leroy wrote:
> tglx or yourself suggested to put in a one of the vdso headers instead 
> of directly in getrandom.c. This is too fragile because PAGE_SIZE might 
> be absent in that header but arrive in getrandom.c through another header.

Oh jeeze, yea.

FYI, _PAGE_SIZE is defined on s390, so that might not be such a good
idea (from the previous version).

> The best would be to have an asm-generic definition of
> PAGE_SIZE and PAGE_MASK that all architectures use, but that's another
> level of work.

Yea that seems far too large of an operation to do here.

> > I'm really not a fan of making the code less idiomatic...
> 
> Ok, I have another idea, let's give it a try.

What's the other idea?

