Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D69B3212CD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2019 06:21:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 454w8D0T3gzDqS5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2019 14:21:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=socionext.com
 (client-ip=210.131.2.81; helo=conssluserg-02.nifty.com;
 envelope-from=yamada.masahiro@socionext.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.b="c0LtECK4"; 
 dkim-atps=neutral
Received: from conssluserg-02.nifty.com (conssluserg-02.nifty.com
 [210.131.2.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 454w6k0nHKzDqQL
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2019 14:19:41 +1000 (AEST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com
 [209.85.222.51]) (authenticated)
 by conssluserg-02.nifty.com with ESMTP id x4H4J8mJ012723
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2019 13:19:09 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com x4H4J8mJ012723
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1558066749;
 bh=J7yAUK19cep0kEYDzk4DJ/4J6NgS5gQ7gjFkMhf0nf0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=c0LtECK4wG0ntD78HJSVal1PgIaDPnG3TYgZdKUwPQb1na1TUOyc7O8nFlNd6CaCm
 AXsspHBBBxyBH+xc+yKwpj4hyYVIlPFcjcW/vHsJL5fSi5Q2gSwjjErNYCHX7DoDJk
 uzHnaxZfaH6FQsso8f00WBIqbL0o02CmwbkFxF8m6vBwnpe79+CLRENPKmsLOuBRZS
 H1BuxVeZipFZOyAH3A/7goUgdI8wKHrHt3j0pC8tQP/JX2YVrYwXhbMxIntV2ieT5M
 FSH/2b85VtqV4XO16MdlVD3fBZ0eNwSQDAHODI3YrVqSmTCnoT21JK380X6v99doLI
 2TTH2dRT0iNEA==
X-Nifty-SrcIP: [209.85.222.51]
Received: by mail-ua1-f51.google.com with SMTP id t18so2187729uar.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2019 21:19:08 -0700 (PDT)
X-Gm-Message-State: APjAAAX3JlhVWGN+7RurWql/qAtcMoO0WwexvxoCQDTvwIRodQ3xNGvD
 XvylRdt7J4XyYJ4BWdkgKhgTWv3P4Zl5y1TEcPE=
X-Google-Smtp-Source: APXvYqw2YDleh3v/xnLGvb0ytg007xtjBjm7KsoOOxcHJpN/6dfsgAIRhFvSJ0T46JhQEFnSRL0PruWBvw6llY+KDwI=
X-Received: by 2002:ab0:3058:: with SMTP id x24mr23094567ual.95.1558066747792; 
 Thu, 16 May 2019 21:19:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190423034959.13525-1-yamada.masahiro@socionext.com>
 <20190423034959.13525-11-yamada.masahiro@socionext.com>
 <ca74c830-fe1b-7bff-8dfd-353fca57b647@redhat.com>
In-Reply-To: <ca74c830-fe1b-7bff-8dfd-353fca57b647@redhat.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 17 May 2019 13:18:31 +0900
X-Gmail-Original-Message-ID: <CAK7LNASjc8rmJvv5kgk6Mxo3mcB4EgB4XJG_8JY47ZQbrsSSXg@mail.gmail.com>
Message-ID: <CAK7LNASjc8rmJvv5kgk6Mxo3mcB4EgB4XJG_8JY47ZQbrsSSXg@mail.gmail.com>
Subject: Re: [RESEND PATCH v3 10/11] powerpc/mm/radix: mark as __tlbie_pid()
 and friends as__always_inline
To: Laura Abbott <labbott@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-s390 <linux-s390@vger.kernel.org>, Mathieu Malaterre <malat@debian.org>,
 X86 ML <x86@kernel.org>, Heiko Carstens <heiko.carstens@de.ibm.com>,
 linux-mips@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>, linux-mtd <linux-mtd@lists.infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Laura,


On Fri, May 17, 2019 at 7:55 AM Laura Abbott <labbott@redhat.com> wrote:

> What gcc version was this tested with?

I use kernel.org toolchains
https://mirrors.edge.kernel.org/pub/tools/crosstool/

It is GCC 8.1


> We're still seeing errors on
> Fedora rawhide with gcc 9.1.1 on a version (8c05f3b965da14e7790711026b32cc10a4c06213)
> that should have this fix in it:
>
> BUILDSTDERR: arch/powerpc/mm/book3s64/radix_tlb.c: In function '_tlbiel_pid':
> BUILDSTDERR: arch/powerpc/mm/book3s64/radix_tlb.c:104:2: warning: asm operand 3 probably doesn't match constraints
> BUILDSTDERR:   104 |  asm volatile(PPC_TLBIEL(%0, %4, %3, %2, %1)
> BUILDSTDERR:       |  ^~~
> BUILDSTDERR: arch/powerpc/mm/book3s64/radix_tlb.c:104:2: error: impossible constraint in 'asm'
> BUILDSTDERR: make[3]: *** [scripts/Makefile.build:279: arch/powerpc/mm/book3s64/radix_tlb.o] Error 1
> BUILDSTDERR: make[2]: *** [scripts/Makefile.build:489: arch/powerpc/mm/book3s64] Error 2
> BUILDSTDERR: make[1]: *** [scripts/Makefile.build:489: arch/powerpc/mm] Error 2

Thanks for the report.

Does this work for you?


diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c
b/arch/powerpc/mm/book3s64/radix_tlb.c
index 4d841369399f..9a6befdd5e74 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c

@@ -239,7 +239,7 @@ static inline void fixup_tlbie_lpid(unsigned long lpid)
 /*
  * We use 128 set in radix mode and 256 set in hpt mode.
  */
-static inline void _tlbiel_pid(unsigned long pid, unsigned long ric)
+static __always_inline void _tlbiel_pid(unsigned long pid, unsigned long ric)
 {
        int set;




--
Best Regards
Masahiro Yamada
