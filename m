Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8483B464158
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 23:33:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J3cS42zM7z3bjC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Dec 2021 09:33:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MQT0554s;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=MQT0554s; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J3ZZB1X21z2xtQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Dec 2021 08:08:18 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2D78AB81C4F;
 Tue, 30 Nov 2021 21:08:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78438C53FC7;
 Tue, 30 Nov 2021 21:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638306491;
 bh=CGQDQlRxlHpJq0xzSuKQi7AU9OYm37j7CJ7xfuMMlQY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MQT0554slXBNgzV6dz6ATkc3EGBq02EcnyIjFHm4NC/TQW+Ti/5+ZwpYdUyXTQSX0
 FP/Mg9FHX1WkJdgEmvH+Sjh6chDp0qa4rdvwceLtLU4mrx9YqTjWtdVLiOuUAqqTr9
 JxBBF8wiCf2msoHxAESTMHrwoozuA53LUQYu0nChlx4mPkmdPvsjcuZz6ld/73Q1EP
 49cP1v8fZ5yU4pp+jiMhNoi6TZsD6QEaZ+s7211uBewrAF+q/t4jJF4C5l0VvizKZK
 UqaJcABTKX49+eBLI8ebfD/p5ZMIh9Z6ly7YavV63rHaytjZkBuc5OrtUPGVxLkKwd
 8IDw15RIkFr7Q==
Date: Tue, 30 Nov 2021 23:07:40 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 0/2] of: remove reserved regions count restriction
Message-ID: <YaaSnJ2Meo5mEKDN@kernel.org>
References: <20211119075844.2902592-1-calvinzhang.cool@gmail.com>
 <YZnqo3oA7srQik4N@kernel.org> <YaVrahm+ysoQRGKe@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YaVrahm+ysoQRGKe@robh.at.kernel.org>
X-Mailman-Approved-At: Wed, 01 Dec 2021 09:32:35 +1100
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
 Guo Ren <guoren@kernel.org>, Calvin Zhang <calvinzhang.cool@gmail.com>,
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
 linux-csky@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
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

On Mon, Nov 29, 2021 at 06:08:10PM -0600, Rob Herring wrote:
> On Sun, Nov 21, 2021 at 08:43:47AM +0200, Mike Rapoport wrote:
> > On Fri, Nov 19, 2021 at 03:58:17PM +0800, Calvin Zhang wrote:
> > > The count of reserved regions in /reserved-memory was limited because
> > > the struct reserved_mem array was defined statically. This series sorts
> > > out reserved memory code and allocates that array from early allocator.
> > > 
> > > Note: reserved region with fixed location must be reserved before any
> > > memory allocation. While struct reserved_mem array should be allocated
> > > after allocator is activated. We make early_init_fdt_scan_reserved_mem()
> > > do reservation only and add another call to initialize reserved memory.
> > > So arch code have to change for it.
> > 
> > I think much simpler would be to use the same constant for sizing
> > memblock.reserved and reserved_mem arrays.
> 
> Do those arrays get shrunk? Or do we waste the memory forever?

Memblock arrays don't get shrunk, but they are __init unless an architecture
chose to keep them after boot, but most architectures that use device tree
actually keep memblock structures.
 
> Maybe we can copy and shrink the initial array? Though I suspect struct 
> reserved_mem pointers have already been given out.

I'm not sure. It seems that reserved_mem pointers are given out at initcall
time and AFAIU the reserved_mem array is created somewhere around
setup_arch(). So maybe it's possible to copy and shrink the initial array.
 
> > 
> > If there is too much reserved regions in the device tree, reserving them in
> > memblock will fail anyway because memblock also starts with static array
> > for memblock.reserved, so doing one pass with memblock_reserve() and
> > another to set up reserved_mem wouldn't help anyway.
> > 
> > > I'm only familiar with arm and arm64 architectures. Approvals from arch
> > > maintainers are required. Thank you all.

-- 
Sincerely yours,
Mike.
