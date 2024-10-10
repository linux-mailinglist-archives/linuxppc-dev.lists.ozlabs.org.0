Return-Path: <linuxppc-dev+bounces-1915-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8D9997B32
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 05:23:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPFSh2yXyz2yY9;
	Thu, 10 Oct 2024 14:23:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::434"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728530580;
	cv=none; b=FRk308rne3OEkXUV461QsXoGXd/EImTSe3K0VKKNqUsJj/AKK6Qn2Fhq3KVWDYU6Xp6si6HtsFEh1jNbylA1rn8HpEU5K6xZ9uFt0SYJ14ahco4U6qduE8bOjvTydUWb7DqH4RbAGzyGKVm43n8D5FkoTyp1oLYrItdQwvM0dqLGmB2NcGrfpyZyL8Wpwxelhlu0SXFHLQWj9Y1xx4MFJzja46BlHrZinHJeL1gy4pwZ5L6JtPpkQfLCcpKhs9BUmo6mjAQS85JX83bVVSuocKvEON/ibnORq/9OOcv1GdRVZrPlco1N/bKSoAKpMbrBuUxjid+F2YKJqPCaq0ahfg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728530580; c=relaxed/relaxed;
	bh=pMGHgPkDyEzZscZF6jcbqFePhT4l3FTSkWuwbpzJ1+w=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=j28CYypqRsWrk+KS2es0nZOmanI+11zDuFmMLZu58CHwwFqhpx/5rLKZX+nNEmteAXhs2Io49Wm02suucV+lssI+TIVkfFHC0xnutAvDTQfvTnkXydNiEaQu3TQSXdreJCPXO5SUDlfjbUicZG7Dl3QfHpNt/RdQV1XMXENYEUN1WDI9H1RAcMqcmTUAsE+9wm6U0JhkDBKNT0VBu3C2KDYaFsd9PnvGGDx6ukqoiVv5v6mBNU7jVHIf/DVYnSGLZYQyX4n8p+6l5vcQpV/ZAbU6nLvfCqZJqsVAzh6/52Zjq/tXnEMZtBv3O3u2z0U8kibQQh4N/N7pL5eWfyxJ7w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TXcu/QXw; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TXcu/QXw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPFSc1bBFz2yF0
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 14:22:55 +1100 (AEDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-71e038f3835so487038b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 09 Oct 2024 20:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728530571; x=1729135371; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pMGHgPkDyEzZscZF6jcbqFePhT4l3FTSkWuwbpzJ1+w=;
        b=TXcu/QXwpsHkfvCJMm6npegOV1xooLxsKOKUGMFI4PhX74R1tsOFqe/aSkgJ9+ryqo
         neEcKjd0zKhoZoA7faxEmdGFsiN78qlNDA6nQDKvG20JEUm54gAIwOOmeRjLuabGn1BU
         RfE/2c97QL50DZcP22h5QIVMYT4fL7GAjP/1ohwnYlAz8MDxCVrNaL0etX5LGhVjmqDq
         ab1RTgGUCZKjmKK6+TtzMzS+Lsdm163QZNZKgnE6vaLAr1C5mSekb9aL8Oc7+3EeCWRI
         X8JehhbhfGpEF9cmZ2+cQvweDCCJF82EkhNBAbmLvHIjdUzg+ah5xEG6iS4a3aPhofqE
         GRmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728530571; x=1729135371;
        h=references:message-id:date:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pMGHgPkDyEzZscZF6jcbqFePhT4l3FTSkWuwbpzJ1+w=;
        b=Tx+EXYOStoB3Xi20KG6ZPPoz43XAgheyKUqJ5KHmVY9z/ZBK833olKV9u/IyiNgUfx
         K+0odeIUIl3zxaOUnT+6iuDENMhvn0vkyoxHGOOYU5iXd/TmiF8IXIfViSOTuR8mExeA
         UsJzMiGLIQJYEY/XtZlqVxiSMnMJgrS8TycfGV24PREbqUVlif5uwhLJWLS05TC0/5oi
         ekVBzQKqDzQA5Ew8B5anq2K1V9FY3yxx2uyMFITxWdsr8t2UuWHYuY55t+YANc/VqiEV
         NRfqvl7xsejdpjIrr5v6jxPgD35WGIHwOB39lgFARLnMXp2ClbMzdhqGSPr50q91Yddj
         oCsw==
X-Forwarded-Encrypted: i=1; AJvYcCVk63jKgpmutBKrHf7LuriUldqQu/3Bhoj78iiuOuWRgheMH6lapEjKl/KqmmZJZ1hWIIMYIBakA1H29vg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyv5nMNxeZHMpJAiL3QvjBcIMSW7uH5HsVUfKCW2Kq4d6mKO80d
	SwDHh2rZDc0b/pMEiSKEV8skVVN0rCcQ141IfrkieJpOqo66xF9Y
X-Google-Smtp-Source: AGHT+IHbBrqfu0Zcv35UYFiQjcDYlwOYSZxjVbr4xyKtGlQh0hDzWB/1JzAP7WH7yyIXJjNQGa33AQ==
X-Received: by 2002:a05:6a00:2292:b0:717:87af:fca0 with SMTP id d2e1a72fcca58-71e1daadf11mr7065478b3a.0.1728530571070;
        Wed, 09 Oct 2024 20:22:51 -0700 (PDT)
Received: from dw-tp ([171.76.87.188])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e2a9f54b4sm157141b3a.73.2024.10.09.20.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 20:22:50 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org
Cc: linux-mm@kvack.org, Sourabh Jain <sourabhjain@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>, Zi Yan <ziy@nvidia.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Madhavan Srinivasan <maddy@linux.ibm.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Donet Tom <donettom@linux.vnet.ibm.com>, LKML <linux-kernel@vger.kernel.org>, Sachin P Bappalige <sachinpb@linux.ibm.com>
Subject: Re: [RFC 1/2] cma: Fix CMA_MIN_ALIGNMENT_BYTES during early_init
In-Reply-To: <83eb128e-4f06-4725-a843-a4563f246a44@redhat.com>
Date: Thu, 10 Oct 2024 08:49:20 +0530
Message-ID: <871q0ofxvr.fsf@gmail.com>
References: <c1e66d3e69c8d90988c02b84c79db5d9dd93f053.1728386179.git.ritesh.list@gmail.com> <83eb128e-4f06-4725-a843-a4563f246a44@redhat.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>

David Hildenbrand <david@redhat.com> writes:

> On 08.10.24 15:27, Ritesh Harjani (IBM) wrote:
>> During early init CMA_MIN_ALIGNMENT_BYTES can be PAGE_SIZE,
>> since pageblock_order is still zero and it gets initialized
>> later during paging_init() e.g.
>> paging_init() -> free_area_init() -> set_pageblock_order().
>> 
>> One such use case is -
>> early_setup() -> early_init_devtree() -> fadump_reserve_mem()
>> 
>> This causes CMA memory alignment check to be bypassed in
>> cma_init_reserved_mem(). Then later cma_activate_area() can hit
>> a VM_BUG_ON_PAGE(pfn & ((1 << order) - 1)) if the reserved memory
>> area was not pageblock_order aligned.
>> 
>> Instead of fixing it locally for fadump case on PowerPC, I believe
>> this should be fixed for CMA_MIN_ALIGNMENT_BYTES.
>
> I think we should add a way to catch the usage of 
> CMA_MIN_ALIGNMENT_BYTES before it actually has meaning (before 
> pageblock_order was set)

Maybe by enforcing that the pageblock_order should not be zero where we
do the alignment check then?

i.e. in cma_init_reserved_mem() 

diff --git a/mm/cma.c b/mm/cma.c
index 3e9724716bad..36d753e7a0bf 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -182,6 +182,15 @@ int __init cma_init_reserved_mem(phys_addr_t base, phys_addr_t size,
        if (!size || !memblock_is_region_reserved(base, size))
                return -EINVAL;

+       /*
+        * CMA uses CMA_MIN_ALIGNMENT_BYTES as alignment requirement which
+        * needs pageblock_order to be initialized. Let's enforce it.
+        */
+       if (!pageblock_order) {
+               pr_err("pageblock_order not yet initialized. Called during early boot?\n");
+               return -EINVAL;
+       }
+
        /* ensure minimal alignment required by mm core */
        if (!IS_ALIGNED(base | size, CMA_MIN_ALIGNMENT_BYTES))
                return -EINVAL;


> and fix the PowerPC usage by reshuffling the 
> code accordingly.

Ok. I will submit a v2 with the above patch incldued.

Thanks for the review!
-ritesh

