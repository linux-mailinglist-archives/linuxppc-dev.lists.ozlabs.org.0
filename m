Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9EE4DC391
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Mar 2022 11:05:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KK2nc1G9bz3bSr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Mar 2022 21:05:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RMMKCscr;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RMMKCscr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.129.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=RMMKCscr; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=RMMKCscr; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KK2ms14YHz2xtv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Mar 2022 21:04:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647511463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MBNPObCUCYNtALaMx9Iaf80ooxBHklxdAF9RYy04dD0=;
 b=RMMKCscrOlXKZuztnOOW1WZCy+D7pbLNJo0axR/zFvOa7s1beHNskoh7xjHzwix201L3E9
 4y4g9o+3XDL77JmJQyjZPl+MMBoLsCQ1y15+JCvnD7n13Q8fCEAtQR3c1fVQp3u3smhoXz
 C0GSEyeanGDNXoz/cJuEWZTZ8DYY9mA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647511463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MBNPObCUCYNtALaMx9Iaf80ooxBHklxdAF9RYy04dD0=;
 b=RMMKCscrOlXKZuztnOOW1WZCy+D7pbLNJo0axR/zFvOa7s1beHNskoh7xjHzwix201L3E9
 4y4g9o+3XDL77JmJQyjZPl+MMBoLsCQ1y15+JCvnD7n13Q8fCEAtQR3c1fVQp3u3smhoXz
 C0GSEyeanGDNXoz/cJuEWZTZ8DYY9mA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-383-DnkptYggO3qwEp6FcJ0Hxg-1; Thu, 17 Mar 2022 06:04:21 -0400
X-MC-Unique: DnkptYggO3qwEp6FcJ0Hxg-1
Received: by mail-wm1-f71.google.com with SMTP id
 a26-20020a7bc1da000000b003857205ec7cso1942955wmj.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Mar 2022 03:04:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=MBNPObCUCYNtALaMx9Iaf80ooxBHklxdAF9RYy04dD0=;
 b=TDBKallwGn3Feua3pXJNCT3NOYVJNuJ4HqjA91XWL1mDuWWXq/8ojAvWoyVYF2sxmr
 mRjggBJWZ+mjxu3aK4KdizjaD6tNDoA9c2p2d40AULPNqfMn9SG9RnpEd/sIOobHw/Iu
 0j9rwwYAYxbYk7nVjIiFJ9GLNCI9Jp2GjQTF9gQsljb9LFaDIVb/4DIOO8OQKtq0j4Pc
 FrbY2Rm8nDTQXFwaPGpL8r2LFxmbtrrVc/3rYjSD2x8vxM/xAXGpGvM/Tf5ZpE4nZtgx
 nKjHoOgwnblcuGywT5SH/eifWUl1Zmmnmfs/eeCJw7LJGoZck3CDAYX8mF97Q0mdloWk
 vXQA==
X-Gm-Message-State: AOAM532ugcCFEb83J0xw4XLIXqlUn4Bq6yTqRwaIEETH+gIA1voEgJJY
 fIGzfy6UV/d54xueNikZPdUtP4/u8E7+un0frae60IcJbkZtj6gVPasZ6n290q2aLfMhifHclPj
 AaY3KfwRnaBh3oY26fOhBfJaDDw==
X-Received: by 2002:a05:600c:a4a:b0:389:e8fd:54b4 with SMTP id
 c10-20020a05600c0a4a00b00389e8fd54b4mr3151308wmq.168.1647511460503; 
 Thu, 17 Mar 2022 03:04:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqDnOUQ38GHBC7qxykUWE5EEPAwQFTum3x+dhkpMIFZaDI62UNmCzA1x1kIEv/0vMQ4ejNKg==
X-Received: by 2002:a05:600c:a4a:b0:389:e8fd:54b4 with SMTP id
 c10-20020a05600c0a4a00b00389e8fd54b4mr3151270wmq.168.1647511460156; 
 Thu, 17 Mar 2022 03:04:20 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:20af:34be:985b:b6c8?
 ([2a09:80c0:192:0:20af:34be:985b:b6c8])
 by smtp.gmail.com with ESMTPSA id
 g13-20020a05600c4ecd00b0038a0165f2fbsm4412271wmq.17.2022.03.17.03.04.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 03:04:19 -0700 (PDT)
Message-ID: <c3d39666-52ae-42ba-eaa2-7a0ca489f766@redhat.com>
Date: Thu, 17 Mar 2022 11:04:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
To: Catalin Marinas <catalin.marinas@arm.com>
References: <20220315141837.137118-1-david@redhat.com>
 <20220315141837.137118-5-david@redhat.com> <YjIr9f9qaz4xITVd@arm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v1 4/7] arm64/pgtable: support
 __HAVE_ARCH_PTE_SWP_EXCLUSIVE
In-Reply-To: <YjIr9f9qaz4xITVd@arm.com>
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

On 16.03.22 19:27, Catalin Marinas wrote:
> On Tue, Mar 15, 2022 at 03:18:34PM +0100, David Hildenbrand wrote:
>> diff --git a/arch/arm64/include/asm/pgtable-prot.h b/arch/arm64/include/asm/pgtable-prot.h
>> index b1e1b74d993c..62e0ebeed720 100644
>> --- a/arch/arm64/include/asm/pgtable-prot.h
>> +++ b/arch/arm64/include/asm/pgtable-prot.h
>> @@ -14,6 +14,7 @@
>>   * Software defined PTE bits definition.
>>   */
>>  #define PTE_WRITE		(PTE_DBM)		 /* same as DBM (51) */
>> +#define PTE_SWP_EXCLUSIVE	(_AT(pteval_t, 1) << 2)	 /* only for swp ptes */
> 
> I think we can use bit 1 here.
> 
>> @@ -909,12 +925,13 @@ static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
>>  /*
>>   * Encode and decode a swap entry:
>>   *	bits 0-1:	present (must be zero)
>> - *	bits 2-7:	swap type
>> + *	bits 2:		remember PG_anon_exclusive
>> + *	bits 3-7:	swap type
>>   *	bits 8-57:	swap offset
>>   *	bit  58:	PTE_PROT_NONE (must be zero)
> 
> I don't remember exactly why we reserved bits 0 and 1 when, from the
> hardware perspective, it's sufficient for bit 0 to be 0 and the whole
> pte becomes invalid. We use bit 1 as the 'table' bit (when 0 at pmd
> level, it's a huge page) but we shouldn't check for this on a swap
> entry.

You mean

arch/arm64/include/asm/pgtable-hwdef.h:#define PTE_TABLE_BIT            (_AT(pteval_t, 1) << 1)

right?

I wonder why it even exists, for arm64 I only spot:

arch/arm64/include/asm/pgtable.h:#define pte_mkhuge(pte)                (__pte(pte_val(pte) & ~PTE_TABLE_BIT))

I don't really see code that sets PTE_TABLE_BIT.

Similarly, I don't see code that sets PMD_TABLE_BIT/PUD_TABLE_BIT/P4D_TABLE_BIT.
Most probably setting code is not using the defines,  that's why I'm not finding it.

-- 
Thanks,

David / dhildenb

