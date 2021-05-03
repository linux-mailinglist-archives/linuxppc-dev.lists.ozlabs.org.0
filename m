Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D625371541
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 May 2021 14:30:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FYj472Zb7z30FJ
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 May 2021 22:30:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=dsterba@suse.cz;
 receiver=<UNKNOWN>)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FYj3h0p33z2yR2
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 May 2021 22:30:07 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 52E8DAD22;
 Mon,  3 May 2021 12:30:04 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
 id C7B22DA733; Mon,  3 May 2021 14:27:36 +0200 (CEST)
Date: Mon, 3 May 2021 14:27:36 +0200
From: David Sterba <dsterba@suse.cz>
To: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
Message-ID: <20210503122736.GG7604@twin.jikos.cz>
Mail-Followup-To: dsterba@suse.cz, Masahiro Yamada <masahiroy@kernel.org>,
 linux-kernel@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kbuild@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Will Deacon <will@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Mackerras <paulus@samba.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
References: <20210501151538.145449-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210501151538.145449-1-masahiroy@kernel.org>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
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
Reply-To: dsterba@suse.cz
Cc: Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 linux-kbuild@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Miguel Ojeda <ojeda@kernel.org>,
 Paul Mackerras <paulus@samba.org>, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, May 02, 2021 at 12:15:38AM +0900, Masahiro Yamada wrote:
> The current minimum GCC version is 4.9 except ARCH=arm64 requiring
> GCC 5.1.
> 
> When we discussed last time, we agreed to raise the minimum GCC version
> to 5.1 globally. [1]

There are still a lot of comment references to old gcc releases with
workarounds or bugfixes, a quick serarch:

$ git grep -in 'gcc.*[234]\.x'
arch/alpha/include/asm/string.h:30:/* For gcc 3.x, we cannot have the inline function named "memset" because
arch/arc/include/asm/checksum.h:9: *  -gcc 4.4.x broke networking. Alias analysis needed to be primed.
arch/arm/Makefile:127:# Need -Uarm for gcc < 3.x
arch/ia64/lib/memcpy_mck.S:535: * Due to lack of local tag support in gcc 2.x assembler, it is not clear which
arch/mips/include/asm/page.h:210: * also affect MIPS so we keep this one until GCC 3.x has been retired
arch/x86/include/asm/page.h:53: * remove this Voodoo magic stuff. (i.e. once gcc3.x is deprecated)
arch/x86/kvm/x86.c:5569:         * This union makes it completely explicit to gcc-3.x
arch/x86/mm/pgtable.c:302:      if (PREALLOCATED_PMDS == 0) /* Work around gcc-3.4.x bug */
drivers/net/ethernet/renesas/sh_eth.c:51: * that warning from W=1 builds. GCC has supported this option since 4.2.X, but
lib/xz/xz_dec_lzma2.c:494: * of the code generated by GCC 3.x decreases 10-15 %. (GCC 4.3 doesn't care,
lib/xz/xz_dec_lzma2.c:495: * and it generates 10-20 % faster code than GCC 3.x from this file anyway.)
net/core/skbuff.c:32: * The functions in this file will not compile correctly with gcc 2.4.x

This misses version-specific quirks, but the following returns 216
results and not all are problematic (eg. just referring to gcc for some
historical reason) so I'm not pasting it here.

$ git grep -in 'gcc.*[234]\.[0-9]'
...
