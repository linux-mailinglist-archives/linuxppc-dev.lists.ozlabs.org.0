Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D366C698C2D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 06:39:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHP0T5PQXz3fdj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 16:39:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=lxQtFymG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3urztywykdbe9b8v4sx55x2v.t532z4be66t-uvc2z9a9.5g2rs9.58x@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=lxQtFymG;
	dkim-atps=neutral
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHNXD4wgQz3f3t
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 16:18:52 +1100 (AEDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-52ed582a847so8813097b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 21:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GTmH+3zLa4DS1pm6XKzoFa9XiN/n/492GQmNm0F2u98=;
        b=lxQtFymGNoCMn73Q032qmSTTcj+ve7GubiXjG/S2/wZlI5A+wvms4mpLfeb6oKn81f
         gVVSU10rEKBXvaTQ4DI3+isYBuVvKtNDNUM4jT8VbxX9prWBulP37D7mcvfTTB0yv5Vd
         xLNBfAphNgvAxOXoC4bxmXgktQA4hGiUCCaPhABiIUzurEkqvA5yibf0xhi6vP6KsH63
         2fMMNvtfnEstPxLz+UPzwP+9hfF+/M/equZBkR4oGxxGpJkcmKAi9IzofVMskpdF8tY7
         tvoaCpVKwaaM8HBNFnnIuJry7ZsbTgV8SMkds4HojfN0Cbg+ccWTepT6dYOQ/gKplcjn
         qubQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GTmH+3zLa4DS1pm6XKzoFa9XiN/n/492GQmNm0F2u98=;
        b=bEVaoLlwgmw3K4eBqlNgYx5JgSdGdL/I0t6o3WppF+/S8Ef/8CInuLxVAxv/QYBfmg
         lAWyZAaND+jgshHwif6zYMlLzG3OtAJx/3+AISLaCD6yb5I9IGZCGZn5FTVciuJnDsoE
         TfpZHBV37xZ9MPtFcrGZKslTC0hyS16qnEm+FADti2uEdiiSdUl6Cwcf65EXRikA7GNa
         jwDVVGMFHvbpABuByaHGbaCzUJ3OcNZW19dM/cUQoBXry2Huoh6rmkwKum4vdjAI9xj8
         dKo6NuvQASgE8bLJWS2EW9DLI0Cfeerj87vU/pRvIO4qdAEBA/mV07DqtleWquIcBwr5
         pDCQ==
X-Gm-Message-State: AO0yUKX8Iju0fZDUpG3EMW0SG9EbKSxsXC0EPmyJGXdNUUGVVC9w0O5j
	O3nPfTPyeqU9Tt27FNqcWuxg+XDChwI=
X-Google-Smtp-Source: AK7set/Pm4WgUpt5iRaimc/pvYKHTFOy9juHCFu4sSQHLZZAabCINcoiFbttYYVnL3GbT+1smZzLxo4F4W0=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:f781:d5ed:1806:6ebb])
 (user=surenb job=sendgmr) by 2002:a81:441c:0:b0:52e:c79a:cda with SMTP id
 r28-20020a81441c000000b0052ec79a0cdamr12ywa.10.1676524730090; Wed, 15 Feb
 2023 21:18:50 -0800 (PST)
Date: Wed, 15 Feb 2023 21:17:38 -0800
In-Reply-To: <20230216051750.3125598-1-surenb@google.com>
Mime-Version: 1.0
References: <20230216051750.3125598-1-surenb@google.com>
X-Mailer: git-send-email 2.39.1.581.gbfd45094c4-goog
Message-ID: <20230216051750.3125598-24-surenb@google.com>
Subject: [PATCH v3 23/35] mm/mmap: prevent pagefault handler from racing with
 mmu_notifier registration
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

Page fault handlers might need to fire MMU notifications while a new
notifier is being registered. Modify mm_take_all_locks to write-lock all
VMAs and prevent this race with page fault handlers that would hold VMA
locks. VMAs are locked before i_mmap_rwsem and anon_vma to keep the same
locking order as in page fault handlers.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 mm/mmap.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/mm/mmap.c b/mm/mmap.c
index 00f8c5798936..801608726be8 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -3501,6 +3501,7 @@ static void vm_lock_mapping(struct mm_struct *mm, struct address_space *mapping)
  * of mm/rmap.c:
  *   - all hugetlbfs_i_mmap_rwsem_key locks (aka mapping->i_mmap_rwsem for
  *     hugetlb mapping);
+ *   - all vmas marked locked
  *   - all i_mmap_rwsem locks;
  *   - all anon_vma->rwseml
  *
@@ -3523,6 +3524,13 @@ int mm_take_all_locks(struct mm_struct *mm)
 
 	mutex_lock(&mm_all_locks_mutex);
 
+	mas_for_each(&mas, vma, ULONG_MAX) {
+		if (signal_pending(current))
+			goto out_unlock;
+		vma_start_write(vma);
+	}
+
+	mas_set(&mas, 0);
 	mas_for_each(&mas, vma, ULONG_MAX) {
 		if (signal_pending(current))
 			goto out_unlock;
@@ -3612,6 +3620,7 @@ void mm_drop_all_locks(struct mm_struct *mm)
 		if (vma->vm_file && vma->vm_file->f_mapping)
 			vm_unlock_mapping(vma->vm_file->f_mapping);
 	}
+	vma_end_write_all(mm);
 
 	mutex_unlock(&mm_all_locks_mutex);
 }
-- 
2.39.1

