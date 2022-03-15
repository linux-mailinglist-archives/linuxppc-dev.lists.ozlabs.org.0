Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 826F44DA0AC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Mar 2022 17:59:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KJ0582x2Qz3bfw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Mar 2022 03:59:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Sy7CfHn0;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Sy7CfHn0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=Sy7CfHn0; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=Sy7CfHn0; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KJ03v4vrYz30Ld
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Mar 2022 03:58:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647363527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LGUrQuXOtgHlUwtoNupql+5VRYbS7vNf+UN5ulYsPQo=;
 b=Sy7CfHn0xlufviv5ErFCTH9mbdgH4mYkAsE1udi4s0Ftmc34xkVX7vUILT1hos0qBiKUUH
 GShyX/PkgR+JCVeFSCWPTRBDVd/LfQIgfJ9DHn21QuK8NklO9Jd24viaioR2jugEO9AhhM
 OCizdOhw8eVOhYoSYJp7k3yrwMCeH+Y=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647363527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LGUrQuXOtgHlUwtoNupql+5VRYbS7vNf+UN5ulYsPQo=;
 b=Sy7CfHn0xlufviv5ErFCTH9mbdgH4mYkAsE1udi4s0Ftmc34xkVX7vUILT1hos0qBiKUUH
 GShyX/PkgR+JCVeFSCWPTRBDVd/LfQIgfJ9DHn21QuK8NklO9Jd24viaioR2jugEO9AhhM
 OCizdOhw8eVOhYoSYJp7k3yrwMCeH+Y=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-160-xCgQRE1uP3KAaF00n49xaQ-1; Tue, 15 Mar 2022 12:58:46 -0400
X-MC-Unique: xCgQRE1uP3KAaF00n49xaQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 f18-20020adf9f52000000b00203d86759beso610767wrg.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Mar 2022 09:58:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:organization:in-reply-to
 :content-transfer-encoding;
 bh=LGUrQuXOtgHlUwtoNupql+5VRYbS7vNf+UN5ulYsPQo=;
 b=lDjdGjisHmx+wKO9r+G/W5mOBdVxWc5byLWDvE1b+BEHvZRnb8VZyz8X0OCokI8IJf
 ZafB19wYF3MvTlO023rf8ZERdfjSBqPLb2fO29DrX6hcvdnWpVt1ZV1WEEgRCxZHmFn7
 DsSc4RP6Ej8wbl5El6jZRWEKLvpzQtQ4/QRk60SPziHnwaei/UaH1vYVr9OOLkfKpuCI
 IktoA9SxtE0YPeZVueD5ARcGGP1ptGmVHJ1fvmhZoaKSWl9tOn40UEHy4jjnwQDj+nR1
 jIpuHd/fH/ECfvUwZGkahJYt+BvG64fBKj3oNFzP3zXCzQCxciD/EEfX4N/ZuobRhCyV
 vTZA==
X-Gm-Message-State: AOAM530dkVKDpNDSx7raO8uXn6HXzT6fLmHG5Io6OME2FmRzRkKckxeM
 yiesrOsM1zJMAyiGI76sjxIn45E/F0ls1QrmexBTxaJASkZOG8e1O0K074ibvDd+XHSHa7YXFu9
 nNQMTnOFD+2pMKxSu1nQkT8dnhg==
X-Received: by 2002:a7b:c5d6:0:b0:381:4127:84d3 with SMTP id
 n22-20020a7bc5d6000000b00381412784d3mr4077980wmk.24.1647363525121; 
 Tue, 15 Mar 2022 09:58:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwlZot5PU2X0oLNLaK3DaCcFcYOa0tVNe87pG0OWN67pZZ94UjPsh6UkkIWtNctJtwqc7+3yg==
X-Received: by 2002:a7b:c5d6:0:b0:381:4127:84d3 with SMTP id
 n22-20020a7bc5d6000000b00381412784d3mr4077947wmk.24.1647363524808; 
 Tue, 15 Mar 2022 09:58:44 -0700 (PDT)
Received: from ?IPV6:2003:cb:c708:1800:42bd:3cac:d22a:3c62?
 (p200300cbc708180042bd3cacd22a3c62.dip0.t-ipconnect.de.
 [2003:cb:c708:1800:42bd:3cac:d22a:3c62])
 by smtp.gmail.com with ESMTPSA id
 e18-20020adfdbd2000000b001e4bbbe5b92sm17551203wrj.76.2022.03.15.09.58.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 09:58:44 -0700 (PDT)
Message-ID: <8b13b6c0-78d4-48e3-06f0-ec0680d013a9@redhat.com>
Date: Tue, 15 Mar 2022 17:58:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v1 5/7] s390/pgtable: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
From: David Hildenbrand <david@redhat.com>
To: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
References: <20220315141837.137118-1-david@redhat.com>
 <20220315141837.137118-6-david@redhat.com> <20220315172102.771bd2cf@thinkpad>
 <c8229082-e8f1-e605-25c2-0ec9d23efd9e@redhat.com>
Organization: Red Hat
In-Reply-To: <c8229082-e8f1-e605-25c2-0ec9d23efd9e@redhat.com>
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


>> This would mean that it is not OK to have bit 52 not zero for swap PTEs.
>> But if I read the POP correctly, all bits except for the DAT-protection
>> would be ignored for invalid PTEs, so maybe this comment needs some update
>> (for both bits 52 and also 55).
>>
>> Heiko might also have some more insight.
> 
> Indeed, I wonder why we should get a specification exception when the
> PTE is invalid. I'll dig a bit into the PoP.

SA22-7832-12 6-46 ("Translation-Specification Exception") is clearer

"The page-table entry used for the translation is
valid, and bit position 52 does not contain zero."

"The page-table entry used for the translation is
valid, EDAT-1 does not apply, the instruction-exe-
cution-protection facility is not installed, and bit
position 55 does not contain zero. It is model
dependent whether this condition is recognized."

-- 
Thanks,

David / dhildenb

