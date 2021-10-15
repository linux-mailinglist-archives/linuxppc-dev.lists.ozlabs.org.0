Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2825642FE87
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Oct 2021 01:09:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HWMQm5D9vz3cKv
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Oct 2021 10:09:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=jJhIdB7z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=desiato.20200630 header.b=jJhIdB7z; 
 dkim-atps=neutral
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HW63H3GTPz3bXj
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Oct 2021 00:06:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=GcG/LD4wXLRkh+mkTSYxktAgp6NtEFjg5wt7NUrIBQ8=; b=jJhIdB7zViqIgQ4dXzq0Vzc/Kn
 wSy4O2m2pxg0twYqSCoPMRWR2meOaQTSQpX2tmCESSkMSUyy5L7Y6zQkWtiL93luUWOjqSDBc3XAX
 GRFk8m9CdSP6b/Fkglz5EVDu9pVQI5GiX3rcXUoQkE/o8uLwEEFLfE/ywHgMTYWbsEiU+yKfedbxo
 3hLv0+KmOYSyFL3WIbdlyTtbt40xIGV0rd1nKhv9d439VmvJMiW6KnEioX0E3Ni3P4AAJb49FSutW
 wOsJAx7OOs+7uurX30IwJVKmriq7J7PAOZXqvbgm0leeiMQdlsqcIO9KF+adrleTjo6ACcq1dW4ml
 EosUor6Q==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbMtL-00A0Ic-NJ; Fri, 15 Oct 2021 13:04:55 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id E56AA30031A;
 Fri, 15 Oct 2021 15:04:50 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id C9DB5212B43C0; Fri, 15 Oct 2021 15:04:50 +0200 (CEST)
Date: Fri, 15 Oct 2021 15:04:50 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Valentin Schneider <valentin.schneider@arm.com>
Subject: Re: [PATCH 2/2] sched: Centralize SCHED_{SMT, MC, CLUSTER} definitions
Message-ID: <YWl8cogsS2Lah1mk@hirez.programming.kicks-ass.net>
References: <20211008115347.425234-1-valentin.schneider@arm.com>
 <20211008115347.425234-3-valentin.schneider@arm.com>
 <CAGsJ_4wqtcOdsFDzR98PFbjxRyTqzf7P3p3erup84SXESYonYw@mail.gmail.com>
 <87bl3zlex8.mognet@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87bl3zlex8.mognet@arm.com>
X-Mailman-Approved-At: Sat, 16 Oct 2021 10:07:44 +1100
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Mark Rutland <mark.rutland@arm.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Rich Felker <dalias@libc.org>,
 linux-ia64@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, David Hildenbrand <david@redhat.com>,
 x86 <x86@kernel.org>, linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Hugh Dickins <hughd@google.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-s390@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 YiFei Zhu <yifeifz2@illinois.edu>, Helge Deller <deller@gmx.de>,
 Aubrey Li <aubrey.li@linux.intel.com>, Barry Song <21cnbao@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Mel Gorman <mgorman@suse.de>, Masahiro Yamada <masahiroy@kernel.org>,
 Frederic Weisbecker <frederic@kernel.org>, Kees Cook <keescook@chromium.org>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Vlastimil Babka <vbabka@suse.cz>, Vipin Sharma <vipinsh@google.com>,
 Heiko Carstens <hca@linux.ibm.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Steven Rostedt <rostedt@goodmis.org>, Nathan Chancellor <nathan@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Sergei Trofimovich <slyfox@gentoo.org>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>, Michal Hocko <mhocko@kernel.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 LAK <linux-arm-kernel@lists.infradead.org>,
 Barry Song <song.bao.hua@hisilicon.com>, Ben Segall <bsegall@google.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Daniel Borkmann <daniel@iogearbox.net>, linux-parisc@vger.kernel.org,
 Chris Down <chris@chrisdown.name>, linuxppc-dev@lists.ozlabs.org,
 Randy Dunlap <rdunlap@infradead.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Tim Chen <tim.c.chen@linux.intel.com>, "David S. Miller" <davem@davemloft.net>,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 08, 2021 at 04:22:27PM +0100, Valentin Schneider wrote:

> So x86 has it default yes, and a lot of others (e.g. arm64) have it default
> no.
> 
> IMO you don't gain much by disabling them. SCHED_MC and SCHED_CLUSTER only
> control the presence of a sched_domain_topology_level - if it's useless it
> gets degenerated at domain build time. Some valid reasons for not using
> them is if the architecture defines its own topology table (e.g. powerpc
> has CACHE and MC levels which are not gated behind any CONFIG).
> 
> SCHED_SMT has an impact on code generated in sched/core.c, but that is also
> gated by a static key.
> 
> So I'd say having them default yes is sensible. I'd even say we should
> change the "If unsure say N here." to "Y".

Right, so I tend to agree (and also that we should fix that Kconfig help
text). But it would be very nice to have feedback from the affected arch
maintainers.

