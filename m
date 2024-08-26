Return-Path: <linuxppc-dev+bounces-496-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A9795EA5A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2024 09:27:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wsj1J2f0tz2yDx;
	Mon, 26 Aug 2024 17:27:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724657236;
	cv=none; b=dTKpW32KzgyCk6JOGZiNUx1Revnt2Fkey1rTHLslbtyeKTijo0Kz8nI6XorGh8gnkS3aoAqicofSRhHmWnDX304U2nRmpfnzhr2uHA26tBBsPTywSnlOFibd0myB8VUIfpC9a1RuCfvBNTrjaJwMwGRfEsr0Sttiq5GUqkBnsJpfjFWGqvf/T2HWDd8l/60Q/z9FXudgBMGu7YuvOL/t+ldrSvjbGPSyEkJ8aIBW+FAzK4oF2CgIuZppUVyTEdUZJklBE7TtCRDWl42dSoCn6/ccUSJLMbNHzf19U3w7pff3amzqvnWqroH2Qap22UAsFfL6hME7s2g1fWKWqi+QgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724657236; c=relaxed/relaxed;
	bh=5mnxkRlBDghVp+jV0qHPEpLxDRs2U12I4ncTzaWP+rA=;
	h=Received:Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=NomOs5+HxsZrR6H2wktqRNXEkNrThU19rL88CEtudCh9lsxlxjU8B96X7MjXrtPK3VknBj/qfSOveFprjBmpnP1rP3no1QX6veQrm4XSlcuzm84ofdLQrqsCL1BTJ26S8trOZcPoRWn7I+TWHKj6M4h90BpENaTJj+UvDyKI1VUHpBAN3OtMmXGrkrROCK0mpXT8cL33C1lZOzvR24hgzGIO1DOz7O2szjn67hRMW114DLwL6lnHlbjDFpkM3erEBk+mvyx5uuN7A3VJgCRAu3BTjJucMiunpJx/Fqso6zzVHJ3zfmGaStO86ef1U6eKMcSXHW6Z+Yb4GoYReJRWGA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com; dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=j1IJS+MS; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=srs0=kq7x=pz=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=j1IJS+MS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=srs0=kq7x=pz=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wsj1J0t5dz2xKL
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2024 17:27:16 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 35D18A41C59;
	Mon, 26 Aug 2024 07:27:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53143C8CDCE;
	Mon, 26 Aug 2024 07:19:33 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="j1IJS+MS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1724656771;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5mnxkRlBDghVp+jV0qHPEpLxDRs2U12I4ncTzaWP+rA=;
	b=j1IJS+MSiGszC/AZy4D3uJ/andjVajwkIyrQoUshcUHxGJMb2WL2259Af5/W64kkm2vxcD
	jF7007HPkvb2yHXa5A2ZPmhxrqe20+doeNB8UTbSMckIY4tAtJ5hFuP4KW3z7N4l7UroHd
	BfKpnFUeAB/F62oewuRJdbaVwBTyfGM=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 746e735a (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Mon, 26 Aug 2024 07:19:31 +0000 (UTC)
Date: Mon, 26 Aug 2024 09:19:22 +0200
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
Message-ID: <Zswsennpw6fvigVh@zx2c4.com>
References: <cover.1724309198.git.christophe.leroy@csgroup.eu>
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
In-Reply-To: <cover.1724309198.git.christophe.leroy@csgroup.eu>

Hi Christophe,

Thanks for this series. There are quite a few preliminary patches in it,
before you get to the PPC part, which fix up general build system or test
harness correctness issues. Since some of those affect all architectures
that are adding vDSO getrandom() support for 6.12, I'm going to take
those into my random.git tree as a fix for 6.11 now, in hopes that the
new archs can mostly go into arch trees without too many tree
interdependencies.

So I'll reply to individual patches for that, mentioning which ones I
extract.

Jason

