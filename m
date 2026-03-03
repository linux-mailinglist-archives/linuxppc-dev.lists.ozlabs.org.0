Return-Path: <linuxppc-dev+bounces-17643-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDLsFet1p2nyhgAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17643-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 00:59:39 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4A81F8946
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 00:59:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQXpY6wgJz3bfG;
	Wed, 04 Mar 2026 10:59:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::82a" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772582373;
	cv=pass; b=ghZS9UlN40BZt8KyPv9bDl7mYr0NHR8LRyq3X7QNS4OM9/iL66PPSvIxKywnSdZ/jh7Aux08j0VpLWE5093+FmwFgLHU3+jFiS2H4dyJA7BIytlNJ0jyLyYyfLMbyhR76W6gEAa2lLHVfheQ4JBLxGrLGCoJpMWhK11DKdHO+HoCjhsdwMzSszrTQjLs6jO5pfgLb/Bis3pWmJJIegNG/x6AUZz8Hsdxs6Lqv7S/ZNwL9K4U+mcyHOPYsfhdT3m81JQhUZBI8bjjnl23Eq+wvrWO+r5gShXWcmVlKCICZhm5SpWHW5Jee0HR/i62SJtqy+GfYQM3LxVPgpvfNjDptg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772582373; c=relaxed/relaxed;
	bh=px1Y/hYXvoU5IMfti8a7poEyLQrLWhXDu0pMI3HLqtI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lwkzPLWoSRqyt2KXVtBFT/Rx3n3t6W630GZ69NWI/esvCbgA35Roc/UbSF/aB0jKi2Vjm998jUryivw4haAez5jYzqwzafCc/nAYXP+NxqzVzBAW/zwafmQHezCPkqgvIhp2O7OvveLRaFr+UAYT5EIWGdo0Y7r9bdHoZ5gRVCi9xJiaTOgUCJPW6i6sFio5oSmtEzu91+vpgPQborAQU+o84N/2QGf2oTMAuZkUsrjA8VEvYtvBozgXDfHpX+Hdx1umOc3G/WSwUnHHRnbztZRXqnnlxGnBEb1qb1XuEbyhQuiEUQxn1HXdlAnCrvQf4i4U+b1nzyaZU31L2cGNqA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=1Dd/7FJ5; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::82a; helo=mail-qt1-x82a.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=1Dd/7FJ5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::82a; helo=mail-qt1-x82a.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQXpW6nkvz3bf2
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 10:59:31 +1100 (AEDT)
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-5069a785ed2so778821cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Mar 2026 15:59:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772582369; cv=none;
        d=google.com; s=arc-20240605;
        b=izGbrQV2NHht+HdFt3oVJ1NdS8N0665edPlApm0yJuDHXnCNs3HF5uQdLaJheyPdrQ
         W0+F3RYPgCDQzrZ5oINCy3QadDI912OqdvzJG64sYOUKMAYCqu/SlLacgJiJExB4oBT9
         7RM5MpAZR7FX4nxPrwoC/gToxDg0ymsYJErQbiEbeIR4BlturGZ8AaqrGS9m4ZoPJObb
         uS1IHABzCh1NfmvEEztIa81dIxoc69wxMkTkteKOgCkzhJC1/yrDwYhesuDWCaEg99JU
         ID792V3CDyS/GKT/z+kfnEOfQXr7yzps0ojiLFfKKeTC3XPYVyRBI56SZtOxYikc7OnB
         JStQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=px1Y/hYXvoU5IMfti8a7poEyLQrLWhXDu0pMI3HLqtI=;
        fh=kUhwKoBpCtlhlLtffdkjH7Ty6++ljVcfhTLlKvQIy4M=;
        b=h/epLQDsr7P7n/NTJq47YduqxeXfkWPHEerIifuLEWi95xFemQIliv/JVKNz1K3Ilc
         Rv/7bccJDRZZvA7Syf1v4amUNz3iCIteWfIOwHNVTBVMhsdqzV1jp9Wib6vAiZUFrKsy
         y6OTOotjXnDdUwMmnp3sM05JWUFX780+v42nwsN1PDdK/FLFckBb2dg1r6sH+ZEKwJ+e
         7etaQH+f5fv5WD9mvtgUA4qGrQnTKnU4AokqedaIOdKR3M6mduyD1Tu7agCJUro/6Xok
         320rjZqstp+8p3kRVlQoIwFpVGAfkzNZR+R2d4Tb9Sp/LGi392TQhTFxLnawhSnVCqXC
         ukCQ==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772582369; x=1773187169; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=px1Y/hYXvoU5IMfti8a7poEyLQrLWhXDu0pMI3HLqtI=;
        b=1Dd/7FJ5nMBQuTA5UHXjrP6g7f8OJfkVBBNULt5Xpw5upnkXo8kl48m3MN221DZy4I
         WphKWli3DnJXYIO7o6NfVvvV7ik8+lqqChnDDFo9YCNDYhRkgKfCblA1LucYMBLbNzTS
         B1x4qtXDaeUSmjTz1ybcezpJZyVL2AtI4dI/JJGzdDrnFQPbDBsCRqrVc2QVjhbPAWWc
         YTEHgtnwp2i0Jkt2Qw+Gb8+vbQaUnuJOoBAdAdxMN9LVayfz3/A5IziBXvweeM2todiO
         ScncAh+vH9lnUAWpjSdILcsFtBnJjdNqrr4h/N6BiOaGhyM/6VTr027mxLA0FCmCVFQx
         nErg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772582369; x=1773187169;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=px1Y/hYXvoU5IMfti8a7poEyLQrLWhXDu0pMI3HLqtI=;
        b=i3Wf6W8mrnqFAPHO/XjIyQUksfiuJ1c0MvwZnnn83KGKF8r3SDrEt24npyxD6P9N6c
         rOy3TUx5eJiPMbvteqHnK8GxLLfhqkeXPuyQNcxdS0otHhhmtdw7ORYZPyLBnik00o3K
         4Ni/OAxrZBHlHZfnihT1sqvrgbblpcAUyHBNDuOoV8/oFJM4cHcnd54dUz3C7g3lpaMO
         QT4G9CQdRay27dG3wX5JhMXzqrKwHcOp/ZH57jsQCdux09vLZsZW96Gc+dvu8Td6Q6Cx
         rpWai2eGrNNSxyrI+Vmrms4ZjOe4WHPz9GPs6AhoOx2iXDJE15V79/aSJpEaQrkVc6l2
         jvBg==
X-Forwarded-Encrypted: i=1; AJvYcCUQcQjU5TuPiRFpS/75uT6lLZ/MluBlYiSO053b5CdPkfobz84EsdOfBx5zKzZfv1SmXBxiAXkJsLG6pSI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz9o5GXS7sJxhn7boaTlnX/Lp7G34Uh5gqBdYOvOWeER5SS6bFY
	hJYq+wkfJpRpn8rBA9IZlP+4BmRXKgnVJnacISLlT0jLmJgmypdnF0dD9Fmu7yEetNkONNAUGGV
	k5cH4CNEbjimVdH4F2oG5+TDrmsJaxiG4ymy+5eRB
X-Gm-Gg: ATEYQzxkBmyk8NAgrzykzWHGCV/5BsoF0QD8TlmuttEkvBBFkc7iHeSGuPGYWS6J6bc
	fqTY+u5H/nYjZwxg/Mj1G+NNTHllU/MWvFP1hFPeMlPAJXr8SRr/cvfDec3ZcUf+tK1jyUvM324
	v4MqP3hRr+wpKA2/uYtK2hTgro8OOB5qlltL/z9rm2pRcaE45+DIVH3OZqS0b2fVpimrLQTjPWa
	XZDoIzfUFYRvEA8OrM6dqr39zlYqbrvvxX7G85MG/MwiPPMtGkaAJ0fu7vZuUxF/f/xBKVcAOT0
	8p9WJnss7cC9v+NOf5KWWS+ufn8/mtM431xG
X-Received: by 2002:a05:622a:14ca:b0:4f3:7b37:81b with SMTP id
 d75a77b69052e-5075fea9c02mr43750861cf.18.1772582368589; Tue, 03 Mar 2026
 15:59:28 -0800 (PST)
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
References: <20260226070609.3072570-1-surenb@google.com> <20260226070609.3072570-4-surenb@google.com>
 <72ff2fc0-07fe-4964-9a1e-eccf8c7ed6a7@lucifer.local>
In-Reply-To: <72ff2fc0-07fe-4964-9a1e-eccf8c7ed6a7@lucifer.local>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 3 Mar 2026 15:59:17 -0800
X-Gm-Features: AaiRm509RYF3etasX2xFgZmAhKSXZQCXlropJgc5ZcJilpJ6cUQUI8sknzWfQIY
Message-ID: <CAJuCfpG_bekxrHd49qyUBR2K7V8o7DrOvc-ZR7M8dAC-Hyp5ng@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] mm: use vma_start_write_killable() in process_vma_walk_lock()
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
X-Rspamd-Queue-Id: 6E4A81F8946
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17643-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lorenzo.stoakes@oracle.com,m:akpm@linux-foundation.org,m:willy@infradead.org,m:david@kernel.org,m:ziy@nvidia.com,m:matthew.brost@intel.com,m:joshua.hahnjy@gmail.com,m:rakie.kim@sk.com,m:byungchul@sk.com,m:gourry@gourry.net,m:ying.huang@linux.alibaba.com,m:apopple@nvidia.com,m:baolin.wang@linux.alibaba.com,m:Liam.Howlett@oracle.com,m:npache@redhat.com,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:baohua@kernel.org,m:lance.yang@linux.dev,m:vbabka@suse.cz,m:jannh@google.com,m:rppt@kernel.org,m:mhocko@suse.com,m:pfalcato@suse.de,m:kees@kernel.org,m:maddy@linux.ibm.com,m:npiggin@gmail.com,m:mpe@ellerman.id.au,m:chleroy@kernel.org,m:borntraeger@linux.ibm.com,m:frankja@linux.ibm.com,m:imbrenda@linux.ibm.com,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:svens@linux.ibm.com,m:gerald.schaefer@linux.ibm.com,m:linux-mm@kvack.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-s390@vger.kernel.org,m:joshuah
 ahnjy@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[surenb@google.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,infradead.org,kernel.org,nvidia.com,intel.com,gmail.com,sk.com,gourry.net,linux.alibaba.com,oracle.com,redhat.com,arm.com,linux.dev,suse.cz,google.com,suse.com,suse.de,linux.ibm.com,ellerman.id.au,kvack.org,lists.ozlabs.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[42];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[surenb@google.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Mon, Mar 2, 2026 at 7:25=E2=80=AFAM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> On Wed, Feb 25, 2026 at 11:06:09PM -0800, Suren Baghdasaryan wrote:
> > Replace vma_start_write() with vma_start_write_killable() when
> > process_vma_walk_lock() is used with PGWALK_WRLOCK option.
> > Adjust its direct and indirect users to check for a possible error
> > and handle it. Ensure users handle EINTR correctly and do not ignore
> > it.
> >
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
>
> Have raised concerns below but also this feels like you're trying to do a=
 bit
> too much in one patch here, probably worth splitting out based on the dif=
ferent
> parts you changed.
>
> > ---
> >  arch/s390/kvm/kvm-s390.c |  2 +-
> >  fs/proc/task_mmu.c       |  5 ++++-
> >  mm/mempolicy.c           | 14 +++++++++++---
> >  mm/pagewalk.c            | 20 ++++++++++++++------
> >  mm/vma.c                 | 22 ++++++++++++++--------
> >  mm/vma.h                 |  6 ++++++
> >  6 files changed, 50 insertions(+), 19 deletions(-)
> >
> > diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
> > index 7a175d86cef0..337e4f7db63a 100644
> > --- a/arch/s390/kvm/kvm-s390.c
> > +++ b/arch/s390/kvm/kvm-s390.c
> > @@ -2948,7 +2948,7 @@ int kvm_arch_vm_ioctl(struct file *filp, unsigned=
 int ioctl, unsigned long arg)
> >               }
> >               /* must be called without kvm->lock */
> >               r =3D kvm_s390_handle_pv(kvm, &args);
> > -             if (copy_to_user(argp, &args, sizeof(args))) {
> > +             if (r !=3D -EINTR && copy_to_user(argp, &args, sizeof(arg=
s))) {
>
> This is horribly ugly, and if we were already filtering any other instanc=
e of
> -EINTR (if they're even possible from copy_to_user()) why is -EINTR being
> treated in a special way?
>
> I honestly _hate_ this if (errcode !=3D -EINTR) { ... } pattern in genera=
l, I'd
> really rather we didn't.
>
> It's going to bitrot and people are going to assume it's for some _very g=
ood
> reason_ and nobody will understand why it's getting special treatment...
>
> Surely a fatal signal would have previously resulted in -EFAULT before wh=
ich is
> a similar situation so most consistent would be to keep filtering no?

Current code ignores any error coming from kvm_s390_handle_pv() and
proceeds with copy_to_user(), possibly overriding the former error. I
don't really know if this is an oversight or an intentional behavior,
so I wanted to minimize possible side effects. I guess I should try to
fix it properly (or learn why this was done this way). I'll post a
separate patch to error out immediately if kvm_s390_handle_pv() fails
and will ask s390 experts for review.

>
> >                       r =3D -EFAULT;
> >                       break;
> >               }
> > diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
> > index e091931d7ca1..1238a2988eb6 100644
> > --- a/fs/proc/task_mmu.c
> > +++ b/fs/proc/task_mmu.c
> > @@ -1797,6 +1797,7 @@ static ssize_t clear_refs_write(struct file *file=
, const char __user *buf,
> >               struct clear_refs_private cp =3D {
> >                       .type =3D type,
> >               };
> > +             int err;
> >
> >               if (mmap_write_lock_killable(mm)) {
> >                       count =3D -EINTR;
> > @@ -1824,7 +1825,9 @@ static ssize_t clear_refs_write(struct file *file=
, const char __user *buf,
> >                                               0, mm, 0, -1UL);
> >                       mmu_notifier_invalidate_range_start(&range);
> >               }
> > -             walk_page_range(mm, 0, -1, &clear_refs_walk_ops, &cp);
> > +             err =3D walk_page_range(mm, 0, -1, &clear_refs_walk_ops, =
&cp);
> > +             if (err < 0)
>
> Again with this < 0 :) let's be consistent, if (err).

Ack.

>
> > +                     count =3D err;
> >               if (type =3D=3D CLEAR_REFS_SOFT_DIRTY) {
> >                       mmu_notifier_invalidate_range_end(&range);
> >                       flush_tlb_mm(mm);
> > diff --git a/mm/mempolicy.c b/mm/mempolicy.c
> > index 90939f5bde02..3c8b3dfc9c56 100644
> > --- a/mm/mempolicy.c
> > +++ b/mm/mempolicy.c
> > @@ -988,6 +988,8 @@ queue_pages_range(struct mm_struct *mm, unsigned lo=
ng start, unsigned long end,
> >                       &queue_pages_lock_vma_walk_ops : &queue_pages_wal=
k_ops;
>
> There's a comment above:
>
>  * queue_pages_range() may return:
>  * 0 - all pages already on the right node, or successfully queued for mo=
ving
>  *     (or neither strict checking nor moving requested: only range check=
ing).
>  * >0 - this number of misplaced folios could not be queued for moving
>  *      (a hugetlbfs page or a transparent huge page being counted as 1).
>  * -EIO - a misplaced page found, when MPOL_MF_STRICT specified without M=
OVEs.
>  * -EFAULT - a hole in the memory range, when MPOL_MF_DISCONTIG_OK unspec=
ified.
>  */
>
> You should add the -EINTR to it.

Ack.

>
> >
> >       err =3D walk_page_range(mm, start, end, ops, &qp);
> > +     if (err =3D=3D -EINTR)
> > +             return err;
>
> Again, you're special casing without really any justification here. Let's=
 please
> not special case -EINTR unless you have a _really good_ reason to.
>
> And also - if we fail to walk the page range because we couldn't get a VM=
A write
> lock, that's ok. The walk failed. There's nothing to unlock, because we d=
idn't
> even get the write lock in the first place, so there's no broken state, i=
t's as
> if we failed at some other point right?
>
> So I don't see why we're special casing this _at all_.

I want to avoid possible -EINTR code override with -EFAULT in the code belo=
w.
walk_page_range() can return -EINVAL and any other error that
ops->pte_hole or ops->test_walk might return. We might be fine
treating all of them as -EFAULT but masking -EINTR seems wrong to me.
I don't really know a better way to deal with this but if you have a
good alternative I would really appreciate it.

>
> >
> >       if (!qp.first)
> >               /* whole range in hole */
> > @@ -1309,9 +1311,14 @@ static long migrate_to_node(struct mm_struct *mm=
, int source, int dest,
> >                                     flags | MPOL_MF_DISCONTIG_OK, &page=
list);
> >       mmap_read_unlock(mm);
>
>
> >
> > +     if (nr_failed =3D=3D -EINTR)
> > +             err =3D nr_failed;
>
> Ugh please don't, that's REALLY horrible.
>
> Actually the only way you'd get a write lock happening in the walk_page_r=
ange()
> is if flags & MPOL_MF_WRLOCK, menaing queue_pages_lock_vma_walk_ops are u=
sed
> which specifies .walk_lock =3D PGWALK_WRLOCK.
>
> And this flag is only set in do_mbind(), not in migrate_to_node().
>
> So this check is actually totally unnecessary. You'll never get -EINTR he=
re.

Ah, good point. I'll drop this part.

>
> Maybe this code needs some refactoring though in general... yikes.

Right.

>
> > +
> >       if (!list_empty(&pagelist)) {
> > -             err =3D migrate_pages(&pagelist, alloc_migration_target, =
NULL,
> > -                     (unsigned long)&mtc, MIGRATE_SYNC, MR_SYSCALL, NU=
LL);
> > +             if (!err)
> > +                     err =3D migrate_pages(&pagelist, alloc_migration_=
target,
> > +                                         NULL, (unsigned long)&mtc,
> > +                                         MIGRATE_SYNC, MR_SYSCALL, NUL=
L);
>
> Given the above, this is unnecessary too.

Ack. Will drop.

>
> >               if (err)
> >                       putback_movable_pages(&pagelist);
> >       }
> > @@ -1611,7 +1618,8 @@ static long do_mbind(unsigned long start, unsigne=
d long len,
> >                               MR_MEMPOLICY_MBIND, NULL);
> >       }
> >
> > -     if (nr_failed && (flags & MPOL_MF_STRICT))
> > +     /* Do not mask EINTR */
>
> Useless comment... You're not explaining why, and it's obvious what you'r=
e doing.
>
> > +     if ((err !=3D -EINTR) && (nr_failed && (flags & MPOL_MF_STRICT)))
>
> Weird use of parens...
>
> And again why are we treating -EINTR in a special way?

Ah, actually I don't think I need this here. If queue_pages_range()
fails nr_failed gets reset to 0, so the original error won't be masked
as -EIO. I'll drop this part.

>
> >               err =3D -EIO;
> >       if (!list_empty(&pagelist))
> >               putback_movable_pages(&pagelist);
> > diff --git a/mm/pagewalk.c b/mm/pagewalk.c
> > index a94c401ab2cf..dc9f7a7709c6 100644
> > --- a/mm/pagewalk.c
> > +++ b/mm/pagewalk.c
> > @@ -425,14 +425,13 @@ static inline void process_mm_walk_lock(struct mm=
_struct *mm,
> >               mmap_assert_write_locked(mm);
> >  }
> >
> > -static inline void process_vma_walk_lock(struct vm_area_struct *vma,
> > +static inline int process_vma_walk_lock(struct vm_area_struct *vma,
> >                                        enum page_walk_lock walk_lock)
> >  {
> >  #ifdef CONFIG_PER_VMA_LOCK
> >       switch (walk_lock) {
> >       case PGWALK_WRLOCK:
> > -             vma_start_write(vma);
> > -             break;
> > +             return vma_start_write_killable(vma);
> >       case PGWALK_WRLOCK_VERIFY:
> >               vma_assert_write_locked(vma);
> >               break;
> > @@ -444,6 +443,7 @@ static inline void process_vma_walk_lock(struct vm_=
area_struct *vma,
> >               break;
> >       }
> >  #endif
> > +     return 0;
> >  }
> >
> >  /*
> > @@ -487,7 +487,9 @@ int walk_page_range_mm_unsafe(struct mm_struct *mm,=
 unsigned long start,
> >                       if (ops->pte_hole)
> >                               err =3D ops->pte_hole(start, next, -1, &w=
alk);
> >               } else { /* inside vma */
> > -                     process_vma_walk_lock(vma, ops->walk_lock);
> > +                     err =3D process_vma_walk_lock(vma, ops->walk_lock=
);
> > +                     if (err)
> > +                             break;
> >                       walk.vma =3D vma;
> >                       next =3D min(end, vma->vm_end);
> >                       vma =3D find_vma(mm, vma->vm_end);
> > @@ -704,6 +706,7 @@ int walk_page_range_vma_unsafe(struct vm_area_struc=
t *vma, unsigned long start,
> >               .vma            =3D vma,
> >               .private        =3D private,
> >       };
> > +     int err;
> >
> >       if (start >=3D end || !walk.mm)
> >               return -EINVAL;
> > @@ -711,7 +714,9 @@ int walk_page_range_vma_unsafe(struct vm_area_struc=
t *vma, unsigned long start,
> >               return -EINVAL;
> >
> >       process_mm_walk_lock(walk.mm, ops->walk_lock);
> > -     process_vma_walk_lock(vma, ops->walk_lock);
> > +     err =3D process_vma_walk_lock(vma, ops->walk_lock);
> > +     if (err)
> > +             return err;
> >       return __walk_page_range(start, end, &walk);
> >  }
> >
> > @@ -734,6 +739,7 @@ int walk_page_vma(struct vm_area_struct *vma, const=
 struct mm_walk_ops *ops,
> >               .vma            =3D vma,
> >               .private        =3D private,
> >       };
> > +     int err;
> >
> >       if (!walk.mm)
> >               return -EINVAL;
> > @@ -741,7 +747,9 @@ int walk_page_vma(struct vm_area_struct *vma, const=
 struct mm_walk_ops *ops,
> >               return -EINVAL;
> >
> >       process_mm_walk_lock(walk.mm, ops->walk_lock);
> > -     process_vma_walk_lock(vma, ops->walk_lock);
> > +     err =3D process_vma_walk_lock(vma, ops->walk_lock);
> > +     if (err)
> > +             return err;
> >       return __walk_page_range(vma->vm_start, vma->vm_end, &walk);
> >  }
> >
> > diff --git a/mm/vma.c b/mm/vma.c
> > index 9f2664f1d078..46bbad6e64a4 100644
> > --- a/mm/vma.c
> > +++ b/mm/vma.c
> > @@ -998,14 +998,18 @@ static __must_check struct vm_area_struct *vma_me=
rge_existing_range(
> >       if (anon_dup)
> >               unlink_anon_vmas(anon_dup);
> >
> > -     /*
> > -      * This means we have failed to clone anon_vma's correctly, but n=
o
> > -      * actual changes to VMAs have occurred, so no harm no foul - if =
the
> > -      * user doesn't want this reported and instead just wants to give=
 up on
> > -      * the merge, allow it.
> > -      */
> > -     if (!vmg->give_up_on_oom)
> > -             vmg->state =3D VMA_MERGE_ERROR_NOMEM;
> > +     if (err =3D=3D -EINTR) {
> > +             vmg->state =3D VMA_MERGE_ERROR_INTR;
>
> Yeah this is incorrect. You seem adament in passing through -EINTR _no
> matter what_ :)

You got me figured out ;)

>
> There are callers that don't care at all if the merge failed, whether thr=
ough
> oom or VMA write lock not being acquired.

Ah, I see. I was a bit puzzled by this vmg->give_up_on_oom flag. I
think what you are saying is that errors from
vma_merge_existing_range() are ignored unless this flag is set and
even then the only possible error is ENOMEM.

>
> There's really no benefit in exiting early here I don't think, the subseq=
uent
> split will call vma_start_write_killable() anyway.

But are we always calling split after the merge?

>
> So I think this adds a lot of complexity and mess for nothing.
>
> So can we drop all this change to the merge logic please?

Ok but is there a good reason for this unusual error handling logic in
vma_merge_existing_range()?

>
> > +     } else {
> > +             /*
> > +              * This means we have failed to clone anon_vma's correctl=
y,
> > +              * but no actual changes to VMAs have occurred, so no har=
m no
> > +              * foul - if the user doesn't want this reported and inst=
ead
> > +              * just wants to give up on the merge, allow it.
> > +              */
> > +             if (!vmg->give_up_on_oom)
> > +                     vmg->state =3D VMA_MERGE_ERROR_NOMEM;
> > +     }
> >       return NULL;
> >  }
> >
> > @@ -1681,6 +1685,8 @@ static struct vm_area_struct *vma_modify(struct v=
ma_merge_struct *vmg)
> >       merged =3D vma_merge_existing_range(vmg);
> >       if (merged)
> >               return merged;
> > +     if (vmg_intr(vmg))
> > +             return ERR_PTR(-EINTR);
> >       if (vmg_nomem(vmg))
> >               return ERR_PTR(-ENOMEM);
> >
> > diff --git a/mm/vma.h b/mm/vma.h
> > index eba388c61ef4..fe4560f81f4f 100644
> > --- a/mm/vma.h
> > +++ b/mm/vma.h
> > @@ -56,6 +56,7 @@ struct vma_munmap_struct {
> >  enum vma_merge_state {
> >       VMA_MERGE_START,
> >       VMA_MERGE_ERROR_NOMEM,
> > +     VMA_MERGE_ERROR_INTR,
> >       VMA_MERGE_NOMERGE,
> >       VMA_MERGE_SUCCESS,
> >  };
> > @@ -226,6 +227,11 @@ static inline bool vmg_nomem(struct vma_merge_stru=
ct *vmg)
> >       return vmg->state =3D=3D VMA_MERGE_ERROR_NOMEM;
> >  }
> >
> > +static inline bool vmg_intr(struct vma_merge_struct *vmg)
> > +{
> > +     return vmg->state =3D=3D VMA_MERGE_ERROR_INTR;
> > +}
> > +
> >  /* Assumes addr >=3D vma->vm_start. */
> >  static inline pgoff_t vma_pgoff_offset(struct vm_area_struct *vma,
> >                                      unsigned long addr)
> > --
> > 2.53.0.414.gf7e9f6c205-goog
> >
>

