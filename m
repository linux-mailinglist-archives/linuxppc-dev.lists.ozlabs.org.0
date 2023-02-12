Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCB3693922
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Feb 2023 18:36:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PFF4q4GXHz3blb
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Feb 2023 04:36:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=MHIS9yii;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::2c; helo=mail-oa1-x2c.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=MHIS9yii;
	dkim-atps=neutral
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com [IPv6:2001:4860:4864:20::2c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PFF3s52pcz3bf6
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Feb 2023 04:35:19 +1100 (AEDT)
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-15fe106c7c7so12808948fac.8
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Feb 2023 09:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AviV4NP8CNDKVbz9j5WTQQVcHZAFX3ps8TmNJsoE4Jc=;
        b=MHIS9yiiSKowWCqVfdLqqCBXCJI87xi4ik1euT9MI5qsuF90euB0z5OyKuHA+cX91w
         YM7Wr6xuS7Jsgd7Y/u17CKVlvOwGsLCmOXhdEeanSjtI1beQ/D1NtEqo8E4P8eQmjrlC
         u7UFMNCSnuCP/T/T+tikXDIsSQMmHH2xGwg65Lv0VkoYlNQzShkSHlh6NsCvKZch8Vej
         m1HG5S97Md/HphSzvy3Z1aOcBibylidfKFslbj4nzbnKfNRe5nxJQMAlztxOYwkeDTKX
         lJ8sbGZbHDOmiA/KDUs9NhF4Uu6i1LxZhJTamcW/BCuJlw1+7dh4aeYpmNhWCcX+M886
         twIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AviV4NP8CNDKVbz9j5WTQQVcHZAFX3ps8TmNJsoE4Jc=;
        b=7B0trbM182DBfQffwKOI8j+Z/eE48wOyIX9vh/rfCUZbhCFKp5iXEqv6C3Wx/2cDtC
         9UbYtrGHfN1HopHcVTy+4G1s3t4T+k2GvEih/p336FAYkNeDgd85laNGDnketvX3FpPI
         DuB6IaX7+wA4ybb3T7LJn90TKcK3IjihG50ix0Pc555SoPmi6HwhfRv6R0D2pGlnCQXS
         lmMUXLorU42KB4sf1C2RXn8BkvYeEAMAhE8F6Hfpb42cspdeV5LW8bf3tmUcMylTdYNB
         FyZ9CUhBGE6hfZ9jyi78iwLxcAN1tgzDZLWZGmGdDEGW6B17MteO6tE+gDYppfJvnblu
         aCKg==
X-Gm-Message-State: AO0yUKVmpTC38d137LAxVk2yWecsl0ZAI1im+M/aNbOOUFqASNmD5ncf
	2PidemHf1pAqkPZ/YIESXOE=
X-Google-Smtp-Source: AK7set+HQUfu5iOqDoYfEGRzO6Asv+HJqu3wHpvaAM105ZXPUWPVLHg/VWo/CEfIvczS113vNKvB7Q==
X-Received: by 2002:a05:6871:9d:b0:15f:32b:6e33 with SMTP id u29-20020a056871009d00b0015f032b6e33mr15518149oaa.39.1676223315946;
        Sun, 12 Feb 2023 09:35:15 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i9-20020a4abc09000000b004a3527e8279sm4076452oop.0.2023.02.12.09.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 09:35:15 -0800 (PST)
Date: Sun, 12 Feb 2023 09:35:13 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v2 2/4] m68k: use asm-generic/memory_model.h for both MMU
 and !MMU
Message-ID: <20230212173513.GA4052259@roeck-us.net>
References: <20230129124235.209895-1-rppt@kernel.org>
 <20230129124235.209895-3-rppt@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230129124235.209895-3-rppt@kernel.org>
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, x86@kernel.org, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, Greg Ungerer <gerg@linux-m68k.org>, linux-arch@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>, linux-alpha@vger.kernel.org, linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org, loongarch@lists.linux.dev, Stafford Horne <shorne@gmail.com>, linux-arm-kernel@lists.infradead.org, Brian Cain <bcain@quicinc.com>, Mic
 hal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On Sun, Jan 29, 2023 at 02:42:33PM +0200, Mike Rapoport wrote:
> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> 
> The MMU variant uses generic definitions of page_to_pfn() and
> pfn_to_page(), but !MMU defines them in include/asm/page_no.h for no
> good reason.
> 
> Include asm-generic/memory_model.h in the common include/asm/page.h and
> drop redundant definitions.
> 
> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

This patch results in a boot failure when trying to boot the mcf5208evb qemu
emulation. Reverting it together with "mm, arch: add generic implementation
of pfn_valid() for FLATMEM" fixes the problem. There is no error log - the
emulation hangs silently until aborted.

Guenter

---
bisect log:

# bad: [6ba8a227fd19d19779005fb66ad7562608e1df83] Add linux-next specific files for 20230210
# good: [4ec5183ec48656cec489c49f989c508b68b518e3] Linux 6.2-rc7
git bisect start 'HEAD' 'v6.2-rc7'
# good: [94613f0efc69ed41f9229ef5c294db3ec37145da] Merge branch 'master' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git
git bisect good 94613f0efc69ed41f9229ef5c294db3ec37145da
# good: [19e62c715fe70dae4582c2874ed3e66715d09af6] Merge branch 'rcu/next' of git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git
git bisect good 19e62c715fe70dae4582c2874ed3e66715d09af6
# good: [5d8b7ecef7f4a681b6e5538db59ff26c389c0ab6] Merge branch 'for-next' of https://gitlab.com/peda-linux/mux.git
git bisect good 5d8b7ecef7f4a681b6e5538db59ff26c389c0ab6
# good: [c349bf6ec83903b20fe570c5609b9a864a64e09c] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/krisman/unicode.git
git bisect good c349bf6ec83903b20fe570c5609b9a864a64e09c
# good: [5a06a9f17454df38f35672be522ff5eb9b4277d2] selftest: add testing unsharing and counting ksm zero page
git bisect good 5a06a9f17454df38f35672be522ff5eb9b4277d2
# bad: [f5d115a7b06e5661ed5218ffa9a2644c4ff1c135] Merge branch 'mm-nonmm-unstable' into mm-everything
git bisect bad f5d115a7b06e5661ed5218ffa9a2644c4ff1c135
# bad: [acb018d6ea0c055381fba7dddaef386ee28f8075] mm/vmalloc.c: allow vread() to read out vm_map_ram areas
git bisect bad acb018d6ea0c055381fba7dddaef386ee28f8075
# good: [1a5d9782ac969dc6e61c6786500b5160603188ea] mm/mmap: remove __vma_adjust()
git bisect good 1a5d9782ac969dc6e61c6786500b5160603188ea
# good: [4b32363697de957dcc890b6245bec3f58903639a] arm: include asm-generic/memory_model.h from page.h rather than memory.h
git bisect good 4b32363697de957dcc890b6245bec3f58903639a
# bad: [328cf3fa6682ce6a4de6f8bb8009c833dc33f3c8] mm/migrate: convert isolate_movable_page() to use folios
git bisect bad 328cf3fa6682ce6a4de6f8bb8009c833dc33f3c8
# bad: [b704c765b08cabe82adf76a4d1a74f3688eee410] mm/mempolicy: convert queue_pages_pmd() to queue_folios_pmd()
git bisect bad b704c765b08cabe82adf76a4d1a74f3688eee410
# bad: [e5734c8b0edfd2a053a5c256189586a3b1e9f63d] mm, arch: add generic implementation of pfn_valid() for FLATMEM
git bisect bad e5734c8b0edfd2a053a5c256189586a3b1e9f63d
# bad: [ad8aecea034c591b9754bc5908da9719853aa7fa] mips: drop definition of pfn_valid() for DISCONTIGMEM
git bisect bad ad8aecea034c591b9754bc5908da9719853aa7fa
# bad: [1f6271a0dfdf952c2e3981f424784d48f243a2be] m68k: use asm-generic/memory_model.h for both MMU and !MMU
git bisect bad 1f6271a0dfdf952c2e3981f424784d48f243a2be
# first bad commit: [1f6271a0dfdf952c2e3981f424784d48f243a2be] m68k: use asm-generic/memory_model.h for both MMU and !MMU
