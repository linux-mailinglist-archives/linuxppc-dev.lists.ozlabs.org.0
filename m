Return-Path: <linuxppc-dev+bounces-17312-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kLWqGQaQoGkokwQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17312-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 19:25:10 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 205311AD8E9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 19:25:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMKcy20g8z30BR;
	Fri, 27 Feb 2026 05:25:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::82b" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772130306;
	cv=pass; b=DG2yKcEFEZ9nrCoynaZWLRTiTh+59Zade21kXlhgqruQxj/Etxo21N+uspc2yYl63ins9E2IKQ1czcDXHTiHfkZpIvNqo6UTThrc0KGgfZFRlaNellt2C68WCFzhKuRwAuTxHl3qJyXQHTmVxmNwBuAl+jgwiQ78g1tE3fNoWpHX/QqfLQbJ1Jkw1F/UfsBVz6wOO9KB0bWdpziBNPGRDoiSj+obwJXTqChX4t7LHLKJcDgfgAmuz7FUuo1oAdawmCqJ9aA3oLnp1bFpzDSxgyXm2hdX8dyjPkVRUyRywaSVwau+OEQSt29fWMVm3x04dzk9fA+1gMXhkXD2OENneQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772130306; c=relaxed/relaxed;
	bh=/PYRcOeI7C9TjyeqdENicil+1+DTaWkY4tVXR58gDo0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GaKAJETHg++MMEofmMFvBO9mghdR7rZT1VMwgTYmrELcWc/4i9ILVNUloll8f1S4oMsFjssXKar+PsMHhl7ReHduiTQl9NKCZTeroL9VHI5PjeTFV8L4CkSylSVFwTzpGnMXPLpbgyFHLFMXxVrGuX17361Q0p18XA+0YXY2BSkpZPnZdXlKhZK7HEN0nVTm93cucl7dhaTj5OOU7YXnp9OBmTW7qYb6w+p70gE53waFtq68Tx+kqnacgqR44PPGUryQbu3stAAIzLUM+r090EDl2xYF9Jymo21GqzXXkUZmX+UhxKSEzY3AiKXUaZ9O6ulH+PJ1oAjL9sIM66uvZA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=pm+8hMOx; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::82b; helo=mail-qt1-x82b.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=pm+8hMOx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::82b; helo=mail-qt1-x82b.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMKcw4XxCz2yrW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Feb 2026 05:25:04 +1100 (AEDT)
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-505d3baf1a7so29881cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Feb 2026 10:25:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772130301; cv=none;
        d=google.com; s=arc-20240605;
        b=NXGnh1NTbt/er9JDTGxqk5RzQY0N2MS4pfp91fz+ZmZyHu8cH9yXSwEYsDpTkbRTby
         nGcCekjiLKmiv0jCsNu+r/z3dUrnpzt5dCSfw6bpJ/fVC/btuGQXCaO03QD8yZzaH9B/
         0l9VMzvf7IBmGBR043tAPIDJE0EI9JLSJwcydqPuy3gJxzxM71tz2UT+x9CkyTr6cylA
         VEDttXAN3AZh5pd83fgvO6Utyn/ruTmY3DzIQEw44mDzbV4D+QpiaXrDObottTL5SJms
         5Q/Cqt3PemEHXDGP8olBW4TTETSu9LvAV1XdgAbBSDJlCeNepyJPSlhUnA5GdiOVZ40N
         1qTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/PYRcOeI7C9TjyeqdENicil+1+DTaWkY4tVXR58gDo0=;
        fh=ZSoI1aj3mOpHAC8R2HXdVEk5bMR4CEIaTi9dUAmFLYo=;
        b=Fwxl8xuMtpJcM18xQd8jMOr1RB6fCxQD6pC5tmY2udasm2P387ey2QEqPprk4PX7Vw
         O3jsVRouGjbHvfxI1j5YEQEDYPe651EBjRn03jGtfkdA3rbE2Y1h9iiebn+XRE8/6Yhb
         zWabYyCLlPnJg9caFK2SuaTjQVFq5rT0F/thwO1Xx1SnIm8ydfrJwqsEA4L7A/w1xU9Y
         6gD3IY6e2T93CCHEnBJ8YPLOwdYd3uN6k3pnrjtWW4SOzY3XQOeD5O4vtv7vFLOejSi4
         4GszYD8E5IoQTWTKBM0dpV8dnVppQFzGsCFH7NtYBAAkRxQlp069sfXhwEdPKnHAt2LS
         /YxA==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772130301; x=1772735101; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/PYRcOeI7C9TjyeqdENicil+1+DTaWkY4tVXR58gDo0=;
        b=pm+8hMOxyCPMPzv/AUfbykgLPoVq8akuUEisM9wXVrt7KjD+VtB1tBx8BxqAw4BN7f
         uPbvVl+7Dy1PvssZRhkF/UpF7aPovIklRW+dMY50N2rEDAVsW/bdiw+MukxTk0JAg5Iy
         jgB8mpbcPwkHHqSWUiB4G5PZAQPWb2yZxn6zE/dSx0dRnymmoNArPgvo9MrK9MaWE4Y1
         lZuKlVqoOSh7QVlk9IvZC2fjdHy1WtKP7AlYsgrQ8AJoC3bWP1Nf22QIUyh33Xzs4jXz
         GOS1fFVwszdft2QlZ0ADGpEd6XVwF5XZes1cPbvEjRx7eC6ZZXTXROYOsBIypEowyQ6i
         r6Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772130301; x=1772735101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/PYRcOeI7C9TjyeqdENicil+1+DTaWkY4tVXR58gDo0=;
        b=YHNTPa58Hp259cGReEjPm5MstB6L76pTTf1jA7PIHZ2tILJQBmDsE1X+JZqPSHBhjT
         jkFdF4HaNpJL/7xUWo/7VBgWGN6doxmSqJ5ZlzxIntNBpVxyEmTzQN8Qgy7glNVm9rYu
         N2PIpvYxBfmaRBz71lP4ouKSczDj8QdOvRerXsYvKXJzaDv+h3hSPRTM4KfVI+DF+Vn4
         3wmKL6gsSNY9TzbEbXY3haDyNx7GlQe3DPxo37XEznnqM05uWY7U38PUvYbwy7NWbdmc
         u4Tki1TrdpC7rcjKP07x779GEfIRgvCuELPJP82Bf+aPghbtS6YdPsWwllTGQo3To0M5
         jwxg==
X-Forwarded-Encrypted: i=1; AJvYcCUPQL7XmFlcGytKUuscezWCKWJmKM6j3vaSeCgp7UJDmf5JgILa5LOwKlPpc6urwediAvoqUmShMzAaAeY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxX/0oAnb/Hjm0jodes8Ei03RqOPYeQ5wbbUKuGGHAfP+HjQnV5
	WHMczQG8AX4FWuM2g5dxJcYPoExP5tFMNNBSw65rwTgLSqe3YxVLvzbvNi3tIX2RsdRYy4dtSYn
	Gifu+lYHxen3yia6KUqWLGCrSviBe3yL/VNv7+BAW
X-Gm-Gg: ATEYQzwt5bs4QxD1234l6rFssnUiMrBuUoABY5p2ZZUdvamU/wEQq6rmKXr0QX8MQYc
	D2XdDRMdxo2eF1ETkrsGrjC0zrpxMWktlwWcfuW7HCNEgyU6wu6ALlqDXMfMiFLZrHGRoex5bdw
	irAwAJcceALmLOZx9wFdr5S8J81c5V/e/YP5/Ypg5E/XF/X0G4n1ND8Tz5sVAwa6ig4Ja6tpyVI
	ebaZpw2PSRYreUCRaEOOfJp5XV3aqhiWF25a/YTg8BKKk1pIhbBSgZSmr8TxaW41JklNdrpeGkH
	U0tCt0urNYgrS4+h+k5mfG6BgJ5JrChQCS3NuSKvjPyG/foO
X-Received: by 2002:a05:622a:15d1:b0:501:4eae:dbfc with SMTP id
 d75a77b69052e-507454fc6c1mr12936811cf.5.1772130300634; Thu, 26 Feb 2026
 10:25:00 -0800 (PST)
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
 <20260226191007.409a7a21@p-imbrenda>
In-Reply-To: <20260226191007.409a7a21@p-imbrenda>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 26 Feb 2026 10:24:49 -0800
X-Gm-Features: AaiRm52wFdTJC6YvOb26vvaOOFR294VpLCUuG2iciIW7CwkMabryiSXuJJdbEug
Message-ID: <CAJuCfpEk_VPqwpqtAiCJSR5bkvHuzvC8ooXrB4jKTYnQB2D4YA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] mm: use vma_start_write_killable() in process_vma_walk_lock()
To: Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: akpm@linux-foundation.org, willy@infradead.org, david@kernel.org, 
	ziy@nvidia.com, matthew.brost@intel.com, joshua.hahnjy@gmail.com, 
	rakie.kim@sk.com, byungchul@sk.com, gourry@gourry.net, 
	ying.huang@linux.alibaba.com, apopple@nvidia.com, lorenzo.stoakes@oracle.com, 
	baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com, npache@redhat.com, 
	ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org, 
	lance.yang@linux.dev, vbabka@suse.cz, jannh@google.com, rppt@kernel.org, 
	mhocko@suse.com, pfalcato@suse.de, kees@kernel.org, maddy@linux.ibm.com, 
	npiggin@gmail.com, mpe@ellerman.id.au, chleroy@kernel.org, 
	borntraeger@linux.ibm.com, frankja@linux.ibm.com, hca@linux.ibm.com, 
	gor@linux.ibm.com, agordeev@linux.ibm.com, svens@linux.ibm.com, 
	gerald.schaefer@linux.ibm.com, linux-mm@kvack.org, 
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
	TAGGED_FROM(0.00)[bounces-17312-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[surenb@google.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[42];
	FORGED_RECIPIENTS(0.00)[m:imbrenda@linux.ibm.com,m:akpm@linux-foundation.org,m:willy@infradead.org,m:david@kernel.org,m:ziy@nvidia.com,m:matthew.brost@intel.com,m:joshua.hahnjy@gmail.com,m:rakie.kim@sk.com,m:byungchul@sk.com,m:gourry@gourry.net,m:ying.huang@linux.alibaba.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:baolin.wang@linux.alibaba.com,m:Liam.Howlett@oracle.com,m:npache@redhat.com,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:baohua@kernel.org,m:lance.yang@linux.dev,m:vbabka@suse.cz,m:jannh@google.com,m:rppt@kernel.org,m:mhocko@suse.com,m:pfalcato@suse.de,m:kees@kernel.org,m:maddy@linux.ibm.com,m:npiggin@gmail.com,m:mpe@ellerman.id.au,m:chleroy@kernel.org,m:borntraeger@linux.ibm.com,m:frankja@linux.ibm.com,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:svens@linux.ibm.com,m:gerald.schaefer@linux.ibm.com,m:linux-mm@kvack.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-s390@vger.kernel.org,m:joshuah
 ahnjy@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.989];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[surenb@google.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linux-foundation.org,infradead.org,kernel.org,nvidia.com,intel.com,gmail.com,sk.com,gourry.net,linux.alibaba.com,oracle.com,redhat.com,arm.com,linux.dev,suse.cz,google.com,suse.com,suse.de,linux.ibm.com,ellerman.id.au,kvack.org,lists.ozlabs.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 205311AD8E9
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 10:10=E2=80=AFAM Claudio Imbrenda
<imbrenda@linux.ibm.com> wrote:
>
> On Wed, 25 Feb 2026 23:06:09 -0800
> Suren Baghdasaryan <surenb@google.com> wrote:
>
> > Replace vma_start_write() with vma_start_write_killable() when
> > process_vma_walk_lock() is used with PGWALK_WRLOCK option.
> > Adjust its direct and indirect users to check for a possible error
> > and handle it. Ensure users handle EINTR correctly and do not ignore
> > it.
> >
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
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
> >                       r =3D -EFAULT;
> >                       break;
> >               }
>
> can you very briefly explain how we can end up with -EINTR here?
>
> do I understand correctly that -EINTR is possible here only if the
> process is being killed?

Correct, it would happen if the process has a pending fatal signal
(like SIGKILL) in its signal queue.

>
> [...]

