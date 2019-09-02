Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D46EA597E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2019 16:37:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MXjY2m4LzDq6l
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 00:37:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="OwysBwWB"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46MXcV2F6nzDqTK
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2019 00:32:57 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id q21so4048130pfn.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Sep 2019 07:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=7KTrdItVhsmDUyDggdvNWAkcifUfR9oLU9QTC4MXwVE=;
 b=OwysBwWBhAFJooEe68fXdIvv4V+cnKggsrlbqAeXs+dqEcl+QhGbcO5oMMRvzRoGRC
 7iS0t1CjmmNIOidW8RdA+pFVSb6cK4kr0eVSanNg4sE49DePUje7xpSa/T9xkUG38qOn
 SaWaorLUSS7vNGVB86NunS287AAXQBvgjmjWc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=7KTrdItVhsmDUyDggdvNWAkcifUfR9oLU9QTC4MXwVE=;
 b=RIWBpgGag4CK+d461ii1ugpZaSJM8ba7wL9aktDLOYuTwH9hgy9slMbR3uVMN7mwzt
 HVxBo/dnuEd17WUCKTPe5TI4MY7ycD0MgFb5gnQl8TT8DMTBaWcCXhoh7tWwQT4k9pyx
 4ppFl7xq3GngGk9KgFu5bfJ/2n7l0L39boFQVwh1W8T0vIjjs9Qaul8pLIf8llpoVMh4
 RYggpseI+PVpl+sMLN+3IujT8GQFdIuZmVpTIMkM2zwcq6JPWmzPbRLSZc0gAA/lJZob
 gknnx5VaCjdK4mLwfbCfzaaGszEB1SBf8ucDtTlKr4nT0FNk6C3pRpCrqxl0ulURudBK
 GksQ==
X-Gm-Message-State: APjAAAWL06DbjTVaYyS+9S5wffVVfmelfPGg5PLkAT6UFgkBXB64z66u
 PBR5NmX+XX2KY3fZnddl2vOnCg==
X-Google-Smtp-Source: APXvYqw0WWTZFkrdOvkT8Sl055md9Tbaxub+/8kS6b9Z6Yj3wpO+k566Ql1RaoX0X7zqvkboABLXVw==
X-Received: by 2002:a62:37c5:: with SMTP id
 e188mr35417324pfa.207.1567434773580; 
 Mon, 02 Sep 2019 07:32:53 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net.
 [59.167.251.205])
 by smtp.gmail.com with ESMTPSA id s186sm19233794pfb.126.2019.09.02.07.32.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2019 07:32:52 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v6 1/5] kasan: support backing vmalloc space with real
 shadow memory
In-Reply-To: <20190902132220.GA9922@lakrids.cambridge.arm.com>
References: <20190902112028.23773-1-dja@axtens.net>
 <20190902112028.23773-2-dja@axtens.net>
 <20190902132220.GA9922@lakrids.cambridge.arm.com>
Date: Tue, 03 Sep 2019 00:32:49 +1000
Message-ID: <87pnkiu5ta.fsf@dja-thinkpad.axtens.net>
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
Cc: gor@linux.ibm.com, x86@kernel.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-mm@kvack.org, glider@google.com,
 luto@kernel.org, aryabinin@virtuozzo.com, linuxppc-dev@lists.ozlabs.org,
 dvyukov@google.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Mark,

>> +static int kasan_depopulate_vmalloc_pte(pte_t *ptep, unsigned long addr,
>> +					void *unused)
>> +{
>> +	unsigned long page;
>> +
>> +	page = (unsigned long)__va(pte_pfn(*ptep) << PAGE_SHIFT);
>> +
>> +	spin_lock(&init_mm.page_table_lock);
>> +
>> +	if (likely(!pte_none(*ptep))) {
>> +		pte_clear(&init_mm, addr, ptep);
>> +		free_page(page);
>> +	}
>> +	spin_unlock(&init_mm.page_table_lock);
>> +
>> +	return 0;
>> +}
>
> There needs to be TLB maintenance after unmapping the page, but I don't
> see that happening below.
>
> We need that to ensure that errant accesses don't hit the page we're
> freeing and that new mappings at the same VA don't cause a TLB conflict
> or TLB amalgamation issue.

Darn it, I knew there was something I forgot to do! I thought of that
over the weekend, didn't write it down, and then forgot it when I went
to respin the patches. You're totally right.

>
>> +/*
>> + * Release the backing for the vmalloc region [start, end), which
>> + * lies within the free region [free_region_start, free_region_end).
>> + *
>> + * This can be run lazily, long after the region was freed. It runs
>> + * under vmap_area_lock, so it's not safe to interact with the vmalloc/vmap
>> + * infrastructure.
>> + */
>
> IIUC we aim to only free non-shared shadow by aligning the start
> upwards, and aligning the end downwards. I think it would be worth
> mentioning that explicitly in the comment since otherwise it's not
> obvious how we handle races between alloc/free.
>

Oh, I will need to think through that more carefully.

I think the vmap_area_lock protects us against alloc/free races. I think
alignment operates at least somewhat as you've described, and while it
is important for correctness, I'm not sure I'd say it prevented races? I
will double check my understanding of vmap_area_lock, and I agree the
comment needs to be much clearer.

Once again, thanks for your patience and thoughtful review.

Regards,
Daniel

> Thanks,
> Mark.
>
>> +void kasan_release_vmalloc(unsigned long start, unsigned long end,
>> +			   unsigned long free_region_start,
>> +			   unsigned long free_region_end)
>> +{
>> +	void *shadow_start, *shadow_end;
>> +	unsigned long region_start, region_end;
>> +
>> +	/* we start with shadow entirely covered by this region */
>> +	region_start = ALIGN(start, PAGE_SIZE * KASAN_SHADOW_SCALE_SIZE);
>> +	region_end = ALIGN_DOWN(end, PAGE_SIZE * KASAN_SHADOW_SCALE_SIZE);
>> +
>> +	/*
>> +	 * We don't want to extend the region we release to the entire free
>> +	 * region, as the free region might cover huge chunks of vmalloc space
>> +	 * where we never allocated anything. We just want to see if we can
>> +	 * extend the [start, end) range: if start or end fall part way through
>> +	 * a shadow page, we want to check if we can free that entire page.
>> +	 */
>> +
>> +	free_region_start = ALIGN(free_region_start,
>> +				  PAGE_SIZE * KASAN_SHADOW_SCALE_SIZE);
>> +
>> +	if (start != region_start &&
>> +	    free_region_start < region_start)
>> +		region_start -= PAGE_SIZE * KASAN_SHADOW_SCALE_SIZE;
>> +
>> +	free_region_end = ALIGN_DOWN(free_region_end,
>> +				     PAGE_SIZE * KASAN_SHADOW_SCALE_SIZE);
>> +
>> +	if (end != region_end &&
>> +	    free_region_end > region_end)
>> +		region_end += PAGE_SIZE * KASAN_SHADOW_SCALE_SIZE;
>> +
>> +	shadow_start = kasan_mem_to_shadow((void *)region_start);
>> +	shadow_end = kasan_mem_to_shadow((void *)region_end);
>> +
>> +	if (shadow_end > shadow_start)
>> +		apply_to_page_range(&init_mm, (unsigned long)shadow_start,
>> +				    (unsigned long)(shadow_end - shadow_start),
>> +				    kasan_depopulate_vmalloc_pte, NULL);
>> +}
