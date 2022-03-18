Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BAE4DD795
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Mar 2022 11:00:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKfdj0sp4z3bY0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Mar 2022 21:00:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NKN+7GSj;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NKN+7GSj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=NKN+7GSj; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=NKN+7GSj; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KKfcS5lpzz30QD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Mar 2022 20:59:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647597556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WwojpOjEOr4mcSzqZ4SMu6wiIk7XFK36I3d0bzyiUkI=;
 b=NKN+7GSj5c2/kjWonIRxDeK2iApcrUwC+RMf4V0Pbj+gt3lMLnw/FJvmlCaIS5ov+gyDxT
 ZE+A4DnRahlUPJ5gmBDlMl+X+ZTUhlBi0asMJ5bs/L8CUQGJLscD+x9E1NNeZE1dWf+tjP
 rOIHIHOLul0bepBE6ygdrDVH4dSRKNk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647597556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WwojpOjEOr4mcSzqZ4SMu6wiIk7XFK36I3d0bzyiUkI=;
 b=NKN+7GSj5c2/kjWonIRxDeK2iApcrUwC+RMf4V0Pbj+gt3lMLnw/FJvmlCaIS5ov+gyDxT
 ZE+A4DnRahlUPJ5gmBDlMl+X+ZTUhlBi0asMJ5bs/L8CUQGJLscD+x9E1NNeZE1dWf+tjP
 rOIHIHOLul0bepBE6ygdrDVH4dSRKNk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-SZTPUcjCOISAsR3lk8SKKQ-1; Fri, 18 Mar 2022 05:59:14 -0400
X-MC-Unique: SZTPUcjCOISAsR3lk8SKKQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 c19-20020a05600c0ad300b00385bb3db625so5566426wmr.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Mar 2022 02:59:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=WwojpOjEOr4mcSzqZ4SMu6wiIk7XFK36I3d0bzyiUkI=;
 b=tEJHmb9nwRdxzIgQQRuP4SIXS+HVzrXQBjgZ1/lDFr6pE1/N/pOvEjiqfjuyZi5EPO
 yov9teo7Wkxhd4Voy5QRhfvph1c+bw+dbf0mAAcit2eqIr4v3HPD7WnOuqaZbkMp06By
 SjUat5Nk8/sLcVoGwVSnPNfBy7/3MziAfjB5PhXl3Yk7c89leC8pQrbxytMNg17x07qy
 Cid1srjq+WJOcEw96i1D9t9hNgEaUItm0wllaVhBAtifTu1tif1lNEhF3S3P0Z+/IbVm
 CDpnAnMxrX1nDKmdZu/jDb011T5S3sUnDVUXbrlCrkVGDxXEie5Wr2yp5mUPbllqfPUU
 CFsA==
X-Gm-Message-State: AOAM531++LrglYUi/kvDkJk7gr4ySyWQs0vqPnKhqi+02nPQvRC+JkaS
 8zimaAu0jK2gokJfbQz0voVcDDkWuB9pGOW9MYudtL8tm+jxJedbrV93bEsCVXX56+MN6ULgZrk
 hBqi8nhUIoDJze3uIkeAIAFMsSw==
X-Received: by 2002:a5d:66ca:0:b0:203:fb72:a223 with SMTP id
 k10-20020a5d66ca000000b00203fb72a223mr245273wrw.12.1647597552866; 
 Fri, 18 Mar 2022 02:59:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwiCIQSTvlMRLKh05ZCde60bXcYKmdiZDixZ35I2lQ1acs/d/cg5mxdfxUGemiF/KqVi8TxQQ==
X-Received: by 2002:a5d:66ca:0:b0:203:fb72:a223 with SMTP id
 k10-20020a5d66ca000000b00203fb72a223mr245257wrw.12.1647597552568; 
 Fri, 18 Mar 2022 02:59:12 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f24:9200:124e:f0bf:6f8c:cbd8?
 (p200300d82f249200124ef0bf6f8ccbd8.dip0.t-ipconnect.de.
 [2003:d8:2f24:9200:124e:f0bf:6f8c:cbd8])
 by smtp.gmail.com with ESMTPSA id
 i35-20020adf90a6000000b00203e767a1d2sm4123361wri.103.2022.03.18.02.59.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Mar 2022 02:59:12 -0700 (PDT)
Message-ID: <8989a07b-3a5b-0c81-983f-b35403d19579@redhat.com>
Date: Fri, 18 Mar 2022 10:59:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v1 4/7] arm64/pgtable: support
 __HAVE_ARCH_PTE_SWP_EXCLUSIVE
To: Catalin Marinas <catalin.marinas@arm.com>
References: <20220315141837.137118-1-david@redhat.com>
 <20220315141837.137118-5-david@redhat.com> <YjIr9f9qaz4xITVd@arm.com>
 <c3d39666-52ae-42ba-eaa2-7a0ca489f766@redhat.com> <YjN2qsXkmlEUTg4u@arm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <YjN2qsXkmlEUTg4u@arm.com>
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
Cc: x86@kernel.org, Jan Kara <jack@suse.cz>, Yang Shi <shy828301@gmail.com>,
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

On 17.03.22 18:58, Catalin Marinas wrote:
> On Thu, Mar 17, 2022 at 11:04:18AM +0100, David Hildenbrand wrote:
>> On 16.03.22 19:27, Catalin Marinas wrote:
>>> On Tue, Mar 15, 2022 at 03:18:34PM +0100, David Hildenbrand wrote:
>>>> @@ -909,12 +925,13 @@ static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
>>>>  /*
>>>>   * Encode and decode a swap entry:
>>>>   *	bits 0-1:	present (must be zero)
>>>> - *	bits 2-7:	swap type
>>>> + *	bits 2:		remember PG_anon_exclusive
>>>> + *	bits 3-7:	swap type
>>>>   *	bits 8-57:	swap offset
>>>>   *	bit  58:	PTE_PROT_NONE (must be zero)
>>>
>>> I don't remember exactly why we reserved bits 0 and 1 when, from the
>>> hardware perspective, it's sufficient for bit 0 to be 0 and the whole
>>> pte becomes invalid. We use bit 1 as the 'table' bit (when 0 at pmd
>>> level, it's a huge page) but we shouldn't check for this on a swap
>>> entry.
>>
>> You mean
>>
>> arch/arm64/include/asm/pgtable-hwdef.h:#define PTE_TABLE_BIT            (_AT(pteval_t, 1) << 1)
>>
>> right?
> 
> Yes.
> 
>> I wonder why it even exists, for arm64 I only spot:
>>
>> arch/arm64/include/asm/pgtable.h:#define pte_mkhuge(pte)                (__pte(pte_val(pte) & ~PTE_TABLE_BIT))
>>
>> I don't really see code that sets PTE_TABLE_BIT.
>>
>> Similarly, I don't see code that sets PMD_TABLE_BIT/PUD_TABLE_BIT/P4D_TABLE_BIT.
>> Most probably setting code is not using the defines,  that's why I'm not finding it.
> 
> It gets set as part of P*D_TYPE_TABLE via p*d_populate(). We use the
> P*D_TABLE_BIT mostly for checking whether it's a huge page or not (the
> arm64 hugetlbpage.c code).
> 

Makes sense, after digging into the arm arm, I agree that it should
be safe to reuse bit 1. I'll use this (yet untested) patch in v2:


From a48d08339574b7c42e0b032f0fc334872591744c Mon Sep 17 00:00:00 2001
From: David Hildenbrand <david@redhat.com>
Date: Thu, 17 Mar 2022 11:46:26 +0100
Subject: [PATCH] arm64/pgtable: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE

Let's use bit 1, which should be irrelevant if the PTE is marked invalid
eiher way --  we really only care about bit 0.

Note that one alternative would be using one of the type bits: core-mm only
supports 5 bits, so there is no need to reserve space for 6.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/arm64/include/asm/pgtable-prot.h |  1 +
 arch/arm64/include/asm/pgtable.h      | 19 ++++++++++++++++++-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/pgtable-prot.h b/arch/arm64/include/asm/pgtable-prot.h
index b1e1b74d993c..fd6ddf14c190 100644
--- a/arch/arm64/include/asm/pgtable-prot.h
+++ b/arch/arm64/include/asm/pgtable-prot.h
@@ -14,6 +14,7 @@
  * Software defined PTE bits definition.
  */
 #define PTE_WRITE		(PTE_DBM)		 /* same as DBM (51) */
+#define PTE_SWP_EXCLUSIVE	(PTE_TABLE_BIT)		 /* only for swp ptes */
 #define PTE_DIRTY		(_AT(pteval_t, 1) << 55)
 #define PTE_SPECIAL		(_AT(pteval_t, 1) << 56)
 #define PTE_DEVMAP		(_AT(pteval_t, 1) << 57)
diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 94e147e5456c..c78994073cd0 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -402,6 +402,22 @@ static inline pgprot_t mk_pmd_sect_prot(pgprot_t prot)
 	return __pgprot((pgprot_val(prot) & ~PMD_TABLE_BIT) | PMD_TYPE_SECT);
 }
 
+#define __HAVE_ARCH_PTE_SWP_EXCLUSIVE
+static inline pte_t pte_swp_mkexclusive(pte_t pte)
+{
+	return set_pte_bit(pte, __pgprot(PTE_SWP_EXCLUSIVE));
+}
+
+static inline int pte_swp_exclusive(pte_t pte)
+{
+	return pte_val(pte) & PTE_SWP_EXCLUSIVE;
+}
+
+static inline pte_t pte_swp_clear_exclusive(pte_t pte)
+{
+	return clear_pte_bit(pte, __pgprot(PTE_SWP_EXCLUSIVE));
+}
+
 #ifdef CONFIG_NUMA_BALANCING
 /*
  * See the comment in include/linux/pgtable.h
@@ -908,7 +924,8 @@ static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
 
 /*
  * Encode and decode a swap entry:
- *	bits 0-1:	present (must be zero)
+ *	bits 0:		present (must be zero)
+ *	bits 1:		remember PG_anon_exclusive
  *	bits 2-7:	swap type
  *	bits 8-57:	swap offset
  *	bit  58:	PTE_PROT_NONE (must be zero)
-- 
2.35.1


-- 
Thanks,

David / dhildenb

