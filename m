Return-Path: <linuxppc-dev+bounces-2296-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8FA99F7F1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2024 22:12:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XSlcg38Vsz2xxr;
	Wed, 16 Oct 2024 07:12:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729023123;
	cv=none; b=KlrTsJnN8LxgauUjx6T/zCrUm9xJqyGiaNqIi/ruIrAZOlEcUr5v5zKnezEMhgeAuk0qEZutKtaoDs9CGRGFqEKJ1hshbDJtUaVmy+rKCdmTtCMUqUbgEYjNTqtFWFM7A8QuG5VHetjWi8XK2EAJc7jqsbeeyBCr4XHlBUiC8qGST0ajPdf/za1sCd+TYznLVPFL+U1iNuOoaPkCSkiSlGaYAstnwwb819f9xQWSB62zPaa6kMnzwk+t9lFtSLtYia+GhaUozKF/RFyfYWoTWyeh9/GD69Mj37XX/NsqL3chkdxKhGbmG6eNnXJS2LZJmLmG70S87reLdeKOCiXmlg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729023123; c=relaxed/relaxed;
	bh=iiMAAXqZGVF+UDQP59t6sI0bnGKOoWxRfYjjXYs/wRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YIG8Tc2GUz01rYc7cUp+Van4awywPTXZ+oejQc/xxMFKhTI6trruLJwkiuaANBzx7Ftm7HcZKNCTLW2TKL9J3a4jNQptR+rauy0R78x6D18m5daahI0uXtCBezhtDNt3Yorx+hlscyXaEjcOFfTWzC/hK6ifmVrrpmbf/PESIA8HJIqeNOM0qkQzcUEKik6iK0lQgAKH0hNARs1O49GeQTTgXFCipHJf51akUd79QuHdSWPEE8IoJ9QDBeh9NFBdphMKFuToLd1cNkdNQFKqpL5oiyWSshYGpy3dXFiQvcAW1S6DOtjZXQhGzHULl8pjoUxean+wunRI5S3tcZqP6A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NeA6yj5h; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=mcgrof@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NeA6yj5h;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=mcgrof@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XSlcf209Bz2xwc
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2024 07:12:02 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 99C9DA435A9;
	Tue, 15 Oct 2024 20:11:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAB4EC4CEC6;
	Tue, 15 Oct 2024 20:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729023118;
	bh=Y6PhmBa/nN+iDUxTFqcR/Mb33RbOlJl9A4RsS6bV0b4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NeA6yj5hajfLYEdkGLWG8XB5N4aid73nUjDZb/ugsyZ3AQoALVnXt8x2U69teh7bp
	 +Jxn6eME2rpnC6+5s7BU9sn0TueSyVekqQmYatz9jkvCTO794aSB0wivMugKOyBQcF
	 f12fUI4D7cG8AqwuNBz90ooW8BLJGSzfYerkziVJS4gVWwzpr6llRoBCSoxKz8d+Fs
	 0rPGTZgvQEw9IByGG03TdQUKWcviEE7gexwsotoi1Pu3fbgseCJrzYVZZZHzQHsDOS
	 xg878mky4sIBNDtU8Y7CZD0UtD4jLkQQWx+cO7Oq3WKQ8DmXAZc3hC28g+NG7SbCgU
	 uBbk2RUOwLABQ==
Date: Tue, 15 Oct 2024 13:11:54 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Christoph Hellwig <hch@infradead.org>, Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@quicinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Guo Ren <guoren@kernel.org>, Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>, Oleg Nesterov <oleg@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>,
	Stafford Horne <shorne@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uladzislau Rezki <urezki@gmail.com>,
	Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-mm@kvack.org,
	linux-modules@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org, linux-um@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org, x86@kernel.org, kdevops@lists.linux.dev
Subject: Re: [PATCH v5 7/8] execmem: add support for cache of large ROX pages
Message-ID: <Zw7MirnsHnhRveBB@bombadil.infradead.org>
References: <20241009180816.83591-1-rppt@kernel.org>
 <20241009180816.83591-8-rppt@kernel.org>
 <Zwd7GRyBtCwiAv1v@infradead.org>
 <ZwfPPZrxHzQgYfx7@kernel.org>
 <ZwjXz0dz-RldVNx0@infradead.org>
 <ZwuIPZkjX0CfzhjS@kernel.org>
 <20241013202626.81f430a16750af0d2f40d683@linux-foundation.org>
 <Zw1uBBcG-jAgxF_t@bombadil.infradead.org>
 <Zw3rDS3GRWZe4CBu@bombadil.infradead.org>
 <Zw4DlTTbz4QwhOvU@kernel.org>
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
In-Reply-To: <Zw4DlTTbz4QwhOvU@kernel.org>
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Oct 15, 2024 at 08:54:29AM +0300, Mike Rapoport wrote:
> On Mon, Oct 14, 2024 at 09:09:49PM -0700, Luis Chamberlain wrote:
> > Mike, please run this with kmemleak enabled and running, and also try to get
> > tools/testing/selftests/kmod/kmod.sh to pass.
> 
> There was an issue with kmemleak, I fixed it here:
> 
> https://lore.kernel.org/linux-mm/20241009180816.83591-1-rppt@kernel.org/T/#m020884c1795218cc2be245e8091fead1cda3f3e4

Ah, so this was a side fix, not part of this series, thanks.

> > I run into silly boot issues with just a guest.
> 
> Was it kmemleak or something else?

Both kmemleak and the kmod selftest failed, here is a run of the test
with this patch series:

https://github.com/linux-kdevops/linux-modules-kpd/actions/runs/11352286624/job/31574722735

We now have automated tests generated when people post patches to
linux-modules, but if you give me your github username you can push
onto the linux-kdevops/linux-modules-kpd [0] repo a random branch once you
have it ready, just cp -a the linux-ci-modules/.github [1] directory onto
your branch before a push and that'll trigger a test run (you need to
git add -f .github on your Linux branch) with our self-hosted runners.

[0] https://github.com/linux-kdevops/linux-modules-kpd
[1] https://github.com/linux-kdevops/kdevops-ci-modules

  Luis

