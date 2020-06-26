Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FCE20BB58
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 23:22:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49tqbB5slMzDqHP
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jun 2020 07:22:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--brendanhiggins.bounces.google.com
 (client-ip=2607:f8b0:4864:20::f4a; helo=mail-qv1-xf4a.google.com;
 envelope-from=3dwt2xg4kakwndqzpmztussuzesaasxq.oay@flex--brendanhiggins.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=QoyX5QkL; dkim-atps=neutral
Received: from mail-qv1-xf4a.google.com (mail-qv1-xf4a.google.com
 [IPv6:2607:f8b0:4864:20::f4a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49tqJk5pdYzDr1P
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jun 2020 07:09:36 +1000 (AEST)
Received: by mail-qv1-xf4a.google.com with SMTP id w18so7210775qvd.16
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jun 2020 14:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=hVa5/5YjHA4HA55L6gqApWSV/fHdhhYIjiCaFnqYV3g=;
 b=QoyX5QkLkeZufbY3DPWqVcx8p1G2Pf6aerfPyt2zQE/ujAwEYOP4MavORdpoC0kiKu
 EBTjnDggRXo0KQe45lMKlqgesoVoq2M/WZaVEKYilzw17KOXTZudXtu6crQek7qlLud6
 wgqfeApVUIS2o9DKhJa1hfmORSYPYOqHxCziPwrSa4G+57ASkLll7CukI9nktN3Owv9v
 NukYDAxu7zl52PVDoi+7jdhfKkThnizMJ68rg/tVzgIVSHiP3aAKWELQxmH03U/bRKpt
 6Wgu+YeU85Wm8LsbzjbD34Ud+5/9JGpyI65sawIxfi18MEFZnvGjX41U/bIx6IVwD7H1
 RvYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=hVa5/5YjHA4HA55L6gqApWSV/fHdhhYIjiCaFnqYV3g=;
 b=nvwWbyf048Q1UMVwQiMeSWu6KMjwcBmOyHEX/qD6ou9O2TeNFB3G7xogOPMgdu/jRR
 EZzYySsPu9F+qssL1euhS84somHUzAH0rnYdcvOB3cgSqXD/98/bQO67qL9K3vawXqNy
 baOASl1m7W6q51uFwX/vbxO2bgqjbokA3wocYr2IU9htGS2MMmoxdOwcU0eC3k19LdSo
 avi3adLKI8ltisblJ6NPgyEF6R5JcaSZ4byew42W0wPaow1z0NevqepBEo07VUUI9PDl
 u9LcW3n2dvxYJn624LrPWgVH21g6FxlwAmQchl7ySK3z3ysckjg1/hYNihVWqaqjZTBY
 qW5Q==
X-Gm-Message-State: AOAM532UnVOS2ViUviMkZ/iChzksCo5KHPYgfZypU8+Mu71lp0tKR7vU
 HzQT/D0e7Twy5NevqLT9hpf5qkDKNXVonVMCWRbAsg==
X-Google-Smtp-Source: ABdhPJypYrK6iZse6cCSs4YnSv2AzXM6d8Vad2NCnBdBrfM4NUTiqCIXIvHzUdHQAv3Yb81UEf64dXgB2cs8yGqX9AXtcw==
X-Received: by 2002:a0c:8e8c:: with SMTP id x12mr5032791qvb.55.1593205773222; 
 Fri, 26 Jun 2020 14:09:33 -0700 (PDT)
Date: Fri, 26 Jun 2020 14:09:10 -0700
In-Reply-To: <20200626210917.358969-1-brendanhiggins@google.com>
Message-Id: <20200626210917.358969-6-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20200626210917.358969-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
Subject: [PATCH v5 05/12] arch: um: add linker section for KUnit test suites
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

Add a linker section to UML where KUnit can put references to its test
suites. This patch is an early step in transitioning to dispatching all
KUnit tests from a centralized executor rather than having each as its
own separate late_initcall.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
---
 arch/um/include/asm/common.lds.S | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/um/include/asm/common.lds.S b/arch/um/include/asm/common.lds.S
index eca6c452a41bd..9a9c97f45694c 100644
--- a/arch/um/include/asm/common.lds.S
+++ b/arch/um/include/asm/common.lds.S
@@ -52,6 +52,10 @@
 	CON_INITCALL
   }
 
+  .kunit_test_suites : {
+	KUNIT_TEST_SUITES
+  }
+
   .exitcall : {
 	__exitcall_begin = .;
 	*(.exitcall.exit)
-- 
2.27.0.212.ge8ba1cc988-goog

