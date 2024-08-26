Return-Path: <linuxppc-dev+bounces-515-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F3295EAAD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2024 09:40:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WsjJW0Cvmz2yN4;
	Mon, 26 Aug 2024 17:40:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724658026;
	cv=none; b=l1F23hUWXmIKq/YSM9T5aZn3NGJztwOb6z0ri1JTNY9VtmthKcyHbsc2Zmu+XKXE30wQdwGbIPT6Ie4v1UlOSFNtGMm7+Bz7j5ziPL52esvzzbiJLGPXtwdgBiRohLqPaVhegyJrWb+mOM7VQdzYW2byoxJnNTLyGxKbPR/6X5ZS0iXTTZqFoyGkI38d5wRiEVHLuCmnnX08WyUnfem5yecHIGVhodmosRh3A8S5o6URs44pVTw+3z3E57EY68s2MKjWSvni/QuvbA/VB8XE0hYNiWg9ZvW75JNMjMNVb79PVJsl2hyjQzb2DbfYTlQwUoviMvJbeb4ABadX4CYVug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724658026; c=relaxed/relaxed;
	bh=Vdfzk0+hsBwqouzzsLrE7b2iuoHaoc7+4qe5N0CKgKg=;
	h=Received:Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=UTMBbLlhb9TdTikf+HV7OggVHA21FeohBCvXTRHsR2rZp513k9sV2L0EQUPoYU/2fHEj2u9+rr3B6Je6fb8SO7mq5lVl4CIvFK6w4Xkc+UFXoYMECklGaS1rIc3cKzY6wlsEW5oe38f6k8zMrx9OsRJ0ema/EzaK8RIvmlQLvEufz76zlr2iaGCQuICrDON/Q0EtWgnp6XW80ck4Hioc0TP/ZA766d+pGTkO2HiMumYX+f6Z/hK6//pDQdMOiL1EB1JJwGGAKD6kH8QJewXc4r/upTmq4+2b/hobgVMdD0xyXA+fbti6YQlKwOesXxh80KLKN4kQ7bxLhI56KxL7sg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com; dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=f6krDVK3; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=srs0=kq7x=pz=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=f6krDVK3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=srs0=kq7x=pz=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WsjJV5TZqz2yMF
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2024 17:40:26 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BE667A41CC8;
	Mon, 26 Aug 2024 07:40:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CD63C8CDC1;
	Mon, 26 Aug 2024 07:40:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="f6krDVK3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1724658020;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Vdfzk0+hsBwqouzzsLrE7b2iuoHaoc7+4qe5N0CKgKg=;
	b=f6krDVK3TxERL8zAmaVe24oiQRp/ht+Cyq+RdZEmbYWoZwGBirYKtCYcwmdEU/GqsES+5R
	0fHQiA+zG6EvJCNCNdAUT5gpgNKBkikQaclGA/a5Ej038vA6HfWLdbxQ2p8LXouq/iqe/A
	0YJpA7YbHp2IDGykFHXaGU/efEwxpPI=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 433d423e (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Mon, 26 Aug 2024 07:40:20 +0000 (UTC)
Date: Mon, 26 Aug 2024 09:40:11 +0200
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
Subject: Re: [PATCH v2 04/17] vdso: Add missing c-getrandom-y in Makefile
Message-ID: <ZswxW13r82w6Bz-B@zx2c4.com>
References: <cover.1724309198.git.christophe.leroy@csgroup.eu>
 <4ba87b8daeb2f3c0f98e62e16bf60c7e97fb53d5.1724309198.git.christophe.leroy@csgroup.eu>
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
In-Reply-To: <4ba87b8daeb2f3c0f98e62e16bf60c7e97fb53d5.1724309198.git.christophe.leroy@csgroup.eu>

On Thu, Aug 22, 2024 at 09:13:12AM +0200, Christophe Leroy wrote:
> Same as for gettimeofday CVDSO implementation, add c-getrandom-y
> to ease the inclusion of lib/vdso/getrandom.c in architectures
> VDSO builds.

Thanks, seems straight forward. I'll apply this now as a fix.

