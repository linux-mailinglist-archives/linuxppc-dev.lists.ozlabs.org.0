Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB4F698C40
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 06:45:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHP6k4bJjz3flH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 16:45:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=sqrDU+BC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3ylztywykdb8npm9i6bjjbg9.7jhgdipskk7-89qgdnon.jug56n.jmb@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=sqrDU+BC;
	dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHNXS6vfCz3f7M
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 16:19:04 +1100 (AEDT)
Received: by mail-yb1-xb4a.google.com with SMTP id t13-20020a056902018d00b0074747131938so856463ybh.12
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 21:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2G5AxmmOVrsRnXlCrW6/hvh5FUxSjD+0mS6LSWzYfho=;
        b=sqrDU+BCO7AIuj2EKpC5JjJjchpfs4e7nICzmha43sQtLyfoiEZwLUOwsCD209H5Ui
         lu0l/EwT0lWrDRHYoglaYWRXNYPJ1g8O+GpgkaLO5UTCsF2sShD98xQNq7PDWtH66r6g
         ZsB+oua1JfA0KymwRm2/PgdgPfreEDDqnwQyHLX1ndmfndQgCQh8neVqDDo8QNluQIit
         psaYv9QythR+X2eyBbc1tAjHl/fZRS54lIuiB1Ux7odRjp5k2KlmRL+IIzajgpgWcCV1
         agKdJl/mJ1QtI4UVDWAjmp+dEFlVMZYnML3DG7HfRey4EeaADk1hZvmemdIk3Yb/sCoK
         4MXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2G5AxmmOVrsRnXlCrW6/hvh5FUxSjD+0mS6LSWzYfho=;
        b=FRhosjsIECqLYXNLc+MI1kQBak5kuu1e/a39hcECY4hAPpJt/ghIjvn54R3WoovsBb
         aridNrfeYHJOpU+DyK5uh5UWitGfImM6RhEdWpw/Nvaa2Yk1vB28l1bFt6mnH+UAfLys
         SQiAp6tOiaK9IpRxHxciVtBIsE48e9hq1n2faj2aYay9WhvPdde9ZTR1U0dCa/LVb+X0
         yJ9MRvwGAH17o6AQXMoba8Nx2jeshG0Z9UAf7QCNPMdV9bJmk5Z9B9AHnkiNb2J2ege9
         YGVltlMB3DX2T9eYbwwn4au8Q0oEvzX5XQVSqICFDQ6Jb9oTG9hbcQ6svgCr0P3w4cSP
         ku/g==
X-Gm-Message-State: AO0yUKW4NYMdY8Sywq+uHrHDPkkmtcbuICou10x1M8uk+y9xJ71lV1tZ
	PvdPcR1BaelgXa78sxs06Tz/G8eWSnk=
X-Google-Smtp-Source: AK7set/QuR9OxnmNolAau/sd0Kj8g/BkdB7enEU88ehNvfonJ32Y6Yzdt5dUleuzBy4yluRtxlQTgtsiJAU=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:f781:d5ed:1806:6ebb])
 (user=surenb job=sendgmr) by 2002:a05:6902:13c6:b0:8da:3163:224 with SMTP id
 y6-20020a05690213c600b008da31630224mr7ybu.0.1676524744013; Wed, 15 Feb 2023
 21:19:04 -0800 (PST)
Date: Wed, 15 Feb 2023 21:17:44 -0800
In-Reply-To: <20230216051750.3125598-1-surenb@google.com>
Mime-Version: 1.0
References: <20230216051750.3125598-1-surenb@google.com>
X-Mailer: git-send-email 2.39.1.581.gbfd45094c4-goog
Message-ID: <20230216051750.3125598-30-surenb@google.com>
Subject: [PATCH v3 29/35] mm: prevent userfaults to be handled under per-vma lock
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

Due to the possibility of handle_userfault dropping mmap_lock, avoid fault
handling under VMA lock and retry holding mmap_lock. This can be handled
more gracefully in the future.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Suggested-by: Peter Xu <peterx@redhat.com>
---
 mm/memory.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/mm/memory.c b/mm/memory.c
index 555612d153ad..751aebc1b29f 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5254,6 +5254,15 @@ struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
 	if (!vma_start_read(vma))
 		goto inval;
 
+	/*
+	 * Due to the possibility of userfault handler dropping mmap_lock, avoid
+	 * it for now and fall back to page fault handling under mmap_lock.
+	 */
+	if (userfaultfd_armed(vma)) {
+		vma_end_read(vma);
+		goto inval;
+	}
+
 	/* Check since vm_start/vm_end might change before we lock the VMA */
 	if (unlikely(address < vma->vm_start || address >= vma->vm_end)) {
 		vma_end_read(vma);
-- 
2.39.1

