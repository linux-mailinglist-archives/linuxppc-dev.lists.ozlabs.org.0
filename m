Return-Path: <linuxppc-dev+bounces-8866-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B1AAC0597
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 May 2025 09:24:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b30CC1pDVz30D3;
	Thu, 22 May 2025 17:23:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.227.17.21
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747898631;
	cv=none; b=jkKDnBFeaPLn8IyUDnaPSpBYbh4vJ2JBNvVR0pGwEYZRLYVCP7k1s/tVX8XV5ETRbC8gt1QbuTCJMs+h+BISDsBxFQexLSFNz+n5+SX6qdkbit0miKVyosaDWcJlhtmU3fOm7ym0kxQ2hl/B6rjoh0ADTrBqMUGRfMYzQNyGTrJ7UW5T2BBBXHfHo1A0XCzeAKcscwmmHKKXvoIXmusib0RzmB66CnXKrhDRxuMa3Nzy5KFXnGCy5gYSr4xZBMKBuv9BIckRjpQXBsixktHyoe4RI7WrRs6k+2IxP1Yk7gRre66de/VOE8tsePs3F+2kjW9acscxsC0GPuos8YLenA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747898631; c=relaxed/relaxed;
	bh=E6tqLN8PiFPAxwEdl8rGSxdMoJwbt5o6GzbLGsGHumA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jIuGvpTEnDHOfPrPKoFtJ+j6Cz4UvunxPiflUhYYf64bMW8aWyJZH+gJwsZtO69bld7rSGDvdE0mPhreAaSShU8V1Fi0Ee17b08xJ6WfnDc1d2I3cCxFlr55h/wQroLWC+zo2b3XartTpZXFA/aOpe4h8IJKizk1zSuOXULxXv7SXpBI4iMCm3vKYKyIeLB5GkK7Yjy0yWcJhRTn9Twi6ZXwtTKMINFbUmR9wOg/UOh9lQBBioME6ZXxy+jR3PmHYNSjokMGUETJhm0FkXM7A085Fs21Lb1NA+ThsXZFa/rzHXWRObT9cxb4P4Oums8gqffFuR2I6NGP+nQhQFVGZQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=Ol58d+/o; dkim-atps=neutral; spf=pass (client-ip=212.227.17.21; helo=mout.gmx.net; envelope-from=deller@gmx.de; receiver=lists.ozlabs.org) smtp.mailfrom=gmx.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=Ol58d+/o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.de (client-ip=212.227.17.21; helo=mout.gmx.net; envelope-from=deller@gmx.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 396 seconds by postgrey-1.37 at boromir; Thu, 22 May 2025 17:23:48 AEST
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b30C8134dz2yfK
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 May 2025 17:23:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1747898615; x=1748503415; i=deller@gmx.de;
	bh=E6tqLN8PiFPAxwEdl8rGSxdMoJwbt5o6GzbLGsGHumA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Ol58d+/o5Itmn4z09u5Zsa86HWyRZr6VwR1UNxDjyguQTkQ3xBZS53Xz/LZ6gG49
	 rJ0t4xwMmhpKhykyJvEahTvZf9Rd1RCviBQuiQ7L7QlAlW68BXm/iZil0jALuN5Oj
	 VLYGeIvRC/VrJxwjeI0r+7/vR0ePvKZkSriGzQ8u1SLDmzF8wSawog7/wdvKjU33u
	 LDISUeA52f25molrQ2MwrvrJAwmIlAQfA/k9V6qtx/2sJ082wHm2at5vpgWF4x1PZ
	 JXzL79Z69HM+VGvrqSBPA9Irx0YMOJU6PCSK+Mpymtpku8V+qHXmcI7/qdTczp1ls
	 mSdkvYTwAAjFbhChBg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.173] ([109.250.63.249]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MQMyf-1ueDrZ0lZR-00JvSN; Thu, 22
 May 2025 09:15:40 +0200
Message-ID: <377d444d-4163-4308-abcd-bbdf55c44be7@gmx.de>
Date: Thu, 22 May 2025 09:15:30 +0200
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
Subject: Re: [PATCH v1 1/1] floppy: Remove unused CROSS_64K() macro from arch/
 code
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Andreas Larsson <andreas@gaisler.com>, linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Matt Turner <mattst88@gmail.com>, Ian Molton <spyro@f2s.com>,
 Russell King <linux@armlinux.org.uk>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Denis Efremov <efremov@linux.com>
References: <20250521174152.1339379-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20250521174152.1339379-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:rRgMcf2JCnoDGJ6Tie6J4Qu2uzlzfwbeOOTAQbxVD3TSaj7TJMW
 4CruRG5IbRS1RTjyBZon9L6jFB2EtQOqLb6xyl9e66yTQeH+MUt+JrwVQYAyzhDigjzMlbx
 eql21HRqa8D6zdQaAbOQJYTTyaqxEbw8EwimC76fnIN1GlM2g3JgmYMjh1eJmBTlB0VR6t3
 7pZQvQyymrfOupghEQJ/Q==
UI-OutboundReport: notjunk:1;M01:P0:Wrn6iQBM1qU=;B2BWztPWBFpeLGmjkf92DNdihlu
 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
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 5/21/25 19:41, Andy Shevchenko wrote:
> Since the commit 3d86739c6343 ("floppy: always use the track buffer")
> the CROSS_64K() is not used by the driver, remove the leftovers.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   arch/alpha/include/asm/floppy.h    | 19 -------------------
>   arch/arm/include/asm/floppy.h      |  2 --
>   arch/m68k/include/asm/floppy.h     |  4 ----
>   arch/mips/include/asm/floppy.h     | 15 ---------------
>   arch/parisc/include/asm/floppy.h   |  6 +-----
>   arch/powerpc/include/asm/floppy.h  |  5 -----
>   arch/sparc/include/asm/floppy_32.h |  3 ---
>   arch/sparc/include/asm/floppy_64.h |  3 ---
>   arch/x86/include/asm/floppy.h      |  5 +----
>   9 files changed, 2 insertions(+), 60 deletions(-)

Acked-by: Helge Deller <deller@gmx.de> #parisc


