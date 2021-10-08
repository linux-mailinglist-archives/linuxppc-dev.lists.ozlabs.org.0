Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 110574277A2
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Oct 2021 07:39:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HRDQX6VTQz3dbh
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Oct 2021 16:39:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=valentin.schneider@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4HQsPv1T20z2ynt
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Oct 2021 02:22:41 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EDF7F6D;
 Fri,  8 Oct 2021 08:22:37 -0700 (PDT)
Received: from e113632-lin (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9B44F3F66F;
 Fri,  8 Oct 2021 08:22:29 -0700 (PDT)
From: Valentin Schneider <valentin.schneider@arm.com>
To: Barry Song <21cnbao@gmail.com>
Subject: Re: [PATCH 2/2] sched: Centralize SCHED_{SMT, MC, CLUSTER} definitions
In-Reply-To: <CAGsJ_4wqtcOdsFDzR98PFbjxRyTqzf7P3p3erup84SXESYonYw@mail.gmail.com>
References: <20211008115347.425234-1-valentin.schneider@arm.com>
 <20211008115347.425234-3-valentin.schneider@arm.com>
 <CAGsJ_4wqtcOdsFDzR98PFbjxRyTqzf7P3p3erup84SXESYonYw@mail.gmail.com>
Date: Fri, 08 Oct 2021 16:22:27 +0100
Message-ID: <87bl3zlex8.mognet@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Sat, 09 Oct 2021 16:36:15 +1100
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
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, David Hildenbrand <david@redhat.com>,
 x86 <x86@kernel.org>, linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Hugh Dickins <hughd@google.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-s390@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 YiFei Zhu <yifeifz2@illinois.edu>, Helge Deller <deller@gmx.de>,
 Aubrey Li <aubrey.li@linux.intel.com>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 Russell King <linux@armlinux.org.uk>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Mel Gorman <mgorman@suse.de>, Masahiro Yamada <masahiroy@kernel.org>,
 Frederic Weisbecker <frederic@kernel.org>, Kees Cook <keescook@chromium.org>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Vlastimil Babka <vbabka@suse.cz>, Vipin Sharma <vipinsh@google.com>,
 Heiko Carstens <hca@linux.ibm.com>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
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
 Andrew Morton <akpm@linux-foundation.org>,
 Tim Chen <tim.c.chen@linux.intel.com>, "David S. Miller" <davem@davemloft.net>,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 09/10/21 01:37, Barry Song wrote:
> On Sat, Oct 9, 2021 at 12:54 AM Valentin Schneider
> <valentin.schneider@arm.com> wrote:
>>
>> Barry recently introduced a new CONFIG_SCHED_CLUSTER, and discussions
>> around that highlighted that every architecture redefines its own help text
>> and dependencies for CONFIG_SCHED_SMT and CONFIG_SCHED_MC.
>>
>> Move the definition of those to scheduler's Kconfig to centralize help text
>> and generic dependencies (i.e. SMP). Make them depend on a matching
>> ARCH_SUPPORTS_SCHED_* which the architectures can select with the relevant
>> architecture-specific dependency.
>>
>> s390 uses its own topology table (set_sched_topology()) and doesn't seem to
>> cope without SCHED_MC or SCHED_SMT, so those remain untogglable.
>>
>
> Hi Valentin,
> Thanks!
> I believe this is a cleaner way for Kconfig itself. But I am not quite sure this
> is always beneficial of all platforms. It would be perfect if the patch has no
> side effects and doesn't change the existing behaviour. But it has side effects
> by changing the default N to Y on a couple of platforms.
>

So x86 has it default yes, and a lot of others (e.g. arm64) have it default
no.

IMO you don't gain much by disabling them. SCHED_MC and SCHED_CLUSTER only
control the presence of a sched_domain_topology_level - if it's useless it
gets degenerated at domain build time. Some valid reasons for not using
them is if the architecture defines its own topology table (e.g. powerpc
has CACHE and MC levels which are not gated behind any CONFIG).

SCHED_SMT has an impact on code generated in sched/core.c, but that is also
gated by a static key.

So I'd say having them default yes is sensible. I'd even say we should
change the "If unsure say N here." to "Y".
