Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AD35E4DDB65
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Mar 2022 15:15:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKmHg4H4Kz30jZ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Mar 2022 01:15:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JiKXph5J;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JiKXph5J;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=JiKXph5J; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=JiKXph5J; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KKmGz53c2z2xCW
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Mar 2022 01:14:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647612871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vrk5fX2xWSdP9n1bkww7mSZRBCrjbbAY4wpRt0kMGOs=;
 b=JiKXph5J2LrrSB4tE8CGzFhKP2lD/QdBIAP4gUO2G5gYJ1OwSlYk/Dz/zeh2FeUjFNnLdQ
 1nSDsVzYpF+s7zV/XWGv4qg7p0Bx6VVyq8h5f5n1tYOvtssChOw5vYSgfVOB0Nb1vj5zz6
 /Cehe1caEZFUI8XDeClOkCyWESNeYX0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647612871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vrk5fX2xWSdP9n1bkww7mSZRBCrjbbAY4wpRt0kMGOs=;
 b=JiKXph5J2LrrSB4tE8CGzFhKP2lD/QdBIAP4gUO2G5gYJ1OwSlYk/Dz/zeh2FeUjFNnLdQ
 1nSDsVzYpF+s7zV/XWGv4qg7p0Bx6VVyq8h5f5n1tYOvtssChOw5vYSgfVOB0Nb1vj5zz6
 /Cehe1caEZFUI8XDeClOkCyWESNeYX0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-220-CyTpYz28MICqrpD3X9i0qA-1; Fri, 18 Mar 2022 10:14:29 -0400
X-MC-Unique: CyTpYz28MICqrpD3X9i0qA-1
Received: by mail-wm1-f72.google.com with SMTP id
 c126-20020a1c3584000000b00380dee8a62cso3120724wma.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Mar 2022 07:14:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Vrk5fX2xWSdP9n1bkww7mSZRBCrjbbAY4wpRt0kMGOs=;
 b=f8HSiNOW8J586e0OZ40t8M8B+TTbXQwstx3rK4sIjQ75H6EpRsfCC7l4CmbD+L2Skg
 NVePExmSji0eNTYdtE1Bkakgyp9bjmcwFuye8mnVG8tunzP2XET7DwhTz+gtCKy8FMFN
 BXZE4qHcyqfOYJo+cfmbygqqsQxAGywpsv7nyGu8l5lZFpXPJCXNbzS0U8ojdsFXImAN
 CQi/6p7KnFDlm6lJtIP0IEpG0QuE6xGczT0B2GfDMN/MVFWObb8YZNU+2S0Aa0Iqofkw
 deCcEL/d54U+OK6XczW0fWiMXoeMcC3teJ8r4JaruvgE8a+Jy1Pc6rkgZHZGqdGk9UH4
 s6GQ==
X-Gm-Message-State: AOAM531x4tQ/jPr0E6ht+maen5mqgz30d93NVb51YMvgLKS3FmeB1I0R
 sU2RSuB3kq9EyDHxR6OU1Lvmoi8GiL26vkHxNdk32h6nwjk+fi/F1S+e6I7//uHULuWSjgHPYIa
 7+OaCgvPh5LVKiZLqaLTUWxClsw==
X-Received: by 2002:adf:f604:0:b0:203:d9ca:bccf with SMTP id
 t4-20020adff604000000b00203d9cabccfmr8306955wrp.331.1647612868270; 
 Fri, 18 Mar 2022 07:14:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjLDR4x76jQT8vPKbt5WCkwgszEYzxfTTeJzEyGuYsFFC95N5UVyBJYkEnjUBvTDuYOItNow==
X-Received: by 2002:adf:f604:0:b0:203:d9ca:bccf with SMTP id
 t4-20020adff604000000b00203d9cabccfmr8306914wrp.331.1647612867962; 
 Fri, 18 Mar 2022 07:14:27 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f24:9200:124e:f0bf:6f8c:cbd8?
 (p200300d82f249200124ef0bf6f8ccbd8.dip0.t-ipconnect.de.
 [2003:d8:2f24:9200:124e:f0bf:6f8c:cbd8])
 by smtp.gmail.com with ESMTPSA id
 7-20020a05600c228700b00389865c646dsm9066181wmf.14.2022.03.18.07.14.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Mar 2022 07:14:27 -0700 (PDT)
Message-ID: <c4fcedf1-22a9-c912-824d-644a21b2fcfd@redhat.com>
Date: Fri, 18 Mar 2022 15:14:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v1 4/7] arm64/pgtable: support
 __HAVE_ARCH_PTE_SWP_EXCLUSIVE
To: Catalin Marinas <catalin.marinas@arm.com>
References: <20220315141837.137118-1-david@redhat.com>
 <20220315141837.137118-5-david@redhat.com> <YjIr9f9qaz4xITVd@arm.com>
 <c3d39666-52ae-42ba-eaa2-7a0ca489f766@redhat.com> <YjN2qsXkmlEUTg4u@arm.com>
 <8989a07b-3a5b-0c81-983f-b35403d19579@redhat.com> <YjRt7DqDFJRZA7Gt@arm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <YjRt7DqDFJRZA7Gt@arm.com>
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

On 18.03.22 12:33, Catalin Marinas wrote:
> On Fri, Mar 18, 2022 at 10:59:10AM +0100, David Hildenbrand wrote:
>> diff --git a/arch/arm64/include/asm/pgtable-prot.h b/arch/arm64/include/asm/pgtable-prot.h
>> index b1e1b74d993c..fd6ddf14c190 100644
>> --- a/arch/arm64/include/asm/pgtable-prot.h
>> +++ b/arch/arm64/include/asm/pgtable-prot.h
>> @@ -14,6 +14,7 @@
>>   * Software defined PTE bits definition.
>>   */
>>  #define PTE_WRITE		(PTE_DBM)		 /* same as DBM (51) */
>> +#define PTE_SWP_EXCLUSIVE	(PTE_TABLE_BIT)		 /* only for swp ptes */
>>  #define PTE_DIRTY		(_AT(pteval_t, 1) << 55)
>>  #define PTE_SPECIAL		(_AT(pteval_t, 1) << 56)
>>  #define PTE_DEVMAP		(_AT(pteval_t, 1) << 57)
>> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
>> index 94e147e5456c..c78994073cd0 100644
>> --- a/arch/arm64/include/asm/pgtable.h
>> +++ b/arch/arm64/include/asm/pgtable.h
>> @@ -402,6 +402,22 @@ static inline pgprot_t mk_pmd_sect_prot(pgprot_t prot)
>>  	return __pgprot((pgprot_val(prot) & ~PMD_TABLE_BIT) | PMD_TYPE_SECT);
>>  }
>>  
>> +#define __HAVE_ARCH_PTE_SWP_EXCLUSIVE
>> +static inline pte_t pte_swp_mkexclusive(pte_t pte)
>> +{
>> +	return set_pte_bit(pte, __pgprot(PTE_SWP_EXCLUSIVE));
>> +}
>> +
>> +static inline int pte_swp_exclusive(pte_t pte)
>> +{
>> +	return pte_val(pte) & PTE_SWP_EXCLUSIVE;
>> +}
>> +
>> +static inline pte_t pte_swp_clear_exclusive(pte_t pte)
>> +{
>> +	return clear_pte_bit(pte, __pgprot(PTE_SWP_EXCLUSIVE));
>> +}
>> +
>>  #ifdef CONFIG_NUMA_BALANCING
>>  /*
>>   * See the comment in include/linux/pgtable.h
>> @@ -908,7 +924,8 @@ static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
>>  
>>  /*
>>   * Encode and decode a swap entry:
>> - *	bits 0-1:	present (must be zero)
>> + *	bits 0:		present (must be zero)
>> + *	bits 1:		remember PG_anon_exclusive
> 
> It looks fine to me.
> 
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> 

Great, thanks!

-- 
Thanks,

David / dhildenb

