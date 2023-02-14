Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9FC695E37
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 10:08:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGFjd6Yq2z3fQf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 20:08:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EXGAKwqd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=philmd@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EXGAKwqd;
	dkim-atps=neutral
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGFgM3lLCz3cgp
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 20:06:07 +1100 (AEDT)
Received: by mail-wm1-x32e.google.com with SMTP id o36so10489807wms.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 01:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7lGDtk89XYKXto3T46jdYJS4baOVf8wKH+bEbt2a13A=;
        b=EXGAKwqdwp45M55oyQEpZ9s11tIxJVKDmyxfqRpvLJ7iwHOMdleuZVIpZf+bKKyPLr
         WUmLzZkawn8dDugm0+h+Q8ZztTAJOf1O7RBwABByNfudNg39nvhjEZOsLMdComtJkvIa
         mOOACAo1ti2X0i/R+p5qH9s2EuWERiT4zROiXcWcmiZbyHZPXjCCE1gXI/suledcbnSO
         s58Z5QMsqj5quNavEg/vVJJ+jxlYMkAW8M4TmJ/UyxO8tMShf9afsiCM+8VlZQw98Tky
         i7/1rC5LDixGnMLStzpUQU6pXp9qisKPVZ0aJqBQKPI5FELYesfgWZu690GNKAT9DMLM
         t++w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7lGDtk89XYKXto3T46jdYJS4baOVf8wKH+bEbt2a13A=;
        b=BuudjOsw+sGhkR4fF2vhoNd8d59aRkw8PvzD/URxPRM4i0W/4bcFR3gldyum+AKeQq
         s49lgPT7b202Ne480zfi4mXD8PvWswauP3Zxzl1sWUiWLOhU8DzqLnmKME5b5HdnidYs
         WPRl+KBcTEKpw39tkAk2pddPSOOj/yTU9GCnkqQtv2kfnlwN6KdbJRBvdjgOgcldhio4
         9zH+x+xJvmxW0na+58cgGrnX3m8UDNuT8Hz5qf2OnmNF4gOygnaaEwh1j/vBl1YTOFLP
         b8cy0V7OTDlbuSydDsdjHf142+Y+qulv72orE1rMPql4LlAu69b+d6FkwujGfdpexuvB
         KFEQ==
X-Gm-Message-State: AO0yUKUeVGrOBrO6/Sy6uurwTX+pYy+ElobIXW9WPGa3sjaSHRNP0kFv
	NYVO7/lMM/BZ4F2Yutky+EfWfQ==
X-Google-Smtp-Source: AK7set8b+gc17B9aLvg2W9QWD8SjR16ECHsQicot+4Ai+Gvau6Qhz0rnes/7lNYL7+rM27ct6ais4g==
X-Received: by 2002:a05:600c:548c:b0:3e1:11bd:f577 with SMTP id iv12-20020a05600c548c00b003e111bdf577mr1957731wmb.26.1676365564223;
        Tue, 14 Feb 2023 01:06:04 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id n16-20020a1c7210000000b003dc1d668866sm19174017wmc.10.2023.02.14.01.06.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 01:06:03 -0800 (PST)
Message-ID: <84bde3ef-4701-431c-3ae0-3f5793e1e13a@linaro.org>
Date: Tue, 14 Feb 2023 10:05:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v3 14/24] arc: Remove empty <uapi/asm/setup.h>
Content-Language: en-US
To: Alexandre Ghiti <alexghiti@rivosinc.com>, Jonathan Corbet
 <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner
 <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 "David S . Miller" <davem@davemloft.net>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, linux-arch@vger.kernel.org
References: <20230214074925.228106-1-alexghiti@rivosinc.com>
 <20230214074925.228106-15-alexghiti@rivosinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230214074925.228106-15-alexghiti@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Palmer Dabbelt <palmer@rivosinc.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 14/2/23 08:49, Alexandre Ghiti wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
> 
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>   arch/arc/include/asm/setup.h      | 1 -
>   arch/arc/include/uapi/asm/setup.h | 6 ------
>   2 files changed, 7 deletions(-)
>   delete mode 100644 arch/arc/include/uapi/asm/setup.h

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

