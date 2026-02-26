Return-Path: <linuxppc-dev+bounces-17308-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJEtKKKBoGn6kQQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17308-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 18:23:46 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2261AC4A2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 18:23:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMJG15Lynz2yrl;
	Fri, 27 Feb 2026 04:23:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::830" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772126617;
	cv=pass; b=nPS2LFva2r6KPegd1wtzhoLLBv/+3q24/MoRm6vW6dchyn1qc22fW71gmiA3jSEPu1slR2tUJttGeOvWWIrv5No6bDTyttSCgtDk3buhoiAGsBOdm+OxRydtLmigMMF879nBDgJD6KzZyuoW/OAIENVG31VZtaHDIcP5QfAznld4EQe1Ek7XiCDT9P/SJycdncKMQaf/cIIrKNMw0Y+earcifB5Loi2grYNgUxWJnizNV7tKNGa+lQTkSMreCsvbDMi2IXCc0xP3FbaIXpocPhC4iw4CT0OYdAvmJ05gFrA+0TBbvgeyH0ryyFEO1Sy9Aro0aV5CmNGrWVk/nNjr7Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772126617; c=relaxed/relaxed;
	bh=FynKKhlWalFQKKrs3ZP5yNMAhsIr6fWHYQm9TKDGe4A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=S5Or6mnfIRRVQOoDQ6LOYcvLnexfFh2udI/Q6RQEhyLiAA4m/y1P0Dm48T/jwl8/0qLT00Dvmb7kd5uZ2Vi3D1bmLBMXCWwyDvCrkWbcBYsO8nT3CAFQEzhBNRF6PqvrTsig/6ZQKr7Eg9Wwdo74iUigjor4UzhdbhqXkefAvKlcDDNT0qNfBNQE9mri783N/vwr4DOrNO5+RddGTqFi9dKVOc+UIQ9J0VYFqm9jCTgCJoX4AszX7NNFv/VI6d8mbEqhVfokyzvh6pLh+F0NnGJwl4UP6qc9zRsB2PCs6iVrY9dAnKltMoEv4TxEeZryOZTHtT5iEvokW9B9BQ/q7w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=U4KaGrK7; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::830; helo=mail-qt1-x830.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=U4KaGrK7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::830; helo=mail-qt1-x830.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMJG02zVlz2yLH
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Feb 2026 04:23:35 +1100 (AEDT)
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-505d3baf1a7so639771cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Feb 2026 09:23:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772126613; cv=none;
        d=google.com; s=arc-20240605;
        b=kk5kpexCL2xfYYA+G+iC8wG/pRSrbmyZcefAN7LDGn7tKhfwkM9rENQvGqfhHmm4RE
         M6ZPdyx7IJ+pb6Uqj8WDjNYzUoS19WJxX4GcD19pP41SeyCtPV5atzO7ajZUicelQVLu
         P2E0GrUDaNWXilxGxj2QABGTq8rgVRjjKuF4dXFMd0f7V2MdnXKi0te802k5l6I6NWN6
         r6liHFJpXVndrHJZeGDToDZs6nLzGrhb2hB8rxxuZHlgoY8bn9bBcXbJ1jFZ0M4AWwHU
         mFX4WpW3QLpFqWtkQmgFjS2jN2mgd/UTQkTMKSMEX8hOykg/eFn20jWFmKSms4PGPRIf
         hwNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FynKKhlWalFQKKrs3ZP5yNMAhsIr6fWHYQm9TKDGe4A=;
        fh=P7Q6aoGXIAF+MtCNguUMrtkvbpb9me6I5Lij3EE1dMM=;
        b=NlQD+eeTrNlo8FZc/q+LqOvAeMuXWp6Lau0EyyBnQbYcqEXHLxNuy1+s2MKYJfzrXd
         35CV4N7pDc2k5nLdWz6wZ3+qGm3PIlrwDjh4MhSa8fwv+bJdXJpNDRz8LSy0SuNxoSgV
         hmYdWpR/TJlyIFgLPQQJEfjHhwa5+TO8ATVjqTfxfUvPT4vQqGH7wxEuq+hsJc4IZ3YB
         6JkELr3kz85yh7vx/n2aV16gZtKuy2aGzBafVltVaOVaWtELr0T54QhpjS7jyWypt5D4
         JicblieGKKhhM00RVzC7YkqhtBDXyX0ih+9eKm+E/KZLkOYTD2+st5eoe5YHrcUdpHep
         2x1A==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772126613; x=1772731413; darn=lists.ozlabs.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FynKKhlWalFQKKrs3ZP5yNMAhsIr6fWHYQm9TKDGe4A=;
        b=U4KaGrK7Y9/VYaUin646i8RhdMHZmd8pOnugLxIqelv19Q8UBH2avT7k81OqHvgYwn
         yYYFbaqaIn3VVogikhQrvPBJ4NQiqocvtW13zRkyPmZauSyk+APIvJ6Td7PsSgs6pMmb
         dPSh7M/TkWwCcdT2Zb8MbDyHTTEqikJHlyN8TJQzk2QGEnS8ZurwEo0+uyviIvCY7mUe
         zTcDxsOFLXOUTGsH6H97Wg5WYnPDQktX5j5nf7PeY4la8Gma7B93G4MU8Y3McHAtZXIu
         lj2TdYflYUKysXNuLrsNhrxMYFyJcQ09BGKc6MzBJdMBqczz/7In58fY2Y8AW/uAc85r
         MV8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772126613; x=1772731413;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FynKKhlWalFQKKrs3ZP5yNMAhsIr6fWHYQm9TKDGe4A=;
        b=nZgx5uPpkljD3pqQwxZ5t2boPsO3nJdP53FALVTl5113kTDiod0DlfHQ9qeL0iZ8f2
         efNqgz36Mxydof+KHe7qzYRf/90f8eLlthnGtmRZQ6esO5eheq/ng7fjKzONCDU4LW/x
         xEx4MV6oq3dlFMKN25xs4HBvAtmbJAp3ASyIqzRBKz/gZhSbEbaOE1di3ggkO6i4TsA4
         WjKlNuQxSuj6A6Nool7ru3OoE7voiYgCFoTB68QKmOcTyzarfXgwzPBerYNn7DtuKPEi
         M6IHtlqYR16G5/NQvZErK35YKdiqVisER48cbtlnTzH0Zk5zrFBQsB4MtNW5JwUXp6hx
         8Byg==
X-Forwarded-Encrypted: i=1; AJvYcCX7wiaXsEJvrjSpVE0miJ4n3M1ElRuY1Jh+xAJNNEoZIXxjpDE/0/IhNRmyiAQ3YsXZwFXBXHVxqny/ORA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwmjZVcaixMMERXmGLsOtr39E8qV0c4tcKOYS3q/kvFvCuR+JaO
	QdYPLTP5QO/JfB8Jq5LWMJjMZiTKby7OMRR9d7l/WK3ENcowIFOzwhVoV/3rhpMB33p+sQj2Jv1
	xtcWq7oGb1yPV7nLGGOQRNGQu198Yg+/wlsnrNQ0r
X-Gm-Gg: ATEYQzyeL0FYAYZoFUvoeKM1c0vm75d9Q6x4gCCZ8Al5Vj/BEqof4yHaO3R/+sjFhao
	YvJt8/WJGhTOIoxaO8dpA+ThwLtxJk/hpIBTbEjw45lQ4hNnaSQqKyZzPEht7vdJZJSGn2c9Rrc
	ciwfcTFSE4of1e5JW4FHwHArkZLSHzRUsCY/XiWl7mBtQf/PDd7qF0OS5+4hgQxD0ReWtAyrx/w
	GSPO/1LlN/5wCkAgJjlXOL7bQXc+0C+/y26uHKPGmUr76+mT9iO56NNoPnMWRlJFglQFEJXFYxh
	Rs/CJ5oDNd43CKiSVevAFJ3e723YAJTLNyGeMIxXAZtQZez5
X-Received: by 2002:ac8:7fca:0:b0:4f1:a61a:1e8 with SMTP id
 d75a77b69052e-507441ca8aamr14889431cf.10.1772126612071; Thu, 26 Feb 2026
 09:23:32 -0800 (PST)
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
 <pifgesxxxcwcrarg3q7sgiybg6d6laaym2jcj2h44wqoaxopcv@idc7vavsmjsd>
In-Reply-To: <pifgesxxxcwcrarg3q7sgiybg6d6laaym2jcj2h44wqoaxopcv@idc7vavsmjsd>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 26 Feb 2026 09:23:19 -0800
X-Gm-Features: AaiRm51NlioHOecXqmKgqusOoAstD_F3nrG3Ao8qrpHVfKsEfdkgNePW1BjyYWA
Message-ID: <CAJuCfpGTNuojCXUQU0o-WrCRAuXPUAtLtSG=c8BL00JvnvNBiw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] mm/vma: cleanup error handling path in vma_expand()
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
	linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org
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
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Liam.Howlett@oracle.com,m:surenb@google.com,m:akpm@linux-foundation.org,m:willy@infradead.org,m:david@kernel.org,m:ziy@nvidia.com,m:matthew.brost@intel.com,m:joshua.hahnjy@gmail.com,m:rakie.kim@sk.com,m:byungchul@sk.com,m:gourry@gourry.net,m:ying.huang@linux.alibaba.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:baolin.wang@linux.alibaba.com,m:npache@redhat.com,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:baohua@kernel.org,m:lance.yang@linux.dev,m:vbabka@suse.cz,m:jannh@google.com,m:rppt@kernel.org,m:mhocko@suse.com,m:pfalcato@suse.de,m:kees@kernel.org,m:maddy@linux.ibm.com,m:npiggin@gmail.com,m:mpe@ellerman.id.au,m:chleroy@kernel.org,m:borntraeger@linux.ibm.com,m:frankja@linux.ibm.com,m:imbrenda@linux.ibm.com,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:svens@linux.ibm.com,m:gerald.schaefer@linux.ibm.com,m:linux-mm@kvack.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-s390@vger.
 kernel.org,m:joshuahahnjy@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oracle.com,google.com,linux-foundation.org,infradead.org,kernel.org,nvidia.com,intel.com,gmail.com,sk.com,gourry.net,linux.alibaba.com,redhat.com,arm.com,linux.dev,suse.cz,suse.com,suse.de,linux.ibm.com,ellerman.id.au,kvack.org,lists.ozlabs.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[43];
	FORGED_SENDER(0.00)[surenb@google.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-17308-lists,linuxppc-dev=lfdr.de];
	DKIM_TRACE(0.00)[google.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[surenb@google.com,linuxppc-dev@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,oracle.com:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 4A2261AC4A2
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 8:43=E2=80=AFAM Liam R. Howlett <Liam.Howlett@oracl=
e.com> wrote:
>
> * Suren Baghdasaryan <surenb@google.com> [260226 02:06]:
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
> This looks the same as v2, so I'll try again ;)

Sorry, missed adding it. So again, thank you very much!

>
> Reviewed-by: Liam R. Howlett <Liam.Howlett@oracle.com>
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
> > +     if (vmg->copied_from) {
> >               ret =3D dup_anon_vma(target, vmg->copied_from, &anon_dup)=
;
> > -     if (ret)
> > -             return ret;
> > +             if (ret)
> > +                     return ret;
> > +     }
> >
> >       if (remove_next) {
> >               vma_start_write(next);
> > --
> > 2.53.0.414.gf7e9f6c205-goog
> >
> >
>

