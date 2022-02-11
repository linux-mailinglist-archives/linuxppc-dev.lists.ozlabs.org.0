Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 134C94B2037
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 09:31:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jw6KC5PsBz3c7f
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 19:31:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=g8o0LIi+;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=g8o0LIi+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.129.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=g8o0LIi+; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=g8o0LIi+; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jw6JP69YKz3bY3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Feb 2022 19:30:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644568238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1gJ72HwgwloQbyW/vwhY0YZ8ZVfHSwHBLwFkNn6x/NM=;
 b=g8o0LIi+BqJLdJ1c7mWksu74JWBmk4dYwsRBN4dg/ipm9Xyqs/bbR9GudwGFVIMByy/etA
 InjKsRGg9P1z1NFJHQuXqURuzJZtd1zgKAAtQYOe7qW7teOWkkl+O+sAlJ4mbMefhRTosV
 f7ZxSJqi8h1Iyt3xYfhuOpt3BSe2U8c=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644568238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1gJ72HwgwloQbyW/vwhY0YZ8ZVfHSwHBLwFkNn6x/NM=;
 b=g8o0LIi+BqJLdJ1c7mWksu74JWBmk4dYwsRBN4dg/ipm9Xyqs/bbR9GudwGFVIMByy/etA
 InjKsRGg9P1z1NFJHQuXqURuzJZtd1zgKAAtQYOe7qW7teOWkkl+O+sAlJ4mbMefhRTosV
 f7ZxSJqi8h1Iyt3xYfhuOpt3BSe2U8c=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-581-z-RUJ1sNP1eefcP3Llgyrw-1; Fri, 11 Feb 2022 03:30:36 -0500
X-MC-Unique: z-RUJ1sNP1eefcP3Llgyrw-1
Received: by mail-wm1-f69.google.com with SMTP id
 c7-20020a1c3507000000b0034a0dfc86aaso5563423wma.6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Feb 2022 00:30:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=1gJ72HwgwloQbyW/vwhY0YZ8ZVfHSwHBLwFkNn6x/NM=;
 b=tZSGTpJJ6G/2UjLVuMZLhmMDRgvCFbEaQum3uA+rQjCwBV+rKnRMEo5eXZqTk0F9/J
 LTnTlToc+IjB+UctImL96uhTEW+VFOsHgwMXjNS14BJNj1Eatd9uPrJ0HsUuZOGRMuZl
 adrP26g0YYJA99JvhbLiT2gBKwVf3COisk4szDxR5OCHpSf/ZScpsXtt63w1Qi57PVKy
 3liWGihlpTIsPcvRlPMzgshh5VSjiST+bFAUWO8xjLC6FKheP25rdaaIhHxpO5roQ2jJ
 81eAtmz1MNVoZsr9pqOXhDZewpNlet8Xhz1YXwlSBPn7VfrEhtZiZxeGhnqibAODp3sZ
 E0ww==
X-Gm-Message-State: AOAM532gyo2K1lJBskVbg5cQChC4cskjL+/EX2qkZ+lhpyYVQ4t7hWrk
 syke8XeYj0Kypq+OhYT1djWrRNxqaVyrij3DxwqEh+2+mg9/8QWkbSnOberoCcfrapUasmOapLJ
 Kx8P6AnYYE4XkkTecepxb8geGbg==
X-Received: by 2002:a5d:498d:: with SMTP id r13mr450281wrq.172.1644568235285; 
 Fri, 11 Feb 2022 00:30:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx8vYMuvWnrR/SaDvk/g57avVr1I7SWjUg2k8YoUPkdLL+cOea0MwdJ7l0z+okSZQZnKgocSg==
X-Received: by 2002:a5d:498d:: with SMTP id r13mr450264wrq.172.1644568234967; 
 Fri, 11 Feb 2022 00:30:34 -0800 (PST)
Received: from ?IPV6:2003:cb:c70c:aa00:4cc6:d24a:90ae:8c1f?
 (p200300cbc70caa004cc6d24a90ae8c1f.dip0.t-ipconnect.de.
 [2003:cb:c70c:aa00:4cc6:d24a:90ae:8c1f])
 by smtp.gmail.com with ESMTPSA id t187sm3356998wma.22.2022.02.11.00.30.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Feb 2022 00:30:34 -0800 (PST)
Message-ID: <831ee5f6-8605-02d2-b7e5-543aec4857c3@redhat.com>
Date: Fri, 11 Feb 2022 09:30:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2] powerpc/mm: Update default hugetlb size early
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
References: <20220211065215.101767-1-aneesh.kumar@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220211065215.101767-1-aneesh.kumar@linux.ibm.com>
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
Cc: linux-mm@kvack.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11.02.22 07:52, Aneesh Kumar K.V wrote:
> commit: d9c234005227 ("Do not depend on MAX_ORDER when grouping pages by mobility")
> introduced pageblock_order which will be used to group pages better.
> The kernel now groups pages based on the value of HPAGE_SHIFT. Hence HPAGE_SHIFT
> should be set before we call set_pageblock_order.
> 
> set_pageblock_order happens early in the boot and default hugetlb page size
> should be initialized before that to compute the right pageblock_order value.
> 
> Currently, default hugetlbe page size is set via arch_initcalls which happens
> late in the boot as shown via the below callstack:
> 
> [c000000007383b10] [c000000001289328] hugetlbpage_init+0x2b8/0x2f8
> [c000000007383bc0] [c0000000012749e4] do_one_initcall+0x14c/0x320
> [c000000007383c90] [c00000000127505c] kernel_init_freeable+0x410/0x4e8
> [c000000007383da0] [c000000000012664] kernel_init+0x30/0x15c
> [c000000007383e10] [c00000000000cf14] ret_from_kernel_thread+0x5c/0x64
> 
> and the pageblock_order initialization is done early during the boot.
> 
> [c0000000018bfc80] [c0000000012ae120] set_pageblock_order+0x50/0x64
> [c0000000018bfca0] [c0000000012b3d94] sparse_init+0x188/0x268
> [c0000000018bfd60] [c000000001288bfc] initmem_init+0x28c/0x328
> [c0000000018bfe50] [c00000000127b370] setup_arch+0x410/0x480
> [c0000000018bfed0] [c00000000127401c] start_kernel+0xb8/0x934
> [c0000000018bff90] [c00000000000d984] start_here_common+0x1c/0x98
> 
> delaying default hugetlb page size initialization implies the kernel will
> initialize pageblock_order to (MAX_ORDER - 1) which is not an optimal
> value for mobility grouping. IIUC we always had this issue. But it was not
> a problem for hash translation mode because (MAX_ORDER - 1) is the same as
> HUGETLB_PAGE_ORDER (8) in the case of hash (16MB). With radix,
> HUGETLB_PAGE_ORDER will be 5 (2M size) and hence pageblock_order should be
> 5 instead of 8.


A related question: Can we on ppc still have pageblock_order > MAX_ORDER
- 1? We have some code for that and I am not so sure if we really need that.

-- 
Thanks,

David / dhildenb

