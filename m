Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B0B6AB26B
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Mar 2023 22:06:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVDlx5yJRz3fj5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 08:06:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=AzC0MtpS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com; envelope-from=ubizjak@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=AzC0MtpS;
	dkim-atps=neutral
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVDY159Fhz3cLB
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Mar 2023 07:57:09 +1100 (AEDT)
Received: by mail-ed1-x52e.google.com with SMTP id a25so31042001edb.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Mar 2023 12:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678049829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xOf0dR/RPpY4HJc+yEr00P2lL8nnE6ZdPZ2RnMEV2qQ=;
        b=AzC0MtpS6jzuzYUPFsrIfgSP8aZbYwDqq5a+izUb9a0flhuTk9IJhffPMtswIUk4wO
         sg+KQDUeI1WfTBjEPCVkavJWGZOiRXkonvodFjQekv1AtQJNs5CNYgKk72i8myvpgGVe
         K9+Gcl430QJD9AbzGRenEZ61TH0KIeWK+0iYs+J05wVbAMYgv5sIn3w1+Cwy1JerQSRC
         KH89b71gdC8EcpGw2scdHdGW+tPap0uAwmnq+3aLE3kGWG2fm1xZDaMDvjLA9woC5Ulu
         0/MPaQHFdc8LJgoZ7thFoEH3DKdiynUC63aS/FSnJG4o6I/92Na/lIc5Pd1rCjK+C5wU
         iyIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678049829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xOf0dR/RPpY4HJc+yEr00P2lL8nnE6ZdPZ2RnMEV2qQ=;
        b=lmU88tql53HzSHEcU72hpEM8tYgPqyKmfFg5Ze3Q/g0Xw9HnOy5vM6SVfw/iymdRJr
         i2a4ibRKxJFKR2VBusCxkEqZ6SwLQjBYu3np9xR3yyYWsmVlM5+6ykFR/vbTtlA9VSOH
         rBNGeQY6vo2NbktZNtu8POjTS8LWGq3FcAHatgY1zEPCm8gOcDNl+FyLs+MweXA60zur
         TxtCCCjBE0Lq8GPGIw82nAWrvm4pUwcDb1kUjFEmkEcesXZloR9mm8haUKxE8/Oh7Fnw
         Jed6oPwstRnRgquc/iQj9ah7H0gjIMFDtU3oq/t+XETs+RXHfEFtVWIn2x48Kj07UEcB
         P6Tg==
X-Gm-Message-State: AO0yUKX97DmEF6CUrmTZg1SyFSmIwmBbSyWxcqvNREWiR3iP4qqZm4mp
	ijwWOg4oOQpDpBT6+xL8BII=
X-Google-Smtp-Source: AK7set89glUReQEBerTf3N2tzQKZj5f2Ne8jws0vz8p+B9w+amQ0mlW3rs5ChgaK3OjP1RYo4BNMlQ==
X-Received: by 2002:a17:906:36d3:b0:8bf:e95c:467b with SMTP id b19-20020a17090636d300b008bfe95c467bmr7987952ejc.63.1678049829092;
        Sun, 05 Mar 2023 12:57:09 -0800 (PST)
Received: from localhost.localdomain ([46.248.82.114])
        by smtp.gmail.com with ESMTPSA id ay24-20020a170906d29800b0090953b9da51sm3615436ejb.194.2023.03.05.12.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Mar 2023 12:57:08 -0800 (PST)
From: Uros Bizjak <ubizjak@gmail.com>
To: linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arch@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Subject: [PATCH 10/10] perf/ring_buffer: use local_try_cmpxchg in __perf_output_begin
Date: Sun,  5 Mar 2023 21:56:28 +0100
Message-Id: <20230305205628.27385-11-ubizjak@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230305205628.27385-1-ubizjak@gmail.com>
References: <20230305205628.27385-1-ubizjak@gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, Peter Zijlstra <peterz@infradead.org>, Uros Bizjak <ubizjak@gmail.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use local_try_cmpxchg instead of local_cmpxchg (*ptr, old, new) == old in
__perf_output_begin.  x86 CMPXCHG instruction returns success in ZF flag,
so this change saves a compare after cmpxchg.

Also, local_try_cmpxchg implicitly assigns old *ptr value to "old" when
cmpxchg fails. There is no need to re-read the value in the loop.

No functional change intended.

Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Jiri Olsa <jolsa@kernel.org>
Cc: Namhyung Kim <namhyung@kernel.org>
Cc: Ian Rogers <irogers@google.com>
Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
---
 kernel/events/ring_buffer.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/kernel/events/ring_buffer.c b/kernel/events/ring_buffer.c
index 273a0fe7910a..e07c10f4d141 100644
--- a/kernel/events/ring_buffer.c
+++ b/kernel/events/ring_buffer.c
@@ -191,9 +191,10 @@ __perf_output_begin(struct perf_output_handle *handle,
 
 	perf_output_get_handle(handle);
 
+	offset = local_read(&rb->head);
 	do {
+		head = offset;
 		tail = READ_ONCE(rb->user_page->data_tail);
-		offset = head = local_read(&rb->head);
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

