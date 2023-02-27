Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFDE6A48FD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Feb 2023 18:59:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PQStC0yLKz3cFd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 04:58:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=rSn/HhKu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3yor8ywykde89b8v4sx55x2v.t532z4be66t-uvc2z9a9.5g2rs9.58x@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=rSn/HhKu;
	dkim-atps=neutral
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PQSPX5FBLz3cMt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 04:37:36 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-536b7eb9117so153602277b3.14
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Feb 2023 09:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7ZDLcNGctmKqQEDQSm/x/HJRE1p1urqN7vMq9ze3IhQ=;
        b=rSn/HhKulcAt/dXRGMHQok87P5M5E270I0oCS3gZJEWkLWidOpnej1dxaWrgMzWbdZ
         hRegAssYtkAXj68NCwN4NlvBTUXN9bj0pr+BM9FESPqsUtzNJdLfxpMOuaf3C4zcz8AG
         QQ9sSRnDU7Hb4QEga3Ttu8/AwCSxDxNjWb2i9IxegWBslOk4oTQU94dc0rtucLzduQ3Q
         4ozKaX/E5D/Dfa902LgPaXoXtxfZ+pNftUMyHyvMV2xCazmDlSOzCrSiriiDBvuGe/Gm
         12h/Fv6wWsZva2wBOKCzc+/nhceTE6OG2eBLFHaxFB9ziU5glhrshChbsmrwR3lUlmIy
         6zUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7ZDLcNGctmKqQEDQSm/x/HJRE1p1urqN7vMq9ze3IhQ=;
        b=mQ5bMUCmbITGCgX/Us4+EzG9cz8kI6tT08o2AgGAqo+T58V71RZrdqWwXvj1lD/iRC
         zcDgpNBUbg8tULw2EilXYiDX/IjFxLDPlnJ9uYRrjGFznjp2/l635nWt8DHkTcxfL24y
         HPpg4tX2F0IkQxYIRZjPPIAhOeMlPlcS2LRLNjKFXMUJMGoWYEYy/pIdKWeFrKU34zr8
         2eeXUpKGQX+7yywWbEcW4fmFvth/attUUgjgJmipzNPSm8wO97UuIGuQh+OW9UnTMLoB
         Jn+jncKweaiXkR8m64NOtNMUaWvxtKioeRaZfArYlSyYvsIUZXaf47LiiqWeRA7owB7D
         RMjw==
X-Gm-Message-State: AO0yUKV5QJm7mCeQPX1vBS8qSKWH4gdtVz0WogVfXTxbXU09TTLiPs16
	7+QGrqOJersdbO+4EHzRDKsmPgTFLZw=
X-Google-Smtp-Source: AK7set8grN4JIndM+ly9gt1j/cdj3SHv32UwM9Nv4EN/4JzKqYBKorAEBnSg1fP76/edXWaaLOwjV1mMS3c=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:e1f6:21d1:eead:3897])
 (user=surenb job=sendgmr) by 2002:a5b:406:0:b0:904:2aa2:c26c with SMTP id
 m6-20020a5b0406000000b009042aa2c26cmr9545732ybp.5.1677519456128; Mon, 27 Feb
 2023 09:37:36 -0800 (PST)
Date: Mon, 27 Feb 2023 09:36:24 -0800
In-Reply-To: <20230227173632.3292573-1-surenb@google.com>
Mime-Version: 1.0
References: <20230227173632.3292573-1-surenb@google.com>
X-Mailer: git-send-email 2.39.2.722.g9855ee24e9-goog
Message-ID: <20230227173632.3292573-26-surenb@google.com>
Subject: [PATCH v4 25/33] mm: add FAULT_FLAG_VMA_LOCK flag
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, chriscli@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, Laurent Dufour <laurent.dufour@fr.ibm.com>, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, michalechner92@googlemail.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, Suren Baghdasaryan <surenb@google.com>, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstr
 eet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, tatashin@google.com, mgorman@techsingularity.net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add a new flag to distinguish page faults handled under protection of
per-vma lock.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Reviewed-by: Laurent Dufour <laurent.dufour@fr.ibm.com>
---
 include/linux/mm.h       | 3 ++-
 include/linux/mm_types.h | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 46d2db743b1a..d07ac923333f 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -478,7 +478,8 @@ static inline bool fault_flag_allow_retry_first(enum fault_flag flags)
 	{ FAULT_FLAG_USER,		"USER" }, \
 	{ FAULT_FLAG_REMOTE,		"REMOTE" }, \
 	{ FAULT_FLAG_INSTRUCTION,	"INSTRUCTION" }, \
-	{ FAULT_FLAG_INTERRUPTIBLE,	"INTERRUPTIBLE" }
+	{ FAULT_FLAG_INTERRUPTIBLE,	"INTERRUPTIBLE" }, \
+	{ FAULT_FLAG_VMA_LOCK,		"VMA_LOCK" }
 
 /*
  * vm_fault is filled by the pagefault handler and passed to the vma's
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 45a219d33c6b..6768533a6b7c 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -1097,6 +1097,7 @@ enum fault_flag {
 	FAULT_FLAG_INTERRUPTIBLE =	1 << 9,
 	FAULT_FLAG_UNSHARE =		1 << 10,
 	FAULT_FLAG_ORIG_PTE_VALID =	1 << 11,
+	FAULT_FLAG_VMA_LOCK =		1 << 12,
 };
 
 typedef unsigned int __bitwise zap_flags_t;
-- 
2.39.2.722.g9855ee24e9-goog

