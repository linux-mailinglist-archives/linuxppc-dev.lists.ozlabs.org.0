Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7D57AA486
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 00:11:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Wvqk0n6j;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rs8kW1Z6rz3cbq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 08:11:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Wvqk0n6j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=song@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rs8jc4Qssz300f
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 08:10:44 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 106E1620E4
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Sep 2023 22:10:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 757E8C433CC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Sep 2023 22:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695334240;
	bh=N5hdFpyXSiGpYG0511NDyp6fv24cJcs4QSVnP7w1UAU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Wvqk0n6jq0ct52sblCUd8L/Xq8+N+SorW8zAWVSuS8RApVD17k7plQRRz/k5AtqcZ
	 GfT0CHWwJxWi4gUehtxR+8ljjuQTqjvYKgxWb2XNuVdjKevxRu1ENJFvPX5YXAHSbF
	 Ix9CdbGlyzCm8uVsj2Qxltwpt5fiLP3w48irVYCfZTdJDqTfRku6xjijf57j/ZypWU
	 97yg0mO2y5J78oLs+yCmKD+nXRc3T+EFcvHppUt3wuFXOaWZdvIvQ4j8dq0mhxHV1+
	 hn7FVpnRYo4KhRE7dodDocdh21fQMMb+Di7kRnH5vPdK32pTNVgx3GHtydByNaiHSX
	 2EmQpYW6b+alA==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2c008042211so25275261fa.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Sep 2023 15:10:40 -0700 (PDT)
X-Gm-Message-State: AOJu0Yyl7yIkot1AE/mAisCryjGpjcDRK5G7FnGtGLjhVQJvNB/r8eRR
	8AU/d59UFtUz0qK8sLypT0LBdG+ky8+YH0vDmnM=
X-Google-Smtp-Source: AGHT+IFpnRd6TFzlAtTmG0SVL+ey3URugDNbqT5vmaLEkxDXDZHK88BxPcak1tSmyXSq9q54rWpyKjCd5XFO26LBHOk=
X-Received: by 2002:a19:6903:0:b0:4fe:2d93:2b50 with SMTP id
 e3-20020a196903000000b004fe2d932b50mr5173357lfc.31.1695334238605; Thu, 21 Sep
 2023 15:10:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230918072955.2507221-1-rppt@kernel.org> <20230918072955.2507221-3-rppt@kernel.org>
In-Reply-To: <20230918072955.2507221-3-rppt@kernel.org>
From: Song Liu <song@kernel.org>
Date: Thu, 21 Sep 2023 15:10:26 -0700
X-Gmail-Original-Message-ID: <CAPhsuW4bQY5fo_+K2z4uUdd4r0wYF1eT3bAya=YqcEcmqdGXvg@mail.gmail.com>
Message-ID: <CAPhsuW4bQY5fo_+K2z4uUdd4r0wYF1eT3bAya=YqcEcmqdGXvg@mail.gmail.com>
Subject: Re: [PATCH v3 02/13] mm: introduce execmem_text_alloc() and execmem_free()
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

On Mon, Sep 18, 2023 at 12:30=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wr=
ote:
>
[...]
> +
> +#include <linux/mm.h>
> +#include <linux/vmalloc.h>
> +#include <linux/execmem.h>
> +#include <linux/moduleloader.h>
> +
> +static void *execmem_alloc(size_t size)
> +{
> +       return module_alloc(size);
> +}
> +
> +void *execmem_text_alloc(enum execmem_type type, size_t size)
> +{
> +       return execmem_alloc(size);
> +}

execmem_text_alloc (and later execmem_data_alloc) both take "type" as
input. I guess we can just use execmem_alloc(type, size) for everything?

Thanks,
Song

> +
> +void execmem_free(void *ptr)
> +{
> +       /*
> +        * This memory may be RO, and freeing RO memory in an interrupt i=
s not
> +        * supported by vmalloc.
> +        */
> +       WARN_ON(in_interrupt());
> +       vfree(ptr);
> +}
> --
> 2.39.2
>
