Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF3B207E72
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 23:26:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49sbmk0z9ZzDqlY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jun 2020 07:26:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--brendanhiggins.bounces.google.com
 (client-ip=2607:f8b0:4864:20::84a; helo=mail-qt1-x84a.google.com;
 envelope-from=3a77zxg4kalqvlyhxuhbcaachmaiiafy.wig@flex--brendanhiggins.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=BxVsCiRl; dkim-atps=neutral
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com
 [IPv6:2607:f8b0:4864:20::84a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49sb8j0xj5zDqPj
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jun 2020 06:58:22 +1000 (AEST)
Received: by mail-qt1-x84a.google.com with SMTP id r25so2472567qtj.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jun 2020 13:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=Nq9F0z4123tt4UqM776+npgcQr2vACSfzkMX0VOkyz8=;
 b=BxVsCiRl31FUZaXeXGi8TV70WMTRIEfLDWFsMjf9VqWbt1aplCwkMUV6du/2DbXHDA
 nmIqbT++UfoVt2spbm6O4fmSAaacN8xjQv9Vk7mvxhaVZJ9BPTkHJu8aBCdCnIu51P5m
 wZ24eLo2g5qlSjSP/eIlooA1u/pqdwQEihkdjLYouX/8rVxWrLxhZOX/WQfJheEnbE5o
 v0W7rWqeaGSn+q7Ev6eTL12tKFayk99cr69qnKqzeZeUGe9TC4veYRnMtqICU6y6UEt0
 7wl+R6AWP851Ken+D6iQ9SXiZ9pQ1MwxBJLG5X11cZGeJs5LD4j/ew5gVX1NXLQSps+b
 CAMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=Nq9F0z4123tt4UqM776+npgcQr2vACSfzkMX0VOkyz8=;
 b=tX86/1i4g3BCVK0l+wx3hGIGhySotjp1Zfok5ayc7xAxxD9FF7tMtsKfkZYSLm1tma
 hozOMTKPvkHPJs0L3ln2s2vWKEdumiCdW6y6XCEfpzPTPGiEJGqVK8rdRw6vLAIn4tBG
 jeSxAU4xQjmwOnbt68QNuLk0oB/kIaPrmUC1MFuYmkOx3OXOiC8tcs+Pe8JAzGdOzsuH
 bfyvckHw+ws6y+GR0/09mXWRsEAYeRWd52VaMlVrGaPTnEAGGqdTfMwq5aKY3wfW3Q/h
 l2ZXSkkmV1VmOJewcYbrQhJIVEzQZo0LeuuHwfJZK/Mx000YcwoaVFR/si0GumtBKpQL
 7SUw==
X-Gm-Message-State: AOAM532b6Q9z0YUMb5OQmXf7qQXWNiD9UihmkKzquI7E6ZhPkw+q8Asw
 0ila0xDFROtLu6Eu2m/w3ebUFVE6AqML2zEF+US7jQ==
X-Google-Smtp-Source: ABdhPJzQqVhx61203uYXm1i0yxcc0AnVKozIfTJnOAmP5bxUytYJO1bkE34YZASYNKaxdzL6HRViJV73fScMedut3CXRZg==
X-Received: by 2002:a0c:ecc6:: with SMTP id o6mr32877909qvq.243.1593032299582; 
 Wed, 24 Jun 2020 13:58:19 -0700 (PDT)
Date: Wed, 24 Jun 2020 13:55:45 -0700
In-Reply-To: <20200624205550.215599-1-brendanhiggins@google.com>
Message-Id: <20200624205550.215599-7-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20200624205550.215599-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
Subject: [PATCH v4 06/11] arch: xtensa: add linker section for KUnit test
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

