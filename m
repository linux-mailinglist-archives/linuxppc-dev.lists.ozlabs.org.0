Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A92477309C4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 23:24:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JSy2cjQ3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QhJMV41SCz3bmp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 07:24:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JSy2cjQ3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=dinguyen@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QhJLc0kkjz2yjk
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jun 2023 07:23:20 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 34A296257E;
	Wed, 14 Jun 2023 21:23:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E219C433C8;
	Wed, 14 Jun 2023 21:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686777794;
	bh=sfZlQC0KRiU3VFMaS6H5djLiaDuaR3UyKKAHotXoEC4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JSy2cjQ3EfZqDH+GRmJ+mjVAAcseGIvPUq3lquiQxXqEjjGqwU+HemD7F3wiC1btN
	 oSofDjGtfqLFUZE6+eF26LaNmlZ0XJSVLI8h3M4XLmim/HM29Na3QWm9DVPo2aVCXI
	 K79BAGLxK+0MfFwKGWozB9O2gr9yZd3Cu5CIDwhRjdpR3tn5b309NHjtR2IQGAy5FI
	 ii48Ct/zrPJGlO6GMB0nxU3tTn8XzvIvT2D58R4sk2Mn4rxTjXdkRPrgiKhp+20BR7
	 UEwrTSQZ099UBshJbATcCyWw+lXzjKCSDECSlkjbQFiwFpFsJU9nBH5UIC1JXPi4An
	 txkWeQKuOaEyQ==
Message-ID: <5729b45b-6a19-2aa8-8722-c50e6a1fceea@kernel.org>
Date: Wed, 14 Jun 2023 16:23:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 27/34] nios2: Convert __pte_free_tlb() to use ptdescs
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
 <20230612210423.18611-28-vishal.moola@gmail.com>
 <e52c7a74-da68-08d2-54e2-f95a8c5b52e7@kernel.org>
 <CAMuHMdXPASfLM8St_JZOW3Wke+ickJoo1oDr+orRbTERy=Zgwg@mail.gmail.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <CAMuHMdXPASfLM8St_JZOW3Wke+ickJoo1oDr+orRbTERy=Zgwg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, Hugh Dickins <hughd@google.com>, linux-csky@vger.kernel.org, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 6/14/23 04:30, Geert Uytterhoeven wrote:
> Hi Dinh,
> 
> On Wed, Jun 14, 2023 at 12:17 AM Dinh Nguyen <dinguyen@kernel.org> wrote:
>> On 6/12/23 16:04, Vishal Moola (Oracle) wrote:
>>> Part of the conversions to replace pgtable constructor/destructors with
>>> ptdesc equivalents.
>>>
>>> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
>>> ---
>>>    arch/nios2/include/asm/pgalloc.h | 8 ++++----
>>>    1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/arch/nios2/include/asm/pgalloc.h b/arch/nios2/include/asm/pgalloc.h
>>> index ecd1657bb2ce..ce6bb8e74271 100644
>>> --- a/arch/nios2/include/asm/pgalloc.h
>>> +++ b/arch/nios2/include/asm/pgalloc.h
>>> @@ -28,10 +28,10 @@ static inline void pmd_populate(struct mm_struct *mm, pmd_t *pmd,
>>>
>>>    extern pgd_t *pgd_alloc(struct mm_struct *mm);
>>>
>>> -#define __pte_free_tlb(tlb, pte, addr)                               \
>>> -     do {                                                    \
>>> -             pgtable_pte_page_dtor(pte);                     \
>>> -             tlb_remove_page((tlb), (pte));                  \
>>> +#define __pte_free_tlb(tlb, pte, addr)                                       \
>>> +     do {                                                            \
>>> +             pagetable_pte_dtor(page_ptdesc(pte));                   \
>>> +             tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));      \
>>>        } while (0)
>>>
>>>    #endif /* _ASM_NIOS2_PGALLOC_H */
>>
>> Applied!
> 
> I don't think you can just apply this patch, as the new functions
> were only introduced in [PATCH v4 05/34] of this series.
> 

Ah, thanks for the pointer!

Dinh
