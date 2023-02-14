Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4F7696459
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 14:11:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGM6S74k2z3cdL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 00:11:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=AroULSWk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=jcmvbkbc@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=AroULSWk;
	dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGM5X2Th3z3cFt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 00:10:38 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id b5so16996114plz.5
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 05:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/UCnR+z6gmAvcqmKIJeLEMH14WiUbQ57wKTFDt5pcJ8=;
        b=AroULSWko9Zr7eGEPpWTPA6D2mG8vKfAIsqG1/UHiZHP3HX3PbVp0qrMJ+FuAJsbWS
         v05+kTojvExJxZ8W+9yB21D5w8vexFjRyphDjBsOddEZTMVdttkVBNXjxWFQ3Iqwojqw
         +DKSZuOkQRuVKSaqQXL+bh2B50zxlDW7/k12RIgkMnOVm0uYI6LnfzeI25mloiCklp33
         VHHtIf4Dpr/qSsDgSQMEDKRS4lg6TE80G2m56Li8ak7Mi6jrTmPyCPMKDQkClT1hFcFO
         HozC1z+zsQ4VmKCtjiLNbcQm7z7g/V4D6C2WAOwQT8Y+WTTuWkSjrC9wQJ19rS06uj77
         A7tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/UCnR+z6gmAvcqmKIJeLEMH14WiUbQ57wKTFDt5pcJ8=;
        b=lxUBFYjrBZf49g1/36NGHrUIwqkubocR+RjX3Z5kTHglbft320rlcF4YVVk46+c7by
         TgrS4X3GLy1lihciwVbOOp/21gxW7EWWKQxFF3Vresj3hEjLFnkk9yfC9PdaFQCDYee7
         98kNCJLjUG+S3+NE7e/orr9LdP8ilfK/KLNNT9YMVnEzsGgWmbC96b48pTsaVnJPKNHk
         kZdWRCTpGp8vNFtOQqnI6h117j39dwDfnwQ6l7xsAG4AR89YcNJkFgi/3KAffZ57vZIB
         Aehq+GAqzwdfCYCRIz1aKObt8hPdR3eRfCRK9SJe6IkmVlQWdX89ruVdzvkZGf7OdY0E
         3WTQ==
X-Gm-Message-State: AO0yUKXiP8L8DPplLfCTvw5B+vnkAf03+ofwcAHAoHLo38llq6SkZ4iS
	Vpfr4qeCI/HxBMP1GKJxszwqAlF0mjMaiVvUK1I=
X-Google-Smtp-Source: AK7set8wnbcla18BA65mD0tF+YGFQZaLOi1vF6MNFPYgJ+xCNbkwNuOA5gg0rl8sjl7Hw+xmx/asisuFdRpgxW5I32w=
X-Received: by 2002:a17:90a:d486:b0:233:c720:e6d5 with SMTP id
 s6-20020a17090ad48600b00233c720e6d5mr2301551pju.94.1676380235318; Tue, 14 Feb
 2023 05:10:35 -0800 (PST)
MIME-Version: 1.0
References: <20230214074925.228106-1-alexghiti@rivosinc.com> <20230214074925.228106-22-alexghiti@rivosinc.com>
In-Reply-To: <20230214074925.228106-22-alexghiti@rivosinc.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 14 Feb 2023 05:10:24 -0800
Message-ID: <CAMo8BfLCDbYWBWfF7ZJtG_U7E846RmJLF5OFdWpaFOv8ydo0Eg@mail.gmail.com>
Subject: Re: [PATCH v3 21/24] xtensa: Remove empty <uapi/asm/setup.h>
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, linux-mips@vger.kernel.org, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, "H . Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, linux-snps-arc@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, Jonathan Corbet <corbet@lwn.net>, linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, Matt Turner <mattst88@gmail.com>, Christian Borntraeger <bor
 ntraeger@linux.ibm.com>, linux-xtensa@linux-xtensa.org, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, linux-m68k@lists.linux-m68k.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, linux-alpha@vger.kernel.org, Borislav Petkov <bp@alien8.de>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 14, 2023 at 12:11 AM Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
>
> From: Palmer Dabbelt <palmer@rivosinc.com>
>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>  arch/xtensa/include/uapi/asm/setup.h | 15 ---------------
>  1 file changed, 15 deletions(-)
>  delete mode 100644 arch/xtensa/include/uapi/asm/setup.h

Acked-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max
