Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B3720BB38
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 23:14:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49tqPt2mzrzDr2c
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jun 2020 07:14:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--brendanhiggins.bounces.google.com
 (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com;
 envelope-from=3bwt2xg4kakqfvirherlmkkmrwksskpi.gsq@flex--brendanhiggins.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=WgNUMXd3; dkim-atps=neutral
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com
 [IPv6:2607:f8b0:4864:20::104a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49tqJW2C50zDr0p
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jun 2020 07:09:28 +1000 (AEST)
Received: by mail-pj1-x104a.google.com with SMTP id co8so7937173pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jun 2020 14:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=J3ivtuBCWWA6WF3YNE0hm8BpVh0hgAMk0icQw8PVzV4=;
 b=WgNUMXd3dwHqJrIjWBq++Q/Kq0iip5LEa8AI7ViQMO4xCI++syC/ViOkIloaOcHBde
 m/Hql1FmK7XKs8F2kR0tHTAMFWHmTmRKIUuCQqkFM0JarAdI3BykpLTyJ7b8s6h2hLdD
 0qvYcqxCRm4XHMZnbIVv2mhVLC5jzqyzhDx1V5HzmG2WhGvdg13+1M0zkPlFZygPiX/x
 Mi+72a5chn6PjfdIaIcfOo8z0FUQPXMZUMwWWJyL4j+V4gSmYgMmBa99IuMRhURzFZkY
 CwNCkLlDhc4eW1rRjuEcrALlfILFa5AJqhQgkDoPV9GRFEpqNtzVD+KRztuFQ7mB+paG
 ULtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=J3ivtuBCWWA6WF3YNE0hm8BpVh0hgAMk0icQw8PVzV4=;
 b=Qn4nREzejH2GzodSErukHhV71h6NECZ+Q62mmyVCj+zjrgZIBlfRABI3xRYn2axKA+
 ouRNhPCINZ/KDxpCxYy04Mts61gl+GWwAwKGDR6srik8OivOCYev4bqN6GgOud6usg1r
 HCkH9dh+qKAMVG4V5eThHcuEdDFfCF87TvFTBz3587VuS2OJTMf/O0KGOeHeyJywEyEN
 ifva3/EuRzc9UlLAMtTUH80ix4GP9zjZ34fb07eyum8pLgjA5KyM/cZHQQZGOEG8SMcw
 lLBGb8F8tNAIXeagFeEE7S4qDpMbKQU+DmK3Y2md84iXmSA1krgZm/zPxhnh6PqJl112
 B0yw==
X-Gm-Message-State: AOAM532Mb0HoUkf18RP5InSQZ/8Sm4iPbZjcUSWYhhfZgNMhiIaIOc2q
 mo2zxZJLCzNd2u6T1x+lvmu1Z31hb1eMppz+mahSgg==
X-Google-Smtp-Source: ABdhPJyRryMOngRXWyo7Nk/HIoliWNzQOxasqOnm+O4DR7qeWVrVfGv1DfbeY3UB3YlKBNPdNWdcLph4S1CMJBqyAX4wRA==
X-Received: by 2002:a17:90a:2a04:: with SMTP id
 i4mr5431363pjd.91.1593205765384; 
 Fri, 26 Jun 2020 14:09:25 -0700 (PDT)
Date: Fri, 26 Jun 2020 14:09:06 -0700
In-Reply-To: <20200626210917.358969-1-brendanhiggins@google.com>
Message-Id: <20200626210917.358969-2-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20200626210917.358969-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
Subject: [PATCH v5 01/12] vmlinux.lds.h: add linker section for KUnit test
 suites
From: Brendan Higgins <brendanhiggins@google.com>
To: jdike@addtoit.com, richard@nod.at, anton.ivanov@cambridgegreys.com, 
 arnd@arndb.de, keescook@chromium.org, skhan@linuxfoundation.org, 
 alan.maguire@oracle.com, yzaikin@google.com, davidgow@google.com, 
 akpm@linux-foundation.org, rppt@linux.ibm.com, frowand.list@gmail.com, 
 catalin.marinas@arm.com, will@kernel.org, monstr@monstr.eu, 
 mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org, 
 chris@zankel.net, jcmvbkbc@gmail.com
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
Cc: linux-arch@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 linux-doc@vger.kernel.org, sboyd@kernel.org, gregkh@linuxfoundation.org,
 linuxppc-dev@lists.ozlabs.org, linux-um@lists.infradead.org,
 linux-kernel@vger.kernel.org, Brendan Higgins <brendanhiggins@google.com>,
 mcgrof@kernel.org, linux-kselftest@vger.kernel.org, logang@deltatee.com,
 linux-arm-kernel@lists.infradead.org, kunit-dev@googlegroups.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add a linker section where KUnit can put references to its test suites.
This patch is the first step in transitioning to dispatching all KUnit
tests from a centralized executor rather than having each as its own
separate late_initcall.

Co-developed-by: Iurii Zaikin <yzaikin@google.com>
Signed-off-by: Iurii Zaikin <yzaikin@google.com>
Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
---
 include/asm-generic/vmlinux.lds.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index db600ef218d7d..4f9b036fc9616 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -881,6 +881,13 @@
 		KEEP(*(.con_initcall.init))				\
 		__con_initcall_end = .;
 
+/* Alignment must be consistent with (kunit_suite *) in include/kunit/test.h */
+#define KUNIT_TEST_SUITES						\
+		. = ALIGN(8);						\
+		__kunit_suites_start = .;				\
+		KEEP(*(.kunit_test_suites))				\
+		__kunit_suites_end = .;
+
 #ifdef CONFIG_BLK_DEV_INITRD
 #define INIT_RAM_FS							\
 	. = ALIGN(4);							\
@@ -1056,6 +1063,7 @@
 		INIT_CALLS						\
 		CON_INITCALL						\
 		INIT_RAM_FS						\
+		KUNIT_TEST_SUITES					\
 	}
 
 #define BSS_SECTION(sbss_align, bss_align, stop_align)			\
-- 
2.27.0.212.ge8ba1cc988-goog

