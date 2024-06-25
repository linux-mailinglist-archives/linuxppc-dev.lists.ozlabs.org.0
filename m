Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF4B916837
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2024 14:42:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W7kx71lDnz3ftj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2024 22:42:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W7kwk4nQ0z3cDT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2024 22:41:40 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 50EFA339;
	Tue, 25 Jun 2024 05:41:33 -0700 (PDT)
Received: from [10.1.39.170] (XHFQ2J9959.cambridge.arm.com [10.1.39.170])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 774F33F766;
	Tue, 25 Jun 2024 05:41:04 -0700 (PDT)
Message-ID: <306874fe-9bc1-4dec-a856-0125e4541971@arm.com>
Date: Tue, 25 Jun 2024 13:41:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 18/18] arm64/mm: Automatically fold contpte mappings
Content-Language: en-GB
To: Baolin Wang <baolin.wang@linux.alibaba.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>,
 James Morse <james.morse@arm.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>, Mark Rutland <mark.rutland@arm.com>,
 David Hildenbrand <david@redhat.com>, John Hubbard <jhubbard@nvidia.com>,
 Zi Yan <ziy@nvidia.com>, Barry Song <21cnbao@gmail.com>,
 Alistair Popple <apopple@nvidia.com>, Yang Shi <shy828301@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, "Yin, Fengwei" <fengwei.yin@intel.com>
References: <20240215103205.2607016-1-ryan.roberts@arm.com>
 <20240215103205.2607016-19-ryan.roberts@arm.com>
 <1285eb59-fcc3-4db8-9dd9-e7c4d82b1be0@huawei.com>
 <8d57ed0d-fdd0-4fc6-b9f1-a6ac11ce93ce@arm.com>
 <018b5e83-789e-480f-82c8-a64515cdd14a@huawei.com>
 <b75aa60d-e058-4b5c-877a-9c0cd295e96f@linux.alibaba.com>
 <b6b485ee-7af0-42b8-b0ca-5a75f76a69e2@arm.com>
 <43a5986a-52ea-4090-9333-90af137a4735@linux.alibaba.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <43a5986a-52ea-4090-9333-90af137a4735@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-mm@kvack.org, x86@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 25/06/2024 13:37, Baolin Wang wrote:

[...]

>>> For other filesystems, like ext4, I did not found the logic to determin what
>>> size of folio to allocate in writable mmap() path
>>
>> Yes I'd be keen to understand this to. When I was doing contpte, page cache
>> would only allocate large folios for readahead. So that's why I wouldn't have
> 
> You mean non-large folios, right?

No I mean that at the time I wrote contpte, the policy was to allocate an
order-0 folio for any writes that missed in the page cache, and allocate large
folios only when doing readahead from storage into page cache. The test that is
regressing is doing writes.

