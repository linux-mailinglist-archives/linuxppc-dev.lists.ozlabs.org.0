Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F98E7E8ED9
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Nov 2023 07:42:43 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tqmAxz5p;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SSjfn29dRz3cN4
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Nov 2023 17:42:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tqmAxz5p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=guoren@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SSfY16HRHz3c2V
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Nov 2023 15:22:29 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1AA6460A65
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Nov 2023 04:22:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7EA6C433CA
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Nov 2023 04:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699762946;
	bh=FJL4JNEf9Nr1DoflQgnKi0tfP9lyYuVjCmmad2iv8TA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tqmAxz5pZHNE+2S0G+5pjviafxMbGT4PV5FWpT0pXO9mEq0CYhTCcAqHx4q1g2ucY
	 p5q0ig8o/D6cy+vwfFlsX8XO07WUZU2g085FYHyE412O1GtNmkYVDldF6VrjWhqIeD
	 vpihjhfZvrt/d6ShYJaHjIXbpMdnXAKkBJz97ez+cincN0RXMPGPGOLMWXOvzRovK8
	 1UQMqaz2sj037j5BN8kw2+Jd8Ae2sz9dJX/L76yQuGiODhO6VPQ25sY7zOjDHa5BZ1
	 b+lB5VePgAcH5sLNGnZLUmsv1Q74yMMm4DWdOQjlyW56o8xPkXdq9fJ7zi4+z0TGYY
	 djjCXtwJ4jJig==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2c83ffcdbe3so2610221fa.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Nov 2023 20:22:26 -0800 (PST)
X-Gm-Message-State: AOJu0Yzaotu4JNcwX/SuWYBSzSSaTXkEbGtzjJaQk0Vj8Oyg71ikULi2
	Smu+vCoxZAIKf5Zf0k72qi1VP5Z7kygMCi4EhNA=
X-Google-Smtp-Source: AGHT+IGKtBb4zpepnAgJWTPQf4OFL8Yxg0IypTLD7L38xtqORdph/fQnU2/w9oi/MfemCZAy/+rZ76w/2ug+y+JaBNQ=
X-Received: by 2002:a05:6402:3d9:b0:53f:731a:e513 with SMTP id
 t25-20020a05640203d900b0053f731ae513mr2174574edw.25.1699762924720; Sat, 11
 Nov 2023 20:22:04 -0800 (PST)
MIME-Version: 1.0
References: <20231108125843.3806765-1-arnd@kernel.org> <20231108125843.3806765-13-arnd@kernel.org>
In-Reply-To: <20231108125843.3806765-13-arnd@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 11 Nov 2023 23:21:53 -0500
X-Gmail-Original-Message-ID: <CAJF2gTSEziwKn+f6DfZXRuzW1SXaWraKL2HdXMRkEOGyuHq3MQ@mail.gmail.com>
Message-ID: <CAJF2gTSEziwKn+f6DfZXRuzW1SXaWraKL2HdXMRkEOGyuHq3MQ@mail.gmail.com>
Subject: Re: [PATCH 12/22] csky: fix arch_jump_label_transform_static override
To: Arnd Bergmann <arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sun, 12 Nov 2023 17:41:59 +1100
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
Cc: Mark Rutland <mark.rutland@arm.com>, Juri Lelli <juri.lelli@redhat.com>, linux-fbdev@vger.kernel.org, x86@kernel.org, loongarch@lists.linux.dev, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org, netdev@vger.kernel.org, linux-mtd@lists.infradead.org, Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>, Helge Deller <deller@gmx.de>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Vincenzo Frascino <vincenzo.frascino@arm.com>, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-s390@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>, Masahiro Yamada <masahiroy@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, Greg Ungerer <gerg@linux-m68k.org>, linux-bcachefs@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Vineet Gupta <vgupta@kernel.org>, "Naveen 
 N. Rao" <naveen.n.rao@linux.ibm.com>, Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org, linux-trace-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, Nathan Chancellor <nathan@kernel.org>, linux-m68k@lists.linux-m68k.org, linux-csky@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, Andy Lutomirski <luto@kernel.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Timur Tabi <timur@kernel.org>, Geoff Levand <geoff@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kent Overstreet <kent.overstreet@linux.dev>, Nic
 k Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>, linux-usb@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>, linux-alpha@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, David Woodhouse <dwmw2@infradead.org>, "David S. Miller" <davem@davemloft.net>, Al Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 8, 2023 at 8:02=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wrot=
e:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The arch_jump_label_transform_static() function in csky was originally me=
ant to
> override the generic __weak function, but that got changed to an #ifndef =
check.
>
> This showed up as a missing-prototype warning:
> arch/csky/kernel/jump_label.c:43:6: error: no previous prototype for 'arc=
h_jump_label_transform_static' [-Werror=3Dmissing-prototypes]
>
> Change the method to use the new method of having a #define and a prototy=
pe
> for the global function.
>
> Fixes: 7e6b9db27de9 ("jump_label: make initial NOP patching the special c=
ase")
> Fixes: 4e8bb4ba5a55 ("csky: Add jump-label implementation")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/csky/include/asm/jump_label.h | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/csky/include/asm/jump_label.h b/arch/csky/include/asm/j=
ump_label.h
> index d488ba6084bc..98a3f4b168bd 100644
> --- a/arch/csky/include/asm/jump_label.h
> +++ b/arch/csky/include/asm/jump_label.h
> @@ -43,5 +43,10 @@ static __always_inline bool arch_static_branch_jump(st=
ruct static_key *key,
>         return true;
>  }
>
> +enum jump_label_type;
> +void arch_jump_label_transform_static(struct jump_entry *entry,
> +                                     enum jump_label_type type);
> +#define arch_jump_label_transform_static arch_jump_label_transform_stati=
c
> +
>  #endif  /* __ASSEMBLY__ */
>  #endif /* __ASM_CSKY_JUMP_LABEL_H */
> --
> 2.39.2
>
>
Thank you!
Reviewed-by: Guo Ren <guoren@kernel.org>

--=20
Best Regards
 Guo Ren
