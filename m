Return-Path: <linuxppc-dev+bounces-1622-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D7856987007
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Sep 2024 11:25:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XDp9Q5ZQJz2ydW;
	Thu, 26 Sep 2024 19:25:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.227.15.19
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727342730;
	cv=none; b=T2fcdSyvc0gfiv6hbPqMBad2WEE/d+Q3fuYCGtwS5gezMfX9uxCDvD/MooojpLmfDTrIFkBvBZFNEgTUV2yCN4VpIbE+dC+wqpsbZQPFLhlO6uBUKOotr8Z9okvyZMS9xTUxFejZPJkmpMgv/5VtN2tK7B/5+YDejZIDbx9Q/8jzWyQbbdWdP0Ij16RzlaiXR08s+sc1PulkSp4PI8noGVJiAhbUQ23n/jT6HABW1sk8kYk2T63LxAY/8TMe9eU0JxhSYHv/y3p6a0bY1vF6fL2oxmmN7AwbxJLLwTrMWikjtZTokTnLeq4Tm2zOnl4soFoNMqwexjNzlLE2yslopQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727342730; c=relaxed/relaxed;
	bh=hp1g5yHqQ+Hi3UUQ0ip+nhr2opua2JZiyoX1o8S6xJ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hzstFEP7jPzoVdhLETSHQUOnEXberwUZrwPrVGs8USKLfXnakeJorf6lkPqEFmmTD0+KnY66UlPBu3lm6E4f3bSAUKcvN9JSdVn8hGAJU95ylDWksFIYPnd43hwl1963nyyy3UP9WAu0QONeSIrrV3nNI2LEwnRdj0UWNPjRD6yWnwrbMteoft8HgE8TvsHQ/w6slvnRFQyIZI4vgPgSBBtqlHu8CESStkt7atNS5c2Q4RXw0ZtVL8utravm0W+AxqwsNY9UY8/iK+OC9FAhF6PTolmmdL6J4unihIN4foc2+0U8rjh1E1oENBGCQBkUqJtGTBpfiA4irUWzM9Mfxw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=MYlGzCyT; dkim-atps=neutral; spf=pass (client-ip=212.227.15.19; helo=mout.gmx.net; envelope-from=deller@gmx.de; receiver=lists.ozlabs.org) smtp.mailfrom=gmx.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=MYlGzCyT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.de (client-ip=212.227.15.19; helo=mout.gmx.net; envelope-from=deller@gmx.de; receiver=lists.ozlabs.org)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XDp9P6HrRz2yVX
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Sep 2024 19:25:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1727342720; x=1727947520; i=deller@gmx.de;
	bh=hp1g5yHqQ+Hi3UUQ0ip+nhr2opua2JZiyoX1o8S6xJ0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=MYlGzCyTZCDAiooJbk8qRl/UAMLhd+i7u0s8XIdPPVQLsXSJSFaWQOIRDjXmT1kz
	 vxCX0RneoTnx/OqzvRxbRV9tEKvwVJO5JC6q+omkZU11vDmA62IuGS1T+gGteVR5c
	 ukv+jsf7+TO0ZUkb/sf5sbEgJO+hiUYpVItrLOLV+XfLFwacda9Xbn6UVoLRtJzJr
	 cxDwrDLKG+vcPJ27lyV5DCAEWIp71wIGgu73AWjvor7ppLc5NFZ2KmVCjQLUb6bFY
	 dZkMBEGTOjLkrnZegADxvfc3po/WnxOOnbRQzN9/w1XJ+hrw6EejKihpcJbYV6Vpp
	 qNTC/JwhCOZ+HK6bdg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.8.0.6] ([78.94.87.245]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MC30Z-1slkQh2YiD-00HUUz; Thu, 26
 Sep 2024 11:18:18 +0200
Message-ID: <079aea54-a3ab-413e-aa4f-0dce06c8e142@gmx.de>
Date: Thu, 26 Sep 2024 11:18:11 +0200
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
Subject: Re: [PATCH 5/5] [RFC] mm: Remove MAP_UNINITIALIZED support
To: Arnd Bergmann <arnd@kernel.org>, linux-mm@kvack.org
Cc: Arnd Bergmann <arnd@arndb.de>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>, Ard Biesheuvel <ardb@kernel.org>,
 Christian Brauner <brauner@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Damien Le Moal <dlemoal@kernel.org>, David Hildenbrand <david@redhat.com>,
 Greg Ungerer <gerg@linux-m68k.org>, Kees Cook <kees@kernel.org>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vladimir Murzin <vladimir.murzin@arm.com>, Vlastimil Babka <vbabka@suse.cz>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arch@vger.kernel.org
References: <20240925210615.2572360-1-arnd@kernel.org>
 <20240925210615.2572360-6-arnd@kernel.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20240925210615.2572360-6-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:WVTwXBYhl0Y58rXbk2q3f3SuYIyCmvd23/kLX/L1R30zbhrUvK3
 keZ1TMrPYYxhudRxaM5DQ0iL9Ukkq3q58BcipKt7WVJh5tJjPGX7DTcWDtNjY8BkEMwTYEu
 PqlrVuhBLqGxv5FuFkAXLE+CICuh2VJyknKdSOA2asvPCVC/GlaGfkTS9obPavrX6mLI2vw
 znB/EjUyJbiiUU/1jtCjw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:42DsJshkCyo=;+4TfNGWwYD2rEdwAComsXjgBEcO
 nc4/CFVfN7Bdsi1GHsIZQJiHwvv4D7HE+76s78832IIJxscWPrh/ef18M7dq1MrpaVxijUhLZ
 +DRBXQmBKMzik60W5dFy2y1HwTANde1L2iKfSoCN0TCHeagkiRAHcprhYEIE02BMXbhpiFNh2
 BLPojW5MJ9475OJRJ4rpqZhJ6O3ZKDd0JdyqXwUwgdD+UsjhymptpkqF38YZtExsw+eIrXkTU
 tk6tAp/0LKF1tvZsmq6+++C8fFtFY3GoSttWOUkwHMzqqZVbE2dsUCEnwH6ysmGzBBP3qqkd1
 iMpm9lZjiZWsi4UcX/I0xGVdhviZjaZbT5BaMDutGZQm/b3Ca4ldkyO9Na0HjTcCFpbsE3HHj
 9Va9kQ5gdkKGrm7ospJukrvEuCCBikFsXxWoS5OSQ1Jkm6SeDAv3HVcOCJXKO7BBP/Og6NpH7
 l05CxwWtfWcJ50VPudGqCGrzZATlDKm1zNvASEIsh52h9h2pgHO3reSQLpeM0ecRQ0IVDMvZH
 FHmseuaN4W7DPmqEdLgE5I0PxfiqLQ/y+e3vd0LOBt8AzZQLP73sNIrP4gmmiVHMl0nzKDZA4
 uSmRXk4a8/2NHk1Rv2hnbgTWgOj22ShvE7fib/lzNomBlKR0RaPlrQ6SxmPRb0DSOSWug3TZg
 VqRNp6pUcjY37aE8QBdjyuAKkciRp9tK9X0mtl+1syg+98SzZvNzY1cnW+6CicruOEPK8kYZU
 abtNXlWRjYaroX3bqzoNOBK8GlqtgUwHgUZd2k0GZRzZ83rkfzqwt/49gGq6rgUrVe4x4h0Pg
 ZzTec9oRvyJvpt0FQ75QfRXw==

On 9/25/24 23:06, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> MAP_UNINITIALIZED was added back in 2009 for NOMMU kernels, specifically
> for blackfin, which is long gone. MAP_HUGE_SHIFT/MAP_HUGE_MASK were
> added in 2012 for architectures supporting hugepages, which at the time
> did not overlap with the ones supporting NOMMU.
>
> Adding the macro under an #ifdef was obviously a mistake, which
> Christoph Hellwig tried to address by making it unconditionally defined
> to 0x4000000 as part of the series to support RISC-V NOMMU kernels. At
> this point linux/mman.h contained two conflicting definitions for bit 26=
,
> though the two are still mutually exclusive at runtime in all supported
> configurations.
>
> According to the commit 854e9ed09ded ("mm: support madvise(MADV_FREE)")
> description, it was previously used internally by facebook, which
> would have resulted in MAP_HUGE_1MB turning into MAP_HUGE_2MB
> with MAP_UNINITIALIZED enabled, and every other page size implying
> MAP_UNINITIALIZED. I assume there are no remaining out of tree users
> on MMU-enabled kernels today.
>
> I do not see any sensible way to redefine the macros for the ABI in
> a way avoids breaking something. The only ideas so far are:
>
>   - do nothing, try to document the bug, hope for the best
>
>   - remove the kernel implementation and redefine MAP_UNINITIALIZED to
>     zero in the header to silently turn it off for everyone. There are
>     few NOMMU users left, and the ones that do use NOMMU usually turn
>     off MMAP_ALLOW_UNINITIALIZED, as it still has the potential to cause
>     bugs and even security issues on systems with a memory protection
>     unit.
>
>   - remove both the implementation and the macro to force a build
>     failure for anyone trying to use the feature. This way we can
>     see who complains and whether we need to put it back in some
>     form or change the userspace sources to no longer pass the flag.
>
> Implement the third option here for the sake of discussion.

Usually I'd vote for option #2, which means remove the kernel implementati=
on and
redefine MAP_UNINITIALIZED to zero in the header.
A few years back this turned out to be the "most compatible" solution.

But today, and specifically regarding MAP_UNINITIALIZED, I think we should=
 get rid of it now.
This flag is useless and build issues will force people to drop it.

Helge

