Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 175D973424C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jun 2023 18:39:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Yot9srmD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qk1vc5ms6z3c28
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Jun 2023 02:39:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Yot9srmD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=song@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qk1tg454jz30FW
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Jun 2023 02:38:35 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D5E4F6125C
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jun 2023 16:38:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0023CC433AD
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jun 2023 16:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687019912;
	bh=wsV5PAOYMtSK534qTONYBGMJADMTf/thu6AVR5VKWFg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Yot9srmDxIE7KMUXoz/WItw8QoYHklUWpGAOfVdP1mAZAE8IPzwCIvez2LKGWTeA8
	 uBI/u6K5We/9cr2hfpsjcf61pTiwPb1838GAX2mzV82cFYAlkCCPdIaQ0LkU4A0KYp
	 Q+LFb8HTIRiAdHOh+lSqLxMq/CHiIzdt8vLMzLYPx10NqFMjuu7bK2x2T1tTw14NmB
	 3wbjhP6u6/bO5anApcSn6SzJJLk0ySMpsNzQwdac9PV8ttZbpDT3DhYX2OZ8/Oa6nJ
	 U0Eu5AmsXTEFX0eDZrEqNiSfCOZdL+o2239g4nXz57RVwjJ3CXDaQMVaPKEQX+N7hc
	 AstBxpsGC2oUg==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-4f841b7a697so2303492e87.3
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jun 2023 09:38:31 -0700 (PDT)
X-Gm-Message-State: AC+VfDzSuNW8FwrGSC7Hi3QSgaTbpnIPeVCt5cH+XfQw6BUgtrJi2GLw
	UTrMqNtInVDH9klFwdwfasmSotXBx7NskjugBxs=
X-Google-Smtp-Source: ACHHUZ7/x1kYUhYXMtUENPjhDtD48HKOo5oy2K5VqpfigImzwjTDz7CrLzlDpzPNd4SA2zOD7D4teoP7FVQzMuuaU40=
X-Received: by 2002:ac2:5bd1:0:b0:4eb:42b7:8c18 with SMTP id
 u17-20020ac25bd1000000b004eb42b78c18mr3005243lfn.53.1687019909491; Sat, 17
 Jun 2023 09:38:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230616085038.4121892-1-rppt@kernel.org> <20230616085038.4121892-8-rppt@kernel.org>
 <CAPhsuW6BG2oVrGDOpCKyOEvU9fBOboYYhducv96KUBe276Mvng@mail.gmail.com>
 <20230617065759.GT52412@kernel.org> <ZI3TGhJ2y5SBWmnA@moria.home.lan>
In-Reply-To: <ZI3TGhJ2y5SBWmnA@moria.home.lan>
From: Song Liu <song@kernel.org>
Date: Sat, 17 Jun 2023 09:38:17 -0700
X-Gmail-Original-Message-ID: <CAPhsuW4KDriCDfQ40MKKQ3AjyeRbEUJxjqoBLipe5AJMxY3U-w@mail.gmail.com>
Message-ID: <CAPhsuW4KDriCDfQ40MKKQ3AjyeRbEUJxjqoBLipe5AJMxY3U-w@mail.gmail.com>
Subject: Re: [PATCH v2 07/12] arm64, execmem: extend execmem_params for
 generated code definitions
To: Kent Overstreet <kent.overstreet@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-trace-kernel@vger.kernel.org, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Puranjay Mohan <puranjay12@gmail.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-modules@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jun 17, 2023 at 8:37=E2=80=AFAM Kent Overstreet
<kent.overstreet@linux.dev> wrote:
>
> On Sat, Jun 17, 2023 at 09:57:59AM +0300, Mike Rapoport wrote:
> > > This is growing fast. :) We have 3 now: text, data, jit. And it will =
be
> > > 5 when we split data into rw data, ro data, ro after init data. I won=
der
> > > whether we should still do some type enum here. But we can revisit
> > > this topic later.
> >
> > I don't think we'd need 5. Four at most :)
> >
> > I don't know yet what would be the best way to differentiate RW and RO
> > data, but ro_after_init surely won't need a new type. It either will be
> > allocated as RW and then the caller will have to set it RO after
> > initialization is done, or it will be allocated as RO and the caller wi=
ll
> > have to do something like text_poke to update it.
>
> Perhaps ro_after_init could use the same allocation interface and share
> pages with ro pages - if we just added a refcount for "this page
> currently needs to be rw, module is still loading?"

If we don't relax rules with read only, we will have to separate rw, ro,
and ro_after_init. But we can still have page sharing:

Two modules can put rw data on the same page.
With text poke (ro data poke to be accurate), two modules can put
ro data on the same page.

> text_poke() approach wouldn't be workable, you'd have to audit and fix
> all module init code in the entire kernel.

Agreed. For this reason, each module has to have its own page(s) for
ro_after_init data.

To eventually remove VM_FLUSH_RESET_PERMS, we want
ro_after_init data to share the same allocation interface.

Thanks,
Song
