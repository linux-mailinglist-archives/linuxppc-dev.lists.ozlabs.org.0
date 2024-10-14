Return-Path: <linuxppc-dev+bounces-2182-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE40999BF91
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2024 07:56:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XRmgd2g3kz2yFP;
	Mon, 14 Oct 2024 16:56:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:7c80:54:3::133"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728885373;
	cv=none; b=Urvnyl60UsrGlepF4KUicAqwJpaYZmgWqyXi+gL9DzFc3HRZovjbGFMB09DNpwMBXNZykYp9kAkT5zfxiZtudijIIroLEZMpSu5e1lVL8VfI1u1z9biHSCUVx0SNCg4PWYTHJN+/klbN20TajRb4D/vYryfNWi8/qVRZsJdTeAGkY/NXHQoSXT3AXMWkYr7xiKct3cuBD0edrMaVumDJW4kkG1olYYS0ck3YBX/BnFPMpamvo6pecb4sA4xlWgYWmJo+EimLno8Tc3NnBqjM7kd4sIZLjltlZ/d9iZu6xGqvM+mlB3hoL+KGroupXS70aU6353tSh3x7T/B/dS7O9w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728885373; c=relaxed/relaxed;
	bh=Go+Bj6RO5KoE/9AfXdF5E8AJBwbpjnqmhBNe3btI6Rc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZsKumzhEvcSvA2emcKdPQzrMCr9CjdfeZ4a7sRkcqX4ezkqYozC0kYlTDBHw/iSIcFXTG4jugTumEvHd5sCuYyK6zAqaDEnBa7T8cQfVwE6lbt7gfUhV6OmEgUmJFX+ppoqBllr8FazpAshF1t0Dy2H4rIRgwkG1Q2DHbBte+vD9y1Xflr35CCQs8JG3tB//t47bMaQZ9hb/lkQCi2cRyFmCq4Ij3Qb041OlUNpDSvbY12YQD4nMDM4Kllm+KtCFcbH4KTRZ7m8XFYtkVKGv4SiplTk6OwlANyaqIzmgZJlxfkP17T2RBW2prCi81XRuDxBDaTf4ebOAuCz7h4y0LQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+f913630adc52fe272e7a+7722+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+f913630adc52fe272e7a+7722+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XRmgT5n00z2yFK
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2024 16:56:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Go+Bj6RO5KoE/9AfXdF5E8AJBwbpjnqmhBNe3btI6Rc=; b=UPElqyPBVcONi79QDgqannuJ8k
	ekzP13+lCLTRhjd0RsBuUuriQn6L1+7+jerZ1u5Al3QyEt2FMS6WglOqiIYRCPC95h6PrTwqF1ts1
	PWmrnzZCq2mL/K2dLXqaDd0RIfbpc0hidVHfW0hcI22NMksrAuiLCJAmBG9DiAs7alHiLyDNNsuur
	7HBzQHoIIH7RZPA4xv39sBtQ8TSlScwbjH674t/7hgNk4DsM7Le91HXSmKrDHUWLH9r8jJFF0mMPK
	mItE7VNi3UiGgVL10orTJc1Q65Ko0/nDG04GKlm2B+fPRKXh4xsGm9A5xgah8WKUspiWy5w5SGuhw
	kNW8vO1A==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1t0E3B-00000003o4s-2PYe;
	Mon, 14 Oct 2024 05:55:25 +0000
Date: Sun, 13 Oct 2024 22:55:25 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Christoph Hellwig <hch@infradead.org>,
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
Subject: Re: [PATCH v5 7/8] execmem: add support for cache of large ROX pages
Message-ID: <ZwyyTetoLX7aXhGg@infradead.org>
References: <20241009180816.83591-1-rppt@kernel.org>
 <20241009180816.83591-8-rppt@kernel.org>
 <Zwd7GRyBtCwiAv1v@infradead.org>
 <ZwfPPZrxHzQgYfx7@kernel.org>
 <ZwjXz0dz-RldVNx0@infradead.org>
 <ZwuIPZkjX0CfzhjS@kernel.org>
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
In-Reply-To: <ZwuIPZkjX0CfzhjS@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, Oct 13, 2024 at 11:43:41AM +0300, Mike Rapoport wrote:
> > But why?  That's pretty different from our normal style of arch hooks,
> > and introduces an indirect call in a security sensitive area.
> 
> Will change to __weak hook. 

Isn't the callback required when using the large ROX page?  I.e.
shouldn't it be an unconditional callback and not a weak override?


