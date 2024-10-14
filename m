Return-Path: <linuxppc-dev+bounces-2219-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB4A99CB2A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2024 15:11:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XRyL1060Fz3brH;
	Tue, 15 Oct 2024 00:11:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728911496;
	cv=none; b=Lvj0z3igtZDoZoU+TP4Srpb5KngJ6DzV0O2MV9NtZTWgJgpMy27Y1b0zr1RR/Y7ho9wm+L0pIEP8/X47TwSxc7rjsv1nyiWLoNpUeBj1dyglFGdYnEjON/e7qJoJovX+Dzas/MWfwbHuj7U0eWdACDKIgn4nnQuUDni8T2DQJFcaFTNuru4rFDt1mS/YuN541vfyiUSwwJ+wUiADCHrgnCzjP5fCCar6juWu8wMW3hi3wG+zGqZERKKbqjCQIrdmxGmCIFl2/NUpP9YOEscyYOKvNFx8yxdrA+ecqGxZC0VdxOvv6KaX2A6TSmsti6rP3Plso0tHIRcHhpyPALlUCw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728911496; c=relaxed/relaxed;
	bh=j+BOznowBtN/nii59G4lRfCPThWEa6TNxQ/kRulWlps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YtOa+EfRuBETiRSDLNCHvvv/ideWOf/K3WoATlhiG2zhMdW2cSZaYLUej9O2UReS8uSbv9bF6KZhqW1kEGc6pWNLQh4enQwMQkJHdYFj1ZcbYNdlAz1xt91OlN42t9cg5PeJ+TPQugKYl86tJl8tk8AT6ZFneKh5EL/EsXB1KBL70Haj8nUGVfwn9AB4N79BgNJwwRIURnt06xS1Jrdg5J5vl6Glqx3PIFwVb3ib7Pe4Ym85kSEqrJWVPGzR//Slf3H8GSbibv9BoWyJS3Orp+9ntGSIDT36HO0BPyZcLSQrdtMqNb+yjtWYMzoXgvSHcbH2rA/iuWS2O0Za4a0hiQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=vMvBZJVO; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=vMvBZJVO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XRyKz69VRz3br7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2024 00:11:35 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8CAC75C569A;
	Mon, 14 Oct 2024 13:11:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32D95C4CEC3;
	Mon, 14 Oct 2024 13:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728911492;
	bh=Rj0DDOED5iD2FdGYxYV+4r4tEXYq4n6Xi/0d9QAVLUc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vMvBZJVOinxsLsrPPXzSxPojzLbDfnzNQ55w0X0QwTjcMMxar0CDAK08E2JThkQpb
	 4cpioov/cqx2XJwdmLwC1BTnXl3vfXvrgA1ETi3RHPPFn/KFa3uZAW+joXD5HEZg+c
	 4U5ok631tPzwPd7hoGyNRL5ynGDynUSOamB6K2RiHfHSi/erCk9kHqPS+1U5lBuMVB
	 r0jU8Sa0yR3rOlG2WDCJ68+YmRHtYreB6qz66TSlQdG0YMQVcdBysszRX2pWrQ1lN4
	 ziJbkceFmXn8rCIwx79sxsDKS6SGBNY9GisCIBFcBwGbEy+4gMh7VJcsFjn3AG+8KF
	 uacBBUphpSFpQ==
Date: Mon, 14 Oct 2024 16:07:40 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
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
Message-ID: <Zw0XnDHbpHDwFDHy@kernel.org>
References: <20241009180816.83591-1-rppt@kernel.org>
 <20241009180816.83591-8-rppt@kernel.org>
 <Zwd7GRyBtCwiAv1v@infradead.org>
 <ZwfPPZrxHzQgYfx7@kernel.org>
 <ZwjXz0dz-RldVNx0@infradead.org>
 <ZwuIPZkjX0CfzhjS@kernel.org>
 <ZwyyTetoLX7aXhGg@infradead.org>
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
In-Reply-To: <ZwyyTetoLX7aXhGg@infradead.org>
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, Oct 13, 2024 at 10:55:25PM -0700, Christoph Hellwig wrote:
> On Sun, Oct 13, 2024 at 11:43:41AM +0300, Mike Rapoport wrote:
> > > But why?  That's pretty different from our normal style of arch hooks,
> > > and introduces an indirect call in a security sensitive area.
> > 
> > Will change to __weak hook. 
> 
> Isn't the callback required when using the large ROX page?  I.e.
> shouldn't it be an unconditional callback and not a weak override?

I'll add a Kconfig option to ensure that an architecture that wants to use
large ROX pages has explicit callback for that.

-- 
Sincerely yours,
Mike.

