Return-Path: <linuxppc-dev+bounces-2570-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 267119AF8FF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2024 06:53:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XZVmD2fpxz2xdg;
	Fri, 25 Oct 2024 15:53:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729832012;
	cv=none; b=KpZ7+a/9mTw1W6nY5svPqlwvGhucd3umtVKf8tht30SV6Pf6GJtpiS6nF1O3WrPzHjCorMSBIqNVAdPQxRSasQz0mhY1p07osagwBGjYnZ/W1J1+/s+jFLriOt+cBUbatemkT0baAzO8c8fONJ4QRzapz73Xz4OjaAaXVMYkL8kCvpkX+BOvacpWy/4/GO4WqzHpndN+GGIQQ0f+VKG06CvgSGtJ8+1CDD+yse8TNUHK2ZxBG6lYB1CjFmBdO4uG0+OaYx6XjPa4ZYEhLrWLAYNAxns8wD+VHqrTWPv0jVwNXWnOBhybiFflavyOUvTPA9d1GqLVvKQuE2lbiORJeg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729832012; c=relaxed/relaxed;
	bh=MYH1zpeBVhNRb3CzsuU8fWs/xBAcKIXL/enHLpot6ZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nZQBMm/M5TdXq9NkCEKN4EPPC+fD5xGHxDSbLoHR5Z+d8txnCDLJoOYTt1Xw3fRbpNW8xi1dwGKqVA/pj6zlmGUOGDSETCPS2O3IOQbe2+HEl1l04NdGWrws4wVXL5oCqH7Q3lN5/LMJXSLIPI8/b8DZHUVF+kn9FW88Hdc0UjKGzgWOR6n+6kX7AK9xjwgNm1t2O70VtO8rXoQzMy7jkNwIYy8xGvGb6vqteX2NtGXzgY1gazQDLPWYorwwYUa4sUOFcOlJQiMmMa42Ulgp/OyKJkArxTVeImKxyqTdHwcfnrQCgUMcgPzalfCERGGgyQOPzyNPea1vP1BpSMSeNw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=d7VgyKlV; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=mcgrof@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=d7VgyKlV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=mcgrof@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XZVmC2NCLz2xdY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2024 15:53:31 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 921E5A42B40;
	Fri, 25 Oct 2024 04:51:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E389C4CEC3;
	Fri, 25 Oct 2024 04:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729832005;
	bh=ClWmtTHHz6+T83+/vJe5JV8a/N9MZGoxPSE5eEh0muw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d7VgyKlVIcIldM+r1Pru/EDCtsvT70Z0k2Pwb/P3IT2T81Kcx8n17OSGJQ3YeGN0c
	 HIc2AhSbCTxg42lt3YKoI+hMiglyzCsF2fVXcirFxGnyoGVN2iDlTCDJJeKT9qCbpI
	 x7hDbMaaUBg+B8vkoIEfm0yiuZSJqz17jekmAMGyrMMXFdBMzGWhkPJheON6KVuUmK
	 oC9+sDsC3JhzSVQNRFYPGaodaK6+HGZIpPmMkEdBZVb4C9kXJ5hRKtIvW0RkK2iTFa
	 G8oxzcbcrb0CjSoAd7cfOlci4NLBOKZ0kG3hHOx08S477SK8bZjEg+Z4fTvvvy2opw
	 votRB5glKyggw==
Date: Thu, 24 Oct 2024 21:53:23 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Matthew Maurer <mmaurer@google.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Petr Pavlu <petr.pavlu@suse.com>,
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
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v7 0/3] Extended MODVERSIONS Support
Message-ID: <ZxskQx3QbkJ08g18@bombadil.infradead.org>
References: <20241023-extended-modversions-v7-0-339787b43373@google.com>
 <20241024230757.GD1382412@google.com>
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
In-Reply-To: <20241024230757.GD1382412@google.com>
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Oct 24, 2024 at 11:07:57PM +0000, Sami Tolvanen wrote:
> > Changes in v7:
> > - Fix modpost to detect EXTENDED_MODVERSIONS based on a flag
> > - Drop patches to fix export_report.pl
> 
> Unless Luis prefers to deal with this separately, perhaps you can
> just include a patch to delete export_report.pl in this series?

Yes, please do the homework to check the history of export_report.pl
and just nuke it if we don't need it. Ignoring it just because it may
not be used is not the right thing.

If you don't find the history on the current tree we have the
history.git tree [0] I often use to go down memory lane pre-git.

[0] https://git.kernel.org/pub/scm/linux/kernel/git/history/history.git/

  Luis

