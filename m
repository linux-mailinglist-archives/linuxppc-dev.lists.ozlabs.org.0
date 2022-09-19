Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5C95BC3B5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Sep 2022 09:51:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWH115g8Vz3bhf
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Sep 2022 17:51:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IkX3gN4i;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IkX3gN4i;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IkX3gN4i;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IkX3gN4i;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWH0G4QG1z2xDN
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 17:50:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663573817;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i/iLQ4kdAhzUU0VWkseG+c5vX7QQyvDlfGs9j2AsJDU=;
	b=IkX3gN4iMoE45fXU6P1OwWTCIVHLBSwrw311FS9GL6HNdzOljMHNJcvHsVrB4aMxRGBaD3
	noHn4eQ4mKKHBX4y7Lb31aBjs5s6d5ioZDooG28QmRkTvPf1o3TKsOWk3rlgXtVtNk0hcN
	Iuw/VNW1TAgMfqB0BHhzhp/fuaHu9Y0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663573817;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i/iLQ4kdAhzUU0VWkseG+c5vX7QQyvDlfGs9j2AsJDU=;
	b=IkX3gN4iMoE45fXU6P1OwWTCIVHLBSwrw311FS9GL6HNdzOljMHNJcvHsVrB4aMxRGBaD3
	noHn4eQ4mKKHBX4y7Lb31aBjs5s6d5ioZDooG28QmRkTvPf1o3TKsOWk3rlgXtVtNk0hcN
	Iuw/VNW1TAgMfqB0BHhzhp/fuaHu9Y0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-460-oau48SmpO4SbVw3UguXQjw-1; Mon, 19 Sep 2022 03:50:15 -0400
X-MC-Unique: oau48SmpO4SbVw3UguXQjw-1
Received: by mail-wm1-f70.google.com with SMTP id e3-20020a05600c218300b003b4e4582006so263837wme.6
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 00:50:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=i/iLQ4kdAhzUU0VWkseG+c5vX7QQyvDlfGs9j2AsJDU=;
        b=KwWxWuponX/u0JsA5tW0IF2ALqWZNL2BGqch8fYeehdIlWe6XyYvTHGtcrj94UCC8a
         pUtr/8VdbWpiJtyndYeBaI4SLd+FAyqWzGamRJc007yuzy5L2nrmJu5FcXN9S9c9VAJ/
         soAoiIX4pjhnQij5u0a4V8XBHGVgPt7tMKke6p4+eitt2zdp0kpgy7qkHvA1pxdLi/dI
         w/mVdCoQg1ugPaMLq8ZlesbCBuwX+MX6261WMe6XJc4NmrOEoDfCnu8FNS+4WpQ7+rzB
         bSFbi/CjTyZmFbujl0x9pXRKmGvVP6Wn8G7AbVvNHQQcgW9lUpgAhC7dmv6SGtgFwIul
         eJxg==
X-Gm-Message-State: ACrzQf2fAca/LU6M+PnklhcoTEbN5O9O6TV9L+cgApg6ULGmr6hogh+v
	WtVsxIlVl0tiDjFCdBLJiiGw2qlLAA9q7cC31bkjoAk22n2IZbxYikyXOZE/mWOaZaONtstLCxR
	N1DB9D07rk5iXNGTzwt8JdylRqg==
X-Received: by 2002:adf:a50e:0:b0:22a:ede1:57e with SMTP id i14-20020adfa50e000000b0022aede1057emr5797008wrb.63.1663573814677;
        Mon, 19 Sep 2022 00:50:14 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM69yWPQ71p10ovzZwsnci+6il7uBFgZ4x37tHZjCyhjLk1+HnJ2naaRkgKbADZjLobyfndxig==
X-Received: by 2002:adf:a50e:0:b0:22a:ede1:57e with SMTP id i14-20020adfa50e000000b0022aede1057emr5796994wrb.63.1663573814405;
        Mon, 19 Sep 2022 00:50:14 -0700 (PDT)
Received: from ?IPV6:2003:cb:c703:c100:c136:f914:345f:f5f3? (p200300cbc703c100c136f914345ff5f3.dip0.t-ipconnect.de. [2003:cb:c703:c100:c136:f914:345f:f5f3])
        by smtp.gmail.com with ESMTPSA id n2-20020a5d67c2000000b0021badf3cb26sm15174363wrw.63.2022.09.19.00.50.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 00:50:13 -0700 (PDT)
Message-ID: <3d2fc74b-7496-6691-aec0-8d4ed30df139@redhat.com>
Date: Mon, 19 Sep 2022 09:50:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v3] hugetlb: simplify hugetlb handling in follow_page_mask
To: Mike Kravetz <mike.kravetz@oracle.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-ia64@vger.kernel.org
References: <20220919021348.22151-1-mike.kravetz@oracle.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220919021348.22151-1-mike.kravetz@oracle.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Muchun Song <songmuchun@bytedance.com>, Andrew Morton <akpm@linux-foundation.org>, Naoya Horiguchi <naoya.horiguchi@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 19.09.22 04:13, Mike Kravetz wrote:
> During discussions of this series [1], it was suggested that hugetlb
> handling code in follow_page_mask could be simplified.  At the beginning
> of follow_page_mask, there currently is a call to follow_huge_addr which
> 'may' handle hugetlb pages.  ia64 is the only architecture which provides
> a follow_huge_addr routine that does not return error.  Instead, at each
> level of the page table a check is made for a hugetlb entry.  If a hugetlb
> entry is found, a call to a routine associated with that entry is made.
> 
> Currently, there are two checks for hugetlb entries at each page table
> level.  The first check is of the form:
>          if (p?d_huge())
>                  page = follow_huge_p?d();
> the second check is of the form:
>          if (is_hugepd())
>                  page = follow_huge_pd().
> 
> We can replace these checks, as well as the special handling routines
> such as follow_huge_p?d() and follow_huge_pd() with a single routine to
> handle hugetlb vmas.
> 
> A new routine hugetlb_follow_page_mask is called for hugetlb vmas at the
> beginning of follow_page_mask.  hugetlb_follow_page_mask will use the
> existing routine huge_pte_offset to walk page tables looking for hugetlb
> entries.  huge_pte_offset can be overwritten by architectures, and already
> handles special cases such as hugepd entries.
> 
> [1] https://lore.kernel.org/linux-mm/cover.1661240170.git.baolin.wang@linux.alibaba.com/
> 
> Suggested-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>
> ---

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb

