Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 608EB6A4872
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Feb 2023 18:45:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PQSZf208kz3fZk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 04:45:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=jatZw+va;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3our8ywykdckxzwjsglttlqj.htrqnszcuuh-ijaqnxyx.teqfgx.twl@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=jatZw+va;
	dkim-atps=neutral
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PQSNq0WFCz3cGm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 04:36:59 +1100 (AEDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-536cad819c7so153252097b3.6
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Feb 2023 09:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ycuncMhySgAqKB0JKjWQ87T3vvxMS9R2K+oLMhIEJ8Y=;
        b=jatZw+vavHEldR/zWx4fIqW8wAPU7kuskm2fNsdTmUbEoYYRUK1QgmfSQwty0F7vyh
         In/5k0Ybu4OL/7+U8XoT4kd5dwj6nkMsSYSfl49SjuU4fWHkZmC7EvE/NA5jUKV5mijt
         tEPaHMFzYqt7Ecgvi/GqjzXDl7rzKrsdjxUTz3IPQXQFpGFBi+tum9hpbaiwuAQcs7YP
         AcTg6xqgjkoCojGsNiAv0DLTEBbzq13kS5i64Oy3wTmze25CUcKHKdl0RIiSjO/ZdJhS
         rd+Ro59v2yktpIygy3VtQ7oiDpWrjQ+HLII3XoEVuOsktTglELO3PMbQ5C9t6zyu7z8h
         3t1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ycuncMhySgAqKB0JKjWQ87T3vvxMS9R2K+oLMhIEJ8Y=;
        b=CbqlwlYvrhXv8xlkzw3FsJvL55bSYbVdfmbYj+aNFhVKSEWQi4FMjyOtTQwVhJKvRf
         o/W6GmBWcrTJ+5/5ufQpkvZKYxoTl2I3sYUNWEwKZ8P/O5/B7FLsavgNx4ZZTTd2Zn2N
         RaPxO6cojWg73lJWQn/dU0L6UipZL+uCuHA0RTb93rPdxU60S+OhsfQ1OgBfg9yro+r3
         rtuCOSr+bFio3zD41W0s2LhUiK3q77bbNSQXm8HL85Lxid0e9yhmH3O1ayv64P13WYg3
         +/fVmk4zP6X3i+HQgCSUMqPZJvKHTAXMUiVQswukasMhofOAOgIw4Hn23BCAXIiJOlaJ
         z9RA==
X-Gm-Message-State: AO0yUKUaHZ+QqyIMhUVqPejl4v5oKnWyqCT/Yjf8fHaEHvsSfHVWq475
	be7Jw3tPU7FVbkEgtQzxYAen/mlWrGQ=
X-Google-Smtp-Source: AK7set+sQnwo5grHRclokRwp0C+SftMLAAuN7gXfh+MOPKXwAKaiWwA4Ongifn/fr7bxEOF3Yk7Tuxt7Hwo=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:e1f6:21d1:eead:3897])
 (user=surenb job=sendgmr) by 2002:a81:af1f:0:b0:52f:1c40:b1f9 with SMTP id
 n31-20020a81af1f000000b0052f1c40b1f9mr10776885ywh.7.1677519418452; Mon, 27
 Feb 2023 09:36:58 -0800 (PST)
Date: Mon, 27 Feb 2023 09:36:08 -0800
In-Reply-To: <20230227173632.3292573-1-surenb@google.com>
Mime-Version: 1.0
References: <20230227173632.3292573-1-surenb@google.com>
X-Mailer: git-send-email 2.39.2.722.g9855ee24e9-goog
Message-ID: <20230227173632.3292573-10-surenb@google.com>
Subject: [PATCH v4 09/33] mm: introduce CONFIG_PER_VMA_LOCK
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, chriscli@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, michalechner92@googlemail.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, Suren Baghdasaryan <surenb@google.com>, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org,
  hannes@cmpxchg.org, tatashin@google.com, mgorman@techsingularity.net, rppt@kernel.org
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
2.39.2.722.g9855ee24e9-goog

