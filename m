Return-Path: <linuxppc-dev+bounces-744-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A53499643BE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2024 14:02:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WvfzC2pmYz2yvq;
	Thu, 29 Aug 2024 22:02:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724932935;
	cv=none; b=Nibcpdd4MSSK8cSX9XSlz3u7jb6F93xB65RO/yb6CLx75/3rUZLYOYIB8BvXUu9nSVka6tusLTpukZiwDzeQ7H972NXbQuh0tgblv3q/66gy3ug105CuokToWO/RKZJEA5hmjPJjh/krEYMIFcTFPntFQJzFdfZ97OyB+r12OC+2FpIe4dbWgfDblsf5W60RevFc5P24nhiPNYE0IFRmxFBA+H4rOazWCUlcWLWG9qvpM5jUBzmMQ37BrQIs5OE3/Tt3TyGcm0dgYY571evC6ShbQYNtHBvzjoHMwO9qhZRyMl0D+DjcEycE79UXqnNIVjZ1zuUiiAhBb3D0oIo08w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724932935; c=relaxed/relaxed;
	bh=GIlhtr/1fkp7KE7YGEtyGoM95pJVfoYx3HaQEXGD92U=;
	h=Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding; b=QFRIuo/qhlw6oNIvXLi16BFNjdKHVf1CSsTs7/vB4sgYxb76vD/CXm3wye8RX5BG9fkVS/7wG3+leOXyiP3Fr8iaYSNAJAfrbhmyZEkZfFoDZ7xsNzu7sp01Tcsb9EmpjA2ZOQGpHYf4NWXF94/VbCifr/6eDPhpxW7wA+a2vDrmtSsan2UpxG7nYjHtGlddEJi6us6IYAZ7KEebWRe5bhsx8wzOhOCqNaygV+/tyEjB2IlpkFwrDahjvjWzYi1czzgEakTbePc9TOCJcTjdliwuTudUqsOfwCmaCJVKDy+FqCvKuHErejHzsSezJhej5HBwXeNijSzGO0OReZjgXg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=vincenzo.frascino@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=vincenzo.frascino@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WvfzB4qTJz2ytT
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2024 22:02:12 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 822E2DA7;
	Thu, 29 Aug 2024 05:02:05 -0700 (PDT)
Received: from [10.1.196.72] (e119884-lin.cambridge.arm.com [10.1.196.72])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 604163F762;
	Thu, 29 Aug 2024 05:01:37 -0700 (PDT)
Message-ID: <bab7286c-e27e-450a-8bb6-e5b09063a033@arm.com>
Date: Thu, 29 Aug 2024 13:01:35 +0100
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
Subject: Re: [PATCH] random: vDSO: Redefine PAGE_SIZE and PAGE_MASK
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Arnd Bergmann <arnd@arndb.de>, "Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: Theodore Ts'o <tytso@mit.edu>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Linux-Arch <linux-arch@vger.kernel.org>
References: <b8f8fb6d1d10386c74f2d8826b737a74c60b76b2.1724743492.git.christophe.leroy@csgroup.eu>
 <defab86b7fb897c88a05a33b62ccf38467dda884.1724747058.git.christophe.leroy@csgroup.eu>
 <Zs2RCfMgfNu_2vos@zx2c4.com>
 <cb66b582-ba63-4a5a-9df8-b07288f1f66d@app.fastmail.com>
 <0f9255f1-5860-408c-8eaa-ccb4dd3747fa@csgroup.eu>
 <17437f43-9d1f-4263-888e-573a355cb0b5@arm.com>
 <272cb38a-c0e3-4e6e-89ce-b503c75c2c33@csgroup.eu>
Content-Language: en-US
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
In-Reply-To: <272cb38a-c0e3-4e6e-89ce-b503c75c2c33@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Christophe,

On 27/08/2024 18:14, Christophe Leroy wrote:
> 
> 
> Le 27/08/2024 à 18:05, Vincenzo Frascino a écrit :
>> Hi Christophe,
>>
>> On 27/08/2024 11:49, Christophe Leroy wrote:
>>
>> ...

...

>>
>> Could you please clarify where minmax is needed? I tried to build Jason's master
>> tree for x86, commenting the header and it seems building fine. I might be
>> missing something.
> 
> Without it:
> 
>   VDSO32C arch/powerpc/kernel/vdso/vgetrandom-32.o
> In file included from /home/chleroy/linux-powerpc/lib/vdso/getrandom.c:11,
>                  from <command-line>:
...

> 
> 
>>
>>> Same for ARRAY_SIZE(->reserved) by the way, easy to do opencode, we also have it
>>> only once
>>>
>>
>> I have a similar issue to figure out why linux/array_size.h and
>> uapi/linux/random.h are needed. It seems that I can build the object without
>> them. Could you please explain?
> 
> Without linux/array_size.h:
> 
>   VDSO32C arch/powerpc/kernel/vdso/vgetrandom-32.o
> In file included from <command-line>:
> /home/chleroy/linux-powerpc/lib/vdso/getrandom.c: In function
> '__cvdso_getrandom_data':
> /home/chleroy/linux-powerpc/lib/vdso/getrandom.c:89:40: error: implicit
If this is the case, those headers should be defined for the powerpc
implementation only. The generic implementation should be interpreted as the
minimum common denominator in between all the architectures for what concerns
the headers.

-- 
Regards,
Vincenzo

