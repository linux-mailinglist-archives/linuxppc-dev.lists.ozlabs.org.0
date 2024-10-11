Return-Path: <linuxppc-dev+bounces-2135-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A0D99AF88
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Oct 2024 01:46:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XQNYh6461z3c3W;
	Sat, 12 Oct 2024 10:46:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:7c80:54:3::133"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728690376;
	cv=none; b=Nhfj5RTK4ZqPhhAWy8qTyATHqIvMi0g6NrPMOIzewJmAUrWoz77otV1YdoZ04MSdgiTgq3x+u2oM1CaKfGJGSQAm+LnTnMOeh612fr9WipaUSHxyr1RjYWEg7xIkOESnLLCY0KOBIAGSqIl3FqE9DrIgdUl8KPuT4D65L6RtyFIb7vwLIzJjQy4BsfvFGkAT3Pm9AmyM1dt66SL8PJoGOU5+L/f7FPkERu1/PB3AvkHbLY4691PbcY5gZue5eFzKcbQ3rCjVcwCO4S1/+sSSvkxpPzzL/A/ghofcuXGSuYzJtYM/y4pGbek+jKiG/1azHqptwSL5ieZVjWSzKtqjEw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728690376; c=relaxed/relaxed;
	bh=+bkr9LORWRx0O7dGlBaGEyKOrPTlNXCc6U0HgL4an08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KCbo2jtgHhrMUOIXJ5dhkFPLtf73bh/QzS4AbiJ9LDHCoxz+rRRHwdTU3pOMegTkEeVw0Wit/D5ns30gLtzkJw775XD7BviUEWyCxEFXF/qDf5IwFNijp3QjbiRH+O+R+sIhyScm5k7msBOVT3yXD6hXxIW2bOXMDmSnY1lBP6PpazN5gCLUHF8eHUJcYtqQq6FmRkLqfPntlCQ4xwwQwMuH0o1s+XNh3rA0JYJ2TbAcmdXn01P7sBzDZN82dEdDDbShqWJFP5416vkqD5Qjqy/l5LDs/btSwrkvve4tPI5O1sFaD5OyfWhUXOk4418wPe/T0urfj0lAc37elZ1K/A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4HK9HCuW; dkim-atps=neutral; spf=none (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=mcgrof@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4HK9HCuW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=mcgrof@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XQNYh0LJwz3c30
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Oct 2024 10:46:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+bkr9LORWRx0O7dGlBaGEyKOrPTlNXCc6U0HgL4an08=; b=4HK9HCuWKP6MdEO6ryZMn88miZ
	EYOw/m2Fqgbn9N79t+rMb9j+QxnOL8ofNLufXsrPwR1ofvX8u5dTs8tBAYRi5ynQtmhSNMlR8P1pO
	wNldDHPYRMV06ZHnGI0Ack9ipfb57khEd+KK7YtJ7RsBanGMYp8HxZAfUFcahL+MO+Z3ZJgMl+/uU
	gCHoBUxX6bKS/okAD52BR5so3L1alT99vRxpFa64DerntZVJiqNinNxK+5EINhl5qyDCblb1Sc3Pg
	FK/W1NUqiEA76uYmJ7ik3ybWMUQQlrqutXFfRQwoS4ju6kQkC9/9f8K19WnIR7TTfzH/u1vWUeF4m
	wZJT/fAg==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1szPKh-00000000Elc-0TUG;
	Fri, 11 Oct 2024 23:46:07 +0000
Date: Fri, 11 Oct 2024 16:46:07 -0700
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
Message-ID: <Zwm4v_1wh5RwuHxF@bombadil.infradead.org>
References: <20240925233854.90072-1-mmaurer@google.com>
 <20240925233854.90072-15-mmaurer@google.com>
 <ZwmlEYdS0aPVF32k@bombadil.infradead.org>
 <CAGSQo01o4fWYwSzZHX5dyTUKcaCSZ7z-hPQ8w63tgBPGbM_UCA@mail.gmail.com>
 <ZwmnnMmqVWLaelvQ@bombadil.infradead.org>
 <Zwm4lXdKB9RfPQ5M@bombadil.infradead.org>
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
In-Reply-To: <Zwm4lXdKB9RfPQ5M@bombadil.infradead.org>
Sender: Luis Chamberlain <mcgrof@infradead.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_NONE autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Oct 11, 2024 at 04:45:25PM -0700, Luis Chamberlain wrote:
> 
> Also, just as I asked Sami, coould you split this up into patch sets?
> One with all the cleanups and elf validation code shifts. And then the
> other code. That will let me pick up quickly the first patch set.

Oh and if you can think of ways to enhance our test covereage on all
this as I noted to Sami, it would be greatly appreciated.

  Luis

