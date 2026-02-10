Return-Path: <linuxppc-dev+bounces-16791-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2MWSOCbCi2l6aQAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16791-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Feb 2026 00:41:26 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6CD120222
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Feb 2026 00:41:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f9dPG4RW3z2xll;
	Wed, 11 Feb 2026 10:41:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::833" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770766882;
	cv=pass; b=FkEniCCgE3c5kVXa2PJ65VFjjKDs5pZ9I4afoEqg4dqR192CUBFruFXNcPahPICfiSYd2rrc2OUkZSv4Befob8viK2dUOjXL9gJw0PTga+sV4h3Qc3y3LapYAe+XaOJoGGUIgYBMrIfntkhg30hdumNw5+ruH/Gs2M+zq5ugAzVcePd5spm2TKc+A4D3X2CbNCn2cwFvx4RWt9sjATN2hcsmoeNs+9SsoiNDPKeoS/6UbI5AuGzz97CxRM+m+f7YXQ+ZHIXpkQnm3CSt2v31eYl8nKOTboAoIIWirh/NGgXhYhHh14pncQudXO2jXI8u9MreIrsGwPW0gioygfNAHw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770766882; c=relaxed/relaxed;
	bh=udnAXYhV8NVH9LmStk7ouTFsolaMp28MpPWhOY0c84I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UoIPsuFf3Hs9XBTdxv+9nYPY6Qb6bJmDF4/x5YmEyTUmAAPU/5VKzYdCh4g8bqPGY4CudllqGVPRmqfbg68YzEz/60ZeScJfq2pqjDDpT2ZKgBCLZAfiJCj+rBDXthp1VpcO02//hHEk2IPf929NS1TvaR72U6+3uc8Vh8bkZgyxlQrNH1GHKcEqda4c3hA9DnK84pQc+BxN56xNLmbfPL3jEksnjAvigLkKYfIKXxecOtCw01tC+xFPVvZ/XZOtsUVWVprZD2/szBy7nE+Hc4e4JsyR4rkO0fvF/RjIUvXDrCM8Okq9dtho8j8SfNqNV2W57J1w8tJw8J6WdWgFZQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=yIIF9DtV; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::833; helo=mail-qt1-x833.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=yIIF9DtV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::833; helo=mail-qt1-x833.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f9dPF0Wygz2xlj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Feb 2026 10:41:20 +1100 (AEDT)
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-5033b64256dso103721cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Feb 2026 15:41:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770766877; cv=none;
        d=google.com; s=arc-20240605;
        b=MLhevGKqeKeSLC0HKeVpxlex7f9Sdzk9Tp0+oTK9e7GCeI1PtA5F/7sQTjx1yL2fH7
         64lZxJaevew7BUNP2IZIffii7Q3hfz1FXsju7WOFFbRXX+6lNuN8f6RxHqws0L5WFIM/
         0MMppbNQecOqsnXS4ZUHhzj0v88SZhzJ9j4skpuoBjeOjdefuuN4cgZkalXd06gywUkU
         +cAsg+nBzt9infOgp7wd7W80leYfUEDVn7xMqmW2MyBF3CPT+z4+xLNLU1seoAoZWl83
         WsmoV42HeESTvA5Zg/jUeXWnrNypv8sTihRVa/EHuh+RF0QXynJgHrlr/Inke7Fp/qMg
         uNDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=udnAXYhV8NVH9LmStk7ouTFsolaMp28MpPWhOY0c84I=;
        fh=NCMYo2YAjSH7fe/V7oSUi3/pIIE92ciUVyD+Rp6uIj8=;
        b=WNWD8JosvGKIdcX38ZgF1RBwtEPCJF4A4gMNGCXSDgTKjnIQ4kATeQljWGjrKCW1xF
         eA0x9ciC4gOy+Rwc97Y/u/ChzadK7cj1yr+RU+ofHLX8V+8O7n0GCFxuBf3hhuiBg6uj
         EeOZJhnJopXlb4+elXNw27Cp614FxiuyPDW9fJ6NKJdmuv4ahdYGWBdwX9y1tBae7S7G
         UvFRw/IyYOAR9e/b/xbM5fOiKsumE95tszsdFZ6ETpI0BMe6WpUQ/CpfuHGWd9RH6B8B
         qRFWfPHqD/tV5J4EBWv8Ya0xCUHD1BTQvHatL5AqzaRbnjBASGePwGgqOnM+unthx9oH
         f5jg==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770766877; x=1771371677; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=udnAXYhV8NVH9LmStk7ouTFsolaMp28MpPWhOY0c84I=;
        b=yIIF9DtVGCvEAQE5o0aiE+AeN21zf/OULlVPZyX1xCrV1/sdmKB/qxFJBhsjEz9BYc
         JHeGOizry13i10tCZaxpKNXtRjB/oBj82ryEg+SK09uBptDmYeQLwlg/XoOlHoQvp+Mf
         7jMkriLVqDoi2bGa19puUvVMyKCv+rKJlp/mtzDE/lluYHl0Ch+6NEiofE2/eUrB76BQ
         abwE/3nJ+OM7OsNEcZPsrpeAiYowYLzlp+b4vtE3A3NmuDmKiehGhvel/7ZTaF6cuveg
         OQu2/NRzS0gVq4uyGeZ6yi4IYS/o+26LRSkPyp5v/u3GAImW3/Qc1HQFg9d62wpWZK8w
         hkkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770766877; x=1771371677;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=udnAXYhV8NVH9LmStk7ouTFsolaMp28MpPWhOY0c84I=;
        b=OK0JdVWuJcJ1DGSPAqjwlStYofjw8lgMmr6C3nZEkTu7xrmABNA0i/fvLUWjTJpjlz
         rNtPbMkfHQxH6jhI49loEbBJRp8gONAxEqSa8F/orJdBOmtjG00ruN+UaLNm3kCfbH4D
         djNliBZVcZVFoDN/FgIOcYac3pImKj28gBnjJfuYXTfOhUPXX1LncXPBNco/+APzY03E
         /KVNSY/9MrtkOklneJzu7s2rzUbcHghmPtJhLHlhYlzYCx8h96Mw2twbnWHDb0CNGcz2
         qhMT2Yb/7fdvbgeW7KyeSvi+N75rkHPAbkbSNC0KAwxrtmm3rruc+2cyQB38r9+XoFKl
         DsTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnBDZkFfnrI9GgK8dsVv6GjMvDA5aD0wMf9XFNFuKJrFwwef70vsT5zfN38Z8JRSt2kVy2p+Pse8Vx8wA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxxLQnLOqLSwnsKUXX+TnqCQmbX42Z7kbxKFIcIr8H8u2ghd9DR
	wxO3uai+Zil9LMbBcwniXhOm0JxdJNNZdimMsOzL97rm1I/xU7SbP6o0mFSd0IEb5JD3YqMk/ac
	EUj1SABWrq2kJnrt47HZtoUNJphSvlqAJraketPGQ
X-Gm-Gg: AZuq6aLaF5I4+rNmrmbrnJUvKkdbJlWQf8YqR//NvORTmpwSkRkSj5vC1ev3ynhzQfk
	VRw1KIrJ3DgjP8l1qsGXhN20VBnHme5O5KeUwFRQr3ZRHoACmONgcQoVNrsgF5oqfRvqL04dnxI
	6BdxJiOhvDlikU/BGYQ6bVZNZEtBXvWHq3wdyXfjvomwWP8EF68/MQu2ObtUvxtwPve9MFCVITJ
	+s3KWyAMLdxI39JoPU7elil5VXPrET2QLEzV+14OAmHEmW0FWoLSBzy7F0KPYIRtDLzFZPSK/2/
	Q84W3Q==
X-Received: by 2002:a05:622a:138c:b0:503:4bc:c925 with SMTP id
 d75a77b69052e-50682758209mr2319781cf.13.1770766876608; Tue, 10 Feb 2026
 15:41:16 -0800 (PST)
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
References: <20260209220849.2126486-1-surenb@google.com> <CAG48ez2zFfCO7RKhHKaATFge7DWzaTfO+Yta0y4_HXGHZAtkqw@mail.gmail.com>
In-Reply-To: <CAG48ez2zFfCO7RKhHKaATFge7DWzaTfO+Yta0y4_HXGHZAtkqw@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 10 Feb 2026 15:41:05 -0800
X-Gm-Features: AZwV_QjArW2JodMN7wRauZ3Ugy-7cBqUa9oRhicJr9JxwV2UIkPUp8XXpXf8gmc
Message-ID: <CAJuCfpGKoy2Aj9f-gfKDmsa5wWvv9=b3mS6hRgaADQGrd8dYEQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] mm: replace vma_start_write() with vma_start_write_killable()
To: Jann Horn <jannh@google.com>
Cc: akpm@linux-foundation.org, willy@infradead.org, david@kernel.org, 
	ziy@nvidia.com, matthew.brost@intel.com, joshua.hahnjy@gmail.com, 
	rakie.kim@sk.com, byungchul@sk.com, gourry@gourry.net, 
	ying.huang@linux.alibaba.com, apopple@nvidia.com, lorenzo.stoakes@oracle.com, 
	baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com, npache@redhat.com, 
	ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org, 
	lance.yang@linux.dev, vbabka@suse.cz, rppt@kernel.org, mhocko@suse.com, 
	pfalcato@suse.de, kees@kernel.org, maddy@linux.ibm.com, npiggin@gmail.com, 
	mpe@ellerman.id.au, chleroy@kernel.org, linux-mm@kvack.org, 
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
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
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:jannh@google.com,m:akpm@linux-foundation.org,m:willy@infradead.org,m:david@kernel.org,m:ziy@nvidia.com,m:matthew.brost@intel.com,m:joshua.hahnjy@gmail.com,m:rakie.kim@sk.com,m:byungchul@sk.com,m:gourry@gourry.net,m:ying.huang@linux.alibaba.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:baolin.wang@linux.alibaba.com,m:Liam.Howlett@oracle.com,m:npache@redhat.com,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:baohua@kernel.org,m:lance.yang@linux.dev,m:vbabka@suse.cz,m:rppt@kernel.org,m:mhocko@suse.com,m:pfalcato@suse.de,m:kees@kernel.org,m:maddy@linux.ibm.com,m:npiggin@gmail.com,m:mpe@ellerman.id.au,m:chleroy@kernel.org,m:linux-mm@kvack.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:joshuahahnjy@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[surenb@google.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	TAGGED_FROM(0.00)[bounces-16791-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[surenb@google.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linux-foundation.org,infradead.org,kernel.org,nvidia.com,intel.com,gmail.com,sk.com,gourry.net,linux.alibaba.com,oracle.com,redhat.com,arm.com,linux.dev,suse.cz,suse.com,suse.de,linux.ibm.com,ellerman.id.au,kvack.org,lists.ozlabs.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Queue-Id: 2C6CD120222
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 1:19=E2=80=AFPM Jann Horn <jannh@google.com> wrote:
>
> On Mon, Feb 9, 2026 at 11:08=E2=80=AFPM Suren Baghdasaryan <surenb@google=
.com> wrote:
> > Now that we have vma_start_write_killable() we can replace most of the
> > vma_start_write() calls with it, improving reaction time to the kill
> > signal.
> [...]
> > diff --git a/mm/mempolicy.c b/mm/mempolicy.c
> > index dbd48502ac24..3de7ab4f4cee 100644
> > --- a/mm/mempolicy.c
> > +++ b/mm/mempolicy.c
> [...]
> > @@ -1808,7 +1817,11 @@ SYSCALL_DEFINE4(set_mempolicy_home_node, unsigne=
d long, start, unsigned long, le
> >                         break;
> >                 }
> >
> > -               vma_start_write(vma);
> > +               if (vma_start_write_killable(vma)) {
> > +                       err =3D -EINTR;
>
> Doesn't this need mpol_put(new)? Or less complicated, move the
> vma_start_write_killable() up to somewhere above the mpol_dup() call.

Thanks for the review, Jann!

Yes you are right. I'll move it before mpol_dup().

>
> > +                       break;
> > +               }
> > +
> >                 new->home_node =3D home_node;
> >                 err =3D mbind_range(&vmi, vma, &prev, start, end, new);
> >                 mpol_put(new);
> [...]
> > diff --git a/mm/pagewalk.c b/mm/pagewalk.c
> > index a94c401ab2cf..dc9f7a7709c6 100644
> > --- a/mm/pagewalk.c
> > +++ b/mm/pagewalk.c
> > @@ -425,14 +425,13 @@ static inline void process_mm_walk_lock(struct mm=
_struct *mm,
> >                 mmap_assert_write_locked(mm);
> >  }
> >
> > -static inline void process_vma_walk_lock(struct vm_area_struct *vma,
> > +static inline int process_vma_walk_lock(struct vm_area_struct *vma,
> >                                          enum page_walk_lock walk_lock)
> >  {
> >  #ifdef CONFIG_PER_VMA_LOCK
> >         switch (walk_lock) {
> >         case PGWALK_WRLOCK:
> > -               vma_start_write(vma);
> > -               break;
> > +               return vma_start_write_killable(vma);
>
> There are two users of PGWALK_WRLOCK in arch/s390/mm/gmap.c code that
> don't check pagewalk return values, have you checked that they are not
> negatively affected by this new possible error return?

Uh, even the ones which check for the error like queue_pages_range()
don't seem to handle it well. I'll split this part into a separate
patch as I think it will be sizable and will go over all users to
ensure they handle the new error.

>
> >         case PGWALK_WRLOCK_VERIFY:
> >                 vma_assert_write_locked(vma);
> >                 break;
> [...]
> > diff --git a/mm/vma.c b/mm/vma.c
> > index be64f781a3aa..3cfb81b3b7cf 100644
> > --- a/mm/vma.c
> > +++ b/mm/vma.c
> > @@ -540,8 +540,12 @@ __split_vma(struct vma_iterator *vmi, struct vm_ar=
ea_struct *vma,
> >         if (new->vm_ops && new->vm_ops->open)
> >                 new->vm_ops->open(new);
> >
> > -       vma_start_write(vma);
> > -       vma_start_write(new);
> > +       err =3D vma_start_write_killable(vma);
> > +       if (err)
> > +               goto out_fput;
> > +       err =3D vma_start_write_killable(new);
> > +       if (err)
> > +               goto out_fput;
>
> What about the new->vm_ops->open() call and the anon_vma_clone()
> above? I don't think the error path properly undoes either. These
> calls should probably be moved further up, so that the point of no
> return in this function stays where it was.

Ack.

>
> >         init_vma_prep(&vp, vma);
> >         vp.insert =3D new;
> [...]
> > @@ -1155,10 +1168,12 @@ int vma_expand(struct vma_merge_struct *vmg)
> >         struct vm_area_struct *next =3D vmg->next;
> >         bool remove_next =3D false;
> >         vm_flags_t sticky_flags;
> > -       int ret =3D 0;
> > +       int ret;
> >
> >         mmap_assert_write_locked(vmg->mm);
> > -       vma_start_write(target);
> > +       ret =3D vma_start_write_killable(target);
> > +       if (ret)
> > +               return ret;
> >
> >         if (next && target !=3D next && vmg->end =3D=3D next->vm_end)
> >                 remove_next =3D true;
> > @@ -1186,17 +1201,19 @@ int vma_expand(struct vma_merge_struct *vmg)
> >          * Note that, by convention, callers ignore OOM for this case, =
so
> >          * we don't need to account for vmg->give_up_on_mm here.
> >          */
> > -       if (remove_next)
> > +       if (remove_next) {
> > +               ret =3D vma_start_write_killable(next);
> > +               if (ret)
> > +                       return ret;
> >                 ret =3D dup_anon_vma(target, next, &anon_dup);
> > +       }
> >         if (!ret && vmg->copied_from)
> >                 ret =3D dup_anon_vma(target, vmg->copied_from, &anon_du=
p);
> >         if (ret)
> >                 return ret;
>
> nit: the control flow here is kinda chaotic, with some "if (ret)
> return ret;" mixed with "if (!ret && ...) ret =3D ...;".

I'll see what I can do about it but probably as a separate patch.

>
> >
> > -       if (remove_next) {
> > -               vma_start_write(next);
> > +       if (remove_next)
> >                 vmg->__remove_next =3D true;
> > -       }
> >         if (commit_merge(vmg))
> >                 goto nomem;
> >
> [...]
> > @@ -2211,9 +2240,8 @@ int mm_take_all_locks(struct mm_struct *mm)
> >          * is reached.
> >          */
> >         for_each_vma(vmi, vma) {
> > -               if (signal_pending(current))
> > +               if (vma_start_write_killable(vma))
> >                         goto out_unlock;
> > -               vma_start_write(vma);
>
> nit: might want to keep the signal_pending() so that this can sort of
> be interrupted by non-fatal signals, which seems to be the intention

Yes, I will bring back that check.

>
> >         }
> >
> >         vma_iter_init(&vmi, mm, 0);
> > @@ -2549,7 +2577,9 @@ static int __mmap_new_vma(struct mmap_state *map,=
 struct vm_area_struct **vmap)
> >  #endif
> >
> >         /* Lock the VMA since it is modified after insertion into VMA t=
ree */
> > -       vma_start_write(vma);
> > +       error =3D vma_start_write_killable(vma);
> > +       if (error)
> > +               goto free_iter_vma;
>
> This seems way past the point of no return, we've already called the
> ->mmap() handler which I think means removing the VMA again would
> require a ->close() call. The VMA should be locked further up if we
> want to do it killably.

Yeah, I realized this big issue after posting the patch. Moving it up
seems possible, so I'll try that.

Thanks,
Suren.

>
> >         vma_iter_store_new(vmi, vma);
> >         map->mm->map_count++;
> >         vma_link_file(vma, map->hold_file_rmap_lock);
> >

