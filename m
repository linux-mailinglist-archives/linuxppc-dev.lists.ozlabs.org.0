Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B148866322A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 22:04:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrRK24LNSz3fKR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 08:04:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=GGWOlVFN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=37368ywykdaqwyvirfksskpi.gsqpmry1ttg-hizpmwxw.s3pefw.svk@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=GGWOlVFN;
	dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NrR4y1PSjz3cJB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 07:54:10 +1100 (AEDT)
Received: by mail-yb1-xb4a.google.com with SMTP id w9-20020a05690210c900b007b20e8d0c99so10268835ybu.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Jan 2023 12:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VKcEnbcUm4yNPmJ0/UBWAk4YOoOktsWvie1GPNgM1C8=;
        b=GGWOlVFNZmpsv4EqX6fJ0IzU46mRQdwbpB1woCBvprw4wrB1Px0W3aw0R3eA4F/+xV
         kXuBRDFymMvypEzFr/D4iD7og2WAH2DpqMoKxtl2yVGo8HrvBlCIzI0TYQCav4I1owI5
         QhJAem5dniKSevuuTKEF0EwC81wZP9AQ1hwH/aOaMvCSNfv3FcYZaW7nXgrr4EsyFNJE
         AJznojM8o2oQLC4YAgQdb7K64EDnrtRV2QjiyePckmOOYm4vpeviEyBwwk5GM5l0mBi5
         NKaa6vy3INpTQuuxZ0BRwKOg99o3TKTitzAEr6jS2DiN0O+IImG4Tiab8jZ8nkO0QP6Q
         MsPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VKcEnbcUm4yNPmJ0/UBWAk4YOoOktsWvie1GPNgM1C8=;
        b=Z1UsUi9QvdnT8N3YnRF0LMxGKskwvdpvpwPrJwIT3jDIx4nnLeLnuUejexsGZEHZpN
         gWPULepGmCi9mMdrYLR8+dlWmtZ+K+VtuHUMSd4FOHlXbc8767LrNOR7ColfVP+Svax2
         3GeUsj/E0JVXSPCvsvwC+hIjyBJJFpO1NMTPUtOTRDgN33fRdRojszcDJTfM9BGEfxkH
         tD7+F/PwMUG1WpWen3RMrz8M59Rid5/iELoDvcCSt9axOTutU71uy5/GYizrRg/Fy/Xq
         lgzzXwlNmp2DS/BTz8264dUsxK/uMp67Fx2rl1W2YINp/koGKRhCzvXTLO/+6DuU4mBz
         pLvg==
X-Gm-Message-State: AFqh2kpfsfI5SjzmhLLPpbDhBoYKGiCHBX/CTZNiKqeEouFNWrHxj3tw
	Q2Ei2mk9NA/w8IFMEE/cWu0YopDBdUI=
X-Google-Smtp-Source: AMrXdXuuklmw1U5OSS04yToFIKYXQnoMsaTWu76HfgvyMhLNzfJxTKm5wgWz/6XkfwWL03n+CBAO8y2WRQ4=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:9393:6f7a:d410:55ca])
 (user=surenb job=sendgmr) by 2002:a0d:d48a:0:b0:46a:f5ee:a2fe with SMTP id
 w132-20020a0dd48a000000b0046af5eea2femr1229443ywd.207.1673297647974; Mon, 09
 Jan 2023 12:54:07 -0800 (PST)
Date: Mon,  9 Jan 2023 12:53:06 -0800
In-Reply-To: <20230109205336.3665937-1-surenb@google.com>
Mime-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20230109205336.3665937-12-surenb@google.com>
Subject: [PATCH 11/41] mm: export dump_mm()
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

mmap_assert_write_locked() will be used in the next patch to ensure
vma write lock is taken only under mmap_lock exclusive lock. Because
mmap_assert_write_locked() uses dump_mm() and there are cases when
vma write lock is taken from inside a module, it's necessary to export
dump_mm() function.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 mm/debug.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/debug.c b/mm/debug.c
index 7f8e5f744e42..b6e9e53469d1 100644
--- a/mm/debug.c
+++ b/mm/debug.c
@@ -215,6 +215,7 @@ void dump_mm(const struct mm_struct *mm)
 		mm->def_flags, &mm->def_flags
 	);
 }
+EXPORT_SYMBOL(dump_mm);
 
 static bool page_init_poisoning __read_mostly = true;
 
-- 
2.39.0

