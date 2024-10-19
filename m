Return-Path: <linuxppc-dev+bounces-2425-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 535509A5162
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Oct 2024 00:30:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XWGVx0HDGz2yMX;
	Sun, 20 Oct 2024 09:30:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729377048;
	cv=none; b=hmlJ+UXqXqAaP/ng3jZBPpfQEpaKSCkqvZ7gJliIdyVwzJPOrNZnRZ4dG0mzuroSVIv2NklQZN48bJRH1pl5z6D4YFLdhWtAkDFqTn0+xlb9KzaW24wnfHrR397vFFDajmWHIxR0ipzJ7gd7pXX/oNWg+cEwcoUOLdkMbc0nsVobmmuN3zEx7qnh0/MNrXh/FYp4gV8WWLi+ljOsnReP4Hnmtru1AuI2F29z1SSwrhapmA3Rv6lI8F8F0cYqIg93y5rRcLGpqs5reV6Dmel+aPfcfJ7J57fICMYvrbus3PwpLMUcYytewGLg0y+F1udTAl56mRzVZjWu76I9I6I2zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729377048; c=relaxed/relaxed;
	bh=VuHy1HrHdhUjSm/D9WaG63hW9NcA1Axd/7XrPQvY+Bo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D34ku3R2UL6zS05C38kdWVag92xa/tuW273VD/8v6AMavA353XhGAR2ajmEiCuV6LtRTxaNHEY1tVCeTK8lJaDeWsa9RMpBEfcSTGF2QAFf7cIEjTke9BxWQBpWTAnC+PH2ZmToxYbB+HvlVwwyrdwllQYga26r9N5JdTztixgMK6FB9BPjyrLNPcf+EFWpk1I9PfqlBxBALN2CuLCoGVddRChV2Cb6Q5XeCwKURUcKFvzT0WXOVO0UBT2Swz057Vw6V6Xp5hdF2mSyodizHLnwqjgyOeNQ+bwJXB5d7d1WKpEgYguHTeKcL8mujqvhm8rY5H5xxyCRb7dpD1FF7Bw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CErL8/nt; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=mcgrof@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CErL8/nt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=mcgrof@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XWGVv6B3xz2yMP
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Oct 2024 09:30:47 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0111FA40448;
	Sat, 19 Oct 2024 22:30:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF36EC4CEC5;
	Sat, 19 Oct 2024 22:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729377044;
	bh=QyfIXk+096xDFBJfNhGtA+h7+x144NJyXqGZEWCxEbA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CErL8/nta/6r/1WJkkwG/t5evnd+rztuMKPvEAcvD2SnHlbG8tiM8oebQum4YnbtM
	 jKRTZBaC+ATcd4VCxL5682bSGxbHvqjRzPrn6cR/xecdWEBWr3gweQycvt1RfyCGs7
	 MiXNOy+V4Fewi4RfizJAsZmsup5CQWNXqWmaamyVMyXGW/hUqx3sW49nhqNlGd3ZzY
	 ETj4BkT4BYSwhfn/AQ96YSvs+Sq6IlTIlZXVNMpeHMX+0ZQjv+FZRA/RKrz+t3dZ4u
	 1qH1N38SWuCE3fte75V0TIkKwCKF9lts668sBgQlwW5eAV1dEKJXhxg+1WEdnmmBQI
	 jKYmcc+lcknEw==
Date: Sat, 19 Oct 2024 15:30:41 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@quicinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christoph Hellwig <hch@infradead.org>,
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
	Suren Baghdasaryan <surenb@google.com>,
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
	sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v6 4/8] module: prepare to handle ROX allocations for text
Message-ID: <ZxQzEdJqU6TCEH5f@bombadil.infradead.org>
References: <20241016122424.1655560-1-rppt@kernel.org>
 <20241016122424.1655560-5-rppt@kernel.org>
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
In-Reply-To: <20241016122424.1655560-5-rppt@kernel.org>
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Oct 16, 2024 at 03:24:20PM +0300, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> In order to support ROX allocations for module text, it is necessary to
> handle modifications to the code, such as relocations and alternatives
> patching, without write access to that memory.
> 
> One option is to use text patching, but this would make module loading
> extremely slow and will expose executable code that is not finally formed.
> 
> A better way is to have memory allocated with ROX permissions contain
> invalid instructions and keep a writable, but not executable copy of the
> module text. The relocations and alternative patches would be done on the
> writable copy using the addresses of the ROX memory.
> Once the module is completely ready, the updated text will be copied to ROX
> memory using text patching in one go and the writable copy will be freed.
> 
> Add support for that to module initialization code and provide necessary
> interfaces in execmem.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Reviewd-by: Luis Chamberlain <mcgrof@kernel.org>

  Luis

