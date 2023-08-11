Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 41879779A79
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Aug 2023 00:12:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s5z4KUrN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RMyh51LVsz3cGv
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Aug 2023 08:12:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s5z4KUrN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RMyg86YR9z2yDH
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Aug 2023 08:11:16 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0E5B6632A5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Aug 2023 22:11:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7686AC433C7
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Aug 2023 22:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691791873;
	bh=N8lpigPkvlxlig325fbyaTImOPZkDbDukkfY6bibi4k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=s5z4KUrNfO2JqcRq+ljnufym4sk9sqdsFx3DYN2Cow/K0fLXZcKLVksxl3tJwtmP5
	 v4+7qEVZj7pMqlK/4mTz9zW0VNE4lQcWpm7tJnLnBczOGPAC3p+arpwkj+Rmg4Juuy
	 YIZHs+MDP0GwOpNZPxlLVdGlCxL56jf6eYB119/8Rm5j9W4lbFj6lNszwdH6HhlmgW
	 2H4SR6/f6KcSt5+X8p/j6FAX3R+PYUPiZRMx0Ty9wh/JLS3wOZPDyupXuhPTfsL1cQ
	 CfFpj2SsMymdkmH+B64hK/iIiEZY7TU/1Fp7ULBEvSAidG5R5gz1VTPOmO015pukdL
	 0b5Pb+d+UR+JA==
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-79d93e7ba34so1413805241.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Aug 2023 15:11:13 -0700 (PDT)
X-Gm-Message-State: AOJu0YzSFV/plkR2BJYt6SEO+TXJypYSu+UrZ1tV4zVXrWhUWBItTQUg
	i+rwDdoFi6DW739iZupGGTJwk0uTY0KQU1j0fqM=
X-Google-Smtp-Source: AGHT+IGn1gQn4CG7x4Y66qfsYEz2RYlI/GdSoTxRIWymQmm7uMPiGClKZum+y67wV7ik5jOQYxKVmHuCQntmPwL9x1A=
X-Received: by 2002:a4a:240c:0:b0:564:e465:5d5c with SMTP id
 m12-20020a4a240c000000b00564e4655d5cmr2107496oof.2.1691791852125; Fri, 11 Aug
 2023 15:10:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230810141947.1236730-1-arnd@kernel.org> <20230810141947.1236730-3-arnd@kernel.org>
In-Reply-To: <20230810141947.1236730-3-arnd@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 12 Aug 2023 07:10:15 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQo5hri-9JmS_kot1mQ6WHCWAeu+SnW19daWMC1YK5BWA@mail.gmail.com>
Message-ID: <CAK7LNAQo5hri-9JmS_kot1mQ6WHCWAeu+SnW19daWMC1YK5BWA@mail.gmail.com>
Subject: Re: [PATCH 02/17] [RESEND] irq_work: consolidate arch_irq_work_raise prototypes
To: Arnd Bergmann <arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Palmer Dabbelt <palmer@rivosinc.com>, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 11, 2023 at 10:00=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wr=
ote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The prototype was hidden on x86, which causes a warning:


What do you mean by "hidden on x86"?

arch_irq_work_raise() was declared on 7 architectures,
including x86.




>
> kernel/irq_work.c:72:13: error: no previous prototype for 'arch_irq_work_=
raise' [-Werror=3Dmissing-prototypes]
>
> Fix this by providing it in only one place that is always visible.
>
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> Acked-by: Guo Ren <guoren@kernel.org>
> Reviewed-by: Alexander Gordeev <agordeev@linux.ibm.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/include/asm/irq_work.h     | 2 --
>  arch/arm64/include/asm/irq_work.h   | 2 --
>  arch/csky/include/asm/irq_work.h    | 2 +-
>  arch/powerpc/include/asm/irq_work.h | 1 -
>  arch/riscv/include/asm/irq_work.h   | 2 +-
>  arch/s390/include/asm/irq_work.h    | 2 --
>  arch/x86/include/asm/irq_work.h     | 1 -
>  include/linux/irq_work.h            | 3 +++
>  8 files changed, 5 insertions(+), 10 deletions(-)
>


--
Best Regards
Masahiro Yamada
