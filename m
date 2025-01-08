Return-Path: <linuxppc-dev+bounces-4838-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 526DCA058B5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 11:52:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSl9w0MbMz2xBf;
	Wed,  8 Jan 2025 21:52:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736333555;
	cv=none; b=HLZgL7we1REJ6lT6QLHf4RMKTTLON6Tc+CU+RcjCWsBsN05L8AzuwUYnPgHjGpNGj6jXfwMmHnsuXhlTDeCvRygF9RXY2Fm2iOBHy4WjkMgCpJlYwNjhCyvoS6A6tnLpqGZYMIZhph8nutIXlGDbSHQNR/O3GZSHNZjT9bzpYNNKW59RK8G4SNKGXAsvnDqCPsxAj7EEIMEF/LNBt3H269C+ajXQaHh1qDV5wqH0UrgHnCE9XVYjcenA9I2rscZrZxOFINFjAKyqTZl3370HfSFETWxmDQCRcPCqP9wjRozhpxAqqCRlaH5WRenyOZ05J8s5zzXbY+Oj+W+rqZnEbg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736333555; c=relaxed/relaxed;
	bh=p+UNOk/Gc7YL182qdcRhQOE6egTTYXg4wgQpkSsftN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LkrUfseu9Rnc+692I9UkEQTHLui83B1piJfLycm5LyC6MsUfoGzsbmInfi9G8sRRdS8BIg1xU0dDGrPve52PkoacHe8yf0O+L0iHH6lAV6ysjPSo2C5CDnTnCGToGbGIhuo/vOKKSIA75fsyzK4S5gFnl2gsCwCm7GI6jqvpg2sECHNCN/cNBh8KteKs1kxPP6NLkMTP2IgSS+n+bT4efrDBEYbY3mwEXX6jXT76JHmnQcbGas6TGZ+KggkhcjCNZaR8bpkEj1Ufn70KR3jvcoAQySXo9biK4K8/CUeaDFZbx837eYODhH2StMseFkCOMqJpPBJCiX0WclDU/mWUjw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=dVBnuM4j; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=rETOKJL2; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=dVBnuM4j;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=rETOKJL2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 6426 seconds by postgrey-1.37 at boromir; Wed, 08 Jan 2025 21:52:34 AEDT
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YSl9t6vDNz2x9T
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2025 21:52:34 +1100 (AEDT)
Date: Wed, 8 Jan 2025 11:52:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1736333541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p+UNOk/Gc7YL182qdcRhQOE6egTTYXg4wgQpkSsftN8=;
	b=dVBnuM4jjN5JT9vWqgK5VhYdpkywqP+envwHxNmws7s4YEtB5Yor7H/SpopHTxJZNiWWa+
	tb/fimI+Fbz4EDt6OU9pJhyMIMXLU9jBBd9VWqtQwPAFsIwFxddyy7oZhhCrqpwb2zps3Y
	+yjrdJSi+guYZkzHqAtwHdBSP4WUgNKnrueotbGyo4r/OiIenKMm61kjEv/DIixG05Vhoa
	UN68bbc92C2zOnS/yx1F7X/iGiDqn+Qw8ks4qtSs0Od74hm3NZvWtcZ045mW4Ajj8hqfLE
	rZ43r5nya+EkczgnaM8bIl5uRjLSRbN0gblqMrb6sNKFqgAI7QchRofJ3xwKLw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1736333541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p+UNOk/Gc7YL182qdcRhQOE6egTTYXg4wgQpkSsftN8=;
	b=rETOKJL2GevpN/Q3/95xe8uhF6nTOw8CVstX4041p8a3OB4SZgNDKyEkpYgx4E6EdgyIqJ
	+eOK8sxNeXECukAw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Helge Deller <deller@gmx.de>
Cc: linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org,
	Daniel Gomez <da.gomez@samsung.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Naveen N Rao <naveen@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH v3 01/28] module: Extend the preempt disabled section in
 dereference_symbol_descriptor().
Message-ID: <20250108105219.0qt_iWHk@linutronix.de>
References: <20250108090457.512198-1-bigeasy@linutronix.de>
 <20250108090457.512198-2-bigeasy@linutronix.de>
 <6e8ef32e-6698-496e-a9e4-09f0ade5f264@gmx.de>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6e8ef32e-6698-496e-a9e4-09f0ade5f264@gmx.de>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2025-01-08 10:55:04 [+0100], Helge Deller wrote:
> Nice catch.
> 
> Acked-by: Helge Deller <deller@gmx.de>
> 
> This patch really should be backported.
> Can you add a Cc: stable tag?

It should be picked due to the fixes tag. I add it if I am going to
repost it.

> Helge

Sebastian

