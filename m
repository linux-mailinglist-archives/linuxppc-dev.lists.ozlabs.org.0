Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B64663293
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 22:17:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrRbk28XQz3fXN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 08:17:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=nfh/0wSN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3fh-8ywykdckxzwjsglttlqj.htrqnszcuuh-ijaqnxyx.teqfgx.twl@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=nfh/0wSN;
	dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NrR5f2tmPz3cdP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 07:54:46 +1100 (AEDT)
Received: by mail-yb1-xb4a.google.com with SMTP id r8-20020a252b08000000b007b989d5e105so6927863ybr.11
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Jan 2023 12:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=89ITsq4nUiN8d4MMzUNaP/VKvoRvGlIDiLzssAyWMSw=;
        b=nfh/0wSN7du3H+jbnftiNBYsH0L/ZzvAjrQDNKD6/Ux50j22Vuiz0S8HvVp3TvO1vo
         K/T56ndCuYOiwpC071dddEQYgomwd4Y1mEzWyHgdRsI4Zm5Szg4pGbhhjtZTIjjKwBZ2
         DuLjlMuvIIQ0lWiW9Nfxk/1vqmTgUUR+Vpz2r/N+XxIUJS4L6MBvWuo91YhKUizAdsFD
         /Z7UYgJwWP6aH5EHzLl9AB9L/N1SliUIF0AbaZQSGUEgi4Q4Dc2tmxMGPV7cLiqwxdNW
         0MiPjg6rJc2LN6ARMi2zMWyKxfOe4Y81VTcKlWoejCss5A49BpopZcqw0LB7HbZRjJwk
         DoGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=89ITsq4nUiN8d4MMzUNaP/VKvoRvGlIDiLzssAyWMSw=;
        b=Kh7KyIWzk/oD2lw1CHiUC8/WrWjmbgH5DLp2bKVZAT64XwdIo51vgxbGbVn7zkxJuR
         cjWbkxN6EyDVXkBh4zolfo+9INigki9HMupN7bEvyuDRFA9JYQjkdrfCInfGjdA497df
         SvduCKHYMY+emUdd69xxQbJjTXswd7nKCNyPnGmzsyDuxpizDPrNwwHB7OnlAFLY2U+M
         I5rKQXUYyVDHY2AyPzVPZ+Vo8Svgn953d9h81Sf7o3c7tnZMTGm15Ya3Bhn71b/jcdQQ
         abAZaH3uFTcam5lq5bik6vtmX27liF7oGHIIRqL1L2cz7R4mKylU6BMDXXRkEo/djkFl
         8qaw==
X-Gm-Message-State: AFqh2koAOf7CdhY+KmrIGXHAV8fLvx69MDN/By4tEn2m0jl8E+D6TvpM
	VK0aznt8aeTCuu0rM8bM5p0GwI8FxAo=
X-Google-Smtp-Source: AMrXdXvWplK/QqycNgSSdeBDfganGdyEUrMbsmwVLuA4csVljoZeQRUCGyXX2t9p/6nnKr16T46cKc1FR2o=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:9393:6f7a:d410:55ca])
 (user=surenb job=sendgmr) by 2002:a0d:eacb:0:b0:485:126c:3834 with SMTP id
 t194-20020a0deacb000000b00485126c3834mr6100451ywe.360.1673297684211; Mon, 09
 Jan 2023 12:54:44 -0800 (PST)
Date: Mon,  9 Jan 2023 12:53:20 -0800
In-Reply-To: <20230109205336.3665937-1-surenb@google.com>
Mime-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20230109205336.3665937-26-surenb@google.com>
Subject: [PATCH 25/41] mm/mmap: write-lock adjacent VMAs if they can grow into
 unmapped area
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

While unmapping VMAs, adjacent VMAs might be able to grow into the area
being unmapped. In such cases write-lock adjacent VMAs to prevent this
growth.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 mm/mmap.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/mm/mmap.c b/mm/mmap.c
index 0d767ce043af..30c7d1c5206e 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -2461,11 +2461,13 @@ do_mas_align_munmap(struct ma_state *mas, struct vm_area_struct *vma,
 	 * down_read(mmap_lock) and collide with the VMA we are about to unmap.
 	 */
 	if (downgrade) {
-		if (next && (next->vm_flags & VM_GROWSDOWN))
+		if (next && (next->vm_flags & VM_GROWSDOWN)) {
+			vma_write_lock(next);
 			downgrade = false;
-		else if (prev && (prev->vm_flags & VM_GROWSUP))
+		} else if (prev && (prev->vm_flags & VM_GROWSUP)) {
+			vma_write_lock(prev);
 			downgrade = false;
-		else
+		} else
 			mmap_write_downgrade(mm);
 	}
 
-- 
2.39.0

