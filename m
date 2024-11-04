Return-Path: <linuxppc-dev+bounces-2842-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0959BBCC3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2024 19:02:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XhzpD01lTz2yQn;
	Tue,  5 Nov 2024 05:02:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730743363;
	cv=none; b=QdMyg45nVaFBrbc5h8O1fImFP1Cm6RxXITaT/fJHH8YX+oCIcWcGEPW523mFXutH7x+3qJP+AQGQfhYAdT1//k7j7rADWgEGw5mOkXh5F5h4nY6NCqe7t2YHNow7gDtNOrS19xNMlVHWQh7MGlnUpqRzqjUMmrSbOeUvJ7oqUR07AYPkFU/nXzpN0LzvZUg3SRYgcNtEXgduIgAwY7jSuPdpLid6EalsbzMek1XMe5sLciA7Nsn2J4Yr2gsFXS5D+dzvrJncYctlmNLQSSxjOBFlF+knmxxw/sbOqJYiPdYg/qorACb6NU6gsvwi+V2kP8jFelKNGPrz7yIHIF1Sbg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730743363; c=relaxed/relaxed;
	bh=XrlGxeAxQIRjONh5DmYHR6Bi8gXK3gsqZm861p8ytLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AczdMLzhSh6O44VBdFdghyu+yZONFyr3xvx9W+7CSYXwGbf7nO0aKTNoEossTlvIAyhzdw+J8dFIdF7k/CW5w+6BFLgZSnGNANrhx0QQhLW71oF8A+lflNCfxdTB4t+KB8g4XDyYdAsp+o7bzWmJgQR31aGmOnbjBgI2+5P/xwTkZtjr8bduyNRF44LBqnp7/Lp+mGiAxXA1JR0KB0Ja+ecThwLz107tbgO/ZRDbQjdfeuOyTkxALMyewXS8w2F/UdcQxOI8ZVWOSR2+aeoS4OqeeOS1FjlLVlK4STsPGO6Mdn+gR1Nu5rile5fiXrmoBhDJg/+oLRWDu9QpeutuFw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nqfYcLrZ; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nqfYcLrZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XhzpB27cMz2xgQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2024 05:02:42 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A3AC4A43226;
	Mon,  4 Nov 2024 18:00:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39563C4CECE;
	Mon,  4 Nov 2024 18:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730743357;
	bh=yP3AzGld8FzxH9tOKTTB2o68WwDina53uBS0weY4OLs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nqfYcLrZDS69ybYADumbTjdNmAfqdeBwuYAUOic1Rj/10q6ggUWZLiDYkaCPK5aEH
	 zmu4eoFdrAUYUyqH09b4NU313JKh+C+MQEQsFnA5/S8o13oZAoiRFCI0ipBp/CIHrD
	 YYR8+oHSwIc4iDVej/js9QR02RkzVmrsSiipqECclpGLHtQIVef7t26FeafViOEBdl
	 g59QyyQs5LNimTKrFAcd2N9fUvHgiInhDc8gbGEok4vZSEw9RJzDsGauezslhgF4Jt
	 Un3HrYzRz3V3ubZQNfJ91sOIdTj3MsTjyaJG0bnzVO3UlO5jzUNETVnJiGJm8JQFgg
	 eaDC1K1A+1PYA==
Date: Mon, 4 Nov 2024 18:02:35 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org, x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v3 16/18] jbd2: switch to using the crc32c library
Message-ID: <20241104180235.GB1049313@google.com>
References: <20241103223154.136127-1-ebiggers@kernel.org>
 <20241103223154.136127-17-ebiggers@kernel.org>
 <20241104160136.GI21832@frogsfrogsfrogs>
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
In-Reply-To: <20241104160136.GI21832@frogsfrogsfrogs>
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Nov 04, 2024 at 08:01:36AM -0800, Darrick J. Wong wrote:
> Same comment as my last reply about removing trivial helpers, but
> otherwise
> Reviewed-by: Darrick J. Wong <djwong@kernel.org>
> 
> If you push this for 6.13 I'd be happy that the shash junk finally went
> away.  The onstack struct desc thing in the _chksum() functions was by
> far the most sketchy part of the ext4/jbd2 metadata csum project. :)

It will take a bit longer I'm afraid, since this patchset depends on patches
that are currently enqueued in three different trees for 6.13.  My current plan
is to target 6.14, and get this series into into linux-next shortly after the
6.13 merge window closes.

- Eric

