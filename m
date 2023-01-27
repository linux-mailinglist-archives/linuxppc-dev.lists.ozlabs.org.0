Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D73967EF28
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 21:05:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P3T8d12qFz3fYf
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Jan 2023 07:05:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=KWtfJ/7x;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3gcnuywykdn8tvsfochpphmf.dpnmjovyqqd-efwmjtut.pambct.psh@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=KWtfJ/7x;
	dkim-atps=neutral
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P3Sdk3hs6z3fLl
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Jan 2023 06:42:18 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-4fa63c84621so66295867b3.20
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 11:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sBLmwmiYmTj+OGGVUcLxhx0PU/jBUoUEJpANG8soAfU=;
        b=KWtfJ/7xIlPNyMbJgMly5Sn2+77Pi3kT3bIKcXhSEYdAbccLPUNTncstNEX89dvAhW
         NM9ImIflxrHOdJ1Mj5fWozRK69MXYGw+crQDfh9Oftap/iRU1kAVPiBZhr/+UuvLj4+U
         4LLcR3mdcWgS75oxY+Q2vGwsrXQ6jEpwNWpRZ0m4MKHrCT8iGAtEZyFhrSxdE7CjPr88
         djL5aWWS3cMBdV/JlcmaRg0LM4Y33l8LwLfoSQoWCllE6I7RGCcpBFSNwKknGwVlLQii
         i5R/yajGZAULuwac7zP2AeGWc0Ux4Tm1rMqU81PAQU3nWhlQVK4py4JD6fzjGBwa6RFE
         gFWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sBLmwmiYmTj+OGGVUcLxhx0PU/jBUoUEJpANG8soAfU=;
        b=rKwPyHFBwBcJc6tQmB/deNp75VY7W4QAiDju3KyWj6pkMky8NGAdwnuX7k+D8MnMAt
         JAc5rb0hZaBzguIgIA5/IkcfZUluHIYsIjLU3TvWkItHOK0F346GZezD+CGHw8tdw0r2
         7qtZQYQXkkc0/r/JPCp5CSYWwE+47EsR4Fi4fehbNQ/l6hDEJyxcUHgPR5Hzs8QaHjMP
         PdnJ1G5guG89SsdK0Ymqkl4WNgPHezAhSAYNDpvfREYyy7YBhfZsS7BXIw3iPwwDwmle
         PJ9stopvU7avKuLBSL9BKBrOkyNj4KlbsJ+TO2GY3CzAzKTq8LggYx74b/DJLZxWdRUU
         i8tw==
X-Gm-Message-State: AFqh2kre8OxYPdLUj/bfh3esNIK+sK7hCzVbcNbM5Z+Kh1AwnRFUa8Y0
	0yH+tXbQgQF3WVi3iBPF0LmNKOAuoaw=
X-Google-Smtp-Source: AMrXdXtj44VmRN6kQLB49pXglCfjpmg9iXCqYgU9gl6+Dl4v+hAma4/0PMDtIg4t8IMM3q4b9OalQWjETEg=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:4e19:be9:c5d0:8483])
 (user=surenb job=sendgmr) by 2002:a81:cd7:0:b0:4dd:9ed1:fba0 with SMTP id
 206-20020a810cd7000000b004dd9ed1fba0mr5011323ywm.265.1674848536283; Fri, 27
 Jan 2023 11:42:16 -0800 (PST)
Date: Fri, 27 Jan 2023 11:41:03 -0800
In-Reply-To: <20230127194110.533103-1-surenb@google.com>
Mime-Version: 1.0
References: <20230127194110.533103-1-surenb@google.com>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
Message-ID: <20230127194110.533103-27-surenb@google.com>
Subject: [PATCH v2 26/33] mm: prevent do_swap_page from handling page faults
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, Laurent Dufour <laurent.dufour@fr.ibm.com>, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, tatashin
 @google.com, mgorman@techsingularity.net, rppt@kernel.org
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
index 593548f24007..33ecc850d3cb 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -3690,6 +3690,11 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
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
2.39.1

