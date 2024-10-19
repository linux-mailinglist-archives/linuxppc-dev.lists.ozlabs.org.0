Return-Path: <linuxppc-dev+bounces-2421-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3DA9A50CD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Oct 2024 22:45:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XWD9c3686z2xRm;
	Sun, 20 Oct 2024 07:45:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729370740;
	cv=none; b=Pe8d4xiRZqJ9DgM1oc7YXzKyhwyO+khzlu1vYpUGwEYT2hxWyeLx5VWbjqoa50qtRt2RWDVKe/W/LLEInlqZ+LTxtbT/iH0QbsfccvbpVooKdFgZP/A5lWXzM0zXmGCFWgNGlZ3d4/u9FDqEkjobAR2GDWER7BrOTCisC3QJXdjIMfok+ls0ZxzwyXYytV1qEEwGu1wnGVc78zFIXzUtLg/lTp0mht2QRTsJrHYca3SEBBF6yMqzVrL6GiLYCUBXmGfjQDNnd58dgkgsY7zz4GwxNiezkVXB/zfWbYy8sIK+/LP4DN7il/KjOtKf5nWM6bFItrB5oUxAOuqqWCHCtg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729370740; c=relaxed/relaxed;
	bh=ZC4gP/UPw2ubiHb0IvPbS/oEtoet/unyQZvm0Ol/hcc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U1LsLgS16U7431OATMMgxir3pkkh3VmXq5BOstRKGuS/0adUHNTSAVqqLhBawpF5RDp3qiJkMeeWTzDrf6U1J3HimAwaTwish4GwfIWADmL2JI103DP+1yPJa4Mzeh4ipb43ECB3+bdhX+D7gO+8vaEpjCzHT5a8G7AoNGmmscALSPWyRc2aee8QpW6Lh4i1H4NAt7Z8aQMzkFr1yhejZStXOC0N+GP7FK2uvTDXQvveocn5tIt2X4JOnqt6pRKXMExW37B84U5Uf4VdRWH2StZTc7QDAXJQ6kegVlKsGo13O2R151nfxXqFHaJYDnYh3yWa5WrG6or82JeYO1S7Ww==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gUrB6OvU; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=mcgrof@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gUrB6OvU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=mcgrof@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XWD9Z5mtXz2xMQ
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Oct 2024 07:45:38 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 52FA1A402D9;
	Sat, 19 Oct 2024 20:45:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3166CC4CEC5;
	Sat, 19 Oct 2024 20:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729370735;
	bh=gmwDQ6No3ct9TKBBHTtT4Yw2AFEeVWE9FZaRD6OcRhU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gUrB6OvUzAE3AfRej4jnJKDKbxYWz+cZRF2tn/UZIEQYCHBDOXpBVYbDfJraR7l8n
	 gQHPGSDOLU6fVoOcnonflRVT6kmlZLGBMcBzFjGdoU/5eToXxY3a2X6/CoWL8Y6Blw
	 vKtGYWIsOvdhlXC92kFcqafZsLC9tpLm7bpbk3P2Skg4OChT+D7E4n3UBt7xZTHfsB
	 ThVIQ4MslwI+4PFogaRVcMfc7eHKw/pCuD9frmWslk5PHbQLkDb3S+jXyJ1ktn0C0+
	 mYdgaWvRjSyREVgG2REjeZMLJkqmzh0Pzohff1f2PBtHLM/G7NDMxg99n+rxReWrI4
	 CLsyhOwQepJiQ==
Date: Sat, 19 Oct 2024 13:45:32 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Helge Deller <deller@gmx.de>
Cc: Matthew Maurer <mmaurer@google.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>, masahiroy@kernel.org,
	ndesaulniers@google.com, ojeda@kernel.org, gary@garyguo.net,
	Michael Ellerman <mpe@ellerman.id.au>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Benjamin Gray <bgray@linux.ibm.com>,
	Naveen N Rao <naveen@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	neal@gompa.dev, marcan@marcan.st, j@jannau.net,
	asahi@lists.linux.dev, linux-modules@vger.kernel.org,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v5 14/16] modules: Support extended MODVERSIONS info
Message-ID: <ZxQabNukxBo3utbh@bombadil.infradead.org>
References: <20240925233854.90072-1-mmaurer@google.com>
 <20240925233854.90072-15-mmaurer@google.com>
 <ZwmlEYdS0aPVF32k@bombadil.infradead.org>
 <CAGSQo01o4fWYwSzZHX5dyTUKcaCSZ7z-hPQ8w63tgBPGbM_UCA@mail.gmail.com>
 <ZwmnnMmqVWLaelvQ@bombadil.infradead.org>
 <Zwm4lXdKB9RfPQ5M@bombadil.infradead.org>
 <Zwm4v_1wh5RwuHxF@bombadil.infradead.org>
 <CAGSQo03df-tnmwcz4nh3qtuQPKQ2zLHW0juQyKUXGsdeS7QkLA@mail.gmail.com>
 <ZxBKkJu-XPOGs-NG@bombadil.infradead.org>
 <9f3f6bd9-47d1-45fa-aa6b-9e0a80a5ebc6@gmx.de>
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
In-Reply-To: <9f3f6bd9-47d1-45fa-aa6b-9e0a80a5ebc6@gmx.de>
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Oct 17, 2024 at 02:08:19PM +0200, Helge Deller wrote:
> Hi Luis,
> 
> On 10/17/24 01:21, Luis Chamberlain wrote:
> > That sounds great. Yeah, the above would be great to test. A while ago
> > I wrote a new modules selftests in order to test possible improvements
> > on find_symbol() but I also did this due to push the limits of the
> > numbers of symbols we could support. I wrote all this to also test the
> > possible 64-bit alignment benefits of __ksymtab_ sections on
> > architectures without CONFIG_HAVE_ARCH_PREL32_RELOCATIONS (e.g. ppc64,
> > ppc64le, parisc, s390x,...). [....]
> > 
> > I forget what we concluded on Helge Deller's alignement patches, I think
> > there was an idea on how to address the alignment through other means.
> > 
> > [0] https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git/log/?h=20241016-modules-symtab
> 
> I stumbled upon the unaligned-memory-access.rst document [1].
> Please read it, as it is a really good document, and the section
> "Why unaligned access is bad" states:
> It should be obvious from the above that if your code causes unaligned
> memory accesses to happen, your code will not work correctly on certain
> platforms and will cause performance problems on others.
> 
> With this in mind, you really should apply both of my alignment
> patches which you currently carry in [0].
> 
> For parisc I partly solved the issue by fixing the arch-specific kernel unalignment
> handler, but every time module sections are stored unaligned, it triggers
> performance degregation on parisc (and other sensitive platforms).
> 
> I suggest you apply them unconditionally.
> 
> Helge
> 
> [1]  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/core-api/unaligned-memory-access.rst

You're right, I've just referred to that doc and pushed to the new
linux modules [2] modules-next branch. This is also great timing so
that the work that is ongoing for Rust will take this into
consideration as well. I'll just post the test I wrote as separate
thing but it surely can be used to help test some of this later.

[2] git://git.kernel.org/pub/scm/linux/kernel/git/modules/linux.git

  Luis

