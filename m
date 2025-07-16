Return-Path: <linuxppc-dev+bounces-10275-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E4EB07C7F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jul 2025 20:08:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bj3w00Tdyz30Vn;
	Thu, 17 Jul 2025 04:08:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:7c80:54:3::136"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752689328;
	cv=none; b=ZTv2Tgw0yxmt+Ib+iYamEQ5msXH7c5Hd8kCxsAOsWLfKFUnwJvRtzarwDuOzuGibXgZjemnkwwpEkRCN4PD04BONsk/YMGyPw17TxDo4SY9jztjdZfIjmE7/mkPXLdws+rO7iRJfqHDX6O5xODiVH3VgA/OI3lS0mDcRNDbcRFDEy7c14U30qBCY1fcTwbheJHUTmZE5GyC5AyePCat4o0NmNKxQMpRPzsGuBE6XA87PhSqL5YtbAo4YPhcYtEt19NaiD91GMFKipVwjD1AqdJgiZ+JWXR2mcZZQFP4/XjYPbKAtBTQbO/TvwXGC5QQ8u8i2MWaTRlxbOzr9tIA33Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752689328; c=relaxed/relaxed;
	bh=AxYk3hb0otPOpe8iCoKRDXyzipO8+IEj3pxhrwFiias=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=WJVzheLxJxsC1NnQBceGxuxdAkrAY6cphpPAPXw1gUmncQ25dJ2BfTAWskFQw5FqWLj3uZCDg34i+/huLoYR6RD+z04O4dcWJxLJcwbHyOUITlPoERUNBVWSMHEXus39flZL07yXn8Qd0RbLJPgjzCO/U+TYIvSN/1rhercGevysBDN6Rvx1pI88HUgAILMHhUOL+m/8v9XlHB9hCEPU5rD/6aj0+3nlsxLYn6YdKpWV/VdA91cHWyURNsYs57AdJADj9l4KT/RrbRKtgmw5aV/OfIe/btFSqGnHvEySemjjLrFd97CMg2O4zGxBRn0GNzXJ4sCTfSWmRKZpSmXTxA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zytor.com; dkim=pass (2048-bit key; unprotected) header.d=zytor.com header.i=@zytor.com header.a=rsa-sha256 header.s=2025062101 header.b=PdYs1CW7; dkim-atps=neutral; spf=pass (client-ip=2607:7c80:54:3::136; helo=mail.zytor.com; envelope-from=hpa@zytor.com; receiver=lists.ozlabs.org) smtp.mailfrom=zytor.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=zytor.com header.i=@zytor.com header.a=rsa-sha256 header.s=2025062101 header.b=PdYs1CW7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zytor.com (client-ip=2607:7c80:54:3::136; helo=mail.zytor.com; envelope-from=hpa@zytor.com; receiver=lists.ozlabs.org)
Received: from mail.zytor.com (terminus.zytor.com [IPv6:2607:7c80:54:3::136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bj3vy2sZTz30Vb
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jul 2025 04:08:44 +1000 (AEST)
Received: from [127.0.0.1] (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 56GI4wZF1640497
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Wed, 16 Jul 2025 11:05:02 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 56GI4wZF1640497
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025062101; t=1752689107;
	bh=AxYk3hb0otPOpe8iCoKRDXyzipO8+IEj3pxhrwFiias=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=PdYs1CW7P6NGZ7nqrSTKiw9kGz8+zKtbJLnnYWGn7EmE85IhMRHjUsfqejqSu3NpC
	 F8mkqPxV94oRfsry8xLqbBh6TIeqEphXrM8IQVQXG98VV0VtmaqRkm8gcHZ1DS8I+Y
	 9Ud40lsWpWvI8f/Mw4fJttPFSqVPnBxm60MpDadKClPpxIliIxgGgmXKbtvKQmNI4w
	 9zRbpJ/rGGTy9XhzMH+JGYmHR8cviSmLp4ZAluTl43LX0HJw1hILVpbbrTd8F7h/pQ
	 VEaChnOfID89c6bfwtXUBb4UKngfABWVJFjrAYzLGKal7C5mVferZwFoGX1uSfry52
	 xqWYa7EnyTKlQ==
Date: Wed, 16 Jul 2025 11:04:52 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Richard Henderson <richard.henderson@linaro.org>,
        Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
        Brian Cain <bcain@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <kernel@xen0n.name>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michal Simek <monstr@monstr.eu>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>,
        Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
        Stafford Horne <shorne@gmail.com>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Yoshinori Sato <ysato@users.osdn.me>, Rich Felker <dalias@libc.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        "David S. Miller" <davem@davemloft.net>,
        Andreas Larsson <andreas@gaisler.com>,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        linux-arch@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-api@vger.kernel.org,
        Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-alpha@vger.kernel.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
        linux-m68k@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-um@lists.infradead.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_1/1=5D_uapi/termios=3A_remov?=
 =?US-ASCII?Q?e_struct_ktermios_from_uapi_headers?=
User-Agent: K-9 Mail for Android
In-Reply-To: <aHfn9z9_oIVgNGgx@shell.armlinux.org.uk>
References: <20250716164735.170713-1-hpa@zytor.com> <aHfn9z9_oIVgNGgx@shell.armlinux.org.uk>
Message-ID: <9AEAF0BE-39D7-4617-9CB5-D0703B3E6DF8@zytor.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On July 16, 2025 10:57:11 AM PDT, "Russell King (Oracle)" <linux@armlinux=
=2Eorg=2Euk> wrote:
>On Wed, Jul 16, 2025 at 09:47:32AM -0700, H=2E Peter Anvin wrote:
>> diff --git a/arch/arm/include/asm/ktermios=2Eh b/arch/arm/include/asm/k=
termios=2Eh
>> new file mode 100644
>> index 000000000000=2E=2E4320921a82a9
>> --- /dev/null
>> +++ b/arch/arm/include/asm/ktermios=2Eh
>> @@ -0,0 +1 @@
>> +#include <asm-generic/ktermios=2Eh>
>
>Isn't this what arch/arm/include/asm/Kbuild's generic-y is for?
>
>Ditto for other arches=2E
>

Ah, yes, you're right (except for those with nontrivial stubs=2E)

I also found that a handful of drivers and arch/sparc needs <asm/termios=
=2Eh> =E2=86=92 <linux/termios=2Eh> in <linux/termios_internal=2Eh>=2E

