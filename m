Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D66156A7E9E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 10:49:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PS5t955wlz3cfX
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 20:49:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.219.51; helo=mail-qv1-f51.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PS5rR4pJLz3cKG
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Mar 2023 20:48:07 +1100 (AEDT)
Received: by mail-qv1-f51.google.com with SMTP id ff4so11265709qvb.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Mar 2023 01:48:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SFYMa4F5zx6QmdN+xdk9xuKBVfUQIkEC+rLl+xVi7rY=;
        b=K/Wt6sKUimeBCgprysyWnl6Tmw8nlR8gBAGYq7Zh04CcazaDUn5dNYk9fPef1f6TXz
         vcTZzqEcpdbQ86FlZeAAx9J3RsN/QB5Vgk6xZkkimtM4gXRcVw0j+QKiTPdCY+6tDNuw
         DkmtHlIxb2MUvx7lTW6ETNWwR4c1rkDY0xB7ECIJq8EnsynL92rZhE8t1HXnW08/M1mz
         bAHS1Qkkcm0pP15ws2kv65MZSKC2Vw7brZXAUORYiXaQ8UTM0s1rFoJNOJr6aEdtOgEA
         2MbUSz/Lt284RLrb+DHRNapWAZRx6rw6bdvt7pmejr7KaXzSd27SNM5Bfn2ij7BjIDeK
         Ck+w==
X-Gm-Message-State: AO0yUKWZfiR/olPaoakAD0wUnTvEhq8PdrLMKK0f6qxJG6CcUHzZRLv8
	vsY6lhQvlJBwBZ1N54ysodaibRVMR6TTvw==
X-Google-Smtp-Source: AK7set9QSKOA9BfFOHVKcmTbhwVETWsGeuOJ+v8SpHDircYx3bpvlpQIiO6TnE9pqjnzvc9p5pEGEg==
X-Received: by 2002:ad4:5e8d:0:b0:56f:8b5:3e94 with SMTP id jl13-20020ad45e8d000000b0056f08b53e94mr2546325qvb.14.1677750483521;
        Thu, 02 Mar 2023 01:48:03 -0800 (PST)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com. [209.85.160.182])
        by smtp.gmail.com with ESMTPSA id d71-20020ae9ef4a000000b0073ba3fd4e4asm10635100qkg.16.2023.03.02.01.48.03
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Mar 2023 01:48:03 -0800 (PST)
Received: by mail-qt1-f182.google.com with SMTP id c3so13084531qtc.8
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Mar 2023 01:48:03 -0800 (PST)
X-Received: by 2002:a81:ad43:0:b0:533:91d2:9d94 with SMTP id
 l3-20020a81ad43000000b0053391d29d94mr5972312ywk.5.1677750462713; Thu, 02 Mar
 2023 01:47:42 -0800 (PST)
MIME-Version: 1.0
References: <20230302093539.372962-1-alexghiti@rivosinc.com>
In-Reply-To: <20230302093539.372962-1-alexghiti@rivosinc.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 2 Mar 2023 10:47:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVC99kFpS9vL+HEqbXdDRMKVSW_t21X1p37d0oQufxKLw@mail.gmail.com>
Message-ID: <CAMuHMdVC99kFpS9vL+HEqbXdDRMKVSW_t21X1p37d0oQufxKLw@mail.gmail.com>
Subject: Re: [PATCH v4 00/24] Remove COMMAND_LINE_SIZE from uapi
To: Alexandre Ghiti <alexghiti@rivosinc.com>
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, linux-mips@vger.kernel.org, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Max Filippov <jcmvbkbc@gmail.com>, "H . Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, linux-snps-arc@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, Jonathan Corbet <corbet@lwn.net>, linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Vineet Gupta <vgupta@kernel.org>, Matt Turner <mattst88@gmail.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, linux-xtensa@linux-xt
 ensa.org, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, linux-m68k@lists.linux-m68k.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, linux-alpha@vger.kernel.org, Borislav Petkov <bp@alien8.de>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Alex,

On Thu, Mar 2, 2023 at 10:35=E2=80=AFAM Alexandre Ghiti <alexghiti@rivosinc=
.com> wrote:
> This all came up in the context of increasing COMMAND_LINE_SIZE in the
> RISC-V port.  In theory that's a UABI break, as COMMAND_LINE_SIZE is the
> maximum length of /proc/cmdline and userspace could staticly rely on
> that to be correct.
>
> Usually I wouldn't mess around with changing this sort of thing, but
> PowerPC increased it with a5980d064fe2 ("powerpc: Bump COMMAND_LINE_SIZE
> to 2048").  There are also a handful of examples of COMMAND_LINE_SIZE
> increasing, but they're from before the UAPI split so I'm not quite sure
> what that means: e5a6a1c90948 ("powerpc: derive COMMAND_LINE_SIZE from
> asm-generic"), 684d2fd48e71 ("[S390] kernel: Append scpdata to kernel
> boot command line"), 22242681cff5 ("MIPS: Extend COMMAND_LINE_SIZE"),
> and 2b74b85693c7 ("sh: Derive COMMAND_LINE_SIZE from
> asm-generic/setup.h.").
>
> It seems to me like COMMAND_LINE_SIZE really just shouldn't have been
> part of the uapi to begin with, and userspace should be able to handle
> /proc/cmdline of whatever length it turns out to be.  I don't see any
> references to COMMAND_LINE_SIZE anywhere but Linux via a quick Google
> search, but that's not really enough to consider it unused on my end.
>
> This issue was already considered in s390 and they reached the same
> conclusion in commit 622021cd6c56 ("s390: make command line
> configurable").
>
> The feedback on the v1 seemed to indicate that COMMAND_LINE_SIZE really
> shouldn't be part of uapi, so this now touches all the ports.  I've
> tried to split this all out and leave it bisectable, but I haven't
> tested it all that aggressively.
>
> Changes since v3 <https://lore.kernel.org/all/20230214074925.228106-1-ale=
xghiti@rivosinc.com/>:
> * Added RB/AB
> * Added a mention to commit 622021cd6c56 ("s390: make command line
>   configurable") in the cover letter

Thanks for the update!

 Apparently you forgot to add your own SoB?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
