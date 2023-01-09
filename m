Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD216632C1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 22:22:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrRk8733tz3fnF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 08:22:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=i8mCfCut;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3i3-8ywykddgmolyhvaiiafy.wigfchorjjw-xypfcmnm.itfuvm.ila@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=i8mCfCut;
	dkim-atps=neutral
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NrR5x2QqHz3cQV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 07:55:01 +1100 (AEDT)
Received: by mail-pj1-x1049.google.com with SMTP id om16-20020a17090b3a9000b002216006cbffso7876854pjb.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Jan 2023 12:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wzUeswsih4PBYsAGoTi9IuotyhbGAzkWIDmV0FovK6Q=;
        b=i8mCfCut8WK6+zjWPXPrBAn0OVK3TZZqUir2pgpkQNWhenu43X3/akUsts/8WrGL5U
         Ag1lqNnPrK3Lht8c6bYeEHv2p/KYkV84L0N5RKup3Lqh7FNgEiwz2qb9iAaK8aobnie5
         SWRp3Ej3gvy6Gx0qa+UPT0Wm9SDIcbH9qbkEiBwV9a/y0P6JGxAF3x2bjosqkuWs4x2Q
         7wdZhW31F8FFO8VMgBTx/6RIzfF9caT2DmPvdENgd9fKarg0jWwQoD/+83rrhQbpzEQp
         l4T3tmRoZNr6BoK1+IwDWlh9AP60sfKufgosjp9Mre5rIBM3jgdbCDpmS0FgJglfxzEq
         wvVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wzUeswsih4PBYsAGoTi9IuotyhbGAzkWIDmV0FovK6Q=;
        b=m0qw1HpdvM7K+nKhugVqH6DnGEdwLkjFNiS2OnxiRmqKevFjmWTZiOskpgfQTiElKP
         odaexAJ24gtPXRe6KxhR6GM7BWDMJxZwSSVuuirlNCCT5im0GKlxMD6QOYn5df1cfWTu
         VELq6V/DZHdDIyU+xESyCadqddZN6G+Qmo5CjFdrvLp+qUe4I3Ovl/nv4iwVvDbxx2dh
         3Eyz+VgGNRisE/922/9JZgrwxfjJp/GFs+wT22vTLg24wrIWAYAGKP5NtzoB+GKPxgRN
         wW42hBUQS48pYta1Me3rmu43JYNUBPOpr+eDjpiYZyyZRIC5U+OrtGykx5s/DZ5CU8dO
         w1LA==
X-Gm-Message-State: AFqh2koT5jqBqlQPqrwpBY9WWbcgULMBBN0ftcx1YXyl9NNqeqmztYlC
	whYyx6Ge6aMkRpMNCHPzlFD89nFTnkw=
X-Google-Smtp-Source: AMrXdXtXcDh9ACK+yDPMFgwqnCidD6d48HBoOS8XbTQx42HB6Mm5GZSyonzBvXPdXaN+wlg8/pxMUTj5geU=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:9393:6f7a:d410:55ca])
 (user=surenb job=sendgmr) by 2002:a17:902:7d8a:b0:189:754b:9d9c with SMTP id
 a10-20020a1709027d8a00b00189754b9d9cmr4530740plm.120.1673297699405; Mon, 09
 Jan 2023 12:54:59 -0800 (PST)
Date: Mon,  9 Jan 2023 12:53:26 -0800
In-Reply-To: <20230109205336.3665937-1-surenb@google.com>
Mime-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20230109205336.3665937-32-surenb@google.com>
Subject: [PATCH 31/41] mm: prevent do_swap_page from handling page faults
 under VMA lock
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, tatashin@google.com, mgorman@techsingu
 larity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Due to the possibility of do_swap_page dropping mmap_lock, abort fault
handling under VMA lock and retry holding mmap_lock. This can be handled
more gracefully in the future.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Reviewed-by: Laurent Dufour <laurent.dufour@fr.ibm.com>
---
 mm/memory.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/mm/memory.c b/mm/memory.c
index 2560524ad7f4..20806bc8b4eb 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -3707,6 +3707,11 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 	if (!pte_unmap_same(vmf))
 		goto out;
 
+	if (vmf->flags & FAULT_FLAG_VMA_LOCK) {
+		ret = VM_FAULT_RETRY;
+		goto out;
+	}
+
 	entry = pte_to_swp_entry(vmf->orig_pte);
 	if (unlikely(non_swap_entry(entry))) {
 		if (is_migration_entry(entry)) {
-- 
2.39.0

