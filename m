Return-Path: <linuxppc-dev+bounces-1916-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3627C997CA6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 07:47:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPJgn0Kcrz3bjG;
	Thu, 10 Oct 2024 16:47:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728539268;
	cv=none; b=F7EIzglwg7+AWqwDq1tvcWvhI5XgiDdMLJ4wqUGJTfjY1jR6eZR9j66IfivkILBnPe3tKZ2jHFX7qnZaqo2LqMWqxL/k1jqnS0E1ts6y8UiIaG9Bq7j87x+6jeQYP4fzlm9yMY0RVyKV6LPVeYwie2I3zAbf7vkqMATGVBJ4IyQcBZdpHnS8q5DTufmpnFs/cBC+i+1+5nZGFoC42mnXPHBmZicYqQFmC86xPzQ+Ad3JgBryjiaYtU7bQo10dQTwHQYie0IJqJVMZdrwevZr36q9nzSruShlnGhEnz8I25PA9ZrhmAB1f8WoeXkPxmhxH5dQU84wMaPNPE3tTkGOlg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728539268; c=relaxed/relaxed;
	bh=7pL9DjnUbhD4Jj4TUGmgK/B+QAzH921/eIKxZUNyPg0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DloeexQs3qnMhCjl1H4J+QIBj1RExly0xwahPbIBWcZnwJU5LKOShDN7FRAk6ll85ehPke7ZjLA/HE0Ske0g2LDoBLysB1QI6e2kFB7rhSP8nfSdBbxg5ETxZySOriWsj+qVBwGPJSlpG+nIVrYBPF/XuHdPH4slf/YAN8O5HGMMGN9XoE7EH3xFz4WHffSyGtSrT0quL7ThSgnbqZFnGqmxEjvSrujI/IJy1DDXRn5O0+6XvI82xRP2xGThXTA5F4E33iPxcmUSpv5CrYd21dStJ3bEzhFAf0ufKrl1fujJWvhNpNRALLORYOjkP08P/orHkvFgYH23MSEw2gpYBQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=e1wK0sqC; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=e1wK0sqC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPJgl6Gqkz2y8X
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 16:47:47 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 729BE5C5406;
	Thu, 10 Oct 2024 05:47:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 941A0C4CECC;
	Thu, 10 Oct 2024 05:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728539264;
	bh=OTuy4VqE5rZSLBEA0/Pnb2zLZJiAXIMvgimloV5JAr4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e1wK0sqCj1hFSMccCG8VnSk9aTxpzFJTrYzsRT9VXVEEoRS3hraEZu619qHthJzSx
	 DynBiJLcPJQRbA9J0lLh6ATNk3FB4/xFOM4dXnLEGXWPkSrxd0XcoTxriiWODdioLD
	 1sWIJTn6uT4ZOaW12OrRLOdpildKc5e58UW0/bc2P0yDusD5bq7Iwbf8r4b7hIX5Iy
	 XccbgL+BkzqR13hBcI+eIsGnGBFTEruC5c+E0zapz7RRHpVu6gMKoZHI6cwfi2IRZM
	 bP+nlVliXD/Sq3TcOU7AO/E8ZEwKb501SlYT1dTNQaVEK/mrQ9FtlySueDuymdFkFN
	 xybmhUi0XMlmg==
Date: Thu, 10 Oct 2024 08:43:56 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Song Liu <song@kernel.org>
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
	Russell King <linux@armlinux.org.uk>,
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
Subject: Re: [PATCH v5 4/8] module: prepare to handle ROX allocations for text
Message-ID: <ZwdpnPKKQGF5DtSv@kernel.org>
References: <20241009180816.83591-1-rppt@kernel.org>
 <20241009180816.83591-5-rppt@kernel.org>
 <CAPhsuW66etfdU3Fvk0KsELXcgWD6_TkBFjJ-BTHQu5OejDsP2w@mail.gmail.com>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPhsuW66etfdU3Fvk0KsELXcgWD6_TkBFjJ-BTHQu5OejDsP2w@mail.gmail.com>
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Oct 09, 2024 at 03:23:40PM -0700, Song Liu wrote:
> On Wed, Oct 9, 2024 at 11:10 AM Mike Rapoport <rppt@kernel.org> wrote:
> [...]
> > diff --git a/include/linux/module.h b/include/linux/module.h
> > index 88ecc5e9f523..7039f609c6ef 100644
> > --- a/include/linux/module.h
> > +++ b/include/linux/module.h
> > @@ -367,6 +367,8 @@ enum mod_mem_type {
> >
> >  struct module_memory {
> >         void *base;
> > +       void *rw_copy;
> > +       bool is_rox;
> >         unsigned int size;
> 
> Do we really need to hold the rw_copy all the time? 

We hold it only during module initialization, it's freed in
post_relocation.

> Thanks,
> Song
> 
> [...]

-- 
Sincerely yours,
Mike.

