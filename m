Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C3189207E6B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 23:22:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49sbhf75QyzDqbC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jun 2020 07:22:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--brendanhiggins.bounces.google.com
 (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com;
 envelope-from=3zr7zxg4kak8qgtcspcwxvvxchvddvat.rdb@flex--brendanhiggins.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=r4C8omzl; dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49sb8Z5SH2zDqPj
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jun 2020 06:58:16 +1000 (AEST)
Received: by mail-yb1-xb49.google.com with SMTP id s7so3566058ybg.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jun 2020 13:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=hiFp+uoptqOZ2rqi90LxI+MqGbDbXrg3yHQVzKDmQQ4=;
 b=r4C8omzldjna6reCrt2PzuMWWZE3IZ2y3f6lclc933vQMY5LTWLxwFuKexT4JvEe9A
 iElOlRcRe7ONH9zL0N4HZ5GBzncNZey4G1Aoed+ZlwUMSzmLjxbt1S7d8G7s/Q1XyI78
 vPZb6jL2BlxrYw6quFHLcZOJf/UggWPfVY4qEsf4A8F6Bru5l+b/GBLsNWCcwZiYHph+
 Dbsa9CXKlN1jQwhe67MA252WId0W7TqOPepmJ+EVxQyaURVV/mC47v+za56p/w4E8JVC
 87eyLI9ICUIfZX+noq394fm9wzUFuOaDtYoDrAvqofPlXjDofFz5QEHCCF1kl+6cQ/sl
 eR1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=hiFp+uoptqOZ2rqi90LxI+MqGbDbXrg3yHQVzKDmQQ4=;
 b=Ev34UcNVZS/GBXzPIOgZvwuHl4sKps4qRpF5/9QnObaDgdvNy70072J1nEB6n9uBZj
 HBIDIPcU7qMnPRpcon4k0pjswC935Xjem1+MfTyxNSd9xdoqt1himBmGR0KDqHxY3kE8
 +R7KIjngMZF5HdqUpAWc8D7jYUNu39h6wrzKpm3lZylXXi+yF5kIwmq6PKhr4tDlPj2x
 +EPqkeiguCAeZ/2H5giN3RqDPINC++RbMNnrpHH036JDtpuWT0NZoJdilWPAWThloBHh
 jLo+pyHlzWtC8NZD9LJJWNm1Rdf1p4R8Z4Q+wxoBGrjtKG9sGohGultvTuXIibBxXRNS
 +Yhg==
X-Gm-Message-State: AOAM532BB0cJXfWrMLRKDHE0g0pw5bZEIgMkFBhKXHTz/vNZeRwG+5bg
 84uUUlBltrsv6sOKI4WBiWdAPihOE09EPnrrUqBeeg==
X-Google-Smtp-Source: ABdhPJzw0PE1cr6miTcf36AU/8/D6CtmczIAUZsitjQKI4FCtj13PFtWbSnnwhEssKH9DHeczUteecQfDP7L+Nwm+WqoHA==
X-Received: by 2002:a5b:2c7:: with SMTP id h7mr46550583ybp.162.1593032294101; 
 Wed, 24 Jun 2020 13:58:14 -0700 (PDT)
Date: Wed, 24 Jun 2020 13:55:42 -0700
In-Reply-To: <20200624205550.215599-1-brendanhiggins@google.com>
Message-Id: <20200624205550.215599-4-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20200624205550.215599-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
Subject: [PATCH v4 03/11] arch: microblaze: add linker section for KUnit test
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

Add a linker section to microblaze where KUnit can put references to its
test suites. This patch is an early step in transitioning to dispatching
all KUnit tests from a centralized executor rather than having each as
its own separate late_initcall.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
---
 arch/microblaze/kernel/vmlinux.lds.S | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/microblaze/kernel/vmlinux.lds.S b/arch/microblaze/kernel/vmlinux.lds.S
index df07b3d06cd6b..4fc32f8979a60 100644
--- a/arch/microblaze/kernel/vmlinux.lds.S
+++ b/arch/microblaze/kernel/vmlinux.lds.S
@@ -128,6 +128,10 @@ SECTIONS {
 
 	__init_end = .;
 
+	.kunit_test_suites : {
+		KUNIT_TEST_SUITES
+	}
+
 	.bss ALIGN (PAGE_SIZE) : AT(ADDR(.bss) - LOAD_OFFSET) {
 		/* page aligned when MMU used */
 		__bss_start = . ;
-- 
2.27.0.212.ge8ba1cc988-goog

