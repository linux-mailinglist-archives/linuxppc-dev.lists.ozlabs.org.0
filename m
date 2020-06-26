Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1136720BB7D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 23:26:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49tqgc6690zDr49
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jun 2020 07:26:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--brendanhiggins.bounces.google.com
 (client-ip=2607:f8b0:4864:20::54a; helo=mail-pg1-x54a.google.com;
 envelope-from=3gmt2xg4kalkaqdmczmghffhmrfnnfkd.bnl@flex--brendanhiggins.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=ZVmC9pMZ; dkim-atps=neutral
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com
 [IPv6:2607:f8b0:4864:20::54a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49tqK02YzLzDr1V
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jun 2020 07:09:49 +1000 (AEST)
Received: by mail-pg1-x54a.google.com with SMTP id j9so3936688pgm.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jun 2020 14:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=/YfJhHqk1scz1aBXF0mupkQea8lbBQgP2jeC+IACUDE=;
 b=ZVmC9pMZrVunA2Fe2R9SmfDjSh6jHe61Xaa87YaHusNTBjJf/LeLbaReVAu2j9TGqG
 DxFNyk3GpI7sLmWMCSdQD7bvz9rONUgJGdF7uQgwV9+yZ/fSaQQKgZ4gmTg7ATax4Vk1
 oV5uEEY5wckV5kA6VI1hcndIeFh/iBm6by2153y7uZEUrlPNuhJOGVBqtgu612iYSDS5
 kqjVhZYud4bB1XAnEHsKMzN8i0QHS6lt4v2+aUunA9LQhB4hkvgOKdZy4uYW9e9c4Pee
 JZVonLmRJ7SKlMenwZofGiFcAJe3AeZZuDV2tMMxx47AoxweQmK1o1oVFzbg31I8w3zR
 nK+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=/YfJhHqk1scz1aBXF0mupkQea8lbBQgP2jeC+IACUDE=;
 b=OloDdoZOI38ecQennvAbJvh5pQPx47bPHTCoZlY+aZdm016DmgrRkxQt4iwQO1KOzg
 P4w8B2l7rVMOM2r+bGnHiDWWO8o49UbKG+ckfUCFEVkZXHRcPAKIt9KrK8oER3SiCNfn
 b/B6vVVcYWljiI/ysKf78FGcJ085++PCa9vRX+nn4zi1fdjnT2+kxgHF5Jv0rA0IW9qx
 KfzsUyrWc/rnAD9fuSuP7j++xcZEWmx5r3Cz02Dh9LDJ9vsMcFyISw+iS3I79SB/piQ5
 4+JIqIBMyJRyCf7DENeAHOKdUwnugwZhw42Tg7MFF/5SyUDChtnu1Xdn7UkJkVAnJO1G
 DThg==
X-Gm-Message-State: AOAM533VbNmcmNtojIWhUG1D3sF3GVwFn+bDYAD6YR0bp/A8UmHPLThJ
 s7KCfqVQzxBuJ80LWk+xoQyANIuZOSvH6xZn2yxbHw==
X-Google-Smtp-Source: ABdhPJyHSEr0Zmc7EVSRsW7eDiy4Wfh57qQNf0udG5ob/OtFkSC+pCfiBpVQAOifQwHuQ/h0kM0ynYxDTAXmSlHhH6715Q==
X-Received: by 2002:a65:6707:: with SMTP id u7mr567899pgf.233.1593205786593;
 Fri, 26 Jun 2020 14:09:46 -0700 (PDT)
Date: Fri, 26 Jun 2020 14:09:17 -0700
In-Reply-To: <20200626210917.358969-1-brendanhiggins@google.com>
Message-Id: <20200626210917.358969-13-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20200626210917.358969-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
Subject: [PATCH v5 12/12] Documentation: kunit: add a brief blurb about
 kunit_test_suite
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

Add a brief blurb saying how and when the kunit_test_suite() macro
works to the usage documentation.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
---
 Documentation/dev-tools/kunit/usage.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/dev-tools/kunit/usage.rst b/Documentation/dev-tools/kunit/usage.rst
index 3c3fe8b5feccf..961d3ea3ca19a 100644
--- a/Documentation/dev-tools/kunit/usage.rst
+++ b/Documentation/dev-tools/kunit/usage.rst
@@ -211,6 +211,11 @@ KUnit test framework.
 .. note::
    A test case will only be run if it is associated with a test suite.
 
+``kunit_test_suite(...)`` is a macro which tells the linker to put the specified
+test suite in a special linker section so that it can be run by KUnit either
+after late_init, or when the test module is loaded (depending on whether the
+test was built in or not).
+
 For more information on these types of things see the :doc:`api/test`.
 
 Isolating Behavior
-- 
2.27.0.212.ge8ba1cc988-goog

