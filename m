Return-Path: <linuxppc-dev+bounces-1751-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C7EAD98F44D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Oct 2024 18:34:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XKHLk327Yz2yVV;
	Fri,  4 Oct 2024 02:34:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727973246;
	cv=none; b=iIGMoFv+Jwnb0P/msNOuCA0AW16n8H/QyzKHrxxcYxzN9aveS12vF8Xqk458n9Kiuzn8Zpy2Of46J19nVeiZ+xvp/AI8SoNk+YahskkAxqB/Y7TErskKpkK78zh84ognoolJWsj3kFSy6V8KoE6QA9UudVtl/E1kGF19sDEUIYR/CY62YTqoCracNjDN8L7gAndqaigE2Qgelx1Pv49cAw3/BdmoozA0oOr0wrUWvmn4m81CkcZWcIN5ngMal8mYN6WxoKCSe6cSQSXx7eMI9mB0pKKqaZ1hZoOlaV5W/03Wue7u2oYbvmvt1uGc4XIyDCCQMArwENG0I/H8rY3MAg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727973246; c=relaxed/relaxed;
	bh=aDvtngM+zTJETYYM8NjUWYxvE//Q8V8BmTxKgQqU6og=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EBc68Yc815aj3bDRAhCH8CsiraJRclpyNcyaMRt21qkqybFT39nc2pQK9mtlWkvwRPl/oBmbfxKId60oj1ss8POTaeNKuo5o0C7BPAnnxmA6bV+dvAdX/jQMmfKd1E6B86mMkk8lA6N3PvUA3XxZdQTBgImjXhyGfw3tk5QbsSrsM2HxgOeufXKOAebov6GQvqo2yWIRRQu2F7HAINmkOP80URPTJDzwWEDsV5x4/G1F6kQy4LL6cBwBuokwcvV0pXhfxUtynTiQn8sSm8CCea1HLU9sG8MKj5lQr9gRv/rJIwE7uExGdUWH4qTbr2laR2uRCqoY3uwf4KJhRvPi+A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com; dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=c6JpXNhi; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=bqrz=q7=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=c6JpXNhi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=bqrz=q7=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XKHLg4mcvz2xvF
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Oct 2024 02:34:03 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C3F1C5C026A;
	Thu,  3 Oct 2024 16:33:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ED16C4CEC5;
	Thu,  3 Oct 2024 16:33:58 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="c6JpXNhi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1727973236;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aDvtngM+zTJETYYM8NjUWYxvE//Q8V8BmTxKgQqU6og=;
	b=c6JpXNhiGvdSOaFUMXQoarBQz+bGN/kW6/J8+hqEE39+oFgrfSaiL0FFj+NbxJqr21vc/l
	XyC97d/QlESAg7V9GWH8N5tHurtKsWnxjoNpuIrQPwyHe732Tc2bN2lQD12ebhSdI+nhzn
	FkCvCB50FOwRCrtxx0SPO8Sytcxkej0=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a4f3bc08 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Thu, 3 Oct 2024 16:33:56 +0000 (UTC)
Date: Thu, 3 Oct 2024 18:33:54 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, mpe@ellerman.id.au
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/2] powerpc/vdso: Implement __arch_get_vdso_rng_data()
Message-ID: <Zv7HcuhVH1uM9BNI@zx2c4.com>
References: <0557d3ec898c1d0ea2fc59fa8757618e524c5d94.1727858295.git.christophe.leroy@csgroup.eu>
 <a1a9bd0df508f1b5c04684b7366940577dfc6262.1727858295.git.christophe.leroy@csgroup.eu>
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
In-Reply-To: <a1a9bd0df508f1b5c04684b7366940577dfc6262.1727858295.git.christophe.leroy@csgroup.eu>
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hey Christophe, Michael,

This series actually looks pretty okay to me. I realize ThomasW is
working on more generic cleanups that might obliterate the need for
this, and that may or may not wind up in 6.13. But, I was thinking, this
seems like a good correct thing to do, and to do it now for 6.12, maybe
as a fix through the powerpc tree. Then ThomasW can base his work atop
this, which might wind up including the nice lr optimizations you've
made. And then also if ThomasW's work doesn't land or gets reverted or
whatever, at least we'll have this in tree for 6.12.

Michael - what do you think of that? Worth taking these two patches into
your fixes?

Jason

