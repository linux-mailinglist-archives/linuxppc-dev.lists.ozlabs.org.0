Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E3316EF369
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2019 03:28:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 476YVZ2cmxzF0wv
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2019 13:28:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::844;
 helo=mail-qt1-x844.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="qktoZDnm"; 
 dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 476XDN50BjzF40r
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2019 12:30:40 +1100 (AEDT)
Received: by mail-qt1-x844.google.com with SMTP id u22so27003243qtq.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Nov 2019 17:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aR+2eBnDheAMkwOXsNXJUEiyYXIkOGnGgWNkPzd4tdQ=;
 b=qktoZDnmGaINw22JlCwMcZG1PDeQczipLlMB42AGNsv72JUru4Yl1D6oIEjBA38dzh
 ZS2PnoJ0nLiGYI/i2K3YUYXaOLydyfU1Nh9OJDcQC7tLDTMa0R1lDv4ems+WcI//b7L2
 wR2dAsnPnZxJaxO7jVkMEQp5o3ksMp8LZBvOc6NF8jCZcTkkpEBzr7Bf+awpNyVVG6Ua
 qooyd6G9st5lQ4zbkKWFjUk8VEjPyKkcrE3NKGhOt3BMQgdbeqhbp+AtPIgHxyLjREHU
 SGLgLVGJs/nQldloF34in/meweNbuplR476f3VH7ViKAcI+PvQUy3TCespjZxP2iYT+N
 0/3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aR+2eBnDheAMkwOXsNXJUEiyYXIkOGnGgWNkPzd4tdQ=;
 b=RffoJ5mVmAYWbo714iucootUnXAlhZ+kn0O5HBGEMoDinyzjeIVw6MPDf/qJcuwcSk
 opktXV1CdOjbPEo23nfxs6UUNcYGaq5L3U/0uR1O+iDsKIF4F1PUdfB+ODXtN81UA0q8
 KOj8CK1WplXCbzoIOdf1HN1gPtJNGEOeS7pCylyEnYxVMGm18mIlFADL8rxxQk423g52
 PK4E5v8M4xNojELToBw/KFFEIFPdOXdFHb4i6ndP26a6pYYV9kIotKhkr4ldq05kVD3/
 Y/8AntW7KunuVaRTgGMUVpkEUfM5wFrB5xyh0i1s8c1421l4EjZSlQjOnK5m6+3/E4/7
 xeTQ==
X-Gm-Message-State: APjAAAWjYJHMs8bRb4mDx/YlVGsYy/gSNv4KRDk9EvBmVw8DRP/Q/RwI
 48Q1uI4ufWp/R9ZhJJSid6mSWNF1ZYe4eQTt10rzGA==
X-Google-Smtp-Source: APXvYqz7Bk4kRduwfrclstPYyEuP//nuwTqg9TTsoV0HtiW5xPO5/4utgjFzQW53c0oeh/hiUJTxgAj86G8lI66LWNo=
X-Received: by 2002:ac8:424d:: with SMTP id r13mr15689594qtm.111.1572917436967; 
 Mon, 04 Nov 2019 17:30:36 -0800 (PST)
MIME-Version: 1.0
References: <20191024120938.11237-1-david@redhat.com>
 <20191024120938.11237-2-david@redhat.com>
In-Reply-To: <20191024120938.11237-2-david@redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 4 Nov 2019 17:30:25 -0800
Message-ID: <CAPcyv4hT58=SDWYO2vrktdFOnDfWveVwN4ZBxNQ8=500_Zu7tQ@mail.gmail.com>
Subject: Re: [PATCH v1 01/10] mm/memory_hotplug: Don't allow to online/offline
 memory blocks with holes
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 05 Nov 2019 13:26:42 +1100
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
Cc: linux-hyperv@vger.kernel.org, Michal Hocko <mhocko@suse.com>,
 =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>,
 KVM list <kvm@vger.kernel.org>, Pavel Tatashin <pavel.tatashin@microsoft.com>,
 KarimAllah Ahmed <karahmed@amazon.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Alexander Duyck <alexander.duyck@gmail.com>, Michal Hocko <mhocko@kernel.org>,
 Linux MM <linux-mm@kvack.org>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Wanpeng Li <wanpengli@tencent.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Thomas Gleixner <tglx@linutronix.de>,
 Kees Cook <keescook@chromium.org>, devel@driverdev.osuosl.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Joerg Roedel <joro@8bytes.org>, X86 ML <x86@kernel.org>,
 YueHaibing <yuehaibing@huawei.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Vlastimil Babka <vbabka@suse.cz>,
 Anthony Yznaga <anthony.yznaga@oracle.com>, Oscar Salvador <osalvador@suse.de>,
 "Isaac J. Manjarres" <isaacm@codeaurora.org>,
 Matt Sickler <Matt.Sickler@daktronics.com>, Juergen Gross <jgross@suse.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Sasha Levin <sashal@kernel.org>,
 kvm-ppc@vger.kernel.org, Qian Cai <cai@lca.pw>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mike Rapoport <rppt@linux.vnet.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Nicholas Piggin <npiggin@gmail.com>, Andy Lutomirski <luto@kernel.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Allison Randal <allison@lohutok.net>,
 Jim Mattson <jmattson@google.com>, Mel Gorman <mgorman@techsingularity.net>,
 Cornelia Huck <cohuck@redhat.com>, Pavel Tatashin <pasha.tatashin@soleen.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 24, 2019 at 5:10 AM David Hildenbrand <david@redhat.com> wrote:
>
> Our onlining/offlining code is unnecessarily complicated. Only memory
> blocks added during boot can have holes (a range that is not
> IORESOURCE_SYSTEM_RAM). Hotplugged memory never has holes (e.g., see
> add_memory_resource()). All boot memory is alread online.

s/alread/already/

...also perhaps clarify "already online" by what point in time and why
that is relevant. For example a description of the difference between
the SetPageReserved() in the bootmem path and the one in the hotplug
path.

> Therefore, when we stop allowing to offline memory blocks with holes, we
> implicitly no longer have to deal with onlining memory blocks with holes.

Maybe an explicit reference of the code areas that deal with holes
would help to back up that assertion. Certainly it would have saved me
some time for the review.

> This allows to simplify the code. For example, we no longer have to
> worry about marking pages that fall into memory holes PG_reserved when
> onlining memory. We can stop setting pages PG_reserved.

...but not for bootmem, right?

>
> Offlining memory blocks added during boot is usually not guranteed to work

s/guranteed/guaranteed/

> either way (unmovable data might have easily ended up on that memory during
> boot). So stopping to do that should not really hurt (+ people are not
> even aware of a setup where that used to work

Maybe put a "Link: https://lkml.kernel.org/r/$msg_id" to that discussion?

> and that the existing code
> still works correctly with memory holes). For the use case of offlining
> memory to unplug DIMMs, we should see no change. (holes on DIMMs would be
> weird).

However, less memory can be offlined than was theoretically allowed
previously, so I don't understand the "we should see no change"
comment. I still agree that's a price worth paying to get the code
cleanups and if someone screams we can look at adding it back, but the
fact that it was already fragile seems decent enough protection.

>
> Please note that hardware errors (PG_hwpoison) are not memory holes and
> not affected by this change when offlining.
>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: Pavel Tatashin <pasha.tatashin@soleen.com>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  mm/memory_hotplug.c | 26 ++++++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
>
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index 561371ead39a..8d81730cf036 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -1447,10 +1447,19 @@ static void node_states_clear_node(int node, struct memory_notify *arg)
>                 node_clear_state(node, N_MEMORY);
>  }
>
> +static int count_system_ram_pages_cb(unsigned long start_pfn,
> +                                    unsigned long nr_pages, void *data)
> +{
> +       unsigned long *nr_system_ram_pages = data;
> +
> +       *nr_system_ram_pages += nr_pages;
> +       return 0;
> +}
> +
>  static int __ref __offline_pages(unsigned long start_pfn,
>                   unsigned long end_pfn)
>  {
> -       unsigned long pfn, nr_pages;
> +       unsigned long pfn, nr_pages = 0;
>         unsigned long offlined_pages = 0;
>         int ret, node, nr_isolate_pageblock;
>         unsigned long flags;
> @@ -1461,6 +1470,20 @@ static int __ref __offline_pages(unsigned long start_pfn,
>
>         mem_hotplug_begin();
>
> +       /*
> +        * Don't allow to offline memory blocks that contain holes.
> +        * Consecuently, memory blocks with holes can never get onlined

s/Consecuently/Consequently/

> +        * (hotplugged memory has no holes and all boot memory is online).
> +        * This allows to simplify the onlining/offlining code quite a lot.
> +        */

The last sentence of this comment makes sense in the context of this
patch, but I don't think it stands by itself in the code base after
the fact. The person reading the comment can't see the simplifications
because the code is already gone. I'd clarify it to talk about why it
is safe to not mess around with PG_Reserved in the hotplug path
because of this check.

After those clarifications you can add:

Reviewed-by: Dan Williams <dan.j.williams@intel.com>
