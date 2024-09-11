Return-Path: <linuxppc-dev+bounces-1252-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45EC7975424
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2024 15:38:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X3hVm1jJyz2xjh;
	Wed, 11 Sep 2024 23:38:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726061936;
	cv=none; b=jvYnefslMy8DRwzBhsPAyJqH+Z0ErW9r0P3TEMOvbu3f15wJ3sc0z7xN+TBu/6HFYaNcgdDT6uIuEbBWUrFUgl47AbhoKtXsGPU9HcHHACjgDrPN3kldPYiD7OpeQW+h0fAhfOHMAS/i7bAhgRJ39kZV2gEnm8Zn5hUhvNtXL6EJEZ35sUmbh3GpRG7/WeVU0+AU0/Q4NTqvcv4XA8C5lT3aeVfvN9jeyhwOeneNDr55zcxKrTC70+aqsXkOJDxS6SCGjfldSk8dd9eHnRcRRHxy0y0gsxPDiQWamvD8cqNiHWWzkBTMBtJTCVVEBb6lwzH7n6BOozmes7Ghsxw1VA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726061936; c=relaxed/relaxed;
	bh=/x6ppqNQQLzdvBUIltgwblDbEd/NsLYvkwyhRq8ySOg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kUA2fFHGdF6hclOnj9akt5TCgyZ9AL3T2W1/fAcVzizqDbGhzgrWR9AxCiVt+3q50VhbdrJ8giHJmlF8MOPGkBXX5wCsBL110jisUHOH5rgPghodsenIJ7X/3cT/oxJ8E1ww1J0bVfsO8ohTd6DlXwm93yjsQl7GV2p7C2FfHOUNvTxj3H2GVHLjAsGWtv6bLQiwsyrk6730TPuvdWCfp5bnMVRQvrGefbXijO+hBW86KC+Q07r2O3xVwTnFFL23a82FS9irnPmDdVUTMcHhgLMJZVgGEaTHIxtTSMUP6Y8zMlOKLVaDPGDfqsQe3H6HzxDVhBUJRw0vfSi2EegCvA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=oIPjnjA3; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=oIPjnjA3;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X3hVm1Ysgz2xcs
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2024 23:38:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1726061936;
	bh=/x6ppqNQQLzdvBUIltgwblDbEd/NsLYvkwyhRq8ySOg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=oIPjnjA38dDfnNUU0Rs/abozRGK9t9kzNcCWqs5zkrEw2u4QwGt3vFSpn0kotBm8X
	 fivnKpkEy/q9VIrQ4TVvIWeyCWERZBfrVvamUQzRqxJXXE/ps5sAChCuugQudut2zk
	 DVgLI54TE1CBwlW9mpADteXyPpiwyWh5AMK6K8+zAbXoPZkgJcSleQSG3qGcaJyJXX
	 A5ciDIpzEWsP5XUlIHYqj38DukHhKGL3HyneCvdybHcxtCNddxIqe5i6i2FP5wwBY7
	 57TlSw4u4a4SBXs0AeeOR/Okf9JAYihkTJfD71w2XroNa0syJ2Nx+YmIr7sD2bhmLV
	 DphJhs7LqH5rg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X3hVm0rPLz4x8Q;
	Wed, 11 Sep 2024 23:38:55 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>
Cc: Charlie Jenkins <charlie@rivosinc.com>, Arnd Bergmann <arnd@arndb.de>,
 Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky
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
In-Reply-To: <CAMuHMdURgy6NPthHhfOv_h=C_gw2hEpnGQ7iBGoDE=ZazUPRHA@mail.gmail.com>
References: <20240905-patches-below_hint_mmap-v3-0-3cd5564efbbb@rivosinc.com>
 <20240905-patches-below_hint_mmap-v3-1-3cd5564efbbb@rivosinc.com>
 <87zfol468z.fsf@mail.lhotse> <Zt9HboH/PmPlRPmH@ghost>
 <1aca8e4c-1c12-4624-a689-147ff60b75d6@csgroup.eu>
 <CAMuHMdURgy6NPthHhfOv_h=C_gw2hEpnGQ7iBGoDE=ZazUPRHA@mail.gmail.com>
Date: Wed, 11 Sep 2024 23:38:55 +1000
Message-ID: <8734m6s428.fsf@mail.lhotse>
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

Geert Uytterhoeven <geert@linux-m68k.org> writes:
> Hi Christophe,
>
> On Tue, Sep 10, 2024 at 11:21=E2=80=AFAM Christophe Leroy
> <christophe.leroy@csgroup.eu> wrote:
>> >>> diff --git a/include/uapi/linux/personality.h b/include/uapi/linux/p=
ersonality.h
>> >>> index 49796b7756af..cd3b8c154d9b 100644
>> >>> --- a/include/uapi/linux/personality.h
>> >>> +++ b/include/uapi/linux/personality.h
>> >>> @@ -22,6 +22,7 @@ enum {
>> >>>     WHOLE_SECONDS =3D         0x2000000,
>> >>>     STICKY_TIMEOUTS =3D       0x4000000,
>> >>>     ADDR_LIMIT_3GB =3D        0x8000000,
>> >>> +   ADDR_LIMIT_47BIT =3D      0x10000000,
>> >>>   };
>> >>
>> >> I wonder if ADDR_LIMIT_128T would be clearer?
>> >>
>> >
>> > I don't follow, what does 128T represent?
>>
>> 128T is 128 Terabytes, that's the maximum size achievable with a 47BIT
>> address, that naming would be more consistant with the ADDR_LIMIT_3GB
>> just above that means a 3 Gigabytes limit.
>
> Hence ADDR_LIMIT_128TB?

Yes it should be 128TB. Typo by me.

cheers

