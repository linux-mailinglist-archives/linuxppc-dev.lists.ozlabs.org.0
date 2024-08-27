Return-Path: <linuxppc-dev+bounces-588-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 977E696044E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2024 10:22:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtLBf0jFbz2xKQ;
	Tue, 27 Aug 2024 18:22:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=145.40.73.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724746954;
	cv=none; b=ezwWgdhD/8hTykfPtNmtGyohPVXMr9NjxvMnUigrInYOPWvubNn9DGsfgfx0rG8ml2dgWvroN8ywsWZmPDzwGc3m39QGHFcE+BKfFyL2VtlFRIY6XjIdL4iX+lE+nlTKAhEQjLO84Dj/Vr1mFveVw8i10UAueUviAt0uQYXkVQc6uoYMHa1eDQrHUY+sSwDJ+n9UfoIlJ0UtuxRu1yZJoec2ZefXKBAZHIFq393I8oAGeaYflQ9mi4edagF4fKeIiifWQA8h8VtXHIL+KvPXQachP5pfyS0wdwGJ/X71eB3Xh2RRDcIg416MiwaC8a385bqVNvAejt2HKXi70ymu5A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724746954; c=relaxed/relaxed;
	bh=Uzmm5ymz9Kdo8U5i2J3vApJuNWGqBvcBgCCp8LWSRoY=;
	h=Received:Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=lGfjTsIZ2KJQzx/hduCZHBASpoUvX8xqae3UFZ6FbkfpQS6e3LGbdeKTn8e09nktKshQKxYLjYy3HlGNAekZaFXr/F/4I0tkHnFnm5DZz0g4cxFPpmcv/Z8FeNpsWraCvaO+u99Wti3AWHUVFRHuVOSNrey96ptH68z8M0/mHCGwqQe6FvqvI0W02Wl1sTVrC4fU9IEWCmU2VnjkWi7xeUPaQCWOv7Bc5VOHfz2M4DR8rnctH9wYepcqWADcP7q05XLq3c92ZlSopV5VzwHqKyynyBYAIHBPLqTrMm1DX3M8QsdZJ5ZATpmgpxeuhBoFxhkIY6porp1FlEN4xBfogA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com; dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=TORGCs/7; dkim-atps=neutral; spf=pass (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=srs0=xpq3=p2=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=TORGCs/7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=srs0=xpq3=p2=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WtLBd6t4nz2xHW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 18:22:33 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B21F4CE10F9;
	Tue, 27 Aug 2024 08:22:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63334C8B7A1;
	Tue, 27 Aug 2024 08:03:40 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="TORGCs/7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1724745819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Uzmm5ymz9Kdo8U5i2J3vApJuNWGqBvcBgCCp8LWSRoY=;
	b=TORGCs/7gC4HKVFIs54oJJTrqMS5kY0+3ykih9Z6ThQoVZ/vsLyrzOfeVn51GHXKBfwtZ6
	RiqDIBoNb31ZAgvJXn8l41ee5CELTUFr+Z73k3I/SEWAyJsyL6vaP2Hs4QqHw88LtYnJby
	synNMhSoaRx1O1AKVH96EVx8KYIEMkE=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4fa0e2f2 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Tue, 27 Aug 2024 08:03:38 +0000 (UTC)
Date: Tue, 27 Aug 2024 10:03:32 +0200
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
Subject: Re: [PATCH 4/4] random: vDSO: don't use 64 bits atomics on 32 bits
 architectures
Message-ID: <Zs2IVIQwZ-8fQGZ4@zx2c4.com>
References: <cover.1724743492.git.christophe.leroy@csgroup.eu>
 <30806cb8d7e0b95dcfb9f81a4583759faa1d8f31.1724743492.git.christophe.leroy@csgroup.eu>
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
In-Reply-To: <30806cb8d7e0b95dcfb9f81a4583759faa1d8f31.1724743492.git.christophe.leroy@csgroup.eu>

On Tue, Aug 27, 2024 at 09:31:50AM +0200, Christophe Leroy wrote:
> Performing SMP atomic operations on u64 fails on powerpc32:

Thanks for this, and nice catch on the vDSO side checking on big endian.
I've applied this, fixing up the commit message and the comment,
maintaining the reverse christmas tree in getrandom.c, and adding tglx's
suggested-by tag.

Jason

