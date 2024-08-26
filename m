Return-Path: <linuxppc-dev+bounces-522-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7F495EB95
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2024 10:17:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wsk7K3Mgvz2y8n;
	Mon, 26 Aug 2024 18:17:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724660253;
	cv=none; b=nA9xeWrOLwxf8w9JwkaJljFDF/VJnZRe3MckwY4yV6VYdsE4rnk+v5SKeCO+nUk8bp+VjyL+rSd6WtzGg2UKEEwV0a/ChfeVY55nrWs2aLdxThq0p9bpVec4eotkg1AcRLXvrHOBGjq9zDFJai5rveqPIjGE8AIesD+hYoc8sg/r37cY4L/+cK0UqWsh8+SW38o/3lBeOwquPb63yZK6Gsy/8h1IAdVvhC637IXHd5V+Hk6vYBexZ+nHaFFAVYfvrJYJHOLp13uEVQpf3PEom0+HcZjHFLAs9h23XtJl7xsJK+d44BI3CK58vy/KKr9+45ASvIhIT3RO0o2dHHFg/A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724660253; c=relaxed/relaxed;
	bh=UaxHDzyeQARFqyBuo6p6nbdr7RFX49mOAxwSudvJyzo=;
	h=Received:Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=KKYt9QsE0YpR30WqF7zqGA7Bg9CpWQ9u+eUqH3NxgqUAyOBvQ4mPLqsCZfICDLDO5TOjYUP1AufxHQklumsmrCjjng31HxOcLDI4rJkdU8wG7HaHxbqHbAjnr77zzjmwkY34KjSJRqoPDSCoy+IyBKbaWCmfULfjSTNmBo77pC87JAFzEbKpDp1pfOEXnXGgLqc3mHg/ZevRfTFqdPIfF374ovKIIe7WUWE68zhlUJRm5fjPKrInEquhmOhQKCMST24m9KHQJWh084bxjCg2K/9WxNRF3nSd+a/HE2nu0kfxzesbfgJ5IjhXY3lZ0k1jKsk9t1MwXgVoGPljv9f/XA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com; dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=StHVCOh4; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=srs0=kq7x=pz=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=StHVCOh4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=srs0=kq7x=pz=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wsk7K01WWz2y69
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2024 18:17:32 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D2C65A41DC9;
	Mon, 26 Aug 2024 08:17:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F8E8C8CDD6;
	Mon, 26 Aug 2024 08:07:43 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="StHVCOh4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1724659661;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UaxHDzyeQARFqyBuo6p6nbdr7RFX49mOAxwSudvJyzo=;
	b=StHVCOh4KNNCyFXRLYUoNCdTcNxSS6Z3asRmnJ9ATPyiIOC/xbFWmEWaSFpaObsfsoO+X3
	qqjWV+mwTMIgJyMwkuMkqXw1CrHepM96JxAR4p2UKjZOsZsDhunIzVT2qZzKIWCwWJ7sje
	lqmadHbYXdoCfy5fWd5XhoCzWQm9vhQ=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a6c12a3f (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Mon, 26 Aug 2024 08:07:41 +0000 (UTC)
Date: Mon, 26 Aug 2024 10:07:32 +0200
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
Subject: Re: [PATCH v2 02/17] vdso: Clean header inclusion in getrandom
Message-ID: <Zsw3xMoX2EI5UUs1@zx2c4.com>
References: <cover.1724309198.git.christophe.leroy@csgroup.eu>
 <2a081f1fff5e40f496153f8e0162fc7ec5adab2e.1724309198.git.christophe.leroy@csgroup.eu>
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
In-Reply-To: <2a081f1fff5e40f496153f8e0162fc7ec5adab2e.1724309198.git.christophe.leroy@csgroup.eu>

On Thu, Aug 22, 2024 at 09:13:10AM +0200, Christophe Leroy wrote:
> diff --git a/arch/x86/include/asm/pvclock.h b/arch/x86/include/asm/pvclock.h
> index 0c92db84469d..6e4f8fae3ce9 100644
> --- a/arch/x86/include/asm/pvclock.h
> +++ b/arch/x86/include/asm/pvclock.h
> @@ -5,6 +5,7 @@
>  #include <asm/clocksource.h>
>  #include <asm/pvclock-abi.h>
>  
> +struct timespec64;
>  /* some helper functions for xen and kvm pv clock sources */
>  u64 pvclock_clocksource_read(struct pvclock_vcpu_time_info *src);
>  u64 pvclock_clocksource_read_nowd(struct pvclock_vcpu_time_info *src);

This change isn't mentioned in the commit message and could probably
benefit from doing so.

> diff --git a/lib/vdso/getrandom.c b/lib/vdso/getrandom.c
> index b230f0b10832..cab153c5f9be 100644
> --- a/lib/vdso/getrandom.c
> +++ b/lib/vdso/getrandom.c
> @@ -3,15 +3,13 @@
>   * Copyright (C) 2022-2024 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
>   */
>  
> -#include <linux/cache.h>
> -#include <linux/kernel.h>
> -#include <linux/time64.h>
> +#include <linux/minmax.h>
>  #include <vdso/datapage.h>
>  #include <vdso/getrandom.h>
> +#include <vdso/unaligned.h>

Ah, that's where you do it. Ignore my comment on the previous commit,
then.

>  #include <asm/vdso/getrandom.h>
> -#include <asm/vdso/vsyscall.h>
> -#include <asm/unaligned.h>
>  #include <uapi/linux/mman.h>
> +#include <uapi/linux/random.h>
>  
>  #define MEMCPY_AND_ZERO_SRC(type, dst, src, len) do {				\
>  	while (len >= sizeof(type)) {						\
> @@ -23,6 +21,9 @@
>  	}									\
>  } while (0)
>  
> +#define _PAGE_SIZE (1UL << CONFIG_PAGE_SHIFT)
> +#define _PAGE_MASK (~(_PAGE_SIZE - 1))

If PAGE_SIZE isn't defined at this point, why not just call it PAGE_SIZE
instead of _PAGE_SIZE? But if that's the case, why not put the vdso
definition of PAGE_SIZE into some vdso header included by this file?

