Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EAE94E3BE8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Mar 2022 10:47:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KN68x2FSmz30hl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Mar 2022 20:47:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=R1ySavt5;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=R1ySavt5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.129.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=R1ySavt5; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=R1ySavt5; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KN6893Xtfz2xXX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Mar 2022 20:46:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647942403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gj16fIvhMGn60A3rgtQAZDpb6AlAuaEkvfPmTyLtwTQ=;
 b=R1ySavt5osXkTuXusBrsfDurTnhoXlt4uT+0GKNuUGJ9iJQFVKW/D27bmhvoaTOpLsl2Yx
 wBHyAg6ZDceUl/QJdDququxS7RLzqQ6FCECBehsK/W3QrRLVFgXPqPtVnoACMgSmC1N1lZ
 Yo7NqyIgJ8waF0F97F/ATgW2CLj2t1w=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647942403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gj16fIvhMGn60A3rgtQAZDpb6AlAuaEkvfPmTyLtwTQ=;
 b=R1ySavt5osXkTuXusBrsfDurTnhoXlt4uT+0GKNuUGJ9iJQFVKW/D27bmhvoaTOpLsl2Yx
 wBHyAg6ZDceUl/QJdDququxS7RLzqQ6FCECBehsK/W3QrRLVFgXPqPtVnoACMgSmC1N1lZ
 Yo7NqyIgJ8waF0F97F/ATgW2CLj2t1w=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-501-d55UUzsON3y3GmMfG9-2mg-1; Tue, 22 Mar 2022 05:46:42 -0400
X-MC-Unique: d55UUzsON3y3GmMfG9-2mg-1
Received: by mail-wm1-f69.google.com with SMTP id
 r9-20020a1c4409000000b0038c15a1ed8cso823981wma.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Mar 2022 02:46:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=gj16fIvhMGn60A3rgtQAZDpb6AlAuaEkvfPmTyLtwTQ=;
 b=YSCUWj7LJthFa0oV7em2ddD9TgHiFkGw7+1LXY1zOXVG7bHF9rDWSkpUFPLmVudY3/
 hpOCEtV5qTl65INdGdLcFxauMNI/DA31qnGjxXgGy3IcZ5qvytFINAK6HAH3QKgg/ElN
 hwwV278NybO/I6TQP7PTo6uJXccE0/4e2xARkekQ2TgqI1nWuUExJPeNUXcx7IHThuMw
 ysnlbQRUSfinotkXaHaWLdq+ot7TWtRIpBLPEPG32JTTHGTLwg1CdAlQk9laYv2U3LoE
 Pj1XmhwRnC88OvOYtuTbtu3xWMY3bkyjoTWrMu5ynEtlOcP1rUE/REom9rnvkXgwD2+f
 fWzw==
X-Gm-Message-State: AOAM531RlAqjCDlEjbDmvVnziKk6EDJIGcgc3ryqQW1i+6yVvUlkceC8
 Nips0gQY8CG77CIcd3KHTCzHwQ72URlYPjDt1toKBOdvH2uBaLXcgbvE8R4oHgc3pmzGlt5Dx/5
 5bg789+8YZeVysnRlFBZRGK58+A==
X-Received: by 2002:adf:f34e:0:b0:203:fa2f:73e with SMTP id
 e14-20020adff34e000000b00203fa2f073emr14961314wrp.351.1647942401041; 
 Tue, 22 Mar 2022 02:46:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZd8Uvoix5JtZIw5NnbrgIf9I7tI3M1eMO959R1yIf5jk559l3XNPulFYZR9OqDfvtCDALew==
X-Received: by 2002:adf:f34e:0:b0:203:fa2f:73e with SMTP id
 e14-20020adff34e000000b00203fa2f073emr14961247wrp.351.1647942400705; 
 Tue, 22 Mar 2022 02:46:40 -0700 (PDT)
Received: from ?IPV6:2003:cb:c708:de00:549e:e4e4:98df:ff72?
 (p200300cbc708de00549ee4e498dfff72.dip0.t-ipconnect.de.
 [2003:cb:c708:de00:549e:e4e4:98df:ff72])
 by smtp.gmail.com with ESMTPSA id
 v188-20020a1cacc5000000b00384b71a50d5sm1507806wme.24.2022.03.22.02.46.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 02:46:40 -0700 (PDT)
Message-ID: <10851f31-632c-5fb4-a941-3dccc46e5156@redhat.com>
Date: Tue, 22 Mar 2022 10:46:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v1 4/7] arm64/pgtable: support
 __HAVE_ARCH_PTE_SWP_EXCLUSIVE
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
References: <20220315141837.137118-1-david@redhat.com>
 <20220315141837.137118-5-david@redhat.com> <YjIr9f9qaz4xITVd@arm.com>
 <20220321143802.GC11145@willie-the-truck>
 <ea570f92-f896-7f9b-91c4-ad0a025bb340@redhat.com>
 <20220321174404.GA11389@willie-the-truck> <YjjDlajNUdHgOOWM@arm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <YjjDlajNUdHgOOWM@arm.com>
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
 Christoph Hellwig <hch@lst.de>, Paul Mackerras <paulus@samba.org>,
 Andrea Arcangeli <aarcange@redhat.com>, linux-s390@vger.kernel.org,
 Vasily Gorbik <gor@linux.ibm.com>, Rik van Riel <riel@surriel.com>,
 Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 linux-arm-kernel@lists.infradead.org, Jason Gunthorpe <jgg@nvidia.com>,
 David Rientjes <rientjes@google.com>, Pedro Gomes <pedrodemargomes@gmail.com>,
 Jann Horn <jannh@google.com>, John Hubbard <jhubbard@nvidia.com>,
 Heiko Carstens <hca@linux.ibm.com>, Shakeel Butt <shakeelb@google.com>,
 Oleg Nesterov <oleg@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Oded Gabbay <oded.gabbay@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Nadav Amit <namit@vmware.com>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Roman Gushchin <guro@fb.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 21.03.22 19:27, Catalin Marinas wrote:
> On Mon, Mar 21, 2022 at 05:44:05PM +0000, Will Deacon wrote:
>> On Mon, Mar 21, 2022 at 04:07:48PM +0100, David Hildenbrand wrote:
>>> So the example you gave cannot possibly have that bit set. From what I
>>> understand, it should be fine. But I have no real preference: I can also
>>> just stick to the original patch, whatever you prefer.
>>
>> I think I'd prefer to stay on the safe side and stick with bit 2 as you
>> originally proposed. If we need to support crazy numbers of swapfiles
>> in future then we can revisit the idea of allocating bit 1.
> 
> Sounds fine to me. David, feel free to keep my reviewed-by on the
> original patch.
> 

Thanks both, I'll add the following comment to the patch:

"Note that we might be able to reuse bit 1, but reusing bit 1 turned out
 problematic in the past for PROT_NONE handling; so let's play safe and
 use another bit."


-- 
Thanks,

David / dhildenb

