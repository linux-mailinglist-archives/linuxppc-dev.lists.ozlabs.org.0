Return-Path: <linuxppc-dev+bounces-1485-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 312B597D0D6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Sep 2024 07:10:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X90pC6D6qz2yPR;
	Fri, 20 Sep 2024 15:10:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726809043;
	cv=none; b=FU4jkUUkeWWIvCiXSaqiCE41a3GlBgBtScx1mtn+5FbxZOEYSnITpHaX+3+RGoqsXZAQqSe0SKydG1H34vQfar79x+3HNZVnHv+Wi4h8Zim2Fe/O5AFJpFUlO0+jvGQI9SIb/SwGslNcoXhBswzN5NK8batVVvrD/Um199QyqW4QaYXhHGeM7RKxzP+ULXwDMIhZzfvr+xRlG5lC+AJU/o4STNhdlIdbWyoqcQxnYeEem/6eDmqd+nGqlW7/yWxyI2GTPs6jjSXzPkaQfkDs/SvXhplEOp3Ofx4qoXRoIDXN12p0Cbn9ylYR33bSn7Itxtag1sR8u4PB40PKoWxH1A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726809043; c=relaxed/relaxed;
	bh=rRnqIQfUKl5hMqMziAAuyLYljr0XWCtIu8tELgZL7Kk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=E2ocj+wbwiVVeKX6clyYmruAlJDOvQV4BdoedL3bli+PDLDsgNblRWrYs13auVfHrPwKPv/0fE1G453CUKq2Ix9Jw/jVIYDI9J0rOEIew6YyijG8rRfoorW4tD8IRZE4lCh/ib51/hDuK7VrS+9YqRN4Wy2IQZb4NO7845EcG9XeZLxFzhx47q42Lf+CTfuyhmYWnQlItvncNAs2uBceBWHqT3FuPSASyvAaXAY2Zl8R7pWaMG08RCHa3nQ6R+89EgoC85LqXLaxXuVNN2xDRrRxbD21Y5kNYXGnuMofIOX6ODlD/SJveaj9/X6Qaw+y7LqAOh93jb3fomdak7200w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=SMnj41MD; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=SMnj41MD;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X90pC47FTz2yGL
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Sep 2024 15:10:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1726809043;
	bh=rRnqIQfUKl5hMqMziAAuyLYljr0XWCtIu8tELgZL7Kk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=SMnj41MDT0Lf3PfeIXIT3YwHOI0uAuuDLjE0t47tRZRaNTFGPp7CmsiqP5xtDHrve
	 GQpxRf3WsppyZZ4VsMpffig95QUjZAZcDTfAYoQRqb1kT/tFerPynOIHTZHPuzrIZ0
	 6IUod3m4WM+YcquTxyACp+qQoBmzjqHxZaUgk+jSzmb/iMutuZKenA1h2ctddPY4VB
	 zq+UuDefISa1ohGSToaZ++xjvfQUbK1tokALiwcAwa1KGWQEeHrE7fds5GO8aUidii
	 ZlBYq9K3KPr01kqIlLozoiNa0r5uQQx7O30KTZoarDO3+tCBmjhV32YlfcEEOMpICG
	 jWz/PZdm+HR7A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X90nx2nGtz4xD3;
	Fri, 20 Sep 2024 15:10:29 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Arnd Bergmann <arnd@arndb.de>, Richard
 Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky
 <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Vineet Gupta
 <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, Guo Ren
 <guoren@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui
 <kernel@xen0n.name>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge
 Deller <deller@gmx.de>, Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao
 <naveen@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, Gerald
 Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens
 <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
 <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Rich
 Felker <dalias@libc.org>, John Paul Adrian Glaubitz
 <glaubitz@physik.fu-berlin.de>, "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Muchun Song <muchun.song@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, Lorenzo
 Stoakes <lorenzo.stoakes@oracle.com>, Shuah Khan <shuah@kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Michal Hocko <mhocko@suse.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>, Chris Torek
 <chris.torek@gmail.com>, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-abi-devel@lists.sourceforge.net
Subject: Re: [PATCH RFC v3 1/2] mm: Add personality flag to limit address to
 47 bits
In-Reply-To: <ZuKIMz7U8rDrq8jA@ghost>
References: <20240905-patches-below_hint_mmap-v3-0-3cd5564efbbb@rivosinc.com>
 <20240905-patches-below_hint_mmap-v3-1-3cd5564efbbb@rivosinc.com>
 <87zfol468z.fsf@mail.lhotse> <Zt9HboH/PmPlRPmH@ghost>
 <1aca8e4c-1c12-4624-a689-147ff60b75d6@csgroup.eu>
 <CAMuHMdURgy6NPthHhfOv_h=C_gw2hEpnGQ7iBGoDE=ZazUPRHA@mail.gmail.com>
 <8734m6s428.fsf@mail.lhotse> <ZuKIMz7U8rDrq8jA@ghost>
Date: Fri, 20 Sep 2024 15:10:28 +1000
Message-ID: <87y13mnc57.fsf@mail.lhotse>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Charlie Jenkins <charlie@rivosinc.com> writes:
> On Wed, Sep 11, 2024 at 11:38:55PM +1000, Michael Ellerman wrote:
>> Geert Uytterhoeven <geert@linux-m68k.org> writes:
>> > Hi Christophe,
>> >
>> > On Tue, Sep 10, 2024 at 11:21=E2=80=AFAM Christophe Leroy
>> > <christophe.leroy@csgroup.eu> wrote:
>> >> >>> diff --git a/include/uapi/linux/personality.h b/include/uapi/linu=
x/personality.h
>> >> >>> index 49796b7756af..cd3b8c154d9b 100644
>> >> >>> --- a/include/uapi/linux/personality.h
>> >> >>> +++ b/include/uapi/linux/personality.h
>> >> >>> @@ -22,6 +22,7 @@ enum {
>> >> >>>     WHOLE_SECONDS =3D         0x2000000,
>> >> >>>     STICKY_TIMEOUTS =3D       0x4000000,
>> >> >>>     ADDR_LIMIT_3GB =3D        0x8000000,
>> >> >>> +   ADDR_LIMIT_47BIT =3D      0x10000000,
>> >> >>>   };
>> >> >>
>> >> >> I wonder if ADDR_LIMIT_128T would be clearer?
>> >> >>
>> >> >
>> >> > I don't follow, what does 128T represent?
>> >>
>> >> 128T is 128 Terabytes, that's the maximum size achievable with a 47BIT
>> >> address, that naming would be more consistant with the ADDR_LIMIT_3GB
>> >> just above that means a 3 Gigabytes limit.
>> >
>> > Hence ADDR_LIMIT_128TB?
>>=20
>> Yes it should be 128TB. Typo by me.
>
> 47BIT was selected because the usecase for this flag is for applications
> that want to store data in the upper bits of a virtual address space. In
> this case, how large the virtual address space is irrelevant, and only
> the number of bits that are being used, and hence the number of bits
> that are free.

Yeah I understand that's how you came to the problem.

But for the user API I think using the size of the address space is
clearer, easier to explain, and matches the existing ADDR_LIMIT_3GB.

cheers

