Return-Path: <linuxppc-dev+bounces-2179-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2037A99BE2E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2024 05:26:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XRjLz5gksz30PD;
	Mon, 14 Oct 2024 14:26:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728876395;
	cv=none; b=fHsR3CGnoNTu9vMwXYTB50QFwq/1FEWFC2uwaVhrMYuU302U5aWlIwKjQvH64JjaChlMzhU1MB6cMX3NhrfXeYePMTEILRIYN6uVaWMRk/v8MMBej7V56xem1saO27wuLqxpok66E2ui7MsHrUq/WP3q4k8YCi6CqUS4Wc9fJG9IjOfyEkrJOzO4PYg73ryTtBppYxCHFlNwMz4yu6A6bCU2kjcV/RJ3Vrs2+GYAMMAtX8eFzbmwKRYXjFI1V+1Xq4fW41ZuFDqSmRLajHj74Dn8er71o17kIazwqM8zi/QBMyLpw0cXqo7xycJb4NjWL6+AIZ5ifRddrBDJpxOv2w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728876395; c=relaxed/relaxed;
	bh=WCso5iYRziJUck2qEr2o5W95T62wWch4WEcH83mjQDk=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=UZBfbybwoaPAPpUhg1AX2eYV0dXJoX+RUyv2qRcsPusI6kKZ/pSKsSQbWnq+KutzGYLlP60c+f44iFFaCSXZGSoAVNf6ZJd2xpJRMGjyQO8K7oxsQ86kQuN1vdMy5+agBWHrjnutn+rAhsCCETcFqS3ZLy9MtXJ58NdYywAiJcXibpmTxrKap/Zn2Pr/vOdMJCacyLPHXWpFoHuV3rRiL7qVquEhzQM2CugOwDJPhqyPcWylwzTdPBj28iFXUYnpr5fS6IolH+a8T3h1Ku1qMWyMDO1kZJAH8Eu7JUaH8rFRbH4TA/oL6gOPiLgPw1PuGOAWCV4D/yNqysg+3Svc5w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=qTixcVvw; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=qTixcVvw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XRjLy0QV7z2yVj
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2024 14:26:32 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6AB375C55BB;
	Mon, 14 Oct 2024 03:26:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A751C4CEC3;
	Mon, 14 Oct 2024 03:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1728876389;
	bh=OYTP/1rnVlMgoHj5ReLaVqv3uJi7mKW1XAcNVGficbk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qTixcVvw7g3WJhbtvzuUfsX4xifF6FfeMa1/Jgt9Fz1P+9pRT0LjuXsF9ZPRLI0SQ
	 0YjCPAfHHkhZg2HwK0M7/hyF0QAETn0AmpsAYMB/N0iawqVPDDMLW9IdJaDIuO+7xa
	 37UFA5ONzpdACn1y2MXDIXwSekPMLBfeKmJmLlvM=
Date: Sun, 13 Oct 2024 20:26:26 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Christoph Hellwig <hch@infradead.org>, Andreas Larsson
 <andreas@gaisler.com>, Andy Lutomirski <luto@kernel.org>, Ard Biesheuvel
 <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Borislav Petkov
 <bp@alien8.de>, Brian Cain <bcain@quicinc.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>, Dinh Nguyen
 <dinguyen@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Guo Ren
 <guoren@kernel.org>, Helge Deller <deller@gmx.de>, Huacai Chen
 <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>, Johannes Berg
 <johannes@sipsolutions.net>, John Paul Adrian Glaubitz
 <glaubitz@physik.fu-berlin.de>, Kent Overstreet
 <kent.overstreet@linux.dev>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Matt Turner <mattst88@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Michal Simek <monstr@monstr.eu>, Oleg Nesterov <oleg@redhat.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Peter Zijlstra <peterz@infradead.org>,
 Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>,
 Song Liu <song@kernel.org>, Stafford Horne <shorne@gmail.com>, Steven
 Rostedt <rostedt@goodmis.org>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>,
 Uladzislau Rezki <urezki@gmail.com>, Vineet Gupta <vgupta@kernel.org>, Will
 Deacon <will@kernel.org>, bpf@vger.kernel.org, linux-alpha@vger.kernel.org,
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
Subject: Re: [PATCH v5 7/8] execmem: add support for cache of large ROX
 pages
Message-Id: <20241013202626.81f430a16750af0d2f40d683@linux-foundation.org>
In-Reply-To: <ZwuIPZkjX0CfzhjS@kernel.org>
References: <20241009180816.83591-1-rppt@kernel.org>
	<20241009180816.83591-8-rppt@kernel.org>
	<Zwd7GRyBtCwiAv1v@infradead.org>
	<ZwfPPZrxHzQgYfx7@kernel.org>
	<ZwjXz0dz-RldVNx0@infradead.org>
	<ZwuIPZkjX0CfzhjS@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, 13 Oct 2024 11:43:41 +0300 Mike Rapoport <rppt@kernel.org> wrote:

> > > The idea is to keep everything together and have execmem_info describe all
> > > that architecture needs. 
> > 
> > But why?  That's pretty different from our normal style of arch hooks,
> > and introduces an indirect call in a security sensitive area.
> 
> Will change to __weak hook. 
> 

Thanks, I'll drop the v1 series;

The todos which I collected are:

https://lkml.kernel.org/r/CAPhsuW66etfdU3Fvk0KsELXcgWD6_TkBFjJ-BTHQu5OejDsP2w@mail.gmail.com
https://lkml.kernel.org/r/Zwd6vH0rz0PVedLI@infradead.org
https://lkml.kernel.org/r/ZwjXz0dz-RldVNx0@infradead.org
https://lkml.kernel.org/r/202410111408.8fe6f604-lkp@intel.com

