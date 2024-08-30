Return-Path: <linuxppc-dev+bounces-815-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD789661E7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2024 14:42:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WwHpk1qBbz30Bd;
	Fri, 30 Aug 2024 22:42:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=145.40.73.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725021726;
	cv=none; b=IQ9bRm5r8lpp/NGPI8NLSDlT0xB58vR+e3YxicxJNnsFg8DRqffdCy8Vz4bPlpauey6b2/I1D9wIH3DQfg9Hf+g0b2hdJPanlQR2OZfxq6ulwwRWB5yfdYx9o1q+cQHAwVhDC6Z1VjfhSWlIO7kYFGRmgGaDWCKaUhb9CvDgL0yu+tDBj/rIugLXMGqVj4kvYlgWIuIiymYTCeHiPJVryQRovCdYWZ75KGDKgIrpUs5S43V2nV+o6qARFKGjBwoEgpNRruMf0+1oVkqJ1MLbVLI1CaUgctwytsYTbkfwkYdVBkUEzBfVyztTmvP+MCaDHbWZa+xYPOHH1qJw+QeJkw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725021726; c=relaxed/relaxed;
	bh=D5HhCkXQX4yRjdGD7QmOEhonhj42UCq3giLzMl/+iqs=;
	h=Received:Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=BmojxAOYz6vpgZI7C6PWp1SC6VlOPdfzN2DKwM8Bochh7wZYmp45tqlnj5hOrgtmhwUNyY6m9sVbXTMySWVlJbBmzJHa3g9aXavVtqtWwb8JVTM7Smlhu5uKr4bTkMRzPBhqCUnvTVSmBgzYbVaPgo9H5HNh/I3wcsLXrku/shsZQz3++vBQFIS0VHfWh4vN8isY+L9OBpXr47TRG/EoBpasmvsNPKRvz9XQdU/osAi/BZm8VtZYPBEju57vpTHXvt2D/JhWAii8vIOtLnCT08KBQevmH26TOEtRbA//tnfGsoItoyLCnSjsU3iddwiBy5fC2ZOPsb1jvzVE5Nn7PA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com; dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=Xysu3aPx; dkim-atps=neutral; spf=pass (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=srs0=4jm9=p5=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=Xysu3aPx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=srs0=4jm9=p5=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WwHph208Qz30BY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2024 22:42:04 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B3DC1CE093A;
	Fri, 30 Aug 2024 12:41:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7567C4CEC6;
	Fri, 30 Aug 2024 12:41:57 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="Xysu3aPx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1725021716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=D5HhCkXQX4yRjdGD7QmOEhonhj42UCq3giLzMl/+iqs=;
	b=Xysu3aPxk9gqaPPw9eJs8PDHznvdVk/jJAzzYZB3aued/dJemICWfJy1ZuRkI/Qutjb9w1
	u540vDW7pnO7zUNjKq9vsuM9HR1fHcfe/tMLbcfVOWrLoPxcXqasNdgicyI1K5+JJ7ZhfJ
	JQxtOadin8G1W7lnR5RttpDno2HR+cA=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b8d780d9 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Fri, 30 Aug 2024 12:41:54 +0000 (UTC)
Date: Fri, 30 Aug 2024 14:41:50 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Shuah Khan <shuah@kernel.org>
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andy Lutomirski <luto@mit.edu>,
	"H. Peter Anvin" <hpa@linux.intel.com>,
	Mark Brown <broonie@kernel.org>, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 1/5] selftests: vdso: Fix vDSO name for powerpc
Message-ID: <ZtG-DqWo8kBMocVh@zx2c4.com>
References: <6c5da802e72befecfa09046c489aa45d934d611f.1725020674.git.christophe.leroy@csgroup.eu>
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
In-Reply-To: <6c5da802e72befecfa09046c489aa45d934d611f.1725020674.git.christophe.leroy@csgroup.eu>

Hi Shuah,

No 0/5 patch, so replying to the first one.

These are fixes to the vDSO selftests that Christophe is ostensibly
providing as a preamble to his work porting vgetrandom to PPC. Do you
mind if I take these via my random tree so his PPC vgetrandom code can
go on top of it?

Jason

