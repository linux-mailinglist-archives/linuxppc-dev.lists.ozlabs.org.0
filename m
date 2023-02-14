Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA12269640B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 13:58:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGLpx44Xyz3cMl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 23:58:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WJdnIzCN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=jcmvbkbc@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WJdnIzCN;
	dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGLnz3cq7z3c7B
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 23:57:10 +1100 (AEDT)
Received: by mail-pj1-x1033.google.com with SMTP id d13-20020a17090ad3cd00b0023127b2d602so15370427pjw.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 04:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LvbvVZeDxlmyQ+MKMrDf7Zww7VWZ6K77IBbIyuFkUUM=;
        b=WJdnIzCNdsEVhQsGHsWOO7yTWXr+pWI+PtbYUorKW2BchHqmwSwOGYAdoPufsKo0lJ
         bXDPWjxdhH0QnGSePHf16V7IoRXQeuhXlPcWmkxu8rZSjSr3Sh7jD3eqfhHEY8D454AL
         h9BqNX+KCkb4XJj5QiYoEyv/SXP+BeQ/BY4l0AmplspY3uh+sSGXDRYM23x/cN3z17v4
         7mVXCjohMU5LW8N+7VSWMBw+LVgUYmGtE+fRcUV+X7h/ZuXCVclocMVqOgQVU0PU1ZT/
         Iaxkx1YKf72wvTPUawYrrDuiNA9tC+Rro4eK9+FeLt6f2iRUNM5NC3UOCLKbbbVT0kzB
         CWuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LvbvVZeDxlmyQ+MKMrDf7Zww7VWZ6K77IBbIyuFkUUM=;
        b=EQdZKFNOing6dDo0tCHi/PjeZLtVg6aqOJxDha07JNgcqHIL/qukvXXGFp+aJX8RLx
         NqLKojN236jCNEWkBXURtuXSeNNjPOVQHKVEyYM0iYBZ4Dzw6ZjHkdcyHroNZ8UY8lZz
         wD7AehNUn8UWCNl6KomdPAwVvffJHr/iRIs0QtXPwurrBHQNUJELvBGrXUbYsYTp71Bz
         sLImGRNMzPnNjtmq7kaykonledLfCvSE9BcmuBXbldRwLwle4bRc4+gIoohgW/hw4okZ
         TRVtB7ueK4WeqtfmgiMZo801QjIm11f0hjd3WT43vCmVCIfgNDFQbn/88/GvfpzPhT3N
         X8iw==
X-Gm-Message-State: AO0yUKUhuVdEVUMRxStwlpS3vvxLPo3lPIKbeyWvBzfsU/tNDr2eOY+r
	yzFW5EDwPKt4izskP3UyYcm91VES3LDnWwZzGTo=
X-Google-Smtp-Source: AK7set8VxH7lwiKYZQHjj1alCNiwWZsomKyHPncWio7rYDiPFQWyD3jSnBu7216hvtJHxDxHzVWwlnilO9YoLshnmQM=
X-Received: by 2002:a17:90a:d486:b0:233:c720:e6d5 with SMTP id
 s6-20020a17090ad48600b00233c720e6d5mr2292500pju.94.1676379427739; Tue, 14 Feb
 2023 04:57:07 -0800 (PST)
MIME-Version: 1.0
References: <20230214074925.228106-1-alexghiti@rivosinc.com> <20230214074925.228106-12-alexghiti@rivosinc.com>
In-Reply-To: <20230214074925.228106-12-alexghiti@rivosinc.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 14 Feb 2023 04:56:56 -0800
Message-ID: <CAMo8BfJ_RF2C7EkZJusFuVPh0-7zpgNaj1pDf079CSKzRBrQjg@mail.gmail.com>
Subject: Re: [PATCH v3 11/24] xtensa: Remove COMMAND_LINE_SIZE from uapi
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

On Tue, Feb 14, 2023 at 12:01 AM Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
>
> From: Palmer Dabbelt <palmer@rivosinc.com>
>
> As far as I can tell this is not used by userspace and thus should not
> be part of the user-visible API.
>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>  arch/xtensa/include/asm/setup.h      | 17 +++++++++++++++++
>  arch/xtensa/include/uapi/asm/setup.h |  2 --
>  2 files changed, 17 insertions(+), 2 deletions(-)
>  create mode 100644 arch/xtensa/include/asm/setup.h

Acked-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max
