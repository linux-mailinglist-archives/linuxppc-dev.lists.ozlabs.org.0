Return-Path: <linuxppc-dev+bounces-1845-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E82569950A6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Oct 2024 15:51:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XNHVC2j83z2ydQ;
	Wed,  9 Oct 2024 00:50:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728395459;
	cv=none; b=XZIhubpQtY5HsyKTLYdSxN3iJQoIaw3VIg+1kEg0kM1mwxpLDbDyHuF9GRZ83aoIPfLV5OLVbV7RQZMeZu220BFLc+fgVSZeSCXH++n0ECyqXi7fW90lHlkNpqSNSRrp5On9Vg4I9UMm1B5T3/HVLD17QcyTK6EQgkq8eCFIdVlP9Y+ZUVMT0L13XrGL3DaZyGTPhD6ABQsQEdjPQ8tNS9x7AcVKJlnQvHDFkOCx874CL2/0tESfVwyFIJlTzxqUYsGUZ7X50EyrzPP+ejutL8uRnajnGoDs1MNa6dnnmlWvsECCE9ohE8EU55B4EI93fkLulKuidaDPv/OQB0e2fg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728395459; c=relaxed/relaxed;
	bh=MT0bxc5ocflF2NBeIeTPIzdqx+Na4ZpQOoABhBBbK7M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mpTTV1gCIxQ6EEXTw0kXwdQ1pLDChFG30JD6C/GatvOaSsIfpnqCyA3wffY+ThEKud4/6yB4G270QEwNMM8xQ0VaSjoJTErYRRI5LJnwG8rxoJIwsbGTJiQGh1Vgdyv4na0PcDVCrLyWGa4WScUs+9aDIa96Wf0QJdI4TcLsuM/3s+5XzPK6xRpbudVzguWWe+mDhwgx6fQfmC3QZqA64P3zYD+28SGRKrmCgcsVSSYqyJek0drk7s67l+KfT7aZfAd3jbi5zWvPcmjSnQvQDnld4gaKdu2JXGCTc1OXOxOeFfEVGM+/S/pyzyfdtxr0pj94JHZeeGPX7BY5orol2Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IgO69pU0; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IgO69pU0; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IgO69pU0;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IgO69pU0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XNHV975kTz2yFJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Oct 2024 00:50:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728395451;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=MT0bxc5ocflF2NBeIeTPIzdqx+Na4ZpQOoABhBBbK7M=;
	b=IgO69pU0MCWZo8B3pMLf7+ysStYD0FTHqG7o2D7OqLyXXj40Wxjs9gPv5AuhqqPFG4VUqS
	zStJ4jPlLLT9wm5KY2H9tOJ2qiBR9d8ZNDWlWdn+TdaWG6NzjfEeIUERYUjsDnR8CcDwkU
	Z29jKR9B5tel+y/rQcUdbR/rIiLLKoY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728395451;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=MT0bxc5ocflF2NBeIeTPIzdqx+Na4ZpQOoABhBBbK7M=;
	b=IgO69pU0MCWZo8B3pMLf7+ysStYD0FTHqG7o2D7OqLyXXj40Wxjs9gPv5AuhqqPFG4VUqS
	zStJ4jPlLLT9wm5KY2H9tOJ2qiBR9d8ZNDWlWdn+TdaWG6NzjfEeIUERYUjsDnR8CcDwkU
	Z29jKR9B5tel+y/rQcUdbR/rIiLLKoY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-682-UqSXGguoP2Coxo57y65h-w-1; Tue, 08 Oct 2024 09:50:50 -0400
X-MC-Unique: UqSXGguoP2Coxo57y65h-w-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-37ccd7c3080so2367396f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Oct 2024 06:50:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728395449; x=1729000249;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MT0bxc5ocflF2NBeIeTPIzdqx+Na4ZpQOoABhBBbK7M=;
        b=uQv70HMz8f/aBjq9XUllwvgItUi/fCETyuKo9So4KuOkkWnS3SETGCpGZ2x4nw8T1L
         tqgGeSGz9Y+7peWUll5r3SVFN4SDanIAejWBwSOHGSuIUv0Fmf1N3Uz2BBuOTOjxzCm0
         DSpRPp2+KgkNws0USFhoDboc7BmYg4DllYXEnLaDttWkGuaiMKjEeiJUzBoFe3mXFUOP
         NwuWRrZoyTq3Kc1pqgI05yzhAV2oeABcQJw6gfbVrb5aShh4mGmcC284tjCjRD9k/UWQ
         3XiIDf2CxFGU+MFAfFLlvmfzqI/iDg7P3Z9ognnGUe/r2PyKNLCYVbpsiAl8gY7Iu6HT
         oXZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqHLrNLOhBlHObFoXUiuMrCa8V1aGd2UOOV5GogXr/xIyrTlBbWGU3hdUxkm/DzkW8blnSzlQUSkZ26d4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzRWCmu5OTsP3ko9WfB42vNy5HRIIT+bMi4OS+Lz+Mb2iNulzBw
	qgUibr8gGCFnuKydkRtTeB73sOOQDtM5Ntr7fECAOcCDDn7zijSCnufhoJCht9tn+QSUZ4NZC72
	YjtwfZQ8NieP9zFX17f4fGmFXNwiPrxyJWXj2YB5hZZcfZMi8JYd+W0Be3RUylEQ=
X-Received: by 2002:a5d:5f88:0:b0:37c:d179:2f77 with SMTP id ffacd0b85a97d-37d0e6bc9f8mr10618945f8f.12.1728395449025;
        Tue, 08 Oct 2024 06:50:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPGcuh7LT/fL7mV+LBdDFv+cetxVNFifhM9W983OFP8K5hhjwy2yDaqbTm0hLUmw/qyAhdkw==
X-Received: by 2002:a5d:5f88:0:b0:37c:d179:2f77 with SMTP id ffacd0b85a97d-37d0e6bc9f8mr10618915f8f.12.1728395448532;
        Tue, 08 Oct 2024 06:50:48 -0700 (PDT)
Received: from [192.168.3.141] (p4ff2353a.dip0.t-ipconnect.de. [79.242.53.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4304efc0460sm20598045e9.1.2024.10.08.06.50.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Oct 2024 06:50:48 -0700 (PDT)
Message-ID: <83eb128e-4f06-4725-a843-a4563f246a44@redhat.com>
Date: Tue, 8 Oct 2024 15:50:46 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/2] cma: Fix CMA_MIN_ALIGNMENT_BYTES during early_init
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Cc: linux-mm@kvack.org, Sourabh Jain <sourabhjain@linux.ibm.com>,
 Hari Bathini <hbathini@linux.ibm.com>, Zi Yan <ziy@nvidia.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Donet Tom <donettom@linux.vnet.ibm.com>, LKML
 <linux-kernel@vger.kernel.org>, Sachin P Bappalige <sachinpb@linux.ibm.com>
References: <c1e66d3e69c8d90988c02b84c79db5d9dd93f053.1728386179.git.ritesh.list@gmail.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <c1e66d3e69c8d90988c02b84c79db5d9dd93f053.1728386179.git.ritesh.list@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 08.10.24 15:27, Ritesh Harjani (IBM) wrote:
> During early init CMA_MIN_ALIGNMENT_BYTES can be PAGE_SIZE,
> since pageblock_order is still zero and it gets initialized
> later during paging_init() e.g.
> paging_init() -> free_area_init() -> set_pageblock_order().
> 
> One such use case is -
> early_setup() -> early_init_devtree() -> fadump_reserve_mem()
> 
> This causes CMA memory alignment check to be bypassed in
> cma_init_reserved_mem(). Then later cma_activate_area() can hit
> a VM_BUG_ON_PAGE(pfn & ((1 << order) - 1)) if the reserved memory
> area was not pageblock_order aligned.
> 
> Instead of fixing it locally for fadump case on PowerPC, I believe
> this should be fixed for CMA_MIN_ALIGNMENT_BYTES.

I think we should add a way to catch the usage of 
CMA_MIN_ALIGNMENT_BYTES before it actually has meaning (before 
pageblock_order was set) and fix the PowerPC usage by reshuffling the 
code accordingly.

-- 
Cheers,

David / dhildenb


