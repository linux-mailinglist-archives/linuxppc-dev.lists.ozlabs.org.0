Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F6934DDB2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 03:39:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8XDy73rvz30B8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 12:39:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ics.forth.gr header.i=@ics.forth.gr header.a=rsa-sha256 header.s=av header.b=CXdKG8Ae;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ics.forth.gr (client-ip=139.91.1.2; helo=mailgate.ics.forth.gr;
 envelope-from=mick@ics.forth.gr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ics.forth.gr header.i=@ics.forth.gr header.a=rsa-sha256
 header.s=av header.b=CXdKG8Ae; dkim-atps=neutral
X-Greylist: delayed 1075 seconds by postgrey-1.36 at boromir;
 Tue, 30 Mar 2021 12:10:28 AEDT
Received: from mailgate.ics.forth.gr (mailgate.ics.forth.gr [139.91.1.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8Wb86zMxz2yYg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Mar 2021 12:10:28 +1100 (AEDT)
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
 by mailgate.ics.forth.gr (8.15.2/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 12U0qOxi066167
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Mar 2021 03:52:24 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; d=ics.forth.gr; s=av; c=relaxed/simple;
 q=dns/txt; i=@ics.forth.gr; t=1617065539; x=1619657539;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4Ytp87wkA+alvM5YO/7dlXgP5/jZJBWXepwASfozGUU=;
 b=CXdKG8AeuRZiwZ+qSuU9itQVeS+S6jzZD+LSRTjBq4uIMwy1EtYl2LFohFQ3P0aL
 1snhQLBfGMnJPLlMUvta1R1ExG60xpMGjvqAzE108mPHfXrfMlKUizgfR2G3CWnj
 dKei0YP7+vI+q9xmsTyWmdWtYdS0hBwgkfMMp+y/DHsFRhQlCWvNoRqg2neDGsDy
 A/MbNsCxbPucEdxZvgGboLEud/obw/iKdEC8cDqcfAJRCeFRpho58PpEswmR8XMQ
 DBZlttMlmL7pkMgUDfZroBTVf9b7EC2+ikG/v595zLMuOGi9LkWZ5Pgiy0gLVEtB
 d2DVMQG/q9QvZWbAMsyDiw==;
X-AuditID: 8b5b014d-a4c337000000209f-f6-60627642ff7a
Received: from enigma.ics.forth.gr (enigma-2.ics.forth.gr [139.91.151.35])
 by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id
 86.6D.08351.24672606; Tue, 30 Mar 2021 03:52:18 +0300 (EEST)
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Tue, 30 Mar 2021 03:52:17 +0300
From: Nick Kossifidis <mick@ics.forth.gr>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 11/17] riscv: Convert to GENERIC_CMDLINE
Organization: FORTH
In-Reply-To: <CAL_JsqK2TT=j1QjiRgTYQvwHqivE-3HgYo2JzxTJSWO2wvK69Q@mail.gmail.com>
References: <cover.1616765869.git.christophe.leroy@csgroup.eu>
 <46745e07b04139a22b5bd01dc37df97e6981e643.1616765870.git.christophe.leroy@csgroup.eu>
 <87zgyqdn3d.fsf@igel.home> <81a7e63f-57d4-5c81-acc5-35278fe5bb04@csgroup.eu>
 <CAL_JsqK2TT=j1QjiRgTYQvwHqivE-3HgYo2JzxTJSWO2wvK69Q@mail.gmail.com>
Message-ID: <3ae0c2faa08f76efb8a446f262b712df@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.3.16
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRmVeSWpSXmKPExsXSHT1dWde5LCnB4AO/xZ1Jz9ktjh7vZbZo
 XriE2WL+kXOsFvd3NzJadOz6ymKx6fE1Vov3LTvYLC7vmsNm0blpK6PFts8tbBZz/kxhtlh5
 di27xe/v/1gtnnw8DVTceZnNom0Wv8X/PTvYLfqXdrBZNJxcwWrRcsfU4seGx6wOYh5Tfm9k
 9fh68xyTx/0Hz1k9Fu95yeSxaVUnm8ehwx2MHi8Obmf22Lyk3mP9hm2MHudnLGT0+Ns1hdnj
 UvN1do/Pm+QCeKO4bFJSczLLUov07RK4MpqW3GYuuMdT8eD2fOYGxrVcXYycHBICJhKb5j1j
 72Lk4hASOM4ocWFHFwtEwlRi9t5ORhCbV0BQ4uTMJ2BxZgELialX9jNC2PISzVtnM4PYLAKq
 Els+QMTZBDQl5l86CFYvIqAo8bttGivIAmaBz+wSj242AhVxcAgL2Essn2UHUsMvICzx6e5F
 VhCbUyBQ4uqL32wQB61hkjh69A8zxBEuEv8+TmeFOE5F4sPvB+wgc0SB7M1zlSYwCs5Ccuos
 JKfOQnLqAkbmVYwCiWXGepnJxXpp+UUlGXrpRZsYwRHN6LuD8fbmt3qHGJk4GA8xSnAwK4nw
 Ch9ITBDiTUmsrEotyo8vKs1JLT7EKM3BoiTOy6s3IV5IID2xJDU7NbUgtQgmy8TBKdXAZDF7
 Ibu7bpJ0S056lY5T1mb7vUI9xyRZInM7SjMP8ahbfi7Uu/0qNq1njospX8DU78dj3x2SfDtV
 xHr+FbGLEcWvzua/LQj7ONkr3DCLIUHfakKWSpDXwry3fhOKIt/ODEo56nXrAdt29SnP+nMU
 /0fe/8z4TdbTnDN88c+XOWxtenuYQhzmfH6zlLlrvXps4O6P71n8I2qa5vKWSe5VsPzLdTHu
 SsfRmr9zrF4xMis2pC6wc3hy+6X3kX3s6p2BTRKZ765un2UqyV7ZejbXdqbCqqDP7v8XdzH4
 y8tEl3xTvfqpobI9Nip3m3ir+7L5W7548iblXFzk8i1x838fU8lVvJ6yk1SXnTbzEFViKc5I
 NNRiLipOBAC7YhWKVwMAAA==
X-Mailman-Approved-At: Tue, 30 Mar 2021 12:39:24 +1100
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
Cc: "open list:GENERIC INCLUDE/ASM
 HEADER FILES" <linux-arch@vger.kernel.org>, devicetree@vger.kernel.org,
 microblaze <monstr@monstr.eu>,
 Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
 linux-xtensa@linux-xtensa.org, SH-Linux <linux-sh@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, X86 ML <x86@kernel.org>,
 linux-kernel@vger.kernel.org, "open list:MIPS" <linux-mips@vger.kernel.org>,
 Openrisc <openrisc@lists.librecores.org>,
 Andreas Schwab <schwab@linux-m68k.org>, nios2 <ley.foon.tan@intel.com>,
 paul.walmsley@sifive.com, linux-hexagon@vger.kernel.org,
 sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Daniel Walker <danielwa@cisco.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Στις 2021-03-26 17:26, Rob Herring έγραψε:
> On Fri, Mar 26, 2021 at 8:20 AM Christophe Leroy
> <christophe.leroy@csgroup.eu> wrote:
>> 
>> 
>> 
>> Le 26/03/2021 à 15:08, Andreas Schwab a écrit :
>> > On Mär 26 2021, Christophe Leroy wrote:
>> >
>> >> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
>> >> index f8f15332caa2..e7c91ee478d1 100644
>> >> --- a/arch/riscv/kernel/setup.c
>> >> +++ b/arch/riscv/kernel/setup.c
>> >> @@ -20,6 +20,7 @@
>> >>   #include <linux/swiotlb.h>
>> >>   #include <linux/smp.h>
>> >>   #include <linux/efi.h>
>> >> +#include <linux/cmdline.h>
>> >>
>> >>   #include <asm/cpu_ops.h>
>> >>   #include <asm/early_ioremap.h>
>> >> @@ -228,10 +229,8 @@ static void __init parse_dtb(void)
>> >>      }
>> >>
>> >>      pr_err("No DTB passed to the kernel\n");
>> >> -#ifdef CONFIG_CMDLINE_FORCE
>> >> -    strlcpy(boot_command_line, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
>> >> +    cmdline_build(boot_command_line, NULL, COMMAND_LINE_SIZE);
>> >>      pr_info("Forcing kernel command line to: %s\n", boot_command_line);
>> >
>> > Shouldn't that message become conditional in some way?
>> >
>> 
>> You are right, I did something similar on ARM but looks like I missed 
>> it on RISCV.
> 
> How is this hunk even useful? Under what conditions can you boot
> without a DTB? Even with a built-in DTB, the DT cmdline handling would
> be called.
> 
> Rob
> 

cced Paul who introduced this:
https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git/commit/arch/riscv/kernel/setup.c?id=8fd6e05c7463b635e51ec7df0a1858c1b5a6e350

