Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2E85A9E5F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 19:45:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJT2t0lnhz3fXw
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 03:45:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=TCOmQuZ0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=3ge0qywykdl4wyvirfksskpi.gsqpmry1ttg-hizpmwxw.s3pefw.svk@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=TCOmQuZ0;
	dkim-atps=neutral
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJSrN1qWCz2y84
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 03:36:03 +1000 (AEST)
Received: by mail-pl1-x649.google.com with SMTP id m5-20020a170902f64500b0016d313f3ce7so12311746plg.23
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Sep 2022 10:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date;
        bh=jyHdLFPHMbjXGLnwUzIxKnvlA/GbLLDhxKEqR7mLfqg=;
        b=TCOmQuZ0ealmr2rj6cwh5S5dr2tHdE6kJbl5yIAByz1pqanqNTRiefLGtYBY7Bfwis
         HCiC64ttZOFWEgwG30yQXn+Yd1NgQ1aDGCJSNFZhazZq9lt7mplm3W+aibX2RLK/lLN0
         uAX/ZCVxAoOvxpbxeS81kOPFHzixGFCJRTo1WJXrfNWNtHfKZEdnfDSt0EcuBcHbmrUl
         KJFv/JkMarGz2fGZyZ6GmZqZcaDNiv8ls/HHTwoDoMD28NmijZHaa+6d5o2vJqrlXSFO
         lKUsBOqEBkv1O0j454aqLOLj6gi+Hg3Qlj1nIC3dhAGDngGkgQrOdGW8W2dVGnwocfag
         do3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=jyHdLFPHMbjXGLnwUzIxKnvlA/GbLLDhxKEqR7mLfqg=;
        b=HuqhZTwmre70PZroK9h6tUJrEXKyBX0mFwMWB7SX9XHEUFP/ihUcSoWqk3osqxNkN6
         XgJya7EIevByt1ng6kd1Y4JAGjU+4mQJ9Z0eY7r18f4lP7VaYDraeW1oRQJubaH7ZWDd
         x0z5T/cKcndlcylYFEt8JAfNoSul8w6Oi3F3WH5kTbNBeP2KYBQmsDzMND9WkZiHA3km
         RiV9okdf05gOBi9Hn4AHj+KGKkhFAacvLdHeO2u79DqEj1BriNoJePQ11Wim554dOqM4
         DDPSQTZZouIKEgdxVH9YCbuUVXvs8VuoGg2ICtgVNgNFRfhiA33e49xhXBOEApqJtLbP
         csSw==
X-Gm-Message-State: ACgBeo07wTKK19CRmD3LLD+FSVYM7HYgJuwRxIGLIXmnt4QQ2w8HRvSJ
	Ga6EHP/1oepT2lH8SsCeTQTAJC7McOo=
X-Google-Smtp-Source: AA6agR4mIrBI+VqdmK9XxquJrzUivZu8ctMQy2Mh5DPiMdzbr+5VMUvdiKSOqW1XRdAe5w+IQuXOVrbXRFY=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:1bfc:e7ee:6530:4449])
 (user=surenb job=sendgmr) by 2002:a63:2cc2:0:b0:41c:681d:60d2 with SMTP id
 s185-20020a632cc2000000b0041c681d60d2mr26204273pgs.502.1662053761168; Thu, 01
 Sep 2022 10:36:01 -0700 (PDT)
Date: Thu,  1 Sep 2022 10:35:03 -0700
In-Reply-To: <20220901173516.702122-1-surenb@google.com>
Mime-Version: 1.0
References: <20220901173516.702122-1-surenb@google.com>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220901173516.702122-16-surenb@google.com>
Subject: [RFC PATCH RESEND 15/28] mm/mmap: mark adjacent VMAs as locked if
 they can grow into unmapped area
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, jglisse@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, laurent.dufour@fr.ibm.com, mgorman@suse.de, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, paulmck@kernel.org, liam.howlett@oracle.com, luto@kernel.org, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, linux-arm-kernel@lists.infradead.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While unmapping VMAs, adjacent VMAs might be able to grow into the area
being unmapped. In such cases mark adjacent VMAs as locked to prevent
this growth.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 mm/mmap.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/mm/mmap.c b/mm/mmap.c
index b0d78bdc0de0..b31cc97c2803 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -2680,10 +2680,14 @@ detach_vmas_to_be_unmapped(struct mm_struct *mm, struct vm_area_struct *vma,
 	 * VM_GROWSUP VMA. Such VMAs can change their size under
 	 * down_read(mmap_lock) and collide with the VMA we are about to unmap.
 	 */
-	if (vma && (vma->vm_flags & VM_GROWSDOWN))
+	if (vma && (vma->vm_flags & VM_GROWSDOWN)) {
+		vma_mark_locked(vma);
 		return false;
-	if (prev && (prev->vm_flags & VM_GROWSUP))
+	}
+	if (prev && (prev->vm_flags & VM_GROWSUP)) {
+		vma_mark_locked(prev);
 		return false;
+	}
 	return true;
 }
 
-- 
2.37.2.789.g6183377224-goog

