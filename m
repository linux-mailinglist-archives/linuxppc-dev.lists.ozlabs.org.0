Return-Path: <linuxppc-dev+bounces-523-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D643295EBC2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2024 10:23:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WskGJ4Jm9z2yGM;
	Mon, 26 Aug 2024 18:23:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724660616;
	cv=none; b=kiEkC1GuP71dYdfHt038fo9y4WF/qVchgM/G+7uk7q8psbi4OXlUImpHm+fUQk7OtjVJF8Qy0+yA92ocZGfMQ82cF9NHHdyJD+gZR0H+DjvKr70+7kkWNrk5OKW2K56wsPtpH/bhdVzO6XLfni0A2ecdtGxkkwcRohvXgy2+97UoaJ91Znz7niWhpVOrSKf6DsmadsKUyawM/ytL2NCwGLZCc80OZbnfv6B5mqRMfD+35vSIYRPGkHJKWOMQQxsMY0x6qm6UhWV3sEYTjeQu9RRpW5CyFgv2lWKAXTt9wxeDogT+42XHDZdnBYe8BrzTWAGmwS5M1HFNWo4rhQQkuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724660616; c=relaxed/relaxed;
	bh=qkFrjwbdGTStl7OVlIXz1n12hbxUuy9LwHmcEdC3iMI=;
	h=Received:Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Zddw1wyKSiFKqeYiOj2GtuYN6GrejomFj5/+49KrBnv5o5xzPxlxu+RQ8ftH34KI7oQRZ2kPC/KNTLA6wX/q63cqVhvg7R778DTKwwDTe8NjKXTpU6hpdiUFKt8Ogox3Umz/KhmDTA8IJ6Lldqcpk+wE76mhFCvcgfq1FWlUlbTg/Bjb11B4eX5Rwo8+G1LVG6X5QC53a2YSSoRRqK5GbQ3tdfbg1Mq7qRVTbU8gJXBD4t5V5nqtM/h9gdQ/62wmpd2tk4/7I96F1s7eP5Z5yygMR5K7RmkgNcNP4y8pyaMfTg1O/IV/10RVcPGyuVbIoVbLh7m38TKF0kXSGRipBw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com; dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=otTIgrC+; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=srs0=kq7x=pz=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=otTIgrC+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=srs0=kq7x=pz=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WskGJ2ZB1z2yFK
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2024 18:23:36 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5D256A41FA0;
	Mon, 26 Aug 2024 08:23:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4163C8CDC1;
	Mon, 26 Aug 2024 08:23:31 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="otTIgrC+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1724660610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qkFrjwbdGTStl7OVlIXz1n12hbxUuy9LwHmcEdC3iMI=;
	b=otTIgrC+soX/VqUWzpk/m1mnp5EFDbirwfJwWcvktux0MKC8gvCukjU40UHEqN77mMAbLr
	7OSc7RG8dxenJKS4pZoRfAhfRbt3mFK0RlApFAN8AAbeWZlsVTEjG7PeL6jPUY08oeTk5F
	/KFMChRXYVZaKTmepPvIcM3dCYTkmvc=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7287b5b0 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Mon, 26 Aug 2024 08:23:30 +0000 (UTC)
Date: Mon, 26 Aug 2024 10:23:20 +0200
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
Subject: Re: [PATCH v2 00/17] Wire up getrandom() vDSO implementation on
 powerpc
Message-ID: <Zsw7eP_X_Vw4FOm3@zx2c4.com>
References: <cover.1724309198.git.christophe.leroy@csgroup.eu>
 <Zswsennpw6fvigVh@zx2c4.com>
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
In-Reply-To: <Zswsennpw6fvigVh@zx2c4.com>

On Mon, Aug 26, 2024 at 09:19:22AM +0200, Jason A. Donenfeld wrote:
> Hi Christophe,
> 
> Thanks for this series. There are quite a few preliminary patches in it,
> before you get to the PPC part, which fix up general build system or test
> harness correctness issues. Since some of those affect all architectures
> that are adding vDSO getrandom() support for 6.12, I'm going to take
> those into my random.git tree as a fix for 6.11 now, in hopes that the
> new archs can mostly go into arch trees without too many tree
> interdependencies.
> 
> So I'll reply to individual patches for that, mentioning which ones I
> extract.

I've committed a bunch of these to:

    https://git.kernel.org/pub/scm/linux/kernel/git/crng/random.git/log/

For a v3, if you rebase on there, that'd make things easier for me to
keep picking patches that I intend to send out for 6.11-rc6 later this
week. And then hopefully your 6.12 ppc implementation can just go in via
the ppc tree with my eventual ack on the crypto part, without needing
these interdependencies.

Jason

