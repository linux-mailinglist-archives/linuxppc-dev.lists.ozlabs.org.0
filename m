Return-Path: <linuxppc-dev+bounces-99-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0FF8952A50
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2024 10:13:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YdsFe3Ax;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WkyYs3P0Dz2yXY;
	Thu, 15 Aug 2024 18:13:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YdsFe3Ax;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::2b; helo=mail-oa1-x2b.google.com; envelope-from=seakeel@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com [IPv6:2001:4860:4864:20::2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wkw0V73HLz2xnc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2024 16:18:02 +1000 (AEST)
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-27010ae9815so60507fac.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2024 23:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723702679; x=1724307479; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SAHWmUt5jip0y+u22BsHFrHANReT/fLelSD2WuMjZ6U=;
        b=YdsFe3AxCAeygMyT+izXopyZDwQTE3zp0G5iCy+rER11h9CuYzxq9k2XWQJAX8OQcn
         DQKv4edrOwGYJ28e3m+K8j4Qxcsyj6F1SzsKDOH40d0/8TT7uuZYbZz6oW2wAajBtVh9
         UHqvMpyNk4B49pHn6HmScgsHdvZZOeHywOccbTO+reurXPz03mox5xai3zGSwKFsqsyI
         HeTaFlKNzk0ZHmm6EN3J5zhW2V1EXF5k4A2Ue2/EXgN9wTN4A/7LJwqEDg7Wb7FC3rZt
         2nF5AjtbRw8+OVcypUcMdSktjQKUODDs+UY934NQrPP0Kt5HNOBceLWLD3Cr6+wR4B8W
         dFjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723702679; x=1724307479;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SAHWmUt5jip0y+u22BsHFrHANReT/fLelSD2WuMjZ6U=;
        b=GU8K+QEqrHU5aIg809Fep4/AE8R/zrYsC6sovWIZfl+E4sFMhmJy69L1Qx9R1irAUL
         pIzKhu8BTt9CxMwG4EEtcF5Fln7/GH77cXn9dKjkmYB79QOYMgLSRETaQSBEUoeNV0K/
         V78msUD1M0QzJtdKRhSvyk35DTCU9a7de1jPvlHOikLwcR/hOm0G80CwHG8M/NrB5EOK
         8705YTPiwOjE9RW8EHiZPjGcdj0McA1VPHLdSZmgrbHw7JmcHezhrf2se61KOFaReUY/
         BnRpaBz5Z9VS5x7wB9eT4D9U8To6Df1PL1KfkZBn3jBprYZNU0dT0nfoka+GviQyTGyH
         ahSA==
X-Forwarded-Encrypted: i=1; AJvYcCVO7zag3eMrzHBBSzNNoFBnRGFGeV6OJwwVpVU+IWzXS+r+ivqyrWch4uREKYfgNro1T3eAW4/76BU2udGZtOkUa81KFduyZtpZjyu1pQ==
X-Gm-Message-State: AOJu0YzSynFw1fCw2TCWRaxDixsRvIPm1gJFjJ1c5Yz4wyL2vCnIbU/t
	tYlRHvoQd1HHtLV9Tz1umZF60w1ZxubTE7dxIshpfwC5ZwjFGqkU
X-Google-Smtp-Source: AGHT+IGJpazxnkj0vrfs0qcLRP6qpL8RKPrwMyfkdNMVp4bX1EZv/Ik/vGgVpgkEp8G6HmJcF19Ukw==
X-Received: by 2002:a05:6870:8a12:b0:258:3455:4b02 with SMTP id 586e51a60fabf-26fe5ca588amr5544755fac.51.1723702678720;
        Wed, 14 Aug 2024 23:17:58 -0700 (PDT)
Received: from [192.168.255.10] ([43.132.141.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7127add6b3dsm479443b3a.8.2024.08.14.23.17.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Aug 2024 23:17:58 -0700 (PDT)
Message-ID: <02d7b8a2-b0d6-4713-b03e-5b22968387c3@gmail.com>
Date: Thu, 15 Aug 2024 14:17:45 +0800
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
To: Matthew Wilcox <willy@infradead.org>, alexs@kernel.org
Cc: Will Deacon <will@kernel.org>,
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
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Andy Lutomirski <luto@kernel.org>, Bibo Mao <maobibo@loongson.cn>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-openrisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>,
 Vishal Moola <vishal.moola@gmail.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Kemeng Shi <shikemeng@huaweicloud.com>, Lance Yang <ioworker0@gmail.com>,
 Peter Xu <peterx@redhat.com>, Barry Song <baohua@kernel.org>,
 linux-s390@vger.kernel.org, Guo Ren <guoren@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Mike Rapoport <rppt@kernel.org>,
 Oscar Salvador <osalvador@suse.de>, Alexandre Ghiti
 <alexghiti@rivosinc.com>, Jisheng Zhang <jszhang@kernel.org>,
 Samuel Holland <samuel.holland@sifive.com>, Anup Patel
 <anup@brainfault.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Breno Leitao <leitao@debian.org>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Hugh Dickins <hughd@google.com>, David Hildenbrand <david@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>
References: <20240730064712.3714387-1-alexs@kernel.org>
 <ZrzlnIWrnaUx66rY@casper.infradead.org>
Content-Language: en-US
From: Alex Shi <seakeel@gmail.com>
In-Reply-To: <ZrzlnIWrnaUx66rY@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/15/24 1:13 AM, Matthew Wilcox wrote:
> On Tue, Jul 30, 2024 at 02:46:54PM +0800, alexs@kernel.org wrote:
>> We have struct ptdesc for page table descriptor a year ago, but it
>> has no much usages in kernel, while pgtable_t is used widely.
> 
> Hum, I thought I responded to this to point out the problem, but
> I don't see the response anywhere, so I'll try again.
> 
>> The pgtable_t is typedefed as 'pte_t *' in sparc, s390, powerpc and m68k
>> except SUN3, others archs are all same as 'struct page *'.
> 
> And there's a very good reason for that.  On s390 and powerpc (I cannot
> speak to the sparc/m68k), each page table is (potentially) smaller
> than PAGE_SIZE.  So we cannot do what your patch purports to do, as
> we would not know whether we're referring to the first or subsequent
> page tables contained within a page.
>> Maybe at some point in the distant future we'll be able to allocate
> a ptdesc per page table instead of per page allocated for use by page
> tables.  But we cannot do that yet.


Got it. Thanks a lot for the info!

