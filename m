Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B625698C17
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 06:35:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHNvD36rCz3fY2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 16:35:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ClKHnTmR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3rbztywykdaqwyvirfksskpi.gsqpmry1ttg-hizpmwxw.s3pefw.svk@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ClKHnTmR;
	dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHNX06BPhz3cKv
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 16:18:40 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id r39-20020a25ac67000000b0091231592671so887412ybd.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 21:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jGkERMphMFi5DTXO6AzCtASC+DQ2dhGXIGrkfltmA+k=;
        b=ClKHnTmRqrwFsiwdvZoHbs8UrIxrOZcnAlLMKj0DmY4EeItAiZvM3xF/1XkOIILsHj
         t/ncp3cCJ608udelXLFUJi2J2Bkc4zBNFEFw7AtqnW62B+1ruBsojOMJ+l//Eveg6kMb
         9mESDdWGEfVZo4wbqdchVNx7evryh4U8zH6lvFtZPteOd8Fw20lUCwc+q1jxjD4dRCfO
         fPscX4k3EE8nShVcC7jG6Imy8fv3tD4a5LzQcDPbvgxMAF9FYu61sb1sXCbMYbbYMnzw
         H0gcnPTwNkiDCSFpe5MW+pIUr82O7ftWGw19nAsT/pwTKfJQo1rJfp9QBdZ/qdttHeJW
         nqYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jGkERMphMFi5DTXO6AzCtASC+DQ2dhGXIGrkfltmA+k=;
        b=NTk4VGACon5QKqEsFvOk2y8tHAYKgQ9aBZiMppaavFrPPfg1cv7fVeNph7XFrWzeqx
         clh9tMinhdxRiuJtfbCnpT3pQsxOlIva2WEaO2LOgFKfl4eImFIHzHxb94kA+eDcIsO5
         8HiUBrOjL53pMA4KMbd/F4vPaBnmjpFAXUzOSXrf8LWOa/tF1J+JSthmgvywiiTc2FrW
         SEopayvcKt6VZLvpPzefvh2MS6lzLy/8D4+J/dmfhx8k/bIgQVYdexDGLjCA4A7gUKk4
         vSB3o31aVrAmLmNN+OPLsTRRuPDqVwJXfaz6OHs3qGbeNjzhtbdovA4lbeqVQD4Ap5w2
         At9g==
X-Gm-Message-State: AO0yUKVcob9DyysK5YXRGYyjqwPe38iytFxyA9TqECKsAVCWqi2EnpW6
	IimqaTqNklNdGnb3wuk0fbc3O8nH4SQ=
X-Google-Smtp-Source: AK7set+tNlKzQOXitoUESk90msiy2FCUMsrjKiA2Q/PTOw27FiKf0wEmZgQspJdrm7P++s7G3RI15C4Nebc=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:f781:d5ed:1806:6ebb])
 (user=surenb job=sendgmr) by 2002:a81:ac54:0:b0:52f:45a:5b00 with SMTP id
 z20-20020a81ac54000000b0052f045a5b00mr11ywj.2.1676524717784; Wed, 15 Feb 2023
 21:18:37 -0800 (PST)
Date: Wed, 15 Feb 2023 21:17:33 -0800
In-Reply-To: <20230216051750.3125598-1-surenb@google.com>
Mime-Version: 1.0
References: <20230216051750.3125598-1-surenb@google.com>
X-Mailer: git-send-email 2.39.1.581.gbfd45094c4-goog
Message-ID: <20230216051750.3125598-19-surenb@google.com>
Subject: [PATCH v3 18/35] mm/mremap: write-lock VMA while remapping it to a
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, chriscli@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, Laurent Dufour <laurent.dufour@fr.ibm.com>, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, michalechner92@googlemail.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, Suren Baghdasaryan <surenb@google.com>, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstr
 eet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, tatashin@google.com, mgorman@techsingularity.net, rppt@kernel.org
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
index f079e5bbcd57..0eaa3d1a6cd1 100644
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

