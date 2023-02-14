Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD194695FD4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 10:53:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGGk94SrMz3chn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 20:53:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=Z40bqDXB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.de (client-ip=212.227.17.21; helo=mout.gmx.net; envelope-from=deller@gmx.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=Z40bqDXB;
	dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGGhH4FsZz3cJK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 20:51:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1676368307; bh=ERFp+UKx/iNbj6Y6kJUSMmT/xdPleSppwgENqVxf/VM=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Z40bqDXBP/F9oV53LcEREB5PBdd0NpYzJGE/bbwHlWb+XOSH3Xxh5dLPhZHYUqWb1
	 OCoUiebHpU/CCtn3uYqUOCjyuTwYDhp5lesnuEaFnjiKZwmWZ53TBivhw2PYr5f8Cu
	 FXEqWWQOEBSSM2jl02d2r/fG/N0nTO+F8P492V9tbRm2ZARkNzSXM3/p2+Pdnvrre+
	 HpsUN3veeHz/B0mIAwiIIPrWtUfPBVIdEpYiiaPCZQGoTeRToE/zXfhBuqLYgBYmg0
	 mbNEtkRih2Asp3btTtHrKN+VhaBSyRTThNdyLi4DqEx+Jo+OxffWzxnuBd/UuZNaCZ
	 4KGq7nb/zvoMA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.155.167]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mr9Bu-1ooy3k2CyE-00oHk0; Tue, 14
 Feb 2023 10:44:30 +0100
Message-ID: <32c2584a-8777-26b9-ae29-80df9dfa7833@gmx.de>
Date: Tue, 14 Feb 2023 10:44:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 19/24] parisc: Remove empty <uapi/asm/setup.h>
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Alexandre Ghiti <alexghiti@rivosinc.com>, Jonathan Corbet <corbet@lwn.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner
 <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
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
 <20230214074925.228106-20-alexghiti@rivosinc.com>
 <6f9c7a6b-4f6b-dead-2d9b-14b405f18397@linaro.org>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <6f9c7a6b-4f6b-dead-2d9b-14b405f18397@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6i9MLH1uyN4UjvbKa9qFgGzxyogAl9vzFG+CnYpeJmhfg1aCjEo
 fgPVjxDy4iWSOp0fQduaCkCLS49XMnxFV3Cebj1wXgxrmR7Mk+7ALLo+bEOtaCQ7LtdzxdY
 sCyP+X8u7wZGNhDO2HoSYGEmEl3/72yEi0kFbG3gxrNGYWo22p1QITkOnVbWjeRtGq3QAhO
 81HzmD9N+fT9Dd0qQJFHw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:6K7DKtuncJc=;4jGoJJpga+nAgUYx9WBJcpIro23
 kV5yvYpAbpcrebTqZ2hnSLJadS56Rr5oIczgEMH9eCSoyNJgcV5eD2G60/YdXruAWGY+fKo8s
 +cBC/3cBgkL9Hv6bw+0dcMvyr7AUO1gVlcOTRJ0FEkBJMOwbEXATbR1q8tBSrrn5rwBNmcdWc
 guiCtUwiil4d86ERxwXVnAkZ7jxwOXKs5wp/+22Bxgi3stOXu7fRyHA8Xfe+XrPXviVJVGMGJ
 4hBeMH5C23/USQV26bIwV8L/P3HewunsDiinz9WH5DOt7kYoYz3sn8GMBYrZfQ7XS3i8g7CdH
 PQZ4bO6dZJhygYF55FvtOl3rLlCEjf6YbPtN2P1Hs3m6yrpoy2Zr1PigdtBrKJf2RuDi+gqP1
 Rha7mzEcK+cMFKXJU19TscBQGziuEPeNUkKqej5Mj+xvSKTeld9c3Ir/Wiuk2rARr9Gefs6tG
 zIxum5BDPss2LAB3/Ys5C71DoXrDH9p+cGDNFcN1ahhfmeTSLuQVjvGDSOoGlDRbo4uK0B6Yq
 OKoEMPzsGdgm9tv2QY9vxSrwsNQqoTTX6folqaimEMJm4/kAeNutcfjSJcsaU4lQmfKo2kl0h
 OLAlR3gOT54OG+hTW6huMQF9TO/JaGa4In/++3VkeZfdlCq+2DLKkY26uA1HTLdcmSr2TE7YI
 IQu11DnJLfRiwnaSNoeZe9TKe2/fsAtzplmITlXpRtxmytHfUt6XytOoAJek0S0Jsdp4EaoAS
 HBLPJqjr6+aUXs7vum4M+EpUEhHUcMgdx56tClqx8n1wwUIvWKwB9YZe7xRmfnQ97nz8SlLcV
 cbRha1EDIQ3uIMoHR8oVhYphVeJ519ivUqhn1/jPaYLAj6We9iEo06WFIbXQ6kgNW+WXHABwS
 5lx343kVNw1lRDhPMg2/nVLuZy2ZzMH50M3i52WMoOcflTSR+WRcb58oT0SG5XGFktF1m8+SP
 iV7N5gr+Y4NEz4saNPalOz+TuoY=
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

On 2/14/23 10:08, Philippe Mathieu-Daud=C3=A9 wrote:
> On 14/2/23 08:49, Alexandre Ghiti wrote:
>> From: Palmer Dabbelt <palmer@rivosinc.com>
>>
>> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>> ---
>> =C2=A0 arch/parisc/include/uapi/asm/setup.h | 5 -----
>> =C2=A0 1 file changed, 5 deletions(-)
>> =C2=A0 delete mode 100644 arch/parisc/include/uapi/asm/setup.h
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Acked-by: Helge Deller <deller@gmx.de>


