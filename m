Return-Path: <linuxppc-dev+bounces-13821-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4207EC382B7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 05 Nov 2025 23:20:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d20BH054Fz2yGM;
	Thu,  6 Nov 2025 09:20:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762381206;
	cv=none; b=UmFGI9XLdU1gZDnelA2WuE3bD6WO2hkVDCHqZEifVsBtES+FlFR3ssAgIIG88BvbOhe+H0Zo4rcKqgyRsznqly+wubdXxjnYg1UEhQ3TVhHkRNPNUwQXCAPDMpiQBC4HO3uXPjKWbK1Zvo+GCpkSsajGyW+jo6zv5nF3b8/broCBfqM9eVh6GmwmsulVP9202V6MBtI2972zl8EWkHC81Hy5MYLlE0gFmbz+syMj1AZzaAqjwF2rxsT90lANxu8FAAAmK5dTey0MIKRyU4roC02a7iHasSYzrt7oElKlBriw5+DUk4wK5/2RUeauFxEis+IXjyooHVm3/UqKLvBYEw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762381206; c=relaxed/relaxed;
	bh=NCbeKvO+ZjJAQ/elEkMe+bQoL8LQws9xVj3nTV1P/oc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hdI81EVDBUJ9CyWjFDqXVYmuZTr/eqR3jGrTulO2ST1S9DF5WfE7vjjURFpV8phVuF1OhD6V11k8qM4J9MwtGyobMrUurMK4xNQvoWXuFy/1O7Xmd8ixutYfu0CAwEl4WJ2HD5rwksLllTtBM7MRa71Q6Bt/m/UGANMOY8Sgv6FrEnhtZL4UFXsSYCBNwjPtzbDK5EHq/2YEhszyVuQM8YPUcvFZx5SAuKI7i6vG+IL6PFdf1xIra2gSeJHsVLJXS888/rFzlN3NUJh0cDBUks8vVzBbbhUFUmdoZHoHm8glafQ/Q59i6UgV2kw0Fxi6KCTp9VUvgxQkeOjDWC/KxA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d20BG16VNz2xQ2
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Nov 2025 09:20:05 +1100 (AEDT)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4d1zPN02rRz9sS7;
	Wed,  5 Nov 2025 22:44:40 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l1GfbrSwd72T; Wed,  5 Nov 2025 22:44:39 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4d1zPM5zM6z9sRg;
	Wed,  5 Nov 2025 22:44:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B8C168B77B;
	Wed,  5 Nov 2025 22:44:39 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 37srmVnLvJ83; Wed,  5 Nov 2025 22:44:39 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A23768B773;
	Wed,  5 Nov 2025 22:44:38 +0100 (CET)
Message-ID: <3cc3d311-35b0-42f1-b20f-ed59391bb8e0@csgroup.eu>
Date: Wed, 5 Nov 2025 22:44:38 +0100
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] powerpc: Use shared font data
To: "Dr. David Alan Gilbert" <linux@treblig.org>,
 Finn Thain <fthain@linux-m68k.org>
Cc: Stan Johnson <userm57@yahoo.com>, mpe@ellerman.id.au, npiggin@gmail.com,
 sam@ravnborg.org, benh@kernel.crashing.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, rdunlap@infradead.org,
 Cedar Maxwell <cedarmaxwell@mac.com>
References: <20230825142754.1487900-1-linux@treblig.org>
 <d81ddca8-c5ee-d583-d579-02b19ed95301@yahoo.com> <aQeQYNANzlTqJZdR@gallifrey>
 <20108eef-b7cf-3f23-264a-5d97021f9ffa@linux-m68k.org>
 <aQgJ95Y3pA-8GdbP@gallifrey>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <aQgJ95Y3pA-8GdbP@gallifrey>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 03/11/2025 à 02:48, Dr. David Alan Gilbert a écrit :
> * Finn Thain (fthain@linux-m68k.org) wrote:
>>
>> On Sun, 2 Nov 2025, Dr. David Alan Gilbert wrote:
>>
>>>
>>> So I'm not a PPC person specifically; so lets see if the PPC people have
>>> any suggestions, but:
>>>
>>>     a) Do you know if there's any way to recreate the same hang/works
>>> combination in qemu; I know it has a g3beige model but I don't know how
>>> to get something similar to your failing combo.
>>>
>>
>> I guess we could probably reproduce this in QEMU if the BootX bootloader
>> could be made to work there. In theory, 'qemu-system-ppc -M g3beige' might
>> work.
>>
>>>     b) Can you get any diagnostics out of the prom on the mac?  Like a PC
>>> or anything to have some idea where it hung?
>>>
>>
>> Well, that's the problem: if you enable the CONFIG_BOOTX_TEXT diagnostics,
>> the system hangs instead of printing stuff. If you disable the
>> CONFIG_BOOTX_TEXT diagnostics (in favour of serial diagnostics) the hang
>> goes away.
> 
> Ah, a bug that doesn't like to be seen :-)
> 
>> Anyway, I imagine that the problem with your patch was that it relies on
>> font data from a different (read only) section, which is unavailable for
>> some reason (MMU not fully configured yet?)
>>
>> So I've asked Stan to test a patch that simply removes the relevant
>> 'const' keywords. It's not a solution, but might narrow-down the search.
> 
> I wonder if this is a compiler-flag-ism; I see arch/powerpc/kernel/Makefile
> has a pile of special flags, and for btext.o it has a -fPIC
> (as well as turning off some other flags).
> I wonder if bodging those in lib/fonts/Makefile for lib/fonts/font_sun8x16.c
> fixes it?
> But... this is data - there's no code is there - are any of those flags
> relevant for data only?

I think -fPIC is relevant for data-only here because font_sun_8x16 
contains a pointer to fontdata_sun8x16 in font_sun_8x16.data

I see two things to try:

1/ Either build font_sun8x16.o with -fPIC

diff --git a/lib/fonts/Makefile b/lib/fonts/Makefile
index e16f68492174a..844306d7b15e9 100644
--- a/lib/fonts/Makefile
+++ b/lib/fonts/Makefile
@@ -20,3 +20,5 @@ font-objs-$(CONFIG_FONT_6x8)       += font_6x8.o
  font-objs += $(font-objs-y)

  obj-$(CONFIG_FONT_SUPPORT)         += font.o
+
+CFLAGS_font_sun8x16.o             += -fPIC

2/ Or add a PTRRELOC:

diff --git a/arch/powerpc/kernel/btext.c b/arch/powerpc/kernel/btext.c
index 7f63f1cdc6c39..fc461cfaf4a34 100644
--- a/arch/powerpc/kernel/btext.c
+++ b/arch/powerpc/kernel/btext.c
@@ -20,6 +20,7 @@
  #include <asm/io.h>
  #include <asm/processor.h>
  #include <asm/udbg.h>
+#include <asm/setup.h>

  #define NO_SCROLL

@@ -463,7 +464,7 @@ static noinline void draw_byte(unsigned char c, long 
locX, long locY)
  {
  	unsigned char *base	= calc_base(locX << 3, locY << 4);
  	unsigned int font_index = c * 16;
-	const unsigned char *font	= font_sun_8x16.data + font_index;
+	const unsigned char *font	= PTRRELOC(font_sun_8x16.data) + font_index;
  	int rb			= dispDeviceRowBytes;

  	rmci_maybe_on();


Christophe



