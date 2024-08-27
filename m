Return-Path: <linuxppc-dev+bounces-626-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA67961A16
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 00:41:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtjFy57Vlz2y8B;
	Wed, 28 Aug 2024 08:41:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=145.40.73.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724782647;
	cv=none; b=KbEb+1weTMDmyXPdgP/pZWjZVBgyEzl73zV5ZihEMireA1eTL1krRAP442IEfPIaB/TkIwlufSfJGCVbMERfSMGo66encLSpGRgsWclS+ykuT8yJKnn6HuXLTT4jqdotwm9z8Ctgz2647znWi5JgYCFoyEdqR9dFkaogz8whmt+GkFGVt7ExkjKf8vusp3DBpB16JxYhttwBaMmx0jsIBb45b0S39L2CHSANLqwzIG5k6PfGwOJG0CjcwnKnW5lNzG2oo+qLiR0yGSqMi4E8AuTvPL5EajAvAJv+L3PldMac26nomyEAH3syZg3nhzR6bEhIRuSR98iT71mI8EBkWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724782647; c=relaxed/relaxed;
	bh=HxRN8IVRxXWkwsi5oS0C98gDT/DBYSFNVRgdUtUg1Lw=;
	h=Received:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=DfoZyEWFFHo03kcFr4wywcrHl+JygrJfuO7oyPcwoA8eGavHuOAxv/tGqmQ68OqH6p2TewSBnrHxa09Jfhc01GdKmDV+Gn21hQR8xTpHc0ZGZ66vl3tAbfsmyPTc4O88wBE4kXKV6Rbw265A3r+WMEPxF9gDVrMMPzEQRSV1yLoy9AD5McoSK+RY4XqRm++eGcSpzFbiYqgeBHz8fVOwrdO8DhCeIE5SOkRJqKSDheNvlvxfA+q8LlIDBKYFQxNF1KE7CS7MxcjHmdKrRa7fpBaN+abat4YRR1+GlGlF3u1iU7lVL5PvsjVS9erxm0M44do10tJCWfjXLbJBD0+olQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Bgh7QaJ9; dkim-atps=neutral; spf=pass (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Bgh7QaJ9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WtbP31LNzz2xtt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 04:17:27 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0876DCE13CD;
	Tue, 27 Aug 2024 18:17:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 370C8C4AF10;
	Tue, 27 Aug 2024 18:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724782102;
	bh=6hBH/a+6Kb1AQJN1JkfkjXJwDxg0hGfZVyT/Iju2lR4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bgh7QaJ9At5jwNoKRhsGjGTLpqH2NoHSb2onT69lZKBrg6CFCpd9gW90r+2SgwoH1
	 0GNU4qRapNNxdtmhiz3gWa+ujq1IlqUkuBPyYN3ra/qXrZ51OrQfDbuWTOriF3MI3u
	 D/yRZfDOKHd3jb7eCXPIUIavEbn8irtpxQkNslY60M5/ftSYmc8YqwalTCS07pFCI3
	 hj06bAOcQeuQyIFdQ/UkeCFRVRQdnqRPRyQII4nQgYX/4hCQ0YgW5DKAY2h7ICJxTi
	 hD0WPmdZfDXifp12pn1RQcW0W7HncOytAz6KIA0c9HrIIszfZzaAXECJrebhNctsMW
	 /jqTscusJynDA==
Date: Tue, 27 Aug 2024 11:08:19 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>, Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Theodore Ts'o <tytso@mit.edu>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
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
Message-ID: <20240827180819.GB2049@sol.localdomain>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5deb67090b214f0e6eae96b7c406546d1a16f89b.1724309198.git.christophe.leroy@csgroup.eu>

On Thu, Aug 22, 2024 at 09:13:13AM +0200, Christophe Leroy wrote:
> With the current implementation, __cvdso_getrandom_data() calls
> memset(), which is unexpected in the VDSO.
> 
> Rewrite opaque data initialisation to avoid memset().
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  lib/vdso/getrandom.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/lib/vdso/getrandom.c b/lib/vdso/getrandom.c
> index cab153c5f9be..4a56f45141b4 100644
> --- a/lib/vdso/getrandom.c
> +++ b/lib/vdso/getrandom.c
> @@ -4,6 +4,7 @@
>   */
>  
>  #include <linux/minmax.h>
> +#include <linux/array_size.h>
>  #include <vdso/datapage.h>
>  #include <vdso/getrandom.h>
>  #include <vdso/unaligned.h>
> @@ -74,11 +75,15 @@ __cvdso_getrandom_data(const struct vdso_rng_data *rng_info, void *buffer, size_
>  	u32 counter[2] = { 0 };
>  
>  	if (unlikely(opaque_len == ~0UL && !buffer && !len && !flags)) {
> -		*(struct vgetrandom_opaque_params *)opaque_state = (struct vgetrandom_opaque_params) {
> -			.size_of_opaque_state = sizeof(*state),
> -			.mmap_prot = PROT_READ | PROT_WRITE,
> -			.mmap_flags = MAP_DROPPABLE | MAP_ANONYMOUS
> -		};
> +		struct vgetrandom_opaque_params *params = opaque_state;
> +		int i;
> +
> +		params->size_of_opaque_state = sizeof(*state);
> +		params->mmap_prot = PROT_READ | PROT_WRITE;
> +		params->mmap_flags = MAP_DROPPABLE | MAP_ANONYMOUS;
> +		for (i = 0; i < ARRAY_SIZE(params->reserved); i++)
> +			params->reserved[i] = 0;
> +
>  		return 0;
>  	}

Is there a compiler flag that could be used to disable the generation of calls
to memset?

- Eric

