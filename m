Return-Path: <linuxppc-dev+bounces-2268-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 702B099DDD2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2024 07:58:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XSNgn0v5Sz30f4;
	Tue, 15 Oct 2024 16:58:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728971909;
	cv=none; b=FYvW4XvXWHOL22pCypwuAKhTpqThg/RYUKkcy1HDLLo6kHkS/ZAkOFFnoV5MUM9eHhWRZuPePNAySPxXlhhZ+49l3lMhgUSucFCw8UIF0V/vZfLNancpXRX67xaNr9Ghj0UsrYCN9dTJdZWfkiEZx0uTzg8lN1FBCnVrh647JBDjHww25ELIDNLM1DMQbAlzoWuB9DkIWl9JCCTXY4/fw0jrSdLcb+5QVihyFMoUEothnoinYOiBmQixgYL76kV/7mo0K72VH85csvcQb8+xZvZnUkg7/Ra4fOVk+WFyEs74Ae6L1jU4hUCFDtP6hAAvihP3k6TgLhfKaDUFJ8fpvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728971909; c=relaxed/relaxed;
	bh=BctUNWp7ZYrsgEokkhEAM5WYFmtRQvefwFYiegMHrHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hYx9KXoWC+zTeCfoRlyzpiw8QL+EaGLtgcEuf6bjVP6gyxdHvDq/IG8K2WHm2nUmG1Um94WWOzlHueE2ZVYgUe0S/Rh9gcRq+fN0RnKc8Y41egLiZi7jPHNKoMzDZ24+W5Xs0yZoBy+wTQc2BbDjRTr0GVR3Z2JunAtGRq4c2iMI67i6zEId0daWYtABtfikk+wqKm3xUNGp4iy5JWC3XRZoEkle+z+LccqjlO1GxvqSMz29quKVpNSnTYJKokxF64FgwrNL4LNNQclTy0TRlER3zF5bXU5qUV26H/9t5DQBLVZn4QBSV0fEPrC6N78RTdoku7qd+uW0uXd+ePMz6A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jG5sGGJ/; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jG5sGGJ/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XSNgl5cm9z2ygy
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2024 16:58:27 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 24023A401EC;
	Tue, 15 Oct 2024 05:58:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 325E1C4CEC7;
	Tue, 15 Oct 2024 05:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728971903;
	bh=Bo5YA9yZSBe+D0lpdePuveWlpCV5YIVCk7/YdaIdQ1I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jG5sGGJ/uyj72sfIjEOgM3YbtVaq12kKOCpq+pn5nPbrPsQT2kC9ydtk/YzTUly5r
	 4eVw7lpNOy5kN1mWcmFmO7tb0cYSymlnAwpq2Wio7c3ZyfvyaEwu9JPC9amMYfUYbj
	 MtCJD0izwYdWw2k3enQm6TEHcbCSImNPeik7wVIFjejDi/qTBQORJWwxVSIAEvqN5Q
	 l9yRtb72GuYxy6JDeT8CrEewKpTCwuiujl9ZpZL5V+ZbK8ZPy8dUW/6qHkWufpsPdi
	 7qTmnW97lTs/3celEWZrNKMwS30XeMtKFXPBKIkve6XIFrcQu+bxXeiRq9P0LbGJXD
	 wA3RYW8I7S+NQ==
Date: Tue, 15 Oct 2024 08:54:29 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>
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
	sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v5 7/8] execmem: add support for cache of large ROX pages
Message-ID: <Zw4DlTTbz4QwhOvU@kernel.org>
References: <20241009180816.83591-1-rppt@kernel.org>
 <20241009180816.83591-8-rppt@kernel.org>
 <Zwd7GRyBtCwiAv1v@infradead.org>
 <ZwfPPZrxHzQgYfx7@kernel.org>
 <ZwjXz0dz-RldVNx0@infradead.org>
 <ZwuIPZkjX0CfzhjS@kernel.org>
 <20241013202626.81f430a16750af0d2f40d683@linux-foundation.org>
 <Zw1uBBcG-jAgxF_t@bombadil.infradead.org>
 <Zw3rDS3GRWZe4CBu@bombadil.infradead.org>
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
In-Reply-To: <Zw3rDS3GRWZe4CBu@bombadil.infradead.org>
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Oct 14, 2024 at 09:09:49PM -0700, Luis Chamberlain wrote:
> Mike, please run this with kmemleak enabled and running, and also try to get
> tools/testing/selftests/kmod/kmod.sh to pass.

There was an issue with kmemleak, I fixed it here:

https://lore.kernel.org/linux-mm/20241009180816.83591-1-rppt@kernel.org/T/#m020884c1795218cc2be245e8091fead1cda3f3e4

> I run into silly boot issues with just a guest.

Was it kmemleak or something else?
 
>   Luis

-- 
Sincerely yours,
Mike.

