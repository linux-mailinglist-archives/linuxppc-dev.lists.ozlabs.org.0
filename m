Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7F0207EAA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 23:35:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49sbzF4j0TzDqV5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jun 2020 07:35:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--brendanhiggins.bounces.google.com
 (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com;
 envelope-from=3dl7zxg4kal0euhqgdqkljjlqvjrrjoh.frp@flex--brendanhiggins.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=eBb2r/O+; dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49sb8s2k3jzDqPj
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jun 2020 06:58:31 +1000 (AEST)
Received: by mail-yb1-xb49.google.com with SMTP id c3so3551656ybi.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jun 2020 13:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=/YfJhHqk1scz1aBXF0mupkQea8lbBQgP2jeC+IACUDE=;
 b=eBb2r/O+3xD/ft1cWQIYq+lLT5MaZcDKCI7F68NCZy5mtkJDNhWzHGgMGNZjbp5vY2
 NeciIBXPHqDHAr515OD+KEI2SwbSQA3wPry4syrluMYmbIYDoGubxlmgh9jyRlLOoHz5
 p4aoDDsXGCW7wnWAlLUMV8zs3lliqsQjwHQ3f/IRxPoalCwAHzoMzbTu3F1aBupYM8jY
 RJXyTQ3a1l5kZUWbyWsbEikRBkGpV5M+0D3Trh1EaZC6LuABuarRYjnjmK+YSshwXwQu
 +pk7yF5eODqLsJrD/Gc4h/AznuIk8Jq2hwInTWrfIN5TI1VZdP1CxKJc8TVkKATdArhv
 rkVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=/YfJhHqk1scz1aBXF0mupkQea8lbBQgP2jeC+IACUDE=;
 b=pQ3HHnH+xwvlwgvjOadOwa1EVhKuI7v1pd3WxX6OYmhQde/BDDDarRC/1sG0/kxiLg
 17H4lpvFLM4sUt/G1mFGA2KTxDiub5MJd08snZG44LW3lXzjQrhkCpH0GA6jvn8Z+4hm
 HG8+yvQaHKinLXQGpgT9UCP0F4BwFB1bgmS2RDR9oO+QLNRYNm34PEJ/4nW4+OHOq7Od
 2vu3sKNtsGGuiEM5N5n+3rndZLYVEv5MxxLvJFTMWDFA15eR2w6pxsU3ax04lnwBE39i
 T9KdA4cKRRZOoKltXfd9fn5XnbRmgNlraUXHsd5Xvfq2xdE/5HH5ti5Z66NPm3pjTjov
 xMFg==
X-Gm-Message-State: AOAM532DhrHTLDS4ZnYwXJI+J52TFguj4CO02QEcCOIaMLYgWlij6WzS
 r/nwTMA4qNut/br1Tc6RJa0IcydiRye1k1PrHJNhSA==
X-Google-Smtp-Source: ABdhPJyzMN1O9F20c44aUZ3Rj+xXWGPWk9fw0REl0xzDcZiFgklg99lb7/rTyyzMpJHoIh8oBhPbhqyjNv0vmkzqL5BxQQ==
X-Received: by 2002:a25:2d63:: with SMTP id s35mr27292035ybe.367.1593032308955; 
 Wed, 24 Jun 2020 13:58:28 -0700 (PDT)
Date: Wed, 24 Jun 2020 13:55:50 -0700
In-Reply-To: <20200624205550.215599-1-brendanhiggins@google.com>
Message-Id: <20200624205550.215599-12-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20200624205550.215599-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
Subject: [PATCH v4 11/11] Documentation: kunit: add a brief blurb about
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

