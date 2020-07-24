Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F24522C6DC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 15:41:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCr2620X0zDrK2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 23:41:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=myWsbPv3; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCqSN0TDdzDrS9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 23:15:15 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id 1so5076946pfn.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 06:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DHpBnVvFWixE9Yg0d0OK10tzA3221PSUyt4Cx2IH5+E=;
 b=myWsbPv3/UUglRzV+TMSS2ZZiFNk38LMgSBpDNrQsTIDc5WH7gUklbGO1enhGGySAz
 E7YzZBxilSJCpvzkCjCU/0CNuVBNZLByMjo8KxMsr1RuI7lIPVyR0vvJxZNF+vEP0Mzk
 Sn2h0sLrOt+aOi0ATgnWf89dVNz1bvDrQqo3cj6OoyWX8xCVLnNfJaAqKtDhCjUwNgA0
 5Y/+beDc9ULzpOBEBVXgkQuIV6fUalwLPPpQY5i02r9TLUCpOAqwCxnak+DcBatC0Jyv
 PKBIC5be55ZRIMw4PLKztz9Klrbzm6QA2rbct7J2sE+V6G3FLRbUvMgFLeL3276GLo0m
 WAuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DHpBnVvFWixE9Yg0d0OK10tzA3221PSUyt4Cx2IH5+E=;
 b=SivLxfYcYEPtA07ldAYBKuMUFZ3jwzdM036YQiAX6fYRP1FCb5hGo7iPrm83IQ8dtD
 /yV6pSl8LjhvqqpDL89o8kanPzVkY5RWuPiUKYn5T+qcarv8DSlAjWsjJWKS3ohNHsah
 4FpztZp2UVX7yC9L2Dw3iky5R1NR7um2jUzQNxHSIVngjNe9LjDQK8QskIbc3lr4SkQb
 RHhYIBp/TbaujEEj8hd6XkVtf6MwOZjzMqy4/3avm6+2wyZs8LD+jTaLNyDGdwv7WPcx
 N40DLMEN6FpazIugrslGs3mlYZGsEcURhwFEib30ixEHummLMb9s03HHKDZyFLvk+FMT
 SSbg==
X-Gm-Message-State: AOAM5317X2LQy6V3vvNKAA6AXTe4U9iH5L6FLZ8JHmZMq8voZdTQjocz
 kzG/F8G8Ml2xsoaxWq6YuAZAh9+f
X-Google-Smtp-Source: ABdhPJyisx6hCRDrbmPNpGytS1qqjnTFZwITCd6wO1vkmRzyL31lFJNP7UVIeTdb2pnJAPV4vPWvTg==
X-Received: by 2002:aa7:942e:: with SMTP id y14mr8909386pfo.58.1595596512969; 
 Fri, 24 Jul 2020 06:15:12 -0700 (PDT)
Received: from bobo.ibm.com (110-174-173-27.tpgi.com.au. [110.174.173.27])
 by smtp.gmail.com with ESMTPSA id az16sm5871998pjb.7.2020.07.24.06.15.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jul 2020 06:15:12 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 6/6] powerpc: implement smp_cond_load_relaxed
Date: Fri, 24 Jul 2020 23:14:23 +1000
Message-Id: <20200724131423.1362108-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200724131423.1362108-1-npiggin@gmail.com>
References: <20200724131423.1362108-1-npiggin@gmail.com>
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
Cc: linux-arch@vger.kernel.org,
 =?UTF-8?q?Michal=20Such=C3=A1nek?= <msuchanek@suse.de>,
 Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 virtualization@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>,
 kvm-ppc@vger.kernel.org, Waiman Long <longman@redhat.com>,
 Will Deacon <will@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This implements smp_cond_load_relaed with the slowpath busy loop using the
preferred SMT priority pattern.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/barrier.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/powerpc/include/asm/barrier.h b/arch/powerpc/include/asm/barrier.h
index 123adcefd40f..9b4671d38674 100644
--- a/arch/powerpc/include/asm/barrier.h
+++ b/arch/powerpc/include/asm/barrier.h
@@ -76,6 +76,20 @@ do {									\
 	___p1;								\
 })
 
+#define smp_cond_load_relaxed(ptr, cond_expr) ({		\
+	typeof(ptr) __PTR = (ptr);				\
+	__unqual_scalar_typeof(*ptr) VAL;			\
+	VAL = READ_ONCE(*__PTR);				\
+	if (unlikely(!(cond_expr))) {				\
+		spin_begin();					\
+		do {						\
+			VAL = READ_ONCE(*__PTR);		\
+		} while (!(cond_expr));				\
+		spin_end();					\
+	}							\
+	(typeof(*ptr))VAL;					\
+})
+
 #ifdef CONFIG_PPC_BOOK3S_64
 #define NOSPEC_BARRIER_SLOT   nop
 #elif defined(CONFIG_PPC_FSL_BOOK3E)
-- 
2.23.0

