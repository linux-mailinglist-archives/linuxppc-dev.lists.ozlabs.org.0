Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F26CF67EF0D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 21:02:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P3T4b6G6pz3fPw
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Jan 2023 07:02:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=mdQhCODm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3dinuywykdnujli5e27ff7c5.3fdc9elogg3-45mc9jkj.fqc12j.fi7@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=mdQhCODm;
	dkim-atps=neutral
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P3SdY54gPz3fHX
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Jan 2023 06:42:08 +1100 (AEDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-506466c484fso65970937b3.13
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 11:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mMW5WtXlwQRVw5jLv0uMPkgP2YoyRT4XQf8L1G2g0sM=;
        b=mdQhCODmER/WcuXnOwjGOPGsluXP611R3K8yAAqGfZO+eojPR0iLkDWsNYoGq20Pxc
         pLGndC0gNc0k/+qBk7J/uFwYPbCjsW7XmlHDcZCSFndQyDIXmYjY6yxKamOAoeP6UD5R
         10GuF5qfONyUFHlhJRc27yht8CtL7+xZMg96kBN6doFn/8DSebIrGsIvYM1XfrVRdrIT
         Vzd4VicNtC2Hx0ebeUSEC751adwD7ZH4dP9Tg/rHSx32WXBUDV2TcmMYgTc4y3CEq8j+
         2IuM945ICEGJ6/3bquYB/9nBx6UvS9o2Tl6iob7NJEFRIs2YxCbcwKtUsh6O7/MdtiEH
         lFnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mMW5WtXlwQRVw5jLv0uMPkgP2YoyRT4XQf8L1G2g0sM=;
        b=b/E0YnFTFowtQQDWW8C6pXoavo7djQseRsAWW7mOTYlK63C2mLTvzWkQmDxTlJfnKv
         5DNzKxlqnehs1w3ja5clDnNOpCc7FwW7OWZxHj2sEf+Mdsglcbr4HXOC+I6tsnejOXRk
         FXjae3BphvSuOU6y00Of2T6lU+xk2A0+81ZL8TjVjABr76Z0kE92bn9xgFQQieLHmkA2
         oM8UTNGGJGJR/KiU+dJsiwu1aqWbwH9SjMkKEcvrhsZ7DA2ygp2yuCEnTbRdGH1H/mSy
         Ebinu82snedNiKcr5NW0SGb6L0GXOYKdyL6B8NyIggFOb7X5oabCJnPzR2fz2cr0+wTm
         AYGg==
X-Gm-Message-State: AFqh2ko6GknvtFZyKjMM9rjM5JxVvDIx+MuRqM0s+95XJc6ZrczW/6gS
	rfT3d76umuIU9WSK2Bw69YDzML0rMY4=
X-Google-Smtp-Source: AMrXdXvm/6CR5hD1SSLODW5O6UqAFkTGTyEvJF4A+5Su+1PwVS4k4WIa/asYlNCGXFd3Q9zHSTloGdPuiKg=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:4e19:be9:c5d0:8483])
 (user=surenb job=sendgmr) by 2002:a25:1fd4:0:b0:7d4:712e:2852 with SMTP id
 f203-20020a251fd4000000b007d4712e2852mr4289060ybf.628.1674848526673; Fri, 27
 Jan 2023 11:42:06 -0800 (PST)
Date: Fri, 27 Jan 2023 11:40:59 -0800
In-Reply-To: <20230127194110.533103-1-surenb@google.com>
Mime-Version: 1.0
References: <20230127194110.533103-1-surenb@google.com>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
Message-ID: <20230127194110.533103-23-surenb@google.com>
Subject: [PATCH v2 22/33] mm/mmap: prevent pagefault handler from racing with
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, tatashin@google.com, mgorman@techsingularity.net, rp
 pt@kernel.org
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
index 3baf218836bb..3d0cfbc92745 100644
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

