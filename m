Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA60791048C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2024 14:51:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W4gMs4wzVz3cXk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2024 22:51:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W4gMS6rwVz30f8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2024 22:50:44 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4W4gMM5BHnz4wcJ;
	Thu, 20 Jun 2024 22:50:39 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Anup Patel <anup@brainfault.org>, Guo Ren <guoren@kernel.org>, Palmer Dabbelt <palmer@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, Gregory CLEMENT <gregory.clement@bootlin.com>, Théo Lebrun <theo.lebrun@bootlin.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>, Sven Joachim <svenjoac@gmx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Russell King <linux@armlinux.org.uk>, Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Broadcom internal kernel review list <b
 cm-kernel-feedback-list@broadcom.com>, Tony Lindgren <tony@atomide.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Mykola Lysenko <mykolal@fb.com>, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-omap@vger.kernel.org, linux-tegra@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, Celeste Liu <coelacanthushex@gmail.com>
In-Reply-To: <20240530111947.549474-8-CoelacanthusHex@gmail.com>
References: <20240530111947.549474-8-CoelacanthusHex@gmail.com>
Subject: Re: (subset) [PATCH 0/6] defconfig: drop RT_GROUP_SCHED=y
Message-Id: <171888775124.806750.6633317613524015778.b4-ty@ellerman.id.au>
Date: Thu, 20 Jun 2024 22:49:11 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, Celeste Liu <CoelacanthusHex@gmail.com>, Lennart Poettering <lennart@poettering.net>, bpf@vger.kernel.org, Icenowy Zheng <uwu@icenowy.me>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 30 May 2024 19:19:48 +0800, Celeste Liu wrote:
> For cgroup v1, if turned on, and there's any cgroup in the "cpu" hierarchy it
> needs an RT budget assigned, otherwise the processes in it will not be able to
> get RT at all. The problem with RT group scheduling is that it requires the
> budget assigned but there's no way we could assign a default budget, since the
> values to assign are both upper and lower time limits, are absolute, and need to
> be sum up to < 1 for each individal cgroup. That means we cannot really come up
> with values that would work by default in the general case.[1]
> 
> [...]

Patch 4 applied to powerpc/next.

[4/6] powerpc: defconfig: drop RT_GROUP_SCHED=y from ppc6xx_defconfig
      https://git.kernel.org/powerpc/c/2bac6caee94e25f59ee47e2d365d7e07465089ba

cheers
