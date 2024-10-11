Return-Path: <linuxppc-dev+bounces-2134-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BE099AF87
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Oct 2024 01:45:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XQNYD3VqFz2yNG;
	Sat, 12 Oct 2024 10:45:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:7c80:54:3::133"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728690352;
	cv=none; b=mveNg19Cm2aqjL4dtWvLwOeCgl1ayXhHBmUWA9kXrbHuIAEtVJhbb+c3+CLjMVXY2P26mlRZwp5ZHmEhdv+8WUpYLUJ/1t2uyJ/WKquLT2nz94VHbIE4y6JL763v/GsoyjBVnpqpd/JIP5uIUI5Nbmqwv9z3mbznXp97SNpf2HZMfOaXW46PXDYvKxg5D+2cMBqXzmMBykfnVxvGJquOe+W3+wHQPuYEkLvLp9r6dVfOvLd4Dzwrur+PUWqa7AFhemxabfIrzJoxEygaHpVqL87ruwU3uLy1hnvA6mTLpGBcFxamhZfyr3vH7+4tCXzKN4qIFuHGmGpVg1xb7LRPCA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728690352; c=relaxed/relaxed;
	bh=QJk/ha5iYQcTaJTFnJbtmxla+gEA09c4J1vJloM00VQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IbInQjH32btPNfoGP+Vwaxlbye36tHz9rHHx2pFZfN8XhryWDes9dKriyh9nP3Pvm6ZYF6R65njNIuz3rwbWOu437K4J6iBG0FsZxccXCdqkXiG7zeX9+6BSJBbeuZG7hl1wpWAstWLwUHUyC7ChZrFffOQ5NS+hNxm6TGFr2oWawFJHIGGFv4ZEQR62bYsRrjp6XBY0vRZkiv+IhlrW7RSgeQRBGehP33P867PwSQSkHsMdM0gDbLZ3x2ErebvHSlOkoaStkqtSBAFZiIjfHyMSqNXyY1OrIIQ8YousjXXbrTtgl4UkSqZn5ycfioZvsmfOmzMGYKuYpPjF/JIRug==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aJh2gP+2; dkim-atps=neutral; spf=none (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=mcgrof@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aJh2gP+2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=mcgrof@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XQNY81Bx6z2yMv
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Oct 2024 10:45:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=QJk/ha5iYQcTaJTFnJbtmxla+gEA09c4J1vJloM00VQ=; b=aJh2gP+2rAM0r5tcjBOCtc4ZJ4
	uEYVqFW7oi3Dsmfh6+nUwQrMO6h/FnEId0G20POgML4PVX3sLj9ymgvU933OtSixbXDQUnOiU8Lnp
	bYoDaWIypuEM3J9vCOGv2Jj81nBlQrjZm2zYrzM8k5Cp/UHiJtOWjICD5HZxuq3QBpU/1Bm3JdmL/
	U9Im9Tybsh7SEU/z9bS5J/atfsDU0c7xO1JwSUYfIava/esJTQ461O2XU5/1gTvZ0y32V5Ry7SRhu
	G6OpvnTdd1cTdqtlgbpc4zkuwfw1n2VGdpjgI2sL15m5pGK15LNPZYWSZQ82T4JKYq3Gw0CjCxD2f
	mWgQlE9w==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1szPK1-00000000EfT-0YiM;
	Fri, 11 Oct 2024 23:45:25 +0000
Date: Fri, 11 Oct 2024 16:45:25 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Matthew Maurer <mmaurer@google.com>
Cc: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org,
	gary@garyguo.net, Michael Ellerman <mpe@ellerman.id.au>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Benjamin Gray <bgray@linux.ibm.com>,
	Naveen N Rao <naveen@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	neal@gompa.dev, marcan@marcan.st, j@jannau.net,
	asahi@lists.linux.dev, linux-modules@vger.kernel.org,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v5 14/16] modules: Support extended MODVERSIONS info
Message-ID: <Zwm4lXdKB9RfPQ5M@bombadil.infradead.org>
References: <20240925233854.90072-1-mmaurer@google.com>
 <20240925233854.90072-15-mmaurer@google.com>
 <ZwmlEYdS0aPVF32k@bombadil.infradead.org>
 <CAGSQo01o4fWYwSzZHX5dyTUKcaCSZ7z-hPQ8w63tgBPGbM_UCA@mail.gmail.com>
 <ZwmnnMmqVWLaelvQ@bombadil.infradead.org>
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
In-Reply-To: <ZwmnnMmqVWLaelvQ@bombadil.infradead.org>
Sender: Luis Chamberlain <mcgrof@infradead.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_NONE autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


Also, just as I asked Sami, coould you split this up into patch sets?
One with all the cleanups and elf validation code shifts. And then the
other code. That will let me pick up quickly the first patch set.

  Luis

