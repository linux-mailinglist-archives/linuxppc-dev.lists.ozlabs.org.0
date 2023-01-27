Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5352E67EEC3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 20:49:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P3Sp10yHLz3fWW
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Jan 2023 06:49:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=m4Wtor8v;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=37sjuywykdlqmolyhvaiiafy.wigfchorjjw-xypfcmnm.itfuvm.ila@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=m4Wtor8v;
	dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P3Scv6WKBz3fJ1
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Jan 2023 06:41:35 +1100 (AEDT)
Received: by mail-yb1-xb4a.google.com with SMTP id i17-20020a25bc11000000b007b59a5b74aaso6308361ybh.7
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 11:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pFZiiTJ1lM5Y9cE9VJMMN6c4zys62lyfuQWFB/SvSfY=;
        b=m4Wtor8vj3J0ycRC6QGu22LySA+n2MGlbf/sH76T8N8Pnp/d8SuPXb/kR+Hyj37+ad
         48NkH1zhtbcV3yGPaiQ5KPXnB06jsyj37BRmFZaU4H+LJ2YSwMP7BoYjL006YrtxIZWR
         VsSyGQhSW7cL19AuEXNwVKmULWycfkr7kU4POPAgtbT6hDzlZniUKpxVu1Hu98jAvRgz
         bcxq0t9OKK2J7/3O0lRl4dNTg073Sp+ojK3rnWcxuyGW0RvPh9anMnsNc+W5/rLzSMsJ
         Ho/St/2m0p0zsIWZF5QsNOVQeuQXkfsBP43+XpjCQzZI9euWanUB/WzPnytDjlkSAgXd
         IXOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pFZiiTJ1lM5Y9cE9VJMMN6c4zys62lyfuQWFB/SvSfY=;
        b=w43o2allcvupDkOCDHt6qKa31KWM4+ioIjsjMAhFvLTbsApDL6ML3420HOGSJyqIa4
         T7hkglc7zp0hBUbRQPPgURKuMD7B1sk0NJem9B53BdqfXSAdmtkt9J0Lnq6SXqSyW1BV
         pNyU0mYNqNG8sGCLtliavUSy3zurZj/lx2ey56Sf+Pq2RLIq/bBzXZgBuYb6bGamj4k7
         gxdwhtXHwxt6mibs9SyBEzuhMHqGxvEYjJvpk47H3uxnBUJyrS2+nLNawP24JXSdlKnU
         gRW85NP8o0GBoALJXsCp/jAi7HPF9j7Kc0DN5MueKHcxo1JtbqSO0NVCbhCM2/G18oO5
         f0NA==
X-Gm-Message-State: AFqh2koLKNQcAkm1fG+XpmKL0ktSoWSWpK7dkqGXBiXpkxC8TDhZHczY
	GzXR62lrVVYhTAcZgtwEEJKHEhKx8Fk=
X-Google-Smtp-Source: AMrXdXt7ky1YKmCHrEvdSmppryHuxdZmy/ExGSeixqws3R/QJJ6NNyUiC3cubRusLU6Amdx/dq1XzZif1cI=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:4e19:be9:c5d0:8483])
 (user=surenb job=sendgmr) by 2002:a81:1d47:0:b0:3f4:6c62:18d1 with SMTP id
 d68-20020a811d47000000b003f46c6218d1mr3383963ywd.491.1674848493581; Fri, 27
 Jan 2023 11:41:33 -0800 (PST)
Date: Fri, 27 Jan 2023 11:40:45 -0800
In-Reply-To: <20230127194110.533103-1-surenb@google.com>
Mime-Version: 1.0
References: <20230127194110.533103-1-surenb@google.com>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
Message-ID: <20230127194110.533103-9-surenb@google.com>
Subject: [PATCH v2 08/33] mm: introduce CONFIG_PER_VMA_LOCK
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, tatashin@google.com, mgorman@techsingularity.net, rp
 pt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This configuration variable will be used to build the support for VMA
locking during page fault handling.

This is enabled on supported architectures with SMP and MMU set.

The architecture support is needed since the page fault handler is called
from the architecture's page faulting code which needs modifications to
handle faults under VMA lock.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 mm/Kconfig | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/mm/Kconfig b/mm/Kconfig
index ca98b2072df5..2e4a7e61768a 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1211,6 +1211,18 @@ config LRU_GEN_STATS
 	  This option has a per-memcg and per-node memory overhead.
 # }
 
+config ARCH_SUPPORTS_PER_VMA_LOCK
+       def_bool n
+
+config PER_VMA_LOCK
+	def_bool y
+	depends on ARCH_SUPPORTS_PER_VMA_LOCK && MMU && SMP
+	help
+	  Allow per-vma locking during page fault handling.
+
+	  This feature allows locking each virtual memory area separately when
+	  handling page faults instead of taking mmap_lock.
+
 source "mm/damon/Kconfig"
 
 endmenu
-- 
2.39.1

