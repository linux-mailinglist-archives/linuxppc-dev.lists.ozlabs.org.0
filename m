Return-Path: <linuxppc-dev+bounces-4401-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D4F9FA428
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Dec 2024 06:57:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YG9RZ1VCxz2xWT;
	Sun, 22 Dec 2024 16:57:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=89.208.246.23
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734847066;
	cv=none; b=mEIbLzW1hIbPsnmG+p93C/o3gnlWn3dzRax7+IdGRCRrTJSEkWiEG020NeH/sC8osPS9ppmsg/AsOUyGNhB/4f662kH7XfOWuEpwLRoUh+IcD9cmnxyDMtOy7htRw/hd1vdwOobrdvLfXZMtzwDrUVO7Z4yL8AVHHdJGP7vHT3nllWVLXQU6dS7PADFIIsv4eWzFMdb8ykfcIXYhmaU1qslSEaviuAF0BzfN6BdDIlDME9eav7QGJPk1aFTQAN/zp4OIFgywtjAa12ivCPZzH6bhWUhher/YyG8km64ZU4FSQK0ieOEbChdBtFXWgePZjd/c258OGpXF99SsGDJOaA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734847066; c=relaxed/relaxed;
	bh=73Spy65y75EOyPTSc0iJv9YfbS1W2aMnBGueFT4LSeE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HZTOgDPyEPhfGWWwJDtM3GDeJFcDAteaXuOKnstt9c9UC+PpiUhfUmPJG+/D0s/aytyS9Ns2+KPR9PNJ7poDaKGyrsjYWbk5Rdsv14Z5FTnIE4RipHdX2mbZWpjjq1EAW4jY5IEfc6IKmsPYqKPyy2rQDtrCvADp716vKylrXxt4NGPStI6SSWRDwTYKpr05XpM0YMmAbY1JhCGuNIUUINkeczxoeyTwq/gBKsGA0R+Y+ZmCbFD2nLAsgQhwG+Fmwc4QCU6RHTK+u9pGCAm4k+7zjz46rbYUyfyyDJZoqsRuOqRpXNdPYlW4HIPhu5c4brdXAdzfugkipw5xEAFM1A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; dkim=pass (1024-bit key; unprotected) header.d=xry111.site header.i=@xry111.site header.a=rsa-sha256 header.s=default header.b=nZcUQW1T; dkim-atps=neutral; spf=pass (client-ip=89.208.246.23; helo=xry111.site; envelope-from=xry111@xry111.site; receiver=lists.ozlabs.org) smtp.mailfrom=xry111.site
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=xry111.site header.i=@xry111.site header.a=rsa-sha256 header.s=default header.b=nZcUQW1T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=xry111.site (client-ip=89.208.246.23; helo=xry111.site; envelope-from=xry111@xry111.site; receiver=lists.ozlabs.org)
X-Greylist: delayed 362 seconds by postgrey-1.37 at boromir; Sun, 22 Dec 2024 16:57:45 AEDT
Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YG9RY0j1Nz2xGw
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Dec 2024 16:57:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1734846684;
	bh=73Spy65y75EOyPTSc0iJv9YfbS1W2aMnBGueFT4LSeE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=nZcUQW1TlcYe19vjpWVYF7BGYQbKeGDAvUbN+K0Gsvt9rhGMN7GsZfs/zdpj2lzl1
	 MbBsClXT3mJifINJ7gn7htQxIFD/roKSs0ciA+vaO6anVxMZbCRqy5Nv6Ocs9F+wxn
	 hZMWv9smlpVCNBPl3ehSuaSPQ+cU8zGg2WHY6b7I=
Received: from [192.168.124.9] (unknown [113.200.174.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1))
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 16E7F1A3FB1;
	Sun, 22 Dec 2024 00:51:09 -0500 (EST)
Message-ID: <02d042a6590ddb1fadb9f98d95de169c4683b9e7.camel@xry111.site>
Subject: Re: [PATCH v6] mm/memblock: Add memblock_alloc_or_panic interface
From: Xi Ruoyao <xry111@xry111.site>
To: Guo Weikang <guoweikang.kernel@gmail.com>, Andrew Morton
	 <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, Geert
 Uytterhoeven <geert@linux-m68k.org>
Cc: Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph
 Lameter <cl@linux.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Sam Creasey	 <sammy@sammy.net>, Huacai Chen <chenhuacai@kernel.org>, Will
 Deacon	 <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Oreoluwa Babatunde <quic_obabatun@quicinc.com>, rafael.j.wysocki@intel.com,
 Palmer Dabbelt <palmer@rivosinc.com>,  Hanjun Guo <guohanjun@huawei.com>,
 Easwar Hariharan <eahariha@linux.microsoft.com>, Johannes Berg	
 <johannes.berg@intel.com>, Ingo Molnar <mingo@kernel.org>, Dave Hansen	
 <dave.hansen@intel.com>, Christian Brauner <brauner@kernel.org>, KP Singh	
 <kpsingh@kernel.org>, Richard Henderson <richard.henderson@linaro.org>,
 Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>,
 WANG Xuerui <kernel@xen0n.name>,  Michael Ellerman <mpe@ellerman.id.au>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne	
 <shorne@gmail.com>, Helge Deller <deller@gmx.de>, Nicholas Piggin	
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen
 N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Geoff
 Levand	 <geoff@infradead.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt	 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrey Ryabinin	 <ryabinin.a.a@gmail.com>, Alexander Potapenko
 <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov
 <dvyukov@google.com>, Vincenzo Frascino	 <vincenzo.frascino@arm.com>, Heiko
 Carstens <hca@linux.ibm.com>, Vasily Gorbik	 <gor@linux.ibm.com>, Alexander
 Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Yoshinori
 Sato	 <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, John
 Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Andreas Larsson
 <andreas@gaisler.com>, Richard Weinberger	 <richard@nod.at>, Anton Ivanov
 <anton.ivanov@cambridgegreys.com>, Johannes Berg	
 <johannes@sipsolutions.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar	 <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen	
 <dave.hansen@linux.intel.com>, x86@kernel.org, linux-alpha@vger.kernel.org,
 	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, kasan-dev@googlegroups.com, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, 	linux-um@lists.infradead.org,
 linux-acpi@vger.kernel.org, 	xen-devel@lists.xenproject.org,
 linux-omap@vger.kernel.org, 	linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mm@kvack.org, 	linux-pm@vger.kernel.org
Date: Sun, 22 Dec 2024 13:51:08 +0800
In-Reply-To: <20241222054331.2705948-1-guoweikang.kernel@gmail.com>
References: <20241222054331.2705948-1-guoweikang.kernel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, 2024-12-22 at 13:43 +0800, Guo Weikang wrote:
> Before SLUB initialization, various subsystems used memblock_alloc to
> allocate memory. In most cases, when memory allocation fails, an immediat=
e
> panic is required. To simplify this behavior and reduce repetitive checks=
,
> introduce `memblock_alloc_or_panic`. This function ensures that memory
> allocation failures result in a panic automatically, improving code
> readability and consistency across subsystems that require this behavior.
>=20
> Signed-off-by: Guo Weikang <guoweikang.kernel@gmail.com>
> ---


Please try to avoid bumping the patch revision number so quickly.

And if you must do it, you should embed a ChangeLog of your patch (below
this "---" line) so people can know what has been changed.

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University

