Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24273698C3C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 06:43:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHP4h6kkzz3gBy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 16:43:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=GJ5BxW0Q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3w7ztywykdboikh4d16ee6b4.2ecb8dknff2-34lb8iji.epb01i.eh6@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=GJ5BxW0Q;
	dkim-atps=neutral
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHNXP4dsTz3f36
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 16:19:01 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-507aac99fdfso8560607b3.11
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 21:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=g+2R9wHJik/ujG7pbEIR7UB7BFuMmi7T4GQjwfs+Slo=;
        b=GJ5BxW0Q1u88snEvipBftLmc3+Jf1QItAPirJyrJgB8Mp9ylRIIALZlXmJQ4wNiSwP
         o865zgbeTpwGE0/miDmLSBWepWhJN06egqwo+YGBO2p834t1tPcrBoNtCdfrXD1jQzaN
         e7lrVFe77phFTZAotKwLYsW/LOb59LyIPFjYvDx4mPrMSRvD2iWSSQr/TeKwF3SManJP
         7zOmcrgCnGJ5t0wPXfGvFFU5Wepw7LHd2B3wtwv+KMRgdeCQNTeRgpwm3UNl2CvWi/nE
         3FOidEUJKnpNbe60Or5Um47yum4t5Cm2ARYxCb7pet6vv6oqpLv+fwdHpYVdfug+gwv9
         oixA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g+2R9wHJik/ujG7pbEIR7UB7BFuMmi7T4GQjwfs+Slo=;
        b=Tf/Nkp+yj43336hV6DLyvj8Tk+5iK4jofSan5JXi7cqLeChShLy1jZTngW/ObdXOoo
         jO8+7JI5NQYxK0n1giUSlNJu/UP47xmt8jknSW71YO4kGYHhj7MECu7TmbnFjJ3OCVhO
         RhJcBTniWK9LeOAP4ZZJ7+/ZyAPuoWXi8IV4pewwl/0EKyAD7u6Nkv38Utty/BvR7R5l
         nsamB8fw+UlRBnFkCpXpEZOv9M9775tiMDS1PzGtkJm7YQRddG7z2duesEyAfFPrBToU
         KJ9PrwhzObznUrdTebeTkGZ0EQOQUPleD+KVjyX9yDQ9tWLi15HpRaaNbzQRUxsH9Cab
         Z65w==
X-Gm-Message-State: AO0yUKWwlkRK+MXhEkRzG0R2rdeaeNFhXKsKwuBhzSt41rB/SpRvUE9w
	UvMyDoGSgQC/IOjFkh3fA3tLhiS2hKQ=
X-Google-Smtp-Source: AK7set/8zrN2bEgVNx1m2BtSP2crHaoN6LxODGu2trr1UY0Ec3uUEJoRM+mde4AC+sE3ZWg+Wi9w81iJ8kk=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:f781:d5ed:1806:6ebb])
 (user=surenb job=sendgmr) by 2002:a5b:144:0:b0:8ec:cc9b:7333 with SMTP id
 c4-20020a5b0144000000b008eccc9b7333mr463396ybp.205.1676524739514; Wed, 15 Feb
 2023 21:18:59 -0800 (PST)
Date: Wed, 15 Feb 2023 21:17:42 -0800
In-Reply-To: <20230216051750.3125598-1-surenb@google.com>
Mime-Version: 1.0
References: <20230216051750.3125598-1-surenb@google.com>
X-Mailer: git-send-email 2.39.1.581.gbfd45094c4-goog
Message-ID: <20230216051750.3125598-28-surenb@google.com>
Subject: [PATCH v3 27/35] mm: add FAULT_FLAG_VMA_LOCK flag
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
index 36172bb38e6b..3c9167529417 100644
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
index 939f4f5a1115..212e7f923a69 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -1056,6 +1056,7 @@ enum fault_flag {
 	FAULT_FLAG_INTERRUPTIBLE =	1 << 9,
 	FAULT_FLAG_UNSHARE =		1 << 10,
 	FAULT_FLAG_ORIG_PTE_VALID =	1 << 11,
+	FAULT_FLAG_VMA_LOCK =		1 << 12,
 };
 
 typedef unsigned int __bitwise zap_flags_t;
-- 
2.39.1

