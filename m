Return-Path: <linuxppc-dev+bounces-1917-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC65997DB6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 08:54:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPL915zK5z3bhg;
	Thu, 10 Oct 2024 17:54:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:7c80:54:3::133"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728543285;
	cv=none; b=Nyr7vheGbieJNFzfy+mzwlY2D9llo0BMQU6ZNEIKiFAvsMqa3+1WXYHxu7oupZDOES9XeMqbik334cXg/p+dpkr3o8BU/Kj5ps4GVJsNYTaDZjQy2ULeWnkSGWWrC94aEyWW/GeVCALH/SuPchvszcKYpnydNeJDVVePzfWsFy98z8Hz6JrTXchZGH1Qi3m4TB0mIRSPsL87EF4Af2XNf9+Q5ApPkoBssKNDrGmBSkHZ0MqDkf9Rz6Lsj/GKWeVsCOTZhoxoQwuIOXDClGrt4VGQPEPZCHQ8RoyqVBm95kz8fmPaohM7OtPKjkTDKTq3Hc5/LVbc0ig1HUAdKQne8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728543285; c=relaxed/relaxed;
	bh=l9uqvIs7KaBM8jKZiiP+47rSYlM+HcdGDx8MG0uieP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FmD4YQKyVxhFyAN+G4zDGpZWGBJAYnm8vDEGkmxYwnNZb23gbyqKr815Er2kLxp+Uuat4b/t/zOaZLvfVa/usGrzZzKYHV6P1MigeCah/I3m0ZZCvT2NEPx1OTRXoa7MLHP75KMvJhPEFCH8RgIbvaL4tys5s/Rzz/u1kQvLpPL4NJ35rAWPux55xlzPUbk+fA1AHHXMTArk83XEtGpZnDQVSvqRlX9dYiiWE0Jq9Nw3KG7GMeCtf9UJFnrtn956w62/Ue8KkcxNnTM55cM2Z4hSI/ZqKQkHxKZh5EU9h+dIGlC2926yrpPQwOsP+RiRw7MEPWRaxmSeAUo+kGjlgw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Pkikn0l9; dkim-atps=neutral; spf=none (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+13eeef5fd6cafc46e7de+7718+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Pkikn0l9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+13eeef5fd6cafc46e7de+7718+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPL8y0V27z3bhC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 17:54:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=l9uqvIs7KaBM8jKZiiP+47rSYlM+HcdGDx8MG0uieP0=; b=Pkikn0l9YV6IbkwdMYYYCh7NS0
	+bbHbF45MU5mE1Rb3r9FII7FXayka1iyxVG7DxF8G4bp4UvbmBPvBXdRuLXOELz0YXQIDC8U5Vn/Z
	p9TLWCXHDeIkv9jMspqGVrsh6ZAZflPmbSh+0Buo8JVPN3NtIEsSbcNt5fO4pYKDvwm0BaYhbAo+N
	oNRfxee9fN9eH5HZGZktQTD2xofG2NZkmjD02X0R0ddOsfVe32xN+q0mOP5NTLyXNDy/F9gYSQgQ6
	a6T7FZrz/gQpO3gePE4DR+RzB3Q5ElwqokanAq8dbu2GoF4JKzdy2n24Yyu3ivAljHZfXKQHFYvVQ
	fygr48vQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1syn3r-0000000BkI0-1JPh;
	Thu, 10 Oct 2024 06:54:11 +0000
Date: Wed, 9 Oct 2024 23:54:11 -0700
From: Christoph Hellwig <hch@infradead.org>
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
	Luis Chamberlain <mcgrof@kernel.org>,
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
	sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v5 1/8] mm: vmalloc: group declarations depending on
 CONFIG_MMU together
Message-ID: <Zwd6EwZ67lC3oxZ2@infradead.org>
References: <20241009180816.83591-1-rppt@kernel.org>
 <20241009180816.83591-2-rppt@kernel.org>
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
In-Reply-To: <20241009180816.83591-2-rppt@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Oct 09, 2024 at 09:08:09PM +0300, Mike Rapoport wrote:
> +/* for /proc/kcore */
> +extern long vread_iter(struct iov_iter *iter, const char *addr, size_t count);
> +
> +/*
> + *	Internals.  Don't use..
> + */
> +extern __init void vm_area_add_early(struct vm_struct *vm);
> +extern __init void vm_area_register_early(struct vm_struct *vm, size_t align);

Please drop the externs while you're at it. (one more down below)

Otherwise looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

