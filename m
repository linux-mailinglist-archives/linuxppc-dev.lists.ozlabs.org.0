Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B45B46293D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 01:44:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J33Q21651z3cY0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 11:44:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.42; helo=mail-ot1-f42.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J32cJ6N98z2yY7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Nov 2021 11:08:16 +1100 (AEDT)
Received: by mail-ot1-f42.google.com with SMTP id
 v15-20020a9d604f000000b0056cdb373b82so27841555otj.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Nov 2021 16:08:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=D8pPDA8BhqYxJlGll70Jfs/EV2c/vlH3kHLgmxR36Bk=;
 b=Qn6ZnHoV9KBB4EPPJqXtrHmEsMxTz6XdfTyHsBNYagp+lYGVDlNeHZu/NEh3CMs6fh
 RDS6qf5XqEzQBqUyfZcFaQ9h81NvV/k1rfA6fxxI/OI3cflmijhDL8dX8fBLCE1n7Pej
 XHn/8VrbhXirIpLndp4P/UKr2ftUVx2a+0mMM6vTCy/QkrGZQz2ib5IidKMK2x7I/Z9a
 zQOMe4Gio9OMQZR6T0IauXawjk0Vym4HPsDJwJ6XrAdsJTX/wd1kG/8+nZhCh6jy5Rv5
 HMe/F7o+4WcIKrdAhEwh67e2twl3582A4k+kSIxSK9d0NZiZ497BvecHnUm5OefuDlsf
 RZLQ==
X-Gm-Message-State: AOAM532CSsAWnjIGG/Q/T2XhDwwTjdXfDmE/+MnP1piwx0XjycRP4HmJ
 Ob3sxxC2t5xcf2w8vvteHQ==
X-Google-Smtp-Source: ABdhPJwHdVFEp5hd/T8aXyXLlCP6k0CfP+fpF2T3r+PJoHiG4EwmK+ob5JSJ6nKmQgmurmZ684PLSA==
X-Received: by 2002:a9d:4702:: with SMTP id a2mr47864106otf.262.1638230893962; 
 Mon, 29 Nov 2021 16:08:13 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id bi20sm3422829oib.29.2021.11.29.16.08.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 16:08:13 -0800 (PST)
Received: (nullmailer pid 864351 invoked by uid 1000);
 Tue, 30 Nov 2021 00:08:10 -0000
Date: Mon, 29 Nov 2021 18:08:10 -0600
From: Rob Herring <robh@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH 0/2] of: remove reserved regions count restriction
Message-ID: <YaVrahm+ysoQRGKe@robh.at.kernel.org>
References: <20211119075844.2902592-1-calvinzhang.cool@gmail.com>
 <YZnqo3oA7srQik4N@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YZnqo3oA7srQik4N@kernel.org>
X-Mailman-Approved-At: Tue, 30 Nov 2021 11:43:13 +1100
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

On Sun, Nov 21, 2021 at 08:43:47AM +0200, Mike Rapoport wrote:
> On Fri, Nov 19, 2021 at 03:58:17PM +0800, Calvin Zhang wrote:
> > The count of reserved regions in /reserved-memory was limited because
> > the struct reserved_mem array was defined statically. This series sorts
> > out reserved memory code and allocates that array from early allocator.
> > 
> > Note: reserved region with fixed location must be reserved before any
> > memory allocation. While struct reserved_mem array should be allocated
> > after allocator is activated. We make early_init_fdt_scan_reserved_mem()
> > do reservation only and add another call to initialize reserved memory.
> > So arch code have to change for it.
> 
> I think much simpler would be to use the same constant for sizing
> memblock.reserved and reserved_mem arrays.

Do those arrays get shrunk? Or do we waste the memory forever?

Maybe we can copy and shrink the initial array? Though I suspect struct 
reserved_mem pointers have already been given out.

> 
> If there is too much reserved regions in the device tree, reserving them in
> memblock will fail anyway because memblock also starts with static array
> for memblock.reserved, so doing one pass with memblock_reserve() and
> another to set up reserved_mem wouldn't help anyway.
> 
> > I'm only familiar with arm and arm64 architectures. Approvals from arch
> > maintainers are required. Thank you all.
> > 
> > Calvin Zhang (2):
> >   of: Sort reserved_mem related code
> >   of: reserved_mem: Remove reserved regions count restriction
> > 
> >  arch/arc/mm/init.c                 |   3 +
> >  arch/arm/kernel/setup.c            |   2 +
> >  arch/arm64/kernel/setup.c          |   3 +
> >  arch/csky/kernel/setup.c           |   3 +
> >  arch/h8300/kernel/setup.c          |   2 +
> >  arch/mips/kernel/setup.c           |   3 +
> >  arch/nds32/kernel/setup.c          |   3 +
> >  arch/nios2/kernel/setup.c          |   2 +
> >  arch/openrisc/kernel/setup.c       |   3 +
> >  arch/powerpc/kernel/setup-common.c |   3 +
> >  arch/riscv/kernel/setup.c          |   2 +
> >  arch/sh/kernel/setup.c             |   3 +
> >  arch/xtensa/kernel/setup.c         |   2 +
> >  drivers/of/fdt.c                   | 107 +---------------
> >  drivers/of/of_private.h            |  12 +-
> >  drivers/of/of_reserved_mem.c       | 189 ++++++++++++++++++++++++-----
> >  include/linux/of_reserved_mem.h    |   4 +
> >  17 files changed, 207 insertions(+), 139 deletions(-)
> > 
> > -- 
> > 2.30.2
> > 
> 
> -- 
> Sincerely yours,
> Mike.
> 
