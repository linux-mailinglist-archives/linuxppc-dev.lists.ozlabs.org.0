Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CE28511C2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 12:06:50 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=R1Fuigbi;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=R1Fuigbi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYM943K6Wz3dV6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 22:06:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=R1Fuigbi;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=R1Fuigbi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TYM8J6q04z3bw9
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Feb 2024 22:06:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707735965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=7FqoqAesIGcQo2dISuvlgJNiDoSjW2RZdVRhvlHXipo=;
	b=R1Fuigbiuza7ZjqtiJ4y0oRyhkH8tj4pfZFHxWFC+i4fZb2dE7+s67LZFrKtznXo/Tb/nM
	Nd999GJYcOLKSDKF7DqpPlIKcRlQ1EMmeh1qrHhyhFVFopgHz6L0BDsSxl3eLJSF1fmmyP
	7FuhX++Rk15t/EhA6E03kd/6RbxKm5A=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707735965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=7FqoqAesIGcQo2dISuvlgJNiDoSjW2RZdVRhvlHXipo=;
	b=R1Fuigbiuza7ZjqtiJ4y0oRyhkH8tj4pfZFHxWFC+i4fZb2dE7+s67LZFrKtznXo/Tb/nM
	Nd999GJYcOLKSDKF7DqpPlIKcRlQ1EMmeh1qrHhyhFVFopgHz6L0BDsSxl3eLJSF1fmmyP
	7FuhX++Rk15t/EhA6E03kd/6RbxKm5A=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-62-RsgsOLNTM8KtmchkaEEGlw-1; Mon, 12 Feb 2024 06:06:03 -0500
X-MC-Unique: RsgsOLNTM8KtmchkaEEGlw-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-40e40126031so19451985e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Feb 2024 03:06:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707735962; x=1708340762;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:from:content-language:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7FqoqAesIGcQo2dISuvlgJNiDoSjW2RZdVRhvlHXipo=;
        b=n5jdktmxt+/29qvdvwIWBv3A9SIVoZwVrrnIyCTh1I4/HRi6ZFNGEJQNcAAA202Akc
         bMru1A1pyRIgaGumTVIIorcD1mlFUHlQpqysSxat8mnT6A2ORBLKka2jcmlu2CrNwZL+
         v1A65ckFXi6VHp4lXH2I8KHv5MdVsuiTyUx9LPIwCF8xFRgR5U/rah6UfKYCF7jkXrnP
         I0k/kPpTBnWgds94Oywac/FrlLvUhTCHyCqElY0JwZCKjBy2mGlHp05AZAL761B48kKD
         +KW4rRGIiMSu3pIlQPPsXPQxAaVZGlz2ryn6gDkVSOWN/uh7xcQO9BaagfkEAP7AWaTk
         bA/w==
X-Forwarded-Encrypted: i=1; AJvYcCVF5WZGFOVQDTmh5GKKcWuXXKyr5T2M4uZHY7xGY+iXOmY04MpcGDYJPCo79IxPs5c9RFcrYyWbTN6V0jfVmd3JuA9KiFx2r+xFy+Fp4g==
X-Gm-Message-State: AOJu0YyJgwxcuvmrOTVfW0PvvXyWnGkEOxMsUY+ljGgdU118fjT9D4c9
	qqj8RKh5fkE+bRTDZhyRFDY+RD8lMhv7z7XwvyTiSpWoWjbmjzsFLa+puEVamyiiYH40zo9/e3W
	RpoGsAD4p81XgNTpBPc5XZIHWqU32QzVUIUTB/xhVed68Zm88QhXCk3m98WmbbvE=
X-Received: by 2002:a05:600c:4f51:b0:40f:b164:a415 with SMTP id m17-20020a05600c4f5100b0040fb164a415mr4095903wmq.25.1707735962322;
        Mon, 12 Feb 2024 03:06:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEb3whbUDNAx+XiP6uqByXUY70xbuTJym3UumyKe/MA+jY3HBbtBWUPQh3CjaxoVhB4AEqTCg==
X-Received: by 2002:a05:600c:4f51:b0:40f:b164:a415 with SMTP id m17-20020a05600c4f5100b0040fb164a415mr4095877wmq.25.1707735961864;
        Mon, 12 Feb 2024 03:06:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW/3mB3OIvvP8bX+P7e7eWVj5uYZGyVMgw/IzavGZ+D1i8US4/QvC5WKS/MSTgoUaukNqqv2li04fZJd55hE3TbJvx3qpBC9gw/QggqAKcSCfrWoGp+jPQ//8YUkdI5QvwGN3qFueK3H1vqd0sWfU1EXvf2JGivZCpPGqHQ8RN+U5QMpbHLLpq0OWO/VtISOR/8S4GJVGheRarJ7jUYpcFfpUN4iHzMNKH0SJoHPGpus2zGsjSymUPgXSzXrIN0JrmO6roTnKlDGhONqEEcdAeLOXdtW3pqxeaD1wdIYRWdi7/2aWmCSPC3Xnj3dWUigFRQSss0tU1Y3zhO+nQSym8eWbCoKj8L6Fo6BTQf+dSi8WYSNUlNyOaLjd1oXEzmcavQde1w/MXJ4iWaG+WDUSd7P9w++O3ASeE85082QYrqLiY7/9G0TTP8W5FlBxwzIdlkXLnCPJXGcGtFHYCPY0qLiZ2BmHNdsV9DnvitoK7kcHzpsTGRpgtN+3lu0Fj4KH5aneB/Wj25155cZWA3kNMOQ3Y4+Z69uyXDf5ZTDmy18EYBM3BC1NaSKNSQ0uRv97g1GpiLrYp9GeDopNG8v2W8D2XtirlxAe42+YZS/D0tLgbr00+j1XibBmjx3QdGHJyOHkMvYHwv4i2HrZB8MdLiLlSIU3XWRPMQ/bgIE6KVgnt6Staya3pDnbyl+GW6mf5DkAvoEsPPED0dfIeyZEDDRwgt9aWZrfWy/19wL1//M1DnMfQ=
Received: from ?IPV6:2003:cb:c730:2200:7229:83b1:524e:283a? (p200300cbc7302200722983b1524e283a.dip0.t-ipconnect.de. [2003:cb:c730:2200:7229:83b1:524e:283a])
        by smtp.gmail.com with ESMTPSA id r2-20020a056000014200b0033b4acb999dsm6436120wrx.98.2024.02.12.03.06.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 03:06:01 -0800 (PST)
Message-ID: <66ca6c58-1983-494f-b920-140be736f1d8@redhat.com>
Date: Mon, 12 Feb 2024 12:05:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/10] mm/mmu_gather: improve cond_resched() handling
 with large folios and expensive page freeing
From: David Hildenbrand <david@redhat.com>
To: Ryan Roberts <ryan.roberts@arm.com>, linux-kernel@vger.kernel.org
References: <20240209221509.585251-1-david@redhat.com>
 <20240209221509.585251-10-david@redhat.com>
 <f1578e92-4de0-4718-bf79-ec29e9a19fe0@arm.com>
 <6c66f7ca-4b14-4bbb-bf06-e81b3481b03f@redhat.com>
 <590946ad-a538-4c99-947f-93455c2d96c6@arm.com>
 <e6774e16-90c0-4fba-9b9c-98de803fc920@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <e6774e16-90c0-4fba-9b9c-98de803fc920@redhat.com>
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
Cc: Michal Hocko <mhocko@suse.com>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, linux-mm@kvack.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>, Matthew Wilcox <willy@infradead.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>, Nick Piggin <npiggin@gmail.com>, Yin Fengwei <fengwei.yin@intel.com>, Sven Schnelle <svens@linux.ibm.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12.02.24 11:56, David Hildenbrand wrote:
> On 12.02.24 11:32, Ryan Roberts wrote:
>> On 12/02/2024 10:11, David Hildenbrand wrote:
>>> Hi Ryan,
>>>
>>>>> -static void tlb_batch_pages_flush(struct mmu_gather *tlb)
>>>>> +static void __tlb_batch_free_encoded_pages(struct mmu_gather_batch *batch)
>>>>>     {
>>>>> -    struct mmu_gather_batch *batch;
>>>>> -
>>>>> -    for (batch = &tlb->local; batch && batch->nr; batch = batch->next) {
>>>>> -        struct encoded_page **pages = batch->encoded_pages;
>>>>> +    struct encoded_page **pages = batch->encoded_pages;
>>>>> +    unsigned int nr, nr_pages;
>>>>>     +    /*
>>>>> +     * We might end up freeing a lot of pages. Reschedule on a regular
>>>>> +     * basis to avoid soft lockups in configurations without full
>>>>> +     * preemption enabled. The magic number of 512 folios seems to work.
>>>>> +     */
>>>>> +    if (!page_poisoning_enabled_static() && !want_init_on_free()) {
>>>>
>>>> Is the performance win really worth 2 separate implementations keyed off this?
>>>> It seems a bit fragile, in case any other operations get added to free which are
>>>> proportional to size in future. Why not just always do the conservative version?
>>>
>>> I really don't want to iterate over all entries on the "sane" common case. We
>>> already do that two times:
>>>
>>> a) free_pages_and_swap_cache()
>>>
>>> b) release_pages()
>>>
>>> Only the latter really is required, and I'm planning on removing the one in (a)
>>> to move it into (b) as well.
>>>
>>> So I keep it separate to keep any unnecessary overhead to the setups that are
>>> already terribly slow.
>>>
>>> No need to iterate a page full of entries if it can be easily avoided.
>>> Especially, no need to degrade the common order-0 case.
>>
>> Yeah, I understand all that. But given this is all coming from an array, (so
>> easy to prefetch?) and will presumably all fit in the cache for the common case,
>> at least, so its hot for (a) and (b), does separating this out really make a
>> measurable performance difference? If yes then absolutely this optimizaiton
>> makes sense. But if not, I think its a bit questionable.
> 
> I primarily added it because
> 
> (a) we learned that each cycle counts during mmap() just like it does
> during fork().
> 
> (b) Linus was similarly concerned about optimizing out another batching
> walk in c47454823bd4 ("mm: mmu_gather: allow more than one batch of
> delayed rmaps"):
> 
> "it needs to walk that array of pages while still holding the page table
> lock, and our mmu_gather infrastructure allows for batching quite a lot
> of pages.  We may have thousands on pages queued up for freeing, and we
> wanted to walk only the last batch if we then added a dirty page to the
> queue."
> 
> So if it matters enough for reducing the time we hold the page table
> lock, it surely adds "some" overhead in general.
> 
> 
>>
>> You're the boss though, so if your experience tells you this is neccessary, then
>> I'm ok with that.
> 
> I did not do any measurements myself, I just did that intuitively as
> above. After all, it's all pretty straight forward (keeping the existing
> logic, we need a new one either way) and not that much code.
> 
> So unless there are strong opinions, I'd just leave the common case as
> it was, and the odd case be special.

I think we can just reduce the code duplication easily:

diff --git a/mm/mmu_gather.c b/mm/mmu_gather.c
index d175c0f1e2c8..99b3e9408aa0 100644
--- a/mm/mmu_gather.c
+++ b/mm/mmu_gather.c
@@ -91,18 +91,21 @@ void tlb_flush_rmaps(struct mmu_gather *tlb, struct vm_area_struct *vma)
  }
  #endif
  
-static void tlb_batch_pages_flush(struct mmu_gather *tlb)
-{
-	struct mmu_gather_batch *batch;
+/*
+ * We might end up freeing a lot of pages. Reschedule on a regular
+ * basis to avoid soft lockups in configurations without full
+ * preemption enabled. The magic number of 512 folios seems to work.
+ */
+#define MAX_NR_FOLIOS_PER_FREE		512
  
-	for (batch = &tlb->local; batch && batch->nr; batch = batch->next) {
-		struct encoded_page **pages = batch->encoded_pages;
+static void __tlb_batch_free_encoded_pages(struct mmu_gather_batch *batch)
+{
+	struct encoded_page **pages = batch->encoded_pages;
+	unsigned int nr, nr_pages;
  
-		while (batch->nr) {
-			/*
-			 * limit free batch count when PAGE_SIZE > 4K
-			 */
-			unsigned int nr = min(512U, batch->nr);
+	while (batch->nr) {
+		if (!page_poisoning_enabled_static() && !want_init_on_free()) {
+			nr = min(MAX_NR_FOLIOS_PER_FREE, batch->nr);
  
  			/*
  			 * Make sure we cover page + nr_pages, and don't leave
@@ -111,14 +114,39 @@ static void tlb_batch_pages_flush(struct mmu_gather *tlb)
  			if (unlikely(encoded_page_flags(pages[nr - 1]) &
  				     ENCODED_PAGE_BIT_NR_PAGES_NEXT))
  				nr++;
+		} else {
+			/*
+			 * With page poisoning and init_on_free, the time it
+			 * takes to free memory grows proportionally with the
+			 * actual memory size. Therefore, limit based on the
+			 * actual memory size and not the number of involved
+			 * folios.
+			 */
+			for (nr = 0, nr_pages = 0;
+			     nr < batch->nr && nr_pages < MAX_NR_FOLIOS_PER_FREE;
+			     nr++) {
+				if (unlikely(encoded_page_flags(pages[nr]) &
+					     ENCODED_PAGE_BIT_NR_PAGES_NEXT))
+					nr_pages += encoded_nr_pages(pages[++nr]);
+				else
+					nr_pages++;
+			}
+		}
  
-			free_pages_and_swap_cache(pages, nr);
-			pages += nr;
-			batch->nr -= nr;
+		free_pages_and_swap_cache(pages, nr);
+		pages += nr;
+		batch->nr -= nr;
  
-			cond_resched();
-		}
+		cond_resched();
  	}
+}
+
+static void tlb_batch_pages_flush(struct mmu_gather *tlb)
+{
+	struct mmu_gather_batch *batch;
+
+	for (batch = &tlb->local; batch && batch->nr; batch = batch->next)
+		__tlb_batch_free_encoded_pages(batch);
  	tlb->active = &tlb->local;
  }
  
-- 
2.43.0


-- 
Cheers,

David / dhildenb

