Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA0467EED2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 20:54:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P3SvC2D7wz3fcm
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Jan 2023 06:53:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=nhjpt9Vb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3-sjuywykdmay0xkthmuumrk.iusrot03vvi-jk1royzy.u5rghy.uxm@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=nhjpt9Vb;
	dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P3Sd74ddlz3fHM
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Jan 2023 06:41:47 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id u186-20020a2560c3000000b007c8e2cf3668so6396650ybb.14
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 11:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=icGEQDhVNg8AQkGt0Dau1cb43VWZWeb/kUxMjHSAwGA=;
        b=nhjpt9VbHDPsHYg33OlJfuq5Iz35VmBZ3kiMxPcXRXZZYdOboFlR0spKtxfGWFFcLn
         eBkIzKgB8QHaANcEzDHfkdLN1fRlxg2tqUBsMTv/7fNevBLbu/43ueowkRgVsLx1vLRo
         uHdRFKLtGeWmcojM55WkW4Vbk+IWqqj37nvYWjKvQOLDRhcdlXynMiveqJDQteuGpWZz
         ETc6Sup2efRPDAlMWE74qe3dlQIJeV8JWIsag7a7AlDm28r/breAdd9LIL/XkRDxD2X3
         yud8bBPMeadGbrZ7ftbCoegvJj4wUFszXo3BfVZSLdIr/XgKY9tYqvkkj2bzILo8Fvtn
         ItZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=icGEQDhVNg8AQkGt0Dau1cb43VWZWeb/kUxMjHSAwGA=;
        b=gczAYxAa7sNaVhfTuvU7ksWjVxUs2wpYnLX9cU/BweaKLxY26doHsLJ0S3QwzsQjkn
         ue0t35TJZXl5Sl9XtMhiw7SUjFfnLiq/1CjC5gXjdheMEsU3zgpkKeiza38IdL3vThgP
         pBSs97FV2G53bZIRbAnS51KuXfUjL+5KT6QVZOd5osijfVTGvIpbRAjq2NR3yuBgZScV
         /aFwP4A9BL49ByxLbL4yfrHWotCfjjZ+WBqgfbMswKZIFocouvXl8pRLzdSD/kQvve1Y
         JSYctczWPwNSQa37VZsCEpT9LjVz8JGEe9GCwVisrCFIiFTvJxWeMtbE0k7wc7imC2SE
         mQgQ==
X-Gm-Message-State: AO0yUKWjMLkwyt14zhUkv/L9x0a/WuXxCqwsQ1X9F7tpOTf12GbjJiDy
	GiZhCBGaxwcfF/VnsPVMBvokDj1G+ME=
X-Google-Smtp-Source: AK7set+R/81FxpFmvdAm43AdDVGV+lMO8EmoQcyFeqmQ4bL2GAdYwzTWfE7122Mwrx91JEcHzv5APn9iCmY=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:4e19:be9:c5d0:8483])
 (user=surenb job=sendgmr) by 2002:a81:48cb:0:b0:506:4c8b:231e with SMTP id
 v194-20020a8148cb000000b005064c8b231emr1848392ywa.80.1674848505193; Fri, 27
 Jan 2023 11:41:45 -0800 (PST)
Date: Fri, 27 Jan 2023 11:40:50 -0800
In-Reply-To: <20230127194110.533103-1-surenb@google.com>
Mime-Version: 1.0
References: <20230127194110.533103-1-surenb@google.com>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
Message-ID: <20230127194110.533103-14-surenb@google.com>
Subject: [PATCH v2 13/33] mm/mmap: move VMA locking before vma_adjust_trans_huge
 call
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

vma_adjust_trans_huge() modifies the VMA and such modifications should
be done after VMA is marked as being written. Therefore move VMA flag
modifications before vma_adjust_trans_huge() so that VMA is marked
before all these modifications.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 mm/mmap.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mm/mmap.c b/mm/mmap.c
index 9efe13d36df7..7467d691e357 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -2910,11 +2910,12 @@ static int do_brk_flags(struct vma_iterator *vmi, struct vm_area_struct *vma,
 		if (vma_iter_prealloc(vmi))
 			goto unacct_fail;
 
+		/* Set flags first to implicitly lock the VMA before updates */
+		vm_flags_set(vma, VM_SOFTDIRTY);
 		vma_adjust_trans_huge(vma, vma->vm_start, addr + len, 0);
 		init_vma_prep(&vp, vma);
 		vma_prepare(&vp);
 		vma->vm_end = addr + len;
-		vm_flags_set(vma, VM_SOFTDIRTY);
 		vma_iter_store(vmi, vma);
 
 		vma_complete(&vp, vmi, mm);
-- 
2.39.1

