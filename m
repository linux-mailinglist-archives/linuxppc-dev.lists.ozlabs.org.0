Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DEA20BBAC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 23:36:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49tqvZ1qSszDqnx
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jun 2020 07:36:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--brendanhiggins.bounces.google.com
 (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com;
 envelope-from=3dmt2xg4kak0oeraqnauvttvaftbbtyr.pbz@flex--brendanhiggins.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=ZTCAFApe; dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49tqTS4tjMzDqKD
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jun 2020 07:17:16 +1000 (AEST)
Received: by mail-yb1-xb49.google.com with SMTP id c17so11121452ybf.7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jun 2020 14:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=Nq9F0z4123tt4UqM776+npgcQr2vACSfzkMX0VOkyz8=;
 b=ZTCAFApecEGx44TdgImNQ12qAsrhIjFlqnA7X8OIrt50WQJMdqROa5BvnuDYaE3Lok
 k0Yftw/cS9ECxUbfwTAX99Lpd9yz7y6jnHtBB0aDOCqWldoDru/97LnHSGKESDDgKxlk
 9xdLNvFvVxCLM1TZWYvCMNyDrmmPXKtFf4vogUSxmfH675+a1vyIMc1FOubVKERDE7qT
 9kdv/gVdn6BKAnCWx2ayZphzK6Ug5Ymkk1L+8/qvIJjqaoLD5p3qcuo0W8wff6J2k6XD
 T0qgDLjqpzi8pMoH30nARMyW0khccHFiU17SgAB+7PpX1UNDWCXFmmJy2a9NaPgHv9Wv
 1cDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=Nq9F0z4123tt4UqM776+npgcQr2vACSfzkMX0VOkyz8=;
 b=b2wvty6OWh5HYJpA+L0j463n73aa8aRGvp0isqdETHfjkHn2XaPBykRSiECiOWucmo
 5VLrqNIK7OpXJIk23BwMHo09Gh+UGGxqzRs3l8PaiJnJZ+urVXtH4sRVJi6m0H5/poYt
 JSQM0tOcQWZUdv/zUXXZ/79LCaomsBTV+aAu+iX1iwaERlnelCYjPGlMmFh8yqqM/cdl
 2FoWUsNy55ozEvJ+A2g56zTPaNuH3Gx91glNaHKP6q8n3luG6fKn57wcnKOMNR+hN2qJ
 kEsXbl/6PEHDhl/GmvC42O6dZ2d2+QgazeOCBzI5SdIpgp3iAm7C/0hSkqOojqgWuuLx
 e2BA==
X-Gm-Message-State: AOAM533KyHpdtXbwf7c51/AC2jF+RkOKR5CP8SZDPGeE5i/ttK9GAnrd
 5cuZ0wQBjONhJXiEtM1d+NF5rvpz6xYaTmCsPERO0Q==
X-Google-Smtp-Source: ABdhPJyKnnV47wg6p1lAvgLAC5x+iqxuxiQuXvbI9BMlMWyGeJgFmODnuKaIGhblbFF3wtpirvJDFFjiadtzPLSBo+FHIA==
X-Received: by 2002:a25:dfd6:: with SMTP id w205mr7760830ybg.216.1593205774990; 
 Fri, 26 Jun 2020 14:09:34 -0700 (PDT)
Date: Fri, 26 Jun 2020 14:09:11 -0700
In-Reply-To: <20200626210917.358969-1-brendanhiggins@google.com>
Message-Id: <20200626210917.358969-7-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20200626210917.358969-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
Subject: [PATCH v5 06/12] arch: xtensa: add linker section for KUnit test
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

Add a linker section to xtensa where KUnit can put references to its
test suites. This patch is an early step in transitioning to dispatching
all KUnit tests from a centralized executor rather than having each as
its own separate late_initcall.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
---
 arch/xtensa/kernel/vmlinux.lds.S | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/xtensa/kernel/vmlinux.lds.S b/arch/xtensa/kernel/vmlinux.lds.S
index d23a6e38f0625..9aec4ef67d0b0 100644
--- a/arch/xtensa/kernel/vmlinux.lds.S
+++ b/arch/xtensa/kernel/vmlinux.lds.S
@@ -216,6 +216,10 @@ SECTIONS
     INIT_RAM_FS
   }
 
+  .kunit_test_suites : {
+  	KUNIT_TEST_SUITES
+  }
+
   PERCPU_SECTION(XCHAL_ICACHE_LINESIZE)
 
   /* We need this dummy segment here */
-- 
2.27.0.212.ge8ba1cc988-goog

