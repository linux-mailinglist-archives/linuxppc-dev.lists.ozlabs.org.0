Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 86747456C7E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Nov 2021 10:40:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HwWqc3LGWz3bXW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Nov 2021 20:40:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Piq1nJJ8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f;
 helo=mail-pl1-x62f.google.com; envelope-from=calvinzhang.cool@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Piq1nJJ8; dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HwTc16FTZz2yPs
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Nov 2021 19:00:15 +1100 (AEDT)
Received: by mail-pl1-x62f.google.com with SMTP id u17so7525174plg.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Nov 2021 00:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ylfEgGFi9fXXyFv3lgk0Ku/SSf+pSdJSd2RLuFwQy1I=;
 b=Piq1nJJ8yUxBmd7q2OqqhZ04o/Z/X8wPRFgtRzc8HIEZny/6x/zgzkJJLIzrhAa0e4
 +m/UkOZhCq/qceHyHLy6mrK1/J5X45CiYNHNz4LLNboBkuPFruTDbeHDANZN9gaBX4zE
 BOB6y13oTjWi0vF7xJd+4tsqCwxEUlAfE+LU/vlE+4bU80+Ekh940qsjxgz9xnCUr3Qi
 VmT32x+yuH4lxl7Rhd+Oz9STONwHrFxbc04IdCvrFJWCSYvRIOjZFaZysr2qzarcVla2
 /GqHkfvvxM0BK3O8jT5cWAzBmRaFUrfRWcGlu9hx9ier0QPDw7te7Gc5F9LDdGi5XMS6
 NbRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ylfEgGFi9fXXyFv3lgk0Ku/SSf+pSdJSd2RLuFwQy1I=;
 b=TUUfxnTYiy4xnwiubfisgb2uKnbV1ixLPt+Pkl1SpVVzLPResxZOK7rZ3brzj2nnaM
 h3g2ASU3jil5GZwV5MDTV9EHoN9OUGfJXDGoJCsIjvabRdgvwDUMSVfiv7V8BTYa0yzw
 RGK77w1z/y9TjTXtmNk74q09RxO5BMUM2SVx/HbSJdDtkuNyRf1ah9cJPAcVFjmG7nQA
 sQknT4GzqsW7hwKCYwxWrNPqyZQdWKD+5HWdNNnaIQIy/Gd5eo5Mwrw8fy9Iq3VTPEXe
 rdNz/jlib4t8wbGInJtXArDFS0JlSNL2Gsx33PL61ZL9TMXRIvtlYM+NvBVdL4K3LL7I
 Ki4A==
X-Gm-Message-State: AOAM531jMk4dz46dwwcm5ZMTFBClILrq8cxSe2AMXPp/Nw48jez1FaH4
 AJcmYiWRPdJQA9wm7GejO6o=
X-Google-Smtp-Source: ABdhPJyEWl+rgTyJQilluTm65FmkmgWn+LtcD21UQsyfWBcLVUYOXziJspjYdNkg7WaRzd0koE7wlA==
X-Received: by 2002:a17:90a:8815:: with SMTP id
 s21mr2424180pjn.82.1637308812121; 
 Fri, 19 Nov 2021 00:00:12 -0800 (PST)
Received: from localhost.localdomain ([103.99.179.247])
 by smtp.gmail.com with ESMTPSA id o6sm1791259pfh.70.2021.11.18.23.59.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 00:00:11 -0800 (PST)
From: Calvin Zhang <calvinzhang.cool@gmail.com>
To: Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Rich Felker <dalias@libc.org>, Chris Zankel <chris@zankel.net>,
 Max Filippov <jcmvbkbc@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, Mike Rapoport <rppt@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Vladimir Isaev <isaev@synopsys.com>,
 Calvin Zhang <calvinzhang.cool@gmail.com>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 "Kirill A. Shutemov" <kirill.shtuemov@linux.intel.com>,
 Guenter Roeck <linux@roeck-us.net>, Marc Zyngier <maz@kernel.org>,
 David Brazdil <dbrazdil@google.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Souptick Joarder <jrdr.linux@gmail.com>,
 Jinyang He <hejinyang@loongson.cn>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Tiezhu Yang <yangtiezhu@loongson.cn>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Ley Foon Tan <ley.foon.tan@intel.com>,
 Andreas Oetken <andreas.oetken@siemens.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Zhang Yunkai <zhang.yunkai@zte.com.cn>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Markus Elfring <elfring@users.sourceforge.net>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Atish Patra <atish.patra@wdc.com>, Anup Patel <anup.patel@wdc.com>,
 Nick Kossifidis <mick@ics.forth.gr>, Alexandre Ghiti <alex@ghiti.fr>,
 Vitaly Wool <vitaly.wool@konsulko.com>
Subject: [PATCH 0/2] of: remove reserved regions count restriction
Date: Fri, 19 Nov 2021 15:58:17 +0800
Message-Id: <20211119075844.2902592-1-calvinzhang.cool@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 19 Nov 2021 20:39:55 +1100
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
Cc: uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 Guo Ren <guoren@linux.alibaba.com>, linux-snps-arc@lists.infradead.org,
 Mauri Sandberg <sandberg@mailfence.com>, linux-sh@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
 openrisc@lists.librecores.org,
 Alexander Sverdlin <alexander.sverdlin@nokia.com>,
 linux-riscv@lists.infradead.org, Thierry Reding <treding@nvidia.com>,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The count of reserved regions in /reserved-memory was limited because
the struct reserved_mem array was defined statically. This series sorts
out reserved memory code and allocates that array from early allocator.

Note: reserved region with fixed location must be reserved before any
memory allocation. While struct reserved_mem array should be allocated
after allocator is activated. We make early_init_fdt_scan_reserved_mem()
do reservation only and add another call to initialize reserved memory.
So arch code have to change for it.

I'm only familiar with arm and arm64 architectures. Approvals from arch
maintainers are required. Thank you all.

Calvin Zhang (2):
  of: Sort reserved_mem related code
  of: reserved_mem: Remove reserved regions count restriction

 arch/arc/mm/init.c                 |   3 +
 arch/arm/kernel/setup.c            |   2 +
 arch/arm64/kernel/setup.c          |   3 +
 arch/csky/kernel/setup.c           |   3 +
 arch/h8300/kernel/setup.c          |   2 +
 arch/mips/kernel/setup.c           |   3 +
 arch/nds32/kernel/setup.c          |   3 +
 arch/nios2/kernel/setup.c          |   2 +
 arch/openrisc/kernel/setup.c       |   3 +
 arch/powerpc/kernel/setup-common.c |   3 +
 arch/riscv/kernel/setup.c          |   2 +
 arch/sh/kernel/setup.c             |   3 +
 arch/xtensa/kernel/setup.c         |   2 +
 drivers/of/fdt.c                   | 107 +---------------
 drivers/of/of_private.h            |  12 +-
 drivers/of/of_reserved_mem.c       | 189 ++++++++++++++++++++++++-----
 include/linux/of_reserved_mem.h    |   4 +
 17 files changed, 207 insertions(+), 139 deletions(-)

-- 
2.30.2

