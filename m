Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6696D7F41
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Apr 2023 16:22:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ps6Kd4bDdz3fZy
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 00:22:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dcJpf62S;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com; envelope-from=ubizjak@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dcJpf62S;
	dkim-atps=neutral
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ps6D75MYmz3f42
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Apr 2023 00:17:59 +1000 (AEST)
Received: by mail-ed1-x52a.google.com with SMTP id t10so141323317edd.12
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Apr 2023 07:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680704276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tX2Wz3EA82OevW9OfamI7/Kvuo0JRd1kfWWZWf7tBPI=;
        b=dcJpf62STM2t7wBeMFWRHA65D4e8ki42FaDdkuuO3agKqVH6m85Cy4lQ8Jc6WqjxoF
         fnnlug9El9w16kuSLGTsPbq74oNaQ+P8JDxMAcNUZHQhE8u+5jySMEVYMmtE4egR+MrD
         Yo63AeJfrWzh2LWw4CUsO/Jz8F4pDt2KwqewSmosxEslt2xhDsBYXNkotYBZ0u2SUb3b
         bY44Ptodk1vZVbJl1WFw1p9lD7pDptPbaK3ykNtKWYarwScxbwyxAFGsy3vIZ++4+u08
         7sJWtj5rpBofs9g4DRnm1uwhZ6aYf1PTSfC6VMfZ4+8IxgDtdbMLLd8hp6MXeYVptMAQ
         HEzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680704276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tX2Wz3EA82OevW9OfamI7/Kvuo0JRd1kfWWZWf7tBPI=;
        b=6ZH17dBvjGIOCxWWmELfqwwbjWHMz44bUf8YHnS7FSdDb+z0ZArsQPmFXDW0imbHCN
         ZJAfr2gVJPuTPLzzmIeC+OiyurJ/ecVO77IDchTs63a8K/x/iLWwLofgK07+QBHUBFMt
         ST6WAYpO4HmxR78aTfq8gxFLaARPrZBFC4PVUBNzqo4PT3YJacbLcDX4Qzdx2rfgiHeT
         CKtKC2M9bePbXnY546yIzmEmnepsXT6FG9B8dUet65v0RXFYzEUKUob1+291WAbO44W3
         yRCTAlYhwK1U5H0Lt0aNOOokTKDSfhKMr0TP1xG/5JEiHdprg07e+KQVw+EETMigCWUs
         joyA==
X-Gm-Message-State: AAQBX9eqo2y8eoTb7HsPaQfG3ceq8Us1L0lG+RwxiKkROEqavkyxI0rT
	y8ahlSNb7PZNivFFWcXqNG8=
X-Google-Smtp-Source: AKy350ZbYZNSgst5kJdLcblY6mgsM4CglBWBhr5I5xeGEgTa/9eOQOFET04v+j0TrQ94wu4NswT8dQ==
X-Received: by 2002:a17:906:53c3:b0:947:791b:fdcb with SMTP id p3-20020a17090653c300b00947791bfdcbmr2772881ejo.21.1680704276052;
        Wed, 05 Apr 2023 07:17:56 -0700 (PDT)
Received: from localhost.localdomain ([46.248.82.114])
        by smtp.gmail.com with ESMTPSA id g6-20020a170906348600b009334219656dsm7381246ejb.56.2023.04.05.07.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 07:17:55 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: linux-alpha@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org,
	linux-arch@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] events: Illustrate the transition to local{,64}_try_cmpxchg
Date: Wed,  5 Apr 2023 16:17:10 +0200
Message-Id: <20230405141710.3551-6-ubizjak@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230405141710.3551-1-ubizjak@gmail.com>
References: <20230405141710.3551-1-ubizjak@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Uros Bizjak <ubizjak@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch illustrates the transition to local{,64}_try_cmpxchg.
It is not intended to be merged as-is.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
---
 arch/x86/events/core.c      | 9 ++++-----
 kernel/events/ring_buffer.c | 5 +++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index d096b04bf80e..d9310e9363f1 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -129,13 +129,12 @@ u64 x86_perf_event_update(struct perf_event *event)
 	 * exchange a new raw count - then add that new-prev delta
 	 * count to the generic event atomically:
 	 */
-again:
 	prev_raw_count = local64_read(&hwc->prev_count);
-	rdpmcl(hwc->event_base_rdpmc, new_raw_count);
 
-	if (local64_cmpxchg(&hwc->prev_count, prev_raw_count,
-					new_raw_count) != prev_raw_count)
-		goto again;
+	do {
+		rdpmcl(hwc->event_base_rdpmc, new_raw_count);
+	} while (!local64_try_cmpxchg(&hwc->prev_count, &prev_raw_count,
+				      new_raw_count));
 
 	/*
 	 * Now we have the new raw value and have updated the prev
diff --git a/kernel/events/ring_buffer.c b/kernel/events/ring_buffer.c
index 273a0fe7910a..111ab85ee97d 100644
--- a/kernel/events/ring_buffer.c
+++ b/kernel/events/ring_buffer.c
@@ -191,9 +191,10 @@ __perf_output_begin(struct perf_output_handle *handle,
 
 	perf_output_get_handle(handle);
 
+	offset = local_read(&rb->head);
 	do {
 		tail = READ_ONCE(rb->user_page->data_tail);
-		offset = head = local_read(&rb->head);
+		head = offset;
 		if (!rb->overwrite) {
 			if (unlikely(!ring_buffer_has_space(head, tail,
 							    perf_data_size(rb),
@@ -217,7 +218,7 @@ __perf_output_begin(struct perf_output_handle *handle,
 			head += size;
 		else
 			head -= size;
-	} while (local_cmpxchg(&rb->head, offset, head) != offset);
+	} while (!local_try_cmpxchg(&rb->head, &offset, head));
 
 	if (backward) {
 		offset = head;
-- 
2.39.2

