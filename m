Return-Path: <linuxppc-dev+bounces-2429-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB559A51AB
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Oct 2024 00:51:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XWGzC0B3Hz2yN3;
	Sun, 20 Oct 2024 09:51:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729378310;
	cv=none; b=GDoN3E8o5NB7pyZP8nx/SvIKv342LCLc+UdOYsG3oC1OUh8bUqbsu1HmcH0V90H3g/8QN/bwaq+OSGeUprRztH/0cJMwjApvcr3bpcB2QL9tN0NGpXg9nt8W3rAcFd/AYVKoYs/vq/kpVMgnB75jEe7YHkA3g9u0eFXciBxZf9F2JfEXfcfzGiVsb+kL+V+szSnKYRzaDLA4B1h5zaJo7nkvm5NgETKL2g3gTkKGNEaTBO1Swk/oYOfY4D2eKXF1ZHfr5aqIE73ubx5U6mUgNY7p/o5njoQcJ6PGwyWbVXLLA7p8sDqjyMOS7xTQ0e8KdyRvG9hi7j7gzqvpSQThnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729378310; c=relaxed/relaxed;
	bh=7zUTFOALmvJecWb9wB6YiXPzPNuTlzsgzqq4AD+I6Bk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bCwuGOkYOlSw+sKuTJLFvjMrUfPKdEwTVzsw9iCa1eSkHvc/oszqWZ/+wH2yYW/isRvlziaL8cB7e7b7gDadTkTBvTYBj6ubOCIO6xR1wZOFtoWXBcIbpZjJExi4El1QalzvC9cRh0BkVIDzozA0A9h4pE4CWtgIBUZgBMmRn6oyKMcdAaB8/bxBb+kymEpvvpOVMIBQOxd2SQh+7B0yxyeqOrQ7y5tnuZCO0ZwDbBjOZleJmqexgyiYIpx4hV8CaYCK2GKI0lRcvt6Rwo+S9w2Lw9NSvDEIH8v+I0tQfmk06P5KmkDzC3kmhJDV5Rn1VO85Om9kflHuta54MoqRhQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PWWcwFHR; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=mcgrof@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PWWcwFHR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=mcgrof@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XWGz96KDpz2yMP
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Oct 2024 09:51:49 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D5BAF5C1627;
	Sat, 19 Oct 2024 22:51:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A509C4CEC5;
	Sat, 19 Oct 2024 22:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729378307;
	bh=iaKyJYsgDj5oq6LrolQ8TT/cIGmsXYFI9lXbWUpr55Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PWWcwFHRKAv10UFeMWidR+oArwiG2+r721GO7uSmTpQx0pOBJf1X5cPUKD4gQg0+v
	 evgCS5YusRtKfCXFwytoJRX7ZRENJRAMHCt8HvG03nMPWzjaJDvjdrgLKvwNx81i5w
	 NIzDOiB7M0V+Ul7Gwqxo7hFP4wjCIx8CdeY/s0mZyLShSAGZB3TOEh3ca9PA+vMo3W
	 q8+DRfeiSbEMT2pfBoZx2+ts1c/ZoMbSDOpbvF1L4SRM4K2S0rC8EknH09OaDU5jzH
	 5NBzulTpDRDsAwrp/w7GYCrOs4CtagANrNUd5w9SX4IoQrxyUxMdI/Mnop054oa6hH
	 EFlkfWan9WOpw==
Date: Sat, 19 Oct 2024 15:51:43 -0700
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
Subject: Re: [PATCH v6 0/8] x86/module: use large ROX pages for text
 allocations
Message-ID: <ZxQ3_8xNPYsQA5GH@bombadil.infradead.org>
References: <20241016122424.1655560-1-rppt@kernel.org>
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
In-Reply-To: <20241016122424.1655560-1-rppt@kernel.org>
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Oct 16, 2024 at 03:24:16PM +0300, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> Hi,
> 
> This is an updated version of execmem ROX caches.
> 
> Andrew, Luis, there is a conflict with Suren's "page allocation tag
> compression" patches:
> 
> https://lore.kernel.org/all/20241014203646.1952505-1-surenb@google.com
> 
> Probably taking this via mmotm would be more convenient.

Yeah, it's already there on Andrew's tree, fine with me to go through there.

The linux modules KPD [0] has picked this up from the mailing list and
tested with kdevops, and this series passes our modules test now [1], and so:

Tested-by: kdevops <kdevops@lists.linux.dev> [1]

Link https://github.com/linux-kdevops/linux-modules-kpd/actions/runs/11420097546 # [0]

  Luis

