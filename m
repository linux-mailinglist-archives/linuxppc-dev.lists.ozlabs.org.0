Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A87C459653
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Nov 2021 21:58:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hyfl00KGcz2ypZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 07:58:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Tgb5Ic+u;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636;
 helo=mail-pl1-x636.google.com; envelope-from=calvinzhang.cool@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Tgb5Ic+u; dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hxksr6mY1z2xsY
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Nov 2021 20:01:34 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id b11so11501266pld.12
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Nov 2021 01:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=uQeJj6IFfvjTH7tZDTd0bi24dF8RigJdyTH2xVfGgTs=;
 b=Tgb5Ic+uwSSoM4JZA36HMAnlatkdP+klPPLN5bBR4mKKK7eTLYbvh8o7E0EcmDPq2Q
 qLbdPM+Vl8mxGeh64K6wzQ+bz31be5sOsZRi7/BFqa+3UZR2mkUMH1od5ApykCQ4oge7
 PWRsbIqGPWCVfPaQ/9SinTdE1/ZkUXrgz0XtKq4W6GhO2Tqz3W9WDL2YZ864OPwKasYW
 XOd5tML9uld3R9EbWMfJk2iapJud7W6QS3RAsn8xBt2Px10d2Ru8NLyAcujfPW2JGJIW
 WoJyuNX3QATWQwrzDElQcMEP/yNoxhjpnku/gWQVFiahs4VyOBv8MikwZLaNOsRVBr4h
 1RLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uQeJj6IFfvjTH7tZDTd0bi24dF8RigJdyTH2xVfGgTs=;
 b=wm8AKfcc5NX1wPi5Xw3imAUb+AljtyOYU9bEzq5cJUednsgZdQtw21TvFDvTvY5O5K
 jQhQjlmIFqNpQKOnxdngSCuG/T9PnIcZPO20rOwvKVvhuzUokFD/lYaEJXIqws7/IKfD
 zE4kYsAss18mWidwvaiwUB5l+V+bbCD797I4lWM7DZ/PnSi/jrnAP9ubYXKQrY/UQ0qY
 y5VmrlKTUCmYkEhPF6hnJtm0AWfRXfR5/kN1LAQRtXzGIKMNwSBbFpUcRp7O8+YJTGMd
 c/4rnjmi291MX+dBjCM6LnQC8iq272d3V50m4pqMC9dqpcbJLmI1GGJAb3/vKTYna/WY
 2qKA==
X-Gm-Message-State: AOAM5320ciF3GFu4SRCCZSQu0QTiz9gFRLqjLcY9e0/dJvLs/j6qWY2n
 ZtCxCNgNnGJZ1Z8G9vHHzJU=
X-Google-Smtp-Source: ABdhPJzLtHKp3ARITLkl6IEvP9ASH3fdvPyqX2o54+OrpL9oFv6P8ZWeoiFpXMGZlDp44TWDeD62sQ==
X-Received: by 2002:a17:903:1d2:b0:142:24f1:1213 with SMTP id
 e18-20020a17090301d200b0014224f11213mr96857331plh.81.1637485290032; 
 Sun, 21 Nov 2021 01:01:30 -0800 (PST)
Received: from localhost ([103.99.179.247])
 by smtp.gmail.com with ESMTPSA id lp12sm4320990pjb.24.2021.11.21.01.01.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Nov 2021 01:01:29 -0800 (PST)
Date: Sun, 21 Nov 2021 17:01:20 +0800
From: Calvin Zhang <calvinzhang.cool@gmail.com>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH 0/2] of: remove reserved regions count restriction
Message-ID: <YZoK4IiBOTPduEyN@debian>
References: <20211119075844.2902592-1-calvinzhang.cool@gmail.com>
 <YZnqo3oA7srQik4N@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YZnqo3oA7srQik4N@kernel.org>
X-Mailman-Approved-At: Tue, 23 Nov 2021 07:57:41 +1100
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
Cc: "Kirill A. Shutemov" <kirill.shtuemov@linux.intel.com>,
 Mark Rutland <mark.rutland@arm.com>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 Rich Felker <dalias@libc.org>, Jinyang He <hejinyang@loongson.cn>,
 David Hildenbrand <david@redhat.com>, Lee Jones <lee.jones@linaro.org>,
 linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>,
 Anup Patel <anup.patel@wdc.com>, Guo Ren <guoren@linux.alibaba.com>,
 Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org,
 Nick Kossifidis <mick@ics.forth.gr>, Vladimir Isaev <isaev@synopsys.com>,
 Tiezhu Yang <yangtiezhu@loongson.cn>, Vincent Chen <deanbo422@gmail.com>,
 Will Deacon <will@kernel.org>, Markus Elfring <elfring@users.sourceforge.net>,
 Vitaly Wool <vitaly.wool@konsulko.com>, Jonas Bonn <jonas@southpole.se>,
 devicetree@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 uclinux-h8-devel@lists.sourceforge.jp,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Palmer Dabbelt <palmerdabbelt@google.com>, linux-sh@vger.kernel.org,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>, David Brazdil <dbrazdil@google.com>,
 linux-riscv@lists.infradead.org, Guenter Roeck <linux@roeck-us.net>,
 Alexander Sverdlin <alexander.sverdlin@nokia.com>,
 Thierry Reding <treding@nvidia.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>, Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-xtensa@linux-xtensa.org, Vineet Gupta <vgupta@kernel.org>,
 Andreas Oetken <andreas.oetken@siemens.com>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Rob Herring <robh+dt@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Stafford Horne <shorne@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Andrey Konovalov <andreyknvl@gmail.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>, Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org,
 Alexandre Ghiti <alex@ghiti.fr>, Nick Hu <nickhu@andestech.com>,
 Atish Patra <atish.patra@wdc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Frank Rowand <frowand.list@gmail.com>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Dinh Nguyen <dinguyen@kernel.org>, Zhang Yunkai <zhang.yunkai@zte.com.cn>,
 Palmer Dabbelt <palmer@dabbelt.com>, Souptick Joarder <jrdr.linux@gmail.com>,
 Marc Zyngier <maz@kernel.org>, Mauri Sandberg <sandberg@mailfence.com>,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, openrisc@lists.librecores.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Nov 21, 2021 at 08:43:47AM +0200, Mike Rapoport wrote:
>On Fri, Nov 19, 2021 at 03:58:17PM +0800, Calvin Zhang wrote:
>> The count of reserved regions in /reserved-memory was limited because
>> the struct reserved_mem array was defined statically. This series sorts
>> out reserved memory code and allocates that array from early allocator.
>> 
>> Note: reserved region with fixed location must be reserved before any
>> memory allocation. While struct reserved_mem array should be allocated
>> after allocator is activated. We make early_init_fdt_scan_reserved_mem()
>> do reservation only and add another call to initialize reserved memory.
>> So arch code have to change for it.
>
>I think much simpler would be to use the same constant for sizing
>memblock.reserved and reserved_mem arrays.
>
>If there is too much reserved regions in the device tree, reserving them in
>memblock will fail anyway because memblock also starts with static array
>for memblock.reserved, so doing one pass with memblock_reserve() and
>another to set up reserved_mem wouldn't help anyway.

Yes. This happens only if there are two many fixed reserved regions.
memblock.reserved can be resized after paging.

I also find another problem. Initializing dynamic reservation after
paging would fail to mark it no-map because no-map flag works when doing
direct mapping. This seems to be a circular dependency.

Thank You,
Calvin
