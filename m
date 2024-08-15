Return-Path: <linuxppc-dev+bounces-100-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E536952A51
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2024 10:14:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=l//yx7di;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WkyZc0VFbz2yYY;
	Thu, 15 Aug 2024 18:14:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=l//yx7di;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=seakeel@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WkwK12gFVz2xnc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2024 16:32:19 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1fd9e70b592so6142825ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2024 23:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723703535; x=1724308335; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nt+p09uz8tAqwLeLii8cPw/zrSYX75ywbDJiGCl6kRA=;
        b=l//yx7di8JP+boTvzxAnftjt1VJf7pjg9pO5iWWrBSF/H6T5b9ByFWtoDDQ+2SG9Yj
         yuy6y/w9NDjSC9LlU1SUcaatCCBtGTRL3znDsSn7v9NNapNtcpTWPyQQ7bYKdBFhDOP+
         svSc/MJN9TQY66kFPX7CrFJ+vHFpdJP48EbCIehrSmSeSjtKJBS/XLgnJZfeiZflFggA
         cC9xRGJI5SCLq/5r963euOih9OKHVDgm66lSzMciRqk7Dk8rnYBSzT07VkEn3aFcD+eR
         Eyl4BgVkggWxTrVRulMXqOi9O3n+omBiAZqOG727niWKZ7a/Nfx10kycIMj0Q/q+ketG
         ksOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723703535; x=1724308335;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nt+p09uz8tAqwLeLii8cPw/zrSYX75ywbDJiGCl6kRA=;
        b=T14iWq78otbp/pCkz5soINZuIfp05T7Pl3oYoUPUPhwKdZG64LH+ZH6MqmO4iO20VP
         LXx+NPVm6l7tZGEA6qSBUc63ShT5qgxyXbogT1S+zhIP6F3ARe79xOlXgfWItoqnhs9A
         9FmyscRqy5WKw0gKDM2cyC+ypB+XNGrDFYnmp2l6wGXFhcNfaGfwK6juG0i+LLaNBBxW
         fwx35voZ5bNZlOkBM0oqIsBza7GZcLsPdfrbBhwUVPvL9SgLnWxKZjNfus42g7897qrZ
         CGB/4L1+ilaAUtLQ3Ufi/N8mnESFha1YScuOgWcC/djNFiOL6r85dMFMPgS5gy6Mk7eK
         BpbA==
X-Forwarded-Encrypted: i=1; AJvYcCVUPf6DCizpn3LFoXWbPkOfF8JlUZOYhfr3VtkJPdxPiGjIsVs6gEf0VAGVH81VKa4f4Y+OrRbPT2uamXoYPCK+P9fKA6kmxjUz+B+4mw==
X-Gm-Message-State: AOJu0YxnDwbzkxdUGddZ7ZUZu4YMWRLYrkzex70RUZdp4vXX/yBAbanc
	VNnAqJClBNzjw8NI/HAyDTSIVHq17+8OU8VxMNQL1JzV3b62XAih
X-Google-Smtp-Source: AGHT+IGHQF6v1wj4OnSDtmW1i+o0W3hXKMZnU/CMxWJVexuFM/VLhfFkwN0de8G4/UHXSn+MbeyB0Q==
X-Received: by 2002:a17:903:11c4:b0:1fb:cf82:11b4 with SMTP id d9443c01a7336-201d63bc296mr66187655ad.6.1723703534763;
        Wed, 14 Aug 2024 23:32:14 -0700 (PDT)
Received: from [192.168.255.10] ([43.132.141.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201f039ef06sm5216095ad.249.2024.08.14.23.32.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Aug 2024 23:32:14 -0700 (PDT)
Message-ID: <3351b0db-4764-48a4-8bab-478ba7bfa4f4@gmail.com>
Date: Thu, 15 Aug 2024 14:32:01 +0800
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
Subject: Re: [RFC PATCH 00/18] use struct ptdesc to replace pgtable_t
To: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>,
 "alexs@kernel.org" <alexs@kernel.org>, Will Deacon <will@kernel.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Nick Piggin <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Brian Cain <bcain@quicinc.com>,
 WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Naveen N Rao <naveen@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "x86@kernel.org" <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>,
 Andy Lutomirski <luto@kernel.org>, Bibo Mao <maobibo@loongson.cn>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>,
 "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
 "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
 "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>,
 Vishal Moola <vishal.moola@gmail.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Kemeng Shi <shikemeng@huaweicloud.com>, Lance Yang <ioworker0@gmail.com>,
 Peter Xu <peterx@redhat.com>, Barry Song <baohua@kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>
Cc: Guo Ren <guoren@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Mike Rapoport <rppt@kernel.org>, Oscar Salvador <osalvador@suse.de>,
 Alexandre Ghiti <alexghiti@rivosinc.com>, Jisheng Zhang
 <jszhang@kernel.org>, Samuel Holland <samuel.holland@sifive.com>,
 Anup Patel <anup@brainfault.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Breno Leitao <leitao@debian.org>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Hugh Dickins <hughd@google.com>, David Hildenbrand <david@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Matthew Wilcox <willy@infradead.org>
References: <20240730064712.3714387-1-alexs@kernel.org>
 <392b267e-cf98-4aa0-bb6e-90f6861d097d@cs-soprasteria.com>
Content-Language: en-US
From: Alex Shi <seakeel@gmail.com>
In-Reply-To: <392b267e-cf98-4aa0-bb6e-90f6861d097d@cs-soprasteria.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 8/15/24 12:50 AM, LEROY Christophe wrote:
> Hi,
> 
> Le 30/07/2024 à 08:46, alexs@kernel.org a écrit :
>> From: Alex Shi <alexs@kernel.org>
>>
>> We have struct ptdesc for page table descriptor a year ago, but it
>> has no much usages in kernel, while pgtable_t is used widely.
>>
>> The pgtable_t is typedefed as 'pte_t *' in sparc, s390, powerpc and m68k
>> except SUN3, others archs are all same as 'struct page *'.
>>
>> These blocks the conception and code update for page table descriptor to
>> struct ptdesc.
>>
>> So, the simple idea to push the ptdesc conception forward is to update
>> all pgtable_t by ptdesc or pte_t pointer. But this needs widely
>> knowledges for most all of different archs. Common code change is easy
>> for include/ and mm/ directory, but it's hard in all archs.
>>
>> Thanks for intel LKP framework, I fixed most all of build issues except
>> a bug on powerpc which reports a "struct ptdesc *" incompatible with
>> struct ptdesc *' pointer issue...
> 
> Can you tell more about that problem on powerpc ? Which defconfig for 
> instance ?
> 

Hi Leroy,

Thanks a lot for response. The detailed error and code tree is from LKP:

On 8/3/24 11:26 AM, kernel test robot wrote:
> tree:   https://github.com/alexshi/linux.git ptdesc
> head:   3735e634f8feb67c941d17222b53906ace2fd2b8
> commit: 8ac2ea5f299444d065b292043aed0a1e94996159 [14/17] mm/pgtable: use ptdesc in pgtable_trans_huge_deposit
> config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20240803/202408031130.UnwgnuLS-lkp@intel.com/config)
> compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 423aec6573df4424f90555468128e17073ddc69e)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240803/202408031130.UnwgnuLS-lkp@intel.com/reproduce)

>    In file included from arch/powerpc/include/asm/book3s/64/mmu-hash.h:20:
>>> arch/powerpc/include/asm/book3s/64/pgtable.h:1372:52: error: incompatible pointer types passing 'struct ptdesc *' to parameter of type 'struct ptdesc *' [-Werror,-Wincompatible-pointer-types]

>>
>> Another trouble is pmd_pgtable() conversion in the last patch.
>> Maybe some of arch need define theirself own pmd_ptdesc()?
>>
>> This patchset is immature, even except above 2 issues, I just tested
>> virutal machine booting and kselftest mm on x86 and arm64.
>>
>> Anyway any input are appreciated!
> 
> Can you tell on which tree you based this series ? Last patch doesn't 
> apply on 6.11-rc1:

The code based on akpm/mm-unstable tree, not upstream, you can check the code on:
https://github.com/alexshi/linux.git ptdesc

Thanks a lot!
Alex

