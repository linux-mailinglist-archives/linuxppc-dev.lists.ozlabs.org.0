Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F215A56CC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 00:08:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGl2R04KKz3fr5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 08:08:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=QxyTYU3F;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::449; helo=mail-pf1-x449.google.com; envelope-from=35i4nywykdjcjli5e27ff7c5.3fdc9elogg3-45mc9jkj.fqc12j.fi7@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=QxyTYU3F;
	dkim-atps=neutral
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGk544YBmz3bk9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Aug 2022 07:26:00 +1000 (AEST)
Received: by mail-pf1-x449.google.com with SMTP id i3-20020aa78b43000000b005320ac5b724so3587981pfd.4
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Aug 2022 14:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc;
        bh=TWnM2nl+IWV2Xsj5xnZFMNMq0JvYeydCw4P9njL7O34=;
        b=QxyTYU3FERVCw2VziTt0AktgHLl//+1LB6ej8pZ2s1TWfQT3cvsAWfnuU7caTHeT9p
         cUZ3ty459UM3cwcXwNVqpzu7fZxDdvEiQ7oppDRkd/R2+Ilj86/8iy+0q3ZJXoZ4hnye
         zLhHEgIO/fbjIHEiSfoXxsUyX6O+Z8dic5XVruk2KEpor5fjgGmf4uNln1+WOsbYbTO8
         1++i5QRJ3Dh2yxyVyOmY5Dm8Y1A3ze3Xt4uhd4NBeKcnHbK+ENDvs3AO4SaOBTp9Wi+f
         EGkkrDdrwisqruuTTVNnHMbKcZefZFlW3jnAC7mX9edrYOzqBxLpV3pgyWig/2c0mbAr
         sZlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=TWnM2nl+IWV2Xsj5xnZFMNMq0JvYeydCw4P9njL7O34=;
        b=Zh7jZe4qkQRv7tGjHzrmDThm1X5+lq36Rk5j415xzlO/wfg9ZONR7/VQ5GlyXyvfCO
         kV7+FszXjSrHzGs3pPaU1vi/iV8O12nO2HDgt385+sMSliOG1juhT4FpBf7sCJtUiGBH
         0oYG5y1E9Q99xd8XmAmfyFpWDFGHfYyymW4yR3luk4Z435xRvXTiRrY7ciL2hg6b8+iL
         O/upwry4VI8UNXig6/uV8sqvckCB2zafgFVEp/xlXNlwYdootkKGsFwpPF2LMPRTmkCR
         kJbWZ3hRD6dIkAM7yIyPEPZIsb48o3UWQrBx2MdehnapoPBWghl9h+e4YcvQIA9H+rQV
         JxRA==
X-Gm-Message-State: ACgBeo1QSpsEmZr592GqPbMXIOIgB4/dEo0/eIIy8X+CFrdqc4zh2+M+
	0E6W/sTYD6g+hP9AKlN0I00upkEXzQc=
X-Google-Smtp-Source: AA6agR76cA5Bw6pPdfILXZxKwAftwtVJj++YaWYUCk6VRMlDSa2HJ+OTsxxi3Jretb4HksKEr9YwTk9TbU4=
X-Received: from surenb-spec.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e30])
 (user=surenb job=sendgmr) by 2002:a17:903:18b:b0:16e:f09c:919b with SMTP id
 z11-20020a170903018b00b0016ef09c919bmr18604991plg.135.1661808358173; Mon, 29
 Aug 2022 14:25:58 -0700 (PDT)
Date: Mon, 29 Aug 2022 21:25:15 +0000
In-Reply-To: <20220829212531.3184856-1-surenb@google.com>
Mime-Version: 1.0
References: <20220829212531.3184856-1-surenb@google.com>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Message-ID: <20220829212531.3184856-13-surenb@google.com>
Subject: [RFC PATCH 12/28] mm/mremap: mark VMA as locked while remapping it to
 a new address range
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 30 Aug 2022 08:01:45 +1000
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, jglisse@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, paulmck@kernel.org, riel@surriel.com, liam.howlett@oracle.com, luto@kernel.org, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, mgorman@techsingularity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Mark VMA as locked before copying it and when copy_vma produces a new VMA.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 mm/mmap.c   | 1 +
 mm/mremap.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/mm/mmap.c b/mm/mmap.c
index ade3909c89b4..121544fd90de 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -3248,6 +3248,7 @@ struct vm_area_struct *copy_vma(struct vm_area_struct **vmap,
 			get_file(new_vma->vm_file);
 		if (new_vma->vm_ops && new_vma->vm_ops->open)
 			new_vma->vm_ops->open(new_vma);
+		vma_mark_locked(new_vma);
 		vma_link(mm, new_vma, prev, rb_link, rb_parent);
 		*need_rmap_locks = false;
 	}
diff --git a/mm/mremap.c b/mm/mremap.c
index b522cd0259a0..bdbf96254e43 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -620,6 +620,7 @@ static unsigned long move_vma(struct vm_area_struct *vma,
 			return -ENOMEM;
 	}
 
+	vma_mark_locked(vma);
 	new_pgoff = vma->vm_pgoff + ((old_addr - vma->vm_start) >> PAGE_SHIFT);
 	new_vma = copy_vma(&vma, new_addr, new_len, new_pgoff,
 			   &need_rmap_locks);
-- 
2.37.2.672.g94769d06f0-goog

