Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6484DA0EF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Mar 2022 18:13:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KJ0NK63bpz30hh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Mar 2022 04:13:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bBYlYExD;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bBYlYExD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.129.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=bBYlYExD; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=bBYlYExD; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KJ0Mb16fSz2ywn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Mar 2022 04:12:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647364342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IDMoM6GQW/ashfKW/MEVa2kq3WdnPXUbjIFcEa4dk9o=;
 b=bBYlYExDE8d6Imp+lpsyWWJgZe+iBh+RR4N1KWXIFTXv1bi/g3adgTFlLXrYXGpsglWLwU
 a60ejQgt7bfEZXSWvHCrji/50r6dF0dJ2vSWnAzyr0o6nvtw2MJYUYeCqUL+80zWHLWKXA
 miOlVC32VgoRzTj51pYo+oK6qHzpzFE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647364342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IDMoM6GQW/ashfKW/MEVa2kq3WdnPXUbjIFcEa4dk9o=;
 b=bBYlYExDE8d6Imp+lpsyWWJgZe+iBh+RR4N1KWXIFTXv1bi/g3adgTFlLXrYXGpsglWLwU
 a60ejQgt7bfEZXSWvHCrji/50r6dF0dJ2vSWnAzyr0o6nvtw2MJYUYeCqUL+80zWHLWKXA
 miOlVC32VgoRzTj51pYo+oK6qHzpzFE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-347-MTqXvWZZOI6NC9n1kb2nXw-1; Tue, 15 Mar 2022 13:12:21 -0400
X-MC-Unique: MTqXvWZZOI6NC9n1kb2nXw-1
Received: by mail-wm1-f70.google.com with SMTP id
 q189-20020a1c43c6000000b003898de01de4so4624352wma.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Mar 2022 10:12:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:organization:in-reply-to
 :content-transfer-encoding;
 bh=IDMoM6GQW/ashfKW/MEVa2kq3WdnPXUbjIFcEa4dk9o=;
 b=lQR297zNo0Z0on4nI8JeOVobZkjdqBXbpToGCk8gMJaEs9fVJ+21v6bsyHGj30EuGj
 AbFgABAeJX99c1/Sdadw4wfuH9c3IAo8UQKX0gr1mJNgM5b6+/cGI/CU2fZ6Gp1tZ5zC
 AtVHnZraHLw/TYL62MlyIwq/SqG5F6ixOrJAa9qIiCkeSF9B+rOacEJifbVG1yIy1DGl
 0xSzxjFDnUrzRfqBil9zbHeHRDh5dfoaHYTaGP6IRbmXTZQFQkoNAXf5VgMNsHJZSffY
 z/TgmGJ0aOFbtEt+IsWZH2i5agSNMKolfW9YMp4wRTUiWgAHV4cpI+9sm3E+qAlZYfRQ
 OIsA==
X-Gm-Message-State: AOAM530ljoJWktcwj5GqgdDEdk9DxB5p4KNhaTc8WthXYLe2k7TjxwTE
 ldcnLrfJ0d4l2gJ+BNeknqC750iMIX9ILszVJ5Fg3OrKkfx6eW9HVGDwG9F5OdB6nqROsJE2tkk
 Q++l1zPwDBDIKM4zDqJjKertCaQ==
X-Received: by 2002:a1c:29c3:0:b0:350:9797:b38f with SMTP id
 p186-20020a1c29c3000000b003509797b38fmr4263048wmp.22.1647364339695; 
 Tue, 15 Mar 2022 10:12:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRo6lxRuqE6aanoJAKbCAqJh0bxhE/UJ0/yn9fJg724PQPYvjcnNj2cfHsSRmdNHPQTYNmsA==
X-Received: by 2002:a1c:29c3:0:b0:350:9797:b38f with SMTP id
 p186-20020a1c29c3000000b003509797b38fmr4263013wmp.22.1647364339387; 
 Tue, 15 Mar 2022 10:12:19 -0700 (PDT)
Received: from ?IPV6:2003:cb:c708:1800:42bd:3cac:d22a:3c62?
 (p200300cbc708180042bd3cacd22a3c62.dip0.t-ipconnect.de.
 [2003:cb:c708:1800:42bd:3cac:d22a:3c62])
 by smtp.gmail.com with ESMTPSA id
 i8-20020a1c5408000000b00389bf11ba0csm2759190wmb.38.2022.03.15.10.12.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 10:12:18 -0700 (PDT)
Message-ID: <55b6b582-51ca-b869-2055-674fe4c563e6@redhat.com>
Date: Tue, 15 Mar 2022 18:12:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v1 5/7] s390/pgtable: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
From: David Hildenbrand <david@redhat.com>
To: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
References: <20220315141837.137118-1-david@redhat.com>
 <20220315141837.137118-6-david@redhat.com> <20220315172102.771bd2cf@thinkpad>
 <c8229082-e8f1-e605-25c2-0ec9d23efd9e@redhat.com>
 <8b13b6c0-78d4-48e3-06f0-ec0680d013a9@redhat.com>
Organization: Red Hat
In-Reply-To: <8b13b6c0-78d4-48e3-06f0-ec0680d013a9@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: x86@kernel.org, Jan Kara <jack@suse.cz>,
 Catalin Marinas <catalin.marinas@arm.com>, Yang Shi <shy828301@gmail.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Peter Xu <peterx@redhat.com>,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 Donald Dutile <ddutile@redhat.com>, Liang Zhang <zhangliang5@huawei.com>,
 Borislav Petkov <bp@alien8.de>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Paul Mackerras <paulus@samba.org>, Andrea Arcangeli <aarcange@redhat.com>,
 linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>,
 Rik van Riel <riel@surriel.com>, Hugh Dickins <hughd@google.com>,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, linux-arm-kernel@lists.infradead.org,
 Jason Gunthorpe <jgg@nvidia.com>, David Rientjes <rientjes@google.com>,
 Pedro Gomes <pedrodemargomes@gmail.com>, Jann Horn <jannh@google.com>,
 John Hubbard <jhubbard@nvidia.com>, Heiko Carstens <hca@linux.ibm.com>,
 Shakeel Butt <shakeelb@google.com>, Oleg Nesterov <oleg@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Oded Gabbay <oded.gabbay@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Nadav Amit <namit@vmware.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Roman Gushchin <guro@fb.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 15.03.22 17:58, David Hildenbrand wrote:
> 
>>> This would mean that it is not OK to have bit 52 not zero for swap PTEs.
>>> But if I read the POP correctly, all bits except for the DAT-protection
>>> would be ignored for invalid PTEs, so maybe this comment needs some update
>>> (for both bits 52 and also 55).
>>>
>>> Heiko might also have some more insight.
>>
>> Indeed, I wonder why we should get a specification exception when the
>> PTE is invalid. I'll dig a bit into the PoP.
> 
> SA22-7832-12 6-46 ("Translation-Specification Exception") is clearer
> 
> "The page-table entry used for the translation is
> valid, and bit position 52 does not contain zero."
> 
> "The page-table entry used for the translation is
> valid, EDAT-1 does not apply, the instruction-exe-
> cution-protection facility is not installed, and bit
> position 55 does not contain zero. It is model
> dependent whether this condition is recognized."
> 

I wonder if the following matches reality:

diff --git a/arch/s390/include/asm/pgtable.h b/arch/s390/include/asm/pgtable.h
index 008a6c856fa4..6a227a8c3712 100644
--- a/arch/s390/include/asm/pgtable.h
+++ b/arch/s390/include/asm/pgtable.h
@@ -1669,18 +1669,16 @@ static inline int has_transparent_hugepage(void)
 /*
  * 64 bit swap entry format:
  * A page-table entry has some bits we have to treat in a special way.
- * Bits 52 and bit 55 have to be zero, otherwise a specification
- * exception will occur instead of a page translation exception. The
- * specification exception has the bad habit not to store necessary
- * information in the lowcore.
  * Bits 54 and 63 are used to indicate the page type.
  * A swap pte is indicated by bit pattern (pte & 0x201) == 0x200
- * This leaves the bits 0-51 and bits 56-62 to store type and offset.
- * We use the 5 bits from 57-61 for the type and the 52 bits from 0-51
- * for the offset.
- * |                     offset                        |01100|type |00|
+ * |                     offset                        |XX1XX|type |S0|
  * |0000000000111111111122222222223333333333444444444455|55555|55566|66|
  * |0123456789012345678901234567890123456789012345678901|23456|78901|23|
+ *
+ * Bits 0-51 store the offset.
+ * Bits 57-62 store the type.
+ * Bit 62 (S) is used for softdirty tracking.
+ * Bits 52, 53, 55 and 56 (X) are unused.
  */
 
 #define __SWP_OFFSET_MASK      ((1UL << 52) - 1)


I'm not sure why bit 53 was indicated as "1" and bit 55 was indicated as
"0". At least for 52 and 55 there was a clear description.

-- 
Thanks,

David / dhildenb

