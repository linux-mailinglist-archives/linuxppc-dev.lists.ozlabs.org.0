Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEA9741D62
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 02:51:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eVGM60hx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qs0Jj1pqxz3bVJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 10:51:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eVGM60hx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QryqP6XjGz2xwG
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jun 2023 09:44:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=mkpKticynoUGDZ1Tdpq3P9FZu5kxXQf0JefJvMLgJuA=; b=eVGM60hxW/1oCROBhJRKbbF9pd
	/WHGc+o+pb+fkeVze6GKs3Hcu2mjtmWM/4oUGYCU0t+UbFMtrvvcjHSl/cglLWbeBdgmG30OqcMNt
	S2Pr1+dHNTd4T3qFeiVwQeps/R+LjlmcLTRsuZ8NdhZsmraeYrB2Kel7p0VxJ6+7q7EgMQ6Wx6ank
	P+yHcdGkzLdLPcfc5husZ1HslNubmokchQy4wGscGAVnBMae971Q/C5VLDp5JrfEWC1X5YToHzDHK
	+ikxlG8dV0EOrjRrjMKr08rEq8iFClaMjdpXxuLncvJrq9YBnHim1BxRohfVxP5cT8JFsbmDDx9YM
	9l9IY3yQ==;
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qEeow-00H298-0w;
	Wed, 28 Jun 2023 23:43:34 +0000
Message-ID: <08e273fc-49c5-dd09-1c9e-d85a080767f9@infradead.org>
Date: Wed, 28 Jun 2023 16:43:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH] syscalls: Cleanup references to sys_lookup_dcookie()
Content-Language: en-US
To: Sohil Mehta <sohil.mehta@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-api@vger.kernel.org, linux-arch@vger.kernel.org
References: <20230628230935.1196180-1-sohil.mehta@intel.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230628230935.1196180-1-sohil.mehta@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 29 Jun 2023 10:50:12 +1000
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Max Filippov <jcmvbkbc@gmail.com>, Andreas Schwab <schwab@linux-m68k.org>, "H . Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, "Eric W . Biederman" <ebiederm@xmission.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Matt Turner <mattst88@gmail.
 com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Sergei Trofimovich <slyich@gmail.com>, Vasily Gorbik <gor@linux.ibm.com>, Brian Gerst <brgerst@gmail.com>, Heiko Carstens <hca@linux.ibm.com>, Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, linux-mips@vger.kernel.org, Rohan McLure <rmclure@linux.ibm.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Arnaldo Carvalho de Melo <acme@kernel.org>, Andy Lutomirski <luto@kernel.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Adrian Hunter <adrian.hunter@intel.com>, linux-perf-users@vger.kernel.org, Sven Schnelle <svens@linux.ibm.com>, Jiri Olsa <jolsa@kernel.org>, linux-alpha@vger.kernel.org, Bo
 rislav Petkov <bp@alien8.de>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 6/28/23 16:09, Sohil Mehta wrote:
> commit 'be65de6b03aa ("fs: Remove dcookies support")' removed the
> syscall definition for lookup_dcookie.  However, syscall tables still
> point to the old sys_lookup_dcookie() definition. Update syscall tables
> of all architectures to directly point to sys_ni_syscall() instead.
> 
> Signed-off-by: Sohil Mehta <sohil.mehta@intel.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
> This patch has a dependency on another patch that has been applied to the
> asm-generic tree:
> https://lore.kernel.org/lkml/20230621223600.1348693-1-sohil.mehta@intel.com/
> ---
>  arch/alpha/kernel/syscalls/syscall.tbl              | 2 +-
>  arch/arm/tools/syscall.tbl                          | 2 +-
>  arch/arm64/include/asm/unistd32.h                   | 4 ++--
>  arch/ia64/kernel/syscalls/syscall.tbl               | 2 +-
>  arch/m68k/kernel/syscalls/syscall.tbl               | 2 +-
>  arch/microblaze/kernel/syscalls/syscall.tbl         | 2 +-
>  arch/mips/kernel/syscalls/syscall_n32.tbl           | 2 +-
>  arch/mips/kernel/syscalls/syscall_n64.tbl           | 2 +-
>  arch/mips/kernel/syscalls/syscall_o32.tbl           | 2 +-
>  arch/parisc/kernel/syscalls/syscall.tbl             | 2 +-
>  arch/powerpc/kernel/syscalls/syscall.tbl            | 2 +-
>  arch/s390/kernel/syscalls/syscall.tbl               | 2 +-
>  arch/sh/kernel/syscalls/syscall.tbl                 | 2 +-
>  arch/sparc/kernel/syscalls/syscall.tbl              | 2 +-
>  arch/x86/entry/syscalls/syscall_32.tbl              | 2 +-
>  arch/x86/entry/syscalls/syscall_64.tbl              | 2 +-
>  arch/xtensa/kernel/syscalls/syscall.tbl             | 2 +-
>  include/linux/compat.h                              | 1 -
>  include/linux/syscalls.h                            | 1 -
>  include/uapi/asm-generic/unistd.h                   | 2 +-
>  kernel/sys_ni.c                                     | 2 --
>  tools/include/uapi/asm-generic/unistd.h             | 2 +-
>  tools/perf/arch/mips/entry/syscalls/syscall_n64.tbl | 2 +-
>  tools/perf/arch/powerpc/entry/syscalls/syscall.tbl  | 2 +-
>  tools/perf/arch/s390/entry/syscalls/syscall.tbl     | 2 +-
>  tools/perf/arch/x86/entry/syscalls/syscall_64.tbl   | 2 +-
>  26 files changed, 24 insertions(+), 28 deletions(-)
> 


-- 
~Randy
