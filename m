Return-Path: <linuxppc-dev+bounces-497-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A519395EA5C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2024 09:27:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wsj1P00syz2yF4;
	Mon, 26 Aug 2024 17:27:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724657240;
	cv=none; b=WKedQbHpQhehMv/Q1tPGbHBKl4prC0YFACp1sScK4sqpDQVWXDK71xFP6Bpvtkojqb9IjjKQNfuvlzhvkW/OjB7ypFK9jpQD0OZFzoaUhmmHatbUUoKEfR3uqwcy2hZ5kHYlK5U2b6WN8e0e2/iJZBdbKeCkjUWNo3Su4FYCUGueTDtrpaVQ0sSjd6NRhA3kdXPtSvCk3ZBTFcEsW/CjIRMjZEseUd45BUhZcL2RZf4mLN1Uxgd4PdKpBky0a8zAO9AmD8cIx2YzNnnUACkVBIk25HG/hCIMG+lQXrDssa0XjEpEw/Lf9KJvjs6mmsN3jAK+QrMOBgDGlZkcYM+RYg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724657240; c=relaxed/relaxed;
	bh=cuB0YoGZhYs7TpZj24P+wVPnnaqDYDZ5SUiO+GVRr0s=;
	h=Received:Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=HbsOhXYnqACxVHCTRAuyCJHDS4whpnQu3xGWVkVsaH7R5nKAcnbwz1DBqFJEpCl7WdZKeIygsXiqw+X7yTHK5EB4NxXpZhNle+1PtcNWslSK6odEN4y42YEMnyk1QxeeGVKUtrB7MwNsch4Pc0FDFyDcO+aOD+H5bf6/7Cd5BSy2JMhiFAAGpN+LgrMzSRDcYqqk3MLW0oyDAbr6o3SDoKCT8A85kt1n4MRc10Qb7HRuW3HozanxwiACJZxBH2bPKX7A0NQyYPuzCRf9Rfjxsbw3R9WCqrPwR0qvnIzIgMN/8WBk4dw1DuVG8tLQ2jfNmDa6oZetK7Zl9ZwrVLU1RA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com; dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=T7JLAXHA; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=srs0=kq7x=pz=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=T7JLAXHA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=srs0=kq7x=pz=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wsj1N5PMgz2xKL
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2024 17:27:20 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0A932A41E0F;
	Mon, 26 Aug 2024 07:27:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F09A4C4CC2E;
	Mon, 26 Aug 2024 07:20:58 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="T7JLAXHA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1724656857;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cuB0YoGZhYs7TpZj24P+wVPnnaqDYDZ5SUiO+GVRr0s=;
	b=T7JLAXHAyeqrOhp4YIVWiuAEzZrJfTb/4IQwceTEiw10dy3k75OG3jvzg0ui7cWI/QbD0a
	mTgPEG086WEzE50bLMn0T16iVBfFqq0GVWR9/O3q5fwHIpbL8STnqrZcDmcRFM/aGrnu9s
	ZvFsbaSZzLv7aqahzI7qzXfiP7ZSyqI=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 80829940 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Mon, 26 Aug 2024 07:20:57 +0000 (UTC)
Date: Mon, 26 Aug 2024 09:20:48 +0200
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
Subject: Re: [PATCH v2 01/17] asm-generic/unaligned.h: Extract common header
 for vDSO
Message-ID: <Zsws0AkFnFDYo5p6@zx2c4.com>
References: <cover.1724309198.git.christophe.leroy@csgroup.eu>
 <a583352e8ae8f6a9a08f9b84a2c543fe43ef94db.1724309198.git.christophe.leroy@csgroup.eu>
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
In-Reply-To: <a583352e8ae8f6a9a08f9b84a2c543fe43ef94db.1724309198.git.christophe.leroy@csgroup.eu>

On Thu, Aug 22, 2024 at 09:13:09AM +0200, Christophe Leroy wrote:
>  include/asm-generic/unaligned.h | 11 +----------
>  include/vdso/unaligned.h        | 15 +++++++++++++++
>  2 files changed, 16 insertions(+), 10 deletions(-)
>  create mode 100644 include/vdso/unaligned.h

Do you need to also adjust the `#include <asm/unaligned.h>` inside of
lib/vdso/getrandom.c to instead read `#include <vdso/unaligned.h>`?

Jason

