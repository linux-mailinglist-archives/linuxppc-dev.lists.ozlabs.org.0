Return-Path: <linuxppc-dev+bounces-586-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3729603A4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2024 09:50:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtKTQ3Dn9z2xxw;
	Tue, 27 Aug 2024 17:50:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724745018;
	cv=none; b=J2u92JZamcRt5LVd+xRHbcFYgg9AZzqHqCZkSHEhYbJFTkVezZUruW0F8s+CESB6Cb3/Mj0r0/SN5S8kU6XMcA1d77PmeUetVc8vKM4DSqozVPRqsuzGwaWF64OAIzRS7HkCSncGUOi0pOJ6blGaLbYYVoeBMsK+lhwH8v7S51IzeCVBlCH6A3Zks3JPj6c0Tz0pkgjjsweZe5fj6VdIzPfamnVceEThL2/7AhyqWERZGyvK/oChRjhCvtv6DIuoFbMNTffWhKuzLjbKFXLQ4YPYWNE9rS2nHvADkO4EebPOSflOOO7xgMiteatbwxmrJhDW1O6lFn0uXpLNtZrn+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724745018; c=relaxed/relaxed;
	bh=QsVTygwiPAx+mbzXcALN6I1jJ8O7/LG8tnvncTUnNiE=;
	h=Received:Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=j0DtWyY6xgmJZjJQ4xmnd+YOs0Nk7H0Jxb5ToMdsuIHmPdk4eJK61QAmiGZu7qYdvw9nwYrbhTYj7NA0Z+jaF3qiBEAV9wnlhYrTneJ6maLrrkesCwnofc1j/j6zy5BRZZ2wmPaiPOSHzZi2hf7Y171TzJMmQuUkxJDSN3eZgt/8Vuv14LrHmmYg72tc5OdJ9GvKQuvTPNrH13D6+/IkeIVYck0RFFql+0U807oddees4j7HQfr2RIYbb2J9OeR9/yXSd/gW9WB1ihaN/t8PJABS1MB9JzX5XA0uiSiILHss5VY9SHhnzrUXxGBLk1eWFgEzzQB2MJC9uM2g1s/W/A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com; dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=AvLSq1li; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=srs0=xpq3=p2=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=AvLSq1li;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=srs0=xpq3=p2=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WtKTN5R79z2xsW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 17:50:16 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DC7E0A4163D;
	Tue, 27 Aug 2024 07:50:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22D1AC8B7A1;
	Tue, 27 Aug 2024 07:50:07 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="AvLSq1li"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1724745005;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QsVTygwiPAx+mbzXcALN6I1jJ8O7/LG8tnvncTUnNiE=;
	b=AvLSq1liPMAWhRkU2qPW2ccOzu0/8Bbc20sYqlkinvQDThtPaVyWyY9nR/HWohJD4DS6uG
	li8PlXAe9yVsGb03yr0VvCrnFmB76C+De4wa+koiV/kjvol5PqJ6u14cn58l/XY4MGPhOH
	vR9cunuxE0dF6UuoZt8NN21M41GJAfo=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 86529e27 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Tue, 27 Aug 2024 07:50:04 +0000 (UTC)
Date: Tue, 27 Aug 2024 09:49:58 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Theodore Ts'o <tytso@mit.edu>, Arnd Bergmann <arnd@arndb.de>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH 2/4] random: vDSO: Don't use PAGE_SIZE and PAGE_MASK
Message-ID: <Zs2FJku2hM2bp4ik@zx2c4.com>
References: <cover.1724743492.git.christophe.leroy@csgroup.eu>
 <b8f8fb6d1d10386c74f2d8826b737a74c60b76b2.1724743492.git.christophe.leroy@csgroup.eu>
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
In-Reply-To: <b8f8fb6d1d10386c74f2d8826b737a74c60b76b2.1724743492.git.christophe.leroy@csgroup.eu>

On Tue, Aug 27, 2024 at 09:31:48AM +0200, Christophe Leroy wrote:
> -	ssize_t ret = min_t(size_t, INT_MAX & PAGE_MASK /* = MAX_RW_COUNT */, len);
> +	const unsigned long page_size = 1UL << CONFIG_PAGE_SHIFT;
> +	const unsigned long page_mask = ~(page_size - 1);
> +	ssize_t ret = min_t(size_t, INT_MAX & page_mask /* = MAX_RW_COUNT */, len);

I'm really not a fan of making the code less idiomatic...

> An easy solution would be to define PAGE_SIZE and PAGE_MASK in vDSO
> when they do not exist already, but this can be misleading.

Why would what tglx and I suggested be misleading? That seems pretty
normal... Are you worried they might mismatch somehow? (If so, why?) 

Jason

