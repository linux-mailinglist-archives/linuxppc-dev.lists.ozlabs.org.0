Return-Path: <linuxppc-dev+bounces-530-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DCC95EDD4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2024 11:57:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WsmLk2Cl5z2yLg;
	Mon, 26 Aug 2024 19:57:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724666254;
	cv=none; b=eInzXEPqwRAy2iyPdxm2Ve3t/PRGHpTjKa5geos/1APpLchOG1T8mvCH9dbtLRAV9BeMibMregH9eMBOlvKK9uKzF9N4mn6LD9RssaiV8tr4fevswuqtlaEKUrRfWvRX4kJaOU/wZjYypsvOb8w96ohn6PJ6jl1e1R38F8HtJ/CuysAAd8+iX0aS599z1PtysY5wndUo8pKFy/FmLcdyTyKZ5a5xfYEUh8fDyzXwJ159c2nS27Hz6+U06f/fbvSjXykMKLyLKsENPDQH8r4KITJARcya3FEKqvPc5syl48qLMzQYcQgu6Xive1mhwApS8ANQ3Wui8MeA4c1eS53Wpw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724666254; c=relaxed/relaxed;
	bh=awbUvn+zcUaAMzrxEX5rtv3K5X2zJKdTxDK7qFVNC2A=;
	h=Received:Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=U9vhdEV7hcw//YQY0cyKSzc9E0TrkT02UMi87sAQYUxxwOm/AFDQSXv6f9iHTzib5HvpiJJjWqYs8u1yqqMU8FFmJ0qpBOQW+yWORaoTjf/nsYDm0/RhEuXpevLj4MKkapUeAhv+kd5NKiMyKASk2NHnqQCoaMSxLydpzq/B9IpvcxIGtFTLcSV1XIhdYML6OVE0otY54OYFNd70JUixlDfw1AJFBb1updLVevzHF84/rVG1c4/w6G7gig7mHzU7DwsNMB9ZGOJt+SrLwG2jmNyU26xRoi5knwlNVjBYNGgQIqBZU3DO7OhEg+3kZuTOi3MThM6MSXxVs+1jIW5KXA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com; dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=Ra8Bb8ep; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=srs0=kq7x=pz=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=Ra8Bb8ep;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=srs0=kq7x=pz=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WsmLh3dDxz2yDj
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2024 19:57:32 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1B05DA4213F;
	Mon, 26 Aug 2024 09:57:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E668C4DDFF;
	Mon, 26 Aug 2024 09:48:13 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="Ra8Bb8ep"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1724665691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=awbUvn+zcUaAMzrxEX5rtv3K5X2zJKdTxDK7qFVNC2A=;
	b=Ra8Bb8epvfQUmYF44p8hCwYUkMlgxSsvYepqJe39nrmzRZFcnxDHLnhWhQSSslCM/8qTGm
	rJoy82h0Gs73r3V0WNG+Y+HRCD3DemC+gvIEye0QFf8acyKnRI2qG/QH8beDx5lMQRczDQ
	B53l/X4IZqTFNqiIK/LddaNIyEDciAE=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 97e8236b (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Mon, 26 Aug 2024 09:48:11 +0000 (UTC)
Date: Mon, 26 Aug 2024 11:48:01 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>, Andy Lutomirski <luto@kernel.org>,
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
Subject: Re: [PATCH v2 06/17] vdso: Change getrandom's generation to unsigned
 long
Message-ID: <ZsxPUXq0qo4MPDbW@zx2c4.com>
References: <cover.1724309198.git.christophe.leroy@csgroup.eu>
 <525b48eb79978ddba2d1b8ee23b27bd6c5b0b4ee.1724309198.git.christophe.leroy@csgroup.eu>
 <Zswzu1l3xO99KN3I@zx2c4.com>
 <7d58be73-a8e5-4ec7-bbdc-238b0c25c77b@csgroup.eu>
 <87v7znd3g4.ffs@tglx>
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
In-Reply-To: <87v7znd3g4.ffs@tglx>

On Mon, Aug 26, 2024 at 11:43:39AM +0200, Thomas Gleixner wrote:
> As explained before, there is no problem with store or load tearing on
> 32bit systems because the generation counter is only 32bit wide. So the
> obvious solution is to only update 32 bits on a 32bit kernel:
> 
> --- a/drivers/char/random.c
> +++ b/drivers/char/random.c
> @@ -282,7 +282,7 @@ static void crng_reseed(struct work_stru
>  	 * is ordered with the write above to base_crng.generation. Pairs with
>  	 * the smp_rmb() before the syscall in the vDSO code.
>  	 */
> -	smp_store_release(&_vdso_rng_data.generation, next_gen + 1);
> +	smp_store_release((unsigned long *)&_vdso_rng_data.generation, next_gen + 1);
>  #endif
>  	if (!static_branch_likely(&crng_is_ready))
>  		crng_init = CRNG_READY;

That seems like a pretty clean fix.

> But that's a trivial fix compared to making VM_DROPPABLE work on 32-bit
> correclty. :)

My initial response too, and then I noticed he posted this:
https://lore.kernel.org/all/315e3a268b165b6edad7dcb723b0d8a506a56c4e.1724309198.git.christophe.leroy@csgroup.eu/
If that's correct, maybe it's not so bad, at least here. I haven't yet
looked into the details of it.

Jason

