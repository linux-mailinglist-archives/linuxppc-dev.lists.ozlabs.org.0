Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCC48B3F9C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Apr 2024 20:49:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=N7h4BKoZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VR1x16Tdvz3d9V
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2024 04:49:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=N7h4BKoZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=song@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VR1wF3Y72z3cXy
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Apr 2024 04:49:01 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3A3F1620F1
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Apr 2024 18:48:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9A78C2BD10
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Apr 2024 18:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714157338;
	bh=Hyt9cSwCpY4B/TYQfJ50zYLktchyWIPJ9BFUEyet93w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=N7h4BKoZxJgQd9xVRuX/M86Dlrxi640K1yvD40sd6wIIt1B5wSz+Mr1057jFLkLm7
	 YZLxJUXsO3aGDcNsRJacV4WWKmENUeWDAGgelEEhQ25IisoVmsZjs2wqWO2oDQMI4D
	 uSiPujWrzA8VGIDR/ukvMt5azOqWqFDBQT80OwN/ng08krBNl8C4Y7bbqtWCLiYMMs
	 Ml7Mm3G2ZYOMxJWAhjUW9ZUeZXzqyXsxytjciMPlz0IZG/fa33C4c7C9ww3ptvMroe
	 tBefFgyrg4HjdgYCDGUZZv+XFU/Y1OA/hzEGUupM+8QfQ1YJfq2oXsvFywmF/2Inu5
	 uXrPdi7lPrPAg==
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a58e2740cd7so10374866b.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Apr 2024 11:48:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW/aj9fFyM0FyGGfiEH/sSN8yahVxu4Xb+2i4Uoa1wouQySXDqV3OrzDdCguRUznPfxo9+tnOa1YX5yRIDOwVaFrLQIEGgk7BPMrUQyXw==
X-Gm-Message-State: AOJu0YwNPPMV2/ZdMnt9AXIdGxekmmKia9HOWTX1ggdfSNSMYW/MQcBJ
	ZEuW1hoBurk5woxwFqgPVUd5VsEisJcfP2tPoMPrY+DsjMtwZlGFGcaqBqYYj8ijI2WLoywtg16
	T5DgENQAiV8i4hrkwbLDX5PmTy1k=
X-Google-Smtp-Source: AGHT+IFMUG93L8El2Q8N1eCq6gv3PwlvgFwZKVcKUA/i/TE/TYvbrOCl1aD96inecCeUz3meYOs5/CsGWzmxgWNQdJE=
X-Received: by 2002:a05:6512:5cb:b0:51a:cc71:b91d with SMTP id
 o11-20020a05651205cb00b0051acc71b91dmr149470lfo.19.1714157316791; Fri, 26 Apr
 2024 11:48:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240426082854.7355-1-rppt@kernel.org> <20240426082854.7355-6-rppt@kernel.org>
In-Reply-To: <20240426082854.7355-6-rppt@kernel.org>
From: Song Liu <song@kernel.org>
Date: Fri, 26 Apr 2024 11:48:25 -0700
X-Gmail-Original-Message-ID: <CAPhsuW75813E1MrdMYrqJXvuunbiJ046vT_EoReXA-60HJxT+Q@mail.gmail.com>
Message-ID: <CAPhsuW75813E1MrdMYrqJXvuunbiJ046vT_EoReXA-60HJxT+Q@mail.gmail.com>
Subject: Re: [PATCH v6 05/16] module: make module_memory_{alloc,free} more self-contained
To: Mike Rapoport <rppt@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Sam Ravnborg <sam@ravnborg.org>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Russell King <linux@armlinux.org.uk>, linux-mm@kvack.org, Donald Dutile <ddutile@redhat.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, linux-mips@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, netdev@vger.kernel.org, Kent Overstreet <kent.overstreet@linu
 x.dev>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Eric Chanudet <echanude@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 26, 2024 at 1:30=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
>
> Move the logic related to the memory allocation and freeing into
> module_memory_alloc() and module_memory_free().
>
> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
Acked-by: Song Liu <song@kernel.org>
