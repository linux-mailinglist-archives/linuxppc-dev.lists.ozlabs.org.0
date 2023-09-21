Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE0F7AA51A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 00:31:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BJxXZzf/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rs9B4006mz3cdX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 08:31:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BJxXZzf/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=song@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rs9952nndz3bWQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 08:31:05 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A08D862101
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Sep 2023 22:31:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3BB1C433B9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Sep 2023 22:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695335460;
	bh=MM21fpAAqNycTt4Xaf9NDcGQ0SQTcft6//RqlmbkVyQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BJxXZzf/aXubyQy2npZARHLDDjhgoXgiIEWqva3Fcvcj9zcoZxEU8fccdvHJ+HE1c
	 zzl8qTcUY9d4Go4O1phE4VHiUrxF82TprIMut63M6/i0lBXABCB/bZlTOwWqPbu1BQ
	 q5zu/0Z8B9EGkvCak3DZShCJdshYKc/r/AcXEeYIu2QyWVYI9Vx+BhQ1n26cL4/b0+
	 PS4cfkMveOYxyjpv6hbMeZ6FHOjVVnzGDFbwXlAgoIyH9v7qk7z8sPhWkYP6GlWWax
	 6oJu48Ae0Rkgt9SjGUY0GxlfVZDTstOKna+Ts701hrySxm3sOn2mvMBH6VjZ4iOt+Q
	 WLPXTkK17R7VA==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-50325ce89e9so2440040e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Sep 2023 15:31:00 -0700 (PDT)
X-Gm-Message-State: AOJu0YyUsU0BJulCoapqq35mzu0Ly+lk8M0KHD6eKZBN5TOqgyz3AR/O
	rwWxThLu0qRyUwoK6JH+KzIFftSOb7GKU2sGTUo=
X-Google-Smtp-Source: AGHT+IH8pmyQuqpvewRyL7QPTAL4jcebA+VNDdobgdjzXZOsPDkVCcZQaQNB105RzqTdIxkf8GblFKytjbdsRKyccPQ=
X-Received: by 2002:a05:6512:10c4:b0:500:7f71:e46b with SMTP id
 k4-20020a05651210c400b005007f71e46bmr7439120lfg.1.1695335458957; Thu, 21 Sep
 2023 15:30:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230918072955.2507221-1-rppt@kernel.org> <20230918072955.2507221-10-rppt@kernel.org>
In-Reply-To: <20230918072955.2507221-10-rppt@kernel.org>
From: Song Liu <song@kernel.org>
Date: Thu, 21 Sep 2023 15:30:46 -0700
X-Gmail-Original-Message-ID: <CAPhsuW5Vg7yDn8zb5ez4JY4efoQ6aW+vYm9OL+Xr0NJnLfMYHg@mail.gmail.com>
Message-ID: <CAPhsuW5Vg7yDn8zb5ez4JY4efoQ6aW+vYm9OL+Xr0NJnLfMYHg@mail.gmail.com>
Subject: Re: [PATCH v3 09/13] powerpc: extend execmem_params for kprobes allocations
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, Luis Chamberlain <mcgrof@kernel.org>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-trace-kernel@vger.kernel.org, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Puranjay Mohan <puranjay12@gmail.com>, netdev@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, =?UTF-8?B?QmrDtnJuIF
 TDtnBlbA==?= <bjorn@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 18, 2023 at 12:31=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wr=
ote:
>
[...]
> @@ -135,5 +138,13 @@ struct execmem_params __init *execmem_arch_params(vo=
id)
>
>         range->pgprot =3D prot;
>
> +       execmem_params.ranges[EXECMEM_KPROBES].start =3D VMALLOC_START;
> +       execmem_params.ranges[EXECMEM_KPROBES].start =3D VMALLOC_END;

.end =3D VMALLOC_END.

Thanks,
Song

> +
> +       if (strict_module_rwx_enabled())
> +               execmem_params.ranges[EXECMEM_KPROBES].pgprot =3D PAGE_KE=
RNEL_ROX;
> +       else
> +               execmem_params.ranges[EXECMEM_KPROBES].pgprot =3D PAGE_KE=
RNEL_EXEC;
> +
>         return &execmem_params;
>  }
> --
> 2.39.2
>
>
