Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E1A39ECD8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 05:16:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fzb3n70rtz300C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 13:16:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=VTIEVOTL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032;
 helo=mail-pj1-x1032.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VTIEVOTL; dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fzb3K3y2tz2y0C
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Jun 2021 13:15:41 +1000 (AEST)
Received: by mail-pj1-x1032.google.com with SMTP id
 fy24-20020a17090b0218b029016c5a59021fso6655321pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Jun 2021 20:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=7QJgmeOZHxm1wlCHFZhavmAZLKz2FF5Hv428G3b4qiw=;
 b=VTIEVOTLyXhOQe/MeRuSpN2ald0aymOH2UckQUkbGDMCnIWpLofhC3CcsWGO6G81jD
 rWunxyEAy2ZhgLcYR00X4AbEZk1j5BC/8NcRbdVVuKOD8+KnUn4/TCpILr7C32XqRToY
 sin0OyeSbpzbkoBpqneBi8GdLH2Z7/N18b3kF0Ps+Lk4MDwRPpFjSfRySdvw6C4c1DfX
 Van3r+hqrc3s2QAHIpTEOn5FTzL+QTW3T7TGMuWjY6i4MKtL9dFITUqB5EOQSBq4DvSD
 6h+x27wIC4NFr5GL5Id6MGuwBKIi02sjXx+buHb6JeURZXK6LtzNm0Ul+ax1Ar08t1bR
 Sqmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=7QJgmeOZHxm1wlCHFZhavmAZLKz2FF5Hv428G3b4qiw=;
 b=XH5hy3ACzy+d1/CW1mO1Ca8RWnhPfosdpL3dCzQshCVJqlT5IXaYGEMaFCvKf+GHF4
 o0txq/HNRS5TTE/tlL8MZ0TWgOT/pNajkje9Kw7/7OZTy6lqafQ0Yl51ISawEhvAc58/
 I0nTSUtGUYbjJd3TEFqZ6wZZ2SdohGqOUevCYtn3E8fMmki4fJccAI9XuVpaJ827DGrR
 dmBLHs/zLrDMga5+C0VFJcMeBoUsr8WlsENkVU6RVW0GJ6atAYDNaDmaJ09p5rkMfr1X
 GRCYmiH3kkBruGu3yYXAWRSIMM75jj1XQULNMWlCqZTFLX0KB7YySE5mjwdGjr/TqZHP
 4HWw==
X-Gm-Message-State: AOAM533qmNiVt3zn99CQtMlOnhdlbaC97KDVUqwa/eDLC/oKLqNRAfGg
 jIdh7RuphG/dSFYGUpJxKk0=
X-Google-Smtp-Source: ABdhPJyEpZ9jHgeUSsOnRiilTupzYo+aah3Y5D06OH682oRgr8S6Jdcc4g/fCCW+4iV8GPHoxi4iMw==
X-Received: by 2002:a17:90b:46c3:: with SMTP id
 jx3mr16570209pjb.206.1623122137531; 
 Mon, 07 Jun 2021 20:15:37 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id z17sm9264539pfq.218.2021.06.07.20.15.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 20:15:37 -0700 (PDT)
Date: Tue, 08 Jun 2021 13:15:32 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 3/4] lazy tlb: shoot lazies, a non-refcounting lazy tlb
 option
To: Andrew Morton <akpm@linux-foundation.org>
References: <20210605014216.446867-1-npiggin@gmail.com>
 <20210605014216.446867-4-npiggin@gmail.com>
In-Reply-To: <20210605014216.446867-4-npiggin@gmail.com>
MIME-Version: 1.0
Message-Id: <1623121901.mszkmmum0n.astroid@bobo.none>
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
 Andy Lutomirski <luto@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Nicholas Piggin's message of June 5, 2021 11:42 am:
> On big systems, the mm refcount can become highly contented when doing
> a lot of context switching with threaded applications (particularly
> switching between the idle thread and an application thread).
>=20
> Abandoning lazy tlb slows switching down quite a bit in the important
> user->idle->user cases, so instead implement a non-refcounted scheme
> that causes __mmdrop() to IPI all CPUs in the mm_cpumask and shoot down
> any remaining lazy ones.
>=20
> Shootdown IPIs are some concern, but they have not been observed to be
> a big problem with this scheme (the powerpc implementation generated
> 314 additional interrupts on a 144 CPU system during a kernel compile).
> There are a number of strategies that could be employed to reduce IPIs
> if they turn out to be a problem for some workload.
>=20
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---

Update the comment to be clearer, and account for the improvement
to MMU_LAZY_TLB_REFCOUNT comment.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/Kconfig | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 2ad1a505ca55..cf468c9777d8 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -433,15 +433,16 @@ config MMU_LAZY_TLB_REFCOUNT
 	def_bool y
 	depends on !MMU_LAZY_TLB_SHOOTDOWN
=20
-# Instead of refcounting the lazy mm struct for kernel thread references
-# (which can cause contention with multi-threaded apps on large multiproce=
ssor
-# systems), this option causes __mmdrop to IPI all CPUs in the mm_cpumask =
and
-# switch to init_mm if they were using the to-be-freed mm as the lazy tlb.=
 To
-# implement this, architectures must use _lazy_tlb variants of mm refcount=
ing
-# when releasing kernel thread mm references, and mm_cpumask must include =
at
-# least all possible CPUs in which the mm might be lazy, at the time of th=
e
-# final mmdrop. mmgrab/mmdrop in arch/ code must be switched to _lazy_tlb
-# postfix as necessary.
+# This option allows MMU_LAZY_TLB_REFCOUNT=3Dn. It ensures no CPUs are usi=
ng an
+# mm as a lazy tlb beyond its last reference count, by shooting down these
+# users before the mm is deallocated. __mmdrop() first IPIs all CPUs that =
may
+# be using the mm as a lazy tlb, so that they may switch themselves to usi=
ng
+# init_mm for their active mm. mm_cpumask(mm) is used to determine which C=
PUs
+# may be using mm as a lazy tlb mm.
+#
+# To implement this, an arch must ensure mm_cpumask(mm) contains at least =
all
+# possible CPUs in which the mm is lazy, and it must meet the requirements=
 for
+# MMU_LAZY_TLB_REFCOUNT=3Dn (see above).
 config MMU_LAZY_TLB_SHOOTDOWN
 	bool
=20
--=20
2.23.0

