Return-Path: <linuxppc-dev+bounces-7431-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A66A79A1F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Apr 2025 04:48:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZSmPr6RFLz2ypW;
	Thu,  3 Apr 2025 13:48:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.189
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743648496;
	cv=none; b=F104ufIyC4mB/yl2hOUIz4KyM+a9Qb6Vos6+lPHH/IfFYBRFRJ8fpCh6lP+y3jUtl7B8xnHBDNdkH6ch+DHstBjDMirF6ul9RgmIpbcbmfY6JYg5wEhUfe6MOkkGLJMupE2I6ddU9Z08KWrXSV3rig15WzkWcKLnyeD73KeGDrKpI+eurUK8j2+k7/eHRet8moqQg9yVowoEu7b+dF7LEXQ9KTObCLZ+Xij3OCxj/ZzpAJC89rnXTxmYYrZFcVGAgUL5vjAxKtZFt7mOcCEdvpwlRUcWEU7fGpCUbGn7N/8DUr+sFLhCeKxTSQ39q+ksXbDx9cyyE+EYWIasvFuHaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743648496; c=relaxed/relaxed;
	bh=If1ZsNgrBBDERc1MRA+MXXmaA+so/oBkFX2K0q6MNvI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QDSHiOFE80qgyyyAoYEmR3cxWy4AOGbhksBBFRABa+U7xnKl7h5ji9/QWi7n///v74bYk2/HKxHrA2CbQvNWvf6zbsc4L3TEFfgg3/Ck9jvWr72E7rNUnRF6LGLxyBpCVXwQMB5SUXvtCgCu5XroUeDokRrUiy8zb8HchM5XV7L87438zPaaW/cjmDYDdPTvQRpoFGAu+BjSexfPt6uKBZowTdSQEUAUQz+Kvst4Ei/AmgZJ798VTYmgO/2oSJScI6NtPuv2S0Eig0yImfKYKWlugkMHvwhtsoEVn5+7UuZMJVxtOM4JQ7SKx2qTzFcetksmdn9KhO+QR4fy8QoIXg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.189; helo=szxga03-in.huawei.com; envelope-from=tongtiangen@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.189; helo=szxga03-in.huawei.com; envelope-from=tongtiangen@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZSmPq2jWbz2ydy
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Apr 2025 13:48:13 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4ZSmKq0chQzHrDQ;
	Thu,  3 Apr 2025 10:44:47 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id B33E31800EB;
	Thu,  3 Apr 2025 10:48:07 +0800 (CST)
Received: from [10.174.179.234] (10.174.179.234) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 3 Apr 2025 10:48:05 +0800
Message-ID: <82bf1b64-d887-c50b-17b1-2de978896d44@huawei.com>
Date: Thu, 3 Apr 2025 10:48:04 +0800
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
To: "Luck, Tony" <tony.luck@intel.com>
CC: Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland
	<mark.rutland@arm.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Mauro
 Carvalho Chehab <mchehab+huawei@kernel.org>, Will Deacon <will@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, James Morse <james.morse@arm.com>,
	Robin Murphy <robin.murphy@arm.com>, Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino
	<vincenzo.frascino@arm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas
 Piggin <npiggin@gmail.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>, Christophe Leroy
	<christophe.leroy@csgroup.eu>, Aneesh Kumar K.V <aneesh.kumar@kernel.org>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Thomas Gleixner
	<tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, <x86@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mm@kvack.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<kasan-dev@googlegroups.com>, <wangkefeng.wang@huawei.com>, Guohanjun
	<guohanjun@huawei.com>
References: <20241209024257.3618492-1-tongtiangen@huawei.com>
 <20241209024257.3618492-3-tongtiangen@huawei.com> <Z6zKfvxKnRlyNzkX@arm.com>
 <df40840d-e860-397d-60bd-02f4b2d0b433@huawei.com>
 <Z-GOKgBNxKWQ21w4@agluck-desk3>
From: Tong Tiangen <tongtiangen@huawei.com>
In-Reply-To: <Z-GOKgBNxKWQ21w4@agluck-desk3>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.234]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-Spam-Status: No, score=-4.3 required=3.0 tests=NICE_REPLY_A,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



在 2025/3/25 0:54, Luck, Tony 写道:
> On Fri, Feb 14, 2025 at 09:44:02AM +0800, Tong Tiangen wrote:
>>
>>
>> 在 2025/2/13 0:21, Catalin Marinas 写道:
>>> (catching up with old threads)
>>>
>>> On Mon, Dec 09, 2024 at 10:42:54AM +0800, Tong Tiangen wrote:
>>>> For the arm64 kernel, when it processes hardware memory errors for
>>>> synchronize notifications(do_sea()), if the errors is consumed within the
>>>> kernel, the current processing is panic. However, it is not optimal.
>>>>
>>>> Take copy_from/to_user for example, If ld* triggers a memory error, even in
>>>> kernel mode, only the associated process is affected. Killing the user
>>>> process and isolating the corrupt page is a better choice.
>>>
>>> I agree that killing the user process and isolating the page is a better
>>> choice but I don't see how the latter happens after this patch. Which
>>> page would be isolated?
>>
>> The SEA is triggered when the page with hardware error is read. After
>> that, the page is isolated in memory_failure() (mf). The processing of
>> mf is mentioned in the comments of do_sea().
>>
>> /*
>>   * APEI claimed this as a firmware-first notification.
>>   * Some processing deferred to task_work before ret_to_user().
>>   */
>>
>> Some processing include mf.
>>
>>>
>>>> Add new fixup type EX_TYPE_KACCESS_ERR_ZERO_MEM_ERR to identify insn
>>>> that can recover from memory errors triggered by access to kernel memory,
>>>> and this fixup type is used in __arch_copy_to_user(), This make the regular
>>>> copy_to_user() will handle kernel memory errors.
>>>
>>> Is the assumption that the error on accessing kernel memory is
>>> transient? There's no way to isolate the kernel page and also no point
>>> in isolating the destination page either.
>>
>> Yes, it's transient, the kernel page in mf can't be isolated, the
>> transient access (ld) of this kernel page is currently expected to kill
>> the user-mode process to avoid error spread.
>>
>>
>> The SEA processes synchronization errors. Only hardware errors on the
>> source page can be detected (Through synchronous ld insn) and processed.
>> The destination page cannot be processed.
> 
> I've considered the copy_to_user() case as only partially fixable. There
> are lots of cases to consider:
> 
> 1) Many places where drivers copy to user in ioctl(2) calls.
>     Killing the application solves the immediate problem, but if
>     the problem with kernel memory is not transient, then you
>     may run into it again.
> 
> 2) Copy from Linux page cache to user for a read(2) system call.
>     This one is a candidate for recovery. Might need help from the
>     file system code. If the kernel page is a clean copy of data in
>     the file system, then drop this page and re-read from storage
>     into a new page. Then resume the copy_to_user().
>     If the page is modified, then need some file system action to
>     somehow mark this range of addresses in the file as lost forever.
>     First step in tackling this case is identifying that the source
>     address is a page cache page.
> 
> 3) Probably many other places where the kernel copies to user for
>     other system calls. Would need to look at these on a case by case
>     basis. Likely most have the same issue as ioctl(2) above.

1) 3)
Yes, in extreme cases, user-mode processes may be killed all the time.
The hardware error that repeatedly triggered in the same page, in this
case, firmware maybe report a fatal error, if yes, this problem can be
solved.

2)
This is indeed a workaround, somewhat complex, but it seems worthwhile
to avoid kernel panic.

Sorry for didn't catch your reply in time:)

Thanks,
Tong.

> 
> -Tony
> 
> .

