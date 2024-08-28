Return-Path: <linuxppc-dev+bounces-689-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D66696270B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 14:26:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wv3Yf3TFXz2xvy;
	Wed, 28 Aug 2024 22:26:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724847990;
	cv=none; b=YKhDxi6lHhzOqrNqsPFVMcvHG3WBMyc/pNldFjwQSvYU2HsGnVHGi96bEqsd6luZR/WxufudtE2x037+kJY4TRp46ru5+NonorOVFIF+gRGd/Ltlo2p8RMX6Dx66DH2sGIc7xjV/i4dL8kJgkVKRDdF31ciHXLPY5X8D+hw3W2GtJLQtGPjBDfVkEuTDcWMK0t4XxP8yKMCfzC1qIo5H2TsoKwDEWq04v9DF6Ll7VJJ1Ke0uufK+zBFaDXx2W2ZQBZyusBFno6yX3Jmt6YzzD5zDMMhaLMe+H6TWtAxBZbEljeRRegyyzd2Z/P8ogSwstqJq4WMypBpyF4GbQXEDyg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724847990; c=relaxed/relaxed;
	bh=uEFEGqQJQMz8Ub4wy+aep50eWmgdp8pcSL8AmUjJ5J8=;
	h=Received:Received:DKIM-Signature:Received:Received:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding; b=IEnFjxml84cy8DjUMpNWzoO35YnqfyllI2jQ0LQfi2h5/g1kTX0n0JVtnU+dzKYwjsGoK3PXR4y3UlqmeBIAzu5v4czbJb9Qv2nF/oXgzs0XUG+nGeN+PDK0fBkN9Ejmna6hHFTzUYkEofDm/6LKtMHeKW/DNzcPtlQMS0AwseBIjJJJahy8eCdLfsNsKKK8Ij2oKrTNFVP4tC45e397w4pfSWtnwcejP+Et23G90z7zUS0uCZbZ0RTtqrTOVJBi15P9iocIbPahFPIeeEZz+I+CPWQdXpIH0Xu47AuDKFVgFISA8psxt+zNI6W5cxaXMsqtlR7AK77iWO534zXytQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com; dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=pZhFFwvf; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=srs0=8w/7=p3=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=pZhFFwvf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=srs0=8w/7=p3=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wv3Yc59Sjz2xWZ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 22:26:28 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B79A6A402CD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 12:26:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10CEBC98EE3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 12:26:24 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="pZhFFwvf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1724847983;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uEFEGqQJQMz8Ub4wy+aep50eWmgdp8pcSL8AmUjJ5J8=;
	b=pZhFFwvf2+rUCk0mnu74yzuq8D0OlV5RRX3O/pUcL2EJirk1lWLjJ7T+VmJhAB+Nwuqruo
	5w43+j7738kAhUtF/Op+T7PkY55MvhYmMEm2AulNbOZOm5YzBQVDPiZl6Xd1e0lo4jpoA9
	0Tg6/x3YqzwUs/XLZ+j/psnPUsH+3wQ=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9962b8b0 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <linuxppc-dev@lists.ozlabs.org>;
	Wed, 28 Aug 2024 12:26:22 +0000 (UTC)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-27010ae9815so4793336fac.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 05:26:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWoozW+3/GKpCzDAVGVxczcHOTKPuqkDXy66gY9ZuArT2h+X+CgZEHaivwA9raT5zec6epxwvVTqfmZuRo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy2gF6hbSDbIlemSFBUNpe/UiUIihXuY0noMw5oFrG+8pckphOZ
	xmcxBf+KwJyTxhFCouUUOdUHLXwTo6aoIIFv+ltsboAT+LlN0EPfI2jqao36G8tPNuvNrp89ZO2
	cDseVjgCDPyQslMjVM0NPVlW8wxQ=
X-Google-Smtp-Source: AGHT+IHXO1KZEIb1pBgGn7dKx8LC6G7ifrWZYsusE/oKQVZmO1hrOeMVz7hy7j/rnnH9GmqVmjbXApoOhTEeHD761oc=
X-Received: by 2002:a05:6870:1713:b0:25e:bd9d:b1cb with SMTP id
 586e51a60fabf-273e667ed95mr19307401fac.40.1724847980462; Wed, 28 Aug 2024
 05:26:20 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <cover.1724309198.git.christophe.leroy@csgroup.eu>
 <5deb67090b214f0e6eae96b7c406546d1a16f89b.1724309198.git.christophe.leroy@csgroup.eu>
 <20240827180819.GB2049@sol.localdomain> <20240827225330.GC29862@gate.crashing.org>
 <Zs8HirKLk-SrwTIu@zx2c4.com> <fc19bf63-d519-46e2-be70-80202c85ff92@app.fastmail.com>
In-Reply-To: <fc19bf63-d519-46e2-be70-80202c85ff92@app.fastmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 28 Aug 2024 14:26:08 +0200
X-Gmail-Original-Message-ID: <CAHmME9rjH4Ek3e8jmBvRp3wy+mrzJAeYxk5=o+OHjoT5sTOQPg@mail.gmail.com>
Message-ID: <CAHmME9rjH4Ek3e8jmBvRp3wy+mrzJAeYxk5=o+OHjoT5sTOQPg@mail.gmail.com>
Subject: Re: [PATCH v2 05/17] vdso: Avoid call to memset() by getrandom
To: Arnd Bergmann <arnd@arndb.de>
Cc: Segher Boessenkool <segher@kernel.crashing.org>, Eric Biggers <ebiggers@kernel.org>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, "Theodore Ts'o" <tytso@mit.edu>, Andrew Morton <akpm@linux-foundation.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, shuah <shuah@kernel.org>, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>, 
	linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2024 at 2:24=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Wed, Aug 28, 2024, at 11:18, Jason A. Donenfeld wrote:
> > On Tue, Aug 27, 2024 at 05:53:30PM -0500, Segher Boessenkool wrote:
> >> On Tue, Aug 27, 2024 at 11:08:19AM -0700, Eric Biggers wrote:
> >> >
> >> > Is there a compiler flag that could be used to disable the generatio=
n of calls
> >> > to memset?
> >>
> >> -fno-tree-loop-distribute-patterns .  But, as always, read up on it, s=
ee
> >> what it actually does (and how it avoids your problem, and mostly: lea=
rn
> >> what the actual problem *was*!)
> >
> > This might help with various loops, but it doesn't help with the matter
> > that this patch fixes, which is struct initialization. I just tried it
> > with the arm64 patch to no avail.
>
> Maybe -ffreestanding can help here? That should cause the vdso to be buil=
t
> with the assumption that there is no libc, so it would neither add nor
> remove standard library calls. Not sure if that causes other problems,
> e.g. if the calling conventions are different.

From https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D90701:

| You need -ffreestanding but that is documented to emit memset and
memcpy still.

