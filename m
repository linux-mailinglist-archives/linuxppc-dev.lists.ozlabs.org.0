Return-Path: <linuxppc-dev+bounces-940-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EC696AA29
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2024 23:30:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WyzLw1ywCz2yNf;
	Wed,  4 Sep 2024 07:30:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.227.17.20
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725393558;
	cv=none; b=ltEhaz8DrFeLhWVqKCnlm8NffZIsx0uVX6YLoCNVb0Kn06nZmkeo5RuaEAyOTMwiMTeQcCtAxfR1ew50s7lOdAmSyup52fUAeyzazyot7HiQP4/La1mxAqx7FiqOpQXJcyDoao+YPk7eSilCpD3yhphS3ryMnffnCjlfLI0ODNNZQgulCFTvhRdvw5V+/e5zE8b0xr3D4bhoRfHTMliM8895I6gboWgPMY5cUPw1jh2cC80uFsRcOwceRfVq42ol3PYkChzaHCLXTu4HZBYXIl6ncEBnhEc97mqPY/sEwwuQz3NxWFpRvu1q4w1EJhl1e3Vg2B+NJhucNiAWt6kpTw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725393558; c=relaxed/relaxed;
	bh=uSMRWGhXiv8yW/HuN1qfAn2jc8joA1VHlXponTzNm2U=;
	h=DKIM-Signature:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type; b=Ht6/eYxU8N+4UbGhsS+V5ha+LPa1IOBL+Fqo8yxYpMGExUlIDj1/hlgHrmEkDvD1wkn0ljX/Pftih6ueFCUrp3jHxX6TnenknrbJQvxSdV8Nnator8KNh87mXAgKUepEUFTFpw3kvGozCpQbVV00j3bGaBrNuiDBOIDJl3x8xl/0RCRPrKiz8kxmK6DL8DSxeqA9UULplXSwDtJ36lwnExEG1HvOEQPnZMIFvQKgjGS33YCL/mRG6YZYo7u7GkRVdeGbVmiFyfOTnsohPQ1jPPW8it7PEuhL2M2rSj4aBsVqNew2qtS3oVmWY7/layliO6y9sW+vrrsjPlP10M6SaA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=WWc5jZwD; dkim-atps=neutral; spf=pass (client-ip=212.227.17.20; helo=mout.gmx.net; envelope-from=deller@gmx.de; receiver=lists.ozlabs.org) smtp.mailfrom=gmx.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=WWc5jZwD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.de (client-ip=212.227.17.20; helo=mout.gmx.net; envelope-from=deller@gmx.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 387 seconds by postgrey-1.37 at boromir; Wed, 04 Sep 2024 05:59:16 AEST
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WyxKJ19mnz2xZr
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2024 05:59:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1725393539; x=1725998339; i=deller@gmx.de;
	bh=uSMRWGhXiv8yW/HuN1qfAn2jc8joA1VHlXponTzNm2U=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=WWc5jZwDMxUZZiUDy1TbahzWEigns/alP31JotdrvDUFdltFQhFzZGJZNB9rLy19
	 t4ug26hAbEKQSkr74+iwc9KEEfBfQJDk+3SdDEFv9eENXvPWUmsNp3ORD65VAuJ2I
	 LxRoFnhV5gZpg2a0Bb43QpCFsQWeHFFt8l0xMSarpC0JOyBX1dH5BRA8QRtFWPTyI
	 iJJlAbyegLZZXirKZGFrSbd40nir4WueFtyHaOWmFLEQ0qnHrs5em4R4Pl8BRDMul
	 C9ui1y6Ug4d9mB3yIOOqMqts492S/UOqVwEth7ZPd10hpOd+bYApot6y1zFBm9BSK
	 /XzU0lHRjAHTp1cMPA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.79]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MTABT-1scwb30ouN-00IMx8; Tue, 03
 Sep 2024 21:50:54 +0200
Message-ID: <5dd4b6ab-62d3-4b6a-8de4-bdb1df7ebbe6@gmx.de>
Date: Tue, 3 Sep 2024 21:50:42 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] mm: Make arch_get_unmapped_area() take vm_flags by
 default
To: Mark Brown <broonie@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner
 <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Guo Ren <guoren@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
 Max Filippov <jcmvbkbc@gmail.com>, Andrew Morton
 <akpm@linux-foundation.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Deepak Gupta <debug@rivosinc.com>, linux-arm-kernel@lists.infradead.org,
 linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-csky@vger.kernel.org,
 loongarch@lists.linux.dev, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org
References: <20240902-mm-generic-shadow-stack-guard-v1-0-9acda38b3dd3@kernel.org>
 <20240902-mm-generic-shadow-stack-guard-v1-1-9acda38b3dd3@kernel.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20240902-mm-generic-shadow-stack-guard-v1-1-9acda38b3dd3@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:UosSD8lbAQ3xNgg4RaYC8o4mRKZmfEEhYZB4gXbYNOnflgwWEt6
 NgnuKo87mlBfO5/7GrkkFWKgK2gP16vuIc9vR37kK93c/Hyhxm1sI94ereqr0qEEGor37CT
 DIeKzfHO2lEofToGY0MUm+0fZ6RwhSinzQ2YlQ2q7PBcJtV99py1JOQU1i126fNx3i4f83X
 G5/kQZELEgxWwPIb3YD9w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:W49Iu5rGfFI=;lAPP6pizLuv7w3/WFolZ3LHOkJK
 uwhZL9NH6bLbH+vcpdg4jK4u+xKoRk1DiSaV5AWenjc1NS/vh741JoI+vHicVCe+uYgiOv+mU
 HLgJKnWHHq4E4Q2IrgxCSbnSNV5FSplxiX3aNyUMcq5DmjBkPZYgUyTjfktkyBJho8re4yE2l
 8ppan/5Dptwmr1hcZasDNKdS3zBCwyagiARvrlHFrOmwY433uRtwjgUWjWFTBUUM7Y5BPNrSh
 tn+RKqFEDdAcq2vzU2MvYz/ZhpyE5W1k3fX9XVYNjVxyv4tjqadUW1xrYwAXpRZQ206tzhF/k
 iHKZPbbuV1nckGe8KzSvYPG1SXqqj6976fT72b81kTc2N59wwcweS1hbYUhx5r33g3NO2iLHG
 y21EX+Or5eMWpBnY3DO7DaKgJ88RKy+p/o22ihN2oIeuaEl5d6MVGS7huwhy2lPcRI0zd9YbL
 VX67mIQENJB9bs/AtFkSdlMIWEkB5O2WpI7Nv9VtYH5rvOT9YFN4zDM0KhpXDOHVAEu5MG/cE
 /Xb0+MdDVvNMVq0fANX66+VaD0K5X81A48WfIBffjERSTjoiVnMeDlOFPprMZnjo7uM0AEvEE
 LmkYA7y/w4i58jz71wbGxDhWBYyJMd8ccIwaqnTtDu/R9jiVhwzAHvDJVQPfwhYQJI2XSQwQo
 v/58xcB6EyCxHbBpGHKr0/uZf+jNuh0J7r+6+FDO9YzB4Le4WqqE+UDWfKAg/XC07HZK2jiR5
 UihCrYfUW7bSke//kNibsoEDNQM0Z+P82fSxYglfxZvIgDdEC6EYOF5mrJXSRhqz0rM6X8RW3
 srXZixFxDKC7gUUvNoDfP6JQ==

On 9/2/24 21:08, Mark Brown wrote:
> When we introduced arch_get_unmapped_area_vmflags() in 961148704acd
> ("mm: introduce arch_get_unmapped_area_vmflags()") we did so as part of
> properly supporting guard pages for shadow stacks on x86_64, which uses
> a custom arch_get_unmapped_area(). Equivalent features are also present
> on both arm64 and RISC-V, both of which use the generic implementation
> of arch_get_unmapped_area() and will require equivalent modification
> there. Rather than continue to deal with having two versions of the
> functions let's bite the bullet and have all implementations of
> arch_get_unmapped_area() take vm_flags as a parameter.
>
> The new parameter is currently ignored by all implementations other than
> x86. The only caller that doesn't have a vm_flags available is
> mm_get_unmapped_area(), as for the x86 implementation and the wrapper us=
ed
> on other architectures this is modified to supply no flags.
>
> No functional changes.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>   arch/alpha/kernel/osf_sys.c       |  2 +-
>   arch/arc/mm/mmap.c                |  3 ++-
>   arch/arm/mm/mmap.c                |  7 ++++---
>   arch/csky/abiv1/mmap.c            |  3 ++-
>   arch/loongarch/mm/mmap.c          |  5 +++--
>   arch/mips/mm/mmap.c               |  2 +-
>   arch/parisc/kernel/sys_parisc.c   |  5 +++--
>   arch/parisc/mm/hugetlbpage.c      |  2 +-

Acked-by: Helge Deller <deller@gmx.de>  # parisc

Helge

