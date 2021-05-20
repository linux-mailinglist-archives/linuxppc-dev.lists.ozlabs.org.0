Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8230738B7FC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 22:01:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmLH12kMgz3068
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 06:01:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ReH7XlIE;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ReH7XlIE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=ReH7XlIE; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=ReH7XlIE; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmLGT5sqgz2ym4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 06:01:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621540876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gf6zyBBGHXMJTYUue+5asDL+BdUUHnOyEErDg4MG/io=;
 b=ReH7XlIE5dnZR90uAvqA/KFCSPg4gyBXw21SgTP/+1Z5OAG4zI7EvKfPODn/wVwBHl85Fw
 EiKKWSbJG+NoPVwx/q1Tk9LAwx7nNwodY2rH6pj1uOyXTDurNt6Jzdv+32WrjNjr/XXUVm
 N9tW7loMtinhxDP2yDWbVXA+Dv49Bd8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621540876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gf6zyBBGHXMJTYUue+5asDL+BdUUHnOyEErDg4MG/io=;
 b=ReH7XlIE5dnZR90uAvqA/KFCSPg4gyBXw21SgTP/+1Z5OAG4zI7EvKfPODn/wVwBHl85Fw
 EiKKWSbJG+NoPVwx/q1Tk9LAwx7nNwodY2rH6pj1uOyXTDurNt6Jzdv+32WrjNjr/XXUVm
 N9tW7loMtinhxDP2yDWbVXA+Dv49Bd8=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-j3IKiFblOb6vBoBRV5FnAw-1; Thu, 20 May 2021 16:01:12 -0400
X-MC-Unique: j3IKiFblOb6vBoBRV5FnAw-1
Received: by mail-qt1-f199.google.com with SMTP id
 h2-20020a05622a1702b02901b9123889b0so13154431qtk.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 13:01:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=gf6zyBBGHXMJTYUue+5asDL+BdUUHnOyEErDg4MG/io=;
 b=lgrMv5lOnwd0mlz5OPEckb10Alpydo6YGQVUkQEerbEEFhp7IDknuJLx9YCGA7II16
 s9/Ktzhb6GO+w39VMD45Ovaq0Py3uVTQp9GaqRRmOwopeUbMN0NFzr2EGiU03cpMhZOt
 R9HANrvhfe1X3soQgc7/985ncCZFuvxcSM05CcvmDzgRWGnyyvuWRKLNV0KwWbFW95xo
 IPKZbnPmJzeOyicoKVu+veHKAADxvGDZwJ3wPPmAEEdR1iYbM0UCeSSrjgW2YEz71bgg
 Ukr1ZwOYBKl/i0xKKDKkX8Kk/zVS9U1TIYE7ldlSgHaIk04skhdAjvpfYXoywZ8q8yDL
 97TA==
X-Gm-Message-State: AOAM533dyA+ag3YheLvMdoGFnpAWJGN9PuM38Vlu2yUsKkR31RWTXYCY
 wzP/HL0nwT5nw9lf5GVzQNbUDq1ed1ajOFY1bRfn6F2Oj17iIL1z7hP1fVIxPuwzzTc5V/It0DP
 1YsDorAfbOT5En8GpOuo2bnw5ZQ==
X-Received: by 2002:ac8:570b:: with SMTP id 11mr7077258qtw.287.1621540872119; 
 Thu, 20 May 2021 13:01:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQXvy7GJJRJbpmFrSL46bA7N0vgvWvyK0f6kFJ9fnS7uQnwXTV7Zkqs7M5tj3WJeEIpDwbzg==
X-Received: by 2002:ac8:570b:: with SMTP id 11mr7077105qtw.287.1621540870573; 
 Thu, 20 May 2021 13:01:10 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-72-184-145-4-219.dsl.bell.ca.
 [184.145.4.219])
 by smtp.gmail.com with ESMTPSA id s16sm1676678qtq.67.2021.05.20.13.01.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 13:01:10 -0700 (PDT)
Date: Thu, 20 May 2021 16:01:08 -0400
From: Peter Xu <peterx@redhat.com>
To: Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH v5 3/9] mm/mremap: Use pmd/pud_poplulate to update page
 table entries
Message-ID: <YKbABNL07RIN0qFN@t490s>
References: <20210422054323.150993-4-aneesh.kumar@linux.ibm.com>
 <YKQdxpHVYB9H0M0j@Ryzen-9-3900X.localdomain>
 <87mtsrqqk0.fsf@linux.ibm.com> <YKXHA8/HmP6HXngO@t490s>
 <6e0dbb76-2b33-53f1-246e-30cec2b871e2@linux.ibm.com>
 <YKZaLHurH9nJWvbj@t490s>
 <e6525655-2e51-a0c0-fe54-596cfae9ce21@linux.ibm.com>
 <87o8d5le4q.fsf@linux.ibm.com> <YKZ49Nrz2OojQUBR@t490s>
 <4CE7132C-3800-456B-91DA-613391361B94@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <4CE7132C-3800-456B-91DA-613391361B94@nvidia.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, kaleshsingh@google.com,
 npiggin@gmail.com, Nathan Chancellor <nathan@kernel.org>, linux-mm@kvack.org,
 joel@joelfernandes.org, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 20, 2021 at 03:06:30PM -0400, Zi Yan wrote:
> On 20 May 2021, at 10:57, Peter Xu wrote:
> 
> > On Thu, May 20, 2021 at 07:07:57PM +0530, Aneesh Kumar K.V wrote:
> >> "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
> >>
> >>> On 5/20/21 6:16 PM, Peter Xu wrote:
> >>>> On Thu, May 20, 2021 at 01:56:54PM +0530, Aneesh Kumar K.V wrote:
> >>>>>> This seems to work at least for my userfaultfd test on shmem, however I don't
> >>>>>> fully understand the commit message [1] on: How do we guarantee we're not
> >>>>>> moving a thp pte?
> >>>>>>
> >>>>>
> >>>>> move_page_tables() checks for pmd_trans_huge() and ends up calling
> >>>>> move_huge_pmd if it is a THP entry.
> >>>>
> >>>> Sorry to be unclear: what if a huge pud thp?
> >>>>
> >>>
> >>> I am still checking. Looking at the code before commit
> >>> c49dd340180260c6239e453263a9a244da9a7c85, I don't see kernel handling
> >>> huge pud thp. I haven't studied huge pud thp enough to understand
> >>> whether c49dd340180260c6239e453263a9a244da9a7c85 intent to add that
> >>> support.
> >>>
> >>> We can do a move_huge_pud() like we do for huge pmd thp. But I am not
> >>> sure whether we handle those VMA's earlier and restrict mremap on them?
> >>
> >> something like this? (not even compile tested). I am still not sure
> >> whether this is really needed or we handle DAX VMA's in some other form.
> >
> > Yeah maybe (you may want to at least drop that extra "case HPAGE_PUD").
> >
> > It's just that if with CONFIG_HAVE_MOVE_PUD (x86 and arm64 enables it by
> > default so far) it does seem to work even with huge pud, while after this patch
> > it seems to be not working anymore, even with your follow up fix.
> >
> > Indeed I saw CONFIG_HAVE_MOVE_PUD is introduced a few months ago so breaking
> > someone seems to be unlikely, perhaps no real user yet to mremap() a huge pud
> > for dax or whatever backend?
> >
> > Ideally maybe rework this patch (or series?) and repost it for a better review?
> > Agree the risk seems low.  I'll leave that to you and Andrew to decide..
> 
> It seems that the mremap function for 1GB DAX THP was not added when 1GB DAX THP
> was implemented[1].

Yes, but trickily as I mentioned it seems Android's CONFIG_HAVE_MOVE_PUD has
done this right (with no intention I guess) with the set_pud_at() before this
patch is merged, so we might have a short period that this might start to work..

> I guess no one is using mremap on 1GB DAX THP. Maybe we want
> to at least add a warning or VM_BUG_ON to catch this or use Aneesh’s move_huge_pud()
> to handle the situation properly?

Agreed, if we decide to go with the patches, some warning (or even VM_BUG_ON,
which iiuc should be very not-suggested in most cases) looks better than
pgtable corruption reports.

-- 
Peter Xu

