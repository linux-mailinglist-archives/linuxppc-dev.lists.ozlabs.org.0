Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA563459652
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Nov 2021 21:58:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HyfkF3MG5z2xBx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 07:58:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=o40YeyKW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=o40YeyKW; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HxgqV48hrz2xtC
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Nov 2021 17:44:22 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 60B98604AC;
 Sun, 21 Nov 2021 06:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637477055;
 bh=fF0qMHEWbaZWbEit/VvNjQKirKtWS4o0c8b9dFvtOFg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o40YeyKWlss6qPqzIaBC1BRaoNsy8h4lRluMS6PA711BRFcqyhJOnzbksEMtKtJO/
 8jbTZZa3TfDTwFyR4bB+BvkwZH8B4Lq6zUtBDhL0B4WDBH9OrnY/ZIAuUCLySCed3G
 BY0pW/832nzdNqDcLtde/+ux9ozmIiM3YLALWMwekxe0nZCbZ8Eac9fyNJkYF8xblI
 zzUk/gDwJpgD0wAYRzlFYo+zhx5+msTuR9KF/8/1WOgKdEL1RlhcobAeHzb+LuS7g/
 jBCVo5DEsOze9uLZm95vmKlvgKfjbEPyxEhw1wZAFN+rxMTmDM0V/oXbaGrjJoZ0t1
 JqBkAezCYdBnA==
Date: Sun, 21 Nov 2021 08:43:47 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Calvin Zhang <calvinzhang.cool@gmail.com>
Subject: Re: [PATCH 0/2] of: remove reserved regions count restriction
Message-ID: <YZnqo3oA7srQik4N@kernel.org>
References: <20211119075844.2902592-1-calvinzhang.cool@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211119075844.2902592-1-calvinzhang.cool@gmail.com>
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

On Fri, Nov 19, 2021 at 03:58:17PM +0800, Calvin Zhang wrote:
> The count of reserved regions in /reserved-memory was limited because
> the struct reserved_mem array was defined statically. This series sorts
> out reserved memory code and allocates that array from early allocator.
> 
> Note: reserved region with fixed location must be reserved before any
> memory allocation. While struct reserved_mem array should be allocated
> after allocator is activated. We make early_init_fdt_scan_reserved_mem()
> do reservation only and add another call to initialize reserved memory.
> So arch code have to change for it.

I think much simpler would be to use the same constant for sizing
memblock.reserved and reserved_mem arrays.

If there is too much reserved regions in the device tree, reserving them in
memblock will fail anyway because memblock also starts with static array
for memblock.reserved, so doing one pass with memblock_reserve() and
another to set up reserved_mem wouldn't help anyway.

> I'm only familiar with arm and arm64 architectures. Approvals from arch
> maintainers are required. Thank you all.
> 
> Calvin Zhang (2):
>   of: Sort reserved_mem related code
>   of: reserved_mem: Remove reserved regions count restriction
> 
>  arch/arc/mm/init.c                 |   3 +
>  arch/arm/kernel/setup.c            |   2 +
>  arch/arm64/kernel/setup.c          |   3 +
>  arch/csky/kernel/setup.c           |   3 +
>  arch/h8300/kernel/setup.c          |   2 +
>  arch/mips/kernel/setup.c           |   3 +
>  arch/nds32/kernel/setup.c          |   3 +
>  arch/nios2/kernel/setup.c          |   2 +
>  arch/openrisc/kernel/setup.c       |   3 +
>  arch/powerpc/kernel/setup-common.c |   3 +
>  arch/riscv/kernel/setup.c          |   2 +
>  arch/sh/kernel/setup.c             |   3 +
>  arch/xtensa/kernel/setup.c         |   2 +
>  drivers/of/fdt.c                   | 107 +---------------
>  drivers/of/of_private.h            |  12 +-
>  drivers/of/of_reserved_mem.c       | 189 ++++++++++++++++++++++++-----
>  include/linux/of_reserved_mem.h    |   4 +
>  17 files changed, 207 insertions(+), 139 deletions(-)
> 
> -- 
> 2.30.2
> 

-- 
Sincerely yours,
Mike.
