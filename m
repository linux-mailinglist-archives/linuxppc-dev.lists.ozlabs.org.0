Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7123D39C461
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Jun 2021 02:27:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FxgSB67nyz302S
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Jun 2021 10:27:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=sVqQhvrI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030;
 helo=mail-pj1-x1030.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=sVqQhvrI; dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FxgRl1Rklz2yhf
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Jun 2021 10:26:42 +1000 (AEST)
Received: by mail-pj1-x1030.google.com with SMTP id
 pi6-20020a17090b1e46b029015cec51d7cdso6751137pjb.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Jun 2021 17:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=bZWOWnyu5nOe9hcwFfo38NCzqJqFs6QIG+9+6hzf77k=;
 b=sVqQhvrIPUBvhq9HtJAXuH25dYnILW0Sccv/4f3kBtq8+yjB9Q2rlbVMvEFBrhoCwL
 8mqplKoEyo66t1+0ew+hojihXivOBR9xYtA22CBcYb9h1+P/N5WXqRC6zVN7Yb7hpK6N
 IocfJS0SQ3z3Xd78/cL8L5GZYphnNEXqg9BWMPOa7YD+4p4VteyOP9rpHNHclY8KN3o4
 WRwxq+nCsAJejGBX6AF6CAvv9npAJJHuOBrQ6RUH0u3pKT46ecjUodDLrIJPwIfWMCNx
 FirBG6cPB7pE8mqYmveLri/nAP8JMAY+TC69u0QDfQrjYiJhMN473ti2/BgpztdJQ4W1
 kxmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=bZWOWnyu5nOe9hcwFfo38NCzqJqFs6QIG+9+6hzf77k=;
 b=Uj18RnYL3ZUYaXOlIDDhQBxSp1VpvM7Rwgf5mmb+sUXRTPtMm9Qbm5dr3XZol0/muA
 3VdX9qEh2rHn37ooIdp49+ov0odV9Oj8Cvswdn5ddOFGGzmvo+OK10zL7relQwUTmPKj
 1rUj7lpW6twUt7jSAeBZb9GNdmGaiOae9OJBMJIeREw7G6bj62AC2teF9vlKBzRUmEX+
 +VXsuaH3VIN2rFDO9PpQM7VrZQpI4S6cHhbSNKvIc3s3jS03Kx48gR8eWIvprLud+3p3
 FLqLOnwO5imPYlrYbS5bzR50llb22pOUBP2MHarf96TwQFSIYWxBcSE6mNp5Hkzwip6v
 +gyg==
X-Gm-Message-State: AOAM530y6QzeB0CcTsri6ei/kLiPPgKQOP29aC9kgLwkVxXFSJ3bKhxz
 g9KYdC9ajepPTEc+J+xFMTU=
X-Google-Smtp-Source: ABdhPJxjr6SRTKqd7M2yn2GGd8wbqclJvvKqlheGcJ1NnTc0q1WibCsKIJKVTsY5Sdd7a6n11TS1OQ==
X-Received: by 2002:a17:902:f704:b029:f4:228d:4dca with SMTP id
 h4-20020a170902f704b02900f4228d4dcamr7003155plo.26.1622852798616; 
 Fri, 04 Jun 2021 17:26:38 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id z17sm2589464pfq.218.2021.06.04.17.26.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 17:26:38 -0700 (PDT)
Date: Sat, 05 Jun 2021 10:26:32 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 0/4] shoot lazy tlbs
To: Andrew Morton <akpm@linux-foundation.org>, Andy Lutomirski
 <luto@kernel.org>
References: <20210601062303.3932513-1-npiggin@gmail.com>
 <603ffd67-3638-4c47-8067-c1bdfdf65f1b@kernel.org>
 <991660c3-c2bf-c303-a55c-7454f0cc45f7@kernel.org>
 <1622851909.wxi3vcx3m8.astroid@bobo.none>
In-Reply-To: <1622851909.wxi3vcx3m8.astroid@bobo.none>
MIME-Version: 1.0
Message-Id: <1622852601.xyhcpcfd7y.astroid@bobo.none>
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
Cc: linux-arch@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Nicholas Piggin's message of June 5, 2021 10:17 am:
> Excerpts from Andy Lutomirski's message of June 5, 2021 3:05 am:
>> On 6/4/21 9:54 AM, Andy Lutomirski wrote:
>>> On 5/31/21 11:22 PM, Nicholas Piggin wrote:
>>>> There haven't been objections to the series since last posting, this
>>>> is just a rebase and tidies up a few comments minor patch rearranging.
>>>>
>>>=20
>>> I continue to object to having too many modes.  I like my more generic
>>> improvements better.  Let me try to find some time to email again.
>>>=20
>>=20
>> Specifically, this:
>>=20
>> https://git.kernel.org/pub/scm/linux/kernel/git/luto/linux.git/commit/?h=
=3Dx86/mm
>=20
> That's worse than what powerpc does with the shoot lazies code so=20
> we wouldn't use it anyway.
>=20
> The fact is mm-cpumask and lazy mm is very architecture specific, so I=20
> don't really see that another "mode" is such a problem, it's for the=20
> most part "this is what powerpc does" -> "this is what powerpc does".
> The only mode in the context switch is just "take a ref on the lazy mm"
> or "don't take a ref". Surely that's not too onerous to add!?
>=20
> Actually the bigger part of it is actually the no-lazy mmu mode which
> is not yet used, I thought it was a neat little demonstrator of how code
> works with/without lazy but I will get rid of that for submission.

I admit that does add a bit more churn than necessary maybe that was
the main objection.

Here is the entire kernel/sched/core.c change after that is removed.
Pretty simple now. I'll resubmit.

Thanks,
Nick


diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index e359c76ea2e2..1be0b97e12ec 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -4171,7 +4171,7 @@ static struct rq *finish_task_switch(struct task_stru=
ct *prev)
 	__releases(rq->lock)
 {
 	struct rq *rq =3D this_rq();
-	struct mm_struct *mm =3D rq->prev_mm;
+	struct mm_struct *mm =3D NULL;
 	long prev_state;
=20
 	/*
@@ -4190,7 +4190,10 @@ static struct rq *finish_task_switch(struct task_str=
uct *prev)
 		      current->comm, current->pid, preempt_count()))
 		preempt_count_set(FORK_PREEMPT_COUNT);
=20
-	rq->prev_mm =3D NULL;
+#ifdef CONFIG_MMU_LAZY_TLB_REFCOUNT
+	mm =3D rq->prev_lazy_mm;
+	rq->prev_lazy_mm =3D NULL;
+#endif
=20
 	/*
 	 * A task struct has one reference for the use as "current".
@@ -4326,9 +4329,21 @@ context_switch(struct rq *rq, struct task_struct *pr=
ev,
 		switch_mm_irqs_off(prev->active_mm, next->mm, next);
=20
 		if (!prev->mm) {                        // from kernel
-			/* will mmdrop_lazy_tlb() in finish_task_switch(). */
-			rq->prev_mm =3D prev->active_mm;
+#ifdef CONFIG_MMU_LAZY_TLB_REFCOUNT
+			/* Will mmdrop_lazy_tlb() in finish_task_switch(). */
+			rq->prev_lazy_mm =3D prev->active_mm;
 			prev->active_mm =3D NULL;
+#else
+			/*
+			 * Without MMU_LAZY_TLB_REFCOUNT there is no lazy
+			 * tracking (because no rq->prev_lazy_mm) in
+			 * finish_task_switch, so no mmdrop_lazy_tlb(),
+			 * so no memory barrier for membarrier (see the
+			 * membarrier comment in finish_task_switch()).
+			 * Do it here.
+			 */
+			smp_mb();
+#endif
 		}
 	}
=20
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index a189bec13729..0729cf19a987 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -961,7 +961,9 @@ struct rq {
 	struct task_struct	*idle;
 	struct task_struct	*stop;
 	unsigned long		next_balance;
-	struct mm_struct	*prev_mm;
+#ifdef CONFIG_MMU_LAZY_TLB_REFCOUNT
+	struct mm_struct	*prev_lazy_mm;
+#endif
=20
 	unsigned int		clock_update_flags;
 	u64			clock;

