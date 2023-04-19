Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 324176E7470
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 09:55:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q1Y3n6Hw2z3fTX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 17:55:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KEl+iPBF;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KEl+iPBF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KEl+iPBF;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KEl+iPBF;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q1Y2v5CvTz308w
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Apr 2023 17:54:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681890851;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ku4/Si8D6xrlYmDkiBxBM7QW/Zhm4h1GUH6h0hqbhBo=;
	b=KEl+iPBF+usjCmxggqrsRVXnav4zRJuun8FrN9XXc+MKcjf0bERK0b1H1FCAyzVksqFg77
	iEcyx6SxHhLMZKFKSu0kA8NOs/iFynlywZEXMJIbk9G4Rtkf34FiYn4HLI+tN9iYrZciI+
	o7nsSzj1VMsuNi31HJqUWJTCDeJhSus=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681890851;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ku4/Si8D6xrlYmDkiBxBM7QW/Zhm4h1GUH6h0hqbhBo=;
	b=KEl+iPBF+usjCmxggqrsRVXnav4zRJuun8FrN9XXc+MKcjf0bERK0b1H1FCAyzVksqFg77
	iEcyx6SxHhLMZKFKSu0kA8NOs/iFynlywZEXMJIbk9G4Rtkf34FiYn4HLI+tN9iYrZciI+
	o7nsSzj1VMsuNi31HJqUWJTCDeJhSus=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-547-z0EENZd7NSCpnMXIoHSDLg-1; Wed, 19 Apr 2023 03:54:09 -0400
X-MC-Unique: z0EENZd7NSCpnMXIoHSDLg-1
Received: by mail-wm1-f71.google.com with SMTP id k39-20020a05600c1ca700b003f17b10763aso835551wms.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Apr 2023 00:54:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681890849; x=1684482849;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :references:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ku4/Si8D6xrlYmDkiBxBM7QW/Zhm4h1GUH6h0hqbhBo=;
        b=Vr8PoKSOfzrvwuD7DZX79GjHarW3vkFVUpwotESKrG94EjEuLobCfP6HKnDQYfc6ur
         /grD3rkjRsGA5ovd3imN3LFIEEg4/q+f7Hz4H6+16rnxmq+9Az2cCm6Kb/draCRRawuh
         LrQPD9bs9JnsPOKA0EwUeXYXWPMU7llnXcehORrExsPm9larNTaYvCKawyDOk7iCu3c7
         SCKgN0Fq3iWPG/tx7WMVpPKGH3I1huDwVHgDJi11ikpSx1mnmmwqY56DdbcqSLzlZYTx
         QD3ynXj11FqJqEc7WWcyZ6hFu1jEt4qGeQQGb4JfYPTyc5QIa9iz2bizFCU5PsHqf++7
         0oWA==
X-Gm-Message-State: AAQBX9eYRI9qE9HnXY0cEkjEeP4Sfqdr2I31v8Hual2VmrwRPSkc+Kgq
	sjjtESsoc6Se7ZII7aaUyMGaFTErVYeU7mi2CVslZpveqsQf4JrEpSJunrKBSHNONFbt+nM45Nq
	psdlH+SOKm5G6dEuA2GQIlIN7fA==
X-Received: by 2002:a05:600c:2305:b0:3f1:728a:1881 with SMTP id 5-20020a05600c230500b003f1728a1881mr7565071wmo.31.1681890848809;
        Wed, 19 Apr 2023 00:54:08 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZGeCzv8hHHPCLoBp3+kn6wkQN0cMnv6OhMvvwsxXxMwENw712YUrmrVhvIskYHJBvgTLUksw==
X-Received: by 2002:a05:600c:2305:b0:3f1:728a:1881 with SMTP id 5-20020a05600c230500b003f1728a1881mr7565048wmo.31.1681890848428;
        Wed, 19 Apr 2023 00:54:08 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70b:7b00:7c52:a5fa:8004:96fd? (p200300cbc70b7b007c52a5fa800496fd.dip0.t-ipconnect.de. [2003:cb:c70b:7b00:7c52:a5fa:8004:96fd])
        by smtp.gmail.com with ESMTPSA id l26-20020a1ced1a000000b003eeb1d6a470sm1327085wmh.13.2023.04.19.00.54.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Apr 2023 00:54:08 -0700 (PDT)
Message-ID: <e0c0ad67-f23f-ff35-80bf-841dcfd43d99@redhat.com>
Date: Wed, 19 Apr 2023 09:54:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: Vishal Moola <vishal.moola@gmail.com>
References: <20230417205048.15870-1-vishal.moola@gmail.com>
 <20230417205048.15870-2-vishal.moola@gmail.com>
 <da600570-51c7-8088-b46b-7524c9e66e5d@redhat.com>
 <CAOzc2pwpRhNoFbdzdzuvrqbZdf2OsrTvBGs40QCZJjA5fS_q1A@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH 01/33] s390: Use _pt_s390_gaddr for gmap address tracking
In-Reply-To: <CAOzc2pwpRhNoFbdzdzuvrqbZdf2OsrTvBGs40QCZJjA5fS_q1A@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-csky@vger.kernel.org, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, Matthew Wilcox <willy@infradead.org>, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 18.04.23 23:33, Vishal Moola wrote:
> On Tue, Apr 18, 2023 at 8:45 AM David Hildenbrand <david@redhat.com> wrote:
>>
>> On 17.04.23 22:50, Vishal Moola (Oracle) wrote:
>>> s390 uses page->index to keep track of page tables for the guest address
>>> space. In an attempt to consolidate the usage of page fields in s390,
>>> replace _pt_pad_2 with _pt_s390_gaddr to replace page->index in gmap.
>>>
>>> This will help with the splitting of struct ptdesc from struct page, as
>>> well as allow s390 to use _pt_frag_refcount for fragmented page table
>>> tracking.
>>>
>>> Since page->_pt_s390_gaddr aliases with mapping, ensure its set to NULL
>>> before freeing the pages as well.
>>>
>>> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
>>> ---
>>
>> [...]
>>
>>> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
>>> index 3fc9e680f174..2616d64c0e8c 100644
>>> --- a/include/linux/mm_types.h
>>> +++ b/include/linux/mm_types.h
>>> @@ -144,7 +144,7 @@ struct page {
>>>                struct {        /* Page table pages */
>>>                        unsigned long _pt_pad_1;        /* compound_head */
>>>                        pgtable_t pmd_huge_pte; /* protected by page->ptl */
>>> -                     unsigned long _pt_pad_2;        /* mapping */
>>> +                     unsigned long _pt_s390_gaddr;   /* mapping */
>>>                        union {
>>>                                struct mm_struct *pt_mm; /* x86 pgds only */
>>>                                atomic_t pt_frag_refcount; /* powerpc */
>>
>> The confusing part is, that these gmap page tables are not ordinary
>> process page tables that we would ordinarily place into this section
>> here. That's why they are also not allocated/freed using the typical
>> page table constructor/destructor ...
> 
> I initially thought the same, so I was quite confused when I saw
> __gmap_segment_gaddr was using pmd_pgtable_page().
> 
> Although they are not ordinary process page tables, since we
> eventually want to move them out of struct page, I think shifting them
> to be in ptdescs, being a memory descriptor for page tables, makes
> the most sense.

Seeing utilities like tlb_remove_page_ptdesc() that don't really apply 
to such page tables, I wonder if we should much rather treat such 
shadow/auxiliary/... page tables (just like other architectures like 
x86, arm, ... employ as well) as a distinct type.

And have ptdesc be the common type for all process page tables.

> 
> Another option is to leave pmd_pgtable_page() as is just for this case.
> Or we can revert commit 7e25de77bc5ea which uses the function here
> then figure out where these gmap pages table pages will go later.

I'm always confused when reading gmap code, so let me have another look :)

The confusing part is that s390x shares the lowest level page tables 
(PTE tables) between the process and gmap ("guest mapping", similar to 
EPT on x86-64). It maps these process PTE tables (covering 1 MiB) into 
gmap-specific PMD tables.

pmd_pgtable_page() should indeed always give us a gmap-specific 
PMD-table. In fact, something allocated via gmap_alloc_table().

Decoupling both concepts sounds like a good idea.

-- 
Thanks,

David / dhildenb

