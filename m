Return-Path: <linuxppc-dev+bounces-2099-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E52BF999E37
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2024 09:47:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPzGw3k1Rz30VJ;
	Fri, 11 Oct 2024 18:47:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:7c80:54:3::133"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728632824;
	cv=none; b=cuGmVMgtPTAPHIG9Rz5ILLWOju2+dzpi/3aanmcvYhqttBUKMZSo/E6v1g5VufdlWgxZF5X7YFiz/+em9E1nNTLey4eILQd6ttrp3HL12v0cUoCkfFJpcN9wCPuz8hqFHoBJW97twSh/mOgiJEHsKhNgkE/7Jlw6KleYO57QBTpJT8S0UNCCODRPKHXtyxPWq6/7kwfe3hqbhFiZB8ONppz24jaA3x+JiyZj9QyTspYcoPImiCyBnu4EM/o/LIMo6JvcKlYvUHlcoM7g8T3PHz9g9RNRQU09oX8ZukDk7OBAJBU7FIBJ+r58jOSdNugoMcUOMOhi/h3ESG+h52vQ9A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728632824; c=relaxed/relaxed;
	bh=HlhUCBO2cgAocJ0jal2+odmhS3fEGMT9ApCG3YBalmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mHitMBw2tLrlJtKC3ZNWlbW1qOzlbS94nIFdTCUgfFfSo43lai2pHlC9fKAfMI2DTNSmqGKnYwJlWoJRhoXOMckHvg02WVppt4AsK5PDHlV9ead0j24Tm3sqdd5Iqa7cMr1loD/dUbmmV4btWrXO0e4gA0xSwFH7/WFZLYGubZMeWs75WAvHhMRXM2PYgvGtltDvQ0xwVd6tljG3AGU4EoSOkSJQIuj/rhuu9svGC/xWkgQ44LpoHLxeH97ziahpaVtH9d9P6H1IdIm0UJfGyd59c5NaWD4GmOoC8/ybrsyATLiWx+0Mrh299n358KfQpHtYJQBNrYrAFflc5mQPlg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+0c28974be301e84ba5dc+7719+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+0c28974be301e84ba5dc+7719+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPzGm4Qdtz2yHs
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 18:46:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=HlhUCBO2cgAocJ0jal2+odmhS3fEGMT9ApCG3YBalmk=; b=RNzRRI+jS+E41pEvv2tM/PBMQr
	SQs+GEy9wRlJQS7LgwXIlsLPiOEfZ0lcfVl/LZAzCmJERr/wrGQx/6Jkm+z665nLQ1YxAvvKLbZgJ
	K836flQdGWfRcahrgPWsGgbE2Kv46RlU2j9210RhGvDmBYmeahOdJixtpW4jFIpXAj2/1kuIqVUzm
	9UeGFlwfEh13tOOBCEhTCdOmFs+NkVHulOmWBcYiyIrEdETWz96sC8sQ5hitRuikUOylqpHtAubjX
	bIdwQSiSdX8D+zYfq6nK2YaptkNRLX5ebrdQ9hI/fijT9vdqmXxkPzbZ/e0uearFNRK9I5GNV8P5M
	+7qkIbyw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1szALv-0000000Faln-258j;
	Fri, 11 Oct 2024 07:46:23 +0000
Date: Fri, 11 Oct 2024 00:46:23 -0700
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
Message-ID: <ZwjXz0dz-RldVNx0@infradead.org>
References: <20241009180816.83591-1-rppt@kernel.org>
 <20241009180816.83591-8-rppt@kernel.org>
 <Zwd7GRyBtCwiAv1v@infradead.org>
 <ZwfPPZrxHzQgYfx7@kernel.org>
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
In-Reply-To: <ZwfPPZrxHzQgYfx7@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Oct 10, 2024 at 03:57:33PM +0300, Mike Rapoport wrote:
> On Wed, Oct 09, 2024 at 11:58:33PM -0700, Christoph Hellwig wrote:
> > On Wed, Oct 09, 2024 at 09:08:15PM +0300, Mike Rapoport wrote:
> > >  /**
> > >   * struct execmem_info - architecture parameters for code allocations
> > > + * @fill_trapping_insns: set memory to contain instructions that will trap
> > >   * @ranges: array of parameter sets defining architecture specific
> > >   * parameters for executable memory allocations. The ranges that are not
> > >   * explicitly initialized by an architecture use parameters defined for
> > >   * @EXECMEM_DEFAULT.
> > >   */
> > >  struct execmem_info {
> > > +	void (*fill_trapping_insns)(void *ptr, size_t size, bool writable);
> > >  	struct execmem_range	ranges[EXECMEM_TYPE_MAX];
> > 
> > Why is the filler an indirect function call and not an architecture
> > hook?
> 
> The idea is to keep everything together and have execmem_info describe all
> that architecture needs. 

But why?  That's pretty different from our normal style of arch hooks,
and introduces an indirect call in a security sensitive area.


