Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BAB5202C0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 May 2022 18:42:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kxn5g40L7z3cFB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 02:42:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JeETDsME;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JeETDsME;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.129.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=JeETDsME; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=JeETDsME; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kxn4x30D4z3bdB
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 02:41:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652114505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=46wpjVCZhJPBmgWeRQ9uBt+Od81o8qIGqdyqzSCTbIU=;
 b=JeETDsMEypPXoCbhMDCa+O3IBoSCrTKGO0VF+qyxMrTnCd+PRERsIAnsnFww2ERFkTskcE
 jOX/3TfEjfJgImkU0e7Je6ySx8psTtD68Q+v1sW3ahycrUrerv1+H7xdinh7T8hGnEcuaI
 RYVZdm0CK6tq2y4UTmGRzdmIauP7d8c=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652114505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=46wpjVCZhJPBmgWeRQ9uBt+Od81o8qIGqdyqzSCTbIU=;
 b=JeETDsMEypPXoCbhMDCa+O3IBoSCrTKGO0VF+qyxMrTnCd+PRERsIAnsnFww2ERFkTskcE
 jOX/3TfEjfJgImkU0e7Je6ySx8psTtD68Q+v1sW3ahycrUrerv1+H7xdinh7T8hGnEcuaI
 RYVZdm0CK6tq2y4UTmGRzdmIauP7d8c=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-495-IDtnD6NiO-ON80mHb3pymg-1; Mon, 09 May 2022 12:41:43 -0400
X-MC-Unique: IDtnD6NiO-ON80mHb3pymg-1
Received: by mail-il1-f199.google.com with SMTP id
 q6-20020a056e0215c600b002c2c4091914so7908541ilu.14
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 May 2022 09:41:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=46wpjVCZhJPBmgWeRQ9uBt+Od81o8qIGqdyqzSCTbIU=;
 b=IDSO2/ZdaisRH5HclS8+ECyYdBtKndZNuseCHOwW5fVT3bJZbCC8UW5Csm5C/rjjne
 iUj88MKXQviX8UkcIdgmD+5VMtVH1vLmT3nLaAHPP8462RD6E2lqhsDaFIoC6HZOVr5W
 GHTzz41KPH3KnX6ozGcA1X7Bd/xzQxgeOVecERH4nBT8Fk870LZk0LPuaBHat/ksAp/L
 eJbWd8cZJtTUTqcUFjibDmrmGjv321l3fCg7D4XxwW555TDZeFTqgMUfWHqooQWY2j97
 PeXp03QWNzRC0E10a0QpIaPU55E0DPg8mCuxDt8rVmijdBn1dE1GWuatC95ayz2TQZiB
 TvkA==
X-Gm-Message-State: AOAM530Y6DO0ESnBaJ0b48BPl/zAA94QIT8KzraH6K+PIGydYzy3276X
 zzgNmLozKe1LOvKeyIhgzteJmSOrcn4RRiHP2SsLIFkNje/GWZiud1a/IB9VcLBNwsf89pyCX1h
 v/NFu85ieqCnGXwT6TzldJ6ryig==
X-Received: by 2002:a05:6e02:164e:b0:2cf:82bc:6c76 with SMTP id
 v14-20020a056e02164e00b002cf82bc6c76mr6451758ilu.95.1652114503271; 
 Mon, 09 May 2022 09:41:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxE3U4JsTh97DMqQwaSKR+J9MOnj5nTpGNATaHacf1CibJGqYaNUSWSiHqNy5VvKai+5PTu/Q==
X-Received: by 2002:a05:6e02:164e:b0:2cf:82bc:6c76 with SMTP id
 v14-20020a056e02164e00b002cf82bc6c76mr6451741ilu.95.1652114503011; 
 Mon, 09 May 2022 09:41:43 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 x26-20020a6bfe1a000000b0065a48a57f6dsm3633311ioh.40.2022.05.09.09.41.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 09:41:42 -0700 (PDT)
Date: Mon, 9 May 2022 12:41:38 -0400
From: Peter Xu <peterx@redhat.com>
To: Mike Kravetz <mike.kravetz@oracle.com>
Subject: Re: [PATCH 3/3] mm: rmap: Fix CONT-PTE/PMD size hugetlb issue when
 unmapping
Message-ID: <YnlEQvipCM6hnIYT@xz-m1.local>
References: <cover.1651216964.git.baolin.wang@linux.alibaba.com>
 <c91e04ebb792ef7b72966edea8bd6fa2dfa5bfa7.1651216964.git.baolin.wang@linux.alibaba.com>
 <20220429220214.4cfc5539@thinkpad>
 <bcb4a3b0-4fcd-af3a-2a2c-fd662d9eaba9@linux.alibaba.com>
 <20220502160232.589a6111@thinkpad>
 <48a05075-a323-e7f1-9e99-6c0d106eb2cb@linux.alibaba.com>
 <20220503120343.6264e126@thinkpad>
 <927dfbf4-c899-b88a-4d58-36a637d611f9@oracle.com>
MIME-Version: 1.0
In-Reply-To: <927dfbf4-c899-b88a-4d58-36a637d611f9@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-mips@vger.kernel.org, James.Bottomley@HansenPartnership.com,
 linux-mm@kvack.org, paulus@samba.org, sparclinux@vger.kernel.org,
 agordeev@linux.ibm.com, will@kernel.org, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, arnd@arndb.de, ysato@users.sourceforge.jp,
 deller@gmx.de, catalin.marinas@arm.com,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, borntraeger@linux.ibm.com,
 gor@linux.ibm.com, hca@linux.ibm.com,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 linux-arm-kernel@lists.infradead.org, tsbogend@alpha.franken.de,
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
 svens@linux.ibm.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 06, 2022 at 12:07:13PM -0700, Mike Kravetz wrote:
> On 5/3/22 03:03, Gerald Schaefer wrote:
> > On Tue, 3 May 2022 10:19:46 +0800
> > Baolin Wang <baolin.wang@linux.alibaba.com> wrote:
> >> On 5/2/2022 10:02 PM, Gerald Schaefer wrote:

[...]

> >> Please see previous code, we'll use the original pte value to check if 
> >> it is uffd-wp armed, and if need to mark it dirty though the hugetlbfs 
> >> is set noop_dirty_folio().
> >>
> >> pte_install_uffd_wp_if_needed(vma, address, pvmw.pte, pteval);
> > 
> > Uh, ok, that wouldn't work on s390, but we also don't have
> > CONFIG_PTE_MARKER_UFFD_WP / HAVE_ARCH_USERFAULTFD_WP set, so
> > I guess we will be fine (for now).
> > 
> > Still, I find it a bit unsettling that pte_install_uffd_wp_if_needed()
> > would work on a potential hugetlb *pte, directly de-referencing it
> > instead of using huge_ptep_get().
> > 
> > The !pte_none(*pte) check at the beginning would be broken in the
> > hugetlb case for s390 (not sure about other archs, but I think s390
> > might be the only exception strictly requiring huge_ptep_get()
> > for de-referencing hugetlb *pte pointers).

We could have used is_vm_hugetlb_page(vma) within the helper so as to
properly use either generic pte or hugetlb version of pte fetching.  We may
want to conditionally do set_[huge_]pte_at() too at the end.

I could prepare a patch for that even if it's not really anything urgently
needed. I assume that won't need to block this patchset since we need the
pteval for pte_dirty() check anyway and uffd-wp definitely needs it too.

Thanks,

-- 
Peter Xu

