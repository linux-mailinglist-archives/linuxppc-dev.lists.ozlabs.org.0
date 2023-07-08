Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCE074BEE4
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jul 2023 21:13:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=e+tppejd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qz0KG2q41z3bvd
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Jul 2023 05:13:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=e+tppejd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3d7wpzaykdew685s1pu22uzs.q20zw18b33q-rs9zw676.2dzop6.25u@flex--surenb.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qz0JP2qkyz2xdq
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Jul 2023 05:12:19 +1000 (AEST)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-c5a479bc2d4so3489843276.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 08 Jul 2023 12:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688843536; x=1691435536;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JxWcwQCt64OXVUnpGWZTSfPA4gPHWHeYyOn+4bzO86s=;
        b=e+tppejdoz5kN8B3C5WlD+0nrZGu/5EqfAONbG0hP/lWZ7G+LSD9YpK/YdiONHY+ET
         COyN68AHpyc5cvZcCJI9Kdj/VXVTOhzXyqaYxVOU/XE8oiqZCtvDT9Ohjc4lwpKs8uIs
         Q4SGdk/Hg/xVzMRwTNMA5Eb7fUdiGxUNFD+tTkYwspdAJA3H1WkY5sp8/o9lg62jTXI9
         vPMevfc26zzweXBMLZnrlY/VDaPVf886Cj6pjLGQXsKtCnCzJ7R7L8Gjg1qP169pUZdf
         1fQiHyVHhW2J/bG8DUWZndT612qIhsJaOJnKsT3WA5FG5hybdpqBg5J7YK8LJ6GcI8+m
         tGNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688843536; x=1691435536;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JxWcwQCt64OXVUnpGWZTSfPA4gPHWHeYyOn+4bzO86s=;
        b=U91GHLOlZ8z29w/SwY8BA61bC8fCl3J6GeljPRHR7FloPyN8wGuo3IaJ3pQF7em5vi
         pqq0sxpbyIpkMyoDpSfrvzg23Q99caF44LE8ucq9NfTWN4bTG63Sdf4Aag+g5qIfDr6D
         ejgTViQoqZDrAkgOTbwse+a5xsSxDcnoCPgUEmxGKiBvxjmEMXhq+TR7Je/uCpbB4AGQ
         rDD/BZQuFVQCvsn4YtkEyMtkMJa6nLewdgVkp19QjnguJE9hx3ZILyddNKD66sBFCYn2
         1lWwO6nGVEMlmOSIVebOILDeDNraaAAAf6gGj9D0G933h+WytEvalxF1B2n4sGvVNUGk
         irFw==
X-Gm-Message-State: ABy/qLZTCifmCWe6pvyWf2z5T3AhgHu0/a0cKD+2FpeNondl5bVq/tIv
	JdEpectTX7T+BUS8xft3TMax8vKIeMQ=
X-Google-Smtp-Source: APBJJlHhdNayqx2O2N+8ynu4MlCffNN+ZnIRARK/gUWveaZn8/1xJL36UJUekD5xd/lYzHt6QBE2wx7GXfo=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:201:6f0:5193:79db:25b3])
 (user=surenb job=sendgmr) by 2002:a5b:10e:0:b0:c39:d6f6:481f with SMTP id
 14-20020a5b010e000000b00c39d6f6481fmr73329ybx.10.1688843535891; Sat, 08 Jul
 2023 12:12:15 -0700 (PDT)
Date: Sat,  8 Jul 2023 12:12:10 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.41.0.390.g38632f3daf-goog
Message-ID: <20230708191212.4147700-1-surenb@google.com>
Subject: [PATCH v2 1/3] mm: lock a vma before stack expansion
From: Suren Baghdasaryan <surenb@google.com>
To: torvalds@linux-foundation.org
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
Cc: jacobly.alt@gmail.com, regressions@lists.linux.dev, david@redhat.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, liam.howlett@oracle.com, Suren Baghdasaryan <surenb@google.com>, linux-mm@kvack.org, peterx@redhat.com, regressions@leemhuis.info, willy@infradead.org, bagasdotme@gmail.com, stable@vger.kernel.org, akpm@linux-foundation.org, ldufour@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With recent changes necessitating mmap_lock to be held for write while
expanding a stack, per-VMA locks should follow the same rules and be
write-locked to prevent page faults into the VMA being expanded. Add
the necessary locking.

Cc: stable@vger.kernel.org
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 mm/mmap.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/mm/mmap.c b/mm/mmap.c
index 204ddcd52625..c66e4622a557 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -1977,6 +1977,8 @@ static int expand_upwards(struct vm_area_struct *vma, unsigned long address)
 		return -ENOMEM;
 	}
 
+	/* Lock the VMA before expanding to prevent concurrent page faults */
+	vma_start_write(vma);
 	/*
 	 * vma->vm_start/vm_end cannot change under us because the caller
 	 * is required to hold the mmap_lock in read mode.  We need the
@@ -2064,6 +2066,8 @@ int expand_downwards(struct vm_area_struct *vma, unsigned long address)
 		return -ENOMEM;
 	}
 
+	/* Lock the VMA before expanding to prevent concurrent page faults */
+	vma_start_write(vma);
 	/*
 	 * vma->vm_start/vm_end cannot change under us because the caller
 	 * is required to hold the mmap_lock in read mode.  We need the
-- 
2.41.0.390.g38632f3daf-goog

