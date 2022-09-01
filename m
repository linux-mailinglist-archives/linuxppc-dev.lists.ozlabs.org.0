Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3575A9E21
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 19:36:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJSs9534Jz3c6X
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 03:36:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ouDtFH7J;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3w-0qywykdjgkmj6f38gg8d6.4gedafmphh4-56ndaklk.grd23k.gj8@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ouDtFH7J;
	dkim-atps=neutral
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJSqf1V6pz2xZV
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 03:35:26 +1000 (AEST)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-33ef3e5faeeso228797907b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Sep 2022 10:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date;
        bh=SI5DHC7dpiRJVHhhWYV+lwBh2iwV9A0Ou3FEYYZKTIo=;
        b=ouDtFH7Jsoj5d0amZ6w++vn1JIcEBsAg0+Jc3jSu1CI/YwtCjIjWCXa3h1daFKHXKc
         cShsEzXCG6pl7Qo8JUwfzrGY3LljVOQU7WP+kQRk9jvRvgn5CYGLdVxDx9mvrs6u6z8K
         /gtKC5pqelI7Ja6YPAH2266yNgoWGngIuBTy9e4Ky4U5csa2GQgfjUrkug/tPpsGFles
         yx5i2EqiywQtBnfaWAJzlm/RHBLABr6GNuXXMOHeNq811kfvPtT71YKWoN7/bLzrrmPy
         z0tKwDEKWW16qZuqOrYHGA9KvA/VUBzIFMBe0AdL5oZh7HL1RXGViqdJIuZcrmP9S3mv
         xPFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=SI5DHC7dpiRJVHhhWYV+lwBh2iwV9A0Ou3FEYYZKTIo=;
        b=71enOUL5KpXHUSi44LyYQ3g3coBaKCTEwRRhiONXMvx7mI+IzZ1XZHaHWe98dF5Ej2
         Ye84YvVN5nA2BvHUuqMp9hS2RwQWNDnESlQ0pPq5FA4PEYgDyEe1SBNtU/PVu+jLvKGO
         Gr0ZkLBO6dJc9tqKOhjklOkb2jieChFaM8ORUi+7AEflB/PmhL7XNyzCDJN9fCkXODTY
         +lNgb5ExZBgoTcN+nDSUX3ddICopoS9inkfqFarjVTC9DorB9BokdCQcUObF/qep4WcF
         KkUN52QRjRo+GVkRzZXsaGQT1htNUFO+xkD3KIjGIH6pEHyCJH/+Faa420R+9olzDLJC
         Xc5w==
X-Gm-Message-State: ACgBeo0gdQ4zIfjvxD/ZLZ+jJo9/wB8hw6tkClt3V+QQhcmuKyHeLDEd
	nQPZxrdw7TefOldxfJnN99o/5N3MB9U=
X-Google-Smtp-Source: AA6agR4TWv71WCFs9L88lUEt8sy6dDZVYBPPgP4/10a2Bx/Ool+t8WQWT1a/Z5ySDpeCnHjOLWwcwNW6snI=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:1bfc:e7ee:6530:4449])
 (user=surenb job=sendgmr) by 2002:a25:8e8f:0:b0:691:9579:d3c5 with SMTP id
 q15-20020a258e8f000000b006919579d3c5mr19748036ybl.249.1662053723940; Thu, 01
 Sep 2022 10:35:23 -0700 (PDT)
Date: Thu,  1 Sep 2022 10:34:49 -0700
In-Reply-To: <20220901173516.702122-1-surenb@google.com>
Mime-Version: 1.0
References: <20220901173516.702122-1-surenb@google.com>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220901173516.702122-2-surenb@google.com>
Subject: [RFC PATCH RESEND 01/28] mm: introduce CONFIG_PER_VMA_LOCK
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

This configuration variable will be used to build the support for VMA
locking during page fault handling.

This is enabled by default on supported architectures with SMP and MMU
set.

The architecture support is needed since the page fault handler is called
from the architecture's page faulting code which needs modifications to
handle faults under VMA lock.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 mm/Kconfig | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/mm/Kconfig b/mm/Kconfig
index 0331f1461f81..58c20fad9cf9 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1124,6 +1124,19 @@ config PTE_MARKER_UFFD_WP
 	  purposes.  It is required to enable userfaultfd write protection on
 	  file-backed memory types like shmem and hugetlbfs.
 
+config ARCH_SUPPORTS_PER_VMA_LOCK
+       def_bool n
+
+config PER_VMA_LOCK
+	bool "Per-vma locking support"
+	default y
+	depends on ARCH_SUPPORTS_PER_VMA_LOCK && MMU && SMP
+	help
+	  Allow per-vma locking during page fault handling.
+
+	  This feature allows locking each virtual memory area separately when
+	  handling page faults instead of taking mmap_lock.
+
 source "mm/damon/Kconfig"
 
 endmenu
-- 
2.37.2.789.g6183377224-goog

