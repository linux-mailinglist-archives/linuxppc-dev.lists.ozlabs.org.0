Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C21E21305
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2019 06:26:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 454wGc56MvzDqRm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2019 14:26:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=socionext.com
 (client-ip=210.131.2.91; helo=conssluserg-06.nifty.com;
 envelope-from=yamada.masahiro@socionext.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.b="MjmYEj/7"; 
 dkim-atps=neutral
Received: from conssluserg-06.nifty.com (conssluserg-06.nifty.com
 [210.131.2.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 454wDj1yFfzDqQM
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2019 14:24:52 +1000 (AEST)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com
 [209.85.217.50]) (authenticated)
 by conssluserg-06.nifty.com with ESMTP id x4H4OWoc020561
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2019 13:24:33 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com x4H4OWoc020561
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1558067073;
 bh=XSdURHr+DFj73XgjlE8DVqoSorih7QO9jSg+HW1D8TM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=MjmYEj/7xZIYGboJToCEBgv5PN/8CD6sDWZgip2cIfkO7e3Ii9sfP5C3OkJ+w+bmf
 nV6cmWzKaBSSjsZhyrn4bys5Y4Q6I+OEw7Kw5shBSlS1idFvlydMF1XAeStprazHXe
 YEbmOvO03hshhgHZXMzPoXOKrUM23BsqSOjE9eL/rkptHR8OUhQKwyp/IklD0+/Dl9
 owyazsPp24tpqnpga80RjHHMgFR00FgPaqDWKyOVGScKcv6zoiLl/Anuo6IiuxTxjf
 qbtJQzYFIsrlK27Oe+MJKRLUUuHhjaC4kJm7cNQh1CbYjHyDzVm4085SMLX6fx2uBd
 H18+0yFykqaGg==
X-Nifty-SrcIP: [209.85.217.50]
Received: by mail-vs1-f50.google.com with SMTP id x184so2751633vsb.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2019 21:24:32 -0700 (PDT)
X-Gm-Message-State: APjAAAUrCriz8tiBkZbkyJUcU1didB39+LloKWymKF4KJom/53fa/Lg5
 e2UdrEhF2FWDqRSD2kGz0Ssud8XoKVUfvQtCmvA=
X-Google-Smtp-Source: APXvYqwRom2nfToM4jL1gKybhnXBZPLM/8GRypEcR2drcSxkNBd5y+Id9rfE+eiIpAnAfm5gkg5AbPeOHdYPagE+d9M=
X-Received: by 2002:a67:ad0f:: with SMTP id t15mr7896301vsl.179.1558067071748; 
 Thu, 16 May 2019 21:24:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190423034959.13525-1-yamada.masahiro@socionext.com>
 <20190423034959.13525-5-yamada.masahiro@socionext.com>
 <aa73f81d-5d5a-a1d2-5239-3e8eb1278ec4@redhat.com>
In-Reply-To: <aa73f81d-5d5a-a1d2-5239-3e8eb1278ec4@redhat.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 17 May 2019 13:23:55 +0900
X-Gmail-Original-Message-ID: <CAK7LNAST5y9Khg0BBz6W0mekPpuLPwWa9nPvvVENidWhHZ-avw@mail.gmail.com>
Message-ID: <CAK7LNAST5y9Khg0BBz6W0mekPpuLPwWa9nPvvVENidWhHZ-avw@mail.gmail.com>
Subject: Re: [RESEND PATCH v3 04/11] s390/cpacf: mark scpacf_query() as
 __always_inline
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

On Fri, May 17, 2019 at 8:01 AM Laura Abbott <labbott@redhat.com> wrote:
>
> On 4/22/19 8:49 PM, Masahiro Yamada wrote:
> > This prepares to move CONFIG_OPTIMIZE_INLINING from x86 to a common
> > place. We need to eliminate potential issues beforehand.
> >
> > If it is enabled for s390, the following error is reported:
> >
> > In file included from arch/s390/crypto/des_s390.c:19:
> > ./arch/s390/include/asm/cpacf.h: In function 'cpacf_query':
> > ./arch/s390/include/asm/cpacf.h:170:2: warning: asm operand 3 probably doesn't match constraints
> >    asm volatile(
> >    ^~~
> > ./arch/s390/include/asm/cpacf.h:170:2: error: impossible constraint in 'asm'
> >
>
> This also seems to still be broken, again with gcc 9.1.1
>
> BUILDSTDERR: In file included from arch/s390/crypto/prng.c:29:
> BUILDSTDERR: ./arch/s390/include/asm/cpacf.h: In function 'cpacf_query_func':
> BUILDSTDERR: ./arch/s390/include/asm/cpacf.h:170:2: warning: asm operand 3 probably doesn't match constraints
> BUILDSTDERR:   170 |  asm volatile(
> BUILDSTDERR:       |  ^~~
> BUILDSTDERR: ./arch/s390/include/asm/cpacf.h:170:2: error: impossible constraint in 'asm'
>
> I realized we're still carrying a patch to add -fno-section-anchors
> but it's a similar failure to powerpc.


Christophe had already pointed out potential issues for "i" constraint,
and I have fixups in hand:

See
https://lkml.org/lkml/2019/5/3/459


My plan was to send it after all of my base patches
were merged.

This s390 cparf.h is included in the TODO list.

Will fix soon.

Thanks.

-- 
Best Regards
Masahiro Yamada
