Return-Path: <linuxppc-dev+bounces-503-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FD795EA8A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2024 09:33:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wsj8t0yJyz2yMX;
	Mon, 26 Aug 2024 17:33:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724657630;
	cv=none; b=nPQON+O1GXXQ9eMwEEDydagVL40rFQN3E2FweVgUrExMAvvLslgmcLZqMghokIleW8lSfqq+CEW+X0MrFmjBVeSGluzJlDfOWDKq+74p9L4Qzcab93x9zPPx/6RyHGDJ+WR8xgFcDR8i3al5VeJSIvrbyvmtZg4ysu/jAWpySb4AC3sogJycFNoJ7ZRnFOsKY4ITJV3+JsFb5j4xVSMSSw2aRscLz3xpALyxOt5tu/X/oeNsM7pXCzqjwN0+e73t8EkT3c15HoDNVs6FvlNFk6PcGEkOiVYyETyw7kLmGWact/HAFGUpTWriDfxkvkfySpHFN5YcKGs3rMq3NbZiPw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724657630; c=relaxed/relaxed;
	bh=7352A08UdB7RMlKrf9ghuchmIx/aoSaJhuAqBuZsFcc=;
	h=Received:Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=bmXzFLb+AOzMxPCTleYQCCkG7aDU/lKY0/hvvO08szjXwfBNmnLEUg2ogIPVdyEr9/NTmCHeOqE3pu88l3OZEVYUOJo1PG/2/b9u4Lk/aSoTY36kgOyIGsDPcZR35fUIr9ws4FZNm4MwzVCufjXla4nTLbYksO8S2/eU0eniOO7TxQk/wOyVe0Z0YZ0+QQLFDGRPvDqdS58ckR53/gnwhDwpeb3xVQIxboogd+hwoW0Rf8SV/HCxoXPL3xZYcEKikvFhydHYLcm8n7yb1aQB7oPqgLFNEcWltp4Eypi/Hh6XnMHqrayiYrSIHyBSIy8nzFhcEXnhdkyIrB7iF+d8Fg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com; dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=DBRZ6XWD; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=srs0=kq7x=pz=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=DBRZ6XWD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=srs0=kq7x=pz=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wsj8s6M43z2yLB
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2024 17:33:49 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C192CA41C78;
	Mon, 26 Aug 2024 07:33:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23C2BC8CDC1;
	Mon, 26 Aug 2024 07:33:45 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="DBRZ6XWD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1724657623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7352A08UdB7RMlKrf9ghuchmIx/aoSaJhuAqBuZsFcc=;
	b=DBRZ6XWDvXjnYuYhxFXXFEdwYvgjA29BBUQVXRAglzQXZPgBoyT+pscRKjlI8wD1B6oehQ
	eDbbUGzgcthjGXmofT3JoCTTGtGTgN59VX/jWtlqknExCrO9TPUYQcV1VqXc7cECI/ckoW
	WbweiaFinCYbI/Owc4VJr6Cbd4DY0XY=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 35c98243 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Mon, 26 Aug 2024 07:33:43 +0000 (UTC)
Date: Mon, 26 Aug 2024 09:33:34 +0200
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
Subject: Re: [PATCH v2 15/17] selftests: vdso: Fix build of test_vdso_chacha
Message-ID: <Zswvzq11-0LARaR2@zx2c4.com>
References: <cover.1724309198.git.christophe.leroy@csgroup.eu>
 <50cc36936b310d8dd6d7539c552cc8dd84052020.1724309198.git.christophe.leroy@csgroup.eu>
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
In-Reply-To: <50cc36936b310d8dd6d7539c552cc8dd84052020.1724309198.git.christophe.leroy@csgroup.eu>

On Thu, Aug 22, 2024 at 09:13:23AM +0200, Christophe Leroy wrote:
> Replace -isystem by -idirafter
> 
> But this implies that now tools/include/linux/linkage.h is
> included instead of include/linux/linkage.h, so define a stub
> for SYM_FUNC_START() and SYM_FUNC_END().

Thanks! I got step 1, but didn't figure out step 2, and tried to do
things the lazy way instead:

-#include <sodium/crypto_stream_chacha20.h>
 #include <sys/random.h>
 #include <string.h>
 #include <stdint.h>
 #include "../kselftest.h"

 extern void __arch_chacha20_blocks_nostack(uint8_t *dst_bytes, const uint8_t *key, uint32_t *counter, size_t nblocks);
+extern int crypto_stream_chacha20(uint8_t *dst_bytes, uint64_t dst_len, const uint8_t *nonce, const uint8_t *key);


Yours is obviously much better, so I'll queue that up instead.

