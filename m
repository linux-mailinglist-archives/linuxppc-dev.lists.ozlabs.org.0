Return-Path: <linuxppc-dev+bounces-15245-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C46CF2FC8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 05 Jan 2026 11:30:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dl9YZ4x3bz2yCL;
	Mon, 05 Jan 2026 21:30:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767609042;
	cv=none; b=nDnjobudC7kC1UzhDf/AxOeD7pAqJJpr+5iMDelZvurIdO5H3EosbmY+xZ18vHICeQdxgi7U2jtVpupxnq8mIDVidLoMeoQbWOOsbX74YM3JkQ5fxy2p7/VtbQyGkNVAIhAr5RemEkqdTAEOnI0E0wHdxdhne2gX9ejLjHXSrW3HXxN0ECOv/VKK2AHsSuctUqqBU4qbD2DamkUybYPqOkTbatG+hTHwPxr0+kpX3KW82fNqNGvkghn5MIheGX6kt9Gv1aqU252orgVvwg85hrQu5Me4O6E/h0TGE6REMg0TzbX2QZNZlXxUJtVDo++YhezWlHltySlcTeYqOt0vtA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767609042; c=relaxed/relaxed;
	bh=Qj1wWuX/i5Ulu1ZXXq8t5vSSkT9gBOkVJYRGoReWc/M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QFxiAmt8pdsC+L0Zw9e7//ICP0MxHAWTCLh28NO14ieUmzQSWuk4lDqJ1meltdBRH7pgXS8F8yTpJdc+W7bN0nd2WkkpJPk+qqxccILc57c9ItRsNifmhBaNNplKDo9ZhRqfXqPoCU/2teAu5lYNbDi1NiZX79ewZ8jdieb456WzBU4jo5qSRDayY0VEGaaeT14+tjqvQ5K1xvTlJQMhPl4ZXb2vEv0MXlRFWGHpKaYgF2D9hnzBbYsH8tjplY4hWjmGnCbylLI5hDPwJvVmv+HFzbw9QrLYacpBPL0/DZ6NafE27cF3yL/feLZIvRzwTFecrm/fgCSCXE9s3MKY4g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dl9YY2jGvz2xm5
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 21:30:39 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 45673497;
	Mon,  5 Jan 2026 02:30:00 -0800 (PST)
Received: from [10.1.38.150] (XHFQ2J9959.cambridge.arm.com [10.1.38.150])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9EA473F6A8;
	Mon,  5 Jan 2026 02:30:03 -0800 (PST)
Message-ID: <19a0da52-5322-40b0-9195-5d191f582bc5@arm.com>
Date: Mon, 5 Jan 2026 10:30:02 +0000
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] randomize_kstack: Maintain kstack_offset per task
Content-Language: en-GB
To: David Laight <david.laight.linux@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Mark Rutland <mark.rutland@arm.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>,
 Jeremy Linton <jeremy.linton@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-hardening@vger.kernel.org,
 stable@vger.kernel.org
References: <20260102131156.3265118-1-ryan.roberts@arm.com>
 <20260102131156.3265118-2-ryan.roberts@arm.com>
 <20260102224432.172b1247@pumpkin>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20260102224432.172b1247@pumpkin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 02/01/2026 22:44, David Laight wrote:
> On Fri,  2 Jan 2026 13:11:52 +0000
> Ryan Roberts <ryan.roberts@arm.com> wrote:
> 
>> kstack_offset was previously maintained per-cpu, but this caused a
>> couple of issues. So let's instead make it per-task.
>>
>> Issue 1: add_random_kstack_offset() and choose_random_kstack_offset()
>> expected and required to be called with interrupts and preemption
>> disabled so that it could manipulate per-cpu state. But arm64, loongarch
>> and risc-v are calling them with interrupts and preemption enabled. I
>> don't _think_ this causes any functional issues, but it's certainly
>> unexpected and could lead to manipulating the wrong cpu's state, which
>> could cause a minor performance degradation due to bouncing the cache
>> lines. By maintaining the state per-task those functions can safely be
>> called in preemptible context.
>>
>> Issue 2: add_random_kstack_offset() is called before executing the
>> syscall and expands the stack using a previously chosen rnadom offset.
>                                                            <>
> 	David

Cheers; will fix in next version.

Thanks,
Ryan

