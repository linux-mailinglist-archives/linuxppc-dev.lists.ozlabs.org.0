Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC28375BDB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 21:39:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FbkRN3CWDz3bSn
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 May 2021 05:39:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XImLsgWo;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BPAD6O3l;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=XImLsgWo; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=BPAD6O3l; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FbkQt6g0Fz2yjK
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 May 2021 05:38:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620329922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mD9rk0OEj0XYhxeQH5IDJPNbrX+PSqo6PoFdlh4Fuj4=;
 b=XImLsgWo+QKlmyFO/XlEDIt+Ur0g+yEHU0vNvIGZicLxOMFTDhm1SMaHO6kHyvo+R96HLJ
 n8OuKEvm76zWoLN1ebZLdUs0FWjwaxGFUmckZConLy9xqNBdCPnXixRPsDjCcUVmbTzaR/
 j4eieEbJSRhovwhXNb5AA0XnCwnN1kY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620329923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mD9rk0OEj0XYhxeQH5IDJPNbrX+PSqo6PoFdlh4Fuj4=;
 b=BPAD6O3l9g7o2RiF0PCpsQx/VHW8+cqU8AnJeERpuOobj02DP6YcC9bkyj/aXj/t2k6d3w
 mV69N6Ft6xP/K8IDRA2lTHYc/UQImxgWK7bpKtJIHLSg355cIEdtKNJKP9bH3mnlJ39k6w
 UfLHeUZX62Xp99+6yTRn+MPcQXJDSAU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-_fg3IvWFP3eVciKxHVgPyw-1; Thu, 06 May 2021 15:38:40 -0400
X-MC-Unique: _fg3IvWFP3eVciKxHVgPyw-1
Received: by mail-wm1-f72.google.com with SMTP id
 y184-20020a1ce1c10000b0290143299f39d7so3027834wmg.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 May 2021 12:38:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=mD9rk0OEj0XYhxeQH5IDJPNbrX+PSqo6PoFdlh4Fuj4=;
 b=I9kdMf1+UoMjNThTEfQKC2A+XGUr+N/Qnql0Ze17CYdaQ+k0K1g4V/oXPWhvz/E3K+
 nFTQeO9I6X53ZXXNnGKOczVIGFm42JLYyvfJP1QCpNDEI5egiklLDqG2lmF7FQd+TOzh
 cyQlY1LpklfQHbH/QEhJBEVUKy4CS2VK92ifUo7ouue6CsfGPeALlYJEnLxHu8f8skfw
 4HdEnz0JysSo/lOe+HWZIh2R3skR9BjQRrKZ9f6eFewETyM9RmxQggTWom+LFvZqThp/
 RbQTBfGgpEtftO7dNhJIuHeeTCkRSMYnScVsdzDAP0+24mGPtmKesP2Bvlz2wCkwr+Mn
 tfOg==
X-Gm-Message-State: AOAM533gc+i13YoEMQOfMuGWbm7579jNOp3Kb9BtC40wnZQ2NCFnTU35
 H9h9oWaMVrCWwrB4YBlt7aKqthjl5UDEHQ9xdXxgQrplSLcLWd2A8VE2zUIz3vxJaZadI7D4r6J
 zyeRlDYS+erxLJzBQhc7319wnAg==
X-Received: by 2002:a5d:51d2:: with SMTP id n18mr7392203wrv.69.1620329919135; 
 Thu, 06 May 2021 12:38:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOC06i3MicUKjMNEqxEnGDL/rTRmiJEviad77ONpxe7ogE7ETHVYywYhvhoyD41LPb0MdTmQ==
X-Received: by 2002:a5d:51d2:: with SMTP id n18mr7392182wrv.69.1620329918917; 
 Thu, 06 May 2021 12:38:38 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c64ae.dip0.t-ipconnect.de. [91.12.100.174])
 by smtp.gmail.com with ESMTPSA id q10sm4494733wmc.31.2021.05.06.12.38.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 May 2021 12:38:38 -0700 (PDT)
Subject: Re: [RFC PATCH 0/7] Memory hotplug/hotremove at subsection size
To: Matthew Wilcox <willy@infradead.org>
References: <20210506152623.178731-1-zi.yan@sent.com>
 <fb60eabd-f8ef-2cb1-7338-7725efe3c286@redhat.com>
 <9D7FD316-988E-4B11-AC1C-64FF790BA79E@nvidia.com>
 <3a51f564-f3d1-c21f-93b5-1b91639523ec@redhat.com>
 <16962E62-7D1E-4E06-B832-EC91F54CC359@nvidia.com>
 <f3a2152c-685b-2141-3e33-b2bcab8b6010@redhat.com>
 <3A6D54CF-76F4-4401-A434-84BEB813A65A@nvidia.com>
 <0e850dcb-c69a-188b-7ab9-09e6644af3ab@redhat.com>
 <20210506193026.GE388843@casper.infradead.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <d2e3c89d-a1fe-e7bc-c2ec-586df2073951@redhat.com>
Date: Thu, 6 May 2021 21:38:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210506193026.GE388843@casper.infradead.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Michal Hocko <mhocko@suse.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 Andy Lutomirski <luto@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, x86@kernel.org,
 Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Zi Yan <ziy@nvidia.com>, linux-ia64@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 06.05.21 21:30, Matthew Wilcox wrote:
> On Thu, May 06, 2021 at 09:10:52PM +0200, David Hildenbrand wrote:
>> I have to admit that I am not really a friend of that. I still think our
>> target goal should be to have gigantic THP *in addition to* ordinary THP.
>> Use gigantic THP where enabled and possible, and just use ordinary THP
>> everywhere else. Having one pageblock granularity is a real limitation IMHO
>> and requires us to hack the system to support it to some degree.
> 
> You're thinking too small with only two THP sizes ;-)  I'm aiming to

Well, I raised in my other mail that we will have multiple different use 
cases, including multiple different THP e.g., on aarch64 ;)

> support arbitrary power-of-two memory allocations.  I think there's a
> fruitful discussion to be had about how that works for anonymous memory --
> with page cache, we have readahead to tell us when our predictions of use
> are actually fulfilled.  It doesn't tell us what percentage of the pages

Right, and I think we have to think about a better approach than just 
increasing the pageblock_order.

> allocated were actually used, but it's a hint.  It's a big lift to go from
> 2MB all the way to 1GB ... if you can look back to see that the previous
> 1GB was basically fully populated, then maybe jump up from allocating
> 2MB folios to allocating a 1GB folio, but wow, that's a big step.
> 
> This goal really does mean that we want to allocate from the page
> allocator, and so we do want to grow MAX_ORDER.  I suppose we could
> do somethig ugly like
> 
> 	if (order <= MAX_ORDER)
> 		alloc_page()
> 	else
> 		alloc_really_big_page()
> 
> but that feels like unnecessary hardship to place on the user.

I had something similar for the sort term in mind, relying on 
alloc_contig_pages() (and maybe ZONE_MOVABLE to make allocations more 
likely to succeed). Devil's in the details (page migration, ...).


-- 
Thanks,

David / dhildenb

