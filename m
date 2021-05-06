Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C13375B8D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 21:15:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fbjvq2cXGz30B9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 May 2021 05:15:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PLRvuvKS;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PLRvuvKS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=PLRvuvKS; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=PLRvuvKS; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FbjvG2lqZz2y86
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 May 2021 05:14:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620328487;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LxJCtrJc+hn1vhOwMRBMiLEsVjLTk4AmYnUbr3bQtaE=;
 b=PLRvuvKSFI1DBA41oyQZfmh5KBtNY7jp9bfmvhGxSvQHtx0HkfmIdlhEHoaBBb18LF3AOM
 6lYi62N3cIRS2MC9cNkAYTtSyTqaEZyJ7/MvGXFS7pLcnBjmicQBouSbd0WuWOO8CFt0Dm
 U/iwtdnTNMQIyW096DYgRPjOV5+xK6M=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620328487;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LxJCtrJc+hn1vhOwMRBMiLEsVjLTk4AmYnUbr3bQtaE=;
 b=PLRvuvKSFI1DBA41oyQZfmh5KBtNY7jp9bfmvhGxSvQHtx0HkfmIdlhEHoaBBb18LF3AOM
 6lYi62N3cIRS2MC9cNkAYTtSyTqaEZyJ7/MvGXFS7pLcnBjmicQBouSbd0WuWOO8CFt0Dm
 U/iwtdnTNMQIyW096DYgRPjOV5+xK6M=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-8t-kuzskP1K3In9mbRgPTw-1; Thu, 06 May 2021 15:14:45 -0400
X-MC-Unique: 8t-kuzskP1K3In9mbRgPTw-1
Received: by mail-ej1-f69.google.com with SMTP id
 z6-20020a17090665c6b02903700252d1ccso2103241ejn.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 May 2021 12:14:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=LxJCtrJc+hn1vhOwMRBMiLEsVjLTk4AmYnUbr3bQtaE=;
 b=jH8b98yLA79njbZplUfePNs21qqrxE0OWwEs5WX1YBHMjZrPbD7gNdC1ibS3fNa5n6
 MCVvEgqJp4dzrmgF2br4vDMMI00/mlYVsV1nIVuCUNOmNrLqRoOU+7UeNjvHXqB5h5GZ
 2FHHpZXG4Sqjp8aSzX0qU1XNN4dPlCFzgWUGPFZyiqhjRr5i7ruIwFQb0Ke1LR5To8Ov
 ZZ/z8TNvHRoHI5wr63L4urmGi6OltmJKAOgnY24JTmAV2UDDiLYL9jIuHAFCwWn58pD0
 cfqNePm+7gi3zBi79dUvtE+65Md6gOEcAq3G8rMb4uqHozVybCkNkWRm0ZukXDTvi3xF
 gyaA==
X-Gm-Message-State: AOAM531L5HY51DImPYVou9pgWg/QbniIT7xCRHh0ZnEhV+qlf5Cc8kUr
 c0C9nas56IKrnzju3ivPpNHm38i8n1Z0vejXFEZ9HH1ZQVvhfeqJ7svsDu6vgMegEsErD78iHH1
 0dK2zRmva/CuKUzwj5c4p+4i4pA==
X-Received: by 2002:aa7:d843:: with SMTP id f3mr7130707eds.270.1620328484581; 
 Thu, 06 May 2021 12:14:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMDfCDANHagwyvMGFrV1L6sL7t6UDHQRxiwpmWElp0FfWEi44uao+v+GyT+Pf6/v6QHjNNZw==
X-Received: by 2002:aa7:d843:: with SMTP id f3mr7130678eds.270.1620328484331; 
 Thu, 06 May 2021 12:14:44 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c64ae.dip0.t-ipconnect.de. [91.12.100.174])
 by smtp.gmail.com with ESMTPSA id x7sm1924071ejc.116.2021.05.06.12.14.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 May 2021 12:14:44 -0700 (PDT)
To: Zi Yan <ziy@nvidia.com>
References: <20210506152623.178731-1-zi.yan@sent.com>
 <20210506152623.178731-2-zi.yan@sent.com>
 <06dfaf69-1173-462c-b85f-8715cb8d108c@redhat.com>
 <71EE13C0-9CF7-4F1F-9C17-64500A854BD8@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [RFC PATCH 1/7] mm: sparse: set/clear subsection bitmap when
 pages are onlined/offlined.
Message-ID: <146a1ec6-38b3-9724-b346-9bb6e7e24c72@redhat.com>
Date: Thu, 6 May 2021 21:14:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <71EE13C0-9CF7-4F1F-9C17-64500A854BD8@nvidia.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Michal Hocko <mhocko@suse.com>, linux-ia64@vger.kernel.org,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, x86@kernel.org,
 Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

>> But glimpsing at patch #2, I'd rather stop right away digging deeper into this series :)
> 
> What is the issue of patch 2, which makes pageblock_order a variable all the time? BTW, patch 2 fixes a bug by exporting pageblock_order, since when HUGETLB_PAGE_SIZE_VARIABLE is set, virtio-mem will not see pageblock_order as a variable, which could happen for PPC_BOOK2S_64 with virtio-men enabled, right? Or is this an invalid combination?

virtio_mem is x86_64 only. aarch64 and s390x prototypes are available.

If I understood "Make pageblock_order a variable and
set it to the max of HUGETLB_PAGE_ORDER, MAX_ORDER - 1" correctly, 
you're setting the pageblock_order on x86_64 to 4M. That mean's you're 
no longer grouping for THP but MAX_ORDER - 1, which is not what we want. 
We want to optimize for THP.

Also, that would affect virtio-balloon with free page reporting (report 
only 4 MiB chunks not 2 MiB chunks).

> 
>>
>> I think what would really help is drafting a design of how it all could look like and then first discussing the high-level design, investigating how it could play along with all existing users, existing workloads, and existing use cases. Proposing such changes without a clear picture in mind and a high-level overview might give you some unpleasant reactions from some of the developers around here ;)
> 
> Please see my other email for a high-level design. Also I sent the patchset as a RFC to gather information on users, workloads, use cases I did not know about and I learnt a lot from your replies. :) Feedback is always welcome, but I am not sure why it needs to make people unpleasant. ;)

Rather the replies might be unpleasant ;)

-- 
Thanks,

David / dhildenb

