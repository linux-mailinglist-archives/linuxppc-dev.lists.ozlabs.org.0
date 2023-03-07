Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E706AD3A8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 02:02:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVxxj1dZbz3fST
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 12:02:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=KWVVCGW4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVxs84ZQYz3f7Q
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 11:58:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=KWVVCGW4;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PVxs332LJz4xD5;
	Tue,  7 Mar 2023 11:58:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1678150712;
	bh=CHWXVrMkdiyq4zwPZtjE+TsoQPPFRbjP3aPXqFScr8M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=KWVVCGW43d7K7bKL3+7NAS3VQRFJRrNz2O6qEQSCe3iM0mAGIBLB0wpEx+hq1cgob
	 zWrSY4r1DMNDvtk/jqhxoZ30OwLv16WASzFeifWZILoHN3jHCWsvTtmBOnGX3qdRK6
	 l1lpOlGCLel5N3Z1MvgzoxbYsYBqPF6aKYYqR7dABs1WFXYIYTtmKn0P0o/cEKa8ya
	 lW8DcOqf6hegaMGqy2+XpmpZ19j9hAutwRaz8eg/A2Sun/lZdLj8UX1yrRseK7ub8j
	 6WcXKAD8niU8B//ISRCJPfq1nUy29cV9iN/fMEEr0y6Zvit+Gu412hJF5m69g5zV8B
	 6ECeucihx/xAg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 2/2] arch/*/io.h: remove ioremap_uc in some
 architectures
In-Reply-To: <5dec69d0-0bc9-4f6c-8d0d-ee5422783100@app.fastmail.com>
References: <20230303102817.212148-1-bhe@redhat.com>
 <20230303102817.212148-3-bhe@redhat.com>
 <87sfej1rie.fsf@mpe.ellerman.id.au>
 <CAMuHMdXoM24uAZGcjBtscNMOSY_+4u08PEOR7gOfCH7jvCceDg@mail.gmail.com>
 <5dec69d0-0bc9-4f6c-8d0d-ee5422783100@app.fastmail.com>
Date: Tue, 07 Mar 2023 11:58:27 +1100
Message-ID: <87jzzt1ioc.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: Linux-Arch <linux-arch@vger.kernel.org>, linux-parisc@vger.kernel.org, Baoquan He <bhe@redhat.com>, linux-sh@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, Luis Chamberlain <mcgrof@kernel.org>, linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Arnd Bergmann" <arnd@arndb.de> writes:
> On Sun, Mar 5, 2023, at 10:29, Geert Uytterhoeven wrote:
>> On Sun, Mar 5, 2023 at 10:23=E2=80=AFAM Michael Ellerman <mpe@ellerman.i=
d.au> wrote:
>>> Maybe that exact code path is only reachable on x86/ia64? But if so
>>> please explain why.
>>>
>>> Otherwise it looks like this series could break that driver on powerpc
>>> at least.
>>
>> Indeed.
>
> When I last looked into this, I sent a patch to use ioremap()
> on non-x86:
>
> https://lore.kernel.org/all/20191111192258.2234502-1-arnd@arndb.de/

OK thanks.

Baoquan can you add that patch to the start of this series if/when you
post the next version?

cheers
