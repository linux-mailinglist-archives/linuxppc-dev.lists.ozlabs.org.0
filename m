Return-Path: <linuxppc-dev+bounces-6162-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 12424A353F9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2025 03:00:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YvFd94H5mz30Qb;
	Fri, 14 Feb 2025 13:00:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.187
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739498445;
	cv=none; b=clt0dINxh7T0A7Z73YJqgpvGHjJVb0mYv/4rbldhx4EEwhCuUGezs9+erEtwFHvPuCGdzoNinF9AjVjDEBYJNjAvQqMfmHgVBiiprcXCLGfpmBtUie9Wub8hO5TFsMPcsw+cAoJ0SRrAMATIF/A49dR1UruETEgkfRqZChIld3odbC/R/Z8TgfQkT5CYS9TadP8cBsRWY/j7IpOym+OS9OaVJsjd3TAyb9BoOIZ0s2JZ6Dg9sBkM+3srlbaOanexJK4JKbkpqJO8/F7nIxh/j+zY5pFIjNFb3s8UpNxyX6REqrJjeA2nm1bmgLCUwmfwjb5iI5AJcbHiv47+KDswKw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739498445; c=relaxed/relaxed;
	bh=s6gybk0sDxsKPqVranOYHJNAYoMVjrehj07uCNXs5vM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KMymKCyPrNP4zXpB176LIp6DLBAypFYsmy+JtFfg/2KPnzTtVV/goWpZ16/MkweZ5GySuKFiP4bwI547tUIBr8MCE//c64rr2F1darikHavb+iMg38v4HgQxEYAIQsT1l4iT/U5TSOw/Kdz9/CWeZRm+NllInPc0BtJWK5zzIfKQnsjWaE2ikT6b8AsyHdOHVNDdIYzi3ZNwwf04LfXQGIkcDNzxk/eV47HX4Tv0+tGjt9/HZALf+clWqJyCF7giJMcaAcm2s1V/2rBtAloTxlhTIVNXLbfdGa0ChUvFN/2zI4k6xLP97YFD84x9+T9PYpkLFr02PxVTf86lxzlHwg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=tongtiangen@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=tongtiangen@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YvFd66MYQz2xjL
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2025 13:00:40 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4YvF8m1vkrz11PdJ;
	Fri, 14 Feb 2025 09:39:36 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 9BD7F1800EA;
	Fri, 14 Feb 2025 09:44:05 +0800 (CST)
Received: from [10.174.179.234] (10.174.179.234) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 14 Feb 2025 09:44:03 +0800
Message-ID: <df40840d-e860-397d-60bd-02f4b2d0b433@huawei.com>
Date: Fri, 14 Feb 2025 09:44:02 +0800
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
Subject: Re: [PATCH v13 2/5] arm64: add support for ARCH_HAS_COPY_MC
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
 <20241209024257.3618492-3-tongtiangen@huawei.com> <Z6zKfvxKnRlyNzkX@arm.com>
From: Tong Tiangen <tongtiangen@huawei.com>
In-Reply-To: <Z6zKfvxKnRlyNzkX@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.234]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-Spam-Status: No, score=-3.6 required=5.0 tests=NICE_REPLY_A,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



在 2025/2/13 0:21, Catalin Marinas 写道:
> (catching up with old threads)
> 
> On Mon, Dec 09, 2024 at 10:42:54AM +0800, Tong Tiangen wrote:
>> For the arm64 kernel, when it processes hardware memory errors for
>> synchronize notifications(do_sea()), if the errors is consumed within the
>> kernel, the current processing is panic. However, it is not optimal.
>>
>> Take copy_from/to_user for example, If ld* triggers a memory error, even in
>> kernel mode, only the associated process is affected. Killing the user
>> process and isolating the corrupt page is a better choice.
> 
> I agree that killing the user process and isolating the page is a better
> choice but I don't see how the latter happens after this patch. Which
> page would be isolated?

The SEA is triggered when the page with hardware error is read. After
that, the page is isolated in memory_failure() (mf). The processing of
mf is mentioned in the comments of do_sea().

/*
  * APEI claimed this as a firmware-first notification.
  * Some processing deferred to task_work before ret_to_user().
  */

Some processing include mf.

> 
>> Add new fixup type EX_TYPE_KACCESS_ERR_ZERO_MEM_ERR to identify insn
>> that can recover from memory errors triggered by access to kernel memory,
>> and this fixup type is used in __arch_copy_to_user(), This make the regular
>> copy_to_user() will handle kernel memory errors.
> 
> Is the assumption that the error on accessing kernel memory is
> transient? There's no way to isolate the kernel page and also no point
> in isolating the destination page either.

Yes, it's transient, the kernel page in mf can't be isolated, the
transient access (ld) of this kernel page is currently expected to kill
the user-mode process to avoid error spread.


The SEA processes synchronization errors. Only hardware errors on the
source page can be detected (Through synchronous ld insn) and processed.
The destination page cannot be processed.

> 

