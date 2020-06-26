Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B5620BB3E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 23:18:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49tqVX4DSLzDql2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jun 2020 07:18:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--brendanhiggins.bounces.google.com
 (client-ip=2607:f8b0:4864:20::54a; helo=mail-pg1-x54a.google.com;
 envelope-from=3cwt2xg4kakgjzmvlivpqooqvaowwotm.kwu@flex--brendanhiggins.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=jebeIARZ; dkim-atps=neutral
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com
 [IPv6:2607:f8b0:4864:20::54a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49tqJd4dr0zDr1S
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jun 2020 07:09:31 +1000 (AEST)
Received: by mail-pg1-x54a.google.com with SMTP id x184so7448568pgb.7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jun 2020 14:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=hiFp+uoptqOZ2rqi90LxI+MqGbDbXrg3yHQVzKDmQQ4=;
 b=jebeIARZ4MbpC/qohszlae0SxIiUjfS+aHdsgRsyl+nDoZ13dCApmFMyUJeVDOsHAY
 KIcGcHJ+1BS4bpjJljRbXhZa/cLiJQCxIz3INsZbN4Us+V8lP8TK5psKf814t/EGk6wE
 pXdYgr4IlD1bc5vMRTxWpR8bW/X9rqzObf6oG1rnxRKPcgwcVlXdkP64PXWb7NSXT5a6
 NEtpZlVx+hSr8lknL1TKy8c7BgSEPoFVGkkI3sTvx7LhXrKgu9GToCMGaLH+nZo8xo8H
 YHmDwLXC56KXjbSBDnypaQ9i4502TKmtFeLoqT6X6hTKa14dhV4gfc4ThT1/79Jdq8SS
 8zLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=hiFp+uoptqOZ2rqi90LxI+MqGbDbXrg3yHQVzKDmQQ4=;
 b=LcypTj6nLdLMAmgSTY7whaO9EL4KYa8nn7es0SVQgP1wp1RM9X03Mn7fkoCJ+VKPXI
 1bifFU54dVfTaGN1SNOXx1kLXp0h7tpJM/vfiJ52302KD03KfMVofz68xdRc1tmBtqq9
 SbCNxTNC31s1rsKvAuzKGgJZRvLFLX5H1xI2ZPPTSUnxYNVywesOKlLAjqFaiGsoxiQ6
 pTpMXPWyePjR3d+zC1xVTP1n9crNX1o2mhpbteF4e39Q5X0KVDeWeLikTBCuglxWHxaH
 P/iuxmpiQ2F54TMGurRv350rECEIdHmPmI/jB7I4Fo/9BXqA/iSVLNSKwdNXhjPye7y2
 kmfw==
X-Gm-Message-State: AOAM533EBMYLrwbd4+AW0FMWOKQ7TQ8h6zQyPqh3D/fbPHBjFt2ouW3D
 wt0c1V5Ox+Yxd8NCI5bW51R2IX5DMM4QxoiPmLE9OA==
X-Google-Smtp-Source: ABdhPJxSwQ68iEnNXkgolra98q2cg2bDfdpdwE62xg8GhSSGsb9iaN0w7iVXuEbw7sVWlA1D/tARVHhauyHs3D3fWH+8JQ==
X-Received: by 2002:a17:90a:f206:: with SMTP id
 bs6mr5554851pjb.48.1593205769580; 
 Fri, 26 Jun 2020 14:09:29 -0700 (PDT)
Date: Fri, 26 Jun 2020 14:09:08 -0700
In-Reply-To: <20200626210917.358969-1-brendanhiggins@google.com>
Message-Id: <20200626210917.358969-4-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20200626210917.358969-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
Subject: [PATCH v5 03/12] arch: microblaze: add linker section for KUnit test
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

