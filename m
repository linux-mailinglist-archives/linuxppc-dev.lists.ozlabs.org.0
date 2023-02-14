Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BF026695FC9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 10:52:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGGj84kwMz3cMH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 20:52:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=ggK3TJTd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.de (client-ip=212.227.17.21; helo=mout.gmx.net; envelope-from=deller@gmx.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=ggK3TJTd;
	dkim-atps=neutral
X-Greylist: delayed 377 seconds by postgrey-1.36 at boromir; Tue, 14 Feb 2023 20:51:56 AEDT
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGGhD12J9z3cJK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 20:51:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1676368303; bh=bQoG1+qM5Y71xKKNzZAaZKaP54c9/SNL37IJdDcFtMo=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ggK3TJTdcCWur1Jd9SBDHDT20RMJWVuzD+pjRqBIZdq+BEtBSEixz7vHnSPTIfo05
	 ZBikzMxIdsXY4PiutVl5nkaxPp9ED/EN0y/upkwmPNLNsqXkSg1LSz5zG+78y4QP1h
	 Y3wobcPYwVuEmb/hMtFi4+tHf+CkecUs13XLPtUA8L8RGNeHs4AILRNIblTD03OsEt
	 04sFuJIPR3llPVurn5g9L3+9a/Op7AO05a5e0ohvoxeqKBoRWP1Sxl4W7VLiVpWpMV
	 990CWXBsp/Ams007fazwRlLUqZxwIn3pBFm9XdSyqNeRSQlxQII9mMBvtUlZ2usK1s
	 y8gZJ/L48OTDA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.155.167]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mo6qp-1olPAN2FEh-00pbOn; Tue, 14
 Feb 2023 10:43:48 +0100
Message-ID: <dd3f45ec-9578-420b-f1b8-5657fe4d3243@gmx.de>
Date: Tue, 14 Feb 2023 10:43:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 08/24] parisc: Remove COMMAND_LINE_SIZE from uapi
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
 <20230214074925.228106-9-alexghiti@rivosinc.com>
 <f327ff48-cd50-4caa-1bea-f9906994e998@linaro.org>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <f327ff48-cd50-4caa-1bea-f9906994e998@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:9Li8qIWZi+mvM820GG2clzFMNjBrqaWKtjHwHuJ3DICcz81Fm4U
 2RmO3PI+i3+wTXVGnrbheX/pLAWTgvn/yTBVQw0fLroxnm5K1IoQdsZqRZENGN3ATbehT4q
 LYJbtkfgHvqXKQS4gXQhgNMMzAzKtJiyxwXWla7+a/b/HmF4fSRj8M4VAnavnpLBfZrNVAE
 KFiLIhh+7vq2/cG5n7DgQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:PXunr6cGLuU=;yIMSYUfEWalBRGGazdJpwEK3b1D
 xmw7MW/PFAlkd7y7M05DH5xLeYxWZTFcm/eGdRLcM7SmfoMDSm0v48twU3FfPyArlZl3dbimY
 1zheptl/fvXh0vbvP7KEMaVtKXyiWX7yLvE7dHfjBGNnSNwUEXie8a9rpO9KlpoK8krm8+Zg6
 BZ5QR5EHlxUo10CmCAo4c1Jw/AB2vWxHWCZgjAcq3cKKs7lpeF8F9cblc+rh+WXHafAHMXbFX
 cJJ70PHJA+8/t0OyckZaRAZAExKblephOBMpmTWouGcJK29oiqD8Pg1dSL4GFc7eecKARglnv
 QgwmvNerw1Iuzv4+0tRuAl/RbSi/7MCu6+6Drk8MwaMX0N8HlCkJjx+4PSYn4K6D1SAMHILOP
 FzCkpVrcd1nH083QvSMVrKt0qXiBn1VHJaIQoGsDyKMS+i0aSZJ4DddziEa7uW+Xpj+Xj1w8L
 sD1P2/G3ykXYSImfi2b6U2xF+Ayq5sHdP/xG2QUeETB7kQIqzGpKI96/j3b1qFh6vP/v5x337
 sQqXlemW/JG7M8Pe4A/k7+XXgGcLTU66n49hWeXIDi37btL3CYlLGRxk6ZGiLBYRKO40S7GQ7
 frSdxDlr0SRLINi3CcBUo0OaCarKR38LW1qiWZm0XHS3e6Uss4LwyYaHcqW2JojO8NhPXabA3
 y5PTH8/eWLNTq+v/GI1COb6xPQGTS0vXYPoEo3UmZ2V06AS5qBFQWU8FvBuGbouLiz/RRFEzw
 jNQeSI/3wn9xXhlOU6I6sDvdUQn76kIq5XX0V/wCcNPS28dTgzh/fodVa3HluqbyDaKWznw0j
 qiq9GZ8ZGG108jVMYya2kjRSM5tdm+leNVpVFqnARbemwoG2Do8riURgW8Tfx3m9Dl7tQ0b8C
 SY/fxKsicOmIHdSx831MFJPZBLKOOxIq0PbUmAB42SMbFYnHnnA8ThxKLJ55rOGDFYi5r5LCg
 uSU+OQ==
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
>> As far as I can tell this is not used by userspace and thus should not
>> be part of the user-visible API.
>>
>> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>> ---
>> =C2=A0 arch/parisc/include/asm/setup.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =
7 +++++++
>> =C2=A0 arch/parisc/include/uapi/asm/setup.h | 2 --
>> =C2=A0 2 files changed, 7 insertions(+), 2 deletions(-)
>> =C2=A0 create mode 100644 arch/parisc/include/asm/setup.h
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Acked-by: Helge Deller <deller@gmx.de>



