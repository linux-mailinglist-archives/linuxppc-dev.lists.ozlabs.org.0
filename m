Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A078C5A56D6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 00:12:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGl6z3YK9z3fw3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 08:12:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=f8ZHy6Ci;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=38i4nywykdkmvxuhqejrrjoh.frpolqxassf-ghyolvwv.rcodev.ruj@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=f8ZHy6Ci;
	dkim-atps=neutral
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGk5H5mZSz3blf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Aug 2022 07:26:11 +1000 (AEST)
Received: by mail-pl1-x649.google.com with SMTP id z14-20020a170903018e00b00174fff57d17so978960plg.14
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Aug 2022 14:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc;
        bh=K93TFWAb7JwQdWCvuFbBF/NwLgqzppA/TxAstG/QPvU=;
        b=f8ZHy6CiTcDXROb3pFMLfetBSV+kFVTeZws7OjDiiohYptMrJjGynWZ4jN+J/j3SJj
         dCEDPAmPkmnX5B3X46hqeY2mb8ZvMpLB7j64gw3uDHSYMAUM2B6ucp8KKPug6MxLnEu7
         BmebG6DC6czjsVXnb7ENc9u7p9QGYJElvc7qRNsIMqXvgjewnR2ulhT9EyPiZ2zz1B9D
         56/cpf1MfCjBxFK5vFsjvAIH2zjjfVoYxcmJWgmvbc3eCKVdp1qhJM+tuigQjNUJJMgZ
         jrHBPRDF7lp+rxYzH8zskIPXprMRBcWxeh9qo4POOeyeUnThUPILDVIwum49CxVeKLEs
         T9zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=K93TFWAb7JwQdWCvuFbBF/NwLgqzppA/TxAstG/QPvU=;
        b=1jywps87+x5BS9WQvXJ/tivOCuOUsNOt0sEQlZ9judOyRT9WI3uJ1RkxfolHV72y1H
         8n6VEW+5D9LZ4gyoGAS1ikhSJB2wFeWP9d45WtHHNF0lexUPRn1UzAPqV/nIme9pGrMk
         9ovv22Is0cQDenjN+pnGslNie3tPCRGOD2O+lm5qCOInt2dnVFhezb0IXq6GaM+UCpjJ
         gaDLkxVMjerY/VUzjtamlMiEc48Cz0e1l7q7TIVprgTw6MBYFCb9FF+TJYvhmQobVJUx
         S0/NMBcygOZ+2FX2DNVKQLTO6Cz2hh/80TV4AffUd6hCkFhiXiBlT/fl6Jpt9+ncKpCD
         ZrrQ==
X-Gm-Message-State: ACgBeo2sUj5OlcZehQ+XKddxdUM0+87uJI+ASjAmMwhHtvw9UsEdpoUo
	W0rVIRgolSE7pyLa1zQrYxVevndnRpU=
X-Google-Smtp-Source: AA6agR7nf9+ItGZZ0+7hqrcNY7xNhTop6ny3nOph/OxIOFh5WmAm4Kp1l2Jp+ca/L6EEvcmkimt0snMwAs0=
X-Received: from surenb-spec.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e30])
 (user=surenb job=sendgmr) by 2002:a17:902:b094:b0:173:12d1:4ece with SMTP id
 p20-20020a170902b09400b0017312d14ecemr18383730plr.117.1661808370030; Mon, 29
 Aug 2022 14:26:10 -0700 (PDT)
Date: Mon, 29 Aug 2022 21:25:22 +0000
In-Reply-To: <20220829212531.3184856-1-surenb@google.com>
Mime-Version: 1.0
References: <20220829212531.3184856-1-surenb@google.com>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Message-ID: <20220829212531.3184856-20-surenb@google.com>
Subject: [RFC PATCH 19/28] mm: disallow do_swap_page to handle page faults
 under VMA lock
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

Due to the possibility of do_swap_page dropping mmap_lock, abort fault
handling under VMA lock and retry holding mmap_lock. This can be handled
more gracefully in the future.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 mm/memory.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/mm/memory.c b/mm/memory.c
index 9ac9944e8c62..29d2f49f922a 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -3738,6 +3738,11 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 	vm_fault_t ret = 0;
 	void *shadow = NULL;
 
+	if (vmf->flags & FAULT_FLAG_VMA_LOCK) {
+		ret = VM_FAULT_RETRY;
+		goto out;
+	}
+
 	if (!pte_unmap_same(vmf))
 		goto out;
 
-- 
2.37.2.672.g94769d06f0-goog

