Return-Path: <linuxppc-dev+bounces-10052-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEAFAF5CDA
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jul 2025 17:26:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bXNyT0CGJz30Pn;
	Thu,  3 Jul 2025 01:25:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751469952;
	cv=none; b=oFixV6eei9i4XZGK59VTwwmfKxcupLM76UN669vvsSNya8CrTNeWFQSP/UMHMa66lh4t7SN7XFCiMemiYVhPh+a1R7q8blfxR4xZp9dCYt0U9YlBza8PpHS9PfkA+tJEETROHn1ySjHJBWog4a+APHSuvLtSBj8a6YoO2S1GJmQg6Sfg7aFxJelmt2AKCiUx4Xa2KTdpPk17UgcqJbPCLXKqAJBb0CNZIGikKdrNpeZRTaH7Fp+E7Arx8Mbl/nSlvzlvzNclEOW2OPTAvdC72WWEmgAUDkOnUefjsKWnieqVY/BIl40f3h2cta7ADFdT6LnTfXTn4ZCxKzEDMrcmjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751469952; c=relaxed/relaxed;
	bh=1zZV1K34K5vsU5bBEYqLthbNyfG8BgJV/i5Welf7t/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dB2yjRryOvgs1kn53SsjVpof7j3u9ZnDfO7aD1mrKLHk1TFl5u8YGtHZjtBHI+TgSDSjXb2EtxkBDZ9EBhsm1G83wBeFA3YZF/2gQlDDkDfRbmx+1pmFqVsoXYOTmFo2Ebu69mmrHQ00csjVg8PaZpqmsnIH9oEk9nuoaLDc/6Q3OMFi6UxqoZ3kSydr9sz4mjYhH08qoFIG3jW+QiI0h0I+Wx73p+re5WwXundXlqKoe/UPiCRp2sViDDOJscm7FVJlwjRNFJZEdiwX1EB+t8hndXBUW4Cx6g1Yo0SHG6GBM3JxhBUtNUq4AB3XRIHJX3WoEwhhzGqdOfnnqM+FTQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VFnDSHNu; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XBUScnnz; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VFnDSHNu;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XBUScnnz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bXNyR0N5pz30PF
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Jul 2025 01:25:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751469945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=1zZV1K34K5vsU5bBEYqLthbNyfG8BgJV/i5Welf7t/g=;
	b=VFnDSHNuwLNPEvqEJn7p0Gvkkrx4kHqe+suSZu70aYztl7IcZndFOlGCrJzIVETYEcmkEd
	HBP/OFcHBIH+cLicpB2IS1sdIIpkaHc/5oW3mtYdSbciPbFv6kNbUus4SoYCmpFQLo6dlO
	+iW72g91Y8y19OGbcEAXg2vADkXsEi4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751469946;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=1zZV1K34K5vsU5bBEYqLthbNyfG8BgJV/i5Welf7t/g=;
	b=XBUScnnzDGnPBMxHML+Cp5yaDlMX5HJ6H5u4TS2jjvCxfnzcWRuMFIUK7W4JbXi2jgAjSU
	B1l0eq55xx19oz9gY5HlcPJxlkN+Dw/LNu2xT88UaInScXy0cGvOEE2XEq1cLLZQFViNlY
	hiKrUEzc115D4aw3be1T+v2DCsvkukY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-691-QtvSyIizPp6oS-uuEi42Ag-1; Wed, 02 Jul 2025 11:25:43 -0400
X-MC-Unique: QtvSyIizPp6oS-uuEi42Ag-1
X-Mimecast-MFC-AGG-ID: QtvSyIizPp6oS-uuEi42Ag_1751469942
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a3696a0d3aso2203421f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Jul 2025 08:25:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751469942; x=1752074742;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1zZV1K34K5vsU5bBEYqLthbNyfG8BgJV/i5Welf7t/g=;
        b=wweKRJmPI2jlO18kIymv90qhwa1TuSnVObylyzwffxNuHc9ekTIMa+cJ374fDnjvAh
         693XJKnNoOO7QEUDIBbdDVCz3iuan45gGVSsoAlYDK0rjh2RbWkwSzqKEpzk1CHRQFMQ
         RUolWFZWv/LRJkg3MY8aUpmKeUh5Ot3sWwOzzfIIsYCWmZt+hW6wg3SRjTHVGdyyTV5S
         UoG0L9z451KnZKSu0iHDm+T/7oqIUPbdOgVZ2/4iutfavo0aSxLlCdSbrfJ53gSg4AWk
         D//u53ZNBCY2Q5ivLKb+sKVGbqB4W4aHYYeuaPIllsPampiFZTTsc5RRzepCIwZQ5xWx
         bUSA==
X-Forwarded-Encrypted: i=1; AJvYcCVVbieKf7XOcQmxUI3coIFu3VNTYeRDfIea3HLy852CGOeOFDMF3IubIXPVPU1zm7+PHv5dwWpcI7keHoc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwJpzufi2mw7Xe+KfR38FWtkNYJoYNyjZcM7FuQPP8R6wiKGYUV
	CH4PE9l0XTMrQmxmVU4givfd6hx6CXREDehYfaLGPoCnt0o1YE+3aLgDco9e6b99fL43fF+qkrY
	FiXyK5w6nE9FZTQGvOwV936FsU0NhwXoOMadP81ejrPB+jvk0qirVKD1Izh7IICRZ0oU=
X-Gm-Gg: ASbGncvse0khRf+wVvvqTN1XeVifyBY9apWgrwElIr0wA8xFLMFBftB21vGIcEwwxIA
	u6Aio8/M2FF6+oxPtnuh8Ofuj68HNlLUoGMW2reNBDx/ZeQHrwQFLGlzsAej3G1ES/6O+PY8sXT
	odqAGu0xGjA7KH6GHcYjszM8QyoQ+5eVY2Bun5j5oe8Be3TOQPsgxPjVOUcDTYYcHximOtNm14A
	t041FzcCC4sLKT6zGZj5Sc5paL4eKHjJ+NPo8vBmCWwtGZc19scu2wARooleBccjDY2Z14+NdQQ
	BjW5oLCT7ms3qcwnRwatWDT602Cq2H8qaMGf2xBuXBZBpMDGIeWFYII=
X-Received: by 2002:a05:6000:40cc:b0:3a5:2f23:3780 with SMTP id ffacd0b85a97d-3b1ffcd6a02mr2834573f8f.18.1751469942168;
        Wed, 02 Jul 2025 08:25:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsUNCCRvW2G8ERz1v+CzxV36sRx/sOGiOA5hGIRC55Fq8/UJikBoj+bsw3If92RbCTbdxtOA==
X-Received: by 2002:a05:6000:40cc:b0:3a5:2f23:3780 with SMTP id ffacd0b85a97d-3b1ffcd6a02mr2834527f8f.18.1751469941626;
        Wed, 02 Jul 2025 08:25:41 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e52ad2sm16118859f8f.48.2025.07.02.08.25.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 08:25:41 -0700 (PDT)
Message-ID: <e76b6a9d-b887-4790-a2fd-032648be99ff@redhat.com>
Date: Wed, 2 Jul 2025 17:25:38 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 20/29] mm: convert "movable" flag in page->mapping to a
 page flag
To: Harry Yoo <harry.yoo@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 virtualization@lists.linux.dev, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Minchan Kim <minchan@kernel.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Brendan Jackman <jackmanb@google.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 Peter Xu <peterx@redhat.com>, Xu Xin <xu.xin16@zte.com.cn>,
 Chengming Zhou <chengming.zhou@linux.dev>, Miaohe Lin
 <linmiaohe@huawei.com>, Naoya Horiguchi <nao.horiguchi@gmail.com>,
 Oscar Salvador <osalvador@suse.de>, Rik van Riel <riel@surriel.com>,
 Qi Zheng <zhengqi.arch@bytedance.com>, Shakeel Butt <shakeel.butt@linux.dev>
References: <20250630130011.330477-1-david@redhat.com>
 <20250630130011.330477-21-david@redhat.com> <aGUd34v-4S7eXojo@hyeyoo>
 <a533ae7e-f993-4673-bb00-ec9d10c11c83@redhat.com> <aGUtxakO8p_94rTl@hyeyoo>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aGUtxakO8p_94rTl@hyeyoo>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UCNe1VEA_x4jGP0_d_A4awZyQfn-F_24-G6Eoyev8Mc_1751469942
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 02.07.25 15:01, Harry Yoo wrote:
> On Wed, Jul 02, 2025 at 02:01:33PM +0200, David Hildenbrand wrote:
>> On 02.07.25 13:54, Harry Yoo wrote:
>>> On Mon, Jun 30, 2025 at 03:00:01PM +0200, David Hildenbrand wrote:
>>>> Instead, let's use a page flag. As the page flag can result in
>>>> false-positives, glue it to the page types for which we
>>>> support/implement movable_ops page migration.
>>>>
>>>> The flag reused by PageMovableOps() might be sued by other pages, so
>>>> warning in case it is set in page_has_movable_ops() might result in
>>>> false-positive warnings.
>>>>
>>>> Reviewed-by: Zi Yan <ziy@nvidia.com>
>>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>>> ---
>>>
>>> LGTM,
>>> Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
>>>
>>> With a question: is there any reason to change the page flag
>>> operations to use atomic bit ops?
>>
>> As we have the page lock in there, it's complicated. I thought about this
>> when writing that code, and was not able to convince myself that it is safe.
>>
>> But that was when I was prototyping and reshuffling patches, and we would
>> still have code that would clear the flag.
>   
>> Given that we only allow setting the flag, it might be okay to use the
>> non-atomic variant as long as there can be nobody racing with us when
>> modifying flags. Especially trying to lock the folio concurrently is the big
>> problem.
>>
>> In isolate_movable_ops_page(), there is a comment about checking the flag
>> before grabbing the page lock, so that should be handled.
> 
> Right.
> 
>> I'll have to check some other cases in balloon/zsmalloc code.
> 
> Okay, it's totally fine to go with atomic version and then
> switching back to non atomic ops when we're sure it's safe.
> 

I'll definitely do the following:

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 8b23a74963feb..5f2b570735852 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -1145,9 +1145,11 @@ PAGEFLAG(Isolated, isolated, PF_ANY);
   * the flag might be used in other context for other pages. Always use
   * page_has_movable_ops() instead.
   */
-PAGEFLAG(MovableOps, movable_ops, PF_NO_TAIL);
+TESTPAGEFLAG(MovableOps, movable_ops, PF_NO_TAIL);
+SETPAGEFLAG(MovableOps, movable_ops, PF_NO_TAIL);
  #else /* !CONFIG_MIGRATION */
-PAGEFLAG_FALSE(MovableOps, movable_ops);
+TESTPAGEFLAG_FALSE(MovableOps, movable_ops);
+SETPAGEFLAG_NOOP(MovableOps, movable_ops);
  #endif /* CONFIG_MIGRATION */
  
  /**

Because the flag must not get cleared.

There is no __SETPAGEFLAG_NOOP yet, unfortunately.
-- 
Cheers,

David / dhildenb


