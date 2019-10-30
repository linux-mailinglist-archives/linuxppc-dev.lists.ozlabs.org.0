Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BD2E9CB2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 14:54:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47390j2Y2QzF4KC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 00:53:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="NTwARt8G"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4738wR4XYdzF4H1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Oct 2019 00:50:12 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id q21so1007680plr.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2019 06:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=pb0XrKghyFZgq2oeDgc1vRiv8K2ZCa6MKROaXA8DqHQ=;
 b=NTwARt8GUFCdG5TLJcI8i9cPiC/uXK1HfVAmkF/Gi70bnHnieGDcLcKhO+TpHqC1fD
 x4C83BpfmUyDj8Rjo5KmeHlhXkrHNK0d01ZempNxNYWBY4EvFCzdf8V7F/HDhoG9uk2i
 sSv0amtdfi01NJeawZo9HWDVM2mJxLKzuZIuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=pb0XrKghyFZgq2oeDgc1vRiv8K2ZCa6MKROaXA8DqHQ=;
 b=EHK6cpNlFtg7oNlygztIPYEk6Hoe3hc0unIlIX4B3uV8GM9CNzTE6i4gNBPZAc5E3o
 +HQTS0jq8zSqs5lOkqqwvUeOsH4ku5OiXOzxO9eYI9ug9ORaQ0Bc/kzqiWPcTj0K+bLj
 JXbNZR/EAdSMRw/Jua9elxIEGT5Xu+MQh26tKVmzjoP1Mm5SciFrCj2GxuLY60t2TocE
 D/OEjQ8zAdikGdDQAhvnwUj/mHRErvLs9DM+Y395sRbkdyaZOtt5avJ7l/pjMEKHWzkP
 eDRJ2GRBTz0naDDeN/bLcxnrNL8vlYnc6Xw41lvODu2jiUoQL5KcB+ObuFTrDK+XyMmJ
 Xb4w==
X-Gm-Message-State: APjAAAWHaMdinukV+l+UWbQuqHU4wv/GHnEf57pvaQ4Zjv7Vf1hq9T5w
 FNh1tAWOzHnnDWupoOqMPmfWYQ==
X-Google-Smtp-Source: APXvYqxZKEVBxM1Ya92TQcJqH+4T3C4D/gFc7Fw6wdXNjsqrvLc0beAsZLlvhMi0VRPxusNFqNzDbA==
X-Received: by 2002:a17:902:760c:: with SMTP id
 k12mr102582pll.256.1572443409483; 
 Wed, 30 Oct 2019 06:50:09 -0700 (PDT)
Received: from localhost
 (2001-44b8-1113-6700-783a-2bb9-f7cb-7c3c.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:783a:2bb9:f7cb:7c3c])
 by smtp.gmail.com with ESMTPSA id e198sm35049pfh.83.2019.10.30.06.50.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2019 06:50:08 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Andrey Ryabinin <aryabinin@virtuozzo.com>, kasan-dev@googlegroups.com,
 linux-mm@kvack.org, x86@kernel.org, glider@google.com, luto@kernel.org,
 linux-kernel@vger.kernel.org, mark.rutland@arm.com, dvyukov@google.com,
 christophe.leroy@c-s.fr
Subject: Re: [PATCH v10 4/5] x86/kasan: support KASAN_VMALLOC
In-Reply-To: <a144eaca-d7e1-1a18-5975-bd0bfdb9450e@virtuozzo.com>
References: <20191029042059.28541-1-dja@axtens.net>
 <20191029042059.28541-5-dja@axtens.net>
 <a144eaca-d7e1-1a18-5975-bd0bfdb9450e@virtuozzo.com>
Date: Thu, 31 Oct 2019 00:50:05 +1100
Message-ID: <87sgnamjg2.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 gor@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Andrey Ryabinin <aryabinin@virtuozzo.com> writes:

> On 10/29/19 7:20 AM, Daniel Axtens wrote:
>> In the case where KASAN directly allocates memory to back vmalloc
>> space, don't map the early shadow page over it.
>> 
>> We prepopulate pgds/p4ds for the range that would otherwise be empty.
>> This is required to get it synced to hardware on boot, allowing the
>> lower levels of the page tables to be filled dynamically.
>> 
>> Acked-by: Dmitry Vyukov <dvyukov@google.com>
>> Signed-off-by: Daniel Axtens <dja@axtens.net>
>> 
>> ---
>
>> +static void __init kasan_shallow_populate_pgds(void *start, void *end)
>> +{
>> +	unsigned long addr, next;
>> +	pgd_t *pgd;
>> +	void *p;
>> +	int nid = early_pfn_to_nid((unsigned long)start);
>
> This doesn't make sense. start is not even a pfn. With linear mapping 
> we try to identify nid to have the shadow on the same node as memory. But 
> in this case we don't have memory or the corresponding shadow (yet),
> we only install pgd/p4d.
> I guess we could just use NUMA_NO_NODE.

Ah wow, that's quite the clanger on my part.

There are a couple of other invocations of early_pfn_to_nid in that file
that use an address directly, but at least they reference actual memory.
I'll send a separate patch to fix those up.

> The rest looks ok, so with that fixed:
>
> Reviewed-by: Andrey Ryabinin <aryabinin@virtuozzo.com>

Thanks heaps! I've fixed up the nit you identifed in the first patch,
and I agree that the last patch probably isn't needed. I'll respin the
series shortly.

Regards,
Daniel
