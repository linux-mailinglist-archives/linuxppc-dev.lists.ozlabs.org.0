Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A20415A9E7C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 19:52:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJTBt4l8Zz3fSx
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 03:52:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=tivdYiD8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3oo0qywykdn0rtqdmafnnfkd.bnlkhmtwoob-cdukhrsr.nyk9ar.nqf@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=tivdYiD8;
	dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJSry1GBnz303m
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 03:36:34 +1000 (AEST)
Received: by mail-yb1-xb49.google.com with SMTP id k126-20020a253d84000000b0068bb342010dso4890863yba.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Sep 2022 10:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date;
        bh=vKtrq3HIq0qVh4puVrk/99Ll6PM2V5XVbSUsmvDjj9I=;
        b=tivdYiD8ZAJK8kY23bdnMjSf6GqsaVRSwINiFtGtPiGjoWq5MFwTdXcs6F+jY7ZJCK
         /S9q6olR7R7v5bTdyGGJAkaj1esNAWRQw+6z/ncs3LyR7k1VQNGfhn+1/vYhCXSOHiL4
         6opl/Yux1TzXEQKGzwy0i4oX47fV8vpc6BEr00D/YdbkLyZ9SHmRwW4kBhG1xNo5Bgh3
         mtUhM/EXxGiBQ9J+E4RQUvuZwU4rl5n4anzWcV73TPe35S1Oe6kIZC4EGb3KKcT8isc0
         o4+RnjpTFgDSTn6r4q7bAZvWDnDcTYKIxFWZmBACSU/yC2EIvY26FAMGgxLd2T0siGu4
         jeUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=vKtrq3HIq0qVh4puVrk/99Ll6PM2V5XVbSUsmvDjj9I=;
        b=hsgJn/SxzH4gQVcjbIQ176Vkro5HHnvF8tpDn9Bqq599UmF5mN6UITFnYVbURiU2kS
         k8RReYxyfxy7X23kf0EG1bIFsO9WPnuES+EN7hHp/A54vYlF+MIH75IWBPMZCAoP+vW9
         pBAF76lPeUHe92rWGFt44DD43gKaq27/AgxZpxghbMJT1aLZHZHxZgu1oIyfKYhnr7gZ
         TD4CUZ0yrU+4wYufDo8ilm369WFJQ49UFgKvkUcR0W0Lyhfy+i/6p/j+axkE5yowSXPh
         PYIofue1VdlfMjvwYQHURvoMj0lgQBFgH25QhZZND42x3HMmN+saJ+U1g4ZFjieq0Oy1
         2ulg==
X-Gm-Message-State: ACgBeo3xcvceDxZe1fwECO+V+5ObK/h0157AYGGHHA4aSuA6dgVPGHCg
	YXwYPXY5UW1PZy8NQiscfO2qpmD3vxY=
X-Google-Smtp-Source: AA6agR6ETpVykmR2l2EiORnO/7/6aTPnOWA5nUbQjzShI0yNekZbMOoTb0Et/3IYHZBh1H/HSgpOo7WMY1M=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:1bfc:e7ee:6530:4449])
 (user=surenb job=sendgmr) by 2002:a25:9a85:0:b0:69b:79d2:7f4e with SMTP id
 s5-20020a259a85000000b0069b79d27f4emr15568357ybo.379.1662053792100; Thu, 01
 Sep 2022 10:36:32 -0700 (PDT)
Date: Thu,  1 Sep 2022 10:35:15 -0700
In-Reply-To: <20220901173516.702122-1-surenb@google.com>
Mime-Version: 1.0
References: <20220901173516.702122-1-surenb@google.com>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220901173516.702122-28-surenb@google.com>
Subject: [RFC PATCH RESEND 27/28] powerpc/mm: define ARCH_SUPPORTS_PER_VMA_LOCK
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, jglisse@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, laurent.dufour@fr.ibm.com, mgorman@suse.de, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, paulmck@kernel.org, liam.howlett@oracle.com, luto@kernel.org, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, linux-arm-kernel@lists.infradead.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Laurent Dufour <ldufour@linux.ibm.com>

Set ARCH_SUPPORTS_PER_VMA_LOCK so that the per-VMA lock support can be
compiled on powernv and pseries.
It may be use on the other platforms but I can't test that seriously.

Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 arch/powerpc/platforms/powernv/Kconfig | 1 +
 arch/powerpc/platforms/pseries/Kconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/powerpc/platforms/powernv/Kconfig b/arch/powerpc/platforms/powernv/Kconfig
index ae248a161b43..70a46acc70d6 100644
--- a/arch/powerpc/platforms/powernv/Kconfig
+++ b/arch/powerpc/platforms/powernv/Kconfig
@@ -16,6 +16,7 @@ config PPC_POWERNV
 	select PPC_DOORBELL
 	select MMU_NOTIFIER
 	select FORCE_SMP
+	select ARCH_SUPPORTS_PER_VMA_LOCK
 	default y
 
 config OPAL_PRD
diff --git a/arch/powerpc/platforms/pseries/Kconfig b/arch/powerpc/platforms/pseries/Kconfig
index fb6499977f99..7d13a2de3475 100644
--- a/arch/powerpc/platforms/pseries/Kconfig
+++ b/arch/powerpc/platforms/pseries/Kconfig
@@ -21,6 +21,7 @@ config PPC_PSERIES
 	select HOTPLUG_CPU
 	select FORCE_SMP
 	select SWIOTLB
+	select ARCH_SUPPORTS_PER_VMA_LOCK
 	default y
 
 config PARAVIRT_SPINLOCKS
-- 
2.37.2.789.g6183377224-goog

