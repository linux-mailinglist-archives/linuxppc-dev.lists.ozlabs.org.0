Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D6F67EF1F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 21:04:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P3T7c6pjBz3fqg
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Jan 2023 07:04:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=rcBVm8w9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3eynuywykdnooqnaj7ckkcha.8kihejqtll8-9arheopo.kvh67o.knc@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=rcBVm8w9;
	dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P3Sdj3tRzz3fBL
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Jan 2023 06:42:17 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id a14-20020a5b0ace000000b007bf99065fcbso6361731ybr.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 11:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gSaEMik01Wf1+Bdt2RmdUMjgYY7lDp9hLxJUYqXXyyM=;
        b=rcBVm8w95my/f0ebkBHOBSdk/g3dXIBnrvyKhE+0lfp8SBBL9UDohndGfm9prz69Nb
         1VsGdk5hVjbZdd99cfs1kRzqndkhM72YtTrleRtcoKwDWYV7T956W4hi9P14DNVnfcTE
         4dzd8voX/MwzX+niWcYh6zC2gtPII1RsQu2W+o1SzbH/VUzyZkZ+K0mbi6bCuvIO2r/9
         q8JUw2FMeYJjbLjibdrizaV+CI77RGRlLfF03fxNpzuIRE1ymkIpYCAH7a7Vh5p4LTWM
         djOGRW9GCrBrxw2Z+lpBSKPiwjL/b62fESDSi0yRTpPNMfCaBkk0gvqmlpNjM1674+ZN
         MkCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gSaEMik01Wf1+Bdt2RmdUMjgYY7lDp9hLxJUYqXXyyM=;
        b=PcWvsFN9ZabHwopGQXMxJPznrjsO9EZj+oxGTIELvwjdgZ7nphRr+cbQAmWNywT4mw
         8OQwlmD2SBU++O9JgSuN+2WLRuCz3Xj+dkQh2S2jay5AXSeVUY22zrj970aEHTOW9uCQ
         v6gYQNdhnZ6IpkYn+w1n+2387E7ZFpAdFB2V2+rWKdUG1TVx1IMMbUYhFYhPhUMqDDzh
         riUHfQaqLdcbCHu6B87JewdNUoQLPM7ahV8PoAyjMRTYS5oQ4AwRenhb6Redzn4pmrRI
         BDk/vnQIy9nwq7bn3NqXjn+/zSofFbyiIVLNDq+Ey8MnKh0rCQZ0v9R2NT1RfkW1AKks
         QaBQ==
X-Gm-Message-State: AO0yUKWRg1rv0xwMbKOiPYOhCcOPuqVnX8+3R/Wkr10cXNbjO++cTvtu
	a+ar238C1UP5GaznN3egt8msu+9x1Is=
X-Google-Smtp-Source: AK7set9ZuZbDGpVLmgenU71+ffHh46VvnF49YmmPOU0QZTkBBursiC5h0isQQWJJC0fjjZLxRphOeOdStg0=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:4e19:be9:c5d0:8483])
 (user=surenb job=sendgmr) by 2002:a0d:d8d5:0:b0:508:1348:3e54 with SMTP id
 a204-20020a0dd8d5000000b0050813483e54mr1003857ywe.440.1674848531551; Fri, 27
 Jan 2023 11:42:11 -0800 (PST)
Date: Fri, 27 Jan 2023 11:41:01 -0800
In-Reply-To: <20230127194110.533103-1-surenb@google.com>
Mime-Version: 1.0
References: <20230127194110.533103-1-surenb@google.com>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
Message-ID: <20230127194110.533103-25-surenb@google.com>
Subject: [PATCH v2 24/33] mm: fall back to mmap_lock if vma->anon_vma is not
 yet set
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

When vma->anon_vma is not set, page fault handler will set it by either
reusing anon_vma of an adjacent VMA if VMAs are compatible or by
allocating a new one. find_mergeable_anon_vma() walks VMA tree to find
a compatible adjacent VMA and that requires not only the faulting VMA
to be stable but also the tree structure and other VMAs inside that tree.
Therefore locking just the faulting VMA is not enough for this search.
Fall back to taking mmap_lock when vma->anon_vma is not set. This
situation happens only on the first page fault and should not affect
overall performance.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 mm/memory.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/mm/memory.c b/mm/memory.c
index 5568fcb0a46b..593548f24007 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5244,6 +5244,10 @@ struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
 	if (!vma_is_anonymous(vma))
 		goto inval;
 
+	/* find_mergeable_anon_vma uses adjacent vmas which are not locked */
+	if (!vma->anon_vma)
+		goto inval;
+
 	if (!vma_start_read(vma))
 		goto inval;
 
-- 
2.39.1

