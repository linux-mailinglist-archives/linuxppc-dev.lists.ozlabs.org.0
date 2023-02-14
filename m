Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA0E695E58
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 10:09:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGFlS5CFrz3fRH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 20:09:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.167.44; helo=mail-lf1-f44.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGFh83r9Fz3cfX
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 20:06:48 +1100 (AEDT)
Received: by mail-lf1-f44.google.com with SMTP id x40so22497833lfu.12
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 01:06:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7mNyenBvavxUdV7/ZOu+dVcpWueC+FqvBBNVPDVl8j0=;
        b=btUdmPEPmSI7MeBpAk+SqMhnT5aKO1YPYktj79rvZXzHgQ9S4TWbe7Kt/Y7qRfH1gg
         we5+5ZNZqjoWU/l4bqeIIoQwci+aQx+C5fB2YN6qUwhx+WfseXoX422UfeOwgqI9dcr/
         b3IzHnO9bxVZV9cMjiKBb6PGjK93JalLuzE+UpAL6qVAgpBqkhBa27qIid4D8N2DpO38
         7GoFiN2xmdKmAVNVczPtJe0JVGYp1gsYg2dt/IN+s80/IdmmOtaDOV4nB4K8qASOTrIq
         S6myEd/GgESZT2QiWquPfC21pJecYeU8wuas91S6AZc/BlAhbtpGYCyeKLAz+oG4uNgK
         NcRw==
X-Gm-Message-State: AO0yUKV/WbE8MDeTW+KNX7e48HdBOBboBgaPuiTpLFBUOW4+tXkgt7Zf
	9eUtvNX2m03eO4NeigsoErgKPa6IEcvUamFj
X-Google-Smtp-Source: AK7set8OmvRxrtvAoWYWRI9EClKdaX2yh0gQqXa1yvhon+trkr0TuPLKdYdlNNd3jn2+auv+4obJ2g==
X-Received: by 2002:ac2:46fc:0:b0:4b5:ace6:7498 with SMTP id q28-20020ac246fc000000b004b5ace67498mr587597lfo.3.1676365604465;
        Tue, 14 Feb 2023 01:06:44 -0800 (PST)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id t7-20020a19ad07000000b004db2bda9527sm839449lfc.121.2023.02.14.01.06.43
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 01:06:44 -0800 (PST)
Received: by mail-lf1-f52.google.com with SMTP id bi36so22526951lfb.8
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 01:06:43 -0800 (PST)
X-Received: by 2002:a2e:9448:0:b0:293:5264:ad89 with SMTP id
 o8-20020a2e9448000000b002935264ad89mr149587ljh.37.1676365235984; Tue, 14 Feb
 2023 01:00:35 -0800 (PST)
MIME-Version: 1.0
References: <20230214074925.228106-1-alexghiti@rivosinc.com> <20230214074925.228106-6-alexghiti@rivosinc.com>
In-Reply-To: <20230214074925.228106-6-alexghiti@rivosinc.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 Feb 2023 10:00:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWxgRrZqn=Ex4gSSL58gciuHp-6ye+FTR0wgw=jp=4=DA@mail.gmail.com>
Message-ID: <CAMuHMdWxgRrZqn=Ex4gSSL58gciuHp-6ye+FTR0wgw=jp=4=DA@mail.gmail.com>
Subject: Re: [PATCH v3 05/24] m68k: Remove COMMAND_LINE_SIZE from uapi
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

On Tue, Feb 14, 2023 at 8:55 AM Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
>
> As far as I can tell this is not used by userspace and thus should not
> be part of the user-visible API.
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
