Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9D439ED6A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 06:11:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FzcHs2dLYz30Bc
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 14:11:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=tcYZlrbv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634;
 helo=mail-pl1-x634.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=tcYZlrbv; dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FzcHQ0yS3z2yXX
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Jun 2021 14:11:13 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id 11so9901055plk.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Jun 2021 21:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=fujJUO0q2KI09Gf2Ts/MK4OrEH1MH3pS5M4uIA8d5KY=;
 b=tcYZlrbvJ6bwWx5hOtunH5FlXCQSIc1mB7bzpNZe23fnuXN0P1B9qK3liym3q2fqMF
 TUBPyWK1ZOMpCS5yddkJ84bAoIVftpAefDggUsr/uTdyBxgzLoSfNQgO8rOiBSXxqygT
 GFbGXnJNu5IgI+IGstU3e+dbZmSTU3+aKi63tb64KMuXH0FHCXbVV3RvKJg36CCH1FMk
 IKqtLtxeEw6JgGPC948jypG9g07rOnFHiNY01N8t+NBzZqm0DAIvsdbIQqiGg0jLoAB9
 iXjAI2gZS5Du/dCK9shEQibTPfE88qR6UO3ZkZNZMTDFXB7KAlo11gDoRr6gyUtrDQRk
 cREA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=fujJUO0q2KI09Gf2Ts/MK4OrEH1MH3pS5M4uIA8d5KY=;
 b=Hi6ko3el3SPqMs9cnTg2ugXNTQmgKT9hoK5iXWiw6RlmCpCK9LfqiGYjvpDSIviuqh
 Do5Jr3TC3AfCdV16DirGYXPX4mOHdobcgJB+k+T/9HWxrdEuSelujMszpO97VcEk+M8k
 WBfvbAjN+lzeWTr/kn8adCSZ/+Smou2Oxl3YJYZ+aZUdKXmr2KcqF5t7MYs0+1UuUHrw
 qrhaYRw/6N5HibD8rUKomV6ieRIlR/SrQ1PseI43pJgcy/1Zzf1mNTqEhUleffZ+WON/
 MW8fMgXEjw4FnUYtyKewcf7ooWZlziuxObSVjmtIr+AVz1JkcA6J3jwUAuCoa9q1nQby
 EGfg==
X-Gm-Message-State: AOAM53025gCuggR9dIFQHtVZh7oakEyXuBcjYaExIa+fTuXaFiquI6Vg
 fCRQ6QTfcLM+3AtcBOwQSpw=
X-Google-Smtp-Source: ABdhPJxfxri2+uhmnYtzY5IcP7B7q38QCMIjrONmVg0s3CUrHRF1z33+8Ff6Hymls1OmPLXdOM7vxA==
X-Received: by 2002:a17:90a:8b0d:: with SMTP id
 y13mr4219564pjn.88.1623125469552; 
 Mon, 07 Jun 2021 21:11:09 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id w79sm2876301pff.21.2021.06.07.21.11.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 21:11:09 -0700 (PDT)
Date: Tue, 08 Jun 2021 14:11:04 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 1/4] lazy tlb: introduce lazy mm refcount helper
 functions
To: Andrew Morton <akpm@linux-foundation.org>
References: <20210605014216.446867-1-npiggin@gmail.com>
 <20210605014216.446867-2-npiggin@gmail.com>
 <20210607164934.d453adcc42473e84beb25db3@linux-foundation.org>
 <1623116020.vyls9ehp49.astroid@bobo.none>
 <20210607184805.eddf8eb26b80e8af85d5777e@linux-foundation.org>
In-Reply-To: <20210607184805.eddf8eb26b80e8af85d5777e@linux-foundation.org>
MIME-Version: 1.0
Message-Id: <1623125298.bx63h3mopj.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-arch@vger.kernel.org,
 =?iso-8859-1?q?Randy=0A?= Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Andy Lutomirski <luto@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Andrew Morton's message of June 8, 2021 11:48 am:
> On Tue, 08 Jun 2021 11:39:56 +1000 Nicholas Piggin <npiggin@gmail.com> wr=
ote:
>=20
>> > Looks like a functional change.  What's happening here?
>>=20
>> That's kthread_use_mm being clever about the lazy tlb mm. If it happened=
=20
>> that the kthread had inherited a the lazy tlb mm that happens to be the=20
>> one we want to use here, then we already have a refcount to it via the=20
>> lazy tlb ref.
>>=20
>> So then it doesn't have to touch the refcount, but rather just converts
>> it from the lazy tlb ref to the returned reference. If the lazy tlb mm
>> doesn't get a reference, we can't do that.
>=20
> Please cover this in the changelog and perhaps a code comment.
>=20

Yeah fair enough, I'll even throw in a bug fix as well (your nose was right=
,=20
and it was too clever for me by half...)

Thanks,
Nick

--
Fix a refcounting bug in kthread_use_mm (the mm reference is increased
unconditionally now, but the lazy tlb refcount is still only dropped only
if mm !=3D active_mm).

And an update for the changelog:

If a kernel thread's current lazy tlb mm happens to be the one it wants to
use, then kthread_use_mm() cleverly transfers the mm refcount from the
lazy tlb mm reference to the returned reference. If the lazy tlb mm
reference is no longer identical to a normal reference, this trick does not
work, so that is changed to be explicit about the two references.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 kernel/kthread.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/kernel/kthread.c b/kernel/kthread.c
index b70e28431a01..5e9797b2d06e 100644
--- a/kernel/kthread.c
+++ b/kernel/kthread.c
@@ -1314,6 +1314,11 @@ void kthread_use_mm(struct mm_struct *mm)
 	WARN_ON_ONCE(!(tsk->flags & PF_KTHREAD));
 	WARN_ON_ONCE(tsk->mm);
=20
+	/*
+	 * It's possible that tsk->active_mm =3D=3D mm here, but we must
+	 * still mmgrab(mm) and mmdrop_lazy_tlb(active_mm), because lazy
+	 * mm may not have its own refcount (see mmgrab/drop_lazy_tlb()).
+	 */
 	mmgrab(mm);
=20
 	task_lock(tsk);
@@ -1338,12 +1343,9 @@ void kthread_use_mm(struct mm_struct *mm)
 	 * memory barrier after storing to tsk->mm, before accessing
 	 * user-space memory. A full memory barrier for membarrier
 	 * {PRIVATE,GLOBAL}_EXPEDITED is implicitly provided by
-	 * mmdrop(), or explicitly with smp_mb().
+	 * mmdrop_lazy_tlb().
 	 */
-	if (active_mm !=3D mm)
-		mmdrop_lazy_tlb(active_mm);
-	else
-		smp_mb();
+	mmdrop_lazy_tlb(active_mm);
=20
 	to_kthread(tsk)->oldfs =3D force_uaccess_begin();
 }
--=20
2.23.0

