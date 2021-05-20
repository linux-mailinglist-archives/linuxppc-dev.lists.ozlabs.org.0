Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B7238B85A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 22:25:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmLpk2Q88z3bsb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 06:25:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=BUVIgtmE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::62d;
 helo=mail-pl1-x62d.google.com; envelope-from=kaleshsingh@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=BUVIgtmE; dkim-atps=neutral
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmLpD73b5z2xvc
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 06:25:22 +1000 (AEST)
Received: by mail-pl1-x62d.google.com with SMTP id z4so7566593plg.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 13:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XzhGwED4BuY8EZ9RKSvkQjl/BPgxFgPze0agT2jSi8I=;
 b=BUVIgtmEWYeN2zpTngphN5XPLJ1ipBFQv511iAX9jiVrgQzU9MZnS8u1RWtoQHAoT5
 1WTh7EUT9Wy39ANzCFuAkGgl7mQizm7nL7HLT157tU5ROpYuEtIOuPX2hCRxmGculO29
 F8IeMxtRlMF7OovrJRT/Nv3GckBUy+d0JIS+CpqrjqHnom+7oCrGXK9/ub0GlI2EOetU
 zBopcW4uN28UkXRE6r1sipWUy7iwLZZDH9ZrjKehY+h3IKUDR8vWqzVzK4pJQhRXMbRe
 K6OXDninjIFFECdZ9gt849NneQJEKMvZsWaNYBSVyBIiJRN9dzkGXdhK3LnkUi6aO1qT
 SjYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XzhGwED4BuY8EZ9RKSvkQjl/BPgxFgPze0agT2jSi8I=;
 b=QXmh3gKcMpeVVYieMl7b0WlJ/aLarXLR2MudzglLEo/FSyzadn5ip9RtUVQYdAXuUd
 Jt6JZPYjkJ0KJFENe0AVc9XOZNPjCu7KLwCLlqhIcK2vcIyab5dBub35vP4WRWUhjcml
 h57HVLTlpF9+I32ZgZKbfjd/JKvtOBGmpG7Ri2jBPwtzC6bfiSoFah8HYE5MPhtTKqqY
 JoZa5NK56YPQZw6kedw+jXw8MMOvhx5enrrJmVzh3K1UPhtmO/AkNYHClJlnWLyADIa9
 1c2+ANhSgBPf8zEGRnBgb/uJD2Hg2M1O3Y1yh7fK8JyrXjFdPdf+F26UWfwLTl0Z5dhm
 Q2+w==
X-Gm-Message-State: AOAM533WQUY39TgQA6NLMXUIn8Qsb2tuVy0cPOcCqZ7nxFNCZMps1kj3
 5my1ZopAtljfPsC8TJ5EdYusVPRFcSFV7ulBGxbsnQ==
X-Google-Smtp-Source: ABdhPJxPBQFMSTXN6pxg+uvafPCvn2Xzp3tjqf6LlBqJEJmNMsB25yGvi8xYdijYwUFS03reeDVbiKGFEu0UqylaRl4=
X-Received: by 2002:a17:90a:6644:: with SMTP id
 f4mr6760932pjm.154.1621542318759; 
 Thu, 20 May 2021 13:25:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210422054323.150993-4-aneesh.kumar@linux.ibm.com>
 <YKQdxpHVYB9H0M0j@Ryzen-9-3900X.localdomain> <87mtsrqqk0.fsf@linux.ibm.com>
 <YKXHA8/HmP6HXngO@t490s> <6e0dbb76-2b33-53f1-246e-30cec2b871e2@linux.ibm.com>
 <YKZaLHurH9nJWvbj@t490s> <e6525655-2e51-a0c0-fe54-596cfae9ce21@linux.ibm.com>
 <87o8d5le4q.fsf@linux.ibm.com> <YKZ49Nrz2OojQUBR@t490s>
 <4CE7132C-3800-456B-91DA-613391361B94@nvidia.com>
 <YKbABNL07RIN0qFN@t490s>
In-Reply-To: <YKbABNL07RIN0qFN@t490s>
From: Kalesh Singh <kaleshsingh@google.com>
Date: Thu, 20 May 2021 16:25:07 -0400
Message-ID: <CAC_TJvf1UOM=x1UhXpLj838SqiMLP48cahCgmMOfXRAA0maGUw@mail.gmail.com>
Subject: Re: [PATCH v5 3/9] mm/mremap: Use pmd/pud_poplulate to update page
 table entries
To: Peter Xu <peterx@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, npiggin@gmail.com,
 Nathan Chancellor <nathan@kernel.org>,
 "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>, Zi Yan <ziy@nvidia.com>,
 joel@joelfernandes.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 20, 2021 at 4:01 PM Peter Xu <peterx@redhat.com> wrote:
>
> On Thu, May 20, 2021 at 03:06:30PM -0400, Zi Yan wrote:
> > On 20 May 2021, at 10:57, Peter Xu wrote:
> >
> > > On Thu, May 20, 2021 at 07:07:57PM +0530, Aneesh Kumar K.V wrote:
> > >> "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
> > >>
> > >>> On 5/20/21 6:16 PM, Peter Xu wrote:
> > >>>> On Thu, May 20, 2021 at 01:56:54PM +0530, Aneesh Kumar K.V wrote:
> > >>>>>> This seems to work at least for my userfaultfd test on shmem, ho=
wever I don't
> > >>>>>> fully understand the commit message [1] on: How do we guarantee =
we're not
> > >>>>>> moving a thp pte?
> > >>>>>>
> > >>>>>
> > >>>>> move_page_tables() checks for pmd_trans_huge() and ends up callin=
g
> > >>>>> move_huge_pmd if it is a THP entry.
> > >>>>
> > >>>> Sorry to be unclear: what if a huge pud thp?
> > >>>>
> > >>>
> > >>> I am still checking. Looking at the code before commit
> > >>> c49dd340180260c6239e453263a9a244da9a7c85, I don't see kernel handli=
ng
> > >>> huge pud thp. I haven't studied huge pud thp enough to understand
> > >>> whether c49dd340180260c6239e453263a9a244da9a7c85 intent to add that
> > >>> support.
> > >>>
> > >>> We can do a move_huge_pud() like we do for huge pmd thp. But I am n=
ot
> > >>> sure whether we handle those VMA's earlier and restrict mremap on t=
hem?
> > >>
> > >> something like this? (not even compile tested). I am still not sure
> > >> whether this is really needed or we handle DAX VMA's in some other f=
orm.
> > >
> > > Yeah maybe (you may want to at least drop that extra "case HPAGE_PUD"=
).
> > >
> > > It's just that if with CONFIG_HAVE_MOVE_PUD (x86 and arm64 enables it=
 by
> > > default so far) it does seem to work even with huge pud, while after =
this patch
> > > it seems to be not working anymore, even with your follow up fix.
> > >
> > > Indeed I saw CONFIG_HAVE_MOVE_PUD is introduced a few months ago so b=
reaking
> > > someone seems to be unlikely, perhaps no real user yet to mremap() a =
huge pud
> > > for dax or whatever backend?
> > >
> > > Ideally maybe rework this patch (or series?) and repost it for a bett=
er review?
> > > Agree the risk seems low.  I'll leave that to you and Andrew to decid=
e..
> >
> > It seems that the mremap function for 1GB DAX THP was not added when 1G=
B DAX THP
> > was implemented[1].
>
> Yes, but trickily as I mentioned it seems Android's CONFIG_HAVE_MOVE_PUD =
has
> done this right (with no intention I guess) with the set_pud_at() before =
this
> patch is merged, so we might have a short period that this might start to=
 work..
>
It may have coincidentally handled the huge PUD case, but I hadn't
considered huge PUDs when implementing the HAVE_MOVE_PUD patchset.  Or
as Zi suggested, huge PUD mremap may be unused atm, I haven't seen any
related breakages since enabling HAVE_MOVE_PUD for x86 and arm64

> > I guess no one is using mremap on 1GB DAX THP. Maybe we want
> > to at least add a warning or VM_BUG_ON to catch this or use Aneesh=E2=
=80=99s move_huge_pud()
> > to handle the situation properly?
>
> Agreed, if we decide to go with the patches, some warning (or even VM_BUG=
_ON,
> which iiuc should be very not-suggested in most cases) looks better than
> pgtable corruption reports.
>
> --
> Peter Xu
>
