Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E986D5B890
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2019 12:05:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45cjfj1GvxzDqWj
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2019 20:05:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=steven.price@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 45cjdB595TzDqBm
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Jul 2019 20:03:57 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F1772B;
 Mon,  1 Jul 2019 03:03:55 -0700 (PDT)
Received: from [10.1.196.133] (e112269-lin.cambridge.arm.com [10.1.196.133])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0B4143F718;
 Mon,  1 Jul 2019 03:03:52 -0700 (PDT)
Subject: Re: Re: [PATCH 1/3] arm64: mm: Add p?d_large() definitions
To: Will Deacon <will@kernel.org>, Nicholas Piggin <npiggin@gmail.com>
References: <20190623094446.28722-1-npiggin@gmail.com>
 <20190623094446.28722-2-npiggin@gmail.com>
 <20190701092756.s4u5rdjr7gazvu66@willie-the-truck>
From: Steven Price <steven.price@arm.com>
Message-ID: <3d002af8-d8cd-f750-132e-12109e1e3039@arm.com>
Date: Mon, 1 Jul 2019 11:03:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190701092756.s4u5rdjr7gazvu66@willie-the-truck>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Will Deacon <will.deacon@arm.com>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 01/07/2019 10:27, Will Deacon wrote:
> Hi Nick,
> 
> On Sun, Jun 23, 2019 at 07:44:44PM +1000, Nicholas Piggin wrote:
>> walk_page_range() is going to be allowed to walk page tables other than
>> those of user space. For this it needs to know when it has reached a
>> 'leaf' entry in the page tables. This information will be provided by the
>> p?d_large() functions/macros.
> 
> I can't remember whether or not I asked this before, but why not call
> this macro p?d_leaf() if that's what it's identifying? "Large" and "huge"
> are usually synonymous, so I find this naming needlessly confusing based
> on this patch in isolation.

Hi Will,

You replied to my posting of this patch before[1], to which you said:

> I've have thought p?d_leaf() might match better with your description
> above, but I'm not going to quibble on naming.

Have you changed your mind about quibbling? ;)

Steve

[1]
https://lore.kernel.org/lkml/20190611153650.GB4324@fuggles.cambridge.arm.com/
