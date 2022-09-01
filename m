Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1B15A9E7B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 19:51:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJTBD3F3Fz3gCl
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 03:51:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=O6gzuYJN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3mu0qywykdnclnk7g49hh9e7.5hfebgnqii5-67oeblml.hse34l.hk9@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=O6gzuYJN;
	dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJSrw5Xbpz3c1Q
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 03:36:32 +1000 (AEST)
Received: by mail-yb1-xb4a.google.com with SMTP id h9-20020a256c09000000b0069671af62ecso4908506ybc.4
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Sep 2022 10:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date;
        bh=e91/L3Bkt1w9DT3T0Co0rdM+lRiTKLDE/Mz2x0qV8w8=;
        b=O6gzuYJNv3OY1tULNg+rSFd+sWkIjQSaV6yE8xAfnZPN1YTVFfR+wvj2NeC2hBY0+k
         GIVWJsEk2y8yIAo13lsMU4IUJIgKbBiJ1vv+1z7dNT8xT+lTOjC6URMO5pLiEVmaefML
         PewWj9g+Vcp5HQ91HsRQ365b/kw+OZnJbC/u2QqpxScDN6oJLilMCO5pf8M9kEkOXKy8
         kK1hF6rXLpQy+lNimDC91Nhhjc7ZyM02kAhq+89cKu94J6/Mxp9HnTyvO1IKLxhNY5UV
         lVIZFG9WwP01TdBwwmdFuCPUOkErkzSY1WgEGRWny4u3kPuzbkYMq5itJGF6CAoS3las
         sKWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=e91/L3Bkt1w9DT3T0Co0rdM+lRiTKLDE/Mz2x0qV8w8=;
        b=QGjLsGgxSJzQ9Yeu90STMlthNwMv4Pvc3OvpolHX7URGPXqGMRI2TBdujquLAnWSVe
         9c6WlqzDqeQrIIqaeS/mvR7gvKh6ycwU8Em+8cMJ+mbCd8egBsSj+9wzlHeBN+pBRDgY
         UBQGRIEogKRP6esLWEq1CJRmKNLfVYHhCzoDG5XJ+CfP7eBM5qgoHUy8O10fqGVImU6c
         a0M6W9V6dyHywXCsECx0z+Y3JUnAqvbrP7FYyVQuMmzpx4LngBNx/MwCEysWv83HHwgG
         6Sd1bfGjqCao4bbx7gUQLYFfqRo3rW4IcoEJM6whvac51JqRm3aJumV9r77X4NqNhiUA
         MbKQ==
X-Gm-Message-State: ACgBeo1tnNoEaFpUulWlrtsL8ADtU5QlXo5WsR3NrRia6Uh9lyxZptou
	xwwZ9LcLH2XRDbZbkTUXQOBXx4nJ3Ug=
X-Google-Smtp-Source: AA6agR6JzhhY8hWMnjFDm/o9DPxBMt9dAFxOiR6uxCkipERPD2P+sojVgosImEy5Q2VS3ZGfPJeoFsIcTII=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:1bfc:e7ee:6530:4449])
 (user=surenb job=sendgmr) by 2002:a05:6902:154d:b0:695:d8b4:36b2 with SMTP id
 r13-20020a056902154d00b00695d8b436b2mr21142474ybu.599.1662053786750; Thu, 01
 Sep 2022 10:36:26 -0700 (PDT)
Date: Thu,  1 Sep 2022 10:35:13 -0700
In-Reply-To: <20220901173516.702122-1-surenb@google.com>
Mime-Version: 1.0
References: <20220901173516.702122-1-surenb@google.com>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220901173516.702122-26-surenb@google.com>
Subject: [RFC PATCH RESEND 25/28] arm64/mm: define ARCH_SUPPORTS_PER_VMA_LOCK
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

Set ARCH_SUPPORTS_PER_VMA_LOCK so that the per-VMA lock support can be
compiled on this architecture.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 arch/arm64/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 9fb9fff08c94..0747ae1f3b39 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -93,6 +93,7 @@ config ARM64
 	select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
 	select ARCH_SUPPORTS_NUMA_BALANCING
 	select ARCH_SUPPORTS_PAGE_TABLE_CHECK
+	select ARCH_SUPPORTS_PER_VMA_LOCK
 	select ARCH_WANT_COMPAT_IPC_PARSE_VERSION if COMPAT
 	select ARCH_WANT_DEFAULT_BPF_JIT
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
-- 
2.37.2.789.g6183377224-goog

