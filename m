Return-Path: <linuxppc-dev+bounces-3555-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E71E29D8F12
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2024 00:25:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xy1z11srqz2yJ5;
	Tue, 26 Nov 2024 10:25:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732577133;
	cv=none; b=bJm2TtzQ6vXTijriCkzHf6T61h2GV+C0kxw9c6h1MFFHecAilJlySrTM8r53GrCTrYqhrjn+eql+zegj63vyef4t19EYKIWA19t7FSIbKr5M7Qaq8+xsele+jTVx282RvMa0pURcpUCMmpdrO1KrbEbirQZxa3DdjC1BmCU5HCPS7eAk0LSLh/VU4vuSN+iwSYZQksUFMmXKxsRLHiAsK/D6+F+yIPm9P/41ln3bpyM8RXKTWW1cfHxNyii0ff9UA2cowBdO20vk29B7yiTgdrMbYraMTKhv/OgtnWYAdYKdN69SOrQq8xLpRH56NVk7Ac8i7aTxCtoK1eQMu8fg7w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732577133; c=relaxed/relaxed;
	bh=yfKe5xJK4kE/vxFgf8thmgpfFRVxjUxbKz2vm++K0uo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fvhVTDLYNN8FMhGfXr4xT2F8Qoe7m7Z+wwT1V5f/+9gjvxk0owpkT7aaCVRCUHxWB66BGUrEX5VyD4juSNDT1bcEwPg47pXuk/V1WNWiv3/qOFjDVjfT4f1fbWhTqFWz5gXlMl1rWrGwcC+DLQbO0G5iGkf0L5Pchy/b15VVAYdNpFv8dUKkuN0vofCddSYtfdkvJATZAFVc47v9CfCWvIS7ASJzmBCI/quagjnhlTl/MrEtX/cmxv0DGOpJycrGlsWItu0samn6mQxcE3YD1l2EBbcgdcBwf1UCJNTmKiOAbtGWHJFszISL5N5CPcOJ6H8t+/zp15aEir7YSErU/Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=E4sdpDu+; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=mcgrof@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=E4sdpDu+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=mcgrof@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xy1z00gmlz2yDt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Nov 2024 10:25:32 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1D1815C5C30;
	Mon, 25 Nov 2024 23:24:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94BD3C4CECE;
	Mon, 25 Nov 2024 23:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732577127;
	bh=Ef9YOhkT6dvq3u1nt9fT6DrzSKWjzvz3OpMEiybONBA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E4sdpDu+7U4uKBYbHed2GEqt4mz1AZox50i+VMTL3yOe2Vlwn6iksIGS+oaZ5zgR+
	 T2v9pOMKQN6AWpt0pGFj+9UnkxSMvpaXHACjzfPOKYLPdl8Y7Bh0TyX40b3h6Z7oeu
	 W6JLpiyIYTPsM2KmtkFSXDIkVfEBZrGgvBDKcn4eyj0T3MR126uvCv0Llmape3RCev
	 exSY16RQ6sDiCHqdkLrBZQixK4WgbTjdhU0DFfwogb28Y/U2UwSflm9WbelUImPLTg
	 YQhVnkAeNI6bGfszun5dCDdNcB2zYbqzaLNmDIuJF634mrHyIJ0hAdWGHISZAnrmP3
	 BYT8sC13RStIg==
Date: Mon, 25 Nov 2024 15:25:25 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: Matthew Maurer <mmaurer@google.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Jonathan Corbet <corbet@lwn.net>, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v10 0/5] Extended MODVERSIONS Support
Message-ID: <Z0UHZQErgTDpie0y@bombadil.infradead.org>
References: <20241123-extended-modversions-v10-0-0fa754ffdee3@google.com>
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
In-Reply-To: <20241123-extended-modversions-v10-0-0fa754ffdee3@google.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sat, Nov 23, 2024 at 02:42:14AM +0000, Matthew Maurer wrote:
> This patch series is intended for use alongside the Implement DWARF
> modversions series [1] to enable RUST and MODVERSIONS at the same
> time.
> 
> Elsewhere, we've seen a desire for long symbol name support for LTO
> symbol names [2], and the previous series came up [3] as a possible
> solution rather than hashing, which some have objected [4] to.
> 
> This series adds a MODVERSIONS format which uses a section per column.
> This avoids userspace tools breaking if we need to make a similar change
> to the format in the future - we would do so by adding a new section,
> rather than editing the struct definition. In the new format, the name
> section is formatted as a concatenated sequence of NUL-terminated
> strings, which allows for arbitrary length names.
> 
> Emitting the extended format is guarded by CONFIG_EXTENDED_MODVERSIONS,
> but the kernel always knows how to validate both the original and
> extended formats.
> 
> Emitting the existing format is now guarded by CONFIG_BASIC_MODVERSIONS,
> but it is enabled by default when MODVERSIONS is enabled and must be
> explicitly disabled by the user.
> 
> Disabling CONFIG_BASIC_MODVERSIONS may cause some userspace tools to be
> unable to retrieve CRCs until they are patched to understand the new
> location. Even with CONFIG_BASIC_MODVERSIONS enabled, those tools will
> be unable to read the CRCs for long symbols until they are updated to
> read the new format. This is not expected to interfere with normal
> operation, as the primary use for CRCs embedded in the module is
> load-time verification by the kernel. Recording and monitoring of CRCs
> is typically done through Module.symvers.
> 
> Selecting RUST and MODVERSIONS is now possible if GENDWARFKSYMS is
> selected, and will implicitly select EXTENDED_MODVERSIONS.
> 
> This series depends upon the module verification refactor patches [5]
> that were split off of v5 (now in modules-next)
> and DWARF-based versions [1].

Thanks for doing all this.

Acked-by: Luis Chamberlain <mcgrof@kernel.org>

 Luis

