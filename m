Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 985256632BE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 22:21:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrRj0301Rz3fm7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 08:21:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=RmMHlCmm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3ih-8ywykddujlivesxffxcv.tfdczeloggt-uvmczjkj.fqcrsj.fix@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=RmMHlCmm;
	dkim-atps=neutral
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NrR5t5v8Wz3cgp
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 07:54:58 +1100 (AEDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-4c36d00c389so91862597b3.18
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Jan 2023 12:54:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=B6J4oGWYAsMb5e7sz4HwYEXURXCKE081WlUNIaNvLis=;
        b=RmMHlCmm38xVKeEsK8n8bfn/aY3rbZqU5QjWJwlg7PYpTvR8g1QwX79gxnClyI+zIW
         JCQh5e4SjFQ2Q8nxF5bjIKp19Ks1VtVZP+kR4i8xND+6Fj+6CTJ8vlU6n1mfUhVhmmz7
         +sE7byDQX+/dNdDepWb8tj8CSiQt6RCyFFAm480IRiAV2JLM0c7a5e0c36lCq09bYHwP
         wg+XvRL1iHdJUlNZBka6/ieT4oXpnPfG2/UuJktrbb0wvhMWj6jl5RcTqQ78qy0Rsk8c
         4BQSRlXhCecUdC5ZETwJhxsGpmEcobjcEL9EE3pAQY+ImA2TDfMr31CaGMQDdx5w7rZe
         dkaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B6J4oGWYAsMb5e7sz4HwYEXURXCKE081WlUNIaNvLis=;
        b=oVZyrhoVM7ZwDFOxcS17UvOddlOThqfi/U3hAh4cZBCSlhX3Knap2xwHvWGVjmVLUy
         1zRmyDjtracw2RKuEV7PuS06XFBxtvb0B63fRFrjoo3ce3eN5XM8vVIcC3ueL6ESEkrf
         O/e34ztx25HfhPb0BORXBj6KPSgJjkRPfNfTVQ+t+dV+PhnxFbyEGLGRgDOvuMV0EVv0
         kwV76LDWwHg7sruvBdrN/xVwo7qYgbY9RYiQn7s82OAKuPj/CbCDA8Gy3QA0z+HGy1tv
         8qfz0weGdIF0Z4UGomsjs0q2T0nKjJ3hCCrmn64HevDG375XuFZYw4nqLbg+LdJQ6bvB
         0n0A==
X-Gm-Message-State: AFqh2kom49FHutaHVONZWxhh3f+6v45kjKliL4aIUy+v/Rgav6sMNiue
	9MeljHyJQ7rOPrleRDZGOIbOrSZxE7c=
X-Google-Smtp-Source: AMrXdXvwV2DJ0LbEXE5ZgdwVnwlID+Hh7Y6icoi6WDsC3E+JAvvNZYvjiQv0jw9VN21R/xnRr9wwO4IvIuA=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:9393:6f7a:d410:55ca])
 (user=surenb job=sendgmr) by 2002:a25:e7c7:0:b0:7bf:cf52:ede5 with SMTP id
 e190-20020a25e7c7000000b007bfcf52ede5mr196156ybh.626.1673297696306; Mon, 09
 Jan 2023 12:54:56 -0800 (PST)
Date: Mon,  9 Jan 2023 12:53:25 -0800
In-Reply-To: <20230109205336.3665937-1-surenb@google.com>
Mime-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20230109205336.3665937-31-surenb@google.com>
Subject: [PATCH 30/41] mm: add FAULT_FLAG_VMA_LOCK flag
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, tatashin@google.com, mgorman@techsingu
 larity.net
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
index d0fddf6a1de9..2e3be1d45371 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -467,7 +467,8 @@ static inline bool fault_flag_allow_retry_first(enum fault_flag flags)
 	{ FAULT_FLAG_USER,		"USER" }, \
 	{ FAULT_FLAG_REMOTE,		"REMOTE" }, \
 	{ FAULT_FLAG_INSTRUCTION,	"INSTRUCTION" }, \
-	{ FAULT_FLAG_INTERRUPTIBLE,	"INTERRUPTIBLE" }
+	{ FAULT_FLAG_INTERRUPTIBLE,	"INTERRUPTIBLE" }, \
+	{ FAULT_FLAG_VMA_LOCK,		"VMA_LOCK" }
 
 /*
  * vm_fault is filled by the pagefault handler and passed to the vma's
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 0d27edd3e63a..fce9113d979c 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -1103,6 +1103,7 @@ enum fault_flag {
 	FAULT_FLAG_INTERRUPTIBLE =	1 << 9,
 	FAULT_FLAG_UNSHARE =		1 << 10,
 	FAULT_FLAG_ORIG_PTE_VALID =	1 << 11,
+	FAULT_FLAG_VMA_LOCK =		1 << 12,
 };
 
 typedef unsigned int __bitwise zap_flags_t;
-- 
2.39.0

