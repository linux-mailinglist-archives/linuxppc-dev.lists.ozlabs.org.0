Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F1767EEE8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 20:57:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P3SzP3ygMz3fcC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Jan 2023 06:57:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=GKKENfMf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3ainuywykdmk796t2qv33v0t.r310x29c44r-sta0x787.3e0pq7.36v@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=GKKENfMf;
	dkim-atps=neutral
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P3SdK0hZCz3fJD
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Jan 2023 06:41:57 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-4d5097a95f5so65079967b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 11:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=L4ezA/DdKPqYrQ5cS+Ke2gtcDFDEWQ5+mTqJ9joAzRk=;
        b=GKKENfMfMG4N0pZCcl9OmPXOIcATJjfZsJmDxgzcwEK7KGqwCsad+AWtcOXvaoC0br
         qvO01w86MwzjSygGqi8PA6cojX9dXaSV7GQ7IPy4D+7hoAEyyoJoE4vESGbmz//KocjS
         XInPKVcNcxUU/7v9tYz8Eq3N+worhIjUrPeLT3iGbzfEm71MChhnFLrlat60IF4TyfFg
         cT/sx9cN16Dq7Csnqgd8AQwbf9+2MwGgrR42iD3xwMMpBpotxh+QKt5ySOsx98KoL0iq
         FNYiUMi+Hv+PIq3dZA5NAAwxArkgkUL/euE7T+pJZglO6ldDOiv8hb2KxyDrVWXCBL/Q
         MOaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L4ezA/DdKPqYrQ5cS+Ke2gtcDFDEWQ5+mTqJ9joAzRk=;
        b=M5cfRwq+l+W4yXqWc0hQTsRPfqj6pY/McUxsy5hMjrmKvnZuXRTslB4MmAHlcP0OCQ
         4/lRZBJTPlq2b9IWxW1tyxCDaBRZ7jJVcAxTx5Bol7lrsKCMurIa8dPkrw4oKjRR3h7q
         18fzREke0DScQe5V+mvdPXZ/LCDlqL8osrGyk9xQTlRQvn4ZnPchlTP6lcQxuboW3Nx/
         3QoObczsOxkAaqIIrYqO1238LdAjHUXCIiFwUJwG732q+g9tqr0Y0Azz/NbMYKUFtrwC
         nPx6XzLKMOJZ+boFo2i+RREim3riebbrX6CIWH6GvMXlqSMkvqizqLhPn8BGCRQri070
         A8Iw==
X-Gm-Message-State: AFqh2kpGJwEqSsf6uB/5ks9KFZo3s1b4nfKyhxVbrOr430Pz0ErlDcCf
	BFKcMbQV16FAJhckPSdvRAgY78cWr9s=
X-Google-Smtp-Source: AMrXdXtaMEzriXRGDDaPyWp6cI2qFr9C55J9V7x8prQAmgawr911NF2wOHqTeINFz8M7FkUN1SViGFe49Jc=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:4e19:be9:c5d0:8483])
 (user=surenb job=sendgmr) by 2002:a25:3c9:0:b0:803:3696:c473 with SMTP id
 192-20020a2503c9000000b008033696c473mr2168756ybd.224.1674848514947; Fri, 27
 Jan 2023 11:41:54 -0800 (PST)
Date: Fri, 27 Jan 2023 11:40:54 -0800
In-Reply-To: <20230127194110.533103-1-surenb@google.com>
Mime-Version: 1.0
References: <20230127194110.533103-1-surenb@google.com>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
Message-ID: <20230127194110.533103-18-surenb@google.com>
Subject: [PATCH v2 17/33] mm/mremap: write-lock VMA while remapping it to a
 new address range
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, Laurent Dufour <laurent.dufour@fr.ibm.com>, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, tatashin
 @google.com, mgorman@techsingularity.net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Write-lock VMA as locked before copying it and when copy_vma produces
a new VMA.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Reviewed-by: Laurent Dufour <laurent.dufour@fr.ibm.com>
---
 mm/mmap.c   | 1 +
 mm/mremap.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/mm/mmap.c b/mm/mmap.c
index 60038c24d836..b3c247073aa0 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -3202,6 +3202,7 @@ struct vm_area_struct *copy_vma(struct vm_area_struct **vmap,
 			get_file(new_vma->vm_file);
 		if (new_vma->vm_ops && new_vma->vm_ops->open)
 			new_vma->vm_ops->open(new_vma);
+		vma_start_write(new_vma);
 		if (vma_link(mm, new_vma))
 			goto out_vma_link;
 		*need_rmap_locks = false;
diff --git a/mm/mremap.c b/mm/mremap.c
index 411a85682b58..dd541e59edda 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -623,6 +623,7 @@ static unsigned long move_vma(struct vm_area_struct *vma,
 			return -ENOMEM;
 	}
 
+	vma_start_write(vma);
 	new_pgoff = vma->vm_pgoff + ((old_addr - vma->vm_start) >> PAGE_SHIFT);
 	new_vma = copy_vma(&vma, new_addr, new_len, new_pgoff,
 			   &need_rmap_locks);
-- 
2.39.1

