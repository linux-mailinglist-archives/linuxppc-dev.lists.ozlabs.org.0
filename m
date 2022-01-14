Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C474748EAEE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jan 2022 14:39:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jb2TQ0Hsvz305B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jan 2022 00:39:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HO8d/pSW;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HO8d/pSW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=HO8d/pSW; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=HO8d/pSW; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jb2Sf5Dfjz2ylk
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jan 2022 00:38:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642167514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NbLWpbs04Fbr52VNRcUjKYlBXFjrwmcMdjglRxFIjmA=;
 b=HO8d/pSWWln9JIByT+svp59FAkwJgeMf8u+OrQZ/v7UDnPGDsEk/bHSNnt/RgOc/DuU/Ex
 F7HPMA/pzci+4CaGQWtM1OGOwSX/UINq60E3/wtSZ7M4yuCcLf4mK/mYw17UQjZY2ApHjK
 rBv68MgCycXBx8tN+RMKoFiZCGrciVg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642167514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NbLWpbs04Fbr52VNRcUjKYlBXFjrwmcMdjglRxFIjmA=;
 b=HO8d/pSWWln9JIByT+svp59FAkwJgeMf8u+OrQZ/v7UDnPGDsEk/bHSNnt/RgOc/DuU/Ex
 F7HPMA/pzci+4CaGQWtM1OGOwSX/UINq60E3/wtSZ7M4yuCcLf4mK/mYw17UQjZY2ApHjK
 rBv68MgCycXBx8tN+RMKoFiZCGrciVg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-510-q-RcU-LeOaq1VcH9LLTgsA-1; Fri, 14 Jan 2022 08:38:32 -0500
X-MC-Unique: q-RcU-LeOaq1VcH9LLTgsA-1
Received: by mail-ed1-f69.google.com with SMTP id
 m16-20020a056402431000b003fb60bbe0e2so8353260edc.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jan 2022 05:38:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=NbLWpbs04Fbr52VNRcUjKYlBXFjrwmcMdjglRxFIjmA=;
 b=UzPpcdC2Zli3b72IcXcwMy4vFYXGT93lEe+WYpEXkUzctOyfPtSM0M7It8CeeR7a27
 NBM04l+68DZ86BL6x543slOSK1IN+fsrkyMDaZd8OqvqlS2Ud3ZOEEHDEOZBr+xETPCR
 K+xWstvHjDxNrYoKEdHQUdoFPD6B1ViCEnwdq5w2VeMCe/fksFoL5DN+VoM9V5Tbgcgi
 bGFjc6vjOZzK7gOMjhxeo8t9wH51gbMj3+Qop02jGge7e3CMm9iQG7kalwaQEONE+04R
 bhNVW/7QKr3U7lvdBe6V9F+/YGS58DyB9nmsUkmziUdirLs5y63Hy/ux40V0k/71GWzR
 CTTQ==
X-Gm-Message-State: AOAM532oTi6B1vObx3jIQyCbQbqPxup1YNAFgDktM79ZHK11lOitn6In
 jNUYjNR6g3/GuJZ0qY6Xfn9A1MzNbQwwVHgG+4KUSjt7tndhFUbpo8TxgM/uoQ9R6VunJcOZMiJ
 ZA/a/sreuAwnvn5/l+AA/vlQ7AQ==
X-Received: by 2002:a05:6402:22f5:: with SMTP id
 dn21mr8277795edb.195.1642167511819; 
 Fri, 14 Jan 2022 05:38:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwHvYz3VQ9C1aagG3+wcF6jvkOYHX0vhK+bpyMkPVNgdDNTqGPKVyjbaru5jr4nQAEJhmT6JQ==
X-Received: by 2002:a05:6402:22f5:: with SMTP id
 dn21mr8277761edb.195.1642167511469; 
 Fri, 14 Jan 2022 05:38:31 -0800 (PST)
Received: from ?IPV6:2003:cb:c701:9d00:ff87:1c9b:108a:9702?
 (p200300cbc7019d00ff871c9b108a9702.dip0.t-ipconnect.de.
 [2003:cb:c701:9d00:ff87:1c9b:108a:9702])
 by smtp.gmail.com with ESMTPSA id c13sm1900839ejj.144.2022.01.14.05.38.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 05:38:31 -0800 (PST)
Message-ID: <ead90b32-da2b-4d66-f103-6fbec0937e93@redhat.com>
Date: Fri, 14 Jan 2022 14:38:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC PATCH v3 5/8] mm: page_isolation: check specified range for
 unmovable pages during isolation.
To: Zi Yan <ziy@nvidia.com>, linux-mm@kvack.org
References: <20220105214756.91065-1-zi.yan@sent.com>
 <20220105214756.91065-6-zi.yan@sent.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220105214756.91065-6-zi.yan@sent.com>
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
Cc: Mel Gorman <mgorman@techsingularity.net>,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Eric Ren <renzhengeek@gmail.com>,
 virtualization@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>, Vlastimil Babka <vbabka@suse.cz>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 05.01.22 22:47, Zi Yan wrote:
> From: Zi Yan <ziy@nvidia.com>
> 
> Enable set_migratetype_isolate() to check specified sub-range for
> unmovable pages during isolation. Page isolation is done
> at max(MAX_ORDER_NR_PAEGS, pageblock_nr_pages) granularity, but not all
> pages within that granularity are intended to be isolated. For example,
> alloc_contig_range(), which uses page isolation, allows ranges without
> alignment. This commit makes unmovable page check only look for
> interesting pages, so that page isolation can succeed for any
> non-overlapping ranges.

Are you handling if we start checking in the middle of a compound page
and actually have to lookup the head to figure out if movable or not?

> 
> has_unmovable_pages() is moved to mm/page_isolation.c since it is only
> used by page isolation.

Please move that into a separate patch upfront, makes this patch much
easier to review.

-- 
Thanks,

David / dhildenb

