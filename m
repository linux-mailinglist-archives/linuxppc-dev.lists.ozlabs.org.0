Return-Path: <linuxppc-dev+bounces-1919-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C6A997DC9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 08:55:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPLB05Qp2z3bkY;
	Thu, 10 Oct 2024 17:55:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:7c80:54:3::133"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728543336;
	cv=none; b=WW1OMfExPv7thMCbU0LFRbjhNc0AzADty/QVkt6eULSvoeZyPHSzXMh2ESDPnpghsMrvvKypS2Rku63xSAmCbscJsy8xcBlS/ro/A076KNPkKefZ+WRrjUe1zOfxN5klBL3FmlnRC3Mb9MtTNCTAZI6PuJNr7AfbZINJTRUILD03mM08a0pXvb1LQOLjoDWJ4g6z6Vx4i5ZjBa29eQWK/mvqWlxLTArYhEYZgdyt0rAPHR7TvW9K4baOsL1O7KV2IuLIbfhbkgkfd9tH2GhyYIyOfwuMDd2KJI81SA/1G1nIn+KlAxACcyL0t+6m4kYIsQoa4COFR/NPnuW72NC62A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728543336; c=relaxed/relaxed;
	bh=8vtORy0H6u6z+tjJaKPwCvPUkhCezoj8V2+exdGbyCw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=koGm05Y1wXoITkQF47ytNehMZb7SjmrAIC0fHpjvC+0pE6zmW/l1yl1ulbA1RAubQOnFbwv8JWDChM6484hIjC8gIW9ALsli5KgoanTvbvWkk7VGVJ/kOPwQbmMr/T80ztFe60+/v3bU2kmzCWUCRUQorjQeKjqqbtTdDNL/25EhEUjy+ts6B1vBGs6PHJ9BaIsr+zGHAO8QPpohLC8aAQI9cFqgrbB5KbpMQkluZ8K2Vg7iU0Ep+85R8UDPWg5y5bn4tO7a4eQnvFxm/kcfRyKhwaLCF/QknLmiOjEmpk4lNK/VsT+2HFL4VivR13oxxmyEH6hGqvAs7Xngwme+OQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ioGVzEYs; dkim-atps=neutral; spf=none (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+13eeef5fd6cafc46e7de+7718+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ioGVzEYs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+13eeef5fd6cafc46e7de+7718+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPL9z6y6Bz3bhC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 17:55:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=8vtORy0H6u6z+tjJaKPwCvPUkhCezoj8V2+exdGbyCw=; b=ioGVzEYs7yzrKHTxsptDr013N+
	JA9LU5cIa2JPQoqkmXlCjXl3q/q4tB1nLDvCIin1oLFq5Fr2seX3Pvn1u2IdvPgebZPJl2Y9aRwhA
	q0+2xezoBdAI3/fPk0xbIteBXjQ7k5vQaY8oGpPaxzzNdhPtFNx9jJjKGcSz3OGa9AxT9pUHV06nF
	iD9U11taDM8OITZScqbaXDzw81w3BVe3eb51n7bb7c9CmATyXXddQ8Y70Nlb9s1rNj2JsY8uJFqY4
	rLfVkhhmGbWAUjhRHq7JtOroqSJbGaDNp6+AScWEOjDrgmJvaLmoYiRPNr4S3tpeL2YcQyq7KGL2s
	W3+7A9sA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1syn4w-0000000Bkcx-0Cev;
	Thu, 10 Oct 2024 06:55:18 +0000
Date: Wed, 9 Oct 2024 23:55:18 -0700
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
Subject: Re: [PATCH v5 3/8] asm-generic: introduce text-patching.h
Message-ID: <Zwd6VgdeGXQByUfi@infradead.org>
References: <20241009180816.83591-1-rppt@kernel.org>
 <20241009180816.83591-4-rppt@kernel.org>
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
In-Reply-To: <20241009180816.83591-4-rppt@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Oct 09, 2024 at 09:08:11PM +0300, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> Several architectures support text patching, but they name the header
> files that declare patching functions differently.
> 
> Make all such headers consistently named text-patching.h and add an empty
> header in asm-generic for architectures that do not support text patching.

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

