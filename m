Return-Path: <linuxppc-dev+bounces-16918-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id vsMFJozXlGkgIQIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16918-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Feb 2026 22:03:08 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1CA1508FD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Feb 2026 22:03:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fFsYN6W0Zz2xHX;
	Wed, 18 Feb 2026 08:03:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::82f" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771362184;
	cv=pass; b=DdcNRvvnHsxTHSc47VFLRISDhgJ0KAUdp9scznsuAxJhXgIZ2v44xPIew1Q6crDtOzJ1ptuLd0sB9DAyHDwnjg+icgORxguK760p5p7sGWnkDuuUbdzwhO8FVTzEK5ZC35XBl7hhr/Jspgx3xPPP66DTGnB3qVSM2h/4rcu5NX4IS1d0/YgM45KnHNxT96ZOO2KmgwTsKPq1a9A/Q/PiIxZwBjs+UJag6Ytry68DJQdF+jhRFrSiJuAYkzMSAEJM8bxdQjCAk6Zk8GJZF1zFXrXOToc3zYrucIuoQ2zJTYRPohWrv3S1gU79jLFaJ8gVRJsNv2zevaj+UM8tGCHvQw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771362184; c=relaxed/relaxed;
	bh=Qg7unfpae37+olsmr8ztHQ2bOQfrmh4+RuxK8GGnbgk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=JtJD2lJYFOnNtS7IZu5/QTXrqzkNgYabzQqYMECb90fkrUzIukGFM6rcCp6Fngew8e7frTT8WivjkWp9n5DtBcQ08IMRnDLTxLBgWmO1ItiUCV3XljIezg/l7JPiE9FKhj/UkV7KpIK+QbFm34WbY8g8neeAWquers45UQVBxqI3capnqiTw98kPf5NYNQPJSpHY+m68KIShtucjtjo4tK4lWp7SQ8ywRkVhT9cKJRWemEhLjyTzzy2gQA6Jgpc81J7g+Hu4p0SICARCsbxvVQr1tldLi5v546FZf0OQR8EblgsRq7phOqUUawB/ZzTIspZklLUb0c8Gn9mMQiiXBA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=3Dz84Eie; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::82f; helo=mail-qt1-x82f.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=3Dz84Eie;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::82f; helo=mail-qt1-x82f.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fFsYM63z0z2x99
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Feb 2026 08:03:03 +1100 (AEDT)
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-5033b64256dso153661cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Feb 2026 13:03:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771362181; cv=none;
        d=google.com; s=arc-20240605;
        b=fNAZEBV1XAtQ+RrrYdFpkeTd5KW3OTHtJjJCGv8waZDZkrpXKAmiAdNudx5ahypEgB
         hw52qHIfSlurH0zBAyewR1rDZBV5+SFTd1axLNBNAxUpX/LWcFaGew827D0eJEfye8nk
         B991HV8JHQRXh0DSnr00iMX6dGy5iAdBFt35XECP7MbeE8zxgiS6uSjoA5K2og0+znyO
         eklnOlJFVcvOHQ3c46BSWnCGGjXHF9om6RLLJciUy2WwdR3vok5jAGL/XrwWYmanwi+e
         agYBCRha4OwBU1TqhAxXEyLk3/8JvnORxhZcwJe/ePa6HyinE/wj9qlVPHdTkLEKhZrr
         FPTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Qg7unfpae37+olsmr8ztHQ2bOQfrmh4+RuxK8GGnbgk=;
        fh=X/xI9y/W2TZhsixU61SOddJ0OZJ2V5wvnlo7FslyEs8=;
        b=Tv61EI3br11LT5M4GcVB6th4BepmQddCaXDXeZ8DD7CVn3uNIYWYSqeNXB7P7DGlSm
         OrAS9zeJD+210AZ/4ZDYfCdwvj2MebUslXjPtWXidwaZKarlqLlbMid1bQutCvmc96t5
         0+3evEmobJ5Veu0mj1/OCdFmtceaWEsIW+dtLBHe6G28z+f6r1g+bRtSRwk7elpDQI9b
         kMruhGxIiPvoUmomelMm8mGEH9aqd4hO5/qUjjFRL359cGlZQI9TShCnIuX3fiOirqjS
         oH0z3s4LpeX9RC+lJJEd4BfadB3PpzS/z4E4K2qQcmG0OfROnIBCXtPikABWrK5TJ+sE
         1VHw==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771362181; x=1771966981; darn=lists.ozlabs.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qg7unfpae37+olsmr8ztHQ2bOQfrmh4+RuxK8GGnbgk=;
        b=3Dz84Eie53AK23qcuTMFosgYPeHmn4tSz8XRo0xnb0kpI2gHubDfOexDsGZ820kEl0
         4kQwWWbNn8NOeIUyhHESJ/2cPz6u3h0Y3sXRyPYKrDGkd3bfBiBDyawq016c75euKNAn
         RRCgQIlaKHAM5qSxglTX4mIp1wESiq7ZfvcnAnKQ6m16Uu+2dbSaaIOeJD6q6hcv78Sf
         qx/f41e2EKgAI3xA606I/G50dBxW7zVeFDu1TCdr6zbnzpUQXa30Dt+SgNLJejq55N/3
         np8FWd37jok9aKkXYTaJPk1qwcvCx2IyisXxD//B/3E6OyrBAPix32NN6LT5a+1DG6zi
         NQAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771362181; x=1771966981;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qg7unfpae37+olsmr8ztHQ2bOQfrmh4+RuxK8GGnbgk=;
        b=gMnLAn+FpGGvf1cG4WHCbNeSlG2M7cmV1Eyyl1D03EBvWp07TNPD6mqWUxl7FNEw57
         6LedCJE7vm+UleCYA5Ud9mzN9tfShjzfhygLVruaPcVkqcjjaMKE6Fr9pteQ5q3FNW2v
         nMRZeqtYLNo4Y9H8dczzFW/+bTuO8Y4wyJlVxUOwFy/hJtIjm5gZFQgcBKIHji5qK9DR
         mDYQPnHePKJF+jWIZuEdv//dgy8Ieyl5tzAZbm+/9G6KcDoztQg8YLzG5hYxDVEyXq8r
         rLOSIsUxBHrs4UA/9HV6npWfVuKdp6HzOv9y7F8JOzO3ztA2V6u98t7kwQtc8uJibR8q
         lsgA==
X-Forwarded-Encrypted: i=1; AJvYcCWhpGlO/J2M2hdDwczue7C4irAcOz+pepL2kHE/8y1h2E9LgJUHHA/BZz1uUtxFf5ojNdqOd+hwZHT8ueo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyrLF/SUD1U0unuxaRonU8839sNzZ2PHPRozl4Pr13PCP/w98PM
	SBOCvnudl91roHMS8TJb+bqpQ7vys1u/ao4kSUYA7bVTJvKpB/IKlgTS9qzdSUDjfmjlkAqXjV+
	1cICQNrB1yvrj15Tq7MpcjONTIoLrjhmAv/UcDHBC
X-Gm-Gg: AZuq6aL0nxoVO3iWQZQtnHzDngV9risVLmfghQwg+H096JktY9c+OsgZjnF2ZyuvQ1W
	Eqw1NkbyH2oy3+siCTKmf4HktF2/oV0OKA7dwRXb5gfZ3YexfYSlEX7dxoJnb6ArIyK4jzkElGJ
	igwN4sQQBgL7JJpm25k6TKhoYWng0cYAU4jxbKIsgG/ys6j6A9OGPXWuoZ0mXcrYNpsJH+xeKew
	fcV0mqhDe0WALSL84amkCOE7RAUZZeLnp2ceLmdQCgROTG4yP/x+XOBOAiTFNwR0ka9y6TKGlUV
	613R625lw1/zUJa2YFXEv/4u3vjhQnnwHG59Iw==
X-Received: by 2002:a05:622a:8c15:b0:4ed:ff79:e679 with SMTP id
 d75a77b69052e-506cdb80f2fmr23179661cf.19.1771362180478; Tue, 17 Feb 2026
 13:03:00 -0800 (PST)
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
References: <20260217163250.2326001-1-surenb@google.com> <20260217163250.2326001-3-surenb@google.com>
 <dtdfrko7uqif6flc4mefnlar7wnmrbyswfu7bvb2ar24gkeejo@ypzhmyklbeh7>
In-Reply-To: <dtdfrko7uqif6flc4mefnlar7wnmrbyswfu7bvb2ar24gkeejo@ypzhmyklbeh7>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 17 Feb 2026 13:02:48 -0800
X-Gm-Features: AaiRm52hFtG7L6yJLkbXYH1SBTkTSuw2iS_25yQRkmcsbZ2JjkS2e-zgf6Q_wu8
Message-ID: <CAJuCfpGViU4dDaLtPR8U0C+=FXO=1TuU-hT3fypNQO3LGOjbcA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] mm: replace vma_start_write() with vma_start_write_killable()
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Suren Baghdasaryan <surenb@google.com>, 
	akpm@linux-foundation.org, willy@infradead.org, david@kernel.org, 
	ziy@nvidia.com, matthew.brost@intel.com, joshua.hahnjy@gmail.com, 
	rakie.kim@sk.com, byungchul@sk.com, gourry@gourry.net, 
	ying.huang@linux.alibaba.com, apopple@nvidia.com, lorenzo.stoakes@oracle.com, 
	baolin.wang@linux.alibaba.com, npache@redhat.com, ryan.roberts@arm.com, 
	dev.jain@arm.com, baohua@kernel.org, lance.yang@linux.dev, vbabka@suse.cz, 
	jannh@google.com, rppt@kernel.org, mhocko@suse.com, pfalcato@suse.de, 
	kees@kernel.org, maddy@linux.ibm.com, npiggin@gmail.com, mpe@ellerman.id.au, 
	chleroy@kernel.org, borntraeger@linux.ibm.com, frankja@linux.ibm.com, 
	imbrenda@linux.ibm.com, hca@linux.ibm.com, gor@linux.ibm.com, 
	agordeev@linux.ibm.com, svens@linux.ibm.com, gerald.schaefer@linux.ibm.com, 
	linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org, 
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-15.7 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:Liam.Howlett@oracle.com,m:surenb@google.com,m:akpm@linux-foundation.org,m:willy@infradead.org,m:david@kernel.org,m:ziy@nvidia.com,m:matthew.brost@intel.com,m:joshua.hahnjy@gmail.com,m:rakie.kim@sk.com,m:byungchul@sk.com,m:gourry@gourry.net,m:ying.huang@linux.alibaba.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:baolin.wang@linux.alibaba.com,m:npache@redhat.com,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:baohua@kernel.org,m:lance.yang@linux.dev,m:vbabka@suse.cz,m:jannh@google.com,m:rppt@kernel.org,m:mhocko@suse.com,m:pfalcato@suse.de,m:kees@kernel.org,m:maddy@linux.ibm.com,m:npiggin@gmail.com,m:mpe@ellerman.id.au,m:chleroy@kernel.org,m:borntraeger@linux.ibm.com,m:frankja@linux.ibm.com,m:imbrenda@linux.ibm.com,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:svens@linux.ibm.com,m:gerald.schaefer@linux.ibm.com,m:linux-mm@kvack.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-s390@vger.
 kernel.org,m:ritesh.list@gmail.com,m:joshuahahnjy@gmail.com,m:riteshlist@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[oracle.com,google.com,linux-foundation.org,infradead.org,kernel.org,nvidia.com,intel.com,gmail.com,sk.com,gourry.net,linux.alibaba.com,redhat.com,arm.com,linux.dev,suse.cz,suse.com,suse.de,linux.ibm.com,ellerman.id.au,kvack.org,lists.ozlabs.org,vger.kernel.org];
	FORGED_SENDER(0.00)[surenb@google.com,linuxppc-dev@lists.ozlabs.org];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[44];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[surenb@google.com,linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16918-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:email,infradead.org:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 6F1CA1508FD
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 11:19=E2=80=AFAM Liam R. Howlett
<Liam.Howlett@oracle.com> wrote:
>
> * Suren Baghdasaryan <surenb@google.com> [260217 11:33]:
> > Now that we have vma_start_write_killable() we can replace most of the
> > vma_start_write() calls with it, improving reaction time to the kill
> > signal.
> >
> > There are several places which are left untouched by this patch:
> >
> > 1. free_pgtables() because function should free page tables even if a
> > fatal signal is pending.
> >
> > 2. process_vma_walk_lock(), which requires changes in its callers and
> > will be handled in the next patch.
> >
> > 3. userfaultd code, where some paths calling vma_start_write() can
> > handle EINTR and some can't without a deeper code refactoring.
> >
> > 4. vm_flags_{set|mod|clear} require refactoring that involves moving
> > vma_start_write() out of these functions and replacing it with
> > vma_assert_write_locked(), then callers of these functions should
> > lock the vma themselves using vma_start_write_killable() whenever
> > possible.
> >
> > Suggested-by: Matthew Wilcox <willy@infradead.org>
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com> # powerpc
> > ---
> >  arch/powerpc/kvm/book3s_hv_uvmem.c |  5 +-
> >  include/linux/mempolicy.h          |  5 +-
> >  mm/khugepaged.c                    |  5 +-
> >  mm/madvise.c                       |  4 +-
> >  mm/memory.c                        |  2 +
> >  mm/mempolicy.c                     | 23 ++++++--
> >  mm/mlock.c                         | 20 +++++--
> >  mm/mprotect.c                      |  4 +-
> >  mm/mremap.c                        |  4 +-
> >  mm/vma.c                           | 93 +++++++++++++++++++++---------
> >  mm/vma_exec.c                      |  6 +-
> >  11 files changed, 123 insertions(+), 48 deletions(-)
> >
>
> ...
>
> > --- a/mm/mempolicy.c
> > +++ b/mm/mempolicy.c
>
> ...
>
> >
> >  static const struct mempolicy_operations mpol_ops[MPOL_MAX] =3D {
> > @@ -1785,9 +1793,15 @@ SYSCALL_DEFINE4(set_mempolicy_home_node, unsigne=
d long, start, unsigned long, le
> >               return -EINVAL;
> >       if (end =3D=3D start)
> >               return 0;
> > -     mmap_write_lock(mm);
> > +     if (mmap_write_lock_killable(mm))
> > +             return -EINTR;
> >       prev =3D vma_prev(&vmi);
> >       for_each_vma_range(vmi, vma, end) {
> > +             if (vma_start_write_killable(vma)) {
> > +                     err =3D -EINTR;
> > +                     break;
> > +             }
> > +
> >               /*
> >                * If any vma in the range got policy other than MPOL_BIN=
D
> >                * or MPOL_PREFERRED_MANY we return error. We don't reset
> > @@ -1808,7 +1822,6 @@ SYSCALL_DEFINE4(set_mempolicy_home_node, unsigned=
 long, start, unsigned long, le
> >                       break;
> >               }
> >
> > -             vma_start_write(vma);
>
> Moving this vma_start_write() up means we will lock all vmas in the
> range regardless of if they are going to change.  Was that your
> intention?

No, I missed that this would result in unnecessary locks.

>
> It might be better to move the locking to later in the loop, prior to
> the mpol_dup(), but after skipping other vmas?

Yes, that's the right place for it. Will move.

>
> >               new->home_node =3D home_node;
> >               err =3D mbind_range(&vmi, vma, &prev, start, end, new);
>
> ...
>
> > diff --git a/mm/vma.c b/mm/vma.c
> > index bb4d0326fecb..1d21351282cf 100644
> > --- a/mm/vma.c
> > +++ b/mm/vma.c
>
> ...
>
> > @@ -2532,6 +2556,11 @@ static int __mmap_new_vma(struct mmap_state *map=
, struct vm_area_struct **vmap)
> >               goto free_vma;
> >       }
> >
> > +     /* Lock the VMA since it is modified after insertion into VMA tre=
e */
> > +     error =3D vma_start_write_killable(vma);
> > +     if (error)
> > +             goto free_iter_vma;
> > +
> >       if (map->file)
> >               error =3D __mmap_new_file_vma(map, vma);
> >       else if (map->vm_flags & VM_SHARED)
> > @@ -2552,8 +2581,6 @@ static int __mmap_new_vma(struct mmap_state *map,=
 struct vm_area_struct **vmap)
> >       WARN_ON_ONCE(!arch_validate_flags(map->vm_flags));
> >  #endif
> >
> > -     /* Lock the VMA since it is modified after insertion into VMA tre=
e */
> > -     vma_start_write(vma);
> >       vma_iter_store_new(vmi, vma);
> >       map->mm->map_count++;
> >       vma_link_file(vma, map->hold_file_rmap_lock);
>
> This is a bit of a nit on the placement..
>
> Prior to this change, the write lock on the vma was taken next to where
> it was inserted in the tree.  Now the lock is taken between vma iterator
> preallocations and part of the vma setup.
>
> Would it make sense to put it closer to the vma allocation itself?  I
> think all that's needed to be set is the mm struct for the locking to
> work?

I guess locking the vma before vma_iter_prealloc() would save us
unnecessary alloc/free in case of a pending fatal signal. I'll move
the lock right after vm_area_alloc() so that the entire vma setup is
done on a locked vma.

>
>
> ...
>
> > @@ -3089,7 +3120,7 @@ int expand_upwards(struct vm_area_struct *vma, un=
signed long address)
>
> Good luck testing this one.

Yeah... Any suggestions for tests I should use?

>
> >       struct mm_struct *mm =3D vma->vm_mm;
> >       struct vm_area_struct *next;
> >       unsigned long gap_addr;
> > -     int error =3D 0;
> > +     int error;
> >       VMA_ITERATOR(vmi, mm, vma->vm_start);
> >
> >       if (!(vma->vm_flags & VM_GROWSUP))
> > @@ -3126,12 +3157,14 @@ int expand_upwards(struct vm_area_struct *vma, =
unsigned long address)
> >
> >       /* We must make sure the anon_vma is allocated. */
> >       if (unlikely(anon_vma_prepare(vma))) {
> > -             vma_iter_free(&vmi);
> > -             return -ENOMEM;
> > +             error =3D -ENOMEM;
> > +             goto free;
> >       }
> >
> >       /* Lock the VMA before expanding to prevent concurrent page fault=
s */
> > -     vma_start_write(vma);
> > +     error =3D vma_start_write_killable(vma);
> > +     if (error)
> > +             goto free;
> >       /* We update the anon VMA tree. */
> >       anon_vma_lock_write(vma->anon_vma);
> >
> > @@ -3160,6 +3193,7 @@ int expand_upwards(struct vm_area_struct *vma, un=
signed long address)
> >               }
> >       }
> >       anon_vma_unlock_write(vma->anon_vma);
> > +free:
> >       vma_iter_free(&vmi);
> >       validate_mm(mm);
> >       return error;
>
> Looks okay.

Thanks for the review, Liam! I'll wait a couple of days and post the
v3 with fixes.

>
> ...
>
>
>

