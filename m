Return-Path: <linuxppc-dev+bounces-6165-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A587FA3551A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2025 03:57:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YvGtm1Mwxz30T1;
	Fri, 14 Feb 2025 13:57:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.190
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739501856;
	cv=none; b=lnDW/4BLhiarrwpNRDSz9WNnaH3wyLZr8WmDD2BLnr/cU2XFNO5/+DUzx80s0hbupiFygN6yrxwL526+lWl9M8L1ynH/+WyF2vd+dD261mGqhz3h3hdTPFmN0+AFovEYVwsVJ8DX8vgDurbwR/OpSvfrkM1Y2gTOPATdNX8CF39ZXmRT1GB/5ZwZitV2rxVNQgOzirSLbR9fSFiTRebpYtxuYQPnqUfxILyFKuH1pnf7Ie5LNqDCBGw0iaH/DA4OjYlWAFz8pAIJTClBNpGyKzsQhh3qux+lIH89DPF1VbTNclhFt5RNobGwwmPIKsTIJusOdu2DeGVxiKjQWlDm1A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739501856; c=relaxed/relaxed;
	bh=dAco+YwYPEGkt4T/RB6q+1KKzbs6hySE2tC8jKn0Axo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=e58u2YJsQM9Nk0M6QCUzN2bZ/39P5CWUdh85FslTPtQKlnj5IA3GsNS/SGFN38+Cc+elXrMELAb5KVbI2L0kM+6UEmbINSEfkUMJJBUB2/Lh2ymorrPxEr/DVEesbzmWTU31yNTN+aWKgdYU0sh+59qG10PLHqunXXv2ndDgdZFkmVGkd7QHYLq4vZHeznu/fcNzjn43ihIz635L+LGw9Jh2ABkS1VDWLUq4Qc1sVc/pUwmpeLWr0CwfYszXxuG2g/tdQlnEo+y7wWIFZ2AvylpyuTnIDN7oKJSpooQn8tqWCS/mE68feSSpS4NSXWr6kooKdGYKwI9Ycz1VP2MGfQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.190; helo=szxga04-in.huawei.com; envelope-from=tongtiangen@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.190; helo=szxga04-in.huawei.com; envelope-from=tongtiangen@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YvGtk3L6kz30T0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2025 13:57:34 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4YvGpC5pGcz2FdSY;
	Fri, 14 Feb 2025 10:53:39 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id CA35F180044;
	Fri, 14 Feb 2025 10:57:27 +0800 (CST)
Received: from [10.174.179.234] (10.174.179.234) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 14 Feb 2025 10:57:25 +0800
Message-ID: <ed9cfe20-98a6-64de-66cf-43b536035ae3@huawei.com>
Date: Fri, 14 Feb 2025 10:57:24 +0800
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
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v13 5/5] arm64: introduce copy_mc_to_kernel()
 implementation
To: Catalin Marinas <catalin.marinas@arm.com>
CC: Mark Rutland <mark.rutland@arm.com>, Jonathan Cameron
	<Jonathan.Cameron@huawei.com>, Mauro Carvalho Chehab
	<mchehab+huawei@kernel.org>, Will Deacon <will@kernel.org>, Andrew Morton
	<akpm@linux-foundation.org>, James Morse <james.morse@arm.com>, Robin Murphy
	<robin.murphy@arm.com>, Andrey Konovalov <andreyknvl@gmail.com>, Dmitry
 Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko
	<glider@google.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Aneesh
 Kumar K.V <aneesh.kumar@kernel.org>, "Naveen N. Rao"
	<naveen.n.rao@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, "H. Peter Anvin"
	<hpa@zytor.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mm@kvack.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<kasan-dev@googlegroups.com>, <wangkefeng.wang@huawei.com>, Guohanjun
	<guohanjun@huawei.com>
References: <20241209024257.3618492-1-tongtiangen@huawei.com>
 <20241209024257.3618492-6-tongtiangen@huawei.com> <Z6zX3Ro60sMH7C13@arm.com>
From: Tong Tiangen <tongtiangen@huawei.com>
In-Reply-To: <Z6zX3Ro60sMH7C13@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.234]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-Spam-Status: No, score=-3.6 required=5.0 tests=NICE_REPLY_A,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



在 2025/2/13 1:18, Catalin Marinas 写道:
> On Mon, Dec 09, 2024 at 10:42:57AM +0800, Tong Tiangen wrote:
>> The copy_mc_to_kernel() helper is memory copy implementation that handles
>> source exceptions. It can be used in memory copy scenarios that tolerate
>> hardware memory errors(e.g: pmem_read/dax_copy_to_iter).
>>
>> Currently, only x86 and ppc support this helper, Add this for ARM64 as
>> well, if ARCH_HAS_COPY_MC is defined, by implementing copy_mc_to_kernel()
>> and memcpy_mc() functions.
>>
>> Because there is no caller-saved GPR is available for saving "bytes not
>> copied" in memcpy(), the memcpy_mc() is referenced to the implementation
>> of copy_from_user(). In addition, the fixup of MOPS insn is not considered
>> at present.
> 
> Same question as on the previous patch, can we not avoid the memcpy()
> duplication if the only difference is entries in the exception table?
> IIUC in patch 2 fixup_exception() even ignores the new type. The error
> must come on the do_sea() path.

As I said in commit message, it is not normalized with the memcpy()
because of the lack of GPR. If there is no GPR shortage problem, we can
extract the common code of memcpy_mc() and memcpy()，The unextracted
code is using different exception table entries.

Thanks,
Tong.

> 

