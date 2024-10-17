Return-Path: <linuxppc-dev+bounces-2335-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF179A19C8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Oct 2024 06:41:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XTZtG6fl1z2yyR;
	Thu, 17 Oct 2024 15:41:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729140102;
	cv=none; b=ez755i6OhQYg6Ii9cS8dtnpzQArK4P9JdQ8BeH/kGeAfLe5AeGovEgTJw6LrHf/eKTlpowe2MTA/gpOLhJow0wibHuNqtazr8JUkzB71LLZDW1qxgn5c0AIeY7oTfeze8yok+DhXPTWiEfeNB+uyUu1fVxys78F6BYskVr3fhkogwoMWnw1Cf0aERMEtHp6oYq++BQHcF2kYGjqEU0ST3yysCb5X4c/7On2qvgEFfgUqxv8CTpCuoJ35PDfvL60lJUI0kAHQaXMkgPvtrsSlXN0ORKMUELE61y1rDfAdXgN7LYDSiupkeZZFmUvxuQXsrqrmTYkSF3wIlFGa7l6BfA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729140102; c=relaxed/relaxed;
	bh=jf61mCBMHvrH66qg76c5nWI7BGi0ddGxXBp4nkUpntc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OtM0n18ekFPrt06qEO8Cg5sHsFDfVzob+Xf2JN//ZO3+PXLyx3CiFhWO8fmUIjC49v42FB58nbu00R88aOArCeQuvXkqQFnXMpxB992FS+O94wSG0nI0mKe2U/MgAJE2LwUMV8/8q0eR0CUj773fuFWNJxy7ErMrQytQkpxZLUWgQWlS0x199qIyGHukgoQDyKR8fkIL0dtbeEoyAGu8gz6ZohVflOEo7Py65xDGRWMjtqt/0lwsR9DSFnCJ7Y0h2/qQ6Euob0OGiCIb19SIVF6AAFxcq7ftBAWSPszKnFeM4rS87mkRhZeiudZnGT3518KmTocAVxEJgkdqGTFlIA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XTZtF6Q7Sz2yw7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Oct 2024 15:41:41 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4XTZt75P4mz9sPd;
	Thu, 17 Oct 2024 06:41:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6MMm0su871D5; Thu, 17 Oct 2024 06:41:35 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4XTZt74G4dz9rvV;
	Thu, 17 Oct 2024 06:41:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7DC5D8B770;
	Thu, 17 Oct 2024 06:41:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id fWKN7eEXBxpc; Thu, 17 Oct 2024 06:41:35 +0200 (CEST)
Received: from [192.168.233.183] (unknown [192.168.233.183])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 45AE88B764;
	Thu, 17 Oct 2024 06:41:34 +0200 (CEST)
Message-ID: <526fe185-7077-4b51-8ce1-9ef994aa7025@csgroup.eu>
Date: Thu, 17 Oct 2024 06:41:32 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 14/16] modules: Support extended MODVERSIONS info
To: Luis Chamberlain <mcgrof@kernel.org>, Matthew Maurer
 <mmaurer@google.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>,
 Daniel Gomez <da.gomez@samsung.com>, Helge Deller <deller@gmx.de>
Cc: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org,
 gary@garyguo.net, Michael Ellerman <mpe@ellerman.id.au>,
 Alex Gaynor <alex.gaynor@gmail.com>, Benjamin Gray <bgray@linux.ibm.com>,
 Naveen N Rao <naveen@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, neal@gompa.dev,
 marcan@marcan.st, j@jannau.net, asahi@lists.linux.dev,
 linux-modules@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Boqun Feng
 <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, linuxppc-dev@lists.ozlabs.org
References: <20240925233854.90072-1-mmaurer@google.com>
 <20240925233854.90072-15-mmaurer@google.com>
 <ZwmlEYdS0aPVF32k@bombadil.infradead.org>
 <CAGSQo01o4fWYwSzZHX5dyTUKcaCSZ7z-hPQ8w63tgBPGbM_UCA@mail.gmail.com>
 <ZwmnnMmqVWLaelvQ@bombadil.infradead.org>
 <Zwm4lXdKB9RfPQ5M@bombadil.infradead.org>
 <Zwm4v_1wh5RwuHxF@bombadil.infradead.org>
 <CAGSQo03df-tnmwcz4nh3qtuQPKQ2zLHW0juQyKUXGsdeS7QkLA@mail.gmail.com>
 <ZxBKkJu-XPOGs-NG@bombadil.infradead.org>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <ZxBKkJu-XPOGs-NG@bombadil.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 17/10/2024 à 01:21, Luis Chamberlain a écrit :
> On Tue, Oct 15, 2024 at 04:22:22PM -0700, Matthew Maurer wrote:
>> So, the basic things I can think of to test here are:
>>
>> 1. The kernel can still load the previous MODVERSIONS format
>> 2. The kernel can load the new MODVERSIONS format
>> 3. If we artificially tweak a CRC in the previous format, it will fail to load.
>> 4. If we artificially tweak a CRC in the new format, it will fail to load.
>> 5. With CONFIG_EXTENDED_MODVERSIONS enabled, the kernel will build and
>> load modules with long symbol names, with MODVERSIONS enabled.
>>
>> Is there anything else you were thinking of here, or are those the
>> kinds of checks you were envisioning?
> 
> That sounds great. Yeah, the above would be great to test. A while ago
> I wrote a new modules selftests in order to test possible improvements
> on find_symbol() but I also did this due to push the limits of the
> numbers of symbols we could support. I wrote all this to also test the
> possible 64-bit alignment benefits of __ksymtab_ sections on
> architectures without CONFIG_HAVE_ARCH_PREL32_RELOCATIONS (e.g. ppc64,
> ppc64le, parisc, s390x,...). But come to think of it, you might be
> able to easily leverage this to also just test long symbols by self
> generated symbols as another test case. In case its useful to you I've
> put this in a rebased branch 20241016-modules-symtab branch. Feel free
> to use as you see fit.

By reading this, I discovered that was initially added to powerpc by 
commit 271ca788774a ("arch: enable relative relocations for arm64, power 
and x86") and then removed due to problem with modules, see commit 
ff69279a44e9 ("powerpc: disable support for relative ksymtab references")

Wouldn't it be better to try and fix modules and activate again 
CONFIG_HAVE_ARCH_PREL32_RELOCATIONS on powerpc ?

Christophe

