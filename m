Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E99698C2C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 06:39:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHNzS4YVhz3fWF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 16:39:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ee09VaaN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3t7ztywykda4685s1pu22uzs.q20zw18b33q-rs9zw676.2dzop6.25u@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ee09VaaN;
	dkim-atps=neutral
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHNXB0ZtZz3bg9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 16:18:50 +1100 (AEDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-517f8be4b00so8790237b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 21:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Cy3b4YdYe1JheypyM1qEqlntx+LNPOiVtlvqoTpRTGk=;
        b=ee09VaaNfMCXdTYs7ho4FL1rz+7Jau0hVrpqtPJwR0LOjVJOOKMHcMbwd/rGxak63H
         BRVuTQ9tdXJzSR+6NhiK4KAEy3orTDG5A6ugcB1Mu/JZ3TtJ8rFlU/MHE4DwjmulfLqA
         4lbez5vLr44VvmK0HXNKetjG61FmR5dtu/ffCFjZaMQfVdd6yPZ6Vqs7cSoCFmCWN2ej
         U7UJuLArjVJJvFA58VBbTFzUGAlbxAZVBV5EE2zVq6EhbmHffJxz6yeGBWtLnffH9zfX
         I0SKmeE3zn9vqZPVYyRXu1tk/VZ/LisV9OyoAUd6iOjxLewnK1RWOS7bKO/6E67varMh
         DYqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cy3b4YdYe1JheypyM1qEqlntx+LNPOiVtlvqoTpRTGk=;
        b=apD0euajeDOVU6KMRsXLsyeEG6zaFtnNCnXyfLGSYCcCm5kN1fx0M8CJ6mm4CFGsZ1
         p9S+c7rEHEiSEh+KcjtpwOMuusZpdy12DuO7guMLCsi4EAOISfNc3tOzbQqqnI/L2+2H
         jkkIVlIcKnqJGZJgQGKdTNAIa4fhV2XNf2gu9OwpEdcGjIRM+cl+7lez8ux/gXOw0Gdv
         mKKvjAJ1F4lX8bD/zw6wcPl6RB3aWJUcRJ8eHZ8jXMq/7ChKl8QLlCTiU2Hju4SDA3KQ
         +IOwBgckwBb6NxqdwWao+YxC3QHHFghdF52xUyin4MRS+sKrsJ80Nc9fuUXgShGKhNV/
         KP6g==
X-Gm-Message-State: AO0yUKUKHGsnjVTEZaKW2RAAWDtpf3wQpVMfA7eXv9XaHZv4u/TqBkZN
	xpfKjjbS6MtpqeN2VsLlwIvFgfAmEJY=
X-Google-Smtp-Source: AK7set98gd/BBmD2MrHMvmTSXIUmiTX+HY9u8tg6jgvhUw+D34Dv05igzcuyCWu8/RYb3F6ryIOQeEDmrWY=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:f781:d5ed:1806:6ebb])
 (user=surenb job=sendgmr) by 2002:a0d:c347:0:b0:52f:1923:4f9d with SMTP id
 f68-20020a0dc347000000b0052f19234f9dmr562132ywd.366.1676524727987; Wed, 15
 Feb 2023 21:18:47 -0800 (PST)
Date: Wed, 15 Feb 2023 21:17:37 -0800
In-Reply-To: <20230216051750.3125598-1-surenb@google.com>
Mime-Version: 1.0
References: <20230216051750.3125598-1-surenb@google.com>
X-Mailer: git-send-email 2.39.1.581.gbfd45094c4-goog
Message-ID: <20230216051750.3125598-23-surenb@google.com>
Subject: [PATCH v3 22/35] kernel/fork: assert no VMA readers during its destruction
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
index 9141427a98b2..a08cc0e2bfde 100644
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
2.39.1

