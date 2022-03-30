Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 046874EBB54
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Mar 2022 08:59:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KSy3H5pHBz2yyK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Mar 2022 17:59:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LILja68p;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=T3DkEgcC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=LILja68p; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=T3DkEgcC; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KSy2W0ns5z2xTd
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Mar 2022 17:58:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648623518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BF9Fr3Hf2Q3seTfZG5uyvCg9ZVloRlsxZukD5j+fS4A=;
 b=LILja68p93ujgunKcSzMgpDX3ug346qSFD0y+glc5bTbCCYMTwUZxkPKwSQ21xBsZDcg/0
 UVJ6edyNVKNbFwOqdDGWq2faDq4mEnY/Lv259GNDI/5bgN9JNPfOM0DtyZUM068QEyx3fn
 Cyz34CPWzWlJKK/4SOSWh6AKkI7+Zk0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648623519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BF9Fr3Hf2Q3seTfZG5uyvCg9ZVloRlsxZukD5j+fS4A=;
 b=T3DkEgcCFk4eL5NLHs9CYjrsQYHOxIgCAX2tn5lv38LyfhUPdiX7bMLYfJoNzAM64lzwCr
 IgRYOtCi/rHqMA9kDo4fhN0wf7bmx84ezhrW+0wQhtqc7ui0EtHI8OZACI4UMqutIvs59u
 JTKEebCZPGxbORhagDeiphPepzsjPP8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-18-EK91-SbBOH-YpvXUMDHLeg-1; Wed, 30 Mar 2022 02:58:37 -0400
X-MC-Unique: EK91-SbBOH-YpvXUMDHLeg-1
Received: by mail-wm1-f70.google.com with SMTP id
 r82-20020a1c4455000000b0038c15a1ed8cso333942wma.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Mar 2022 23:58:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=BF9Fr3Hf2Q3seTfZG5uyvCg9ZVloRlsxZukD5j+fS4A=;
 b=mCl/qEPe20RHz9ZHJN8Om7JfLa6DGveNU0RhXD6oMCsajhouVeOvXvjcURWQUq8X2z
 VzM25UCxZkX8SCKoH6NW44KsAUJEx1rdsLH11UW+u0G6LxUNDEp5jIFmF/goyEl+Usik
 cuB4wnkWcm50Z8ME6PqLYH08riHA4VfsA2NufgMn3NzNBqix49nxlByMwthF34WVDFyN
 o5mvnM/AYQvztgkpZDx73pjvPB4ixiWTeMhfe2IM4jhBnHVI7fDZEJeywrPVacHAGpld
 t9d3j0pyOdXLGiz9vENT5iPYQFkg24Upjkl/gQgrJjgxkiw7/1PqRJr0NQ3E6zhKunPY
 BOlw==
X-Gm-Message-State: AOAM533LC5sJULDYDDfPqRriK6QeUfhIKxtRxxy3NvCDp//WUM7oGq19
 CRW6Vo8alONdd4V28Vig6PGrgZyu8qaNSXd/hNnHtA/xgDxbfwgGRGyCZJOz+8XhCVfzw/eS6TT
 KCMaGaXYoPUX4lIEjk/r0xzzUrQ==
X-Received: by 2002:adf:f943:0:b0:203:e832:129 with SMTP id
 q3-20020adff943000000b00203e8320129mr34761257wrr.626.1648623515915; 
 Tue, 29 Mar 2022 23:58:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwtto01FveovjFViTUCxDqiAQ+5FDv0R1GlHAedwP32FH88iQTdtwzmDfuXuu4j6BvJ3hJeZg==
X-Received: by 2002:adf:f943:0:b0:203:e832:129 with SMTP id
 q3-20020adff943000000b00203e8320129mr34761230wrr.626.1648623515578; 
 Tue, 29 Mar 2022 23:58:35 -0700 (PDT)
Received: from ?IPV6:2003:cb:c705:2200:178b:7244:2a1f:b5d8?
 (p200300cbc7052200178b72442a1fb5d8.dip0.t-ipconnect.de.
 [2003:cb:c705:2200:178b:7244:2a1f:b5d8])
 by smtp.gmail.com with ESMTPSA id
 r65-20020a1c4444000000b0038c48dd23b9sm6003935wma.5.2022.03.29.23.58.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Mar 2022 23:58:35 -0700 (PDT)
Message-ID: <3272510e-ff5c-8694-c45c-7be9eaed4b42@redhat.com>
Date: Wed, 30 Mar 2022 08:58:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 7/8] powerpc/pgtable: remove _PAGE_BIT_SWAP_TYPE for
 book3s
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20220329164329.208407-1-david@redhat.com>
 <20220329164329.208407-8-david@redhat.com>
 <22d3c42d-402f-8aeb-e989-c05d023b2ed3@csgroup.eu>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <22d3c42d-402f-8aeb-e989-c05d023b2ed3@csgroup.eu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: Jan Kara <jack@suse.cz>, Catalin Marinas <catalin.marinas@arm.com>,
 Yang Shi <shy828301@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 Peter Xu <peterx@redhat.com>, Michal Hocko <mhocko@kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Donald Dutile <ddutile@redhat.com>,
 Liang Zhang <zhangliang5@huawei.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>, Andrea Arcangeli <aarcange@redhat.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 Shakeel Butt <shakeelb@google.com>, Pedro Gomes <pedrodemargomes@gmail.com>,
 "x86@kernel.org" <x86@kernel.org>, Hugh Dickins <hughd@google.com>,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Vlastimil Babka <vbabka@suse.cz>,
 Jason Gunthorpe <jgg@nvidia.com>, David Rientjes <rientjes@google.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Nadav Amit <namit@vmware.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Rik van Riel <riel@surriel.com>,
 John Hubbard <jhubbard@nvidia.com>, Heiko Carstens <hca@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Oded Gabbay <oded.gabbay@gmail.com>, Jann Horn <jannh@google.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Oleg Nesterov <oleg@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Roman Gushchin <guro@fb.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 30.03.22 08:07, Christophe Leroy wrote:
> 
> 
> Le 29/03/2022 à 18:43, David Hildenbrand a écrit :
>> The swap type is simply stored in bits 0x1f of the swap pte. Let's
>> simplify by just getting rid of _PAGE_BIT_SWAP_TYPE. It's not like that
>> we can simply change it: _PAGE_SWP_SOFT_DIRTY would suddenly fall into
>> _RPAGE_RSV1, which isn't possible and would make the
>> BUILD_BUG_ON(_PAGE_HPTEFLAGS & _PAGE_SWP_SOFT_DIRTY) angry.
>>
>> While at it, make it clearer which bit we're actually using for
>> _PAGE_SWP_SOFT_DIRTY by just using the proper define and introduce and
>> use SWP_TYPE_MASK.
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>   arch/powerpc/include/asm/book3s/64/pgtable.h | 12 +++++-------
> 
> Why only BOOK3S ? Why not BOOK3E as well ?

Hi Cristophe,

I'm focusing on the most relevant enterprise architectures for now. I
don't have the capacity to convert each and every architecture at this
point (especially, I don't to waste my time in case this doesn't get
merged, and book3e didn't look straight forward to me).

Once this series hits upstream, I can look into other architectures --
and I'll be happy if other people jump in that have more familiarity
with the architecture-specific swp pte layouts.

Thanks

-- 
Thanks,

David / dhildenb

