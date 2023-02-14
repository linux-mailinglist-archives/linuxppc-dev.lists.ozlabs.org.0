Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4331D695DE4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 10:02:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGFbN0sbVz3ccg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 20:02:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.167.50; helo=mail-lf1-f50.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGFZn3b8Xz3Wtp
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 20:02:09 +1100 (AEDT)
Received: by mail-lf1-f50.google.com with SMTP id x40so22483065lfu.12
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 01:02:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vo1pwF0Y3+477kchtQyZldRaytGfE/r9ZXPNmjOtQDY=;
        b=Nl/2Q0itTRqy4k6j48uOpefB/QhOwnDpwz1eaE7smt/z6EBvoT7mGLTKimXu/pRCjN
         KuXHHS3LJoocVwdTeloHAHL8vJnSBzY4TfK9ups/E1ClIGsFElDe/5xmCbWGSy5vmzyK
         /QM0ElB+wmqvUAGmjyxPZCBdGFB61UfQPaCETz9uaUK993htkiivKrJ3wUpZwLXRCaAX
         xAReSq0xPwaVpbzTilQZ8jMVlaQAFObAvXaQEdDTfSLKKte8nlGUGa7QJSJFux09cUvZ
         JCUqQ8Z6Z7mWJW1NcHadQKi+c93GYysHoRx3HoImikQRx3qPlSJkx5+9HIkslAHiurjy
         SZsQ==
X-Gm-Message-State: AO0yUKXCRckHtu+QdoxuNEuC2pLH39u3goNgLOPHP/Ijbxr0jz0OMw0u
	fbsnoahNFgtLw3KLVjIMxc29gSpGbqO7m9Yb
X-Google-Smtp-Source: AK7set8521Ihh3uWkhthY251qTO25SW0cPgR5/uHJFII880muJ9ywpqMASFzMh9XCZ9BIga2Y//Yxg==
X-Received: by 2002:ac2:42d2:0:b0:4a4:68b7:f86d with SMTP id n18-20020ac242d2000000b004a468b7f86dmr792015lfl.17.1676365323609;
        Tue, 14 Feb 2023 01:02:03 -0800 (PST)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id g11-20020a19ac0b000000b004d2af072645sm1042723lfc.143.2023.02.14.01.01.59
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 01:02:00 -0800 (PST)
Received: by mail-lj1-f170.google.com with SMTP id d8so17573719ljq.9
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 01:01:59 -0800 (PST)
X-Received: by 2002:a2e:9448:0:b0:293:5264:ad89 with SMTP id
 o8-20020a2e9448000000b002935264ad89mr149971ljh.37.1676365308893; Tue, 14 Feb
 2023 01:01:48 -0800 (PST)
MIME-Version: 1.0
References: <20230214074925.228106-1-alexghiti@rivosinc.com> <20230214074925.228106-16-alexghiti@rivosinc.com>
In-Reply-To: <20230214074925.228106-16-alexghiti@rivosinc.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 Feb 2023 10:01:35 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVQeh4ZqSmVXkNJTOCZ_Ywi0b0JiGpg2EQFRWZXzkNeyw@mail.gmail.com>
Message-ID: <CAMuHMdVQeh4ZqSmVXkNJTOCZ_Ywi0b0JiGpg2EQFRWZXzkNeyw@mail.gmail.com>
Subject: Re: [PATCH v3 15/24] m68k: Remove empty <uapi/asm/setup.h>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, linux-mips@vger.kernel.org, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Max Filippov <jcmvbkbc@gmail.com>, "H . Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, linux-snps-arc@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, Jonathan Corbet <corbet@lwn.net>, linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Vineet Gupta <vgupta@kernel.org>, Matt Turner <mattst88@gmail.com>, Christian Borntraeger <borntraeger
 @linux.ibm.com>, linux-xtensa@linux-xtensa.org, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, linux-m68k@lists.linux-m68k.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, linux-alpha@vger.kernel.org, Borislav Petkov <bp@alien8.de>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 14, 2023 at 9:05 AM Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
