Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 911FA2A1CB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 May 2019 01:51:40 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 459jnj57PVzDqWK
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 May 2019 09:51:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=joelfernandes.org
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=joel@joelfernandes.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=joelfernandes.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=joelfernandes.org header.i=@joelfernandes.org
 header.b="FtBgIcfy"; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 459jln1MLwzDqMG
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 May 2019 09:49:56 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id z3so1232728pgp.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 May 2019 16:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JWprfXxnZYwrSMlSa8B0jYY+Kk48KO4t7l+blfnMKTI=;
 b=FtBgIcfyzP/9kJsM+zqDbKcy6VZwEKAANCQ1/eZQrD6rviA4awDDcac9F6JHAeC8Ww
 /QISOXT5+haCwcCXiDtBTzmrbvUPQt/eQFfssAfxoublccYDf4cZJhSHGojIabZd0IPc
 VxKmmE96CtJBAuxlrRyraOLObouJSFe2WI5dc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JWprfXxnZYwrSMlSa8B0jYY+Kk48KO4t7l+blfnMKTI=;
 b=IDE8Q2p7BCj/kcvoIu7+8gsSipzZz25VIXVGGhagSWvx+GYp9UnXvIf5OR+55igECJ
 XOqfew4iBgajeXu4xpU4V0QhxCzjWUnt1Lgg55yFpmHSEncS6WDr46g5mdY8kzb+yQ2v
 zJent2Ftrdk/FezbIcgEZIL9tba68ZYyh4lYWRHiQ9HgSDo51Z8aY/Xfo+NZnXQVyP7+
 GTE1bYcVbRyUNsWxJjRBtmG8HhEJxqPaQnDWpCpD/4h41EPTm1BVonxcFVfQ96S2Zux0
 xZ/FR0jlzwBFOWR4wnBMUy4mlMQl25o1iC5I0kHY7Lkp6ZGpt0vdodcS7mElpgwQCfAw
 fe/g==
X-Gm-Message-State: APjAAAUlyGyAaFWamGZlhoA2P0alvheVCQ/SewqZHgn12jDfmeBhgrVD
 RIIlTkqNxuNkjt73dCLMUJcpqw==
X-Google-Smtp-Source: APXvYqz7Pfyyr4nOlV734fVH1bvjX4jHzTMPj1aZT0g/Pt0V2GglxzMFOH0INg1fPuB6UlDmRBFhmw==
X-Received: by 2002:a63:495e:: with SMTP id y30mr65431636pgk.185.1558741794604; 
 Fri, 24 May 2019 16:49:54 -0700 (PDT)
Received: from joelaf.cam.corp.google.com ([2620:15c:6:12:9c46:e0da:efbf:69cc])
 by smtp.gmail.com with ESMTPSA id q4sm3297595pgb.39.2019.05.24.16.49.52
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 24 May 2019 16:49:53 -0700 (PDT)
From: "Joel Fernandes (Google)" <joel@joelfernandes.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC 1/5] powerpc: Use regular rcu_dereference_raw API
Date: Fri, 24 May 2019 19:49:29 -0400
Message-Id: <20190524234933.5133-2-joel@joelfernandes.org>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
In-Reply-To: <20190524234933.5133-1-joel@joelfernandes.org>
References: <20190524234933.5133-1-joel@joelfernandes.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: rcu@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>,
 Josh Triplett <josh@joshtriplett.org>, kvm-ppc@vger.kernel.org,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Ingo Molnar <mingo@redhat.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 "Joel Fernandes \(Google\)" <joel@joelfernandes.org>,
 "Paul E. McKenney" <paulmck@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

rcu_dereference_raw already does not do any tracing. There is no need to
use the _notrace variant of it and this series removes that API, so let us
use the regular variant here.

Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
---
 arch/powerpc/include/asm/kvm_book3s_64.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/kvm_book3s_64.h b/arch/powerpc/include/asm/kvm_book3s_64.h
index 21b1ed5df888..c15c9bbf0206 100644
--- a/arch/powerpc/include/asm/kvm_book3s_64.h
+++ b/arch/powerpc/include/asm/kvm_book3s_64.h
@@ -546,7 +546,7 @@ static inline void note_hpte_modification(struct kvm *kvm,
  */
 static inline struct kvm_memslots *kvm_memslots_raw(struct kvm *kvm)
 {
-	return rcu_dereference_raw_notrace(kvm->memslots[0]);
+	return rcu_dereference_raw(kvm->memslots[0]);
 }
 
 extern void kvmppc_mmu_debugfs_init(struct kvm *kvm);
-- 
2.22.0.rc1.257.g3120a18244-goog

