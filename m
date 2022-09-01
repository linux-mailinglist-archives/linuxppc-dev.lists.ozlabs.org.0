Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 231335A9E69
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 19:46:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJT4q0L51z3fDQ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 03:46:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=TDQRkBpQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3ie0qywykdmy463qzns00sxq.o0yxuz6911o-pq7xu454.0bxmn4.03s@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=TDQRkBpQ;
	dkim-atps=neutral
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJSrW25Dxz2y6N
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 03:36:11 +1000 (AEST)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-340ae84fb7dso202793577b3.17
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Sep 2022 10:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date;
        bh=CCIJQkAZ/MO9EmT200FCEP3Pgl0ISbihE0u87lNvTtM=;
        b=TDQRkBpQdXfWEYFjLGi7wwliNZ+aP0KfPsImVIZlXY8UjoGX+0qAFXnFV7XGW8IS6l
         y3VXrf+I2v9M7dPJOYegMdSPcyR+aiyAikKkPyRgRG+NjsroPpw9/4EU6cvNjVuOFM2u
         OAT4KFsNKXknM9gpAanaNp2m/7ee5CO2zFw2akG6RhT79MTZBIfrWOjgSBLIXLwhTrek
         2rRbzNpBpA/qCfbKpI1w2r4GCLJvz7pk5sgu4I7rxGww2tvEjHalildILdcL14mqDmo6
         PZNZoe3Kcvw46z9n2HY12LGtvHVlCAmPyMAI6EOC1YQSkgyXm1pQjGEvvxRKe2fezN+L
         aw6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=CCIJQkAZ/MO9EmT200FCEP3Pgl0ISbihE0u87lNvTtM=;
        b=FhYGdscx3f2eVLSgYFAOADQXhFRG4lF9P7mrLGgBl3AkvWv5iU1lE2UB627/nRyM7e
         uttj3+hn67Bx3IeDNys3fOSat6pirMMimhcZmpqXRJLleye7Wzv29szvCF2S3XcJkoV+
         7ONmR8V81s9+0qWUBydH7CzLiNehUXxhI+whQiImf5C8xmpWWYlOscM+qkOEKnCEEREc
         n7FBv0ky3JbFnUnHEiGteAED3ZRjlE0gX1XV21BpMNdnJzQUOw1GHab2HihhJAK1L2+a
         y3qSFwwdM2qXN4+r0aVXNfAioG6mYETOQf0dV4JZ2fodmhvVT9Xanzf5lzxVomMTiSuQ
         NGSA==
X-Gm-Message-State: ACgBeo0+xbrbrygcBqLNL5hOmoPm+NHb+OxlJhTinC/vD7IRyp62/cph
	dOyVTI7VzabmVSithu8rSHX8ptEv+QU=
X-Google-Smtp-Source: AA6agR4qr6moVIHZv2YyIMkU4NbM3gllPWtVCICGpkk6fJrsf7LoBe2Q5GLKhj1E2SNlSJehbfJ330C873A=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:1bfc:e7ee:6530:4449])
 (user=surenb job=sendgmr) by 2002:a81:94e:0:b0:33d:bfb0:ff55 with SMTP id
 75-20020a81094e000000b0033dbfb0ff55mr23236112ywj.322.1662053769056; Thu, 01
 Sep 2022 10:36:09 -0700 (PDT)
Date: Thu,  1 Sep 2022 10:35:06 -0700
In-Reply-To: <20220901173516.702122-1-surenb@google.com>
Mime-Version: 1.0
References: <20220901173516.702122-1-surenb@google.com>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220901173516.702122-19-surenb@google.com>
Subject: [RFC PATCH RESEND 18/28] mm: add FAULT_FLAG_VMA_LOCK flag
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, jglisse@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, laurent.dufour@fr.ibm.com, mgorman@suse.de, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, paulmck@kernel.org, liam.howlett@oracle.com, luto@kernel.org, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, linux-arm-kernel@lists.infradead.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add a new flag to distinguish page faults handled under protection of
per-vma lock.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 include/linux/mm.h       | 3 ++-
 include/linux/mm_types.h | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 0d9c1563c354..7c3190eaabd7 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -466,7 +466,8 @@ static inline bool fault_flag_allow_retry_first(enum fault_flag flags)
 	{ FAULT_FLAG_USER,		"USER" }, \
 	{ FAULT_FLAG_REMOTE,		"REMOTE" }, \
 	{ FAULT_FLAG_INSTRUCTION,	"INSTRUCTION" }, \
-	{ FAULT_FLAG_INTERRUPTIBLE,	"INTERRUPTIBLE" }
+	{ FAULT_FLAG_INTERRUPTIBLE,	"INTERRUPTIBLE" }, \
+	{ FAULT_FLAG_VMA_LOCK,		"VMA_LOCK" }
 
 /*
  * vm_fault is filled by the pagefault handler and passed to the vma's
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 6a03f59c1e78..36562e702baf 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -886,6 +886,7 @@ enum fault_flag {
 	FAULT_FLAG_INTERRUPTIBLE =	1 << 9,
 	FAULT_FLAG_UNSHARE =		1 << 10,
 	FAULT_FLAG_ORIG_PTE_VALID =	1 << 11,
+	FAULT_FLAG_VMA_LOCK =		1 << 12,
 };
 
 typedef unsigned int __bitwise zap_flags_t;
-- 
2.37.2.789.g6183377224-goog

