Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2741D150A40
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Feb 2020 16:50:07 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48BC2M3TVyzDqGW
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Feb 2020 02:50:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::843; helo=mail-qt1-x843.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.a=rsa-sha256
 header.s=google header.b=kUu9P+c9; dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48BC0S3Q0VzDqFv
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Feb 2020 02:48:22 +1100 (AEDT)
Received: by mail-qt1-x843.google.com with SMTP id d5so11805584qto.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Feb 2020 07:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YNMOJs1FPm/l462+AObUcJBpy8J/6Ie1z+BZTrXlP78=;
 b=kUu9P+c9Xi/sRwQmUmgRczJtLr5gqK+yFzRIYgulkIKq53mKQTosQf2B1M6rGAi1Vz
 zf6l65bkbMXSBdMvkcorvRBREKJsVTppzgxLeEe94RRQYYE5rTfTkBy5PLm4V1jr5ZQ2
 8/TkMtxS7aFoHnfHuQCreV0p97LuOHmi4sH1PeQhHzRc+prSAziRCba+Efew+79NFeug
 7sAupOPSdzNPuzEGx/PoF+bkDk7yc1blkxEFffDT9NhTb2wE5i6A49kcGqskeWYy690O
 nI+R4iCW7RBwWJK/FMvjoUPLd2pEL4Dy23U+/NizYdlcaK8tA1r3cfCm2lrDynXLFW6Q
 69MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YNMOJs1FPm/l462+AObUcJBpy8J/6Ie1z+BZTrXlP78=;
 b=siNNFaLNJVNDbcUlEVWoIDxf3jxxpFj8arZJzklEmSu0uCkMcoDpAodC8zimIaDg2G
 +w45ijOY76+674JYz2C3bEC8ahmcJEwbdF2enqllw/2l2KfW1mgg6eW+aobxae44WPMf
 Adq8t1hcGw8cjDTQXuv0GfB/TUwbc+bU075gWvnY1jjprZXtDOF6/pn+RFPXMlYQfyE4
 nZ+TuHYRk8qAjYj2Mapewrrye6Uq4y3oubO28SbLz7MrIBVoyEvw4iC+//pq2swZtV75
 Tz9gO8AFLBp6qAqJsC3B2Qe/prSCYgGs+2FHFHJkY7ypxGk0Iqw89gzGq5xZV9y925+0
 Go8A==
X-Gm-Message-State: APjAAAUnp32cQpIKi6MBSmtrsXa6psPWQfwMLDUcfOOWfLAmJDRfRZMq
 IuodPL/24PAsZ/hpHAOOvgGYnQ==
X-Google-Smtp-Source: APXvYqzzoz8hW5WNsRr+QGAP5pmz1r20ujicRCSbC4RPyZEQg2Pm/930hS/RB0M0ITiwlO80rrs//A==
X-Received: by 2002:ac8:7695:: with SMTP id g21mr22123082qtr.99.1580744899546; 
 Mon, 03 Feb 2020 07:48:19 -0800 (PST)
Received: from dhcp-41-57.bos.redhat.com (nat-pool-bos-t.redhat.com.
 [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id n132sm9814556qke.58.2020.02.03.07.48.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Feb 2020 07:48:18 -0800 (PST)
Message-ID: <1580744894.7365.3.camel@lca.pw>
Subject: Re: [PATCH V12] mm/debug: Add tests validating architecture page
 table helpers
From: Qian Cai <cai@lca.pw>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Date: Mon, 03 Feb 2020 10:48:14 -0500
In-Reply-To: <8e94a073-4045-89aa-6a3b-24847ad7c858@c-s.fr>
References: <473d8198-3ac4-af3b-e2ec-c0698a3565d3@c-s.fr>
 <2C4ADFAE-7BB4-42B7-8F54-F036EA7A4316@lca.pw>
 <8e94a073-4045-89aa-6a3b-24847ad7c858@c-s.fr>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6 (3.22.6-10.el7) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Mark Rutland <Mark.Rutland@arm.com>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 James Hogan <jhogan@kernel.org>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 kasan-dev <kasan-dev@googlegroups.com>, sparclinux@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-s390@vger.kernel.org,
 x86@kernel.org, Russell King - ARM Linux <linux@armlinux.org.uk>,
 Matthew Wilcox <willy@infradead.org>, Steven Price <Steven.Price@arm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 linux-snps-arc@lists.infradead.org, Ingo Molnar <mingo@kernel.org>,
 Kees Cook <keescook@chromium.org>,
 Anshuman Khandual <Anshuman.Khandual@arm.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Mark Brown <broonie@kernel.org>, "Kirill A . Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>,
 linux-arm-kernel@lists.infradead.org,
 Sri Krishna chowdary <schowdary@nvidia.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Hansen <dave.hansen@intel.com>, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org,
 Paul Burton <paul.burton@mips.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Vineet Gupta <vgupta@synopsys.com>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2020-02-03 at 16:14 +0100, Christophe Leroy wrote:
> 
> Le 02/02/2020 à 12:26, Qian Cai a écrit :
> > 
> > 
> > > On Jan 30, 2020, at 9:13 AM, Christophe Leroy <christophe.leroy@c-s.fr> wrote:
> > > 
> > > config DEBUG_VM_PGTABLE
> > >     bool "Debug arch page table for semantics compliance" if ARCH_HAS_DEBUG_VM_PGTABLE || EXPERT
> > >     depends on MMU
> > >     default 'n' if !ARCH_HAS_DEBUG_VM_PGTABLE
> > >     default 'y' if DEBUG_VM
> > 
> > Does it really necessary to potentially force all bots to run this? Syzbot, kernel test robot etc? Does it ever pay off for all their machine times there?
> > 
> 
> Machine time ?
> 
> On a 32 bits powerpc running at 132 MHz, the tests takes less than 10ms. 
> Is it worth taking the risk of not detecting faults by not selecting it 
> by default ?

The risk is quite low as Catalin mentioned this thing is not to detect
regressions but rather for arch/mm maintainers.

I do appreciate the efforts to get everyone as possible to run this thing,
so it get more notices once it is broken. However, DEBUG_VM seems like such
a generic Kconfig those days that have even been enabled by default for
Fedora Linux, so I would rather see a more sensitive default been taken
even though the test runtime is fairly quickly on a small machine for now.

> 
> [    5.656916] debug_vm_pgtable: debug_vm_pgtable: Validating 
> architecture page table helpers
> [    5.665661] debug_vm_pgtable: debug_vm_pgtable: Validated 
> architecture page table helpers

