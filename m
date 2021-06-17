Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7693AA828
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 02:32:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G53195FP4z3bsy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 10:32:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=HVWMTemg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b;
 helo=mail-pj1-x102b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=HVWMTemg; dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G530j2LVNz3063
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 10:32:19 +1000 (AEST)
Received: by mail-pj1-x102b.google.com with SMTP id k7so2756365pjf.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Jun 2021 17:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=HlMAqLQxn6v+mWiiXUxQu/TdTnXdtQ7st+0tT7u1DFY=;
 b=HVWMTemgMHeY2VUSfacljFjPg0M/GfrzQ13PNudHzyQrFDqeFmIy0VAmJxC7l8I/g0
 DeNyxGemOr+cDh12p/+Dh4jUz7l2idGLs8ZDWPkbrikWSusJvIXHnqKcfbEaghaJJys+
 IeJKhqR4/wRm5zCPrHxuKBffIwHtxftuOHRObLBpC+t7iGj1N24SRKkl0Z2R8z5abEe4
 WLtd2ZjY3PSM3i/5h/D7tnLwC+sw6HYRw3/bHOcx20fahWLsXDxxaciUV7/OA88KOFox
 IMAdtoi74gW3r1QdDtjVOhb9r+BKDjhVtyXBO6M3zUpVhULVKIVTkLvFoLijMl2/iTNY
 2kcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=HlMAqLQxn6v+mWiiXUxQu/TdTnXdtQ7st+0tT7u1DFY=;
 b=Qyz32ePBSCFkhgAec4Sez/H2ZtW38K3IEt3AyZpt1aJC9i73S4qaGZZIKV++n4eWrS
 eLUiMpz69E76xLXAnD66rr+dexwAsjLFWzA0m31Sc+W89vWRZRA1WfRfI/Reat53oEw7
 XpxjTETUMK5nfzD1Ma1s47+ivFoCchH0PP+DiTx5QGlHJHUbvycPL6CckBAiDz1GwXjN
 fUzrZvVTxCGHUI2eFPoVPfUlPaBG3IGMDp6pM1XbCiY4WKG+hFDNyYbakHC+x+3FIaSg
 5ABzrFSpQTogHVfuLxxmOyMSmtQcp+P8oGQHSfi5dZjInaFoJ5xH8ySWSDTsET16P/mk
 MKgQ==
X-Gm-Message-State: AOAM533BwieTKlA3tIIqTnpzpkNNYXvA7cCE+J0Qca3zmyEW6r9COIYn
 e/vOY1LKYvEQse/r4WNiSHw=
X-Google-Smtp-Source: ABdhPJw1j+Sf3Rs1tAp4YIYmoABCfc/HdBFsODjUCrmIAPsu6DNBYVbsuoUQtu23Ubyav+KRXU0yLg==
X-Received: by 2002:a17:90a:c08f:: with SMTP id
 o15mr13401437pjs.166.1623889933645; 
 Wed, 16 Jun 2021 17:32:13 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id s21sm3362607pgo.42.2021.06.16.17.32.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 17:32:13 -0700 (PDT)
Date: Thu, 17 Jun 2021 10:32:07 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 2/4] lazy tlb: allow lazy tlb mm refcounting to be
 configurable
To: Andrew Morton <akpm@linux-foundation.org>, Andy Lutomirski
 <luto@kernel.org>
References: <20210605014216.446867-1-npiggin@gmail.com>
 <20210605014216.446867-3-npiggin@gmail.com>
 <8ac1d420-b861-f586-bacf-8c3949e9b5c4@kernel.org>
 <1623629185.fxzl5xdab6.astroid@bobo.none>
 <02e16a2f-2f58-b4f2-d335-065e007bcea2@kernel.org>
 <1623643443.b9twp3txmw.astroid@bobo.none>
 <1623645385.u2cqbcn3co.astroid@bobo.none>
 <1623647326.0np4yc0lo0.astroid@bobo.none>
 <aecf5bc8-9018-c021-287d-6a975b7a6235@kernel.org>
 <1623715482.4lskm3cx10.astroid@bobo.none>
 <3b9eb877-5d1e-d565-5577-575229d18b6e@kernel.org>
 <1623803360.zd3fo9zm1z.astroid@bobo.none>
In-Reply-To: <1623803360.zd3fo9zm1z.astroid@bobo.none>
MIME-Version: 1.0
Message-Id: <1623887812.eoi29y243g.astroid@bobo.none>
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
Cc: linux-arch@vger.kernel.org, Rik van Riel <riel@surriel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Nicholas Piggin's message of June 16, 2021 11:02 am:
> Excerpts from Andy Lutomirski's message of June 16, 2021 10:14 am:
>> akpm, please drop this series until it's fixed.  It's a core change to
>> better support arch usecases, but it's unnecessarily fragile, and there
>> is already an arch maintainer pointing out that it's inadequate to
>> robustly support arch usecases.  There is no reason to merge it in its
>> present state.

Just to make sure I'm not doing anything stupid or fragile for other=20
archs, I had a closer look at a few. sparc32 is the only one I have a=20
SMP capable qemu and initramfs at hand for, took about 5 minutes to=20
convert after fixing 2 other sparc32/mm bugs (patches on linux-sparc),
one of them found by the DEBUG_VM code my series added. It seems to work=20
fine, with what little stressing my qemu setup can muster.

Simple. Robust. Pretty mechanical conversion follows the documented=20
reciple. Re-uses every single line of code I added outside=20
arch/powerpc/. Requires no elaborate dances.

alpha and arm64 are both 4-liners by the looks, sparc64 might reqiure a=20
bit of actual code but doesn't look too hard.

So I'm satisfied the code added outside arch/powerpc/ is not some=20
fragile powerpc specific hack. I don't know if other archs will use=20
it, but they easily can use it[*].

And we can make changes to help x86 whenever its needed -- I already=20
posted patch 1/n for configuring out lazy tlb and active_mm from core=20
code rebased on top of mmotm so the series is not preventing such=20
changes.

Hopefully this allays some concerns.

[*] I do think mmgrab_lazy_tlb is a nice change that self-documents the=20
    active_mm refcounting, so I will try to get all the arch code=20
    converted to use it over the next few releases, even if they never
    switch to use lazy tlb shootdown.

Thanks,
Nick

---
 arch/sparc/Kconfig            | 1 +
 arch/sparc/kernel/leon_smp.c  | 2 +-
 arch/sparc/kernel/smp_64.c    | 2 +-
 arch/sparc/kernel/sun4d_smp.c | 2 +-
 arch/sparc/kernel/sun4m_smp.c | 2 +-
 arch/sparc/kernel/traps_32.c  | 2 +-
 arch/sparc/kernel/traps_64.c  | 2 +-
 7 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
index 164a5254c91c..db9954af57a2 100644
--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -58,6 +58,7 @@ config SPARC32
 	select GENERIC_ATOMIC64
 	select CLZ_TAB
 	select HAVE_UID16
+	select MMU_LAZY_TLB_SHOOTDOWN
 	select OLD_SIGACTION
=20
 config SPARC64
diff --git a/arch/sparc/kernel/leon_smp.c b/arch/sparc/kernel/leon_smp.c
index 1eed26d423fb..d00460788048 100644
--- a/arch/sparc/kernel/leon_smp.c
+++ b/arch/sparc/kernel/leon_smp.c
@@ -92,7 +92,7 @@ void leon_cpu_pre_online(void *arg)
 			     : "memory" /* paranoid */);
=20
 	/* Attach to the address space of init_task. */
-	mmgrab(&init_mm);
+	mmgrab_lazy_tlb(&init_mm);
 	current->active_mm =3D &init_mm;
=20
 	while (!cpumask_test_cpu(cpuid, &smp_commenced_mask))
diff --git a/arch/sparc/kernel/smp_64.c b/arch/sparc/kernel/smp_64.c
index e38d8bf454e8..19aa12991f2b 100644
--- a/arch/sparc/kernel/smp_64.c
+++ b/arch/sparc/kernel/smp_64.c
@@ -127,7 +127,7 @@ void smp_callin(void)
 	current_thread_info()->new_child =3D 0;
=20
 	/* Attach to the address space of init_task. */
-	mmgrab(&init_mm);
+	mmgrab_lazy_tlb(&init_mm);
 	current->active_mm =3D &init_mm;
=20
 	/* inform the notifiers about the new cpu */
diff --git a/arch/sparc/kernel/sun4d_smp.c b/arch/sparc/kernel/sun4d_smp.c
index ff30f03beb7c..a6f392dcfeaf 100644
--- a/arch/sparc/kernel/sun4d_smp.c
+++ b/arch/sparc/kernel/sun4d_smp.c
@@ -94,7 +94,7 @@ void sun4d_cpu_pre_online(void *arg)
 	show_leds(cpuid);
=20
 	/* Attach to the address space of init_task. */
-	mmgrab(&init_mm);
+	mmgrab_lazy_tlb(&init_mm);
 	current->active_mm =3D &init_mm;
=20
 	local_ops->cache_all();
diff --git a/arch/sparc/kernel/sun4m_smp.c b/arch/sparc/kernel/sun4m_smp.c
index 228a6527082d..0ee77f066c9e 100644
--- a/arch/sparc/kernel/sun4m_smp.c
+++ b/arch/sparc/kernel/sun4m_smp.c
@@ -60,7 +60,7 @@ void sun4m_cpu_pre_online(void *arg)
 			     : "memory" /* paranoid */);
=20
 	/* Attach to the address space of init_task. */
-	mmgrab(&init_mm);
+	mmgrab_lazy_tlb(&init_mm);
 	current->active_mm =3D &init_mm;
=20
 	while (!cpumask_test_cpu(cpuid, &smp_commenced_mask))
diff --git a/arch/sparc/kernel/traps_32.c b/arch/sparc/kernel/traps_32.c
index 247a0d9683b2..a3186bb30109 100644
--- a/arch/sparc/kernel/traps_32.c
+++ b/arch/sparc/kernel/traps_32.c
@@ -387,7 +387,7 @@ void trap_init(void)
 		thread_info_offsets_are_bolixed_pete();
=20
 	/* Attach to the address space of init_task. */
-	mmgrab(&init_mm);
+	mmgrab_lazy_tlb(&init_mm);
 	current->active_mm =3D &init_mm;
=20
 	/* NOTE: Other cpus have this done as they are started
diff --git a/arch/sparc/kernel/traps_64.c b/arch/sparc/kernel/traps_64.c
index a850dccd78ea..b6e46732fa69 100644
--- a/arch/sparc/kernel/traps_64.c
+++ b/arch/sparc/kernel/traps_64.c
@@ -2929,6 +2929,6 @@ void __init trap_init(void)
 	/* Attach to the address space of init_task.  On SMP we
 	 * do this in smp.c:smp_callin for other cpus.
 	 */
-	mmgrab(&init_mm);
+	mmgrab_lazy_tlb(&init_mm);
 	current->active_mm =3D &init_mm;
 }
--=20
2.23.0

