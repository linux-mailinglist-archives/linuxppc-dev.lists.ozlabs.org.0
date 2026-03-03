Return-Path: <linuxppc-dev+bounces-17636-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4LJ3J9NNp2nKggAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17636-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 22:08:35 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 279D81F72EC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 22:08:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQT1C0fhMz2xS3;
	Wed, 04 Mar 2026 08:08:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::82a" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772572110;
	cv=pass; b=YTu7OPbYQVBMcBas1uWgDccaTkthu6MyfR/Wx0T+xvlTVX4CRnhg+XNe4bhQKkjlPWUXez+wTU93b7dXKMuIzCeu4h2/lSrgl+7Eik7wo8Mef5o12UMF0qFtfxQT7QPlSeXmPlfUMS6Se1mCeEvjZF01sRLYEcOwF7QgHVEc7jBANMDGWudpBY/7G+RycpNwln95X2BvUTg9CtyE9PQSYTLW12Tr5ZKkbuBg0YlwMHkFL2TllWAHHMk5uPeF9qqpRBNBq91+x3CGVW5AKHdpJXyG4q56hVt/kt4ezjdYbfuSVXVvC2tz2AjEGPsHZgoaEDLH0j6DYELsOZVu8tGpWw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772572110; c=relaxed/relaxed;
	bh=Wn5qswiKl5vyNXCasCn1z2S9Z34vPhCjx+1iyWUKiGQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nqd9s4K+F1iE6Jt2JMcjRQ2984OnoFJqXiDNhWA1GmYj9TyFNxEusdzIt7TaC0upLfKAC5hZSaXb2hCGDiKVzYu0vHOaxGL3yxc+I0iefAxtRWGSZuqWfQsZDXL0ch2wtl/nLsxd+o6Ox+3xFBm/zBKcwvApAf00W6wlYzJi9ItA2weiphAOG5cwd+Jybgq0Tx1ahAw7ZUv6ENetUTQvMPwEbjWgzzxp8cR4q4LG+DIVUGEveDujxdk55pZEFRGjoZsLmSYJ388m2dl4gOSOdhq+DGF37vBOxv9as68kSir7SxE75Cima3OldWC/sD5La4tL1FwB/6AwoYXugvZJhA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=vpKFI53u; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::82a; helo=mail-qt1-x82a.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=vpKFI53u;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::82a; helo=mail-qt1-x82a.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQT193k77z2xN8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 08:08:28 +1100 (AEDT)
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-505d3baf1a7so652361cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Mar 2026 13:08:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772572106; cv=none;
        d=google.com; s=arc-20240605;
        b=VL5nkMVCJc57gMM+/zj/+MG0lAiHJTvKE/57KMwE4BV+mMzAZlkMgfGBlwyBnwC8TV
         Gs7/jdEHk25pHzTQ+IBsR0sAxUv1HsBYAxNAcdfN74M4sW/pvYu76bj3EngMtfOJlpXQ
         20rwelez8a9ld1ApaWocf5hX5iKqEM5rt+McAHrxCTtk18Lm+CAS4ks7Lptz43DkkFNp
         46LFhz9a22Tn++Auc3pM3iBAEVaNb0NyRsITJvAb/MVmY9PKHJJt+5Xza5GKEx0nHcVv
         qNBGxjlJUycIRL6GwMa9p++2GcIfgJLCEujjEJV9wFPmJnCXyrEzKZx+1dD/q1onrLUN
         CNZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Wn5qswiKl5vyNXCasCn1z2S9Z34vPhCjx+1iyWUKiGQ=;
        fh=42CWBT6hMXmwtRACUShFX9HRajVnGBofzKKdzIriJRA=;
        b=hYoPA593KFIzLEjCwCAuSUJubG+75uGuZgI+GzrJMlc+aY026o/WmgpFVXjfi8rOVV
         ZP+RC0eAl8GVbk+oD6IPfk0M5u2opGqvE3TMPgFwpZ6UDWrY5xP2lT5Mp1ELisBz+W3t
         w2YqN0DdA2ccnGicA/5KUeYOe1gU0kuuz+IXM9vqStWVDEc0O/qvbkpAf9CxRttehjka
         wAQNDu92a6zAkFbUAwhCfjGnCMGfGgnQXa20Usndpo+FpJfs8HiHxD+P2mtROhRV4Mnb
         ksOyf5su/BNbxCmQ9c4Ov6ZhRsBVTUa94O4IJOp35B/8XjaEz4SXGbhn0r4A8OpTaL16
         wFcQ==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772572106; x=1773176906; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wn5qswiKl5vyNXCasCn1z2S9Z34vPhCjx+1iyWUKiGQ=;
        b=vpKFI53ukt/e1WM58TDVkZ3/cHx8HnUJu0gTshSi7hrO5rehUzjlVAIz/E8dihNY5k
         46F9QV+jYHsiuKZiGdZBA0DNGqiv/+pdrOIv0YaUmhsWh0vRTTd73JKqySsK/M2gx0dX
         5fNG+Of8bFIK3BDvD6d0jbIdt/CQ4FdlLPxUFIkPjmi8QhuEfZxg1bwtYLBBGtvkRPhJ
         t7REIkzpmmyXk5Zx63LPXgJfz9qTB8gKocjaIxNRnTCB3fMti3QWp6yUIBXlK6TiQXzc
         mQF6/JB+HC9yPwiFF9itJnBV3Zw3pMSAU2h7Vyo/3OdM9BAN8tBXyU7LGCYYdBQaI+hv
         S+5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772572106; x=1773176906;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Wn5qswiKl5vyNXCasCn1z2S9Z34vPhCjx+1iyWUKiGQ=;
        b=RczXdQOJOWgsLvny1IwZ2U4vOh15SpMRnFCHCpl+gYUfPJ5/RS2HxbdlINVdevS172
         5numoLqeUj6whyWQLKiOJ3cOYciVcoy5XA1jUcCLFLoUs0T1mKYEGE9/0XIRnNCVmVsl
         MxHIJAzhc4j5ZM3hytsmUc98kZdVpmR0fYixokB9kSz18ldJ6iPrkQ1BeP1vjl/xtwy6
         xJPVjPOm1rQSZsd3YXE9fDEu0czj+/lfqH8i0MmZaXMi35o/w4fD7LyCDm0JZBrDZALS
         Zje02cY6n1txDLuZ7msgnxC3fv/l6JfUHIjQci0meSeJJCM6G+RBdPKizEy6D2nt2Wqt
         NUlA==
X-Forwarded-Encrypted: i=1; AJvYcCXMaXa/ba7gTg1NvF2oU56qmkgWzZ759pSggD7TAr72KmuFt+xd6hdeteFHKjjH9y3W31cQSDKl3G8EOcA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx0VvkpK5UETRv9FreZIQRUIX1yLE5LUXOBwzaf4o1t4rWJK9ph
	p1txX2P2c6+Adr4iAZAGSlahKaQx+xL3nan2ZlVB+lpXu15ROvwY+5DfVHmGHBr5J0uEtEgF9cV
	40IR4BbUgDWTxaLOMu+epMOGMv1Xe4zuS2HEx+iag
X-Gm-Gg: ATEYQzwfPg0WtC18kVocyye+Xo5Op5NEKQT5pp+qkJ4jbjyZgKTCi8YAtuDuJFEhf9m
	EiO2BkW/H3aw3oGv8tkL/ogWclNUg38s90P76YqrdQKjmNJNXUHajgYSnpajotydGKMiFSxnMfu
	3e+e3nVOR97m9rZB4mtuUwtO4Y+fnQpHdK2Vx7oY4snF6/llCWRVk2acdSIJzKctKy6KCtYIx22
	tYqKtM9KTRvLQy2JIZJIJegOli1Fsue5ScvfC1u5b35mH6FKfN9DsJUG+SOEYul9vrkHFqSk6u4
	g5YKeJSL/ilh6cIlpfswZTcoh72PzOGEw4GE
X-Received: by 2002:a05:622a:1999:b0:506:1f23:e22c with SMTP id
 d75a77b69052e-5075fcedcc2mr43645141cf.6.1772572105403; Tue, 03 Mar 2026
 13:08:25 -0800 (PST)
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
References: <20260226070609.3072570-1-surenb@google.com> <20260226070609.3072570-2-surenb@google.com>
 <877a55ac-b12d-4997-8c0f-fc0405220a63@lucifer.local>
In-Reply-To: <877a55ac-b12d-4997-8c0f-fc0405220a63@lucifer.local>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 3 Mar 2026 13:08:13 -0800
X-Gm-Features: AaiRm50S7J7MsSFOK2DH7gtLJxKekAGMKhFqAJWn8DaN9ladXIEjtSX1nx_7JMk
Message-ID: <CAJuCfpHD8wKJTpaRjZtUR3d+e4hSPH4GyL9DCKwbVWDVxWXRug@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] mm/vma: cleanup error handling path in vma_expand()
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, willy@infradead.org, david@kernel.org, 
	ziy@nvidia.com, matthew.brost@intel.com, joshua.hahnjy@gmail.com, 
	rakie.kim@sk.com, byungchul@sk.com, gourry@gourry.net, 
	ying.huang@linux.alibaba.com, apopple@nvidia.com, 
	baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com, npache@redhat.com, 
	ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org, 
	lance.yang@linux.dev, vbabka@suse.cz, jannh@google.com, rppt@kernel.org, 
	mhocko@suse.com, pfalcato@suse.de, kees@kernel.org, maddy@linux.ibm.com, 
	npiggin@gmail.com, mpe@ellerman.id.au, chleroy@kernel.org, 
	borntraeger@linux.ibm.com, frankja@linux.ibm.com, imbrenda@linux.ibm.com, 
	hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com, 
	svens@linux.ibm.com, gerald.schaefer@linux.ibm.com, linux-mm@kvack.org, 
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-15.7 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 279D81F72EC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17636-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[surenb@google.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[42];
	FORGED_RECIPIENTS(0.00)[m:lorenzo.stoakes@oracle.com,m:akpm@linux-foundation.org,m:willy@infradead.org,m:david@kernel.org,m:ziy@nvidia.com,m:matthew.brost@intel.com,m:joshua.hahnjy@gmail.com,m:rakie.kim@sk.com,m:byungchul@sk.com,m:gourry@gourry.net,m:ying.huang@linux.alibaba.com,m:apopple@nvidia.com,m:baolin.wang@linux.alibaba.com,m:Liam.Howlett@oracle.com,m:npache@redhat.com,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:baohua@kernel.org,m:lance.yang@linux.dev,m:vbabka@suse.cz,m:jannh@google.com,m:rppt@kernel.org,m:mhocko@suse.com,m:pfalcato@suse.de,m:kees@kernel.org,m:maddy@linux.ibm.com,m:npiggin@gmail.com,m:mpe@ellerman.id.au,m:chleroy@kernel.org,m:borntraeger@linux.ibm.com,m:frankja@linux.ibm.com,m:imbrenda@linux.ibm.com,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:svens@linux.ibm.com,m:gerald.schaefer@linux.ibm.com,m:linux-mm@kvack.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-s390@vger.kernel.org,m:joshuah
 ahnjy@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[surenb@google.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linux-foundation.org,infradead.org,kernel.org,nvidia.com,intel.com,gmail.com,sk.com,gourry.net,linux.alibaba.com,oracle.com,redhat.com,arm.com,linux.dev,suse.cz,google.com,suse.com,suse.de,linux.ibm.com,ellerman.id.au,kvack.org,lists.ozlabs.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action

On Mon, Mar 2, 2026 at 5:57=E2=80=AFAM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> On Wed, Feb 25, 2026 at 11:06:07PM -0800, Suren Baghdasaryan wrote:
> > vma_expand() error handling is a bit confusing with "if (ret) return re=
t;"
> > mixed with "if (!ret && ...) ret =3D ...;". Simplify the code to check
> > for errors and return immediately after an operation that might fail.
> > This also makes later changes to this function more readable.
> >
> > No functional change intended.
> >
> > Suggested-by: Jann Horn <jannh@google.com>
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
>
> LGTM, so:
>
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Thanks!

>
> > ---
> >  mm/vma.c | 12 ++++++++----
> >  1 file changed, 8 insertions(+), 4 deletions(-)
> >
> > diff --git a/mm/vma.c b/mm/vma.c
> > index be64f781a3aa..bb4d0326fecb 100644
> > --- a/mm/vma.c
> > +++ b/mm/vma.c
> > @@ -1186,12 +1186,16 @@ int vma_expand(struct vma_merge_struct *vmg)
> >        * Note that, by convention, callers ignore OOM for this case, so
> >        * we don't need to account for vmg->give_up_on_mm here.
> >        */
> > -     if (remove_next)
> > +     if (remove_next) {
> >               ret =3D dup_anon_vma(target, next, &anon_dup);
> > -     if (!ret && vmg->copied_from)
> > +             if (ret)
> > +                     return ret;
> > +     }
>
> > +     if (vmg->copied_from) {
> >               ret =3D dup_anon_vma(target, vmg->copied_from, &anon_dup)=
;
> > -     if (ret)
> > -             return ret;
> > +             if (ret)
> > +                     return ret;
> > +     }
>
> Thanks that is an improvement!
>
> I was going to suggest declaring 'ret' in each block but that kinda adds =
noise
> so this is fine.
>
> Maybe rename 'ret' to 'err' but not a big deal, this function could do wi=
th a
> little more cleanup too I think!

Sure, since I'll be posting a new version I'll do the rename too.
Cheers!

>
> >
> >       if (remove_next) {
> >               vma_start_write(next);
> > --
> > 2.53.0.414.gf7e9f6c205-goog
> >
>

