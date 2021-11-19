Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 72151457BED
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Nov 2021 07:03:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hx2yp2XYDz3cSq
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Nov 2021 17:03:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KPFYp17O;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029;
 helo=mail-pj1-x1029.google.com; envelope-from=calvinzhang.cool@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=KPFYp17O; dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HwXx94H0xz2yPs
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Nov 2021 21:30:19 +1100 (AEDT)
Received: by mail-pj1-x1029.google.com with SMTP id
 np6-20020a17090b4c4600b001a90b011e06so8420636pjb.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Nov 2021 02:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mI6KtEpWF619oecwW9ziIW9hw+HsMKzn28OULpWVurc=;
 b=KPFYp17Oy/uF3pbSIvlZbA7tgtmLiBC3HIruVIaKeBTx1ALHk1wBHI9RWH4Y/TRiM2
 hAq35CyJOhqjAvnIz+XnfBNiKxqvsUzF8MUMqrbb+qoLapa3GCOHgXxaI6x9Km0AlL0K
 2wG7B8CCYpBSr+ZNFswMkvUZagoAlzcdTSS//NHNiGf8CdixgEqb6uKPGS2QpTEgcUAp
 yArb+GP+Q+XhbKyaqKWupK7SJqNy6AAI7qZH/W5TKcSo7ZV4POw8PNPyAsvkQzKhD740
 EiMIWTjA0fXMyULJynwnTQN6Kgk/iWbRQ1iPpWyGjz39JFmP0lOhp61wqe2NJVi1cPEy
 0utQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mI6KtEpWF619oecwW9ziIW9hw+HsMKzn28OULpWVurc=;
 b=nDWFDcsYkR3beeJsx6MO11W5+N42LOOSN1t78KYjC1J0glVcH5URyEiN+FzVCw/mAZ
 1GjGxSOhHO+5DfPk6/THK7FvUJZziebggM97UNTwld2ZLiYnkRuiWkrsRaqvUZZZlv65
 rgPNqjJUAQkT1zAP2Q/Lw/iT9XoI+aBqDG/OzEZvfPfAUJ8aQ+CCUwj0qZT0zI4QUcvW
 XV4NGbpT3LD+DNQ4KczwSjs6WiGeQaKEeQEEg1Zh290TzIoVitlTS9cmjc2nVZLPK/9j
 k/XVIbwg6yK4DklJte9UHrw1mPggGXcPK4wNAZahdARirAMTEYB09dVoFqGYY51QBNqC
 WSXg==
X-Gm-Message-State: AOAM530+bL8owZb8NJWQB8kYn262fLsxNqL0DmnduAPMPPv3gzaz4Cov
 5CihaHCgW22Bk301pg+KrbU=
X-Google-Smtp-Source: ABdhPJwCL45zphX6sAUQpCTH2XR0MI6TO3LxQucz8xUZnsL94laUGiXdLG1KlgE2xhwPB5DYkk54PQ==
X-Received: by 2002:a17:902:bc85:b0:143:954e:8548 with SMTP id
 bb5-20020a170902bc8500b00143954e8548mr73204786plb.82.1637317814262; 
 Fri, 19 Nov 2021 02:30:14 -0800 (PST)
Received: from localhost ([103.99.179.247])
 by smtp.gmail.com with ESMTPSA id u22sm2537834pfk.148.2021.11.19.02.30.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 02:30:14 -0800 (PST)
Date: Fri, 19 Nov 2021 18:30:09 +0800
From: Calvin Zhang <calvinzhang.cool@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 2/2] of: reserved_mem: Remove reserved regions count
 restriction
Message-ID: <YZd8sc6E0bgNA9ag@debian>
References: <20211119075844.2902592-1-calvinzhang.cool@gmail.com>
 <20211119075844.2902592-3-calvinzhang.cool@gmail.com>
 <YZd0uEWNH6Def3+8@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YZd0uEWNH6Def3+8@smile.fi.intel.com>
X-Mailman-Approved-At: Sat, 20 Nov 2021 17:01:52 +1100
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Rich Felker <dalias@libc.org>,
 Jinyang He <hejinyang@loongson.cn>, David Hildenbrand <david@redhat.com>,
 Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
 openrisc@lists.librecores.org, Max Filippov <jcmvbkbc@gmail.com>,
 Anup Patel <anup.patel@wdc.com>, Guo Ren <guoren@linux.alibaba.com>,
 Guo Ren <guoren@kernel.org>, Calvin Zhang <calvinzhang.cool@gmail.com>,
 Nick Kossifidis <mick@ics.forth.gr>, Vladimir Isaev <isaev@synopsys.com>,
 Tiezhu Yang <yangtiezhu@loongson.cn>, Vincent Chen <deanbo422@gmail.com>,
 Will Deacon <will@kernel.org>, Markus Elfring <elfring@users.sourceforge.net>,
 Vitaly Wool <vitaly.wool@konsulko.com>, Jonas Bonn <jonas@southpole.se>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 linux-snps-arc@lists.infradead.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Palmer Dabbelt <palmerdabbelt@google.com>, linux-sh@vger.kernel.org,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>, David Brazdil <dbrazdil@google.com>,
 linux-riscv@lists.infradead.org, Guenter Roeck <linux@roeck-us.net>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Vineet Gupta <vgupta@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Andreas Oetken <andreas.oetken@siemens.com>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Rob Herring <robh+dt@kernel.org>,
 Alexander Sverdlin <alexander.sverdlin@nokia.com>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Stafford Horne <shorne@gmail.com>, linux-csky@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Andrey Konovalov <andreyknvl@gmail.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>, Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Alexandre Ghiti <alex@ghiti.fr>, Nick Hu <nickhu@andestech.com>,
 Atish Patra <atish.patra@wdc.com>, linux-mips@vger.kernel.org,
 Randy Dunlap <rdunlap@infradead.org>, Frank Rowand <frowand.list@gmail.com>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Dinh Nguyen <dinguyen@kernel.org>, Zhang Yunkai <zhang.yunkai@zte.com.cn>,
 Palmer Dabbelt <palmer@dabbelt.com>, Souptick Joarder <jrdr.linux@gmail.com>,
 Marc Zyngier <maz@kernel.org>, Mauri Sandberg <sandberg@mailfence.com>,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 19, 2021 at 11:56:08AM +0200, Andy Shevchenko wrote:
>On Fri, Nov 19, 2021 at 03:58:19PM +0800, Calvin Zhang wrote:
>> Change to allocate reserved_mems dynamically. Static reserved regions
>> must be reserved before any memblock allocations. The reserved_mems
>> array couldn't be allocated until memblock and linear mapping are ready.
>> 
>> So move the allocation and initialization of records and reserved memory
>> from early_init_fdt_scan_reserved_mem() to of_reserved_mem_init().
>
>>  arch/arc/mm/init.c                 |  3 ++
>>  arch/arm/kernel/setup.c            |  2 +
>>  arch/arm64/kernel/setup.c          |  3 ++
>>  arch/csky/kernel/setup.c           |  3 ++
>>  arch/h8300/kernel/setup.c          |  2 +
>>  arch/mips/kernel/setup.c           |  3 ++
>>  arch/nds32/kernel/setup.c          |  3 ++
>>  arch/nios2/kernel/setup.c          |  2 +
>>  arch/openrisc/kernel/setup.c       |  3 ++
>>  arch/powerpc/kernel/setup-common.c |  3 ++
>>  arch/riscv/kernel/setup.c          |  2 +
>>  arch/sh/kernel/setup.c             |  3 ++
>>  arch/xtensa/kernel/setup.c         |  2 +
>
>Isn't x86 missed? Is it on purpose?
>Would be nice to have this in the commit message or fixed accordingly.
AFAIK, x86 doesn't reserve memory through "/reserved-memory" node until now.
Actually, I got the arch list from callers of
early_init_fdt_scan_reserved_mem().
>
>-- 
>With Best Regards,
>Andy Shevchenko
>
>
>
Thanks,
Calvin
