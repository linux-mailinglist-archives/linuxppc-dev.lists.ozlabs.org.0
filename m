Return-Path: <linuxppc-dev+bounces-1116-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBF696F3C7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2024 13:56:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0ZRs08q0z30Wd;
	Fri,  6 Sep 2024 21:55:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725623736;
	cv=none; b=T9vMz9sDeK9GOuQVmTK6q6E8zY08MTJfjheMRcsKcXLGxsnVQbMstJxT3nNinwJvQZrD/6LtP/dGqikRZuuiX1S6ZTfdC8CAD+cTTakp1Ho3XlWr4HnIcJ9MZZbN0/8mbUKCngCHligLXrjszRsfgosO7wiZciDWSUgjOvGo//EmjTc2Y21Y2URmHka0DJfCG8XXkF2MJV7sB1Vs5i2p78bq0hhYMePs93mgw3siUXD7IUCJcj0kCqrVcSU1vkpbTNeGwQlfnCrO4ImGTwwZXqWpmGQon5P7FmJ1sLrUyRV4g8S7kIOKnX3bo7U//mmsIVtpMXnbNlB1GQHqofBuug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725623736; c=relaxed/relaxed;
	bh=3lsSqdNCC1OUjixuju7xkKJBjmqsQCfRK2KinVIS4OQ=;
	h=DKIM-Signature:From:To:In-Reply-To:References:Subject:Message-Id:
	 Date:MIME-Version:Content-Type; b=jYMcs0lX0tqWChraaIAflq5DE6paI52pfWggMGgJlg6Fe/tD8DqBeCpy2Snl1ip4JKitzfBtCEyzd4tzpkiG+SZFv47r93avAwFZV6+sYDpMCKI2XL8Tcx9CaBY5nSDp210T88AA4Xxumc+aDJugCRa8hXpeJssrIEb7b3N59fdQFztzCjH6Lby2uswa7tTw/2a/dcxal9jdYCLDocd8rudpGcSnQYvL+F4SK2uUhUz918VzvU8rrGbq4TmPgOJX81NkMBpbWcWzR0l1rSLGd1NYlxju0pTklLs2/W/dOwng7sZKeIBMzIRPQJMChZikiU4V6dnUHCiLCdk4o/bsZg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=iJCei7HW; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=iJCei7HW;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0ZRr728Vz30Np
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2024 21:55:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1725623736;
	bh=3lsSqdNCC1OUjixuju7xkKJBjmqsQCfRK2KinVIS4OQ=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=iJCei7HWUgo3ZmW5CHXnj/imw0IWPVPQOjpi48hI5hJJLZviMtWWxkdd2xumzOlDO
	 etJ0bimzdnDBjSLP20TWYoMX2iUS/01GNvkRVLNLvMUujPkoseNs+335vozNleFK/+
	 Lvuk0v9RD0cBQYqHZiSIcJ1k6PfK5ZI6ynyp8xQ2Xw5clraz0B0A7UAAFc52gN5xkD
	 ETWFvcit7N4zHSn1dxboVQ7k3sgK4Ibsf7oXaEn0QNb2fO7DhmIm8pzbeoqdOa1O/q
	 W0GkGZAf7mqS1lrNuiOf2niXp8aQ0O/he4Nlhf7DWEWLGsZ9abUWE0uZVbSl4034tQ
	 oIvAcPcxPFHwA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X0ZRr60NWz4wnw;
	Fri,  6 Sep 2024 21:55:36 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20240823070830.1269033-1-mpe@ellerman.id.au>
References: <20240823070830.1269033-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/64s: Remove the "fast endian switch" syscall
Message-Id: <172562357218.467568.9033024669391607824.b4-ty@ellerman.id.au>
Date: Fri, 06 Sep 2024 21:52:52 +1000
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

On Fri, 23 Aug 2024 17:08:30 +1000, Michael Ellerman wrote:
> The non-standard "fast endian switch" syscall was added in 2008[1],
> but was never widely used. It was disabled by default in 2017[2], and
> there's no evidence it's ever been used since.
> 
> Remove it entirely.
> 
> A normal endian switch syscall was added in 2015[3].
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/64s: Remove the "fast endian switch" syscall
      https://git.kernel.org/powerpc/c/29dbb984496daa490f3c1181b734b538a6f7b534

cheers

