Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B06695E96
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 10:12:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGFpV5q5Tz3fcs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 20:12:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Wsp4Zlb8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com; envelope-from=philmd@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Wsp4Zlb8;
	dkim-atps=neutral
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGFk00KNsz3fTC
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 20:08:23 +1100 (AEDT)
Received: by mail-wr1-x430.google.com with SMTP id k3so7242036wrv.5
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 01:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dJq3RRMzf3lbuS5bgQVc8NQ+nEsYjE4jNGYbXmQQw78=;
        b=Wsp4Zlb8V2Jx4m9+tXkDNgf5Lxau03xHaG+6WGxc+G8HrcJltAE2Px1QSC5XUlVOpz
         2Ng4jqNhjAJ4QJFwe7IYqEDhVP83rKHt0zthGOU/F+j+7d3lCfNC+HaTRTHh98F2fr7Y
         I1aHMaHeLfbmf2lAE+TKEJNN/s8peiJT6bIUpf+6MkHhRn0aKlK4U+gulZSfiKfbW+Eu
         wBNce34+0fI2Gh7tFdgEA0vsetKVHpBVYQ4d3RHWTRqruuVixLinnhKVyILNuRuoZPxH
         SlDA849VfSADVOOeo3f3/Yud1fZ/0yd8ncI6fO9i/ywnDuaYO8zFs36ALYL690/jjvZv
         Clag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dJq3RRMzf3lbuS5bgQVc8NQ+nEsYjE4jNGYbXmQQw78=;
        b=NbJQO28cKKKECLFERo+CsE8CQY1+UgdqZRZgZByzPO9J173AmpAq+4rV0OegtzWYPc
         mP7xQW994m/S2AQP2H8b+eUyiRWHabOIOf1N5qZNEtBbuMWO0fdJW06orBbnU7lN6vKf
         pHOThpa8wGW8MPxVk/wfcnOJXFIZHFNKk2uyh6fwj0aKWDkZagY2H97hGyN1CR+sz6Io
         Ko62a7xVPe7rPrVvWo3pt3MiZ6Ik4Dk7guNsSwU0CpTJk0Zf+sufG2yTBNWm4u0lY8rj
         9QjBDYCP/EaC30ItIFvvfgzhrbq0TzIzR26KbIziMvqPppi5w6yQqyuKis02DVTqdjtn
         CA4A==
X-Gm-Message-State: AO0yUKUus3/3kogiuyVt8MhVsjLsLMkRRPSRDyso3UF8lumeAfS9GYor
	X17q2zA3QNCl2B/ZvDnKnf+I3Q==
X-Google-Smtp-Source: AK7set9xlomseTD4h4a83sLRQq4DtapmagaqXlgE7UNo4UXcLklpQodFpnducrj9Vfa/kRz/NDHZaQ==
X-Received: by 2002:a5d:4e01:0:b0:2c5:5a68:958 with SMTP id p1-20020a5d4e01000000b002c55a680958mr1356559wrt.33.1676365699836;
        Tue, 14 Feb 2023 01:08:19 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id n13-20020a05600c3b8d00b003dc434900e1sm17810977wms.34.2023.02.14.01.08.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 01:08:19 -0800 (PST)
Message-ID: <f327ff48-cd50-4caa-1bea-f9906994e998@linaro.org>
Date: Tue, 14 Feb 2023 10:08:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v3 08/24] parisc: Remove COMMAND_LINE_SIZE from uapi
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
 <20230214074925.228106-9-alexghiti@rivosinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230214074925.228106-9-alexghiti@rivosinc.com>
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
> As far as I can tell this is not used by userspace and thus should not
> be part of the user-visible API.
> 
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>   arch/parisc/include/asm/setup.h      | 7 +++++++
>   arch/parisc/include/uapi/asm/setup.h | 2 --
>   2 files changed, 7 insertions(+), 2 deletions(-)
>   create mode 100644 arch/parisc/include/asm/setup.h

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

