Return-Path: <linuxppc-dev+bounces-520-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 076D595EB63
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2024 10:07:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wsjvr4hwTz2yF6;
	Mon, 26 Aug 2024 18:07:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724659656;
	cv=none; b=L9cTpqSeudlLVhD7CYcwKIH+J45UxT/azyIc3wq+qaE55YVbEINNPQGYQLv0MXCnTT1mhmkts6Ei5LeR4IynB28Y6p0rzoMPXF2fu3hfqsUoNXbXy5GWky7G/HvUPRgkspC0pHuXOAENKF3+zXYLVaBZqt09YPrKXf9Y+Mtbifxx14hPSj2tykZQg8AeWRdoLy4DWHUbik8w0CrtHtZOD2psBE2dYel8bX06X7P9hhiSz6rxzgUuBfz0Novy/J/MuY8dU4n+hRVt9icCkYuhtwKi0O29/wg40CY2JqZ7yE4ZNr9LAnDRWAdP/W9LPnPqY5kRg9fJBwd17Euqga5KoA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724659656; c=relaxed/relaxed;
	bh=jmxPDcYvoBbgyB/umzSWgUasur5EN8gznSbU8g01ECM=;
	h=Received:Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=TuT+u6k6eRvnOOiYchNJJKaftSTB+t7J7qd8uB/cLECGTm+ZRGGzX1WHzlkfhQtgUGLhzK3onORUaIZj0djtUAAnwWBumb6AU+XCZPYtFVaVcNxNIAk+N9z7GUOyfKPCFzGtutuYTjIYVLGtEx321lckVVVDER58rxl8JDBbSGIVCAgJqZQb/JCy3gECw3vTEHsO8ZNT/ql3rmh1yszFhbOEiYk2Ox0zrTJqyonx7yypQv56IxRZRVU2ua1En3OXgbRA8FUZq41zMhq6sMsRtHceofB1J8RB1S3PoeWHN9DE+H/uaFXquZAD9olQT3PwIEa0LgifAQXU8NC46lWdLw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com; dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=euRNN4TD; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=srs0=kq7x=pz=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=euRNN4TD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=srs0=kq7x=pz=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wsjvr2xNXz2yDp
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2024 18:07:36 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1937DA41FD7;
	Mon, 26 Aug 2024 08:07:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F8EBC4E692;
	Mon, 26 Aug 2024 08:01:28 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="euRNN4TD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1724659287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jmxPDcYvoBbgyB/umzSWgUasur5EN8gznSbU8g01ECM=;
	b=euRNN4TDD56oHAa0RrIkhmKbl5jtPbgpQ1JiwbhkhFRp8dZmh+ShCB6W/NDpmnIvUxEDTO
	C5cAUMejHJxRuOzUYKKlbojI9lDu8RcjGMFf9vyihfG6AwtbWurhazqeeZpGN7+e3Aq3q6
	CncCu/SuHaoW1H+sZwkK37zSiBxPhZQ=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 955bdc20 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Mon, 26 Aug 2024 08:01:26 +0000 (UTC)
Date: Mon, 26 Aug 2024 10:01:17 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>, Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Theodore Ts'o <tytso@mit.edu>,
	Arnd Bergmann <arnd@arndb.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Shuah Khan <shuah@kernel.org>, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-trace-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 05/17] vdso: Avoid call to memset() by getrandom
Message-ID: <Zsw2TbCqqlVePJod@zx2c4.com>
References: <cover.1724309198.git.christophe.leroy@csgroup.eu>
 <5deb67090b214f0e6eae96b7c406546d1a16f89b.1724309198.git.christophe.leroy@csgroup.eu>
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
In-Reply-To: <5deb67090b214f0e6eae96b7c406546d1a16f89b.1724309198.git.christophe.leroy@csgroup.eu>

On Thu, Aug 22, 2024 at 09:13:13AM +0200, Christophe Leroy wrote:
> With the current implementation, __cvdso_getrandom_data() calls
> memset(), which is unexpected in the VDSO.
> 
> Rewrite opaque data initialisation to avoid memset().

I think of the various ways I've seen of fixing this -- e.g. adding a
memset() arch-by-arch -- this is the cleanest and simplest. I'll add
this as a fix to random.git now.

Jason

