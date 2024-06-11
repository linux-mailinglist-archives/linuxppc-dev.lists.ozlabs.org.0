Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BDF9037DA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2024 11:32:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vz3NR6G9Zz3ccX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2024 19:32:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=alpha.franken.de (client-ip=193.175.24.41; helo=elvis.franken.de; envelope-from=tsbogend@alpha.franken.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 2457 seconds by postgrey-1.37 at boromir; Tue, 11 Jun 2024 19:31:45 AEST
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vz3N14gjdz3cBG
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2024 19:31:45 +1000 (AEST)
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sGxBT-0000Ne-00; Tue, 11 Jun 2024 10:48:51 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 023C9C0120; Tue, 11 Jun 2024 10:41:16 +0200 (CEST)
Date: Tue, 11 Jun 2024 10:41:16 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Celeste Liu <coelacanthushex@gmail.com>
Subject: Re: [PATCH 3/6] mips: defconfig: drop RT_GROUP_SCHED=y from
 generic/db1xxx/eyeq5
Message-ID: <ZmgNrOr1nalSTeja@alpha.franken.de>
References: <20240530111947.549474-8-CoelacanthusHex@gmail.com>
 <20240530111947.549474-11-CoelacanthusHex@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240530111947.549474-11-CoelacanthusHex@gmail.com>
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
Cc: Rich Felker <dalias@libc.org>, Lennart Poettering <lennart@poettering.net>, linux-sh@vger.kernel.org, Tony Lindgren <tony@atomide.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@rivosinc.com>, linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Guo Ren <guoren@kernel.org>, linux-kselftest@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, Sven Joachim <svenjoac@gmx.de>, Mykola Lysenko <mykolal@fb.com>, =?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Gregory CLEMENT <gregory.clement@bootlin.com>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, Jonathan Hunter <jonathanh@nvidia.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, Ray Jui <rjui@broadcom.com>, Nicholas Piggin <npiggin@gmail.com>, linux-rpi-kernel@lists.infradead.org, loongarch@lists.linux.dev, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Icenowy Zheng <uwu@icenowy.me>, Florian Fainelli <florian.fainelli@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Anup Patel <anup@brainfault.org>, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 30, 2024 at 07:19:51PM +0800, Celeste Liu wrote:
> For cgroup v1, if turned on, and there's any cgroup in the "cpu" hierarchy it
> needs an RT budget assigned, otherwise the processes in it will not be able to
> get RT at all. The problem with RT group scheduling is that it requires the
> budget assigned but there's no way we could assign a default budget, since the
> values to assign are both upper and lower time limits, are absolute, and need to
> be sum up to < 1 for each individal cgroup. That means we cannot really come up
> with values that would work by default in the general case.[1]
> 
> For cgroup v2, it's almost unusable as well. If it turned on, the cpu controller
> can only be enabled when all RT processes are in the root cgroup. But it will
> lose the benefits of cgroup v2 if all RT process were placed in the same cgroup.
> 
> Red Hat, Gentoo, Arch Linux and Debian all disable it. systemd also doesn't
> support it.[2]
> 
> [1]: https://bugzilla.redhat.com/show_bug.cgi?id=1229700
> [2]: https://github.com/systemd/systemd/issues/13781#issuecomment-549164383
> 
> Signed-off-by: Celeste Liu <CoelacanthusHex@gmail.com>
> ---
>  arch/mips/configs/db1xxx_defconfig  | 1 -
>  arch/mips/configs/eyeq5_defconfig   | 1 -
>  arch/mips/configs/generic_defconfig | 1 -
>  3 files changed, 3 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
