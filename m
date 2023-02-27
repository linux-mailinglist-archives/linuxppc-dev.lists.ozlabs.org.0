Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFF16A48A9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Feb 2023 18:55:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PQSp32LZvz3ftW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 04:55:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=kE2fXrc4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3vor8ywykdemxzwjsglttlqj.htrqnsz2uuh-ij0qnxyx.t4qfgx.twl@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=kE2fXrc4;
	dkim-atps=neutral
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PQSPK12kHz3cF0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 04:37:25 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-536e8d6d9ceso153582367b3.12
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Feb 2023 09:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q7njm8z68LI6RSv1P8+cvUE7J2LNjoWsKIE5FW5UVRU=;
        b=kE2fXrc4CKxmWF4clr80N741Ci0xoX5G8lQJgmu9s0G2B1Dy6UfiGdmy87bkmQVz06
         s0jNeoaCkSHSjTyAuaLFgp289qeTagMwone0ldYih81KbxqFw8/SoaDnJa0SNDiiUGH5
         C2cHTDPFHiMhA/p+opto/zgvEpmwF0hSnXtUorxCz5wzOWx7pG82xGb9d1FeLnZgcBn6
         7W1alMlgUF/qdYBONkVV4Ipuqjxo8jbsNMGdOFgbr+6bIzoXMj9Q7PsKDQfKRgxbc6VN
         kYkd8hTRqF7X5fVDHYhOgBPe6TXfun1LU5P2SsjoAl6axSlRSprAw6j/yFhpk0MslB1+
         5m8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q7njm8z68LI6RSv1P8+cvUE7J2LNjoWsKIE5FW5UVRU=;
        b=K19kqobkiMPgL4h0mDsT6F4bWHpOwIrFgoo47u1RPBfnGq79/x0mrBh4mv46+47FsP
         ogagdC1nEaGmKSOm7uOejSAMYVk10Tb0d3UR1TvCgU8LD0lcFSXwag3LfYeSXdMJPWvB
         0WmFIHAWnu5Y92wfuPZkRxCyldB8SjmzyikmBG1d18vXSsZWAQ8WUGHp6MA8hAsJW88s
         gih7xGqTO9TWXLmu+mswl0R4S+T5BxM+9SY6q+DcUjfv0LG0M8mbTHHx9tq/Gb4s4LmL
         MUkX9QUACM1CQmjuK6pKmbF0+5+dbTBc3ctmUx/yZqQkoJpv5f4Etfz5OkguewpjiYDd
         Ot8g==
X-Gm-Message-State: AO0yUKXqLhjW7ovmPpf72X1jkod6q7i7mlARnkg13mNrn3iARc1UAhky
	Iey4er29Kj2DfbhcRlMT5srTBswWZYQ=
X-Google-Smtp-Source: AK7set8BLaXPA95+t3odvktVZcgw7j4RuC8orgkmVPEnGvQUgHaO3AYXobp8iNv8pTyoR4t4ofqJKVALLsQ=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:e1f6:21d1:eead:3897])
 (user=surenb job=sendgmr) by 2002:a05:6902:4d4:b0:91d:d6ed:6bd2 with SMTP id
 v20-20020a05690204d400b0091dd6ed6bd2mr10048648ybs.1.1677519444556; Mon, 27
 Feb 2023 09:37:24 -0800 (PST)
Date: Mon, 27 Feb 2023 09:36:19 -0800
In-Reply-To: <20230227173632.3292573-1-surenb@google.com>
Mime-Version: 1.0
References: <20230227173632.3292573-1-surenb@google.com>
X-Mailer: git-send-email 2.39.2.722.g9855ee24e9-goog
Message-ID: <20230227173632.3292573-21-surenb@google.com>
Subject: [PATCH v4 20/33] kernel/fork: assert no VMA readers during its destruction
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

Assert there are no holders of VMA lock for reading when it is about to be
destroyed.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 kernel/fork.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/fork.c b/kernel/fork.c
index e1dd79c7738c..bdb55f25895d 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -491,6 +491,9 @@ static void vm_area_free_rcu_cb(struct rcu_head *head)
 {
 	struct vm_area_struct *vma = container_of(head, struct vm_area_struct,
 						  vm_rcu);
+
+	/* The vma should not be locked while being destroyed. */
+	VM_BUG_ON_VMA(rwsem_is_locked(&vma->lock), vma);
 	__vm_area_free(vma);
 }
 #endif
-- 
2.39.2.722.g9855ee24e9-goog

