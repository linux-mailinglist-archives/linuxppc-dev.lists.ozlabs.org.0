Return-Path: <linuxppc-dev+bounces-1071-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B21596E541
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2024 23:44:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0CYL09x3z300Y;
	Fri,  6 Sep 2024 07:44:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=89.208.246.23
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725556162;
	cv=none; b=b/ZMtMYiDFxt4wQ05thwVUYcSalKZNTILrIE9Omn/hnugqrM4GyyzmTpMSj2ch8L9WbcSuuTgRWhEqBryj9/xV7RKsyBkWXSNvC31v7VZpIYN9VXQdIblpVJoOGTXpD/cBBOMaY091sdjhkoad99HXC6uXezGvYZOGm8k64wLwpsGfDQ7Y2laUO8+v0//YrOXBBeG0IuajbXsSPIKWGFMfBQdEXz6AeiYq679zxpS1jgHaZ9t8EnzH9AaAsA7xHTQBCeq9UJyvP1OMo9hoc9/BhhMWXhak7irrLrqaS6dTuIjVOFq1iHRJm0tkLLLgpW5LyU8D4+stCdBxOdOSBSXA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725556162; c=relaxed/relaxed;
	bh=m7o5UxMVj4tZHSmvKnKAAWvKE9fBkiFe1G6UTAXy5Zo=;
	h=DKIM-Signature:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:MIME-Version; b=FakzUtpUEuHAA3RJ3iIGjgTorakiHa0ce2CexB+PJ+FpfZXy1r/+GiuKES4EVfQw+i+hLOYxASd6OeCxTM1vVTdg2NxmgNa0RXhiIhdwMgq5jMUzse/Uojz0FTu5Pu88d2voQrib90H5wuc/l2eT/YH7FCRa618BmCrVioFiYi/vi1p1yYDShjdGcYegNJF6pQrxYn3IPlOD2MhzoPSz2bYD39e8viDPoA1Rzh77jVHvoVIUN+InAcUmdpJZQNAEDg0bJcq1RIN0Iv9EYBugIJoKpK6nAdzArfVG/zAVpFx/jVfjpjph770M/IPwJphN/iU4mN+17ZP23nU4sl1Ekg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; dkim=pass (1024-bit key; unprotected) header.d=xry111.site header.i=@xry111.site header.a=rsa-sha256 header.s=default header.b=eQnfTq5B; dkim-atps=neutral; spf=pass (client-ip=89.208.246.23; helo=xry111.site; envelope-from=xry111@xry111.site; receiver=lists.ozlabs.org) smtp.mailfrom=xry111.site
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=xry111.site header.i=@xry111.site header.a=rsa-sha256 header.s=default header.b=eQnfTq5B;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=xry111.site (client-ip=89.208.246.23; helo=xry111.site; envelope-from=xry111@xry111.site; receiver=lists.ozlabs.org)
X-Greylist: delayed 466 seconds by postgrey-1.37 at boromir; Fri, 06 Sep 2024 03:09:22 AEST
Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X05SL0w1xz2ykf
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2024 03:09:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1725555689;
	bh=m7o5UxMVj4tZHSmvKnKAAWvKE9fBkiFe1G6UTAXy5Zo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=eQnfTq5BofF4mjxLeycsVbeLthlkeKdeBFy6kb6apgzF2KPRhoEmrbxm4Pt15YLpl
	 J6AB/gQdRsAEdR8B/fS5bK1Z52/xaWinCKV1s5TaL2dGA47Vu0O9PMHDxdnygC2BBV
	 GpYLCmIMD28MIbLsPfcXaLYXxb10KQbzRkrANP5U=
Received: from [IPv6:240e:358:11a3:ba00:dc73:854d:832e:2] (unknown [IPv6:240e:358:11a3:ba00:dc73:854d:832e:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 9F4141A3F87;
	Thu,  5 Sep 2024 13:01:18 -0400 (EDT)
Message-ID: <edd9356165393818b4f1c9d4a4f3af4e561127e5.camel@xry111.site>
Subject: Re: [PATCH v5 4/5] powerpc/vdso: Wire up getrandom() vDSO
 implementation on VDSO32
From: Xi Ruoyao <xry111@xry111.site>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, "Jason A. Donenfeld"
	 <Jason@zx2c4.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Steven Rostedt
 <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu
 Desnoyers <mathieu.desnoyers@efficios.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao
 <naveen@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, Shuah Khan <shuah@kernel.org>,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kselftest@vger.kernel.org, llvm@lists.linux.dev, 
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
 linux-trace-kernel@vger.kernel.org, Adhemerval Zanella
 <adhemerval.zanella@linaro.org>
Date: Fri, 06 Sep 2024 01:01:13 +0800
In-Reply-To: <85c02620-e8b2-4c97-9905-685a9a4e556d@csgroup.eu>
References: <cover.1725304404.git.christophe.leroy@csgroup.eu>
	 <1f49c2ce009f8b007ab0676fb41187b2d54f28b2.1725304404.git.christophe.leroy@csgroup.eu>
	 <ZtnYqZI-nrsNslwy@zx2c4.com>
	 <85c02620-e8b2-4c97-9905-685a9a4e556d@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0

On Thu, 2024-09-05 at 18:55 +0200, Christophe Leroy wrote:
> > Normal single thread
> > =C2=A0=C2=A0=C2=A0=C2=A0 vdso: 25000000 times in 12.494133131 seconds
> > =C2=A0=C2=A0=C2=A0=C2=A0 libc: 25000000 times in 69.594625188 seconds
> > syscall: 25000000 times in 67.349243972 seconds
> > Time namespace single thread
> > =C2=A0=C2=A0=C2=A0=C2=A0 vdso: 25000000 times in 71.673057436 seconds
> > =C2=A0=C2=A0=C2=A0=C2=A0 libc: 25000000 times in 71.712774121 seconds
> > syscall: 25000000 times in 66.902318080 seconds
> >=20
> > I'm seeing this on ppc, ppc64, and ppc64le.
>=20
> What is the command to use to test with time namespace ?

Assuming user namespace and time namespace are available:

$ unshare -r -T --boottime $((365*24*3600))

It'll start a new shell where you are pretended to be the root (i.e. the
root in the separated user namespace).  Then:

# uptime
 00:57:17 up 365 days, 57 min,  2 users,  load average: 0.19, 0.30, 0.32

So in the separated time namespace the system is pretended to have been
booted for 1 year.  Now:

# /path/to/linux.git/tools/testing/selftests/vDSO/vdso_test_getrandom bench=
_single
   vdso: 25000000 times in 0.419125373 seconds
   libc: 25000000 times in 5.985498234 seconds
syscall: 25000000 times in 5.993506773 seconds

This is on x86_64, indicating vDSO getrandom is fine for x86_64 in a
separated time namespace.

If user namespace isn't available (disabled building the kernel or
disabled by the security policy of some distros) use

$ sudo unshare -T --boottime $((365*24*3600))

to create the time namespace instead.  But note that with this approach
you'll be operating as the real root user and be careful not to break
things.

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University

