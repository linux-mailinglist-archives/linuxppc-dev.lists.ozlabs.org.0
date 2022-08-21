Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6455C59B58E
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Aug 2022 19:07:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M9hk71mYlz3cd4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Aug 2022 03:07:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=f/InbUJw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=chenhuacai@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=f/InbUJw;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M9dsX3YGBz2yMK
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Aug 2022 00:58:24 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 31997B80D59
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Aug 2022 14:58:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 836BBC43142
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Aug 2022 14:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661093897;
	bh=GzHlPdU+t+7DtU8s+ZQkqJLPYJa2D5QllpBgFvrmGaw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=f/InbUJweAfp1LwZGHesZqt6a4G8zsWb4eQ8hwBY+fB8ZNzuv2+o+WZHLNeTfA4WO
	 tP4Obzfca17jnLVlGgFOFqxNd6GFR4jnIKswxHiVPRByKR0FyyfEjvUWSnMKafFXQ4
	 QOr40w20RSDAD9EvrDPFMMrXNqdtlQCXpnGEoCR3w5CIY8AdxOD/JFzlCAcvspGNEm
	 DVW630OZ50JWDkTiPs1UE7dtpdaCNgkS+cAO/JlCROhsav5Fnx6kPk1iKt/dCeUOfS
	 RZB0YxyQZs+ZabqVHYJ21sh7i3kcM3kQyE6cLB3Q80qen46LSIsGqGB9qTe2iH9WI3
	 DNgxHvxgpF3Bw==
Received: by mail-pj1-f49.google.com with SMTP id w11-20020a17090a380b00b001f73f75a1feso11672079pjb.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Aug 2022 07:58:17 -0700 (PDT)
X-Gm-Message-State: ACgBeo1qgultT4QHKZDMNPxpaqquKnUCI6eX5AeWa2HSfcQQXkkLV/1A
	2xZJTNVRLYBAEXhPAbcaz42qBBIISt4OrmVN0nk=
X-Google-Smtp-Source: AA6agR5Jfm9mVjshWjpFq8OKc54hNg+6T+J3SLoca3TFw2LF4khEc2uAuPslbwwXSbPSAHiGS5rHKpQKorBBpPqiG2g=
X-Received: by 2002:a05:6102:390d:b0:387:78b9:bf9c with SMTP id
 e13-20020a056102390d00b0038778b9bf9cmr6025080vsu.43.1661093886384; Sun, 21
 Aug 2022 07:58:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220819014406.32266-1-wangkefeng.wang@huawei.com> <YwIc7qbCWpIVKR2j@arm.com>
In-Reply-To: <YwIc7qbCWpIVKR2j@arm.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 21 Aug 2022 22:57:53 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4qffsU0Tmb7_b0iQh7x3Bks2vVrmmvL+0Z0CVaVggsYg@mail.gmail.com>
Message-ID: <CAAhV-H4qffsU0Tmb7_b0iQh7x3Bks2vVrmmvL+0Z0CVaVggsYg@mail.gmail.com>
Subject: Re: [PATCH] kernel: exit: cleanup release_thread()
To: Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 22 Aug 2022 03:06:40 +1000
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Rich Felker <dalias@libc.org>, Thomas Gleixner <tglx@linutronix.de>, Linux-sh list <linux-sh@vger.kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, "open list:MIPS" <linux-mips@vger.kernel.org>, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org, linux-ia64@vger.kernel.org, linux-snps-arc@lists.infradead.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, Matt Turner <m
 attst88@gmail.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, linux-xtensa@linux-xtensa.org, Vasily Gorbik <gor@linux.ibm.com>, Chris Zankel <chris@zankel.net>, linux-um <linux-um@lists.infradead.org>, Heiko Carstens <hca@linux.ibm.com>, linux-alpha@vger.kernel.org, Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, linux-m68k <linux-m68k@lists.linux-m68k.org>, openrisc@lists.librecores.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Brian Cain <bcain@quicinc.com>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, linux-riscv <linux-riscv@lists.infra
 dead.org>, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, Richard Weinberger <richard@nod.at>, Borislav Petkov <bp@alien8.de>, Johannes Berg <johannes@sipsolutions.net>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

For LoongArch parts:

Acked-by: Huacai Chen <chenhuacai@kernel.org>

On Sun, Aug 21, 2022 at 7:54 PM Catalin Marinas <catalin.marinas@arm.com> wrote:
>
> On Fri, Aug 19, 2022 at 09:44:06AM +0800, Kefeng Wang wrote:
> > Only x86 has own release_thread(), introduce a new weak
> > release_thread() function to clean empty definitions in
> > other ARCHs.
> >
> > Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> [...]
> >  arch/arm64/include/asm/processor.h      | 3 ---
> >  arch/arm64/kernel/process.c             | 4 ----
>
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>
