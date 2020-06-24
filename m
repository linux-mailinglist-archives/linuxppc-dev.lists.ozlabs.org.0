Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F0092207E2A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 23:10:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49sbQ40nGDzDqcR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jun 2020 07:10:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--brendanhiggins.bounces.google.com
 (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com;
 envelope-from=3yr7zxg4kaksmcpyolystrrtydrzzrwp.nzx@flex--brendanhiggins.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=tc++vE8O; dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49sb8X3lmPzDqWb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jun 2020 06:58:12 +1000 (AEST)
Received: by mail-yb1-xb4a.google.com with SMTP id l9so2799196ybm.20
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jun 2020 13:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=J3ivtuBCWWA6WF3YNE0hm8BpVh0hgAMk0icQw8PVzV4=;
 b=tc++vE8OqiFWBPWLgjgz+8iB4vui6irGevOP603lUg1UNDik9D3RHD3BRtfvQnnEf0
 jrKRLdHrhmzWJKnehTSRLbse6SnSXGQd35K2w5Zw9Z+uwoCNqlj6mkrJWH36qGOISkU2
 3NifzTZEtRhL18lQl5iPbyga7DEY6bWA2ca3xSr4TZGtif0WyKPDe33h2W95GCGjYoTD
 LoLgCnF8B+dCod++2Ii9nCw49QtFtdis8Pk9VuDF5L/wQjwjqBE0rPgSwa+KcPbSzpms
 Ap+f4GQjV/9IxN/DKcUM1pSafBVlQkPDdfl802IjkfV7kftNlqpzgQEn6l454cRI3B5c
 XxTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=J3ivtuBCWWA6WF3YNE0hm8BpVh0hgAMk0icQw8PVzV4=;
 b=rfIc7QniR6rWoqJFnxEUi40iz8q71uyBKP+sOAX0THh+K7vbQ1hpjXVMyFPIa/2rdA
 cq8Vz47WXhsOJx6cdqAEd82bPnAYwHR+LQ1dKOc6/EadIVvgmuN7fGlnVwx4gI0CykVe
 HjLC5sQNK10TVo0HmdI5+yGV5Gq0enxrnZuLWhvXNvWcwl/T4veaRMjRua48J5O9IwSK
 El3PrwPyMlet5cydX8VCX9Kn345hjM5b2PicfyP3T7R7jZL2rYjTFE+0WzHslng7wGd3
 Pl3rxsar9WnhAtJKO2kCdH3vplNuNqyTmG9tbTzWvBI8sK3mwWhsEPyUiOOOLy7uStUK
 M4pw==
X-Gm-Message-State: AOAM531Cd/8c8B/jknEDDSZ3hi+rXrH1jzK8g8hDTU89AanSRZWJTIoQ
 +S93kMFSdf6C9r8NvlotVsiATFfRdFLNx1Ct7f5SxQ==
X-Google-Smtp-Source: ABdhPJxdBp1vku0LQMvgNodo050SkO7FsfUngwFhnwGxx7442lwKRrC6xg8fX13lreYNm4d8BSbKm5F9o+C9V7i1TJs25w==
X-Received: by 2002:a25:ba09:: with SMTP id t9mr49146881ybg.128.1593032290524; 
 Wed, 24 Jun 2020 13:58:10 -0700 (PDT)
Date: Wed, 24 Jun 2020 13:55:40 -0700
In-Reply-To: <20200624205550.215599-1-brendanhiggins@google.com>
Message-Id: <20200624205550.215599-2-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20200624205550.215599-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
Subject: [PATCH v4 01/11] vmlinux.lds.h: add linker section for KUnit test
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
X-Mailman-Approved-At: Thu, 25 Jun 2020 07:08:14 +1000
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

